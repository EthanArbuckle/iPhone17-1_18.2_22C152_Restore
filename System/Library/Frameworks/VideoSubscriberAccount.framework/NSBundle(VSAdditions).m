@interface NSBundle(VSAdditions)
+ (id)vs_bundleForProcessIdentifier:()VSAdditions;
+ (id)vs_frameworkBundle;
@end

@implementation NSBundle(VSAdditions)

+ (id)vs_frameworkBundle
{
  if (vs_frameworkBundle___vs_lazy_init_predicate != -1) {
    dispatch_once(&vs_frameworkBundle___vs_lazy_init_predicate, &__block_literal_global_47);
  }
  v0 = (void *)vs_frameworkBundle___vs_lazy_init_variable;

  return v0;
}

+ (id)vs_bundleForProcessIdentifier:()VSAdditions
{
  v3 = VSBundleURLForProcessIdentifier(a3);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end