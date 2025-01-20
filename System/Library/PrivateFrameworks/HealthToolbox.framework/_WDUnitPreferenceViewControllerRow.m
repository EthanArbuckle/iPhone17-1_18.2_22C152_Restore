@interface _WDUnitPreferenceViewControllerRow
- (HKUnit)unit;
- (NSString)localizedDisplayName;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation _WDUnitPreferenceViewControllerRow

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);

  objc_storeStrong((id *)&self->_unit, 0);
}

@end