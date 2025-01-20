@interface HKDisplayCategory
+ (HKDisplayCategory)categoryWithID:(int64_t)a3;
+ (HKDisplayCategory)categoryWithName:(id)a3;
+ (id)allCategories;
+ (id)sortedCategories;
+ (id)topLevelCategoryIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMeCategory;
- (BOOL)isTopLevelCategory;
- (HKDisplayCategory)init;
- (HKDisplayCategory)initWithCategoryID:(int64_t)a3 displayName:(id)a4 listIconName:(id)a5 largeListIconName:(id)a6 shareIconName:(id)a7 systemImageName:(id)a8;
- (HKFillStyle)fillStyle;
- (NSString)categoryName;
- (NSString)displayName;
- (NSString)embeddedDisplayName;
- (NSString)healthDataIconName;
- (NSString)largeListIconName;
- (NSString)listIconName;
- (NSString)shareIconName;
- (NSString)systemImageName;
- (UIColor)color;
- (UIImage)largeListIcon;
- (UIImage)listIcon;
- (UIImage)shareIcon;
- (UIImageSymbolConfiguration)multiColorImageConfiguration;
- (id)_image;
- (int64_t)categoryID;
- (unint64_t)hash;
- (void)largeListIcon;
@end

@implementation HKDisplayCategory

- (BOOL)isEqual:(id)a3
{
  int64_t categoryID = self->_categoryID;
  return categoryID == [a3 categoryID];
}

- (id)_image
{
  if (!self->_systemImageName
    || (objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:"),
        (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (self->_systemImageName)
    {
      v3 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:");
    }
    else
    {
      v3 = 0;
    }
  }
  v4 = [(HKDisplayCategory(BuiltinCategories) *)self multiColorImageConfiguration];
  if (v4)
  {
    v5 = [v3 imageByApplyingSymbolConfiguration:v4];
  }
  else
  {
    v6 = [(HKDisplayCategory(BuiltinCategories) *)self color];
    if (v6)
    {
      id v7 = [v3 imageWithTintColor:v6 renderingMode:1];
    }
    else
    {
      id v7 = v3;
    }
    v5 = v7;
  }
  return v5;
}

- (int64_t)categoryID
{
  return self->_categoryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_multiColorImageConfiguration, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_shareIconName, 0);
  objc_storeStrong((id *)&self->_healthDataIconName, 0);
  objc_storeStrong((id *)&self->_listIconName, 0);
  objc_storeStrong((id *)&self->_largeListIconName, 0);
  objc_storeStrong((id *)&self->_embeddedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

- (HKDisplayCategory)initWithCategoryID:(int64_t)a3 displayName:(id)a4 listIconName:(id)a5 largeListIconName:(id)a6 shareIconName:(id)a7 systemImageName:(id)a8
{
  id v78 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v79.receiver = self;
  v79.super_class = (Class)HKDisplayCategory;
  v18 = [(HKDisplayCategory *)&v79 init];
  v19 = v18;
  if (v18)
  {
    v18->_int64_t categoryID = a3;
    uint64_t v20 = [v78 copy];
    categoryName = v19->_categoryName;
    v19->_categoryName = (NSString *)v20;

    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v23 = [v22 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v23;

    v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v26 = [(NSString *)v19->_categoryName stringByAppendingString:@"_EMBEDDED"];
    uint64_t v27 = [v25 localizedStringForKey:v26 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    embeddedDisplayName = v19->_embeddedDisplayName;
    v19->_embeddedDisplayName = (NSString *)v27;

    uint64_t v29 = [v15 copy];
    largeListIconName = v19->_largeListIconName;
    v19->_largeListIconName = (NSString *)v29;

    uint64_t v31 = [v14 copy];
    listIconName = v19->_listIconName;
    v19->_listIconName = (NSString *)v31;

    uint64_t v33 = [v16 copy];
    shareIconName = v19->_shareIconName;
    v19->_shareIconName = (NSString *)v33;

    uint64_t v35 = [v17 copy];
    systemImageName = v19->_systemImageName;
    v19->_systemImageName = (NSString *)v35;

    if ([(NSString *)v19->_displayName isEqualToString:v19->_categoryName])
    {
      v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v38 = [v37 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];
      v39 = v19->_displayName;
      v19->_displayName = (NSString *)v38;

      v40 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v41 = [(NSString *)v19->_categoryName stringByAppendingString:@"_EMBEDDED"];
      uint64_t v42 = [v40 localizedStringForKey:v41 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];
      v43 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v42;
    }
    if ([(NSString *)v19->_displayName isEqualToString:v19->_categoryName])
    {
      v44 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v45 = [v44 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];
      v46 = v19->_displayName;
      v19->_displayName = (NSString *)v45;

      v47 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v48 = [(NSString *)v19->_categoryName stringByAppendingString:@"_EMBEDDED"];
      uint64_t v49 = [v47 localizedStringForKey:v48 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];
      v50 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v49;
    }
    if ([(NSString *)v19->_displayName isEqualToString:v19->_categoryName])
    {
      v51 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v52 = [v51 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Meds"];
      v53 = v19->_displayName;
      v19->_displayName = (NSString *)v52;

      v54 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v55 = [(NSString *)v19->_categoryName stringByAppendingString:@"_EMBEDDED"];
      uint64_t v56 = [v54 localizedStringForKey:v55 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Meds"];
      v57 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v56;
    }
    if ([(NSString *)v19->_displayName isEqualToString:v19->_categoryName])
    {
      v58 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v59 = [v58 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Notes"];
      v60 = v19->_displayName;
      v19->_displayName = (NSString *)v59;

      v61 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v62 = [(NSString *)v19->_categoryName stringByAppendingString:@"_EMBEDDED"];
      uint64_t v63 = [v61 localizedStringForKey:v62 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Notes"];
      v64 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v63;
    }
    v65 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v66 = [v65 features];
    if (([v66 chamomile] & 1) == 0)
    {

      goto LABEL_14;
    }
    v67 = v19->_categoryName;
    v68 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v69 = [v68 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    LOBYTE(v67) = [(NSString *)v67 isEqualToString:v69];

    if ((v67 & 1) == 0)
    {
      v70 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v71 = [v70 localizedStringForKey:v19->_categoryName value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
      v72 = v19->_displayName;
      v19->_displayName = (NSString *)v71;

      v73 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v74 = [(NSString *)v19->_categoryName stringByAppendingString:@"_EMBEDDED"];
      uint64_t v75 = [v73 localizedStringForKey:v74 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
      v76 = v19->_embeddedDisplayName;
      v19->_embeddedDisplayName = (NSString *)v75;

      v65 = v19->_systemImageName;
      v19->_systemImageName = (NSString *)@"brain.head.profile";
LABEL_14:
    }
  }

  return v19;
}

- (unint64_t)hash
{
  return self->_categoryID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UIImage)listIcon
{
  v4 = [(HKDisplayCategory *)self _image];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      [(HKDisplayCategory *)(uint64_t)self largeListIcon];
    }
    listIconName = self->_listIconName;
    if (listIconName)
    {
      v9 = (void *)MEMORY[0x1E4FB1818];
      v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = [v9 imageNamed:listIconName inBundle:v10];
    }
    else
    {
      id v6 = 0;
    }
  }

  return (UIImage *)v6;
}

+ (HKDisplayCategory)categoryWithName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VITAL_SIGNS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"VITAL_SIGNS";
    id v6 = @"healthdata_glyph_vitals";
    id v7 = @"healthdata_glyph_vitals_large";
    v8 = @"sharedata_glyph_vitals";
    v9 = @"waveform.path.ecg.rectangle";
    uint64_t v10 = 1;
LABEL_18:
    v11 = [(HKDisplayCategory *)v4 initWithCategoryID:v10 displayName:v5 listIconName:v6 largeListIconName:v7 shareIconName:v8 systemImageName:v9];
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"FITNESS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"FITNESS";
    id v6 = @"healthdata_glyph_fitness";
    id v7 = @"healthdata_glyph_activity_large";
    v8 = @"sharedata_glyph_fitness";
    v9 = @"flame.fill";
    uint64_t v10 = 2;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"NUTRITION"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"NUTRITION";
    id v6 = @"healthdata_glyph_nutrition";
    id v7 = @"healthdata_glyph_nutrition_large";
    v8 = @"sharedata_glyph_nutrition";
    v9 = @"apple.slice";
    uint64_t v10 = 4;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"SLEEP"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"SLEEP";
    id v6 = @"healthdata_glyph_sleep";
    id v7 = @"healthdata_glyph_sleep_large";
    v8 = @"sharedata_glyph_sleep";
    v9 = @"bed.double.fill";
    uint64_t v10 = 5;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"BODY_MEASUREMENTS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"BODY_MEASUREMENTS";
    id v6 = @"healthdata_glyph_bodymeasurements";
    id v7 = @"healthdata_glyph_bodymeasurements_large";
    v8 = @"sharedata_glyph_bodymeasurements";
    v9 = @"figure";
    uint64_t v10 = 6;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"ME"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"ME";
    id v6 = @"healthdata_glyph_me";
    v8 = @"sharedata_glyph_me";
    v9 = @"person.circle";
    uint64_t v10 = 7;
LABEL_17:
    id v7 = 0;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"REPRODUCTIVE_HEALTH"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"REPRODUCTIVE_HEALTH";
    id v6 = @"healthdata_glyph_reproductive";
    id v7 = @"healthdata_glyph_reproductive_large";
    v8 = @"sharedata_glyph_reproductive";
    v9 = @"apple.cycletracking";
    uint64_t v10 = 8;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"CLINICAL_DOCUMENTS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"CLINICAL_DOCUMENTS";
    id v6 = @"healthdata_glyph_documents";
    v8 = @"sharedata_glyph_documents";
    v9 = @"doc.text";
    uint64_t v10 = 9;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"MINDFULNESS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"MINDFULNESS";
    id v6 = @"healthdata_glyph_mindfulness";
    id v7 = @"healthdata_glyph_mindfulness_large";
    v8 = @"sharedata_glyph_mindfulness";
    v9 = @"apple.mindfulness";
    uint64_t v10 = 10;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"HEART"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"HEART";
    id v6 = @"healthdata_glyph_heart";
    id v7 = @"healthdata_glyph_heart_large";
    v8 = @"sharedata_glyph_heart";
    v9 = @"heart.fill";
    uint64_t v10 = 11;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"HEARING_HEALTH"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"HEARING_HEALTH";
    id v6 = @"healthdata_glyph_hearing";
    id v7 = @"healthdata_glyph_hearing_large";
    v8 = @"sharedata_glyph_hearing";
    v9 = @"ear";
    uint64_t v10 = 12;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"RESPIRATORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"RESPIRATORY";
    id v6 = @"healthdata_glyph_respiratory";
    id v7 = @"healthdata_glyph_respiratory_large";
    v8 = @"sharedata_glyph_respiratory";
    v9 = @"lungs.fill";
    uint64_t v10 = 13;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"OTHER"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"OTHER";
    id v6 = @"healthdata_glyph_other";
    id v7 = @"healthdata_glyph_other_large";
    v8 = @"sharedata_glyph_other";
    v9 = @"capsule.cross.fill";
    uint64_t v10 = 14;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"HEALTH_RECORDS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"HEALTH_RECORDS";
    id v6 = @"healthdata_glyph_results";
    id v7 = @"healthdata_glyph_results_large";
    v8 = @"sharedata_glyph_results";
    v9 = @"testtube.2";
    uint64_t v10 = 15;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"ALLERGY_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"ALLERGY_CATEGORY";
    id v6 = @"health_records_allergies";
    v9 = @"allergens";
    uint64_t v10 = 16;
LABEL_48:
    id v7 = 0;
    v8 = v6;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"CLINICAL_VITALS_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"CLINICAL_VITALS_CATEGORY";
    id v6 = @"health_records_vitals";
    v9 = @"waveform.path.ecg.rectangle";
    uint64_t v10 = 17;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"CONDITION_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"CONDITION_CATEGORY";
    id v6 = @"health_records_conditions";
    v9 = @"stethoscope";
    uint64_t v10 = 18;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"IMMUNIZATION_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"IMMUNIZATION_CATEGORY";
    id v6 = @"health_records_immunizations";
    v9 = @"cross.vial";
    uint64_t v10 = 19;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"LAB_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"LAB_CATEGORY";
    id v6 = @"health_records_lab_results";
    v9 = @"testtube.2";
    uint64_t v10 = 20;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"MEDICATIONS_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"MEDICATIONS_CATEGORY";
    id v6 = @"health_records_medications";
    v9 = @"pills.fill";
    uint64_t v10 = 21;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"PROCEDURE_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"PROCEDURE_CATEGORY";
    id v6 = @"health_records_procedures";
    v9 = @"ivfluid.bag";
    uint64_t v10 = 22;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"MOBILITY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"MOBILITY";
    id v6 = @"healthdata_glyph_mobility";
    id v7 = @"healthdata_glyph_mobility_large";
    v8 = @"sharedata_glyph_mobility";
    v9 = @"apple.mobility";
    uint64_t v10 = 23;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"SYMPTOMS"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"SYMPTOMS";
    id v6 = @"healthdata_glyph_symptoms";
    id v7 = @"healthdata_glyph_symptoms_large";
    v8 = @"sharedata_glyph_symptoms";
    v9 = @"figure.arms.open.and.exclamationmark.magnifyingglass";
    uint64_t v10 = 26;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"INSURANCE_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"INSURANCE_CATEGORY";
    id v6 = @"health_records_insurance";
    v9 = @"person.text.rectangle.fill";
    uint64_t v10 = 27;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"CLINICAL_NOTES_CATEGORY"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"CLINICAL_NOTES_CATEGORY";
    id v6 = @"health_records_clinical_notes";
    v9 = @"pencil.and.list.clipboard";
    uint64_t v10 = 30;
    goto LABEL_48;
  }
  if ([v3 isEqualToString:@"MEDICATION_TRACKING"])
  {
    v4 = [HKDisplayCategory alloc];
    v5 = @"MEDICATION_TRACKING";
    id v6 = @"healthdata_glyph_medicationTracking";
    id v7 = @"healthdata_glyph_medicationTracking_large";
    v8 = @"sharedata_glyph_medicationTracking";
    v9 = @"pills.fill";
    uint64_t v10 = 31;
    goto LABEL_18;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

+ (HKDisplayCategory)categoryWithID:(int64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = [HKDisplayCategory alloc];
      v5 = @"VITAL_SIGNS";
      id v6 = @"healthdata_glyph_vitals";
      id v7 = @"healthdata_glyph_vitals_large";
      v8 = @"sharedata_glyph_vitals";
      v9 = @"waveform.path.ecg.rectangle";
      uint64_t v10 = 1;
      goto LABEL_29;
    case 2:
      v4 = [HKDisplayCategory alloc];
      v5 = @"FITNESS";
      id v6 = @"healthdata_glyph_fitness";
      id v7 = @"healthdata_glyph_activity_large";
      v8 = @"sharedata_glyph_fitness";
      v9 = @"flame.fill";
      uint64_t v10 = 2;
      goto LABEL_29;
    case 4:
      v4 = [HKDisplayCategory alloc];
      v5 = @"NUTRITION";
      id v6 = @"healthdata_glyph_nutrition";
      id v7 = @"healthdata_glyph_nutrition_large";
      v8 = @"sharedata_glyph_nutrition";
      v9 = @"apple.slice";
      uint64_t v10 = 4;
      goto LABEL_29;
    case 5:
      v4 = [HKDisplayCategory alloc];
      v5 = @"SLEEP";
      id v6 = @"healthdata_glyph_sleep";
      id v7 = @"healthdata_glyph_sleep_large";
      v8 = @"sharedata_glyph_sleep";
      v9 = @"bed.double.fill";
      uint64_t v10 = 5;
      goto LABEL_29;
    case 6:
      v4 = [HKDisplayCategory alloc];
      v5 = @"BODY_MEASUREMENTS";
      id v6 = @"healthdata_glyph_bodymeasurements";
      id v7 = @"healthdata_glyph_bodymeasurements_large";
      v8 = @"sharedata_glyph_bodymeasurements";
      v9 = @"figure";
      uint64_t v10 = 6;
      goto LABEL_29;
    case 7:
      v4 = [HKDisplayCategory alloc];
      v5 = @"ME";
      id v6 = @"healthdata_glyph_me";
      v8 = @"sharedata_glyph_me";
      v9 = @"person.circle";
      uint64_t v10 = 7;
      goto LABEL_10;
    case 8:
      v4 = [HKDisplayCategory alloc];
      v5 = @"REPRODUCTIVE_HEALTH";
      id v6 = @"healthdata_glyph_reproductive";
      id v7 = @"healthdata_glyph_reproductive_large";
      v8 = @"sharedata_glyph_reproductive";
      v9 = @"apple.cycletracking";
      uint64_t v10 = 8;
      goto LABEL_29;
    case 9:
      v4 = [HKDisplayCategory alloc];
      v5 = @"CLINICAL_DOCUMENTS";
      id v6 = @"healthdata_glyph_documents";
      v8 = @"sharedata_glyph_documents";
      v9 = @"doc.text";
      uint64_t v10 = 9;
LABEL_10:
      id v7 = 0;
      goto LABEL_29;
    case 10:
      v4 = [HKDisplayCategory alloc];
      v5 = @"MINDFULNESS";
      id v6 = @"healthdata_glyph_mindfulness";
      id v7 = @"healthdata_glyph_mindfulness_large";
      v8 = @"sharedata_glyph_mindfulness";
      v9 = @"apple.mindfulness";
      uint64_t v10 = 10;
      goto LABEL_29;
    case 11:
      v4 = [HKDisplayCategory alloc];
      v5 = @"HEART";
      id v6 = @"healthdata_glyph_heart";
      id v7 = @"healthdata_glyph_heart_large";
      v8 = @"sharedata_glyph_heart";
      v9 = @"heart.fill";
      uint64_t v10 = 11;
      goto LABEL_29;
    case 12:
      v4 = [HKDisplayCategory alloc];
      v5 = @"HEARING_HEALTH";
      id v6 = @"healthdata_glyph_hearing";
      id v7 = @"healthdata_glyph_hearing_large";
      v8 = @"sharedata_glyph_hearing";
      v9 = @"ear";
      uint64_t v10 = 12;
      goto LABEL_29;
    case 13:
      v4 = [HKDisplayCategory alloc];
      v5 = @"RESPIRATORY";
      id v6 = @"healthdata_glyph_respiratory";
      id v7 = @"healthdata_glyph_respiratory_large";
      v8 = @"sharedata_glyph_respiratory";
      v9 = @"lungs.fill";
      uint64_t v10 = 13;
      goto LABEL_29;
    case 14:
      v4 = [HKDisplayCategory alloc];
      v5 = @"OTHER";
      id v6 = @"healthdata_glyph_other";
      id v7 = @"healthdata_glyph_other_large";
      v8 = @"sharedata_glyph_other";
      v9 = @"capsule.cross.fill";
      uint64_t v10 = 14;
      goto LABEL_29;
    case 15:
      v4 = [HKDisplayCategory alloc];
      v5 = @"HEALTH_RECORDS";
      id v6 = @"healthdata_glyph_results";
      id v7 = @"healthdata_glyph_results_large";
      v8 = @"sharedata_glyph_results";
      v9 = @"testtube.2";
      uint64_t v10 = 15;
      goto LABEL_29;
    case 16:
      v4 = [HKDisplayCategory alloc];
      v5 = @"ALLERGY_CATEGORY";
      id v6 = @"health_records_allergies";
      v9 = @"allergens";
      uint64_t v10 = 16;
      goto LABEL_28;
    case 17:
      v4 = [HKDisplayCategory alloc];
      v5 = @"CLINICAL_VITALS_CATEGORY";
      id v6 = @"health_records_vitals";
      v9 = @"waveform.path.ecg.rectangle";
      uint64_t v10 = 17;
      goto LABEL_28;
    case 18:
      v4 = [HKDisplayCategory alloc];
      v5 = @"CONDITION_CATEGORY";
      id v6 = @"health_records_conditions";
      v9 = @"stethoscope";
      uint64_t v10 = 18;
      goto LABEL_28;
    case 19:
      v4 = [HKDisplayCategory alloc];
      v5 = @"IMMUNIZATION_CATEGORY";
      id v6 = @"health_records_immunizations";
      v9 = @"cross.vial";
      uint64_t v10 = 19;
      goto LABEL_28;
    case 20:
      v4 = [HKDisplayCategory alloc];
      v5 = @"LAB_CATEGORY";
      id v6 = @"health_records_lab_results";
      v9 = @"testtube.2";
      uint64_t v10 = 20;
      goto LABEL_28;
    case 21:
      v4 = [HKDisplayCategory alloc];
      v5 = @"MEDICATIONS_CATEGORY";
      id v6 = @"health_records_medications";
      v9 = @"pills.fill";
      uint64_t v10 = 21;
      goto LABEL_28;
    case 22:
      v4 = [HKDisplayCategory alloc];
      v5 = @"PROCEDURE_CATEGORY";
      id v6 = @"health_records_procedures";
      v9 = @"ivfluid.bag";
      uint64_t v10 = 22;
      goto LABEL_28;
    case 23:
      v4 = [HKDisplayCategory alloc];
      v5 = @"MOBILITY";
      id v6 = @"healthdata_glyph_mobility";
      id v7 = @"healthdata_glyph_mobility_large";
      v8 = @"sharedata_glyph_mobility";
      v9 = @"apple.mobility";
      uint64_t v10 = 23;
      goto LABEL_29;
    case 26:
      v4 = [HKDisplayCategory alloc];
      v5 = @"SYMPTOMS";
      id v6 = @"healthdata_glyph_symptoms";
      id v7 = @"healthdata_glyph_symptoms_large";
      v8 = @"sharedata_glyph_symptoms";
      v9 = @"figure.arms.open.and.exclamationmark.magnifyingglass";
      uint64_t v10 = 26;
      goto LABEL_29;
    case 27:
      v4 = [HKDisplayCategory alloc];
      v5 = @"INSURANCE_CATEGORY";
      id v6 = @"health_records_insurance";
      v9 = @"person.text.rectangle.fill";
      uint64_t v10 = 27;
      goto LABEL_28;
    case 30:
      v4 = [HKDisplayCategory alloc];
      v5 = @"CLINICAL_NOTES_CATEGORY";
      id v6 = @"health_records_clinical_notes";
      v9 = @"pencil.and.list.clipboard";
      uint64_t v10 = 30;
LABEL_28:
      id v7 = 0;
      v8 = v6;
      goto LABEL_29;
    case 31:
      v4 = [HKDisplayCategory alloc];
      v5 = @"MEDICATION_TRACKING";
      id v6 = @"healthdata_glyph_medicationTracking";
      id v7 = @"healthdata_glyph_medicationTracking_large";
      v8 = @"sharedata_glyph_medicationTracking";
      v9 = @"pills.fill";
      uint64_t v10 = 31;
LABEL_29:
      id v3 = [(HKDisplayCategory *)v4 initWithCategoryID:v10 displayName:v5 listIconName:v6 largeListIconName:v7 shareIconName:v8 systemImageName:v9];
      break;
    default:
      break;
  }
  return v3;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

+ (id)allCategories
{
  v30[26] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = [[HKDisplayCategory alloc] initWithCategoryID:1 displayName:@"VITAL_SIGNS" listIconName:@"healthdata_glyph_vitals" largeListIconName:@"healthdata_glyph_vitals_large" shareIconName:@"sharedata_glyph_vitals" systemImageName:@"waveform.path.ecg.rectangle"];
  v30[0] = v29;
  v28 = [[HKDisplayCategory alloc] initWithCategoryID:2 displayName:@"FITNESS" listIconName:@"healthdata_glyph_fitness" largeListIconName:@"healthdata_glyph_activity_large" shareIconName:@"sharedata_glyph_fitness" systemImageName:@"flame.fill"];
  v30[1] = v28;
  uint64_t v27 = [[HKDisplayCategory alloc] initWithCategoryID:4 displayName:@"NUTRITION" listIconName:@"healthdata_glyph_nutrition" largeListIconName:@"healthdata_glyph_nutrition_large" shareIconName:@"sharedata_glyph_nutrition" systemImageName:@"apple.slice"];
  v30[2] = v27;
  v26 = [[HKDisplayCategory alloc] initWithCategoryID:5 displayName:@"SLEEP" listIconName:@"healthdata_glyph_sleep" largeListIconName:@"healthdata_glyph_sleep_large" shareIconName:@"sharedata_glyph_sleep" systemImageName:@"bed.double.fill"];
  v30[3] = v26;
  v25 = [[HKDisplayCategory alloc] initWithCategoryID:6 displayName:@"BODY_MEASUREMENTS" listIconName:@"healthdata_glyph_bodymeasurements" largeListIconName:@"healthdata_glyph_bodymeasurements_large" shareIconName:@"sharedata_glyph_bodymeasurements" systemImageName:@"figure"];
  v30[4] = v25;
  v24 = [[HKDisplayCategory alloc] initWithCategoryID:7 displayName:@"ME" listIconName:@"healthdata_glyph_me" largeListIconName:0 shareIconName:@"sharedata_glyph_me" systemImageName:@"person.circle"];
  v30[5] = v24;
  uint64_t v23 = [[HKDisplayCategory alloc] initWithCategoryID:8 displayName:@"REPRODUCTIVE_HEALTH" listIconName:@"healthdata_glyph_reproductive" largeListIconName:@"healthdata_glyph_reproductive_large" shareIconName:@"sharedata_glyph_reproductive" systemImageName:@"apple.cycletracking"];
  v30[6] = v23;
  v22 = [[HKDisplayCategory alloc] initWithCategoryID:9 displayName:@"CLINICAL_DOCUMENTS" listIconName:@"healthdata_glyph_documents" largeListIconName:0 shareIconName:@"sharedata_glyph_documents" systemImageName:@"doc.text"];
  v30[7] = v22;
  v21 = [[HKDisplayCategory alloc] initWithCategoryID:10 displayName:@"MINDFULNESS" listIconName:@"healthdata_glyph_mindfulness" largeListIconName:@"healthdata_glyph_mindfulness_large" shareIconName:@"sharedata_glyph_mindfulness" systemImageName:@"apple.mindfulness"];
  v30[8] = v21;
  uint64_t v20 = [[HKDisplayCategory alloc] initWithCategoryID:11 displayName:@"HEART" listIconName:@"healthdata_glyph_heart" largeListIconName:@"healthdata_glyph_heart_large" shareIconName:@"sharedata_glyph_heart" systemImageName:@"heart.fill"];
  v30[9] = v20;
  v19 = [[HKDisplayCategory alloc] initWithCategoryID:12 displayName:@"HEARING_HEALTH" listIconName:@"healthdata_glyph_hearing" largeListIconName:@"healthdata_glyph_hearing_large" shareIconName:@"sharedata_glyph_hearing" systemImageName:@"ear"];
  v30[10] = v19;
  v18 = [[HKDisplayCategory alloc] initWithCategoryID:13 displayName:@"RESPIRATORY" listIconName:@"healthdata_glyph_respiratory" largeListIconName:@"healthdata_glyph_respiratory_large" shareIconName:@"sharedata_glyph_respiratory" systemImageName:@"lungs.fill"];
  v30[11] = v18;
  id v17 = [[HKDisplayCategory alloc] initWithCategoryID:14 displayName:@"OTHER" listIconName:@"healthdata_glyph_other" largeListIconName:@"healthdata_glyph_other_large" shareIconName:@"sharedata_glyph_other" systemImageName:@"capsule.cross.fill"];
  v30[12] = v17;
  id v16 = [[HKDisplayCategory alloc] initWithCategoryID:15 displayName:@"HEALTH_RECORDS" listIconName:@"healthdata_glyph_results" largeListIconName:@"healthdata_glyph_results_large" shareIconName:@"sharedata_glyph_results" systemImageName:@"testtube.2"];
  v30[13] = v16;
  id v15 = [[HKDisplayCategory alloc] initWithCategoryID:16 displayName:@"ALLERGY_CATEGORY" listIconName:@"health_records_allergies" largeListIconName:0 shareIconName:@"health_records_allergies" systemImageName:@"allergens"];
  v30[14] = v15;
  id v14 = [[HKDisplayCategory alloc] initWithCategoryID:17 displayName:@"CLINICAL_VITALS_CATEGORY" listIconName:@"health_records_vitals" largeListIconName:0 shareIconName:@"health_records_vitals" systemImageName:@"waveform.path.ecg.rectangle"];
  v30[15] = v14;
  v13 = [[HKDisplayCategory alloc] initWithCategoryID:18 displayName:@"CONDITION_CATEGORY" listIconName:@"health_records_conditions" largeListIconName:0 shareIconName:@"health_records_conditions" systemImageName:@"stethoscope"];
  v30[16] = v13;
  v2 = [[HKDisplayCategory alloc] initWithCategoryID:19 displayName:@"IMMUNIZATION_CATEGORY" listIconName:@"health_records_immunizations" largeListIconName:0 shareIconName:@"health_records_immunizations" systemImageName:@"cross.vial"];
  v30[17] = v2;
  id v3 = [[HKDisplayCategory alloc] initWithCategoryID:20 displayName:@"LAB_CATEGORY" listIconName:@"health_records_lab_results" largeListIconName:0 shareIconName:@"health_records_lab_results" systemImageName:@"testtube.2"];
  v30[18] = v3;
  v4 = [[HKDisplayCategory alloc] initWithCategoryID:21 displayName:@"MEDICATIONS_CATEGORY" listIconName:@"health_records_medications" largeListIconName:0 shareIconName:@"health_records_medications" systemImageName:@"pills.fill"];
  v30[19] = v4;
  v5 = [[HKDisplayCategory alloc] initWithCategoryID:22 displayName:@"PROCEDURE_CATEGORY" listIconName:@"health_records_procedures" largeListIconName:0 shareIconName:@"health_records_procedures" systemImageName:@"ivfluid.bag"];
  v30[20] = v5;
  id v6 = [[HKDisplayCategory alloc] initWithCategoryID:23 displayName:@"MOBILITY" listIconName:@"healthdata_glyph_mobility" largeListIconName:@"healthdata_glyph_mobility_large" shareIconName:@"sharedata_glyph_mobility" systemImageName:@"apple.mobility"];
  v30[21] = v6;
  id v7 = [[HKDisplayCategory alloc] initWithCategoryID:26 displayName:@"SYMPTOMS" listIconName:@"healthdata_glyph_symptoms" largeListIconName:@"healthdata_glyph_symptoms_large" shareIconName:@"sharedata_glyph_symptoms" systemImageName:@"figure.arms.open.and.exclamationmark.magnifyingglass"];
  v30[22] = v7;
  v8 = [[HKDisplayCategory alloc] initWithCategoryID:27 displayName:@"INSURANCE_CATEGORY" listIconName:@"health_records_insurance" largeListIconName:0 shareIconName:@"health_records_insurance" systemImageName:@"person.text.rectangle.fill"];
  v30[23] = v8;
  v9 = [[HKDisplayCategory alloc] initWithCategoryID:30 displayName:@"CLINICAL_NOTES_CATEGORY" listIconName:@"health_records_clinical_notes" largeListIconName:0 shareIconName:@"health_records_clinical_notes" systemImageName:@"pencil.and.list.clipboard"];
  v30[24] = v9;
  uint64_t v10 = [[HKDisplayCategory alloc] initWithCategoryID:31 displayName:@"MEDICATION_TRACKING" listIconName:@"healthdata_glyph_medicationTracking" largeListIconName:@"healthdata_glyph_medicationTracking_large" shareIconName:@"sharedata_glyph_medicationTracking" systemImageName:@"pills.fill"];
  v30[25] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:26];

  return v11;
}

+ (id)sortedCategories
{
  v2 = +[HKDisplayCategory allCategories];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_30];

  return v3;
}

uint64_t __56__HKDisplayCategory_BuiltinCategories__sortedCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 displayName];
  id v6 = [v4 displayName];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

+ (id)topLevelCategoryIdentifiers
{
  return &unk_1F3C1F348;
}

- (HKDisplayCategory)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFillStyle)fillStyle
{
  id v3 = objc_alloc_init(HKSolidFillStyle);
  uint64_t v4 = [(HKDisplayCategory(BuiltinCategories) *)self color];
  [(HKSolidFillStyle *)v3 setColor:v4];

  return (HKFillStyle *)v3;
}

- (UIImage)largeListIcon
{
  uint64_t v4 = [(HKDisplayCategory *)self _image];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      [(HKDisplayCategory *)(uint64_t)self largeListIcon];
    }
    largeListIconName = self->_largeListIconName;
    if (largeListIconName)
    {
      v9 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = [v9 imageNamed:largeListIconName inBundle:v10];
    }
    else
    {
      id v6 = 0;
    }
  }

  return (UIImage *)v6;
}

- (UIImage)shareIcon
{
  uint64_t v4 = [(HKDisplayCategory *)self _image];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      [(HKDisplayCategory *)(uint64_t)self largeListIcon];
    }
    shareIconName = self->_shareIconName;
    if (shareIconName)
    {
      v9 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v6 = [v9 imageNamed:shareIconName inBundle:v10];
    }
    else
    {
      id v6 = 0;
    }
  }

  return (UIImage *)v6;
}

- (BOOL)isMeCategory
{
  return self->_categoryID == 7;
}

- (BOOL)isTopLevelCategory
{
  id v3 = [(id)objc_opt_class() topLevelCategoryIdentifiers];
  uint64_t v4 = [NSNumber numberWithInteger:self->_categoryID];
  BOOL v5 = [v3 indexOfObject:v4] != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (NSString)embeddedDisplayName
{
  return self->_embeddedDisplayName;
}

- (NSString)largeListIconName
{
  return self->_largeListIconName;
}

- (NSString)listIconName
{
  return self->_listIconName;
}

- (NSString)healthDataIconName
{
  return self->_healthDataIconName;
}

- (NSString)shareIconName
{
  return self->_shareIconName;
}

- (UIImageSymbolConfiguration)multiColorImageConfiguration
{
  return self->_multiColorImageConfiguration;
}

- (UIColor)color
{
  return self->_color;
}

- (void)largeListIcon
{
  id v4 = a2;
  BOOL v5 = NSStringFromSelector(a3);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v6, v7, "using fallback icon for %@ in %@", v8, v9, v10, v11, v12);
}

@end