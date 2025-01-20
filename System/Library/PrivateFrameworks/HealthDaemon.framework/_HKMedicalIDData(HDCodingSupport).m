@interface _HKMedicalIDData(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableMedicalIDData)codableRepresentationForSync;
@end

@implementation _HKMedicalIDData(HDCodingSupport)

- (HDCodableMedicalIDData)codableRepresentationForSync
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableMedicalIDData);
  -[HDCodableMedicalIDData setIsDisabled:](v2, "setIsDisabled:", [a1 isDisabled]);
  v3 = [a1 isDisabledModifiedDate];

  if (v3)
  {
    v4 = [a1 isDisabledModifiedDate];
    [v4 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setIsDisabledModifiedDate:](v2, "setIsDisabledModifiedDate:");
  }
  -[HDCodableMedicalIDData setShareDuringEmergency:](v2, "setShareDuringEmergency:", [a1 shareDuringEmergency]);
  v5 = [a1 shareDuringEmergencyModifiedDate];

  if (v5)
  {
    v6 = [a1 shareDuringEmergencyModifiedDate];
    [v6 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setShareDuringEmergencyModifiedDate:](v2, "setShareDuringEmergencyModifiedDate:");
  }
  v7 = [a1 pictureData];
  [(HDCodableMedicalIDData *)v2 setPictureData:v7];

  v8 = [a1 pictureDataModifiedDate];

  if (v8)
  {
    v9 = [a1 pictureDataModifiedDate];
    [v9 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setPictureDataModifiedDate:](v2, "setPictureDataModifiedDate:");
  }
  v10 = [a1 name];
  [(HDCodableMedicalIDData *)v2 setName:v10];

  v11 = [a1 nameModifiedDate];

  if (v11)
  {
    v12 = [a1 nameModifiedDate];
    [v12 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setNameModifiedDate:](v2, "setNameModifiedDate:");
  }
  v13 = [a1 gregorianBirthday];
  v14 = objc_msgSend(v13, "hk_codableDateComponentsForCalendarUnits:", *MEMORY[0x1E4F2B9E8]);
  [(HDCodableMedicalIDData *)v2 setGregorianBirthday:v14];

  v15 = [a1 gregorianBirthdayModifiedDate];

  if (v15)
  {
    v16 = [a1 gregorianBirthdayModifiedDate];
    [v16 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setGregorianBirthdayModifiedDate:](v2, "setGregorianBirthdayModifiedDate:");
  }
  v17 = [a1 primaryLanguageCode];
  [(HDCodableMedicalIDData *)v2 setPrimaryLanguageCode:v17];

  v18 = [a1 primaryLanguageCodeModifiedDate];

  if (v18)
  {
    v19 = [a1 primaryLanguageCodeModifiedDate];
    [v19 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setPrimaryLanguageCodeModifiedDate:](v2, "setPrimaryLanguageCodeModifiedDate:");
  }
  v20 = [a1 height];
  v21 = [v20 codableRepresentationForSync];
  [(HDCodableMedicalIDData *)v2 setHeight:v21];

  v22 = [a1 heightModifiedDate];

  if (v22)
  {
    v23 = [a1 heightModifiedDate];
    [v23 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setHeightModifiedDate:](v2, "setHeightModifiedDate:");
  }
  v24 = [a1 weight];
  v25 = [v24 codableRepresentationForSync];
  [(HDCodableMedicalIDData *)v2 setWeight:v25];

  v26 = [a1 weightModifiedDate];

  if (v26)
  {
    v27 = [a1 weightModifiedDate];
    [v27 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setWeightModifiedDate:](v2, "setWeightModifiedDate:");
  }
  -[HDCodableMedicalIDData setBloodType:](v2, "setBloodType:", [a1 bloodType]);
  v28 = [a1 bloodTypeModifiedDate];

  if (v28)
  {
    v29 = [a1 bloodTypeModifiedDate];
    [v29 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setBloodTypeModifiedDate:](v2, "setBloodTypeModifiedDate:");
  }
  v30 = [a1 isOrganDonor];

  if (v30)
  {
    v31 = [a1 isOrganDonor];
    -[HDCodableMedicalIDData setIsOrganDonor:](v2, "setIsOrganDonor:", [v31 longLongValue]);
  }
  v32 = [a1 isOrganDonorModifiedDate];

  if (v32)
  {
    v33 = [a1 isOrganDonorModifiedDate];
    [v33 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setIsOrganDonorModifiedDate:](v2, "setIsOrganDonorModifiedDate:");
  }
  v34 = [a1 emergencyContacts];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v37 = [a1 emergencyContacts];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v141 objects:v149 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v142;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v142 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v141 + 1) + 8 * v41) codableRepresentationForSync];
          [v36 addObject:v42];

          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v141 objects:v149 count:16];
      }
      while (v39);
    }

    [(HDCodableMedicalIDData *)v2 setEmergencyContacts:v36];
  }
  v43 = [a1 emergencyContactsModifiedDate];

  if (v43)
  {
    v44 = [a1 emergencyContactsModifiedDate];
    [v44 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setEmergencyContactsModifiedDate:](v2, "setEmergencyContactsModifiedDate:");
  }
  v45 = [a1 clinicalContacts];
  uint64_t v46 = [v45 count];

  if (v46)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    v48 = [a1 clinicalContacts];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v137 objects:v148 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v138;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v138 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [*(id *)(*((void *)&v137 + 1) + 8 * v52) codableRepresentationForSync];
          [v47 addObject:v53];

          ++v52;
        }
        while (v50 != v52);
        uint64_t v50 = [v48 countByEnumeratingWithState:&v137 objects:v148 count:16];
      }
      while (v50);
    }

    [(HDCodableMedicalIDData *)v2 setClinicalContacts:v47];
  }
  v54 = [a1 clinicalContactsModifiedDate];

  if (v54)
  {
    v55 = [a1 clinicalContactsModifiedDate];
    [v55 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setClinicalContactsModifiedDate:](v2, "setClinicalContactsModifiedDate:");
  }
  v56 = [a1 medicalConditions];
  [(HDCodableMedicalIDData *)v2 setMedicalConditions:v56];

  v57 = [a1 medicalConditionsModifiedDate];

  if (v57)
  {
    v58 = [a1 medicalConditionsModifiedDate];
    [v58 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setMedicalConditionsModifiedDate:](v2, "setMedicalConditionsModifiedDate:");
  }
  v59 = [a1 medicalNotes];
  [(HDCodableMedicalIDData *)v2 setMedicalNotes:v59];

  v60 = [a1 medicalNotesModifiedDate];

  if (v60)
  {
    v61 = [a1 medicalNotesModifiedDate];
    [v61 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setMedicalNotesModifiedDate:](v2, "setMedicalNotesModifiedDate:");
  }
  v62 = [a1 allergyInfo];
  [(HDCodableMedicalIDData *)v2 setAllergyInfo:v62];

  v63 = [a1 allergyInfoModifiedDate];

  if (v63)
  {
    v64 = [a1 allergyInfoModifiedDate];
    [v64 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setAllergyInfoModifiedDate:](v2, "setAllergyInfoModifiedDate:");
  }
  v65 = [a1 medicationInfo];
  [(HDCodableMedicalIDData *)v2 setMedicationInfo:v65];

  v66 = [a1 medicationInfoModifiedDate];

  if (v66)
  {
    v67 = [a1 medicationInfoModifiedDate];
    [v67 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setMedicationInfoModifiedDate:](v2, "setMedicationInfoModifiedDate:");
  }
  v68 = [a1 pregnancyStartDate];

  if (v68)
  {
    v69 = [a1 pregnancyStartDate];
    [v69 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setPregnancyStartDate:](v2, "setPregnancyStartDate:");
  }
  v70 = [a1 pregnancyStartDateModifiedDate];

  if (v70)
  {
    v71 = [a1 pregnancyStartDateModifiedDate];
    [v71 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setPregnancyStartDateModifiedDate:](v2, "setPregnancyStartDateModifiedDate:");
  }
  v72 = [a1 pregnancyEstimatedDueDate];

  if (v72)
  {
    v73 = [a1 pregnancyEstimatedDueDate];
    [v73 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setPregnancyEstimatedDueDate:](v2, "setPregnancyEstimatedDueDate:");
  }
  v74 = [a1 pregnancyEstimatedDueDateModifiedDate];

  if (v74)
  {
    v75 = [a1 pregnancyEstimatedDueDateModifiedDate];
    [v75 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setPregnancyEstimatedDueDateModifiedDate:](v2, "setPregnancyEstimatedDueDateModifiedDate:");
  }
  v76 = [a1 medicationsList];
  uint64_t v77 = [v76 count];

  if (v77)
  {
    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    v79 = [a1 medicationsList];
    uint64_t v80 = [v79 countByEnumeratingWithState:&v133 objects:v147 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v134;
      do
      {
        uint64_t v83 = 0;
        do
        {
          if (*(void *)v134 != v82) {
            objc_enumerationMutation(v79);
          }
          v84 = [*(id *)(*((void *)&v133 + 1) + 8 * v83) codableRepresentationForSync];
          [v78 addObject:v84];

          ++v83;
        }
        while (v81 != v83);
        uint64_t v81 = [v79 countByEnumeratingWithState:&v133 objects:v147 count:16];
      }
      while (v81);
    }

    [(HDCodableMedicalIDData *)v2 setMedicationsLists:v78];
  }
  v85 = [a1 medicationsListModifiedDate];

  if (v85)
  {
    v86 = [a1 medicationsListModifiedDate];
    [v86 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setMedicationsListModifiedDate:](v2, "setMedicationsListModifiedDate:");
  }
  v87 = [a1 medicationsListVersion];

  if (v87)
  {
    v88 = [a1 medicationsListVersion];
    -[HDCodableMedicalIDData setMedicationsListVersion:](v2, "setMedicationsListVersion:", [v88 longLongValue]);
  }
  v89 = [a1 medicationsListVersionModifiedDate];

  if (v89)
  {
    v90 = [a1 medicationsListVersionModifiedDate];
    [v90 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setMedicationsListVersionModifiedDate:](v2, "setMedicationsListVersionModifiedDate:");
  }
  v91 = [a1 allergiesList];
  uint64_t v92 = [v91 count];

  if (v92)
  {
    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    v94 = [a1 allergiesList];
    uint64_t v95 = [v94 countByEnumeratingWithState:&v129 objects:v146 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v130;
      do
      {
        uint64_t v98 = 0;
        do
        {
          if (*(void *)v130 != v97) {
            objc_enumerationMutation(v94);
          }
          v99 = [*(id *)(*((void *)&v129 + 1) + 8 * v98) codableRepresentationForSync];
          [v93 addObject:v99];

          ++v98;
        }
        while (v96 != v98);
        uint64_t v96 = [v94 countByEnumeratingWithState:&v129 objects:v146 count:16];
      }
      while (v96);
    }

    [(HDCodableMedicalIDData *)v2 setAllergiesLists:v93];
  }
  v100 = [a1 allergiesListModifiedDate];

  if (v100)
  {
    v101 = [a1 allergiesListModifiedDate];
    [v101 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setAllergiesListModifiedDate:](v2, "setAllergiesListModifiedDate:");
  }
  v102 = [a1 allergiesListVersion];

  if (v102)
  {
    v103 = [a1 allergiesListVersion];
    -[HDCodableMedicalIDData setAllergiesListVersion:](v2, "setAllergiesListVersion:", [v103 longLongValue]);
  }
  v104 = [a1 allergiesListVersionModifiedDate];

  if (v104)
  {
    v105 = [a1 allergiesListVersionModifiedDate];
    [v105 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setAllergiesListVersionModifiedDate:](v2, "setAllergiesListVersionModifiedDate:");
  }
  v106 = [a1 conditionsList];
  uint64_t v107 = [v106 count];

  if (v107)
  {
    id v108 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v109 = objc_msgSend(a1, "conditionsList", 0);
    uint64_t v110 = [v109 countByEnumeratingWithState:&v125 objects:v145 count:16];
    if (v110)
    {
      uint64_t v111 = v110;
      uint64_t v112 = *(void *)v126;
      do
      {
        uint64_t v113 = 0;
        do
        {
          if (*(void *)v126 != v112) {
            objc_enumerationMutation(v109);
          }
          v114 = [*(id *)(*((void *)&v125 + 1) + 8 * v113) codableRepresentationForSync];
          [v108 addObject:v114];

          ++v113;
        }
        while (v111 != v113);
        uint64_t v111 = [v109 countByEnumeratingWithState:&v125 objects:v145 count:16];
      }
      while (v111);
    }

    [(HDCodableMedicalIDData *)v2 setConditionsLists:v108];
  }
  v115 = [a1 conditionsListModifiedDate];

  if (v115)
  {
    v116 = [a1 conditionsListModifiedDate];
    [v116 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setConditionsListModifiedDate:](v2, "setConditionsListModifiedDate:");
  }
  v117 = [a1 conditionsListVersion];

  if (v117)
  {
    v118 = [a1 conditionsListVersion];
    -[HDCodableMedicalIDData setConditionsListVersion:](v2, "setConditionsListVersion:", [v118 longLongValue]);
  }
  v119 = [a1 conditionsListVersionModifiedDate];

  if (v119)
  {
    v120 = [a1 conditionsListVersionModifiedDate];
    [v120 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setConditionsListVersionModifiedDate:](v2, "setConditionsListVersionModifiedDate:");
  }
  v121 = [a1 dateSaved];

  if (v121)
  {
    v122 = [a1 dateSaved];
    [v122 timeIntervalSinceReferenceDate];
    -[HDCodableMedicalIDData setDateSaved:](v2, "setDateSaved:");
  }
  v123 = v2;

  return v123;
}

+ (id)createWithCodable:()HDCodingSupport
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F2B920]);
    objc_msgSend(v5, "setIsDisabled:", objc_msgSend(v4, "isDisabled"));
    if ([v4 hasIsDisabledModifiedDate])
    {
      [v4 isDisabledModifiedDate];
      v6 = HDDecodeDateForValue();
      [v5 setIsDisabledModifiedDate:v6];
    }
    else
    {
      [v5 setIsDisabledModifiedDate:0];
    }
    objc_msgSend(v5, "setShareDuringEmergency:", objc_msgSend(v4, "shareDuringEmergency"));
    if ([v4 hasShareDuringEmergencyModifiedDate])
    {
      [v4 shareDuringEmergencyModifiedDate];
      v8 = HDDecodeDateForValue();
      [v5 setShareDuringEmergencyModifiedDate:v8];
    }
    else
    {
      [v5 setShareDuringEmergencyModifiedDate:0];
    }
    v9 = [v4 pictureData];
    [v5 setPictureData:v9];

    if ([v4 hasPictureDataModifiedDate])
    {
      [v4 pictureDataModifiedDate];
      v10 = HDDecodeDateForValue();
      [v5 setPictureDataModifiedDate:v10];
    }
    else
    {
      [v5 setPictureDataModifiedDate:0];
    }
    v11 = [v4 name];
    [v5 setName:v11];

    if ([v4 hasNameModifiedDate])
    {
      [v4 nameModifiedDate];
      v12 = HDDecodeDateForValue();
      [v5 setNameModifiedDate:v12];
    }
    else
    {
      [v5 setNameModifiedDate:0];
    }
    v13 = (void *)MEMORY[0x1E4F1C9D8];
    v14 = [v4 gregorianBirthday];
    v15 = objc_msgSend(v13, "hk_dateComponentsWithCodableDateComponents:calendarUnits:", v14, *MEMORY[0x1E4F2B9E8]);
    [v5 setGregorianBirthday:v15];

    if ([v4 hasGregorianBirthdayModifiedDate])
    {
      [v4 gregorianBirthdayModifiedDate];
      v16 = HDDecodeDateForValue();
      [v5 setGregorianBirthdayModifiedDate:v16];
    }
    else
    {
      [v5 setGregorianBirthdayModifiedDate:0];
    }
    v17 = [v4 primaryLanguageCode];
    [v5 setPrimaryLanguageCode:v17];

    if ([v4 hasPrimaryLanguageCodeModifiedDate])
    {
      [v4 primaryLanguageCodeModifiedDate];
      v18 = HDDecodeDateForValue();
      [v5 setPrimaryLanguageCodeModifiedDate:v18];
    }
    else
    {
      [v5 setPrimaryLanguageCodeModifiedDate:0];
    }
    v19 = (void *)MEMORY[0x1E4F2B370];
    v20 = [v4 height];
    v21 = [v19 createWithCodable:v20];
    [v5 setHeight:v21];

    if ([v4 hasHeightModifiedDate])
    {
      [v4 heightModifiedDate];
      v22 = HDDecodeDateForValue();
      [v5 setHeightModifiedDate:v22];
    }
    else
    {
      [v5 setHeightModifiedDate:0];
    }
    v23 = (void *)MEMORY[0x1E4F2B370];
    v24 = [v4 weight];
    v25 = [v23 createWithCodable:v24];
    [v5 setWeight:v25];

    if ([v4 hasWeightModifiedDate])
    {
      [v4 weightModifiedDate];
      v26 = HDDecodeDateForValue();
      [v5 setWeightModifiedDate:v26];
    }
    else
    {
      [v5 setWeightModifiedDate:0];
    }
    if ([v4 hasBloodType]) {
      uint64_t v27 = (int)[v4 bloodType];
    }
    else {
      uint64_t v27 = 0;
    }
    [v5 setBloodType:v27];
    if ([v4 hasBloodTypeModifiedDate])
    {
      [v4 bloodTypeModifiedDate];
      v28 = HDDecodeDateForValue();
      [v5 setBloodTypeModifiedDate:v28];
    }
    else
    {
      [v5 setBloodTypeModifiedDate:0];
    }
    if ([v4 hasIsOrganDonor])
    {
      v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "isOrganDonor"));
      [v5 setIsOrganDonor:v29];
    }
    else
    {
      [v5 setIsOrganDonor:0];
    }
    if ([v4 hasIsOrganDonorModifiedDate])
    {
      [v4 isOrganDonorModifiedDate];
      v30 = HDDecodeDateForValue();
      [v5 setIsOrganDonorModifiedDate:v30];
    }
    else
    {
      [v5 setIsOrganDonorModifiedDate:0];
    }
    v31 = [v4 emergencyContacts];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      v34 = [v4 emergencyContacts];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v117 objects:v125 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v118;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v118 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = [MEMORY[0x1E4F2B8D0] createWithCodable:*(void *)(*((void *)&v117 + 1) + 8 * i)];
            [v33 addObject:v39];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v117 objects:v125 count:16];
        }
        while (v36);
      }

      [v5 setEmergencyContacts:v33];
    }
    if ([v4 hasEmergencyContactsModifiedDate])
    {
      [v4 emergencyContactsModifiedDate];
      uint64_t v40 = HDDecodeDateForValue();
      [v5 setEmergencyContactsModifiedDate:v40];
    }
    else
    {
      [v5 setEmergencyContactsModifiedDate:0];
    }
    uint64_t v41 = [v4 clinicalContacts];
    uint64_t v42 = [v41 count];

    if (v42)
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      v44 = [v4 clinicalContacts];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v113 objects:v124 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v114;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v114 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = [MEMORY[0x1E4F2B870] createWithCodable:*(void *)(*((void *)&v113 + 1) + 8 * j)];
            [v43 addObject:v49];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v113 objects:v124 count:16];
        }
        while (v46);
      }

      [v5 setClinicalContacts:v43];
    }
    if ([v4 hasClinicalContactsModifiedDate])
    {
      [v4 clinicalContactsModifiedDate];
      uint64_t v50 = HDDecodeDateForValue();
      [v5 setClinicalContactsModifiedDate:v50];
    }
    else
    {
      [v5 setClinicalContactsModifiedDate:0];
    }
    uint64_t v51 = [v4 medicalConditions];
    [v5 setMedicalConditions:v51];

    if ([v4 hasMedicalConditionsModifiedDate])
    {
      [v4 medicalConditionsModifiedDate];
      uint64_t v52 = HDDecodeDateForValue();
      [v5 setMedicalConditionsModifiedDate:v52];
    }
    else
    {
      [v5 setMedicalConditionsModifiedDate:0];
    }
    v53 = [v4 medicalNotes];
    [v5 setMedicalNotes:v53];

    if ([v4 hasMedicalNotesModifiedDate])
    {
      [v4 medicalNotesModifiedDate];
      v54 = HDDecodeDateForValue();
      [v5 setMedicalNotesModifiedDate:v54];
    }
    else
    {
      [v5 setMedicalNotesModifiedDate:0];
    }
    v55 = [v4 allergyInfo];
    [v5 setAllergyInfo:v55];

    if ([v4 hasAllergyInfoModifiedDate])
    {
      [v4 allergyInfoModifiedDate];
      v56 = HDDecodeDateForValue();
      [v5 setAllergyInfoModifiedDate:v56];
    }
    else
    {
      [v5 setAllergyInfoModifiedDate:0];
    }
    v57 = [v4 medicationInfo];
    [v5 setMedicationInfo:v57];

    if ([v4 hasMedicationInfoModifiedDate])
    {
      [v4 medicationInfoModifiedDate];
      v58 = HDDecodeDateForValue();
      [v5 setMedicationInfoModifiedDate:v58];
    }
    else
    {
      [v5 setMedicationInfoModifiedDate:0];
    }
    if ([v4 hasPregnancyStartDate])
    {
      [v4 pregnancyStartDate];
      v59 = HDDecodeDateForValue();
      [v5 setPregnancyStartDate:v59];
    }
    else
    {
      [v5 setPregnancyStartDate:0];
    }
    if ([v4 hasPregnancyStartDateModifiedDate])
    {
      [v4 pregnancyStartDateModifiedDate];
      v60 = HDDecodeDateForValue();
      [v5 setPregnancyStartDateModifiedDate:v60];
    }
    else
    {
      [v5 setPregnancyStartDateModifiedDate:0];
    }
    if ([v4 hasPregnancyEstimatedDueDate])
    {
      [v4 pregnancyEstimatedDueDate];
      v61 = HDDecodeDateForValue();
      [v5 setPregnancyEstimatedDueDate:v61];
    }
    else
    {
      [v5 setPregnancyEstimatedDueDate:0];
    }
    if ([v4 hasPregnancyEstimatedDueDateModifiedDate])
    {
      [v4 pregnancyEstimatedDueDateModifiedDate];
      v62 = HDDecodeDateForValue();
      [v5 setPregnancyEstimatedDueDateModifiedDate:v62];
    }
    else
    {
      [v5 setPregnancyEstimatedDueDateModifiedDate:0];
    }
    v63 = [v4 medicationsLists];
    uint64_t v64 = [v63 count];

    if (v64)
    {
      id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      v66 = [v4 medicationsLists];
      uint64_t v67 = [v66 countByEnumeratingWithState:&v109 objects:v123 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v110;
        do
        {
          for (uint64_t k = 0; k != v68; ++k)
          {
            if (*(void *)v110 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = [MEMORY[0x1E4F2B928] createWithCodable:*(void *)(*((void *)&v109 + 1) + 8 * k)];
            [v65 addObject:v71];
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v109 objects:v123 count:16];
        }
        while (v68);
      }

      [v5 setMedicationsList:v65];
    }
    if ([v4 hasMedicationsListModifiedDate])
    {
      [v4 medicationsListModifiedDate];
      v72 = HDDecodeDateForValue();
      [v5 setMedicationsListModifiedDate:v72];
    }
    else
    {
      [v5 setMedicationsListModifiedDate:0];
    }
    if ([v4 hasMedicationsListVersion])
    {
      v73 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "medicationsListVersion"));
      [v5 setMedicationsListVersion:v73];
    }
    else
    {
      [v5 setMedicationsListVersion:0];
    }
    if ([v4 hasMedicationsListVersionModifiedDate])
    {
      [v4 medicationsListVersionModifiedDate];
      v74 = HDDecodeDateForValue();
      [v5 setMedicationsListVersionModifiedDate:v74];
    }
    else
    {
      [v5 setMedicationsListVersionModifiedDate:0];
    }
    v75 = [v4 allergiesLists];
    uint64_t v76 = [v75 count];

    if (v76)
    {
      id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v78 = [v4 allergiesLists];
      uint64_t v79 = [v78 countByEnumeratingWithState:&v105 objects:v122 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v106;
        do
        {
          for (uint64_t m = 0; m != v80; ++m)
          {
            if (*(void *)v106 != v81) {
              objc_enumerationMutation(v78);
            }
            uint64_t v83 = [MEMORY[0x1E4F2B910] createWithCodable:*(void *)(*((void *)&v105 + 1) + 8 * m)];
            [v77 addObject:v83];
          }
          uint64_t v80 = [v78 countByEnumeratingWithState:&v105 objects:v122 count:16];
        }
        while (v80);
      }

      [v5 setAllergiesList:v77];
    }
    if ([v4 hasAllergiesListModifiedDate])
    {
      [v4 allergiesListModifiedDate];
      v84 = HDDecodeDateForValue();
      [v5 setAllergiesListModifiedDate:v84];
    }
    else
    {
      [v5 setAllergiesListModifiedDate:0];
    }
    if ([v4 hasAllergiesListVersion])
    {
      v85 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "allergiesListVersion"));
      [v5 setAllergiesListVersion:v85];
    }
    else
    {
      [v5 setAllergiesListVersion:0];
    }
    if ([v4 hasAllergiesListVersionModifiedDate])
    {
      [v4 allergiesListVersionModifiedDate];
      v86 = HDDecodeDateForValue();
      [v5 setAllergiesListVersionModifiedDate:v86];
    }
    else
    {
      [v5 setAllergiesListVersionModifiedDate:0];
    }
    v87 = [v4 conditionsLists];
    uint64_t v88 = [v87 count];

    if (v88)
    {
      id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v90 = objc_msgSend(v4, "conditionsLists", 0);
      uint64_t v91 = [v90 countByEnumeratingWithState:&v101 objects:v121 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = *(void *)v102;
        do
        {
          for (uint64_t n = 0; n != v92; ++n)
          {
            if (*(void *)v102 != v93) {
              objc_enumerationMutation(v90);
            }
            uint64_t v95 = [MEMORY[0x1E4F2B918] createWithCodable:*(void *)(*((void *)&v101 + 1) + 8 * n)];
            [v89 addObject:v95];
          }
          uint64_t v92 = [v90 countByEnumeratingWithState:&v101 objects:v121 count:16];
        }
        while (v92);
      }

      [v5 setConditionsList:v89];
    }
    if ([v4 hasConditionsListModifiedDate])
    {
      [v4 conditionsListModifiedDate];
      uint64_t v96 = HDDecodeDateForValue();
      [v5 setConditionsListModifiedDate:v96];
    }
    else
    {
      [v5 setConditionsListModifiedDate:0];
    }
    if ([v4 hasConditionsListVersion])
    {
      uint64_t v97 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "conditionsListVersion"));
      [v5 setConditionsListVersion:v97];
    }
    else
    {
      [v5 setConditionsListVersion:0];
    }
    if ([v4 hasConditionsListVersionModifiedDate])
    {
      [v4 conditionsListVersionModifiedDate];
      uint64_t v98 = HDDecodeDateForValue();
      [v5 setConditionsListVersionModifiedDate:v98];
    }
    else
    {
      [v5 setConditionsListVersionModifiedDate:0];
    }
    if ([v4 hasDateSaved])
    {
      [v4 dateSaved];
      v99 = HDDecodeDateForValue();
      [v5 setDateSaved:v99];
    }
    else
    {
      [v5 setDateSaved:0];
    }
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end