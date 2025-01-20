@interface FBSSceneClientSettingsCore
+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4;
+ (id)protocol;
+ (void)configureSetting:(id)a3;
- (BSKeyedSettings)layers;
- (FBSSceneIdentityToken)preferredSceneHostIdentity;
- (NSString)preferredSceneHostIdentifier;
- (double)preferredLevel;
- (int64_t)preferredInterfaceOrientation;
- (void)setLayers:(id)a3;
- (void)setPreferredInterfaceOrientation:(int64_t)a3;
- (void)setPreferredLevel:(double)a3;
- (void)setPreferredSceneHostIdentifier:(id)a3;
- (void)setPreferredSceneHostIdentity:(id)a3;
@end

@implementation FBSSceneClientSettingsCore

uint64_t __36__FBSSceneClientSettingsCore_layers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 compare:];
}

uint64_t __36__FBSSceneClientSettingsCore_layers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

+ (id)protocol
{
  return &unk_1EED4CCC0;
}

- (double)preferredLevel
{
  v2 = [(FBSSceneClientSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  [v2 bs_CGFloatValue];
  double v4 = v3;

  return v4;
}

+ (void)configureSetting:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___FBSSceneClientSettingsCore;
  id v3 = a3;
  [super configureSetting:v3];
  [v3 setVolatile:[v3 matchesProperty:sel_layers receiver:v4.receiver super_class:v4.super_class]];
}

- (BSKeyedSettings)layers
{
  v2 = [(FBSSceneClientSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__FBSSceneClientSettingsCore_layers__block_invoke;
  v6[3] = &unk_1E58F7260;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeyedObjectsWithBlock:v6];
  [v4 sortUsingComparator:&__block_literal_global_25];

  return (BSKeyedSettings *)v4;
}

- (FBSSceneIdentityToken)preferredSceneHostIdentity
{
  uint64_t v4 = objc_opt_class();

  return (FBSSceneIdentityToken *)[(FBSSceneClientSettingsCore *)self valueForProperty:a2 expectedClass:v4];
}

- (NSString)preferredSceneHostIdentifier
{
  uint64_t v4 = objc_opt_class();

  return (NSString *)[(FBSSceneClientSettingsCore *)self valueForProperty:a2 expectedClass:v4];
}

- (int64_t)preferredInterfaceOrientation
{
  v2 = [(FBSSceneClientSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setPreferredSceneHostIdentity:(id)a3
{
}

- (void)setPreferredLevel:(double)a3
{
}

+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 matchesProperty:sel_preferredInterfaceOrientation])
  {
    [v7 integerValue];

    BSInterfaceOrientationDescription();
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___FBSSceneClientSettingsCore;
  v8 = [super descriptionOfValue:v7 forSetting:v6];

  return v8;
}

- (void)setLayers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(FBSSceneClientSettingsCore *)self setValue:0 forProperty:a2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[FBSSceneClientSettingsCore addLayer:](self, "addLayer:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setPreferredInterfaceOrientation:(int64_t)a3
{
  if (a3)
  {
    [NSNumber numberWithInteger:];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(FBSSceneClientSettingsCore *)self setValue:v5 forProperty:a2];
  }
  else
  {
    -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:");
  }
}

- (void)setPreferredSceneHostIdentifier:(id)a3
{
}

@end