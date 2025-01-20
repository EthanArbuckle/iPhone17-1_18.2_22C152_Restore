@interface HKEmergencyCardEditMedicalIDFooterTableItem
- (void)setProfileFirstName:(id)a3;
@end

@implementation HKEmergencyCardEditMedicalIDFooterTableItem

- (void)setProfileFirstName:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"MEDICAL_ID_EDIT_%@%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"MEDICAL_ID_EDIT_APPLE_WATCH_APP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v5, v9);

  uint64_t v11 = [v10 rangeOfString:v9];
  uint64_t v13 = v12;
  id v14 = objc_alloc(MEMORY[0x1E4F28E48]);
  v20[0] = *MEMORY[0x1E4FB0700];
  v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E4FB06F8];
  v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v21[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18 = (void *)[v14 initWithString:v10 attributes:v17];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"bridge:root=ActiveWatch"];
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v19, v11, v13);
  }
  [(HKEmergencyCardFooterTableItem *)self setAttributedTitleForFooter:v18];
  [(HKEmergencyCardFooterTableItem *)self setShouldInteractWithURLBlock:&__block_literal_global_7];
}

uint64_t __67__HKEmergencyCardEditMedicalIDFooterTableItem_setProfileFirstName___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F223E0];
  id v3 = a2;
  v4 = [v2 defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:MEMORY[0x1E4F1CC08]];

  return 0;
}

@end