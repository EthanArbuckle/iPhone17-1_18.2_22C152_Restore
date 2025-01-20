@interface HKEmergencyCardMedicationInfoTableItem
- (BOOL)hasPresentableData;
- (id)_multilineStringValue;
- (id)_placeholderText;
- (id)title;
- (void)_configureEditableCell:(id)a3;
- (void)_updateMultilineStringValueWithValue:(id)a3;
@end

@implementation HKEmergencyCardMedicationInfoTableItem

- (BOOL)hasPresentableData
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  v3 = [v2 medicationInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"medications" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_placeholderText
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"medications_none_listed" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_multilineStringValue
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  v3 = [v2 medicationInfo];

  return v3;
}

- (void)_updateMultilineStringValueWithValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HKEmergencyCardTableItem *)self data];
  [v5 setMedicationInfo:v4];
}

- (void)_configureEditableCell:(id)a3
{
  id v3 = [a3 textView];
  [v3 setAutocorrectionType:1];
}

@end