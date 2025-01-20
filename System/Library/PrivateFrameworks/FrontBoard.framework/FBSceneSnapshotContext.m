@interface FBSceneSnapshotContext
+ (id)contextWithFBSContext:(id)a3;
- (BOOL)isOpaque;
- (BSSettings)clientExtendedData;
- (CGRect)frame;
- (FBSSceneClientSettings)clientSettings;
- (FBSSceneSettings)settings;
- (FBSceneSnapshotContext)initWithFBSContext:(id)a3;
- (FBSceneSnapshotContext)initWithScene:(id)a3;
- (NSDate)expirationDate;
- (NSSet)layersToExclude;
- (NSString)description;
- (NSString)sceneID;
- (double)scale;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)orientation;
- (void)setClientExtendedData:(id)a3;
- (void)setClientSettings:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayersToExclude:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSettings:(id)a3;
@end

@implementation FBSceneSnapshotContext

+ (id)contextWithFBSContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFBSContext:v4];

  return v5;
}

- (FBSceneSnapshotContext)initWithScene:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v23.receiver = self;
    v23.super_class = (Class)FBSceneSnapshotContext;
    v7 = [(FBSceneSnapshotContext *)&v23 init];
    if (v7)
    {
      v8 = [v6 identifier];
      uint64_t v9 = [v8 copy];
      sceneID = v7->_sceneID;
      v7->_sceneID = (NSString *)v9;

      v11 = [v6 settings];
      uint64_t v12 = [v11 copy];
      settings = v7->_settings;
      v7->_settings = (FBSSceneSettings *)v12;

      v14 = [v6 clientSettings];
      uint64_t v15 = [v14 copy];
      clientSettings = v7->_clientSettings;
      v7->_clientSettings = (FBSSceneClientSettings *)v15;

      [(FBSSceneSettings *)v7->_settings frame];
      BSRectWithSize();
      v7->_frame.origin.x = v17;
      v7->_frame.origin.y = v18;
      v7->_frame.size.width = v19;
      v7->_frame.size.height = v20;
      v7->_opaque = 1;
      v7->_orientation = 0;
    }

    return v7;
  }
  else
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBSceneSnapshotContext *)a2 initWithScene:(uint64_t)v22];
    }
    }
    [v22 UTF8String];
    result = (FBSceneSnapshotContext *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSceneSnapshotContext)initWithFBSContext:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)FBSceneSnapshotContext;
  id v5 = [(FBSceneSnapshotContext *)&v53 init];
  if (v5)
  {
    v6 = [v4 sceneID];
    uint64_t v7 = [v6 copy];
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v7;

    uint64_t v9 = [v4 settings];
    uint64_t v10 = [v9 copy];
    settings = v5->_settings;
    v5->_settings = (FBSSceneSettings *)v10;

    v5->_orientation = 0;
    [(FBSSceneSettings *)v5->_settings frame];
    [v4 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    BSRectWithSize();
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    [v4 frame];
    v58.origin.x = v24;
    v58.origin.y = v25;
    v58.size.width = v26;
    v58.size.height = v27;
    v56.origin.x = v17;
    v56.origin.y = v19;
    v56.size.width = v21;
    v56.size.height = v23;
    CGRect v57 = CGRectIntersection(v56, v58);
    v5->_frame.origin.x = v13;
    v5->_frame.origin.y = v15;
    v5->_frame.size.width = v57.size.width;
    v5->_frame.size.height = v57.size.height;
    v28 = objc_msgSend(v4, "layersToExclude", v57.origin.x, v57.origin.y);

    if (v28)
    {
      v29 = [MEMORY[0x1E4F1CA80] set];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v30 = objc_msgSend(v4, "layersToExclude", 0);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v50;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v50 != v33) { {
              objc_enumerationMutation(v30);
            }
            }
            v35 = +[FBSceneLayer layerWithFBSSceneLayer:*(void *)(*((void *)&v49 + 1) + 8 * v34)];
            if (v35) { {
              [(NSSet *)v29 addObject:v35];
            }
            }

            ++v34;
          }
          while (v32 != v34);
          uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v32);
      }

      layersToExclude = v5->_layersToExclude;
      v5->_layersToExclude = v29;
    }
    [v4 expirationInterval];
    if (v37 > 0.0)
    {
      double v38 = v37;
      v39 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v39 timeIntervalSinceReferenceDate];
      double v41 = v40;

      if (v38 < v41)
      {
        uint64_t v42 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v38];
        expirationDate = v5->_expirationDate;
        v5->_expirationDate = (NSDate *)v42;
      }
    }
    v44 = [v4 clientExtendedData];
    v45 = v44;
    if (v44)
    {
      uint64_t v46 = [v44 copy];
      clientExtendedData = v5->_clientExtendedData;
      v5->_clientExtendedData = (BSSettings *)v46;
    }
  }

  return v5;
}

- (double)scale
{
  v2 = [(FBSSceneSettings *)self->_settings displayConfiguration];
  v3 = v2;
  if (v2)
  {
    [v2 pointScale];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(FBSceneSnapshotContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSceneSnapshotContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F62810] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSceneSnapshotContext *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(FBSceneSnapshotContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__FBSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5C497A0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __64__FBSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"frame", *(double *)(*(void *)(a1 + 40) + 72), *(double *)(*(void *)(a1 + 40) + 80), *(double *)(*(void *)(a1 + 40) + 88), *(double *)(*(void *)(a1 + 40) + 96));
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"opaque"];
  if (*(void *)(*(void *)(a1 + 40) + 48)) { {
    id v4 = @"Reference";
  }
  }
  else {
    id v4 = @"Natural";
  }
  id v5 = (id)[*(id *)(a1 + 32) appendObject:v4 withName:@"orientation"];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"settings"];
  id v7 = *(void **)(a1 + 32);
  v8 = [*(id *)(*(void *)(a1 + 40) + 40) allObjects];
  [v7 appendArraySection:v8 withName:@"layersToExclude" skipIfEmpty:1];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"expirationDate" skipIfNil:1];
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (FBSSceneClientSettings)clientSettings
{
  return self->_clientSettings;
}

- (void)setClientSettings:(id)a3
{
}

- (NSSet)layersToExclude
{
  return self->_layersToExclude;
}

- (void)setLayersToExclude:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BSSettings)clientExtendedData
{
  return self->_clientExtendedData;
}

- (void)setClientExtendedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);
}

- (void)initWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  CGFloat v15 = @"FBSceneSnapshotContext.m";
  __int16 v16 = 1024;
  int v17 = 27;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end