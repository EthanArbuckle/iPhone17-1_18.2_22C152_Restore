@interface AXUINSBundleOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)infoDictionary;
@end

@implementation AXUINSBundleOverride

+ (id)safeCategoryTargetClassName
{
  return @"NSBundle";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)infoDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)AXUINSBundleOverride;
  v3 = [(AXUINSBundleOverride *)&v8 infoDictionary];
  if (mainBundleFakesSystemExtension)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    int v5 = [(AXUINSBundleOverride *)self isEqual:v4];

    if (v5)
    {
      v6 = (void *)[v3 mutableCopy];
      [v6 setObject:&unk_26D3C9B28 forKey:@"NSExtension"];

      v3 = v6;
    }
  }

  return v3;
}

@end