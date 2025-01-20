@interface HKEmergencyCardMedicalNotesTableItem
- (BOOL)hasPresentableData;
- (id)_multilineStringValue;
- (id)_placeholderText;
- (id)title;
- (void)_updateMultilineStringValueWithValue:(id)a3;
@end

@implementation HKEmergencyCardMedicalNotesTableItem

- (BOOL)hasPresentableData
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  v3 = [v2 medicalNotes];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"medical_notes" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_placeholderText
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"medical_note_none_listed" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_multilineStringValue
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  v3 = [v2 medicalNotes];

  return v3;
}

- (void)_updateMultilineStringValueWithValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HKEmergencyCardTableItem *)self data];
  [v5 setMedicalNotes:v4];
}

@end