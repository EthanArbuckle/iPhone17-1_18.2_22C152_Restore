@interface PSSpecifier(AXUISettingsEditableTableCellWithStepperDelegate)
+ (id)ax_stepperSpecifierWithDelegate:()AXUISettingsEditableTableCellWithStepperDelegate;
- (uint64_t)ax_setStepperDelegate:()AXUISettingsEditableTableCellWithStepperDelegate;
- (uint64_t)ax_stepperDelegate;
@end

@implementation PSSpecifier(AXUISettingsEditableTableCellWithStepperDelegate)

- (uint64_t)ax_stepperDelegate
{
  return MEMORY[0x1F41063B0](a1, &__PSSpecifier__ax_stepperDelegate);
}

- (uint64_t)ax_setStepperDelegate:()AXUISettingsEditableTableCellWithStepperDelegate
{
  return MEMORY[0x1F41063F0](a1, &__PSSpecifier__ax_stepperDelegate);
}

+ (id)ax_stepperSpecifierWithDelegate:()AXUISettingsEditableTableCellWithStepperDelegate
{
  v3 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:a3 set:0 get:sel_stringValueForSpecifier_ detail:0 cell:4 edit:0];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  return v3;
}

@end