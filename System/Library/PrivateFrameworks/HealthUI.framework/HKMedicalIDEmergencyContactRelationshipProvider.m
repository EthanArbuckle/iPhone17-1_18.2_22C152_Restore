@interface HKMedicalIDEmergencyContactRelationshipProvider
- (HKMedicalIDEmergencyContactRelationshipProvider)init;
- (id)keyForRelationshipAtIndex:(int64_t)a3;
- (id)localizedRelationshipAtIndex:(int64_t)a3;
- (int64_t)numberOfRowsForRelationships;
@end

@implementation HKMedicalIDEmergencyContactRelationshipProvider

- (HKMedicalIDEmergencyContactRelationshipProvider)init
{
  v36[24] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)HKMedicalIDEmergencyContactRelationshipProvider;
  v2 = [(HKMedicalIDEmergencyContactRelationshipProvider *)&v35 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = *MEMORY[0x1E4F1B2B8];
    v36[0] = *MEMORY[0x1E4F1B408];
    v36[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1B0D8];
    v36[2] = *MEMORY[0x1E4F1B490];
    v36[3] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1B558];
    v36[4] = *MEMORY[0x1E4F1B508];
    v36[5] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1B128];
    v36[6] = *MEMORY[0x1E4F1B1F0];
    v36[7] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1B578];
    v36[8] = *MEMORY[0x1E4F1B2F8];
    v36[9] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1B058];
    v36[10] = *MEMORY[0x1E4F1B4E8];
    v36[11] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1B700];
    v36[12] = *MEMORY[0x1E4F1B400];
    v36[13] = v10;
    v34 = v2;
    v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v32 = [v33 localizedStringForKey:@"relationship_roommate" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v36[14] = v32;
    v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v30 = [v31 localizedStringForKey:@"relationship_doctor" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v36[15] = v30;
    v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v28 = [v29 localizedStringForKey:@"relationship_emergency" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v36[16] = v28;
    v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v26 = [v27 localizedStringForKey:@"relationship_family_member" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[17] = v26;
    v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v24 = [v25 localizedStringForKey:@"relationship_teacher" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[18] = v24;
    v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v22 = [v23 localizedStringForKey:@"relationship_caretaker" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[19] = v22;
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = [v11 localizedStringForKey:@"relationship_guardian" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[20] = v12;
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v13 localizedStringForKey:@"relationship_social_worker" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[21] = v14;
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v16 = [v15 localizedStringForKey:@"relationship_school" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[22] = v16;
    v3 = v34;
    v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v18 = [v17 localizedStringForKey:@"relationship_daycare" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v36[23] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:24];
    tokens = v34->_tokens;
    v34->_tokens = (NSArray *)v19;
  }
  return v3;
}

- (int64_t)numberOfRowsForRelationships
{
  return [(NSArray *)self->_tokens count];
}

- (id)keyForRelationshipAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_tokens objectAtIndexedSubscript:a3];
}

- (id)localizedRelationshipAtIndex:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F1BA20];
  uint64_t v4 = [(NSArray *)self->_tokens objectAtIndexedSubscript:a3];
  uint64_t v5 = [v3 localizedStringForLabel:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end