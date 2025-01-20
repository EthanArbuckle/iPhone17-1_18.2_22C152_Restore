@interface CUIKInterface
+ (id)shared;
- (BOOL)interfaceIsLeftToRight;
- (BOOL)isCurrentProcessAnApplicationExtension;
- (BOOL)usesLargeTextLayout;
- (CUIKInterface)init;
- (NSString)overridePreferredContentSizeCategory;
- (id)preferredContentSizeCategoryOrOverride;
- (int64_t)layoutDirectionOrOverride;
- (int64_t)overrideLayoutDirection;
- (void)setLayoutDirectionOverride:(int64_t)a3;
- (void)setOverrideLayoutDirection:(int64_t)a3;
- (void)setOverridePreferredContentSizeCategory:(id)a3;
- (void)setPreferredContentSizeCategoryOverride:(id)a3;
@end

@implementation CUIKInterface

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)shared_interface;

  return v2;
}

- (BOOL)interfaceIsLeftToRight
{
  return [(CUIKInterface *)self layoutDirectionOrOverride] == 0;
}

- (int64_t)layoutDirectionOrOverride
{
  if (![(CUIKInterface *)self isCurrentProcessAnApplicationExtension])
  {
    v3 = [MEMORY[0x1E4FB1438] performSelector:sel_sharedApplication];
    SEL v4 = NSSelectorFromString(&cfstr_Userinterfacel.isa);
    if (objc_opt_respondsToSelector())
    {
      int64_t v5 = ((uint64_t (*)(void *, SEL))[v3 methodForSelector:v4])(v3, v4);

      return v5;
    }
  }
  return self->_overrideLayoutDirection;
}

- (BOOL)isCurrentProcessAnApplicationExtension
{
  v2 = [MEMORY[0x1E4F28C70] extensionInfoForCurrentProcess];
  if (v2) {
    char v3 = objc_opt_respondsToSelector();
  }
  else {
    char v3 = 0;
  }

  return v3 & 1;
}

void __23__CUIKInterface_shared__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)shared_interface;
  shared_interface = v0;
}

- (CUIKInterface)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIKInterface;
  v2 = [(CUIKInterface *)&v5 init];
  char v3 = v2;
  if (v2)
  {
    v2->_overrideLayoutDirection = 0;
    objc_storeStrong((id *)&v2->_overridePreferredContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
  }
  return v3;
}

- (void)setLayoutDirectionOverride:(int64_t)a3
{
  self->_overrideLayoutDirection = a3;
}

- (id)preferredContentSizeCategoryOrOverride
{
  if (![(CUIKInterface *)self isCurrentProcessAnApplicationExtension])
  {
    char v3 = [MEMORY[0x1E4FB1438] performSelector:sel_sharedApplication];
    SEL v4 = NSSelectorFromString(&cfstr_Preferredconte.isa);
    if (objc_opt_respondsToSelector())
    {
      ((void (*)(void *, SEL))[v3 methodForSelector:v4])(v3, v4);
      objc_super v5 = (NSString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  objc_super v5 = self->_overridePreferredContentSizeCategory;
LABEL_6:

  return v5;
}

- (void)setPreferredContentSizeCategoryOverride:(id)a3
{
}

- (BOOL)usesLargeTextLayout
{
  v2 = [(CUIKInterface *)self preferredContentSizeCategoryOrOverride];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (int64_t)overrideLayoutDirection
{
  return self->_overrideLayoutDirection;
}

- (void)setOverrideLayoutDirection:(int64_t)a3
{
  self->_overrideLayoutDirection = a3;
}

- (NSString)overridePreferredContentSizeCategory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOverridePreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end