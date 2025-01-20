@interface UITraitCollection(ITKUtilities)
+ (id)appearanceClassForType:()ITKUtilities;
- (void)itk_performAsCurrent:()ITKUtilities;
@end

@implementation UITraitCollection(ITKUtilities)

+ (id)appearanceClassForType:()ITKUtilities
{
  if (a3 == 1) {
    goto LABEL_4;
  }
  if (!a3)
  {
    a3 = 2;
LABEL_4:
    v3 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:a3];
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  double v6 = v5;

  double v7 = 2.0;
  if (v6 >= 2.0) {
    double v7 = v6;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__UITraitCollection_ITKUtilities__appearanceClassForType___block_invoke;
  v10[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  *(double *)&v10[4] = v7;
  v8 = [v3 traitCollectionByModifyingTraits:v10];

  return v8;
}

- (void)itk_performAsCurrent:()ITKUtilities
{
  if (a3) {
    return objc_msgSend(a1, "performAsCurrentTraitCollection:");
  }
  return a1;
}

@end