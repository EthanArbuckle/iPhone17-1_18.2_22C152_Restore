@interface NSLayoutConstraint(MUConstraintLayout)
+ (void)_mapsui_activateLayouts:()MUConstraintLayout;
+ (void)_mapsui_activateLayouts:()MUConstraintLayout constraints:;
+ (void)_mapsui_deactivateLayouts:()MUConstraintLayout;
+ (void)_mapsui_deactivateLayouts:()MUConstraintLayout constraints:;
@end

@implementation NSLayoutConstraint(MUConstraintLayout)

+ (void)_mapsui_activateLayouts:()MUConstraintLayout
{
  MUMap(a3, &__block_literal_global_27);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_activateLayouts:", v4);
}

+ (void)_mapsui_activateLayouts:()MUConstraintLayout constraints:
{
  id v6 = a4;
  MUMap(a3, &__block_literal_global_41);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_activateLayouts:constraints:", v7, v6);
}

+ (void)_mapsui_deactivateLayouts:()MUConstraintLayout
{
  MUMap(a3, &__block_literal_global_43);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_deactivateLayouts:", v4);
}

+ (void)_mapsui_deactivateLayouts:()MUConstraintLayout constraints:
{
  id v6 = a4;
  MUMap(a3, &__block_literal_global_45_0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapsui_internal_activateLayouts:constraints:", v7, v6);
}

@end