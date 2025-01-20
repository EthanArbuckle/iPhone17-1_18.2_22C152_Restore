@interface BKSDisplayRenderOverlayDescriptor
+ (BKSDisplayRenderOverlayDescriptor)descriptorWithName:(id)a3 display:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_classesRequiredToDecode;
- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties;
- (BKSDisplayRenderOverlayDescriptor)initWithCoder:(id)a3;
- (BKSDisplayRenderOverlayDescriptor)initWithName:(id)a3 display:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInterstitial;
- (BOOL)lockBacklight;
- (CADisplay)display;
- (NSString)description;
- (NSString)displayUUID;
- (NSString)name;
- (id)_initWithName:(id)a3 displayUUID:(id)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceOrientation;
- (unint64_t)hash;
- (void)_appendDescriptionToFormatterCore:(id)a3;
- (void)_setInterstitial:(BOOL)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayUUID:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setLockBacklight:(BOOL)a3;
- (void)setProgressIndicatorProperties:(id)a3;
@end

@implementation BKSDisplayRenderOverlayDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorProperties, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_setInterstitial:(BOOL)a3
{
  self->_interstitial = a3;
}

- (void)setProgressIndicatorProperties:(id)a3
{
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return self->_progressIndicatorProperties;
}

- (void)setLockBacklight:(BOOL)a3
{
  self->_lockBacklight = a3;
}

- (BOOL)lockBacklight
{
  return self->_lockBacklight;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setDisplayUUID:(id)a3
{
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (NSString)name
{
  return self->_name;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSDisplayRenderOverlayDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(BKSDisplayRenderOverlayDescriptor *)self _appendDescriptionToFormatterCore:v3];
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKSDisplayRenderOverlayDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__BKSDisplayRenderOverlayDescriptor_appendDescriptionToFormatter___block_invoke;
    v9[3] = &unk_1E5441BB0;
    v9[4] = self;
    id v10 = v8;
    [v10 appendProem:self block:v9];
  }
}

uint64_t __66__BKSDisplayRenderOverlayDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendDescriptionToFormatterCore:*(void *)(a1 + 40)];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  id v4 = [(BKSDisplayRenderOverlayDescriptor *)self display];
  uint64_t v5 = [v4 name];
  unint64_t v6 = [v5 hash] + self->_interfaceOrientation + v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v25 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  name = self->_name;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke;
  v36[3] = &unk_1E54411E0;
  id v6 = v4;
  id v37 = v6;
  v24 = [v25 appendString:name counterpart:v36];
  v7 = [(BKSDisplayRenderOverlayDescriptor *)self display];
  id v8 = [v7 name];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_2;
  v34[3] = &unk_1E54411E0;
  id v9 = v6;
  id v35 = v9;
  id v10 = [v24 appendString:v8 counterpart:v34];
  int64_t interfaceOrientation = self->_interfaceOrientation;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_3;
  v32[3] = &unk_1E5441208;
  id v12 = v9;
  id v33 = v12;
  v13 = [v10 appendInteger:interfaceOrientation counterpart:v32];
  BOOL lockBacklight = self->_lockBacklight;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_4;
  v30[3] = &unk_1E5441230;
  id v15 = v12;
  id v31 = v15;
  v16 = [v13 appendBool:lockBacklight counterpart:v30];
  progressIndicatorProperties = self->_progressIndicatorProperties;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_5;
  v28[3] = &unk_1E5441258;
  id v18 = v15;
  id v29 = v18;
  v19 = [v16 appendObject:progressIndicatorProperties counterpart:v28];
  BOOL interstitial = self->_interstitial;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_6;
  v26[3] = &unk_1E5441230;
  id v27 = v18;
  id v21 = v18;
  v22 = [v19 appendBool:interstitial counterpart:v26];
  LOBYTE(v18) = [v22 isEqual];

  return (char)v18;
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) name];
}

id __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) display];
  v2 = [v1 name];

  return v2;
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) interfaceOrientation];
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) lockBacklight];
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) progressIndicatorProperties];
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) isInterstitial];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BKSDisplayRenderOverlayDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayUUID"];
  v7 = [(BKSDisplayRenderOverlayDescriptor *)self _initWithName:v5 displayUUID:v6];
  if (v7)
  {
    uint64_t v8 = [v4 decodeIntegerForKey:@"interfaceOrientation"];
    if (BSInterfaceOrientationIsValid()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    [(BKSDisplayRenderOverlayDescriptor *)v7 setInterfaceOrientation:v9];
    -[BKSDisplayRenderOverlayDescriptor setLockBacklight:](v7, "setLockBacklight:", [v4 decodeBoolForKey:@"lockBacklight"]);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progressIndicatorProperties"];
    [(BKSDisplayRenderOverlayDescriptor *)v7 setProgressIndicatorProperties:v10];

    -[BKSDisplayRenderOverlayDescriptor _setInterstitial:](v7, "_setInterstitial:", [v4 decodeBoolForKey:@"interstitial"]);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_displayUUID forKey:@"displayUUID"];
  [v5 encodeInteger:self->_interfaceOrientation forKey:@"interfaceOrientation"];
  [v5 encodeBool:self->_lockBacklight forKey:@"lockBacklight"];
  [v5 encodeObject:self->_progressIndicatorProperties forKey:@"progressIndicatorProperties"];
  [v5 encodeBool:self->_interstitial forKey:@"interstitial"];
}

- (void)_appendDescriptionToFormatterCore:(id)a3
{
  id v14 = a3;
  id v4 = (id)[v14 appendObject:self->_name withName:@"name"];
  id v5 = [(BKSDisplayRenderOverlayDescriptor *)self display];
  id v6 = [v5 name];

  if (v6) {
    id v7 = (id)[v14 appendObject:v6 withName:@"displayName"];
  }
  displayUUID = self->_displayUUID;
  if (displayUUID) {
    id v9 = (id)[v14 appendObject:displayUUID withName:@"displayUUID"];
  }
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation) {
    id v11 = (id)[v14 appendInteger:interfaceOrientation withName:@"interfaceOrientation"];
  }
  if (self->_lockBacklight) {
    [v14 appendString:@"lockBacklight" withName:0];
  }
  if (self->_interstitial) {
    [v14 appendString:@"interstitial" withName:0];
  }
  progressIndicatorProperties = self->_progressIndicatorProperties;
  if (progressIndicatorProperties) {
    id v13 = (id)[v14 appendObject:progressIndicatorProperties withName:@"progressIndicatorProperties"];
  }
}

- (BOOL)isInterstitial
{
  return self->_interstitial;
}

- (CADisplay)display
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_display = &self->_display;
  display = self->_display;
  if (display)
  {
LABEL_14:
    id v12 = display;
    goto LABEL_15;
  }
  if (self->_displayUUID)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(getCADisplayClass_7108(), "displays", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [v9 uniqueId];
          int v11 = BSEqualStrings();

          if (v11)
          {
            objc_storeStrong((id *)p_display, v9);
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    display = *p_display;
    goto LABEL_14;
  }
  id v12 = [getCADisplayClass_7108() mainDisplay];
LABEL_15:
  return v12;
}

- (BKSDisplayRenderOverlayDescriptor)initWithName:(id)a3 display:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BKSDisplayRenderOverlayDescriptor.m", 51, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"BKSDisplayRenderOverlayDescriptor.m", 52, @"Invalid parameter not satisfying: %@", @"display" object file lineNumber description];

LABEL_3:
  id v10 = [v9 uniqueId];
  int v11 = [(BKSDisplayRenderOverlayDescriptor *)self _initWithName:v7 displayUUID:v10];

  if (v11) {
    objc_storeStrong((id *)&v11->_display, a4);
  }

  return v11;
}

- (id)_initWithName:(id)a3 displayUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"BKSDisplayRenderOverlayDescriptor.m", 39, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)BKSDisplayRenderOverlayDescriptor;
  id v9 = [(BKSDisplayRenderOverlayDescriptor *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    displayUUID = v9->_displayUUID;
    v9->_displayUUID = (NSString *)v12;

    *(_WORD *)&v9->_BOOL lockBacklight = 1;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_classesRequiredToDecode
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (BKSDisplayRenderOverlayDescriptor)descriptorWithName:(id)a3 display:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v6 display:v5];

  return (BKSDisplayRenderOverlayDescriptor *)v7;
}

@end