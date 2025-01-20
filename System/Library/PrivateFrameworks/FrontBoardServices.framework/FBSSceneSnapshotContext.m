@interface FBSSceneSnapshotContext
+ (FBSSceneSnapshotContext)contextWithSceneID:(id)a3 settings:(id)a4;
- (BSSettings)clientExtendedData;
- (CGRect)frame;
- (FBSSceneSettings)settings;
- (FBSSceneSnapshotContext)initWithSceneID:(id)a3 settings:(id)a4;
- (FBSSceneSnapshotContext)initWithXPCDictionary:(id)a3;
- (NSSet)layersToExclude;
- (NSString)description;
- (NSString)name;
- (NSString)sceneID;
- (double)expirationInterval;
- (double)scale;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setClientExtendedData:(id)a3;
- (void)setExpirationInterval:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayersToExclude:(id)a3;
- (void)setName:(id)a3;
- (void)setScale:(double)a3;
- (void)setSettings:(id)a3;
@end

@implementation FBSSceneSnapshotContext

+ (FBSSceneSnapshotContext)contextWithSceneID:(id)a3 settings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithSceneID:v7 settings:v6];

  return (FBSSceneSnapshotContext *)v8;
}

- (FBSSceneSnapshotContext)initWithSceneID:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FBSSceneSnapshotContext;
  v8 = [(FBSSceneSnapshotContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sceneID = v8->_sceneID;
    v8->_sceneID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    settings = v8->_settings;
    v8->_settings = (FBSSceneSettings *)v11;

    [v7 frame];
    BSRectWithSize();
  }

  return 0;
}

- (NSString)description
{
  return (NSString *)[(FBSSceneSnapshotContext *)self descriptionWithMultilinePrefix:0];
}

- (void)setExpirationInterval:(double)a3
{
}

- (id)succinctDescription
{
  v2 = [(FBSSceneSnapshotContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSSceneSnapshotContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(FBSSceneSnapshotContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__FBSSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __65__FBSSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"sceneID"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"name"];
  id v4 = [*(id *)(a1 + 32) appendRect:@"frame" withName:*(double *)(*(void *)(a1 + 40) + 64), *(double *)(*(void *)(a1 + 40) + 72), *(double *)(*(void *)(a1 + 40) + 80), *(double *)(*(void *)(a1 + 40) + 88)];
  id v5 = (id)[*(id *)(a1 + 32) appendFloat:@"scale" withName:0 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 32)];
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(double *)(v6 + 48) > 0.0)
  {
    id v7 = [*(id *)(a1 + 32) appendFloat:@"expirationInterval" :1];
    uint64_t v6 = *(void *)(a1 + 40);
  }
  id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v6 + 16) withName:@"requestedSettings"];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 40) allObjects];
  [v9 appendArraySection:v10 withName:@"layersToExclude" skipIfEmpty:1];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"clientExtendedData"];
}

- (FBSSceneSnapshotContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if ([(FBSSceneSnapshotContext *)self init]) {
    BSCreateDeserializedStringFromXPCDictionaryWithKey();
  }

  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
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

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSSet)layersToExclude
{
  return self->_layersToExclude;
}

- (void)setLayersToExclude:(id)a3
{
}

- (double)expirationInterval
{
  return self->_expirationInterval;
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
  objc_storeStrong((id *)&self->_clientExtendedData, 0);
  objc_storeStrong((id *)&self->_layersToExclude, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_sceneID, 0);
}

@end