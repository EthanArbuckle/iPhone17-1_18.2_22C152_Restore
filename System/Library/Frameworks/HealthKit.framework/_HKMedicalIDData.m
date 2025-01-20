@interface _HKMedicalIDData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAnyData;
- (BOOL)hasAnyModificationDate;
- (BOOL)isDisabled;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSyncedData:(id)a3;
- (BOOL)shareDuringEmergency;
- (HKQuantity)height;
- (HKQuantity)weight;
- (NSArray)allergiesList;
- (NSArray)clinicalContacts;
- (NSArray)conditionsList;
- (NSArray)emergencyContacts;
- (NSArray)medicationsList;
- (NSData)pictureData;
- (NSDate)allergiesListModifiedDate;
- (NSDate)allergiesListVersionModifiedDate;
- (NSDate)allergyInfoModifiedDate;
- (NSDate)birthdate;
- (NSDate)bloodTypeModifiedDate;
- (NSDate)clinicalContactsModifiedDate;
- (NSDate)conditionsListModifiedDate;
- (NSDate)conditionsListVersionModifiedDate;
- (NSDate)dateSaved;
- (NSDate)emergencyContactsModifiedDate;
- (NSDate)gmtBirthdate;
- (NSDate)gregorianBirthdayModifiedDate;
- (NSDate)heightModifiedDate;
- (NSDate)isDisabledModifiedDate;
- (NSDate)isOrganDonorModifiedDate;
- (NSDate)legacyDateSaved;
- (NSDate)medicalConditionsModifiedDate;
- (NSDate)medicalNotesModifiedDate;
- (NSDate)medicationInfoModifiedDate;
- (NSDate)medicationsListModifiedDate;
- (NSDate)medicationsListVersionModifiedDate;
- (NSDate)nameModifiedDate;
- (NSDate)pictureDataModifiedDate;
- (NSDate)pregnancyEstimatedDueDate;
- (NSDate)pregnancyEstimatedDueDateModifiedDate;
- (NSDate)pregnancyStartDate;
- (NSDate)pregnancyStartDateModifiedDate;
- (NSDate)primaryLanguageCodeModifiedDate;
- (NSDate)shareDuringEmergencyModifiedDate;
- (NSDate)weightModifiedDate;
- (NSDateComponents)gregorianBirthday;
- (NSNumber)allergiesListVersion;
- (NSNumber)conditionsListVersion;
- (NSNumber)isOrganDonor;
- (NSNumber)medicationsListVersion;
- (NSString)allergyInfo;
- (NSString)medicalConditions;
- (NSString)medicalNotes;
- (NSString)medicationInfo;
- (NSString)name;
- (NSString)pregnancyStartDateTimeZoneID;
- (NSString)primaryLanguageCode;
- (_HKMedicalIDData)init;
- (_HKMedicalIDData)initWithCoder:(id)a3;
- (id)_gregorianUtcCalendar;
- (id)consolidatedSOSContactsWithSOSContactsManager:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)merge:(id)a3;
- (int64_t)bloodType;
- (int64_t)schemaVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAllergiesList:(id)a3;
- (void)setAllergiesListModifiedDate:(id)a3;
- (void)setAllergiesListVersion:(id)a3;
- (void)setAllergiesListVersionModifiedDate:(id)a3;
- (void)setAllergyInfo:(id)a3;
- (void)setAllergyInfoModifiedDate:(id)a3;
- (void)setBirthdate:(id)a3;
- (void)setBloodType:(int64_t)a3;
- (void)setBloodTypeModifiedDate:(id)a3;
- (void)setClinicalContacts:(id)a3;
- (void)setClinicalContactsModifiedDate:(id)a3;
- (void)setConditionsList:(id)a3;
- (void)setConditionsListModifiedDate:(id)a3;
- (void)setConditionsListVersion:(id)a3;
- (void)setConditionsListVersionModifiedDate:(id)a3;
- (void)setDateSaved:(id)a3;
- (void)setEmergencyContacts:(id)a3;
- (void)setEmergencyContactsModifiedDate:(id)a3;
- (void)setGmtBirthdate:(id)a3;
- (void)setGregorianBirthday:(id)a3;
- (void)setGregorianBirthdayModifiedDate:(id)a3;
- (void)setHeight:(id)a3;
- (void)setHeightModifiedDate:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsDisabledModifiedDate:(id)a3;
- (void)setIsOrganDonor:(id)a3;
- (void)setIsOrganDonorModifiedDate:(id)a3;
- (void)setLegacyDateSaved:(id)a3;
- (void)setMedicalConditions:(id)a3;
- (void)setMedicalConditionsModifiedDate:(id)a3;
- (void)setMedicalNotes:(id)a3;
- (void)setMedicalNotesModifiedDate:(id)a3;
- (void)setMedicationInfo:(id)a3;
- (void)setMedicationInfoModifiedDate:(id)a3;
- (void)setMedicationsList:(id)a3;
- (void)setMedicationsListModifiedDate:(id)a3;
- (void)setMedicationsListVersion:(id)a3;
- (void)setMedicationsListVersionModifiedDate:(id)a3;
- (void)setModificationDatesForUpdatedFieldsWithMedicalIDData:(id)a3;
- (void)setModificationDatesToCurrentDate;
- (void)setName:(id)a3;
- (void)setNameModifiedDate:(id)a3;
- (void)setPictureData:(id)a3;
- (void)setPictureDataModifiedDate:(id)a3;
- (void)setPregnancyEstimatedDueDate:(id)a3;
- (void)setPregnancyEstimatedDueDateModifiedDate:(id)a3;
- (void)setPregnancyStartDate:(id)a3;
- (void)setPregnancyStartDateModifiedDate:(id)a3;
- (void)setPregnancyStartDateTimeZoneID:(id)a3;
- (void)setPrimaryLanguageCode:(id)a3;
- (void)setPrimaryLanguageCodeModifiedDate:(id)a3;
- (void)setSchemaVersion:(int64_t)a3;
- (void)setShareDuringEmergency:(BOOL)a3;
- (void)setShareDuringEmergencyModifiedDate:(id)a3;
- (void)setWeight:(id)a3;
- (void)setWeightModifiedDate:(id)a3;
@end

@implementation _HKMedicalIDData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKMedicalIDData)init
{
  v5.receiver = self;
  v5.super_class = (Class)_HKMedicalIDData;
  v2 = [(_HKMedicalIDData *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_HKMedicalIDData *)v2 setSchemaVersion:4];
  }
  return v3;
}

- (_HKMedicalIDData)initWithCoder:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_HKMedicalIDData;
  objc_super v5 = [(_HKMedicalIDData *)&v69 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataDateSavedKey"];
    [(_HKMedicalIDData *)v5 setDateSaved:v6];

    -[_HKMedicalIDData setSchemaVersion:](v5, "setSchemaVersion:", [v4 decodeIntegerForKey:@"HKMedicalIDDataSchemaVersionKey"]);
    -[_HKMedicalIDData setIsDisabled:](v5, "setIsDisabled:", [v4 decodeBoolForKey:@"HKMedicalIDDataIsDisabledKey"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataIsDisabledModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setIsDisabledModifiedDate:v7];

    -[_HKMedicalIDData setShareDuringEmergency:](v5, "setShareDuringEmergency:", [v4 decodeBoolForKey:@"HKMedicalIDDataShareDuringEmergencyKey"]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataShareDuringEmergencyModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setShareDuringEmergencyModifiedDate:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPictureDataKey"];
    [(_HKMedicalIDData *)v5 setPictureData:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPictureDataModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setPictureDataModifiedDate:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataNameKey"];
    [(_HKMedicalIDData *)v5 setName:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataNameModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setNameModifiedDate:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataBirthdateKey"];
    [(_HKMedicalIDData *)v5 setBirthdate:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataGmtBirthdateKey"];
    [(_HKMedicalIDData *)v5 setGmtBirthdate:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataGregorianBirthdateModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setGregorianBirthdayModifiedDate:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPrimaryLanguageCodeKey"];
    [(_HKMedicalIDData *)v5 setPrimaryLanguageCode:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPrimaryLanguageCodeModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setPrimaryLanguageCodeModifiedDate:v17];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataHeightKey"];
    [(_HKMedicalIDData *)v5 setHeight:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataHeightModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setHeightModifiedDate:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataWeightKey"];
    [(_HKMedicalIDData *)v5 setWeight:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataWeightModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setWeightModifiedDate:v21];

    -[_HKMedicalIDData setBloodType:](v5, "setBloodType:", [v4 decodeIntegerForKey:@"HKMedicalIDDataBloodTypeKey"]);
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataBloodTypeModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setBloodTypeModifiedDate:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataIsOrganDonorKey"];
    [(_HKMedicalIDData *)v5 setIsOrganDonor:v23];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataIsOrganDonorModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setIsOrganDonorModifiedDate:v24];

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = [v4 decodeObjectOfClasses:v27 forKey:@"HKMedicalIDDataEmergencyContactsKey"];
    [(_HKMedicalIDData *)v5 setEmergencyContacts:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataEmergencyContactsModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setEmergencyContactsModifiedDate:v29];

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v33 = [v4 decodeObjectOfClasses:v32 forKey:@"HKMedicalIDDataClinicalContactsKey"];
    [(_HKMedicalIDData *)v5 setClinicalContacts:v33];

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataClinicalContactsModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setClinicalContactsModifiedDate:v34];

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicalConditionsKey"];
    [(_HKMedicalIDData *)v5 setMedicalConditions:v35];

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicalConditionsModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setMedicalConditionsModifiedDate:v36];

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicalNotesKey"];
    [(_HKMedicalIDData *)v5 setMedicalNotes:v37];

    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicalNotesModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setMedicalNotesModifiedDate:v38];

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataAllergyInfoKey"];
    [(_HKMedicalIDData *)v5 setAllergyInfo:v39];

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataAllergyInfoModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setAllergyInfoModifiedDate:v40];

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicationInfoKey"];
    [(_HKMedicalIDData *)v5 setMedicationInfo:v41];

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicationInfoModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setMedicationInfoModifiedDate:v42];

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPregnancyStartDateKey"];
    [(_HKMedicalIDData *)v5 setPregnancyStartDate:v43];

    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPregnancyStartDateModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setPregnancyStartDateModifiedDate:v44];

    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPregnancyEstimatedDueDateKey"];
    [(_HKMedicalIDData *)v5 setPregnancyEstimatedDueDate:v45];

    v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataPregnancyEstimatedDueDateModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setPregnancyEstimatedDueDateModifiedDate:v46];

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    v50 = [v4 decodeObjectOfClasses:v49 forKey:@"HKMedicalIDDataMedicationsListKey"];
    [(_HKMedicalIDData *)v5 setMedicationsList:v50];

    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicationsListModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setMedicationsListModifiedDate:v51];

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicationsListVersionKey"];
    [(_HKMedicalIDData *)v5 setMedicationsListVersion:v52];

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataMedicationsListVersionModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setMedicationsListVersionModifiedDate:v53];

    v54 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v55 = objc_opt_class();
    v56 = objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
    v57 = [v4 decodeObjectOfClasses:v56 forKey:@"HKMedicalIDDataAllergiesListKey"];
    [(_HKMedicalIDData *)v5 setAllergiesList:v57];

    v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataAllergiesListModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setAllergiesListModifiedDate:v58];

    v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataAllergiesListVersionKey"];
    [(_HKMedicalIDData *)v5 setAllergiesListVersion:v59];

    v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataAllergiesListVersionModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setAllergiesListVersionModifiedDate:v60];

    v61 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    v63 = objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
    v64 = [v4 decodeObjectOfClasses:v63 forKey:@"HKMedicalIDDataConditionsListKey"];
    [(_HKMedicalIDData *)v5 setConditionsList:v64];

    v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataConditionsListModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setConditionsListModifiedDate:v65];

    v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataConditionsListVersionKey"];
    [(_HKMedicalIDData *)v5 setConditionsListVersion:v66];

    v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKMedicalIDDataConditionsListVersionModifiedDateKey"];
    [(_HKMedicalIDData *)v5 setConditionsListVersionModifiedDate:v67];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_HKMedicalIDData *)self dateSaved];
  [v4 encodeObject:v5 forKey:@"HKMedicalIDDataDateSavedKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_HKMedicalIDData schemaVersion](self, "schemaVersion"), @"HKMedicalIDDataSchemaVersionKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[_HKMedicalIDData isDisabled](self, "isDisabled"), @"HKMedicalIDDataIsDisabledKey");
  v6 = [(_HKMedicalIDData *)self isDisabledModifiedDate];
  [v4 encodeObject:v6 forKey:@"HKMedicalIDDataIsDisabledModifiedDateKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[_HKMedicalIDData shareDuringEmergency](self, "shareDuringEmergency"), @"HKMedicalIDDataShareDuringEmergencyKey");
  v7 = [(_HKMedicalIDData *)self shareDuringEmergencyModifiedDate];
  [v4 encodeObject:v7 forKey:@"HKMedicalIDDataShareDuringEmergencyModifiedDateKey"];

  v8 = [(_HKMedicalIDData *)self pictureData];
  [v4 encodeObject:v8 forKey:@"HKMedicalIDDataPictureDataKey"];

  v9 = [(_HKMedicalIDData *)self pictureDataModifiedDate];
  [v4 encodeObject:v9 forKey:@"HKMedicalIDDataPictureDataModifiedDateKey"];

  v10 = [(_HKMedicalIDData *)self name];
  [v4 encodeObject:v10 forKey:@"HKMedicalIDDataNameKey"];

  v11 = [(_HKMedicalIDData *)self nameModifiedDate];
  [v4 encodeObject:v11 forKey:@"HKMedicalIDDataNameModifiedDateKey"];

  v12 = [(_HKMedicalIDData *)self birthdate];
  [v4 encodeObject:v12 forKey:@"HKMedicalIDDataBirthdateKey"];

  v13 = [(_HKMedicalIDData *)self gmtBirthdate];
  [v4 encodeObject:v13 forKey:@"HKMedicalIDDataGmtBirthdateKey"];

  v14 = [(_HKMedicalIDData *)self gregorianBirthday];
  [v4 encodeObject:v14 forKey:@"HKMedicalIDDataGregorianBirthdateKey"];

  v15 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];
  [v4 encodeObject:v15 forKey:@"HKMedicalIDDataGregorianBirthdateModifiedDateKey"];

  v16 = [(_HKMedicalIDData *)self primaryLanguageCode];
  [v4 encodeObject:v16 forKey:@"HKMedicalIDDataPrimaryLanguageCodeKey"];

  v17 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];
  [v4 encodeObject:v17 forKey:@"HKMedicalIDDataPrimaryLanguageCodeModifiedDateKey"];

  v18 = [(_HKMedicalIDData *)self height];
  [v4 encodeObject:v18 forKey:@"HKMedicalIDDataHeightKey"];

  v19 = [(_HKMedicalIDData *)self heightModifiedDate];
  [v4 encodeObject:v19 forKey:@"HKMedicalIDDataHeightModifiedDateKey"];

  v20 = [(_HKMedicalIDData *)self weight];
  [v4 encodeObject:v20 forKey:@"HKMedicalIDDataWeightKey"];

  v21 = [(_HKMedicalIDData *)self weightModifiedDate];
  [v4 encodeObject:v21 forKey:@"HKMedicalIDDataWeightModifiedDateKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_HKMedicalIDData bloodType](self, "bloodType"), @"HKMedicalIDDataBloodTypeKey");
  v22 = [(_HKMedicalIDData *)self bloodTypeModifiedDate];
  [v4 encodeObject:v22 forKey:@"HKMedicalIDDataBloodTypeModifiedDateKey"];

  v23 = [(_HKMedicalIDData *)self isOrganDonor];
  [v4 encodeObject:v23 forKey:@"HKMedicalIDDataIsOrganDonorKey"];

  v24 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];
  [v4 encodeObject:v24 forKey:@"HKMedicalIDDataIsOrganDonorModifiedDateKey"];

  v25 = [(_HKMedicalIDData *)self emergencyContacts];
  [v4 encodeObject:v25 forKey:@"HKMedicalIDDataEmergencyContactsKey"];

  uint64_t v26 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];
  [v4 encodeObject:v26 forKey:@"HKMedicalIDDataEmergencyContactsModifiedDateKey"];

  v27 = [(_HKMedicalIDData *)self clinicalContacts];
  [v4 encodeObject:v27 forKey:@"HKMedicalIDDataClinicalContactsKey"];

  v28 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];
  [v4 encodeObject:v28 forKey:@"HKMedicalIDDataClinicalContactsModifiedDateKey"];

  v29 = [(_HKMedicalIDData *)self medicalConditions];
  [v4 encodeObject:v29 forKey:@"HKMedicalIDDataMedicalConditionsKey"];

  v30 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];
  [v4 encodeObject:v30 forKey:@"HKMedicalIDDataMedicalConditionsModifiedDateKey"];

  uint64_t v31 = [(_HKMedicalIDData *)self medicalNotes];
  [v4 encodeObject:v31 forKey:@"HKMedicalIDDataMedicalNotesKey"];

  v32 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];
  [v4 encodeObject:v32 forKey:@"HKMedicalIDDataMedicalNotesModifiedDateKey"];

  v33 = [(_HKMedicalIDData *)self allergyInfo];
  [v4 encodeObject:v33 forKey:@"HKMedicalIDDataAllergyInfoKey"];

  v34 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];
  [v4 encodeObject:v34 forKey:@"HKMedicalIDDataAllergyInfoModifiedDateKey"];

  v35 = [(_HKMedicalIDData *)self medicationInfo];
  [v4 encodeObject:v35 forKey:@"HKMedicalIDDataMedicationInfoKey"];

  v36 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];
  [v4 encodeObject:v36 forKey:@"HKMedicalIDDataMedicationInfoModifiedDateKey"];

  v37 = [(_HKMedicalIDData *)self pregnancyStartDate];
  [v4 encodeObject:v37 forKey:@"HKMedicalIDDataPregnancyStartDateKey"];

  v38 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];
  [v4 encodeObject:v38 forKey:@"HKMedicalIDDataPregnancyStartDateModifiedDateKey"];

  v39 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
  [v4 encodeObject:v39 forKey:@"HKMedicalIDDataPregnancyEstimatedDueDateKey"];

  v40 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];
  [v4 encodeObject:v40 forKey:@"HKMedicalIDDataPregnancyEstimatedDueDateModifiedDateKey"];

  v41 = [(_HKMedicalIDData *)self medicationsList];
  [v4 encodeObject:v41 forKey:@"HKMedicalIDDataMedicationsListKey"];

  v42 = [(_HKMedicalIDData *)self medicationsListModifiedDate];
  [v4 encodeObject:v42 forKey:@"HKMedicalIDDataMedicationsListModifiedDateKey"];

  v43 = [(_HKMedicalIDData *)self medicationsListVersion];
  [v4 encodeObject:v43 forKey:@"HKMedicalIDDataMedicationsListVersionKey"];

  v44 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];
  [v4 encodeObject:v44 forKey:@"HKMedicalIDDataMedicationsListVersionModifiedDateKey"];

  v45 = [(_HKMedicalIDData *)self allergiesList];
  [v4 encodeObject:v45 forKey:@"HKMedicalIDDataAllergiesListKey"];

  v46 = [(_HKMedicalIDData *)self allergiesListModifiedDate];
  [v4 encodeObject:v46 forKey:@"HKMedicalIDDataAllergiesListModifiedDateKey"];

  v47 = [(_HKMedicalIDData *)self allergiesListVersion];
  [v4 encodeObject:v47 forKey:@"HKMedicalIDDataAllergiesListVersionKey"];

  uint64_t v48 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];
  [v4 encodeObject:v48 forKey:@"HKMedicalIDDataAllergiesListVersionModifiedDateKey"];

  v49 = [(_HKMedicalIDData *)self conditionsList];
  [v4 encodeObject:v49 forKey:@"HKMedicalIDDataConditionsListKey"];

  v50 = [(_HKMedicalIDData *)self conditionsListModifiedDate];
  [v4 encodeObject:v50 forKey:@"HKMedicalIDDataConditionsListModifiedDateKey"];

  v51 = [(_HKMedicalIDData *)self conditionsListVersion];
  [v4 encodeObject:v51 forKey:@"HKMedicalIDDataConditionsListVersionKey"];

  id v52 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];
  [v4 encodeObject:v52 forKey:@"HKMedicalIDDataConditionsListVersionModifiedDateKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_HKMedicalIDData allocWithZone:a3] init];
  objc_super v5 = [(_HKMedicalIDData *)self dateSaved];
  v6 = (void *)[v5 copy];
  [(_HKMedicalIDData *)v4 setDateSaved:v6];

  [(_HKMedicalIDData *)v4 setSchemaVersion:[(_HKMedicalIDData *)self schemaVersion]];
  [(_HKMedicalIDData *)v4 setIsDisabled:[(_HKMedicalIDData *)self isDisabled]];
  v7 = [(_HKMedicalIDData *)self isDisabledModifiedDate];
  v8 = (void *)[v7 copy];
  [(_HKMedicalIDData *)v4 setIsDisabledModifiedDate:v8];

  [(_HKMedicalIDData *)v4 setShareDuringEmergency:[(_HKMedicalIDData *)self shareDuringEmergency]];
  v9 = [(_HKMedicalIDData *)self shareDuringEmergencyModifiedDate];
  v10 = (void *)[v9 copy];
  [(_HKMedicalIDData *)v4 setShareDuringEmergencyModifiedDate:v10];

  v11 = [(_HKMedicalIDData *)self pictureData];
  v12 = (void *)[v11 copy];
  [(_HKMedicalIDData *)v4 setPictureData:v12];

  v13 = [(_HKMedicalIDData *)self pictureDataModifiedDate];
  v14 = (void *)[v13 copy];
  [(_HKMedicalIDData *)v4 setPictureDataModifiedDate:v14];

  v15 = [(_HKMedicalIDData *)self name];
  v16 = (void *)[v15 copy];
  [(_HKMedicalIDData *)v4 setName:v16];

  v17 = [(_HKMedicalIDData *)self nameModifiedDate];
  v18 = (void *)[v17 copy];
  [(_HKMedicalIDData *)v4 setNameModifiedDate:v18];

  v19 = [(_HKMedicalIDData *)self birthdate];
  v20 = (void *)[v19 copy];
  [(_HKMedicalIDData *)v4 setBirthdate:v20];

  v21 = [(_HKMedicalIDData *)self gmtBirthdate];
  v22 = (void *)[v21 copy];
  [(_HKMedicalIDData *)v4 setGmtBirthdate:v22];

  v23 = [(_HKMedicalIDData *)self gregorianBirthday];
  v24 = (void *)[v23 copy];
  [(_HKMedicalIDData *)v4 setGregorianBirthday:v24];

  v25 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];
  uint64_t v26 = (void *)[v25 copy];
  [(_HKMedicalIDData *)v4 setGregorianBirthdayModifiedDate:v26];

  v27 = [(_HKMedicalIDData *)self primaryLanguageCode];
  v28 = (void *)[v27 copy];
  [(_HKMedicalIDData *)v4 setPrimaryLanguageCode:v28];

  v29 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];
  v30 = (void *)[v29 copy];
  [(_HKMedicalIDData *)v4 setPrimaryLanguageCodeModifiedDate:v30];

  uint64_t v31 = [(_HKMedicalIDData *)self height];
  v32 = (void *)[v31 copy];
  [(_HKMedicalIDData *)v4 setHeight:v32];

  v33 = [(_HKMedicalIDData *)self heightModifiedDate];
  v34 = (void *)[v33 copy];
  [(_HKMedicalIDData *)v4 setHeightModifiedDate:v34];

  v35 = [(_HKMedicalIDData *)self weight];
  v36 = (void *)[v35 copy];
  [(_HKMedicalIDData *)v4 setWeight:v36];

  v37 = [(_HKMedicalIDData *)self weightModifiedDate];
  v38 = (void *)[v37 copy];
  [(_HKMedicalIDData *)v4 setWeightModifiedDate:v38];

  [(_HKMedicalIDData *)v4 setBloodType:[(_HKMedicalIDData *)self bloodType]];
  v39 = [(_HKMedicalIDData *)self bloodTypeModifiedDate];
  v40 = (void *)[v39 copy];
  [(_HKMedicalIDData *)v4 setBloodTypeModifiedDate:v40];

  v41 = [(_HKMedicalIDData *)self isOrganDonor];
  v42 = (void *)[v41 copy];
  [(_HKMedicalIDData *)v4 setIsOrganDonor:v42];

  v43 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];
  v44 = (void *)[v43 copy];
  [(_HKMedicalIDData *)v4 setIsOrganDonorModifiedDate:v44];

  v45 = [(_HKMedicalIDData *)self emergencyContacts];
  v46 = (void *)[v45 copy];
  [(_HKMedicalIDData *)v4 setEmergencyContacts:v46];

  v47 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];
  uint64_t v48 = (void *)[v47 copy];
  [(_HKMedicalIDData *)v4 setEmergencyContactsModifiedDate:v48];

  v49 = [(_HKMedicalIDData *)self clinicalContacts];
  v50 = (void *)[v49 copy];
  [(_HKMedicalIDData *)v4 setClinicalContacts:v50];

  v51 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];
  id v52 = (void *)[v51 copy];
  [(_HKMedicalIDData *)v4 setClinicalContactsModifiedDate:v52];

  v53 = [(_HKMedicalIDData *)self medicalConditions];
  v54 = (void *)[v53 copy];
  [(_HKMedicalIDData *)v4 setMedicalConditions:v54];

  uint64_t v55 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];
  v56 = (void *)[v55 copy];
  [(_HKMedicalIDData *)v4 setMedicalConditionsModifiedDate:v56];

  v57 = [(_HKMedicalIDData *)self medicalNotes];
  v58 = (void *)[v57 copy];
  [(_HKMedicalIDData *)v4 setMedicalNotes:v58];

  v59 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];
  v60 = (void *)[v59 copy];
  [(_HKMedicalIDData *)v4 setMedicalNotesModifiedDate:v60];

  v61 = [(_HKMedicalIDData *)self allergyInfo];
  uint64_t v62 = (void *)[v61 copy];
  [(_HKMedicalIDData *)v4 setAllergyInfo:v62];

  v63 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];
  v64 = (void *)[v63 copy];
  [(_HKMedicalIDData *)v4 setAllergyInfoModifiedDate:v64];

  v65 = [(_HKMedicalIDData *)self medicationInfo];
  v66 = (void *)[v65 copy];
  [(_HKMedicalIDData *)v4 setMedicationInfo:v66];

  v67 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];
  v68 = (void *)[v67 copy];
  [(_HKMedicalIDData *)v4 setMedicationInfoModifiedDate:v68];

  objc_super v69 = [(_HKMedicalIDData *)self pregnancyStartDate];
  v70 = (void *)[v69 copy];
  [(_HKMedicalIDData *)v4 setPregnancyStartDate:v70];

  v71 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];
  v72 = (void *)[v71 copy];
  [(_HKMedicalIDData *)v4 setPregnancyStartDateModifiedDate:v72];

  v73 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
  v74 = (void *)[v73 copy];
  [(_HKMedicalIDData *)v4 setPregnancyEstimatedDueDate:v74];

  v75 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];
  v76 = (void *)[v75 copy];
  [(_HKMedicalIDData *)v4 setPregnancyEstimatedDueDateModifiedDate:v76];

  v77 = [(_HKMedicalIDData *)self medicationsList];
  v78 = (void *)[v77 copy];
  [(_HKMedicalIDData *)v4 setMedicationsList:v78];

  v79 = [(_HKMedicalIDData *)self medicationsListModifiedDate];
  v80 = (void *)[v79 copy];
  [(_HKMedicalIDData *)v4 setMedicationsListModifiedDate:v80];

  v81 = [(_HKMedicalIDData *)self medicationsListVersion];
  v82 = (void *)[v81 copy];
  [(_HKMedicalIDData *)v4 setMedicationsListVersion:v82];

  v83 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];
  v84 = (void *)[v83 copy];
  [(_HKMedicalIDData *)v4 setMedicationsListVersionModifiedDate:v84];

  v85 = [(_HKMedicalIDData *)self allergiesList];
  v86 = (void *)[v85 copy];
  [(_HKMedicalIDData *)v4 setAllergiesList:v86];

  v87 = [(_HKMedicalIDData *)self allergiesListModifiedDate];
  v88 = (void *)[v87 copy];
  [(_HKMedicalIDData *)v4 setAllergiesListModifiedDate:v88];

  v89 = [(_HKMedicalIDData *)self allergiesListVersion];
  v90 = (void *)[v89 copy];
  [(_HKMedicalIDData *)v4 setAllergiesListVersion:v90];

  v91 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];
  v92 = (void *)[v91 copy];
  [(_HKMedicalIDData *)v4 setAllergiesListVersionModifiedDate:v92];

  v93 = [(_HKMedicalIDData *)self conditionsList];
  v94 = (void *)[v93 copy];
  [(_HKMedicalIDData *)v4 setConditionsList:v94];

  v95 = [(_HKMedicalIDData *)self conditionsListModifiedDate];
  v96 = (void *)[v95 copy];
  [(_HKMedicalIDData *)v4 setConditionsListModifiedDate:v96];

  v97 = [(_HKMedicalIDData *)self conditionsListVersion];
  v98 = (void *)[v97 copy];
  [(_HKMedicalIDData *)v4 setConditionsListVersion:v98];

  v99 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];
  v100 = (void *)[v99 copy];
  [(_HKMedicalIDData *)v4 setConditionsListVersionModifiedDate:v100];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v16 = 0;
    goto LABEL_240;
  }
  v7 = [(_HKMedicalIDData *)self pictureData];
  v8 = [v6 pictureData];
  if (v7 == v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [v6 pictureData];
  if (!v9)
  {
    v210 = 0;
    BOOL v242 = 0;
    int v245 = 0;
    uint64_t v240 = 0;
    memset(v241, 0, sizeof(v241));
    long long v255 = 0uLL;
    int v11 = 0;
    uint64_t v267 = 0;
    memset(v239, 0, sizeof(v239));
    int v235 = 0;
    int v237 = 0;
    BOOL v266 = 0;
    int v230 = 0;
    int v233 = 0;
    BOOL v262 = 0;
    BOOL v259 = 0;
    int v265 = 0;
    int v221 = 0;
    int v224 = 0;
    BOOL v261 = 0;
    BOOL v257 = 0;
    int v264 = 0;
    int v217 = 0;
    int v219 = 0;
    BOOL v263 = 0;
    int v214 = 0;
    int v218 = 0;
    BOOL v260 = 0;
    int v213 = 0;
    int v216 = 0;
    BOOL v258 = 0;
    int v212 = 0;
    int v215 = 0;
    BOOL v256 = 0;
    int v211 = 0;
    int v222 = 0;
    BOOL v254 = 0;
    int v220 = 0;
    int v226 = 0;
    BOOL v253 = 0;
    int v223 = 0;
    int v227 = 0;
    BOOL v250 = 0;
    BOOL v247 = 0;
    int v252 = 0;
    int v225 = 0;
    int v228 = 0;
    BOOL v251 = 0;
    int v229 = 0;
    int v232 = 0;
    BOOL v246 = 0;
    BOOL v244 = 0;
    int v249 = 0;
    int v231 = 0;
    int v234 = 0;
    BOOL v248 = 0;
    int v236 = 0;
    int v238 = 0;
    uint64_t v243 = 0;
    int v12 = 0;
    int v13 = 0;
    BOOL v14 = 0;
    int v15 = 0;
    BOOL v16 = 0;
    goto LABEL_89;
  }
  v210 = (void *)v9;
  v10 = [(_HKMedicalIDData *)self pictureData];
  [v6 pictureData];
  v206 = v207 = v10;
  if (objc_msgSend(v10, "isEqual:"))
  {
LABEL_7:
    uint64_t v17 = [(_HKMedicalIDData *)self name];
    [v6 name];
    v208 = v209 = (void *)v17;
    uint64_t v3 = v17 != (void)v208;
    BOOL v242 = v7 != v8;
    if ((void *)v17 != v208)
    {
      uint64_t v18 = [v6 name];
      if (!v18)
      {
        v205 = 0;
        uint64_t v240 = 0;
        memset(v241, 0, sizeof(v241));
        *(void *)((char *)&v255 + 4) = 0;
        LODWORD(v255) = 0;
        int v11 = 0;
        uint64_t v267 = 0;
        memset(v239, 0, sizeof(v239));
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        HIDWORD(v255) = 1;
        goto LABEL_89;
      }
      v205 = (void *)v18;
      v19 = [(_HKMedicalIDData *)self name];
      [v6 name];
      v201 = v202 = v19;
      if (!objc_msgSend(v19, "isEqualToString:"))
      {
        *(void *)((char *)&v255 + 4) = 0;
        uint64_t v240 = 0;
        LODWORD(v255) = 0;
        int v11 = 0;
        uint64_t v267 = 0;
        memset(v239, 0, sizeof(v239));
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        *(_DWORD *)&v241[8] = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        HIDWORD(v255) = 1;
        *(void *)v241 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v20 = [(_HKMedicalIDData *)self birthdate];
    uint64_t v21 = [v6 birthdate];
    BOOL v22 = v20 != v21;
    v204 = (void *)v20;
    v203 = (void *)v21;
    HIDWORD(v255) = v3;
    if (v20 != v21)
    {
      uint64_t v23 = [v6 birthdate];
      if (!v23)
      {
        v200 = 0;
        uint64_t v240 = 0;
        *(void *)&long long v255 = 0;
        int v11 = 0;
        uint64_t v267 = 0;
        memset(v239, 0, sizeof(v239));
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        DWORD2(v255) = 1;
        goto LABEL_89;
      }
      v200 = (void *)v23;
      v24 = [(_HKMedicalIDData *)self birthdate];
      [v6 birthdate];
      v196 = v197 = v24;
      if (!objc_msgSend(v24, "isEqual:"))
      {
        *(void *)&long long v255 = 0;
        int v11 = 0;
        uint64_t v267 = 0;
        memset(v239, 0, sizeof(v239));
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        DWORD2(v255) = 1;
        uint64_t v240 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v25 = [(_HKMedicalIDData *)self gmtBirthdate];
    uint64_t v26 = [v6 gmtBirthdate];
    uint64_t v4 = v25 != v26;
    DWORD2(v255) = v22;
    v199 = (void *)v25;
    v198 = (void *)v26;
    if (v25 != v26)
    {
      uint64_t v27 = [v6 gmtBirthdate];
      if (!v27)
      {
        v195 = 0;
        *(void *)&long long v255 = 0x100000000;
        int v11 = 0;
        uint64_t v267 = 0;
        memset(v239, 0, sizeof(v239));
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        goto LABEL_89;
      }
      v195 = (void *)v27;
      v28 = [(_HKMedicalIDData *)self gmtBirthdate];
      [v6 gmtBirthdate];
      v191 = v192 = v28;
      if (!objc_msgSend(v28, "isEqual:"))
      {
        *(void *)&long long v255 = 0x100000000;
        *(void *)&v239[4] = 0;
        int v11 = 0;
        uint64_t v267 = 0;
        *(_DWORD *)v239 = 0;
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(void *)&v239[12] = 1;
        goto LABEL_89;
      }
    }
    uint64_t v29 = [(_HKMedicalIDData *)self primaryLanguageCode];
    v193 = [v6 primaryLanguageCode];
    BOOL v30 = v29 != (void)v193;
    DWORD1(v255) = v4;
    v194 = (void *)v29;
    if ((void *)v29 != v193)
    {
      uint64_t v31 = [v6 primaryLanguageCode];
      if (!v31)
      {
        v190 = 0;
        *(void *)&v239[4] = 0;
        int v11 = 0;
        uint64_t v267 = 0;
        *(_DWORD *)v239 = 0;
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[12] = v4;
        LODWORD(v255) = 1;
        goto LABEL_89;
      }
      v190 = (void *)v31;
      v32 = [(_HKMedicalIDData *)self primaryLanguageCode];
      [v6 primaryLanguageCode];
      v186 = v187 = v32;
      if (!objc_msgSend(v32, "isEqualToString:"))
      {
        int v11 = 0;
        uint64_t v267 = 0;
        *(void *)v239 = 0;
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[12] = v4;
        LODWORD(v255) = 1;
        *(_DWORD *)&v239[8] = 1;
        goto LABEL_89;
      }
    }
    uint64_t v33 = [(_HKMedicalIDData *)self height];
    uint64_t v34 = [v6 height];
    v35 = (void *)v33;
    v188 = (void *)v34;
    BOOL v36 = v33 == v34;
    BOOL v37 = v33 != v34;
    LODWORD(v255) = v30;
    v189 = v35;
    if (v36)
    {
      HIDWORD(v267) = v37;
    }
    else
    {
      uint64_t v38 = [v6 height];
      if (!v38)
      {
        v185 = 0;
        *(void *)v239 = 0;
        uint64_t v267 = 0x100000000;
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        goto LABEL_89;
      }
      HIDWORD(v267) = v37;
      v185 = (void *)v38;
      v39 = [(_HKMedicalIDData *)self height];
      [v6 height];
      v181 = v182 = v39;
      if (!objc_msgSend(v39, "isEqual:"))
      {
        uint64_t v267 = 0x100000000;
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        *(void *)v239 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v40 = [(_HKMedicalIDData *)self weight];
    v183 = [v6 weight];
    LODWORD(v267) = v40 != (void)v183;
    v184 = (void *)v40;
    if ((void *)v40 != v183)
    {
      uint64_t v41 = [v6 weight];
      if (!v41)
      {
        v180 = 0;
        int v235 = 0;
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        LODWORD(v267) = 1;
        goto LABEL_89;
      }
      v180 = (void *)v41;
      v42 = [(_HKMedicalIDData *)self weight];
      [v6 weight];
      v176 = v177 = v42;
      if (!objc_msgSend(v42, "isEqual:"))
      {
        int v237 = 0;
        BOOL v266 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        LODWORD(v267) = 1;
        int v235 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v43 = [(_HKMedicalIDData *)self isOrganDonor];
    v178 = [v6 isOrganDonor];
    BOOL v266 = v43 != (void)v178;
    v179 = (void *)v43;
    if ((void *)v43 != v178)
    {
      uint64_t v44 = [v6 isOrganDonor];
      if (!v44)
      {
        v175 = 0;
        int v230 = 0;
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        BOOL v266 = 1;
        goto LABEL_89;
      }
      v175 = (void *)v44;
      v45 = [(_HKMedicalIDData *)self isOrganDonor];
      [v6 isOrganDonor];
      v171 = v172 = v45;
      if (!objc_msgSend(v45, "isEqual:"))
      {
        int v233 = 0;
        BOOL v262 = 0;
        BOOL v259 = 0;
        int v265 = 0;
        int v221 = 0;
        int v224 = 0;
        BOOL v261 = 0;
        BOOL v257 = 0;
        int v264 = 0;
        int v217 = 0;
        int v219 = 0;
        BOOL v263 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        BOOL v266 = 1;
        int v230 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v46 = [(_HKMedicalIDData *)self emergencyContacts];
    v173 = [v6 emergencyContacts];
    BOOL v262 = v46 != (void)v173;
    v174 = (void *)v46;
    if ((void *)v46 == v173)
    {
      BOOL v259 = 0;
      int v265 = 0;
    }
    else
    {
      uint64_t v47 = [v6 emergencyContacts];
      BOOL v259 = v47 != 0;
      v168 = (void *)v47;
      if (v47
        && ([(_HKMedicalIDData *)self emergencyContacts],
            uint64_t v48 = objc_claimAutoreleasedReturnValue(),
            [v6 emergencyContacts],
            v163 = v48,
            v162 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v48, "isEqual:") & 1) != 0))
      {
        int v265 = 0;
        BOOL v259 = 1;
      }
      else
      {
        v167 = [(_HKMedicalIDData *)self emergencyContacts];
        if ([v167 count])
        {
          int v221 = 0;
          int v224 = 0;
          BOOL v261 = 0;
          BOOL v257 = 0;
          int v264 = 0;
          int v217 = 0;
          int v219 = 0;
          BOOL v263 = 0;
          int v214 = 0;
          int v218 = 0;
          BOOL v260 = 0;
          int v213 = 0;
          int v216 = 0;
          BOOL v258 = 0;
          int v212 = 0;
          int v215 = 0;
          BOOL v256 = 0;
          int v211 = 0;
          int v222 = 0;
          BOOL v254 = 0;
          int v220 = 0;
          int v226 = 0;
          BOOL v253 = 0;
          int v223 = 0;
          int v227 = 0;
          BOOL v250 = 0;
          BOOL v247 = 0;
          int v252 = 0;
          int v225 = 0;
          int v228 = 0;
          BOOL v251 = 0;
          int v229 = 0;
          int v232 = 0;
          BOOL v246 = 0;
          BOOL v244 = 0;
          int v249 = 0;
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          uint64_t v243 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          int v245 = 1;
          *(void *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          uint64_t v240 = v22 | 0x100000000;
          int v12 = 0;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          int v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          BOOL v262 = 1;
          int v265 = 1;
          goto LABEL_89;
        }
        v155 = [v6 emergencyContacts];
        if ([v155 count])
        {
          int v245 = 1;
          int v224 = 0;
          BOOL v261 = 0;
          BOOL v257 = 0;
          int v264 = 0;
          int v217 = 0;
          int v219 = 0;
          BOOL v263 = 0;
          int v214 = 0;
          int v218 = 0;
          BOOL v260 = 0;
          int v213 = 0;
          int v216 = 0;
          BOOL v258 = 0;
          int v212 = 0;
          int v215 = 0;
          BOOL v256 = 0;
          int v211 = 0;
          int v222 = 0;
          BOOL v254 = 0;
          int v220 = 0;
          int v226 = 0;
          BOOL v253 = 0;
          int v223 = 0;
          int v227 = 0;
          BOOL v250 = 0;
          BOOL v247 = 0;
          int v252 = 0;
          int v225 = 0;
          int v228 = 0;
          BOOL v251 = 0;
          int v229 = 0;
          int v232 = 0;
          BOOL v246 = 0;
          BOOL v244 = 0;
          int v249 = 0;
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          uint64_t v243 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          uint64_t v240 = v22 | 0x100000000;
          int v12 = 0;
          *(void *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          int v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          BOOL v262 = 1;
          int v265 = 1;
          int v221 = 1;
          goto LABEL_89;
        }
        int v265 = 1;
      }
    }
    uint64_t v49 = [(_HKMedicalIDData *)self clinicalContacts];
    v169 = [v6 clinicalContacts];
    BOOL v261 = v49 != (void)v169;
    v170 = (void *)v49;
    if ((void *)v49 == v169)
    {
      BOOL v257 = 0;
      int v264 = 0;
    }
    else
    {
      uint64_t v50 = [v6 clinicalContacts];
      BOOL v257 = v50 != 0;
      v164 = (void *)v50;
      if (v50
        && ([(_HKMedicalIDData *)self clinicalContacts],
            v51 = objc_claimAutoreleasedReturnValue(),
            [v6 clinicalContacts],
            v159 = v51,
            v158 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v51, "isEqual:") & 1) != 0))
      {
        int v264 = 0;
        BOOL v257 = 1;
      }
      else
      {
        v161 = [(_HKMedicalIDData *)self clinicalContacts];
        if ([v161 count])
        {
          int v217 = 0;
          int v219 = 0;
          BOOL v263 = 0;
          int v214 = 0;
          int v218 = 0;
          BOOL v260 = 0;
          int v213 = 0;
          int v216 = 0;
          BOOL v258 = 0;
          int v212 = 0;
          int v215 = 0;
          BOOL v256 = 0;
          int v211 = 0;
          int v222 = 0;
          BOOL v254 = 0;
          int v220 = 0;
          int v226 = 0;
          BOOL v253 = 0;
          int v223 = 0;
          int v227 = 0;
          BOOL v250 = 0;
          BOOL v247 = 0;
          int v252 = 0;
          int v225 = 0;
          int v228 = 0;
          BOOL v251 = 0;
          int v229 = 0;
          int v232 = 0;
          BOOL v246 = 0;
          BOOL v244 = 0;
          int v249 = 0;
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          uint64_t v243 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          int v245 = 1;
          *(void *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          uint64_t v240 = v22 | 0x100000000;
          int v12 = 0;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          int v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          BOOL v261 = 1;
          int v264 = 1;
          goto LABEL_89;
        }
        v149 = [v6 clinicalContacts];
        if ([v149 count])
        {
          int v245 = 1;
          int v219 = 0;
          BOOL v263 = 0;
          int v214 = 0;
          int v218 = 0;
          BOOL v260 = 0;
          int v213 = 0;
          int v216 = 0;
          BOOL v258 = 0;
          int v212 = 0;
          int v215 = 0;
          BOOL v256 = 0;
          int v211 = 0;
          int v222 = 0;
          BOOL v254 = 0;
          int v220 = 0;
          int v226 = 0;
          BOOL v253 = 0;
          int v223 = 0;
          int v227 = 0;
          BOOL v250 = 0;
          BOOL v247 = 0;
          int v252 = 0;
          int v225 = 0;
          int v228 = 0;
          BOOL v251 = 0;
          int v229 = 0;
          int v232 = 0;
          BOOL v246 = 0;
          BOOL v244 = 0;
          int v249 = 0;
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          *(_DWORD *)v239 = HIDWORD(v267);
          uint64_t v243 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          *(_DWORD *)&v241[8] = 0;
          *(_DWORD *)&v239[16] = 1;
          uint64_t v240 = v22 | 0x100000000;
          int v12 = 0;
          *(void *)v241 = v3 | 0x100000000;
          *(_DWORD *)&v239[8] = v30;
          *(_DWORD *)&v239[12] = v4;
          int v11 = 1;
          *(_DWORD *)&v239[4] = 1;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          BOOL v261 = 1;
          int v264 = 1;
          int v217 = 1;
          goto LABEL_89;
        }
        int v264 = 1;
      }
    }
    uint64_t v52 = [(_HKMedicalIDData *)self medicalConditions];
    v165 = [v6 medicalConditions];
    BOOL v263 = v52 != (void)v165;
    v166 = (void *)v52;
    if ((void *)v52 != v165)
    {
      uint64_t v53 = [v6 medicalConditions];
      if (!v53)
      {
        v160 = 0;
        int v214 = 0;
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        BOOL v263 = 1;
        goto LABEL_89;
      }
      v160 = (void *)v53;
      v54 = [(_HKMedicalIDData *)self medicalConditions];
      v153 = [v6 medicalConditions];
      v154 = v54;
      if (!objc_msgSend(v54, "isEqualToString:"))
      {
        int v218 = 0;
        BOOL v260 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        BOOL v263 = 1;
        int v214 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v55 = [(_HKMedicalIDData *)self medicalNotes];
    v156 = [v6 medicalNotes];
    BOOL v260 = v55 != (void)v156;
    v157 = (void *)v55;
    if ((void *)v55 != v156)
    {
      uint64_t v56 = [v6 medicalNotes];
      if (!v56)
      {
        v152 = 0;
        int v213 = 0;
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        BOOL v260 = 1;
        goto LABEL_89;
      }
      v152 = (void *)v56;
      v57 = [(_HKMedicalIDData *)self medicalNotes];
      v147 = [v6 medicalNotes];
      v148 = v57;
      if (!objc_msgSend(v57, "isEqualToString:"))
      {
        int v216 = 0;
        BOOL v258 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        BOOL v260 = 1;
        int v213 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v58 = [(_HKMedicalIDData *)self allergyInfo];
    uint64_t v59 = [v6 allergyInfo];
    BOOL v258 = v58 != v59;
    v150 = (void *)v59;
    v151 = (void *)v58;
    if (v58 != v59)
    {
      uint64_t v60 = [v6 allergyInfo];
      if (!v60)
      {
        v146 = 0;
        int v212 = 0;
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        BOOL v258 = 1;
        goto LABEL_89;
      }
      v146 = (void *)v60;
      v61 = [(_HKMedicalIDData *)self allergyInfo];
      v141 = [v6 allergyInfo];
      v142 = v61;
      if (!objc_msgSend(v61, "isEqualToString:"))
      {
        int v215 = 0;
        BOOL v256 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        BOOL v258 = 1;
        int v212 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v62 = [(_HKMedicalIDData *)self medicationInfo];
    v144 = [v6 medicationInfo];
    BOOL v256 = v62 != (void)v144;
    v145 = (void *)v62;
    if ((void *)v62 != v144)
    {
      v143 = [v6 medicationInfo];
      if (!v143)
      {
        v143 = 0;
        int v211 = 0;
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        BOOL v256 = 1;
        goto LABEL_89;
      }
      v63 = [(_HKMedicalIDData *)self medicationInfo];
      v139 = [v6 medicationInfo];
      v140 = v63;
      if (!objc_msgSend(v63, "isEqualToString:"))
      {
        int v222 = 0;
        BOOL v254 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        uint64_t v243 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(void *)v241 = v3 | 0x100000000;
        *(_DWORD *)&v241[8] = 0;
        *(_DWORD *)&v239[16] = 1;
        uint64_t v240 = v22 | 0x100000000;
        int v12 = 0;
        *(_DWORD *)&v239[8] = v30;
        *(_DWORD *)&v239[12] = v4;
        int v11 = 1;
        int v238 = 0;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        BOOL v256 = 1;
        int v64 = 1;
LABEL_87:
        int v211 = v64;
        goto LABEL_89;
      }
    }
    int v65 = [(_HKMedicalIDData *)self isDisabled];
    if (v65 != [v6 isDisabled]
      || (int v66 = [(_HKMedicalIDData *)self shareDuringEmergency],
          v66 != [v6 shareDuringEmergency]))
    {
      int v222 = 0;
      BOOL v254 = 0;
      int v220 = 0;
      int v226 = 0;
      BOOL v253 = 0;
      int v223 = 0;
      int v227 = 0;
      BOOL v250 = 0;
      BOOL v247 = 0;
      int v252 = 0;
      int v225 = 0;
      int v228 = 0;
      BOOL v251 = 0;
      int v229 = 0;
      int v232 = 0;
      BOOL v246 = 0;
      BOOL v244 = 0;
      int v249 = 0;
      int v231 = 0;
      int v234 = 0;
      BOOL v248 = 0;
      int v236 = 0;
      int v238 = 0;
      uint64_t v243 = 0;
      int v13 = 0;
      BOOL v14 = 0;
      int v15 = 0;
      BOOL v16 = 0;
      int v245 = 1;
      *(_DWORD *)v241 = v3;
      *(void *)&v241[4] = 1;
      *(_DWORD *)&v239[16] = 1;
      uint64_t v240 = v22 | 0x100000000;
      int v12 = 0;
      *(_DWORD *)&v239[8] = v30;
      *(_DWORD *)&v239[12] = v4;
LABEL_86:
      int v11 = 1;
      *(_DWORD *)v239 = HIDWORD(v267);
      *(_DWORD *)&v239[4] = 1;
      int v235 = v267;
      int v237 = 1;
      int v230 = v266;
      int v233 = 1;
      int v221 = v265;
      int v224 = 1;
      int v217 = v264;
      int v219 = 1;
      int v214 = v263;
      int v218 = 1;
      int v213 = v260;
      int v216 = 1;
      int v212 = v258;
      int v215 = 1;
      int v64 = v256;
      goto LABEL_87;
    }
    int64_t v75 = [(_HKMedicalIDData *)self bloodType];
    if (v75 != [v6 bloodType])
    {
      int v222 = 0;
      BOOL v254 = 0;
      int v220 = 0;
      int v226 = 0;
      BOOL v253 = 0;
      int v223 = 0;
      int v227 = 0;
      BOOL v250 = 0;
      BOOL v247 = 0;
      int v252 = 0;
      int v225 = 0;
      int v228 = 0;
      BOOL v251 = 0;
      int v229 = 0;
      int v232 = 0;
      BOOL v246 = 0;
      BOOL v244 = 0;
      int v249 = 0;
      int v231 = 0;
      int v234 = 0;
      BOOL v248 = 0;
      int v236 = 0;
      int v238 = 0;
      uint64_t v243 = 0;
      int v12 = 0;
      int v13 = 0;
      BOOL v14 = 0;
      int v15 = 0;
      BOOL v16 = 0;
      int v245 = 1;
      *(_DWORD *)&v241[4] = 1;
      *(_DWORD *)&v241[8] = 0;
      uint64_t v240 = DWORD2(v255) | 0x100000000;
      *(_DWORD *)v241 = v3;
      *(_DWORD *)&v239[16] = 1;
      *(void *)&v239[8] = v255;
      goto LABEL_86;
    }
    uint64_t v76 = [(_HKMedicalIDData *)self pregnancyStartDate];
    v137 = [v6 pregnancyStartDate];
    v138 = (void *)v76;
    BOOL v254 = v76 != (void)v137;
    if ((void *)v76 != v137)
    {
      v136 = [v6 pregnancyStartDate];
      if (!v136)
      {
        v136 = 0;
        int v220 = 0;
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        BOOL v254 = 1;
        goto LABEL_89;
      }
      v77 = [(_HKMedicalIDData *)self pregnancyStartDate];
      v131 = [v6 pregnancyStartDate];
      v132 = v77;
      if (!objc_msgSend(v77, "isEqual:"))
      {
        int v226 = 0;
        BOOL v253 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        BOOL v254 = 1;
        int v220 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v78 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
    v134 = [v6 pregnancyEstimatedDueDate];
    v135 = (void *)v78;
    BOOL v253 = v78 != (void)v134;
    if ((void *)v78 != v134)
    {
      v133 = [v6 pregnancyEstimatedDueDate];
      if (!v133)
      {
        v133 = 0;
        int v223 = 0;
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        BOOL v253 = 1;
        goto LABEL_89;
      }
      v79 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
      v127 = [v6 pregnancyEstimatedDueDate];
      v128 = v79;
      if (!objc_msgSend(v79, "isEqual:"))
      {
        int v227 = 0;
        BOOL v250 = 0;
        BOOL v247 = 0;
        int v252 = 0;
        int v225 = 0;
        int v228 = 0;
        BOOL v251 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        BOOL v253 = 1;
        int v223 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v80 = [(_HKMedicalIDData *)self medicationsList];
    v129 = [v6 medicationsList];
    v130 = (void *)v80;
    BOOL v250 = v80 != (void)v129;
    if ((void *)v80 == v129)
    {
      BOOL v247 = 0;
      int v252 = 0;
    }
    else
    {
      uint64_t v81 = [v6 medicationsList];
      BOOL v247 = v81 != 0;
      v124 = (void *)v81;
      if (v81
        && ([(_HKMedicalIDData *)self medicationsList],
            v82 = objc_claimAutoreleasedReturnValue(),
            [v6 medicationsList],
            v120 = objc_claimAutoreleasedReturnValue(),
            v121 = v82,
            (objc_msgSend(v82, "isEqual:") & 1) != 0))
      {
        int v252 = 0;
        BOOL v247 = 1;
      }
      else
      {
        v122 = [(_HKMedicalIDData *)self medicationsList];
        if ([v122 count])
        {
          int v225 = 0;
          int v228 = 0;
          BOOL v251 = 0;
          int v229 = 0;
          int v232 = 0;
          BOOL v246 = 0;
          BOOL v244 = 0;
          int v249 = 0;
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          uint64_t v243 = 0;
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          int v245 = 1;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          uint64_t v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          int v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(void *)&v239[8] = v255;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          int v217 = v264;
          int v219 = 1;
          int v214 = v263;
          int v218 = 1;
          int v213 = v260;
          int v216 = 1;
          int v212 = v258;
          int v215 = 1;
          int v211 = v256;
          int v222 = 1;
          int v220 = v254;
          int v226 = 1;
          int v223 = v253;
          int v227 = 1;
          BOOL v250 = 1;
          int v252 = 1;
          goto LABEL_89;
        }
        v111 = [v6 medicationsList];
        int v245 = 1;
        if ([v111 count])
        {
          int v228 = 0;
          BOOL v251 = 0;
          int v229 = 0;
          int v232 = 0;
          BOOL v246 = 0;
          BOOL v244 = 0;
          int v249 = 0;
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          uint64_t v243 = 0;
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          uint64_t v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          int v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(void *)&v239[8] = v255;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          int v217 = v264;
          int v219 = 1;
          int v214 = v263;
          int v218 = 1;
          int v213 = v260;
          int v216 = 1;
          int v212 = v258;
          int v215 = 1;
          int v211 = v256;
          int v222 = 1;
          int v220 = v254;
          int v226 = 1;
          int v223 = v253;
          int v227 = 1;
          BOOL v250 = 1;
          int v252 = 1;
          int v225 = 1;
          goto LABEL_89;
        }
        int v252 = 1;
      }
    }
    uint64_t v83 = [(_HKMedicalIDData *)self medicationsListVersion];
    v125 = [v6 medicationsListVersion];
    v126 = (void *)v83;
    BOOL v251 = v83 != (void)v125;
    if ((void *)v83 != v125)
    {
      v123 = [v6 medicationsListVersion];
      if (!v123)
      {
        v123 = 0;
        int v229 = 0;
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        int v223 = v253;
        int v227 = 1;
        int v225 = v252;
        int v228 = 1;
        BOOL v251 = 1;
        goto LABEL_89;
      }
      v84 = [(_HKMedicalIDData *)self medicationsListVersion];
      v116 = [v6 medicationsListVersion];
      v117 = v84;
      if (!objc_msgSend(v84, "isEqual:"))
      {
        int v232 = 0;
        BOOL v246 = 0;
        BOOL v244 = 0;
        int v249 = 0;
        int v231 = 0;
        int v234 = 0;
        BOOL v248 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        int v223 = v253;
        int v227 = 1;
        int v225 = v252;
        int v228 = 1;
        BOOL v251 = 1;
        int v229 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v85 = [(_HKMedicalIDData *)self allergiesList];
    v118 = [v6 allergiesList];
    v119 = (void *)v85;
    BOOL v246 = v85 != (void)v118;
    if ((void *)v85 == v118)
    {
      BOOL v244 = 0;
      int v249 = 0;
    }
    else
    {
      uint64_t v86 = [v6 allergiesList];
      BOOL v244 = v86 != 0;
      v113 = (void *)v86;
      if (v86
        && ([(_HKMedicalIDData *)self allergiesList],
            v87 = objc_claimAutoreleasedReturnValue(),
            [v6 allergiesList],
            v108 = objc_claimAutoreleasedReturnValue(),
            v109 = v87,
            (objc_msgSend(v87, "isEqual:") & 1) != 0))
      {
        int v249 = 0;
        BOOL v244 = 1;
      }
      else
      {
        v110 = [(_HKMedicalIDData *)self allergiesList];
        if ([v110 count])
        {
          int v231 = 0;
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          uint64_t v243 = 0;
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          int v245 = 1;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          uint64_t v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          int v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(void *)&v239[8] = v255;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          int v217 = v264;
          int v219 = 1;
          int v214 = v263;
          int v218 = 1;
          int v213 = v260;
          int v216 = 1;
          int v212 = v258;
          int v215 = 1;
          int v211 = v256;
          int v222 = 1;
          int v220 = v254;
          int v226 = 1;
          int v223 = v253;
          int v227 = 1;
          int v225 = v252;
          int v228 = 1;
          int v229 = v251;
          int v232 = 1;
          BOOL v246 = 1;
          int v249 = 1;
          goto LABEL_89;
        }
        v99 = [v6 allergiesList];
        int v245 = 1;
        if ([v99 count])
        {
          int v234 = 0;
          BOOL v248 = 0;
          int v236 = 0;
          int v238 = 0;
          uint64_t v243 = 0;
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          *(_DWORD *)&v241[4] = 1;
          *(_DWORD *)&v241[8] = 0;
          uint64_t v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v239[16] = 1;
          int v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(void *)&v239[8] = v255;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          int v217 = v264;
          int v219 = 1;
          int v214 = v263;
          int v218 = 1;
          int v213 = v260;
          int v216 = 1;
          int v212 = v258;
          int v215 = 1;
          int v211 = v256;
          int v222 = 1;
          int v220 = v254;
          int v226 = 1;
          int v223 = v253;
          int v227 = 1;
          int v225 = v252;
          int v228 = 1;
          int v229 = v251;
          int v232 = 1;
          BOOL v246 = 1;
          int v249 = 1;
          int v231 = 1;
          goto LABEL_89;
        }
        int v249 = 1;
      }
    }
    uint64_t v88 = [(_HKMedicalIDData *)self allergiesListVersion];
    v114 = [v6 allergiesListVersion];
    v115 = (void *)v88;
    BOOL v248 = v88 != (void)v114;
    if ((void *)v88 != v114)
    {
      v112 = [v6 allergiesListVersion];
      if (!v112)
      {
        v112 = 0;
        int v236 = 0;
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        int v223 = v253;
        int v227 = 1;
        int v225 = v252;
        int v228 = 1;
        int v229 = v251;
        int v232 = 1;
        int v231 = v249;
        int v234 = 1;
        BOOL v248 = 1;
        goto LABEL_89;
      }
      v89 = [(_HKMedicalIDData *)self allergiesListVersion];
      v104 = [v6 allergiesListVersion];
      v105 = v89;
      if (!objc_msgSend(v89, "isEqual:"))
      {
        int v238 = 0;
        uint64_t v243 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)&v241[4] = 1;
        *(_DWORD *)&v241[8] = 0;
        uint64_t v240 = DWORD2(v255) | 0x100000000;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        int v223 = v253;
        int v227 = 1;
        int v225 = v252;
        int v228 = 1;
        int v229 = v251;
        int v232 = 1;
        int v231 = v249;
        int v234 = 1;
        BOOL v248 = 1;
        int v236 = 1;
        goto LABEL_89;
      }
    }
    uint64_t v90 = [(_HKMedicalIDData *)self conditionsList];
    v106 = [v6 conditionsList];
    v107 = (void *)v90;
    LODWORD(v243) = v90 != (void)v106;
    if ((void *)v90 == v106)
    {
      *(_DWORD *)&v241[8] = 0;
      HIDWORD(v243) = 0;
    }
    else
    {
      uint64_t v91 = [v6 conditionsList];
      *(_DWORD *)&v241[8] = v91 != 0;
      v103 = (void *)v91;
      if (v91
        && ([(_HKMedicalIDData *)self conditionsList],
            v92 = objc_claimAutoreleasedReturnValue(),
            [v6 conditionsList],
            v96 = objc_claimAutoreleasedReturnValue(),
            v97 = v92,
            (objc_msgSend(v92, "isEqual:") & 1) != 0))
      {
        HIDWORD(v243) = 0;
        *(_DWORD *)&v241[8] = 1;
      }
      else
      {
        v98 = [(_HKMedicalIDData *)self conditionsList];
        if ([v98 count])
        {
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          int v245 = 1;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v241[4] = 1;
          uint64_t v240 = DWORD2(v255) | 0x100000000;
          *(_DWORD *)&v239[12] = v4;
          *(_DWORD *)&v239[16] = 1;
          int v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(_DWORD *)&v239[8] = v255;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          int v217 = v264;
          int v219 = 1;
          int v214 = v263;
          int v218 = 1;
          int v213 = v260;
          int v216 = 1;
          int v212 = v258;
          int v215 = 1;
          int v211 = v256;
          int v222 = 1;
          int v220 = v254;
          int v226 = 1;
          int v223 = v253;
          int v227 = 1;
          int v225 = v252;
          int v228 = 1;
          int v229 = v251;
          int v232 = 1;
          int v231 = v249;
          int v234 = 1;
          int v236 = v248;
          int v238 = 1;
          uint64_t v243 = 0x100000001;
          goto LABEL_89;
        }
        v95 = [v6 conditionsList];
        int v245 = 1;
        if ([v95 count])
        {
          int v13 = 0;
          BOOL v14 = 0;
          int v15 = 0;
          BOOL v16 = 0;
          *(_DWORD *)v241 = v3;
          *(_DWORD *)&v241[4] = 1;
          uint64_t v240 = v22 | 0x100000000;
          *(_DWORD *)&v239[16] = 1;
          int v11 = 1;
          *(_DWORD *)v239 = HIDWORD(v267);
          *(_DWORD *)&v239[4] = 1;
          *(void *)&v239[8] = v255;
          int v235 = v267;
          int v237 = 1;
          int v230 = v266;
          int v233 = 1;
          int v221 = v265;
          int v224 = 1;
          int v217 = v264;
          int v219 = 1;
          int v214 = v263;
          int v218 = 1;
          int v213 = v260;
          int v216 = 1;
          int v212 = v258;
          int v215 = 1;
          int v211 = v256;
          int v222 = 1;
          int v220 = v254;
          int v226 = 1;
          int v223 = v253;
          int v227 = 1;
          int v225 = v252;
          int v228 = 1;
          int v229 = v251;
          int v232 = 1;
          int v231 = v249;
          int v234 = 1;
          int v236 = v248;
          int v238 = 1;
          uint64_t v243 = 0x100000001;
          int v12 = 1;
          goto LABEL_89;
        }
        HIDWORD(v243) = 1;
      }
    }
    uint64_t v93 = [(_HKMedicalIDData *)self conditionsListVersion];
    v101 = [v6 conditionsListVersion];
    v102 = (void *)v93;
    if ((void *)v93 != v101)
    {
      v100 = [v6 conditionsListVersion];
      if (!v100)
      {
        v100 = 0;
        int v15 = 0;
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)v241 = v3;
        *(_DWORD *)&v241[4] = 1;
        uint64_t v240 = v22 | 0x100000000;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        int v223 = v253;
        int v227 = 1;
        int v225 = v252;
        int v228 = 1;
        int v229 = v251;
        int v232 = 1;
        int v231 = v249;
        int v234 = 1;
        int v236 = v248;
        int v238 = 1;
        int v12 = HIDWORD(v243);
        int v13 = 1;
        goto LABEL_298;
      }
      uint64_t v4 = [(_HKMedicalIDData *)self conditionsListVersion];
      uint64_t v3 = [v6 conditionsListVersion];
      if (![(id)v4 isEqual:v3])
      {
        BOOL v16 = 0;
        int v245 = 1;
        *(_DWORD *)v241 = HIDWORD(v255);
        *(_DWORD *)&v241[4] = 1;
        uint64_t v240 = v22 | 0x100000000;
        *(_DWORD *)&v239[16] = 1;
        int v11 = 1;
        *(_DWORD *)v239 = HIDWORD(v267);
        *(_DWORD *)&v239[4] = 1;
        *(void *)&v239[8] = v255;
        int v235 = v267;
        int v237 = 1;
        int v230 = v266;
        int v233 = 1;
        int v221 = v265;
        int v224 = 1;
        int v217 = v264;
        int v219 = 1;
        int v214 = v263;
        int v218 = 1;
        int v213 = v260;
        int v216 = 1;
        int v212 = v258;
        int v215 = 1;
        int v211 = v256;
        int v222 = 1;
        int v220 = v254;
        int v226 = 1;
        int v223 = v253;
        int v227 = 1;
        int v225 = v252;
        int v228 = 1;
        int v229 = v251;
        int v232 = 1;
        int v231 = v249;
        int v234 = 1;
        int v236 = v248;
        int v15 = 1;
        int v238 = 1;
        int v12 = HIDWORD(v243);
        int v13 = 1;
LABEL_298:
        BOOL v14 = 1;
        goto LABEL_89;
      }
    }
    int64_t v94 = [(_HKMedicalIDData *)self schemaVersion];
    BOOL v16 = v94 == [v6 schemaVersion];
    int v245 = 1;
    *(_DWORD *)v241 = HIDWORD(v255);
    *(_DWORD *)&v241[4] = 1;
    uint64_t v240 = v22 | 0x100000000;
    *(_DWORD *)&v239[16] = 1;
    int v11 = 1;
    *(_DWORD *)v239 = HIDWORD(v267);
    *(_DWORD *)&v239[4] = 1;
    *(void *)&v239[8] = v255;
    int v235 = v267;
    int v237 = 1;
    int v230 = v266;
    int v233 = 1;
    int v221 = v265;
    int v224 = 1;
    int v217 = v264;
    int v219 = 1;
    int v214 = v263;
    int v218 = 1;
    int v213 = v260;
    int v216 = 1;
    int v212 = v258;
    int v215 = 1;
    int v211 = v256;
    int v222 = 1;
    int v220 = v254;
    int v226 = 1;
    int v223 = v253;
    int v227 = 1;
    int v225 = v252;
    int v228 = 1;
    int v229 = v251;
    int v232 = 1;
    int v231 = v249;
    int v234 = 1;
    int v236 = v248;
    int v238 = 1;
    int v12 = HIDWORD(v243);
    int v13 = 1;
    BOOL v14 = v93 != (void)v101;
    int v15 = v14;
    goto LABEL_89;
  }
  int v245 = 0;
  uint64_t v240 = 0;
  memset(v241, 0, sizeof(v241));
  long long v255 = 0uLL;
  int v11 = 0;
  uint64_t v267 = 0;
  memset(v239, 0, sizeof(v239));
  int v235 = 0;
  int v237 = 0;
  BOOL v266 = 0;
  int v230 = 0;
  int v233 = 0;
  BOOL v262 = 0;
  BOOL v259 = 0;
  int v265 = 0;
  int v221 = 0;
  int v224 = 0;
  BOOL v261 = 0;
  BOOL v257 = 0;
  int v264 = 0;
  int v217 = 0;
  int v219 = 0;
  BOOL v263 = 0;
  int v214 = 0;
  int v218 = 0;
  BOOL v260 = 0;
  int v213 = 0;
  int v216 = 0;
  BOOL v258 = 0;
  int v212 = 0;
  int v215 = 0;
  BOOL v256 = 0;
  int v211 = 0;
  int v222 = 0;
  BOOL v254 = 0;
  int v220 = 0;
  int v226 = 0;
  BOOL v253 = 0;
  int v223 = 0;
  int v227 = 0;
  BOOL v250 = 0;
  BOOL v247 = 0;
  int v252 = 0;
  int v225 = 0;
  int v228 = 0;
  BOOL v251 = 0;
  int v229 = 0;
  int v232 = 0;
  BOOL v246 = 0;
  BOOL v244 = 0;
  int v249 = 0;
  int v231 = 0;
  int v234 = 0;
  BOOL v248 = 0;
  int v236 = 0;
  int v238 = 0;
  uint64_t v243 = 0;
  int v12 = 0;
  int v13 = 0;
  BOOL v14 = 0;
  int v15 = 0;
  BOOL v16 = 0;
  BOOL v242 = 1;
LABEL_89:
  if (v15)
  {
    BOOL v67 = v16;
    int v68 = v12;
    int v69 = v13;
    v70 = v8;
    v71 = v7;
    int v72 = v11;
    BOOL v73 = v14;

    BOOL v14 = v73;
    int v11 = v72;
    v7 = v71;
    v8 = v70;
    int v13 = v69;
    int v12 = v68;
    BOOL v16 = v67;
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (v12) {

  }
  if (HIDWORD(v243)) {
  if (*(_DWORD *)&v241[8])
  }
  {
  }
  if (v243) {

  }
  if (v238)
  {
  }
  if (v236)
  {
  }
  if (v248) {

  }
  if (v234)
  {
  }
  if (v231) {

  }
  if (v249) {
  if (v244)
  }
  {
  }
  if (v246) {

  }
  if (v232)
  {
  }
  if (v229)
  {
  }
  if (v251) {

  }
  if (v228)
  {
  }
  if (v225) {

  }
  if (v252) {
  if (v247)
  }
  {
  }
  if (v250) {

  }
  if (v227)
  {
  }
  if (v223)
  {
  }
  if (v253) {

  }
  if (v226)
  {
  }
  if (v220)
  {
  }
  if (v254) {

  }
  if (v222)
  {
  }
  if (v211)
  {
  }
  if (v256) {

  }
  if (v215)
  {
  }
  if (v212)
  {
  }
  if (v258) {

  }
  if (v216)
  {
  }
  if (v213)
  {
  }
  if (v260) {

  }
  if (v218)
  {
  }
  if (v214)
  {
  }
  if (v263) {

  }
  if (v219)
  {
  }
  if (v217) {

  }
  if (v264) {
  if (v257)
  }
  {
  }
  if (v261) {

  }
  if (v224)
  {
  }
  if (v221) {

  }
  if (v265) {
  if (v259)
  }
  {
  }
  if (v262) {

  }
  if (v233)
  {
  }
  if (v230)
  {
  }
  if (v266) {

  }
  if (v237)
  {
  }
  if (v235)
  {
  }
  if (v267) {

  }
  if (*(_DWORD *)&v239[4])
  {
  }
  if (*(_DWORD *)v239)
  {
  }
  if (HIDWORD(v267)) {

  }
  if (v11)
  {
  }
  if (*(_DWORD *)&v239[8])
  {
  }
  if (v255) {

  }
  if (*(_DWORD *)&v239[16])
  {
  }
  if (*(_DWORD *)&v239[12])
  {
  }
  if (DWORD1(v255)) {

  }
  if (HIDWORD(v240))
  {
  }
  if (v240)
  {
  }
  if (DWORD2(v255)) {

  }
  if (*(_DWORD *)&v241[4])
  {
  }
  if (*(_DWORD *)v241)
  {
  }
  if (HIDWORD(v255)) {

  }
  if (v245)
  {
  }
  if (v242)
  {
  }
  if (v7 != v8) {

  }
LABEL_240:
  return v16;
}

- (BOOL)isEqualToSyncedData:(id)a3
{
  id v7 = a3;
  v8 = [(_HKMedicalIDData *)self pictureData];
  uint64_t v9 = [v7 pictureData];
  uint64_t v10 = v8 != v9;
  if (v8 != v9)
  {
    uint64_t v11 = [v7 pictureData];
    if (!v11)
    {
      int v238 = 0;
      BOOL v285 = 0;
      int v289 = 0;
      uint64_t v292 = 0;
      long long v299 = 0uLL;
      memset(v278, 0, sizeof(v278));
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      goto LABEL_15;
    }
    int v238 = (void *)v11;
    int v12 = [(_HKMedicalIDData *)self pictureData];
    [v7 pictureData];
    int v233 = v234 = v12;
    if (!objc_msgSend(v12, "isEqual:"))
    {
      int v289 = 0;
      uint64_t v292 = 0;
      long long v299 = 0uLL;
      memset(v278, 0, sizeof(v278));
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      BOOL v285 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v3 = [(_HKMedicalIDData *)self name];
  uint64_t v4 = [v7 name];
  uint64_t v5 = v3 != v4;
  BOOL v285 = v8 != v9;
  int v237 = v3;
  int v236 = v4;
  if (v3 != v4)
  {
    uint64_t v15 = [v7 name];
    if (!v15)
    {
      int v232 = 0;
      uint64_t v292 = 0x100000000;
      long long v299 = 0uLL;
      memset(v278, 0, sizeof(v278));
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      goto LABEL_15;
    }
    int v232 = (void *)v15;
    BOOL v16 = [(_HKMedicalIDData *)self name];
    [v7 name];
    int v228 = v229 = v16;
    if (!objc_msgSend(v16, "isEqualToString:"))
    {
      uint64_t v292 = 0x100000000;
      long long v299 = 0uLL;
      memset(v278, 0, 20);
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      HIDWORD(v278[2]) = 1;
      goto LABEL_15;
    }
  }
  uint64_t v17 = [(_HKMedicalIDData *)self birthdate];
  int v230 = [v7 birthdate];
  BOOL v18 = v17 != (void)v230;
  HIDWORD(v292) = v3 != v4;
  int v231 = (void *)v17;
  if ((void *)v17 != v230)
  {
    uint64_t v19 = [v7 birthdate];
    if (!v19)
    {
      int v227 = 0;
      v278[0] = 0;
      v278[1] = 0;
      long long v299 = 0uLL;
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v292) = 1;
      goto LABEL_15;
    }
    int v227 = (void *)v19;
    uint64_t v20 = [(_HKMedicalIDData *)self birthdate];
    [v7 birthdate];
    int v223 = v224 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      *(void *)((char *)v278 + 4) = 0;
      long long v299 = 0uLL;
      LODWORD(v278[0]) = 0;
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v292) = 1;
      HIDWORD(v278[1]) = 1;
      goto LABEL_15;
    }
  }
  uint64_t v73 = [(_HKMedicalIDData *)self gmtBirthdate];
  uint64_t v74 = [v7 gmtBirthdate];
  int64_t v75 = (void *)v73;
  int v225 = (void *)v74;
  BOOL v76 = v73 == v74;
  BOOL v77 = v73 != v74;
  LODWORD(v292) = v18;
  int v226 = v75;
  if (v76)
  {
    HIDWORD(v299) = v77;
  }
  else
  {
    uint64_t v78 = [v7 gmtBirthdate];
    if (!v78)
    {
      int v222 = 0;
      v278[0] = 0;
      *(void *)((char *)&v299 + 4) = 0;
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      LODWORD(v299) = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v299) = 1;
      goto LABEL_15;
    }
    HIDWORD(v299) = v77;
    v79 = v9;
    uint64_t v80 = v8;
    int v222 = (void *)v78;
    uint64_t v81 = [(_HKMedicalIDData *)self gmtBirthdate];
    [v7 gmtBirthdate];
    int v218 = v219 = v81;
    if (!objc_msgSend(v81, "isEqual:"))
    {
      v278[0] = 0x100000000;
      *(void *)((char *)&v299 + 4) = 0;
      int v276 = 0;
      int v274 = 0;
      int v272 = 0;
      int v270 = 0;
      LODWORD(v299) = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v277 = 0;
      int v273 = 0;
      int v275 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v299) = 1;
      BOOL v21 = 1;
      v8 = v80;
      uint64_t v9 = v79;
      BOOL v13 = 0;
      goto LABEL_17;
    }
    v8 = v80;
    uint64_t v9 = v79;
  }
  uint64_t v82 = [(_HKMedicalIDData *)self primaryLanguageCode];
  int v220 = [v7 primaryLanguageCode];
  DWORD2(v299) = v82 != (void)v220;
  int v221 = (void *)v82;
  if ((void *)v82 != v220)
  {
    uint64_t v83 = [v7 primaryLanguageCode];
    if (!v83)
    {
      int v235 = 0;
      int v276 = 0;
      int v274 = 0;
      *(void *)&long long v299 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      int v275 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      DWORD2(v299) = 1;
      goto LABEL_15;
    }
    int v235 = (void *)v83;
    v84 = [(_HKMedicalIDData *)self primaryLanguageCode];
    [v7 primaryLanguageCode];
    int v214 = v215 = v84;
    if (!objc_msgSend(v84, "isEqualToString:"))
    {
      int v274 = 0;
      *(void *)&long long v299 = 0;
      int v272 = 0;
      int v270 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      DWORD2(v299) = 1;
      int v275 = 0;
      int v276 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v85 = [(_HKMedicalIDData *)self height];
  int v216 = [v7 height];
  DWORD1(v299) = v85 != (void)v216;
  int v217 = (void *)v85;
  if ((void *)v85 != v216)
  {
    uint64_t v86 = [v7 height];
    if (!v86)
    {
      int v213 = 0;
      int v272 = 0;
      int v270 = 0;
      *(void *)&long long v299 = 0x100000000;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      goto LABEL_15;
    }
    int v213 = (void *)v86;
    v87 = [(_HKMedicalIDData *)self height];
    [v7 height];
    v209 = v210 = v87;
    if (!objc_msgSend(v87, "isEqual:"))
    {
      int v270 = 0;
      *(void *)&long long v299 = 0x100000000;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v88 = [(_HKMedicalIDData *)self weight];
  int v211 = [v7 weight];
  LODWORD(v299) = v88 != (void)v211;
  int v212 = (void *)v88;
  if ((void *)v88 != v211)
  {
    uint64_t v89 = [v7 weight];
    if (!v89)
    {
      v208 = 0;
      int v268 = 0;
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      LODWORD(v299) = 1;
      goto LABEL_15;
    }
    v208 = (void *)v89;
    uint64_t v90 = [(_HKMedicalIDData *)self weight];
    [v7 weight];
    v204 = v205 = v90;
    if (![v90 isEqual:v204])
    {
      int v266 = 0;
      BOOL v298 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      LODWORD(v299) = 1;
      int v268 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v91 = [(_HKMedicalIDData *)self isOrganDonor];
  v206 = [v7 isOrganDonor];
  BOOL v298 = v91 != (void)v206;
  v207 = (void *)v91;
  if ((void *)v91 != v206)
  {
    uint64_t v92 = [v7 isOrganDonor];
    if (!v92)
    {
      v203 = 0;
      int v264 = 0;
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      BOOL v298 = 1;
      goto LABEL_15;
    }
    v203 = (void *)v92;
    uint64_t v93 = [(_HKMedicalIDData *)self isOrganDonor];
    [v7 isOrganDonor];
    v199 = v200 = v93;
    if (![v93 isEqual:v199])
    {
      int v261 = 0;
      BOOL v297 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      BOOL v298 = 1;
      int v264 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v94 = [(_HKMedicalIDData *)self medicalConditions];
  v201 = [v7 medicalConditions];
  BOOL v297 = v94 != (void)v201;
  v202 = (void *)v94;
  if ((void *)v94 != v201)
  {
    uint64_t v95 = [v7 medicalConditions];
    if (!v95)
    {
      v198 = 0;
      int v258 = 0;
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      BOOL v297 = 1;
      goto LABEL_15;
    }
    v198 = (void *)v95;
    v96 = [(_HKMedicalIDData *)self medicalConditions];
    [v7 medicalConditions];
    v194 = v195 = v96;
    if (![v96 isEqualToString:v194])
    {
      int v256 = 0;
      BOOL v296 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      BOOL v297 = 1;
      int v258 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v97 = [(_HKMedicalIDData *)self medicalNotes];
  v196 = [v7 medicalNotes];
  BOOL v296 = v97 != (void)v196;
  v197 = (void *)v97;
  if ((void *)v97 != v196)
  {
    uint64_t v98 = [v7 medicalNotes];
    if (!v98)
    {
      v193 = 0;
      int v251 = 0;
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      BOOL v296 = 1;
      goto LABEL_15;
    }
    v193 = (void *)v98;
    v99 = [(_HKMedicalIDData *)self medicalNotes];
    [v7 medicalNotes];
    v189 = v190 = v99;
    if (![v99 isEqualToString:v189])
    {
      int v249 = 0;
      BOOL v295 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      BOOL v296 = 1;
      int v251 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v100 = [(_HKMedicalIDData *)self allergyInfo];
  v191 = [v7 allergyInfo];
  BOOL v295 = v100 != (void)v191;
  v192 = (void *)v100;
  if ((void *)v100 != v191)
  {
    uint64_t v101 = [v7 allergyInfo];
    if (!v101)
    {
      v188 = 0;
      int v241 = 0;
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      BOOL v295 = 1;
      goto LABEL_15;
    }
    v188 = (void *)v101;
    v102 = [(_HKMedicalIDData *)self allergyInfo];
    [v7 allergyInfo];
    v184 = v185 = v102;
    if (![v102 isEqualToString:v184])
    {
      int v240 = 0;
      BOOL v294 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      BOOL v295 = 1;
      int v241 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v103 = [(_HKMedicalIDData *)self medicationInfo];
  v186 = [v7 medicationInfo];
  BOOL v294 = v103 != (void)v186;
  v187 = (void *)v103;
  if ((void *)v103 != v186)
  {
    uint64_t v104 = [v7 medicationInfo];
    if (!v104)
    {
      v183 = 0;
      int v239 = 0;
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      BOOL v294 = 1;
      goto LABEL_15;
    }
    v183 = (void *)v104;
    v105 = [(_HKMedicalIDData *)self medicationInfo];
    v181 = [v7 medicationInfo];
    v182 = v105;
    if (!objc_msgSend(v105, "isEqualToString:"))
    {
      int v253 = 0;
      BOOL v293 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v106 = 1;
      int v240 = 1;
      BOOL v294 = 1;
LABEL_245:
      int v239 = v106;
      goto LABEL_15;
    }
  }
  int v107 = [(_HKMedicalIDData *)self isDisabled];
  if (v107 != [v7 isDisabled]
    || (int v108 = [(_HKMedicalIDData *)self shareDuringEmergency],
        v108 != [v7 shareDuringEmergency])
    || (int64_t v109 = -[_HKMedicalIDData bloodType](self, "bloodType"), v109 != [v7 bloodType]))
  {
    int v253 = 0;
    BOOL v293 = 0;
    int v246 = 0;
    int v248 = 0;
    BOOL v291 = 0;
    int v243 = 0;
    int v247 = 0;
    BOOL v284 = 0;
    int v290 = 0;
    int v242 = 0;
    int v244 = 0;
    int v250 = 0;
    BOOL v283 = 0;
    int v288 = 0;
    int v245 = 0;
    int v252 = 0;
    int v255 = 0;
    BOOL v282 = 0;
    int v287 = 0;
    int v254 = 0;
    int v257 = 0;
    int v259 = 0;
    BOOL v286 = 0;
    int v260 = 0;
    int v262 = 0;
    BOOL v281 = 0;
    int v279 = 0;
    int v263 = 0;
    int v265 = 0;
    int v267 = 0;
    uint64_t v280 = 0;
    int v269 = 0;
    uint64_t v271 = 0;
    BOOL v13 = 0;
    int v14 = 0;
    int v289 = 1;
    LODWORD(v278[2]) = 1;
    HIDWORD(v278[2]) = v3 != v4;
    LODWORD(v278[1]) = 1;
    HIDWORD(v278[1]) = v18;
    HIDWORD(v278[0]) = HIDWORD(v299);
    int v277 = 0;
    LODWORD(v278[0]) = 1;
    int v275 = 0;
    int v276 = DWORD2(v299);
    int v273 = 0;
    int v274 = 1;
    int v272 = DWORD1(v299);
    int v270 = 1;
    int v268 = v299;
    int v266 = 1;
    int v264 = v298;
    int v261 = 1;
    int v258 = v297;
    int v256 = 1;
    int v251 = v296;
    int v249 = 1;
    int v241 = v295;
    int v240 = 1;
    int v106 = v294;
    goto LABEL_245;
  }
  uint64_t v110 = [(_HKMedicalIDData *)self pregnancyStartDate];
  v179 = [v7 pregnancyStartDate];
  v180 = (void *)v110;
  BOOL v293 = v110 != (void)v179;
  if ((void *)v110 != v179)
  {
    v178 = [v7 pregnancyStartDate];
    if (!v178)
    {
      v178 = 0;
      int v246 = 0;
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      BOOL v293 = 1;
      goto LABEL_15;
    }
    v111 = [(_HKMedicalIDData *)self pregnancyStartDate];
    v173 = [v7 pregnancyStartDate];
    v174 = v111;
    if (!objc_msgSend(v111, "isEqual:"))
    {
      int v248 = 0;
      BOOL v291 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      BOOL v293 = 1;
      int v246 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v112 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
  v176 = [v7 pregnancyEstimatedDueDate];
  v177 = (void *)v112;
  BOOL v291 = v112 != (void)v176;
  if ((void *)v112 != v176)
  {
    v175 = [v7 pregnancyEstimatedDueDate];
    if (!v175)
    {
      v175 = 0;
      int v243 = 0;
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      BOOL v291 = 1;
      goto LABEL_15;
    }
    v113 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
    v168 = [v7 pregnancyEstimatedDueDate];
    v169 = v113;
    if (!objc_msgSend(v113, "isEqual:"))
    {
      int v247 = 0;
      BOOL v284 = 0;
      int v290 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      BOOL v291 = 1;
      int v243 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v114 = [(_HKMedicalIDData *)self emergencyContacts];
  BOOL v284 = v114 == 0;
  v171 = (void *)v114;
  if (v114 || ([v7 emergencyContacts], (v167 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v172 = [(_HKMedicalIDData *)self emergencyContacts];
    if (!v172)
    {
      v172 = 0;
      int v242 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v290 = 1;
      goto LABEL_15;
    }
    v170 = [v7 emergencyContacts];
    if (!v170)
    {
      v170 = 0;
      int v244 = 0;
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v290 = 1;
      int v242 = 1;
      goto LABEL_15;
    }
    v165 = [(_HKMedicalIDData *)self emergencyContacts];
    uint64_t v115 = [v165 count];
    v164 = [v7 emergencyContacts];
    int v289 = 1;
    if (v115 != [v164 count])
    {
      int v250 = 0;
      BOOL v283 = 0;
      int v288 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v290 = 1;
      int v242 = 1;
      int v244 = 1;
      goto LABEL_15;
    }
    int v290 = 1;
  }
  else
  {
    v167 = 0;
    int v290 = 0;
  }
  uint64_t v116 = [(_HKMedicalIDData *)self clinicalContacts];
  BOOL v283 = v116 == 0;
  v163 = (void *)v116;
  if (v116 || ([v7 clinicalContacts], (v161 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v166 = [(_HKMedicalIDData *)self clinicalContacts];
    if (!v166)
    {
      v166 = 0;
      int v245 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v288 = 1;
      goto LABEL_15;
    }
    v162 = [v7 clinicalContacts];
    if (!v162)
    {
      v162 = 0;
      int v252 = 0;
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v288 = 1;
      int v245 = 1;
      goto LABEL_15;
    }
    v159 = [(_HKMedicalIDData *)self clinicalContacts];
    uint64_t v117 = [v159 count];
    v158 = [v7 clinicalContacts];
    int v289 = 1;
    if (v117 != [v158 count])
    {
      int v255 = 0;
      BOOL v282 = 0;
      int v287 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v288 = 1;
      int v245 = 1;
      int v252 = 1;
      goto LABEL_15;
    }
    int v288 = 1;
  }
  else
  {
    v161 = 0;
    int v288 = 0;
  }
  uint64_t v118 = [(_HKMedicalIDData *)self medicationsList];
  BOOL v282 = v118 == 0;
  v157 = (void *)v118;
  if (v118 || ([v7 medicationsList], (v155 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v160 = [(_HKMedicalIDData *)self medicationsList];
    if (!v160)
    {
      v160 = 0;
      int v254 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v287 = 1;
      goto LABEL_15;
    }
    v156 = [v7 medicationsList];
    if (!v156)
    {
      v156 = 0;
      int v257 = 0;
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v287 = 1;
      int v254 = 1;
      goto LABEL_15;
    }
    v154 = [(_HKMedicalIDData *)self medicationsList];
    uint64_t v119 = [v154 count];
    v153 = [v7 medicationsList];
    int v289 = 1;
    if (v119 != [v153 count])
    {
      int v259 = 0;
      BOOL v286 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v287 = 1;
      int v254 = 1;
      int v257 = 1;
      goto LABEL_15;
    }
    int v287 = 1;
  }
  else
  {
    v155 = 0;
    int v287 = 0;
  }
  uint64_t v120 = [(_HKMedicalIDData *)self medicationsListVersion];
  v151 = [v7 medicationsListVersion];
  v152 = (void *)v120;
  BOOL v286 = v120 != (void)v151;
  if ((void *)v120 != v151)
  {
    v150 = [v7 medicationsListVersion];
    if (!v150)
    {
      v150 = 0;
      int v260 = 0;
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      BOOL v286 = 1;
      goto LABEL_15;
    }
    v121 = [(_HKMedicalIDData *)self medicationsListVersion];
    v145 = [v7 medicationsListVersion];
    v146 = v121;
    if (!objc_msgSend(v121, "isEqual:"))
    {
      int v262 = 0;
      BOOL v281 = 0;
      int v279 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      BOOL v286 = 1;
      int v260 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v122 = [(_HKMedicalIDData *)self allergiesList];
  BOOL v281 = v122 == 0;
  v148 = (void *)v122;
  if (v122 || ([v7 allergiesList], (v144 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v149 = [(_HKMedicalIDData *)self allergiesList];
    if (!v149)
    {
      v149 = 0;
      int v263 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v279 = 1;
      goto LABEL_15;
    }
    v147 = [v7 allergiesList];
    if (!v147)
    {
      v147 = 0;
      int v265 = 0;
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v279 = 1;
      int v263 = 1;
      goto LABEL_15;
    }
    v143 = [(_HKMedicalIDData *)self allergiesList];
    uint64_t v123 = [v143 count];
    v142 = [v7 allergiesList];
    int v289 = 1;
    if (v123 != [v142 count])
    {
      int v267 = 0;
      uint64_t v280 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v273 = 0;
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v279 = 1;
      int v263 = 1;
      int v265 = 1;
      goto LABEL_15;
    }
    int v279 = 1;
  }
  else
  {
    v144 = 0;
    int v279 = 0;
  }
  uint64_t v124 = [(_HKMedicalIDData *)self allergiesListVersion];
  v140 = [v7 allergiesListVersion];
  v141 = (void *)v124;
  LODWORD(v280) = v124 != (void)v140;
  if ((void *)v124 != v140)
  {
    v139 = [v7 allergiesListVersion];
    if (!v139)
    {
      v139 = 0;
      int v269 = 0;
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      uint64_t v280 = 1;
      goto LABEL_15;
    }
    v125 = [(_HKMedicalIDData *)self allergiesListVersion];
    v136 = [v7 allergiesListVersion];
    v137 = v125;
    if (!objc_msgSend(v125, "isEqual:"))
    {
      uint64_t v271 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v277 = 0;
      LODWORD(v278[0]) = 1;
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      uint64_t v280 = 1;
      int v269 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v126 = [(_HKMedicalIDData *)self conditionsList];
  HIDWORD(v280) = v126 == 0;
  v135 = (void *)v126;
  if (v126 || ([v7 conditionsList], (v133 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v138 = [(_HKMedicalIDData *)self conditionsList];
    if (!v138)
    {
      v138 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      int v269 = v280;
      uint64_t v271 = 1;
      int v277 = 1;
      goto LABEL_15;
    }
    v134 = [v7 conditionsList];
    if (!v134)
    {
      v134 = 0;
      int v273 = 0;
      BOOL v13 = 0;
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      int v269 = v280;
      uint64_t v271 = 0x100000001;
      int v277 = 1;
      goto LABEL_15;
    }
    v132 = [(_HKMedicalIDData *)self conditionsList];
    uint64_t v127 = [v132 count];
    v131 = [v7 conditionsList];
    int v289 = 1;
    if (v127 != [v131 count])
    {
      BOOL v13 = 0;
      int v14 = 0;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = v3 != v4;
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v275 = 0;
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      int v269 = v280;
      uint64_t v271 = 0x100000001;
      int v277 = 1;
      int v273 = 1;
      goto LABEL_15;
    }
    int v277 = 1;
  }
  else
  {
    v133 = 0;
    int v277 = 0;
  }
  uint64_t v128 = [(_HKMedicalIDData *)self conditionsListVersion];
  uint64_t v4 = [v7 conditionsListVersion];
  v130 = (void *)v128;
  BOOL v76 = v128 == (void)v4;
  BOOL v13 = v128 != (void)v4;
  if (!v76)
  {
    uint64_t v5 = objc_msgSend(v7, "conditionsListVersion", v130);
    if (!v5)
    {
      int v14 = 0;
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = HIDWORD(v292);
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      int v269 = v280;
      LODWORD(v271) = 1;
      HIDWORD(v271) = v277;
      int v273 = v277;
      int v275 = 1;
      BOOL v13 = 1;
LABEL_15:
      BOOL v21 = 1;
      if (!v14) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    uint64_t v10 = [(_HKMedicalIDData *)self conditionsListVersion];
    uint64_t v3 = [v7 conditionsListVersion];
    if (![(id)v10 isEqual:v3])
    {
      int v289 = 1;
      LODWORD(v278[2]) = 1;
      HIDWORD(v278[2]) = HIDWORD(v292);
      LODWORD(v278[1]) = 1;
      HIDWORD(v278[1]) = v18;
      LODWORD(v278[0]) = 1;
      HIDWORD(v278[0]) = HIDWORD(v299);
      int v276 = DWORD2(v299);
      int v274 = 1;
      int v272 = DWORD1(v299);
      int v270 = 1;
      int v268 = v299;
      int v266 = 1;
      int v264 = v298;
      int v261 = 1;
      int v258 = v297;
      int v256 = 1;
      int v251 = v296;
      int v249 = 1;
      int v241 = v295;
      int v240 = 1;
      int v239 = v294;
      int v253 = 1;
      int v246 = v293;
      int v248 = 1;
      int v243 = v291;
      int v247 = 1;
      int v242 = v290;
      int v244 = v290;
      int v250 = 1;
      int v245 = v288;
      int v252 = v288;
      int v255 = 1;
      int v254 = v287;
      int v257 = v287;
      int v259 = 1;
      int v260 = v286;
      int v262 = 1;
      int v263 = v279;
      int v265 = v279;
      int v267 = 1;
      int v269 = v280;
      LODWORD(v271) = 1;
      HIDWORD(v271) = v277;
      int v273 = v277;
      int v14 = 1;
      int v275 = 1;
      BOOL v13 = 1;
      goto LABEL_15;
    }
  }
  int64_t v129 = [(_HKMedicalIDData *)self schemaVersion];
  BOOL v21 = v129 != [v7 schemaVersion];
  int v289 = 1;
  LODWORD(v278[2]) = 1;
  HIDWORD(v278[2]) = HIDWORD(v292);
  LODWORD(v278[1]) = 1;
  HIDWORD(v278[1]) = v292;
  LODWORD(v278[0]) = 1;
  HIDWORD(v278[0]) = HIDWORD(v299);
  int v276 = DWORD2(v299);
  int v274 = 1;
  int v272 = DWORD1(v299);
  int v270 = 1;
  int v268 = v299;
  int v266 = 1;
  int v264 = v298;
  int v261 = 1;
  int v258 = v297;
  int v256 = 1;
  int v251 = v296;
  int v249 = 1;
  int v241 = v295;
  int v240 = 1;
  int v239 = v294;
  int v253 = 1;
  int v246 = v293;
  int v248 = 1;
  int v243 = v291;
  int v247 = 1;
  int v242 = v290;
  int v244 = v290;
  int v250 = 1;
  int v245 = v288;
  int v252 = v288;
  int v255 = 1;
  int v254 = v287;
  int v257 = v287;
  int v259 = 1;
  int v260 = v286;
  int v262 = 1;
  int v263 = v279;
  int v265 = v279;
  int v267 = 1;
  int v269 = v280;
  LODWORD(v271) = 1;
  HIDWORD(v271) = v277;
  int v273 = v277;
  int v275 = 1;
  if (v13)
  {
LABEL_16:
  }
LABEL_17:
  if (v13) {

  }
  if (v275)
  {
  }
  if (v273)
  {
  }
  if (HIDWORD(v271)) {

  }
  if (v277) {
  if (HIDWORD(v280))
  }

  if (v271) {
  if (v269)
  }
  {
  }
  if (v280) {

  }
  if (v267)
  {
  }
  if (v265)
  {
  }
  if (v263) {

  }
  if (v279) {
  if (v281)
  }

  if (v262) {
  if (v260)
  }
  {
  }
  if (v286) {

  }
  if (v259)
  {
  }
  if (v257)
  {
  }
  if (v254) {

  }
  if (v287) {
  if (v282)
  }

  if (v255) {
  if (v252)
  }
  {
  }
  if (v245) {

  }
  if (v288) {
  if (v283)
  }

  if (v250) {
  if (v244)
  }
  {
  }
  if (v242) {

  }
  if (v290) {
  if (v284)
  }

  if (v247) {
  if (v243)
  }
  {
  }
  if (v291) {

  }
  if (v248)
  {
  }
  if (v246)
  {
  }
  if (v293) {

  }
  if (v253)
  {
  }
  if (v239)
  {
  }
  if (v294) {

  }
  if (v240)
  {
  }
  if (v241)
  {
  }
  if (v295) {

  }
  if (v249)
  {
  }
  if (v251)
  {
  }
  if (v296) {

  }
  if (v256)
  {
  }
  if (v258)
  {
  }
  if (v297) {

  }
  if (v261)
  {
  }
  if (v264)
  {
  }
  if (v298) {

  }
  if (v266)
  {
  }
  if (v268)
  {
  }
  if (v299) {

  }
  if (v270)
  {
  }
  if (v272)
  {
  }
  if (DWORD1(v299)) {

  }
  if (v274)
  {
  }
  if (v276)
  {
  }
  if (DWORD2(v299)) {

  }
  if (LODWORD(v278[0]))
  {
  }
  if (HIDWORD(v278[0]))
  {
  }
  if (HIDWORD(v299)) {

  }
  if (LODWORD(v278[1]))
  {
  }
  if (HIDWORD(v278[1]))
  {
  }
  if (v292) {

  }
  if (LODWORD(v278[2]))
  {
  }
  if (HIDWORD(v278[2]))
  {
  }
  if (HIDWORD(v292)) {

  }
  if (v289)
  {
  }
  if (v285)
  {
  }
  if (v8 != v9) {

  }
  if (v21)
  {
LABEL_166:
    char v22 = 0;
    goto LABEL_167;
  }
  v24 = [(_HKMedicalIDData *)self emergencyContacts];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    unint64_t v26 = 0;
    do
    {
      uint64_t v27 = [(_HKMedicalIDData *)self emergencyContacts];
      v28 = [v27 objectAtIndexedSubscript:v26];
      uint64_t v29 = [v7 emergencyContacts];
      BOOL v30 = [v29 objectAtIndexedSubscript:v26];
      char v31 = [v28 isEqualToSyncedContact:v30];

      if ((v31 & 1) == 0) {
        goto LABEL_166;
      }
      ++v26;
      v32 = [(_HKMedicalIDData *)self emergencyContacts];
      unint64_t v33 = [v32 count];
    }
    while (v26 < v33);
  }
  uint64_t v34 = [(_HKMedicalIDData *)self clinicalContacts];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    unint64_t v36 = 0;
    do
    {
      BOOL v37 = [(_HKMedicalIDData *)self clinicalContacts];
      uint64_t v38 = [v37 objectAtIndexedSubscript:v36];
      v39 = [v7 clinicalContacts];
      uint64_t v40 = [v39 objectAtIndexedSubscript:v36];
      char v41 = [v38 isEqualToSyncedContact:v40];

      if ((v41 & 1) == 0) {
        goto LABEL_166;
      }
      ++v36;
      v42 = [(_HKMedicalIDData *)self clinicalContacts];
      unint64_t v43 = [v42 count];
    }
    while (v36 < v43);
  }
  uint64_t v44 = [(_HKMedicalIDData *)self medicationsList];
  uint64_t v45 = [v44 count];

  if (v45)
  {
    unint64_t v46 = 0;
    do
    {
      uint64_t v47 = [(_HKMedicalIDData *)self medicationsList];
      uint64_t v48 = [v47 objectAtIndexedSubscript:v46];
      uint64_t v49 = [v7 medicationsList];
      uint64_t v50 = [v49 objectAtIndexedSubscript:v46];
      char v51 = [v48 isEqualToSyncedData:v50];

      if ((v51 & 1) == 0) {
        goto LABEL_166;
      }
      ++v46;
      uint64_t v52 = [(_HKMedicalIDData *)self medicationsList];
      unint64_t v53 = [v52 count];
    }
    while (v46 < v53);
  }
  v54 = [(_HKMedicalIDData *)self allergiesList];
  uint64_t v55 = [v54 count];

  if (v55)
  {
    unint64_t v56 = 0;
    do
    {
      v57 = [(_HKMedicalIDData *)self allergiesList];
      uint64_t v58 = [v57 objectAtIndexedSubscript:v56];
      uint64_t v59 = [v7 allergiesList];
      uint64_t v60 = [v59 objectAtIndexedSubscript:v56];
      char v61 = [v58 isEqualToSyncedData:v60];

      if ((v61 & 1) == 0) {
        goto LABEL_166;
      }
      ++v56;
      uint64_t v62 = [(_HKMedicalIDData *)self allergiesList];
      unint64_t v63 = [v62 count];
    }
    while (v56 < v63);
  }
  int v64 = [(_HKMedicalIDData *)self conditionsList];
  uint64_t v65 = [v64 count];

  if (v65)
  {
    unint64_t v66 = 0;
    do
    {
      BOOL v67 = [(_HKMedicalIDData *)self conditionsList];
      int v68 = [v67 objectAtIndexedSubscript:v66];
      int v69 = [v7 conditionsList];
      v70 = [v69 objectAtIndexedSubscript:v66];
      char v22 = [v68 isEqualToSyncedData:v70];

      if ((v22 & 1) == 0) {
        break;
      }
      ++v66;
      v71 = [(_HKMedicalIDData *)self conditionsList];
      unint64_t v72 = [v71 count];
    }
    while (v66 < v72);
  }
  else
  {
    char v22 = 1;
  }
LABEL_167:

  return v22;
}

- (void)setGregorianBirthday:(id)a3
{
  id v5 = a3;
  id v12 = v5;
  if (v5)
  {
    id v6 = [v5 calendar];
    id v7 = [v6 calendarIdentifier];
    char v8 = [v7 isEqualToString:*MEMORY[0x1E4F1C318]];

    if ((v8 & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"_HKMedicalIDData.m" lineNumber:642 description:@"Only date components with a gregorian calendar attached is accepted"];
    }
    uint64_t v9 = [(_HKMedicalIDData *)self _gregorianUtcCalendar];
    uint64_t v10 = [v9 dateFromComponents:v12];

    [(_HKMedicalIDData *)self setGmtBirthdate:v10];
    [(_HKMedicalIDData *)self setBirthdate:v10];
  }
  else
  {
    [(_HKMedicalIDData *)self setGmtBirthdate:0];
  }
}

- (NSDateComponents)gregorianBirthday
{
  if (self->_gmtBirthdate)
  {
    uint64_t v3 = [(_HKMedicalIDData *)self _gregorianUtcCalendar];
    uint64_t v4 = objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", self->_gmtBirthdate);

    id v5 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    [v4 setCalendar:v5];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDateComponents *)v4;
}

- (NSDate)dateSaved
{
  if ([(_HKMedicalIDData *)self hasAnyModificationDate])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = v3;
    if (self->_isDisabledModifiedDate) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_shareDuringEmergencyModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_pictureDataModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_nameModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_gregorianBirthdayModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_primaryLanguageCodeModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_heightModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_weightModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_bloodTypeModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_isOrganDonorModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_emergencyContactsModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_clinicalContactsModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_medicalConditionsModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_medicalNotesModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_allergyInfoModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_medicationInfoModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_pregnancyStartDateModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_pregnancyEstimatedDueDateModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_medicationsListModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_medicationsListVersionModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_allergiesListModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_allergiesListVersionModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_conditionsListModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_conditionsListVersionModifiedDate) {
      objc_msgSend(v4, "addObject:");
    }
    objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_mostRecentDate:", v4);
    id v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    legacyDateSaved = self->_legacyDateSaved;
    self->_legacyDateSaved = v5;
  }
  id v7 = self->_legacyDateSaved;

  return v7;
}

- (void)setDateSaved:(id)a3
{
}

- (BOOL)hasAnyModificationDate
{
  return self->_isDisabledModifiedDate
      || self->_shareDuringEmergencyModifiedDate
      || self->_pictureDataModifiedDate
      || self->_nameModifiedDate
      || self->_gregorianBirthdayModifiedDate
      || self->_primaryLanguageCodeModifiedDate
      || self->_heightModifiedDate
      || self->_weightModifiedDate
      || self->_bloodTypeModifiedDate
      || self->_isOrganDonorModifiedDate
      || self->_emergencyContactsModifiedDate
      || self->_clinicalContactsModifiedDate
      || self->_medicalConditionsModifiedDate
      || self->_medicalNotesModifiedDate
      || self->_allergyInfoModifiedDate
      || self->_medicationInfoModifiedDate
      || self->_pregnancyStartDateModifiedDate
      || self->_pregnancyEstimatedDueDateModifiedDate
      || self->_medicationsListModifiedDate
      || self->_medicationsListVersionModifiedDate
      || self->_allergiesListModifiedDate
      || self->_allergiesListVersionModifiedDate
      || self->_conditionsListModifiedDate
      || self->_conditionsListVersionModifiedDate != 0;
}

- (BOOL)hasAnyData
{
  if (self->_isDisabled) {
    return 0;
  }
  else {
    return ![(_HKMedicalIDData *)self isEmpty];
  }
}

- (BOOL)isEmpty
{
  return !self->_pictureData
      && ![(NSString *)self->_name length]
      && !self->_gmtBirthdate
      && ![(NSString *)self->_primaryLanguageCode length]
      && !self->_height
      && !self->_weight
      && !self->_bloodType
      && !self->_isOrganDonor
      && ![(NSArray *)self->_emergencyContacts count]
      && ![(NSArray *)self->_clinicalContacts count]
      && ![(NSString *)self->_medicalConditions length]
      && ![(NSString *)self->_medicalNotes length]
      && ![(NSString *)self->_allergyInfo length]
      && ![(NSString *)self->_medicationInfo length]
      && !self->_pregnancyStartDate
      && !self->_pregnancyEstimatedDueDate
      && ![(NSArray *)self->_medicationsList count]
      && !self->_medicationsListVersion
      && ![(NSArray *)self->_allergiesList count]
      && !self->_allergiesListVersion
      && ![(NSArray *)self->_conditionsList count]
      && self->_conditionsListVersion == 0;
}

- (void)setModificationDatesForUpdatedFieldsWithMedicalIDData:(id)a3
{
  id v5 = a3;
  id v214 = v5;
  if (v5)
  {
    int isDisabled = self->_isDisabled;
    if (isDisabled != [v5 isDisabled])
    {
      id v7 = [MEMORY[0x1E4F1C9C8] date];
      isDisabledModifiedDate = self->_isDisabledModifiedDate;
      self->_isDisabledModifiedDate = v7;
    }
    int shareDuringEmergency = self->_shareDuringEmergency;
    if (shareDuringEmergency == [v214 shareDuringEmergency]) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = self->_isDisabledModifiedDate;
    self->_isDisabledModifiedDate = v10;
  }
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  shareDuringEmergencyModifiedDate = self->_shareDuringEmergencyModifiedDate;
  self->_shareDuringEmergencyModifiedDate = v12;

  if (!v214)
  {
    BOOL v21 = [MEMORY[0x1E4F1C9C8] date];
    pictureDataModifiedDate = self->_pictureDataModifiedDate;
    self->_pictureDataModifiedDate = v21;
    goto LABEL_20;
  }
LABEL_8:
  pictureData = self->_pictureData;
  uint64_t v15 = [v214 pictureData];
  if (pictureData == (void *)v15)
  {
LABEL_15:

    goto LABEL_16;
  }
  BOOL v16 = (void *)v15;
  uint64_t v17 = [v214 pictureData];
  if (!v17)
  {

    goto LABEL_14;
  }
  BOOL v18 = (void *)v17;
  uint64_t v19 = self->_pictureData;
  uint64_t v20 = [v214 pictureData];
  uint64_t v3 = [(NSData *)v19 isEqual:v20];

  if ((v3 & 1) == 0)
  {
LABEL_14:
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
    pictureData = self->_pictureDataModifiedDate;
    self->_pictureDataModifiedDate = v23;
    goto LABEL_15;
  }
LABEL_16:
  name = self->_name;
  uint64_t v25 = [v214 name];
  if (name == (NSString *)v25)
  {

    goto LABEL_24;
  }
  pictureDataModifiedDate = (NSDate *)v25;
  uint64_t v26 = [v214 name];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    v28 = self->_name;
    uint64_t v29 = [v214 name];
    uint64_t v3 = [(NSString *)v28 isEqualToString:v29];

    if (v3) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_20:

LABEL_21:
  BOOL v30 = [MEMORY[0x1E4F1C9C8] date];
  nameModifiedDate = self->_nameModifiedDate;
  self->_nameModifiedDate = v30;

  if (!v214)
  {
    v32 = [MEMORY[0x1E4F1C9C8] date];
    gregorianBirthdayModifiedDate = self->_gregorianBirthdayModifiedDate;
    self->_gregorianBirthdayModifiedDate = v32;
    goto LABEL_36;
  }
LABEL_24:
  uint64_t v34 = [(_HKMedicalIDData *)self gregorianBirthday];
  uint64_t v35 = [v214 gregorianBirthday];
  if (v34 == (void *)v35)
  {

LABEL_31:
    goto LABEL_32;
  }
  unint64_t v36 = (void *)v35;
  uint64_t v37 = [v214 gregorianBirthday];
  if (!v37)
  {

    goto LABEL_30;
  }
  uint64_t v3 = v37;
  uint64_t v38 = [(_HKMedicalIDData *)self gregorianBirthday];
  v39 = [v214 gregorianBirthday];
  char v40 = [v38 isEqual:v39];

  if ((v40 & 1) == 0)
  {
LABEL_30:
    char v41 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v34 = self->_gregorianBirthdayModifiedDate;
    self->_gregorianBirthdayModifiedDate = v41;
    goto LABEL_31;
  }
LABEL_32:
  primaryLanguageCode = self->_primaryLanguageCode;
  uint64_t v43 = [v214 primaryLanguageCode];
  if (primaryLanguageCode == (NSString *)v43)
  {

    uint64_t v48 = v214;
    goto LABEL_40;
  }
  gregorianBirthdayModifiedDate = (NSDate *)v43;
  uint64_t v44 = [v214 primaryLanguageCode];
  if (v44)
  {
    uint64_t v45 = (void *)v44;
    unint64_t v46 = self->_primaryLanguageCode;
    uint64_t v47 = [v214 primaryLanguageCode];
    uint64_t v3 = [(NSString *)v46 isEqualToString:v47];

    uint64_t v48 = v214;
    if (v3) {
      goto LABEL_40;
    }
    goto LABEL_37;
  }
LABEL_36:

LABEL_37:
  uint64_t v49 = [MEMORY[0x1E4F1C9C8] date];
  primaryLanguageCodeModifiedDate = self->_primaryLanguageCodeModifiedDate;
  self->_primaryLanguageCodeModifiedDate = v49;

  uint64_t v48 = v214;
  if (!v214)
  {
    char v51 = [MEMORY[0x1E4F1C9C8] date];
    heightModifiedDate = self->_heightModifiedDate;
    self->_heightModifiedDate = v51;
    goto LABEL_51;
  }
LABEL_40:
  height = self->_height;
  uint64_t v54 = [v48 height];
  if (height == (void *)v54)
  {
LABEL_46:

    goto LABEL_47;
  }
  uint64_t v55 = (void *)v54;
  uint64_t v56 = [v214 height];
  if (!v56)
  {

    goto LABEL_45;
  }
  v57 = (void *)v56;
  uint64_t v58 = self->_height;
  uint64_t v59 = [v214 height];
  uint64_t v3 = [(HKQuantity *)v58 isEqual:v59];

  if ((v3 & 1) == 0)
  {
LABEL_45:
    uint64_t v60 = [MEMORY[0x1E4F1C9C8] date];
    height = self->_heightModifiedDate;
    self->_heightModifiedDate = v60;
    goto LABEL_46;
  }
LABEL_47:
  weight = self->_weight;
  uint64_t v62 = [v214 weight];
  if (weight == (HKQuantity *)v62)
  {

    BOOL v67 = v214;
    goto LABEL_55;
  }
  heightModifiedDate = (NSDate *)v62;
  uint64_t v63 = [v214 weight];
  if (v63)
  {
    int v64 = (void *)v63;
    uint64_t v65 = self->_weight;
    unint64_t v66 = [v214 weight];
    uint64_t v3 = [(HKQuantity *)v65 isEqual:v66];

    BOOL v67 = v214;
    if (v3) {
      goto LABEL_55;
    }
    goto LABEL_52;
  }
LABEL_51:

LABEL_52:
  int v68 = [MEMORY[0x1E4F1C9C8] date];
  weightModifiedDate = self->_weightModifiedDate;
  self->_weightModifiedDate = v68;

  BOOL v67 = v214;
  if (!v214)
  {
    v70 = [MEMORY[0x1E4F1C9C8] date];
    bloodTypeModifiedDate = self->_bloodTypeModifiedDate;
    self->_bloodTypeModifiedDate = v70;
    goto LABEL_61;
  }
LABEL_55:
  int64_t bloodType = self->_bloodType;
  if (bloodType != [v67 bloodType])
  {
    uint64_t v73 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v74 = self->_bloodTypeModifiedDate;
    self->_bloodTypeModifiedDate = v73;
  }
  isOrganDonor = self->_isOrganDonor;
  uint64_t v76 = [v214 isOrganDonor];
  if (isOrganDonor == (NSNumber *)v76)
  {

    uint64_t v81 = v214;
    goto LABEL_65;
  }
  bloodTypeModifiedDate = (NSDate *)v76;
  uint64_t v77 = [v214 isOrganDonor];
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    v79 = self->_isOrganDonor;
    uint64_t v80 = [v214 isOrganDonor];
    uint64_t v3 = [(NSNumber *)v79 isEqual:v80];

    uint64_t v81 = v214;
    if (v3) {
      goto LABEL_65;
    }
    goto LABEL_62;
  }
LABEL_61:

LABEL_62:
  uint64_t v82 = [MEMORY[0x1E4F1C9C8] date];
  isOrganDonorModifiedDate = self->_isOrganDonorModifiedDate;
  self->_isOrganDonorModifiedDate = v82;

  uint64_t v81 = v214;
  if (!v214)
  {
    v84 = [MEMORY[0x1E4F1C9C8] date];
    emergencyContactsModifiedDate = self->_emergencyContactsModifiedDate;
    self->_emergencyContactsModifiedDate = v84;
    goto LABEL_90;
  }
LABEL_65:
  emergencyContacts = self->_emergencyContacts;
  uint64_t v87 = [v81 emergencyContacts];
  if (emergencyContacts == (NSArray *)v87)
  {
    uint64_t v88 = (NSDate *)emergencyContacts;
    goto LABEL_79;
  }
  uint64_t v88 = (NSDate *)v87;
  uint64_t v89 = [v214 emergencyContacts];
  uint64_t v90 = self->_emergencyContacts;
  if (!v89)
  {
    if ([(NSArray *)self->_emergencyContacts count])
    {
LABEL_74:

LABEL_78:
      uint64_t v93 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v88 = self->_emergencyContactsModifiedDate;
      self->_emergencyContactsModifiedDate = v93;
      goto LABEL_79;
    }
LABEL_75:
    uint64_t v91 = [v214 emergencyContacts];
    uint64_t v92 = [v91 count];

    if (v89)
    {
    }
    if (!v92) {
      goto LABEL_80;
    }
    goto LABEL_78;
  }
  uint64_t v3 = [v214 emergencyContacts];
  if (![(NSArray *)v90 isEqual:v3])
  {
    if ([(NSArray *)self->_emergencyContacts count])
    {

      goto LABEL_74;
    }
    goto LABEL_75;
  }

LABEL_79:
LABEL_80:
  clinicalContacts = self->_clinicalContacts;
  uint64_t v95 = [v214 clinicalContacts];
  if (clinicalContacts == (NSArray *)v95)
  {
    emergencyContactsModifiedDate = (NSDate *)clinicalContacts;
    goto LABEL_85;
  }
  emergencyContactsModifiedDate = (NSDate *)v95;
  v96 = [v214 clinicalContacts];
  uint64_t v97 = self->_clinicalContacts;
  if (v96)
  {
    uint64_t v3 = [v214 clinicalContacts];
    if ([(NSArray *)v97 isEqual:v3])
    {

LABEL_85:
      goto LABEL_92;
    }
    if ([(NSArray *)self->_clinicalContacts count])
    {

      goto LABEL_90;
    }
LABEL_148:
    v164 = [v214 clinicalContacts];
    uint64_t v165 = [v164 count];

    if (v96)
    {
    }
    if (!v165) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
  if (![(NSArray *)self->_clinicalContacts count]) {
    goto LABEL_148;
  }
LABEL_90:

LABEL_91:
  uint64_t v98 = [MEMORY[0x1E4F1C9C8] date];
  clinicalContactsModifiedDate = self->_clinicalContactsModifiedDate;
  self->_clinicalContactsModifiedDate = v98;

  if (!v214)
  {
    int v107 = [MEMORY[0x1E4F1C9C8] date];
    medicalConditionsModifiedDate = self->_medicalConditionsModifiedDate;
    self->_medicalConditionsModifiedDate = v107;
    goto LABEL_104;
  }
LABEL_92:
  medicalConditions = (NSDate *)self->_medicalConditions;
  uint64_t v101 = [v214 medicalConditions];
  if (medicalConditions == (NSDate *)v101)
  {
LABEL_99:

    goto LABEL_100;
  }
  v102 = (void *)v101;
  uint64_t v103 = [v214 medicalConditions];
  if (!v103)
  {

    goto LABEL_98;
  }
  uint64_t v104 = (void *)v103;
  v105 = self->_medicalConditions;
  int v106 = [v214 medicalConditions];
  uint64_t v3 = [(NSString *)v105 isEqualToString:v106];

  if ((v3 & 1) == 0)
  {
LABEL_98:
    int64_t v109 = [MEMORY[0x1E4F1C9C8] date];
    medicalConditions = self->_medicalConditionsModifiedDate;
    self->_medicalConditionsModifiedDate = v109;
    goto LABEL_99;
  }
LABEL_100:
  medicalNotes = self->_medicalNotes;
  uint64_t v111 = [v214 medicalNotes];
  if (medicalNotes == (NSString *)v111)
  {

    uint64_t v116 = v214;
    goto LABEL_108;
  }
  medicalConditionsModifiedDate = (NSDate *)v111;
  uint64_t v112 = [v214 medicalNotes];
  if (v112)
  {
    v113 = (void *)v112;
    uint64_t v114 = self->_medicalNotes;
    uint64_t v115 = [v214 medicalNotes];
    uint64_t v3 = [(NSString *)v114 isEqualToString:v115];

    uint64_t v116 = v214;
    if (v3) {
      goto LABEL_108;
    }
    goto LABEL_105;
  }
LABEL_104:

LABEL_105:
  uint64_t v117 = [MEMORY[0x1E4F1C9C8] date];
  medicalNotesModifiedDate = self->_medicalNotesModifiedDate;
  self->_medicalNotesModifiedDate = v117;

  uint64_t v116 = v214;
  if (!v214)
  {
    uint64_t v119 = [MEMORY[0x1E4F1C9C8] date];
    allergyInfoModifiedDate = self->_allergyInfoModifiedDate;
    self->_allergyInfoModifiedDate = v119;
    goto LABEL_119;
  }
LABEL_108:
  allergyInfo = (NSDate *)self->_allergyInfo;
  uint64_t v122 = [v116 allergyInfo];
  if (allergyInfo == (NSDate *)v122)
  {
LABEL_114:

    goto LABEL_115;
  }
  uint64_t v123 = (void *)v122;
  uint64_t v124 = [v214 allergyInfo];
  if (!v124)
  {

    goto LABEL_113;
  }
  v125 = (void *)v124;
  uint64_t v126 = self->_allergyInfo;
  uint64_t v127 = [v214 allergyInfo];
  uint64_t v3 = [(NSString *)v126 isEqualToString:v127];

  if ((v3 & 1) == 0)
  {
LABEL_113:
    uint64_t v128 = [MEMORY[0x1E4F1C9C8] date];
    allergyInfo = self->_allergyInfoModifiedDate;
    self->_allergyInfoModifiedDate = v128;
    goto LABEL_114;
  }
LABEL_115:
  medicationInfo = self->_medicationInfo;
  uint64_t v130 = [v214 medicationInfo];
  if (medicationInfo == (NSString *)v130)
  {

    v135 = v214;
    goto LABEL_123;
  }
  allergyInfoModifiedDate = (NSDate *)v130;
  uint64_t v131 = [v214 medicationInfo];
  if (v131)
  {
    v132 = (void *)v131;
    v133 = self->_medicationInfo;
    v134 = [v214 medicationInfo];
    uint64_t v3 = [(NSString *)v133 isEqualToString:v134];

    v135 = v214;
    if (v3) {
      goto LABEL_123;
    }
    goto LABEL_120;
  }
LABEL_119:

LABEL_120:
  v136 = [MEMORY[0x1E4F1C9C8] date];
  medicationInfoModifiedDate = self->_medicationInfoModifiedDate;
  self->_medicationInfoModifiedDate = v136;

  v135 = v214;
  if (!v214)
  {
    v138 = [MEMORY[0x1E4F1C9C8] date];
    pregnancyStartDateModifiedDate = self->_pregnancyStartDateModifiedDate;
    self->_pregnancyStartDateModifiedDate = v138;
    goto LABEL_134;
  }
LABEL_123:
  pregnancyStartDate = self->_pregnancyStartDate;
  uint64_t v141 = [v135 pregnancyStartDate];
  if (pregnancyStartDate == (NSDate *)v141)
  {
LABEL_129:

    goto LABEL_130;
  }
  v142 = (void *)v141;
  uint64_t v143 = [v214 pregnancyStartDate];
  if (!v143)
  {

    goto LABEL_128;
  }
  v144 = (void *)v143;
  v145 = self->_pregnancyStartDate;
  v146 = [v214 pregnancyStartDate];
  uint64_t v3 = [(NSDate *)v145 isEqual:v146];

  if ((v3 & 1) == 0)
  {
LABEL_128:
    v147 = [MEMORY[0x1E4F1C9C8] date];
    pregnancyStartDate = self->_pregnancyStartDateModifiedDate;
    self->_pregnancyStartDateModifiedDate = v147;
    goto LABEL_129;
  }
LABEL_130:
  pregnancyEstimatedDueDate = self->_pregnancyEstimatedDueDate;
  uint64_t v149 = [v214 pregnancyEstimatedDueDate];
  if (pregnancyEstimatedDueDate == (NSDate *)v149)
  {

    v154 = v214;
    goto LABEL_138;
  }
  pregnancyStartDateModifiedDate = (NSDate *)v149;
  uint64_t v150 = [v214 pregnancyEstimatedDueDate];
  if (v150)
  {
    v151 = (void *)v150;
    v152 = self->_pregnancyEstimatedDueDate;
    v153 = [v214 pregnancyEstimatedDueDate];
    uint64_t v3 = [(NSDate *)v152 isEqual:v153];

    v154 = v214;
    if (v3) {
      goto LABEL_138;
    }
    goto LABEL_135;
  }
LABEL_134:

LABEL_135:
  v155 = [MEMORY[0x1E4F1C9C8] date];
  pregnancyEstimatedDueDateModifiedDate = self->_pregnancyEstimatedDueDateModifiedDate;
  self->_pregnancyEstimatedDueDateModifiedDate = v155;

  v154 = v214;
  if (!v214)
  {
    v157 = [MEMORY[0x1E4F1C9C8] date];
    medicationsListModifiedDate = self->_medicationsListModifiedDate;
    self->_medicationsListModifiedDate = v157;
    goto LABEL_161;
  }
LABEL_138:
  medicationsList = self->_medicationsList;
  uint64_t v160 = [v154 medicationsList];
  if (medicationsList == (NSArray *)v160)
  {
    v161 = (NSDate *)medicationsList;
    goto LABEL_156;
  }
  v161 = (NSDate *)v160;
  v162 = [v214 medicationsList];
  v163 = self->_medicationsList;
  if (v162)
  {
    uint64_t v3 = [v214 medicationsList];
    if ([(NSArray *)v163 isEqual:v3])
    {

LABEL_156:
      goto LABEL_157;
    }
    if ([(NSArray *)self->_medicationsList count])
    {

      goto LABEL_147;
    }
  }
  else if ([(NSArray *)self->_medicationsList count])
  {
LABEL_147:

LABEL_155:
    v168 = [MEMORY[0x1E4F1C9C8] date];
    v161 = self->_medicationsListModifiedDate;
    self->_medicationsListModifiedDate = v168;
    goto LABEL_156;
  }
  v166 = [v214 medicationsList];
  uint64_t v167 = [v166 count];

  if (v162)
  {
  }
  if (v167) {
    goto LABEL_155;
  }
LABEL_157:
  medicationsListVersion = self->_medicationsListVersion;
  uint64_t v170 = [v214 medicationsListVersion];
  if (medicationsListVersion == (NSNumber *)v170)
  {

    v175 = v214;
    goto LABEL_165;
  }
  medicationsListModifiedDate = (NSDate *)v170;
  uint64_t v171 = [v214 medicationsListVersion];
  if (v171)
  {
    v172 = (void *)v171;
    v173 = self->_medicationsListVersion;
    v174 = [v214 medicationsListVersion];
    uint64_t v3 = [(NSNumber *)v173 isEqual:v174];

    v175 = v214;
    if (v3) {
      goto LABEL_165;
    }
    goto LABEL_162;
  }
LABEL_161:

LABEL_162:
  v176 = [MEMORY[0x1E4F1C9C8] date];
  medicationsListVersionModifiedDate = self->_medicationsListVersionModifiedDate;
  self->_medicationsListVersionModifiedDate = v176;

  v175 = v214;
  if (!v214)
  {
    v178 = [MEMORY[0x1E4F1C9C8] date];
    allergiesListModifiedDate = self->_allergiesListModifiedDate;
    self->_allergiesListModifiedDate = v178;
    goto LABEL_184;
  }
LABEL_165:
  allergiesList = self->_allergiesList;
  uint64_t v181 = [v175 allergiesList];
  if (allergiesList == (NSArray *)v181)
  {
    v182 = (NSDate *)allergiesList;
    goto LABEL_179;
  }
  v182 = (NSDate *)v181;
  v183 = [v214 allergiesList];
  v184 = self->_allergiesList;
  if (v183)
  {
    uint64_t v3 = [v214 allergiesList];
    if ([(NSArray *)v184 isEqual:v3])
    {

LABEL_179:
      goto LABEL_180;
    }
    if ([(NSArray *)self->_allergiesList count])
    {

      goto LABEL_174;
    }
  }
  else if ([(NSArray *)self->_allergiesList count])
  {
LABEL_174:

LABEL_178:
    v187 = [MEMORY[0x1E4F1C9C8] date];
    v182 = self->_allergiesListModifiedDate;
    self->_allergiesListModifiedDate = v187;
    goto LABEL_179;
  }
  v185 = [v214 allergiesList];
  uint64_t v186 = [v185 count];

  if (v183)
  {
  }
  if (v186) {
    goto LABEL_178;
  }
LABEL_180:
  allergiesListVersion = self->_allergiesListVersion;
  uint64_t v189 = [v214 allergiesListVersion];
  if (allergiesListVersion == (NSNumber *)v189)
  {

    v194 = v214;
    goto LABEL_188;
  }
  allergiesListModifiedDate = (NSDate *)v189;
  uint64_t v190 = [v214 allergiesListVersion];
  if (v190)
  {
    v191 = (void *)v190;
    v192 = self->_allergiesListVersion;
    v193 = [v214 allergiesListVersion];
    uint64_t v3 = [(NSNumber *)v192 isEqual:v193];

    v194 = v214;
    if (v3) {
      goto LABEL_188;
    }
    goto LABEL_185;
  }
LABEL_184:

LABEL_185:
  v195 = [MEMORY[0x1E4F1C9C8] date];
  allergiesListVersionModifiedDate = self->_allergiesListVersionModifiedDate;
  self->_allergiesListVersionModifiedDate = v195;

  v194 = v214;
  if (!v214)
  {
    v197 = [MEMORY[0x1E4F1C9C8] date];
    conditionsListModifiedDate = self->_conditionsListModifiedDate;
    self->_conditionsListModifiedDate = v197;
LABEL_207:

    goto LABEL_208;
  }
LABEL_188:
  conditionsList = self->_conditionsList;
  uint64_t v200 = [v194 conditionsList];
  if (conditionsList == (NSArray *)v200)
  {
    v201 = (NSDate *)conditionsList;
    goto LABEL_202;
  }
  v201 = (NSDate *)v200;
  v202 = [v214 conditionsList];
  v203 = self->_conditionsList;
  if (v202)
  {
    uint64_t v3 = [v214 conditionsList];
    if ([(NSArray *)v203 isEqual:v3])
    {

LABEL_202:
      goto LABEL_203;
    }
    if ([(NSArray *)self->_conditionsList count])
    {

      goto LABEL_197;
    }
  }
  else if ([(NSArray *)self->_conditionsList count])
  {
LABEL_197:

LABEL_201:
    v206 = [MEMORY[0x1E4F1C9C8] date];
    v201 = self->_conditionsListModifiedDate;
    self->_conditionsListModifiedDate = v206;
    goto LABEL_202;
  }
  v204 = [v214 conditionsList];
  uint64_t v205 = [v204 count];

  if (v202)
  {
  }
  if (v205) {
    goto LABEL_201;
  }
LABEL_203:
  conditionsListVersion = self->_conditionsListVersion;
  uint64_t v208 = [v214 conditionsListVersion];
  if (conditionsListVersion == (void *)v208)
  {
LABEL_209:

    goto LABEL_210;
  }
  conditionsListModifiedDate = (NSDate *)v208;
  uint64_t v209 = [v214 conditionsListVersion];
  if (!v209) {
    goto LABEL_207;
  }
  v210 = (void *)v209;
  int v211 = self->_conditionsListVersion;
  int v212 = [v214 conditionsListVersion];
  LOBYTE(v211) = [(NSNumber *)v211 isEqual:v212];

  if ((v211 & 1) == 0)
  {
LABEL_208:
    int v213 = [MEMORY[0x1E4F1C9C8] date];
    conditionsListVersion = self->_conditionsListVersionModifiedDate;
    self->_conditionsListVersionModifiedDate = v213;
    goto LABEL_209;
  }
LABEL_210:
}

- (void)setModificationDatesToCurrentDate
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  objc_storeStrong((id *)&self->_isDisabledModifiedDate, v3);
  objc_storeStrong((id *)&self->_shareDuringEmergencyModifiedDate, v3);
  objc_storeStrong((id *)&self->_pictureDataModifiedDate, v3);
  objc_storeStrong((id *)&self->_nameModifiedDate, v3);
  objc_storeStrong((id *)&self->_gregorianBirthdayModifiedDate, v3);
  objc_storeStrong((id *)&self->_primaryLanguageCodeModifiedDate, v3);
  objc_storeStrong((id *)&self->_heightModifiedDate, v3);
  objc_storeStrong((id *)&self->_weightModifiedDate, v3);
  objc_storeStrong((id *)&self->_bloodTypeModifiedDate, v3);
  objc_storeStrong((id *)&self->_isOrganDonorModifiedDate, v3);
  objc_storeStrong((id *)&self->_emergencyContactsModifiedDate, v3);
  objc_storeStrong((id *)&self->_clinicalContactsModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicalConditionsModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicalNotesModifiedDate, v3);
  objc_storeStrong((id *)&self->_allergyInfoModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicationInfoModifiedDate, v3);
  objc_storeStrong((id *)&self->_pregnancyStartDateModifiedDate, v3);
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDateModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicationsListModifiedDate, v3);
  objc_storeStrong((id *)&self->_medicationsListVersionModifiedDate, v3);
  objc_storeStrong((id *)&self->_allergiesListModifiedDate, v3);
  objc_storeStrong((id *)&self->_allergiesListVersionModifiedDate, v3);
  objc_storeStrong((id *)&self->_conditionsListModifiedDate, v3);
  conditionsListVersionModifiedDate = self->_conditionsListVersionModifiedDate;
  self->_conditionsListVersionModifiedDate = v3;
}

- (id)_gregorianUtcCalendar
{
  if (_gregorianUtcCalendar_onceToken != -1) {
    dispatch_once(&_gregorianUtcCalendar_onceToken, &__block_literal_global_96);
  }
  v2 = (void *)_gregorianUtcCalendar__calendar;

  return v2;
}

- (id)merge:(id)a3
{
  uint64_t v4 = (_HKMedicalIDData *)a3;
  id v5 = objc_alloc_init(_HKMedicalIDData);
  id v6 = [(_HKMedicalIDData *)self isDisabledModifiedDate];
  if (v6)
  {
  }
  else
  {
    id v7 = [(_HKMedicalIDData *)v4 isDisabledModifiedDate];

    if (!v7)
    {
      BOOL v21 = [(_HKMedicalIDData *)self isDisabled];
      if (v21 != [(_HKMedicalIDData *)v4 isDisabled])
      {
        _HKInitializeLogging();
        uint64_t v20 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.68();
        }
        goto LABEL_15;
      }
LABEL_16:
      BOOL v19 = [(_HKMedicalIDData *)self isDisabled];
      goto LABEL_17;
    }
  }
  char v8 = [(_HKMedicalIDData *)self isDisabledModifiedDate];

  if (!v8)
  {
LABEL_7:
    uint64_t v13 = [(_HKMedicalIDData *)v4 isDisabled];
    int v14 = self;
    [v14 setIsDisabled:v13];

    uint64_t v15 = v4;
    goto LABEL_18;
  }
  uint64_t v9 = [(_HKMedicalIDData *)v4 isDisabledModifiedDate];

  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = [(_HKMedicalIDData *)self isDisabledModifiedDate];
  uint64_t v11 = [(_HKMedicalIDData *)v4 isDisabledModifiedDate];
  int v12 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

  if (v12) {
    goto LABEL_7;
  }
  BOOL v16 = [(_HKMedicalIDData *)self isDisabledModifiedDate];
  uint64_t v17 = [(_HKMedicalIDData *)v4 isDisabledModifiedDate];
  int v18 = objc_msgSend(v16, "hk_isAfterDate:", v17);

  BOOL v19 = [(_HKMedicalIDData *)self isDisabled];
  if (!v18)
  {
    if (v19 != [(_HKMedicalIDData *)v4 isDisabled])
    {
      _HKInitializeLogging();
      uint64_t v20 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_HKMedicalIDData merge:].cold.69();
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  char v22 = self;
  [v22 setIsDisabled:v19];

  uint64_t v15 = self;
LABEL_18:
  uint64_t v23 = [(_HKMedicalIDData *)v15 isDisabledModifiedDate];
  v24 = self;
  [v24 setIsDisabledModifiedDate:v23];

  uint64_t v25 = [(_HKMedicalIDData *)self shareDuringEmergencyModifiedDate];
  if (v25)
  {
  }
  else
  {
    uint64_t v26 = [(_HKMedicalIDData *)v4 shareDuringEmergencyModifiedDate];

    if (!v26)
    {
      BOOL v40 = [(_HKMedicalIDData *)self shareDuringEmergency];
      if (v40 != [(_HKMedicalIDData *)v4 shareDuringEmergency])
      {
        _HKInitializeLogging();
        v39 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.66();
        }
        goto LABEL_32;
      }
LABEL_33:
      BOOL v38 = [(_HKMedicalIDData *)self shareDuringEmergency];
      goto LABEL_34;
    }
  }
  uint64_t v27 = [(_HKMedicalIDData *)self shareDuringEmergencyModifiedDate];

  if (!v27)
  {
LABEL_24:
    uint64_t v32 = [(_HKMedicalIDData *)v4 shareDuringEmergency];
    unint64_t v33 = self;
    [v33 setShareDuringEmergency:v32];

    uint64_t v34 = v4;
    goto LABEL_35;
  }
  v28 = [(_HKMedicalIDData *)v4 shareDuringEmergencyModifiedDate];

  if (!v28) {
    goto LABEL_33;
  }
  uint64_t v29 = [(_HKMedicalIDData *)self shareDuringEmergencyModifiedDate];
  BOOL v30 = [(_HKMedicalIDData *)v4 shareDuringEmergencyModifiedDate];
  int v31 = objc_msgSend(v29, "hk_isBeforeDate:", v30);

  if (v31) {
    goto LABEL_24;
  }
  uint64_t v35 = [(_HKMedicalIDData *)self shareDuringEmergencyModifiedDate];
  unint64_t v36 = [(_HKMedicalIDData *)v4 shareDuringEmergencyModifiedDate];
  int v37 = objc_msgSend(v35, "hk_isAfterDate:", v36);

  BOOL v38 = [(_HKMedicalIDData *)self shareDuringEmergency];
  if (!v37)
  {
    if (v38 != [(_HKMedicalIDData *)v4 shareDuringEmergency])
    {
      _HKInitializeLogging();
      v39 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[_HKMedicalIDData merge:].cold.67();
      }
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
LABEL_34:
  char v41 = self;
  [v41 setShareDuringEmergency:v38];

  uint64_t v34 = self;
LABEL_35:
  v42 = [(_HKMedicalIDData *)v34 shareDuringEmergencyModifiedDate];
  uint64_t v43 = self;
  [v43 setShareDuringEmergencyModifiedDate:v42];

  uint64_t v44 = [(_HKMedicalIDData *)self pictureDataModifiedDate];
  if (v44)
  {
  }
  else
  {
    uint64_t v45 = [(_HKMedicalIDData *)v4 pictureDataModifiedDate];

    if (!v45)
    {
      char v61 = [(_HKMedicalIDData *)self pictureData];
      uint64_t v62 = [(_HKMedicalIDData *)v4 pictureData];

      if (v61 != v62)
      {
        _HKInitializeLogging();
        uint64_t v63 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.63();
        }
      }
      int v64 = [(_HKMedicalIDData *)self pictureData];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v65 = [(_HKMedicalIDData *)self pictureData];

        if (!v65) {
          goto LABEL_59;
        }
        unint64_t v66 = [(_HKMedicalIDData *)self pictureData];
        BOOL v67 = self;
        [v67 setPictureData:v66];

        int v64 = [(_HKMedicalIDData *)self pictureDataModifiedDate];
        int v68 = self;
        [v68 setPictureDataModifiedDate:v64];
      }
      goto LABEL_59;
    }
  }
  unint64_t v46 = [(_HKMedicalIDData *)self pictureDataModifiedDate];

  if (v46)
  {
    uint64_t v47 = [(_HKMedicalIDData *)v4 pictureDataModifiedDate];

    if (!v47) {
      goto LABEL_49;
    }
    uint64_t v48 = [(_HKMedicalIDData *)self pictureDataModifiedDate];
    uint64_t v49 = [(_HKMedicalIDData *)v4 pictureDataModifiedDate];
    int v50 = objc_msgSend(v48, "hk_isBeforeDate:", v49);

    if (!v50)
    {
      char v51 = [(_HKMedicalIDData *)self pictureDataModifiedDate];
      uint64_t v52 = [(_HKMedicalIDData *)v4 pictureDataModifiedDate];
      int v53 = objc_msgSend(v51, "hk_isAfterDate:", v52);

      uint64_t v54 = [(_HKMedicalIDData *)self pictureData];
      if (v53)
      {
LABEL_50:
        uint64_t v59 = self;
        [v59 setPictureData:v54];

        uint64_t v60 = self;
        goto LABEL_60;
      }
      uint64_t v55 = [(_HKMedicalIDData *)v4 pictureData];

      if (v54 != v55)
      {
        _HKInitializeLogging();
        uint64_t v56 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.65();
        }

        v57 = [(_HKMedicalIDData *)self pictureData];

        if (!v57)
        {
          _HKInitializeLogging();
          uint64_t v58 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.64();
          }
        }
      }
LABEL_49:
      uint64_t v54 = [(_HKMedicalIDData *)self pictureData];
      goto LABEL_50;
    }
  }
LABEL_59:
  int v69 = [(_HKMedicalIDData *)v4 pictureData];
  v70 = self;
  [v70 setPictureData:v69];

  uint64_t v60 = v4;
LABEL_60:
  v71 = [(_HKMedicalIDData *)v60 pictureDataModifiedDate];
  unint64_t v72 = self;
  [v72 setPictureDataModifiedDate:v71];

  uint64_t v73 = [(_HKMedicalIDData *)self nameModifiedDate];
  if (v73)
  {
  }
  else
  {
    uint64_t v74 = [(_HKMedicalIDData *)v4 nameModifiedDate];

    if (!v74)
    {
      uint64_t v90 = [(_HKMedicalIDData *)self name];
      uint64_t v91 = [(_HKMedicalIDData *)v4 name];

      if (v90 != v91)
      {
        _HKInitializeLogging();
        uint64_t v92 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.60();
        }
      }
      uint64_t v93 = [(_HKMedicalIDData *)self name];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v94 = [(_HKMedicalIDData *)self name];

        if (!v94) {
          goto LABEL_84;
        }
        uint64_t v95 = [(_HKMedicalIDData *)self name];
        v96 = self;
        [v96 setName:v95];

        uint64_t v93 = [(_HKMedicalIDData *)self nameModifiedDate];
        uint64_t v97 = self;
        [v97 setNameModifiedDate:v93];
      }
      goto LABEL_84;
    }
  }
  int64_t v75 = [(_HKMedicalIDData *)self nameModifiedDate];

  if (v75)
  {
    uint64_t v76 = [(_HKMedicalIDData *)v4 nameModifiedDate];

    if (!v76) {
      goto LABEL_74;
    }
    uint64_t v77 = [(_HKMedicalIDData *)self nameModifiedDate];
    uint64_t v78 = [(_HKMedicalIDData *)v4 nameModifiedDate];
    int v79 = objc_msgSend(v77, "hk_isBeforeDate:", v78);

    if (!v79)
    {
      uint64_t v80 = [(_HKMedicalIDData *)self nameModifiedDate];
      uint64_t v81 = [(_HKMedicalIDData *)v4 nameModifiedDate];
      int v82 = objc_msgSend(v80, "hk_isAfterDate:", v81);

      uint64_t v83 = [(_HKMedicalIDData *)self name];
      if (v82)
      {
LABEL_75:
        uint64_t v88 = self;
        [v88 setName:v83];

        uint64_t v89 = self;
        goto LABEL_85;
      }
      v84 = [(_HKMedicalIDData *)v4 name];

      if (v83 != v84)
      {
        _HKInitializeLogging();
        uint64_t v85 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.62();
        }

        uint64_t v86 = [(_HKMedicalIDData *)self name];

        if (!v86)
        {
          _HKInitializeLogging();
          uint64_t v87 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.61();
          }
        }
      }
LABEL_74:
      uint64_t v83 = [(_HKMedicalIDData *)self name];
      goto LABEL_75;
    }
  }
LABEL_84:
  uint64_t v98 = [(_HKMedicalIDData *)v4 name];
  v99 = self;
  [v99 setName:v98];

  uint64_t v89 = v4;
LABEL_85:
  uint64_t v100 = [(_HKMedicalIDData *)v89 nameModifiedDate];
  uint64_t v101 = self;
  [v101 setNameModifiedDate:v100];

  v102 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];
  if (v102)
  {
  }
  else
  {
    uint64_t v103 = [(_HKMedicalIDData *)v4 gregorianBirthdayModifiedDate];

    if (!v103)
    {
      uint64_t v119 = [(_HKMedicalIDData *)self gregorianBirthday];
      uint64_t v120 = [(_HKMedicalIDData *)v4 gregorianBirthday];

      if (v119 != v120)
      {
        _HKInitializeLogging();
        v121 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.57();
        }
      }
      uint64_t v122 = [(_HKMedicalIDData *)self gregorianBirthday];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v123 = [(_HKMedicalIDData *)self gregorianBirthday];

        if (!v123) {
          goto LABEL_109;
        }
        uint64_t v124 = [(_HKMedicalIDData *)self gregorianBirthday];
        v125 = self;
        [v125 setGregorianBirthday:v124];

        uint64_t v122 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];
        uint64_t v126 = self;
        [v126 setGregorianBirthdayModifiedDate:v122];
      }
      goto LABEL_109;
    }
  }
  uint64_t v104 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];

  if (v104)
  {
    v105 = [(_HKMedicalIDData *)v4 gregorianBirthdayModifiedDate];

    if (!v105) {
      goto LABEL_99;
    }
    int v106 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];
    int v107 = [(_HKMedicalIDData *)v4 gregorianBirthdayModifiedDate];
    int v108 = objc_msgSend(v106, "hk_isBeforeDate:", v107);

    if (!v108)
    {
      int64_t v109 = [(_HKMedicalIDData *)self gregorianBirthdayModifiedDate];
      uint64_t v110 = [(_HKMedicalIDData *)v4 gregorianBirthdayModifiedDate];
      int v111 = objc_msgSend(v109, "hk_isAfterDate:", v110);

      uint64_t v112 = [(_HKMedicalIDData *)self gregorianBirthday];
      if (v111)
      {
LABEL_100:
        uint64_t v117 = self;
        [v117 setGregorianBirthday:v112];

        uint64_t v118 = self;
        goto LABEL_110;
      }
      v113 = [(_HKMedicalIDData *)v4 gregorianBirthday];

      if (v112 != v113)
      {
        _HKInitializeLogging();
        uint64_t v114 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.59();
        }

        uint64_t v115 = [(_HKMedicalIDData *)self gregorianBirthday];

        if (!v115)
        {
          _HKInitializeLogging();
          uint64_t v116 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.58();
          }
        }
      }
LABEL_99:
      uint64_t v112 = [(_HKMedicalIDData *)self gregorianBirthday];
      goto LABEL_100;
    }
  }
LABEL_109:
  uint64_t v127 = [(_HKMedicalIDData *)v4 gregorianBirthday];
  uint64_t v128 = self;
  [v128 setGregorianBirthday:v127];

  uint64_t v118 = v4;
LABEL_110:
  int64_t v129 = [(_HKMedicalIDData *)v118 gregorianBirthdayModifiedDate];
  uint64_t v130 = self;
  [v130 setGregorianBirthdayModifiedDate:v129];

  uint64_t v131 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];
  if (v131)
  {
  }
  else
  {
    v132 = [(_HKMedicalIDData *)v4 primaryLanguageCodeModifiedDate];

    if (!v132)
    {
      v148 = [(_HKMedicalIDData *)self primaryLanguageCode];
      uint64_t v149 = [(_HKMedicalIDData *)v4 primaryLanguageCode];

      if (v148 != v149)
      {
        _HKInitializeLogging();
        uint64_t v150 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.54();
        }
      }
      v151 = [(_HKMedicalIDData *)self primaryLanguageCode];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v152 = [(_HKMedicalIDData *)self primaryLanguageCode];

        if (!v152) {
          goto LABEL_134;
        }
        v153 = [(_HKMedicalIDData *)self primaryLanguageCode];
        v154 = self;
        [v154 setPrimaryLanguageCode:v153];

        v151 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];
        v155 = self;
        [v155 setPrimaryLanguageCodeModifiedDate:v151];
      }
      goto LABEL_134;
    }
  }
  v133 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];

  if (v133)
  {
    v134 = [(_HKMedicalIDData *)v4 primaryLanguageCodeModifiedDate];

    if (!v134) {
      goto LABEL_124;
    }
    v135 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];
    v136 = [(_HKMedicalIDData *)v4 primaryLanguageCodeModifiedDate];
    int v137 = objc_msgSend(v135, "hk_isBeforeDate:", v136);

    if (!v137)
    {
      v138 = [(_HKMedicalIDData *)self primaryLanguageCodeModifiedDate];
      v139 = [(_HKMedicalIDData *)v4 primaryLanguageCodeModifiedDate];
      int v140 = objc_msgSend(v138, "hk_isAfterDate:", v139);

      uint64_t v141 = [(_HKMedicalIDData *)self primaryLanguageCode];
      if (v140)
      {
LABEL_125:
        v146 = self;
        [v146 setPrimaryLanguageCode:v141];

        v147 = self;
        goto LABEL_135;
      }
      v142 = [(_HKMedicalIDData *)v4 primaryLanguageCode];

      if (v141 != v142)
      {
        _HKInitializeLogging();
        uint64_t v143 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.56();
        }

        v144 = [(_HKMedicalIDData *)self primaryLanguageCode];

        if (!v144)
        {
          _HKInitializeLogging();
          v145 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.55();
          }
        }
      }
LABEL_124:
      uint64_t v141 = [(_HKMedicalIDData *)self primaryLanguageCode];
      goto LABEL_125;
    }
  }
LABEL_134:
  v156 = [(_HKMedicalIDData *)v4 primaryLanguageCode];
  v157 = self;
  [v157 setPrimaryLanguageCode:v156];

  v147 = v4;
LABEL_135:
  v158 = [(_HKMedicalIDData *)v147 primaryLanguageCodeModifiedDate];
  v159 = self;
  [v159 setPrimaryLanguageCodeModifiedDate:v158];

  uint64_t v160 = [(_HKMedicalIDData *)self heightModifiedDate];
  if (v160)
  {
  }
  else
  {
    v161 = [(_HKMedicalIDData *)v4 heightModifiedDate];

    if (!v161)
    {
      v177 = [(_HKMedicalIDData *)self height];
      v178 = [(_HKMedicalIDData *)v4 height];

      if (v177 != v178)
      {
        _HKInitializeLogging();
        v179 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.51();
        }
      }
      v180 = [(_HKMedicalIDData *)self height];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v181 = [(_HKMedicalIDData *)self height];

        if (!v181) {
          goto LABEL_159;
        }
        v182 = [(_HKMedicalIDData *)self height];
        v183 = self;
        [v183 setHeight:v182];

        v180 = [(_HKMedicalIDData *)self heightModifiedDate];
        v184 = self;
        [v184 setHeightModifiedDate:v180];
      }
      goto LABEL_159;
    }
  }
  v162 = [(_HKMedicalIDData *)self heightModifiedDate];

  if (v162)
  {
    v163 = [(_HKMedicalIDData *)v4 heightModifiedDate];

    if (!v163) {
      goto LABEL_149;
    }
    v164 = [(_HKMedicalIDData *)self heightModifiedDate];
    uint64_t v165 = [(_HKMedicalIDData *)v4 heightModifiedDate];
    int v166 = objc_msgSend(v164, "hk_isBeforeDate:", v165);

    if (!v166)
    {
      uint64_t v167 = [(_HKMedicalIDData *)self heightModifiedDate];
      v168 = [(_HKMedicalIDData *)v4 heightModifiedDate];
      int v169 = objc_msgSend(v167, "hk_isAfterDate:", v168);

      uint64_t v170 = [(_HKMedicalIDData *)self height];
      if (v169)
      {
LABEL_150:
        v175 = self;
        [v175 setHeight:v170];

        v176 = self;
        goto LABEL_160;
      }
      uint64_t v171 = [(_HKMedicalIDData *)v4 height];

      if (v170 != v171)
      {
        _HKInitializeLogging();
        v172 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.53();
        }

        v173 = [(_HKMedicalIDData *)self height];

        if (!v173)
        {
          _HKInitializeLogging();
          v174 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.52();
          }
        }
      }
LABEL_149:
      uint64_t v170 = [(_HKMedicalIDData *)self height];
      goto LABEL_150;
    }
  }
LABEL_159:
  v185 = [(_HKMedicalIDData *)v4 height];
  uint64_t v186 = self;
  [v186 setHeight:v185];

  v176 = v4;
LABEL_160:
  v187 = [(_HKMedicalIDData *)v176 heightModifiedDate];
  v188 = self;
  [v188 setHeightModifiedDate:v187];

  uint64_t v189 = [(_HKMedicalIDData *)self weightModifiedDate];
  if (v189)
  {
  }
  else
  {
    uint64_t v190 = [(_HKMedicalIDData *)v4 weightModifiedDate];

    if (!v190)
    {
      v206 = [(_HKMedicalIDData *)self weight];
      v207 = [(_HKMedicalIDData *)v4 weight];

      if (v206 != v207)
      {
        _HKInitializeLogging();
        uint64_t v208 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v208, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.48();
        }
      }
      uint64_t v209 = [(_HKMedicalIDData *)self weight];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v210 = [(_HKMedicalIDData *)self weight];

        if (!v210) {
          goto LABEL_184;
        }
        int v211 = [(_HKMedicalIDData *)self weight];
        int v212 = self;
        [v212 setWeight:v211];

        uint64_t v209 = [(_HKMedicalIDData *)self weightModifiedDate];
        int v213 = self;
        [v213 setWeightModifiedDate:v209];
      }
      goto LABEL_184;
    }
  }
  v191 = [(_HKMedicalIDData *)self weightModifiedDate];

  if (v191)
  {
    v192 = [(_HKMedicalIDData *)v4 weightModifiedDate];

    if (!v192) {
      goto LABEL_174;
    }
    v193 = [(_HKMedicalIDData *)self weightModifiedDate];
    v194 = [(_HKMedicalIDData *)v4 weightModifiedDate];
    int v195 = objc_msgSend(v193, "hk_isBeforeDate:", v194);

    if (!v195)
    {
      v196 = [(_HKMedicalIDData *)self weightModifiedDate];
      v197 = [(_HKMedicalIDData *)v4 weightModifiedDate];
      int v198 = objc_msgSend(v196, "hk_isAfterDate:", v197);

      v199 = [(_HKMedicalIDData *)self weight];
      if (v198)
      {
LABEL_175:
        v204 = self;
        [v204 setWeight:v199];

        uint64_t v205 = self;
        goto LABEL_185;
      }
      uint64_t v200 = [(_HKMedicalIDData *)v4 weight];

      if (v199 != v200)
      {
        _HKInitializeLogging();
        v201 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.50();
        }

        v202 = [(_HKMedicalIDData *)self weight];

        if (!v202)
        {
          _HKInitializeLogging();
          v203 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.49();
          }
        }
      }
LABEL_174:
      v199 = [(_HKMedicalIDData *)self weight];
      goto LABEL_175;
    }
  }
LABEL_184:
  id v214 = [(_HKMedicalIDData *)v4 weight];
  int v215 = self;
  [v215 setWeight:v214];

  uint64_t v205 = v4;
LABEL_185:
  int v216 = [(_HKMedicalIDData *)v205 weightModifiedDate];
  int v217 = self;
  [v217 setWeightModifiedDate:v216];

  int v218 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];
  if (v218)
  {
  }
  else
  {
    int v219 = [(_HKMedicalIDData *)v4 isOrganDonorModifiedDate];

    if (!v219)
    {
      int v235 = [(_HKMedicalIDData *)self isOrganDonor];
      int v236 = [(_HKMedicalIDData *)v4 isOrganDonor];

      if (v235 != v236)
      {
        _HKInitializeLogging();
        int v237 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.45();
        }
      }
      int v238 = [(_HKMedicalIDData *)self isOrganDonor];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v239 = [(_HKMedicalIDData *)self isOrganDonor];

        if (!v239) {
          goto LABEL_209;
        }
        int v240 = [(_HKMedicalIDData *)self isOrganDonor];
        int v241 = self;
        [v241 setIsOrganDonor:v240];

        int v238 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];
        int v242 = self;
        [v242 setIsOrganDonorModifiedDate:v238];
      }
      goto LABEL_209;
    }
  }
  int v220 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];

  if (v220)
  {
    int v221 = [(_HKMedicalIDData *)v4 isOrganDonorModifiedDate];

    if (!v221) {
      goto LABEL_199;
    }
    int v222 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];
    int v223 = [(_HKMedicalIDData *)v4 isOrganDonorModifiedDate];
    int v224 = objc_msgSend(v222, "hk_isBeforeDate:", v223);

    if (!v224)
    {
      int v225 = [(_HKMedicalIDData *)self isOrganDonorModifiedDate];
      int v226 = [(_HKMedicalIDData *)v4 isOrganDonorModifiedDate];
      int v227 = objc_msgSend(v225, "hk_isAfterDate:", v226);

      int v228 = [(_HKMedicalIDData *)self isOrganDonor];
      if (v227)
      {
LABEL_200:
        int v233 = self;
        [v233 setIsOrganDonor:v228];

        int v234 = self;
        goto LABEL_210;
      }
      int v229 = [(_HKMedicalIDData *)v4 isOrganDonor];

      if (v228 != v229)
      {
        _HKInitializeLogging();
        int v230 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.47();
        }

        int v231 = [(_HKMedicalIDData *)self isOrganDonor];

        if (!v231)
        {
          _HKInitializeLogging();
          int v232 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.46();
          }
        }
      }
LABEL_199:
      int v228 = [(_HKMedicalIDData *)self isOrganDonor];
      goto LABEL_200;
    }
  }
LABEL_209:
  int v243 = [(_HKMedicalIDData *)v4 isOrganDonor];
  int v244 = self;
  [v244 setIsOrganDonor:v243];

  int v234 = v4;
LABEL_210:
  int v245 = [(_HKMedicalIDData *)v234 isOrganDonorModifiedDate];
  int v246 = self;
  [v246 setIsOrganDonorModifiedDate:v245];

  int v247 = [(_HKMedicalIDData *)self bloodTypeModifiedDate];
  if (v247)
  {
  }
  else
  {
    int v248 = [(_HKMedicalIDData *)v4 bloodTypeModifiedDate];

    if (!v248)
    {
      int64_t v262 = [(_HKMedicalIDData *)self bloodType];
      if (v262 != [(_HKMedicalIDData *)v4 bloodType])
      {
        _HKInitializeLogging();
        int v261 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.43();
        }
        goto LABEL_224;
      }
LABEL_225:
      int64_t v260 = [(_HKMedicalIDData *)self bloodType];
      goto LABEL_226;
    }
  }
  int v249 = [(_HKMedicalIDData *)self bloodTypeModifiedDate];

  if (!v249)
  {
LABEL_216:
    uint64_t v254 = [(_HKMedicalIDData *)v4 bloodType];
    int v255 = self;
    [v255 setBloodType:v254];

    int v256 = v4;
    goto LABEL_227;
  }
  int v250 = [(_HKMedicalIDData *)v4 bloodTypeModifiedDate];

  if (!v250) {
    goto LABEL_225;
  }
  int v251 = [(_HKMedicalIDData *)self bloodTypeModifiedDate];
  int v252 = [(_HKMedicalIDData *)v4 bloodTypeModifiedDate];
  int v253 = objc_msgSend(v251, "hk_isBeforeDate:", v252);

  if (v253) {
    goto LABEL_216;
  }
  int v257 = [(_HKMedicalIDData *)self bloodTypeModifiedDate];
  int v258 = [(_HKMedicalIDData *)v4 bloodTypeModifiedDate];
  int v259 = objc_msgSend(v257, "hk_isAfterDate:", v258);

  int64_t v260 = [(_HKMedicalIDData *)self bloodType];
  if (!v259)
  {
    if (v260 != [(_HKMedicalIDData *)v4 bloodType])
    {
      _HKInitializeLogging();
      int v261 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR)) {
        -[_HKMedicalIDData merge:].cold.44();
      }
LABEL_224:

      goto LABEL_225;
    }
    goto LABEL_225;
  }
LABEL_226:
  int v263 = self;
  [v263 setBloodType:v260];

  int v256 = self;
LABEL_227:
  int v264 = [(_HKMedicalIDData *)v256 bloodTypeModifiedDate];
  int v265 = self;
  [v265 setBloodTypeModifiedDate:v264];

  int v266 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];
  if (v266)
  {
  }
  else
  {
    int v267 = [(_HKMedicalIDData *)v4 emergencyContactsModifiedDate];

    if (!v267)
    {
      BOOL v283 = [(_HKMedicalIDData *)self emergencyContacts];
      BOOL v284 = [(_HKMedicalIDData *)v4 emergencyContacts];

      if (v283 != v284)
      {
        _HKInitializeLogging();
        BOOL v285 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.40();
        }
      }
      BOOL v286 = [(_HKMedicalIDData *)self emergencyContacts];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v287 = [(_HKMedicalIDData *)self emergencyContacts];

        if (!v287) {
          goto LABEL_251;
        }
        int v288 = [(_HKMedicalIDData *)self emergencyContacts];
        int v289 = self;
        [v289 setEmergencyContacts:v288];

        BOOL v286 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];
        int v290 = self;
        [v290 setEmergencyContactsModifiedDate:v286];
      }
      goto LABEL_251;
    }
  }
  int v268 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];

  if (v268)
  {
    int v269 = [(_HKMedicalIDData *)v4 emergencyContactsModifiedDate];

    if (!v269) {
      goto LABEL_241;
    }
    int v270 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];
    uint64_t v271 = [(_HKMedicalIDData *)v4 emergencyContactsModifiedDate];
    int v272 = objc_msgSend(v270, "hk_isBeforeDate:", v271);

    if (!v272)
    {
      int v273 = [(_HKMedicalIDData *)self emergencyContactsModifiedDate];
      int v274 = [(_HKMedicalIDData *)v4 emergencyContactsModifiedDate];
      int v275 = objc_msgSend(v273, "hk_isAfterDate:", v274);

      int v276 = [(_HKMedicalIDData *)self emergencyContacts];
      if (v275)
      {
LABEL_242:
        BOOL v281 = self;
        [v281 setEmergencyContacts:v276];

        BOOL v282 = self;
        goto LABEL_252;
      }
      int v277 = [(_HKMedicalIDData *)v4 emergencyContacts];

      if (v276 != v277)
      {
        _HKInitializeLogging();
        v278 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.42();
        }

        int v279 = [(_HKMedicalIDData *)self emergencyContacts];

        if (!v279)
        {
          _HKInitializeLogging();
          uint64_t v280 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.41();
          }
        }
      }
LABEL_241:
      int v276 = [(_HKMedicalIDData *)self emergencyContacts];
      goto LABEL_242;
    }
  }
LABEL_251:
  BOOL v291 = [(_HKMedicalIDData *)v4 emergencyContacts];
  uint64_t v292 = self;
  [v292 setEmergencyContacts:v291];

  BOOL v282 = v4;
LABEL_252:
  BOOL v293 = [(_HKMedicalIDData *)v282 emergencyContactsModifiedDate];
  BOOL v294 = self;
  [v294 setEmergencyContactsModifiedDate:v293];

  BOOL v295 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];
  if (v295)
  {
  }
  else
  {
    BOOL v296 = [(_HKMedicalIDData *)v4 clinicalContactsModifiedDate];

    if (!v296)
    {
      v312 = [(_HKMedicalIDData *)self clinicalContacts];
      v313 = [(_HKMedicalIDData *)v4 clinicalContacts];

      if (v312 != v313)
      {
        _HKInitializeLogging();
        v314 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v314, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]7();
        }
      }
      v315 = [(_HKMedicalIDData *)self clinicalContacts];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v316 = [(_HKMedicalIDData *)self clinicalContacts];

        if (!v316) {
          goto LABEL_276;
        }
        v317 = [(_HKMedicalIDData *)self clinicalContacts];
        v318 = self;
        [v318 setClinicalContacts:v317];

        v315 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];
        v319 = self;
        [v319 setClinicalContactsModifiedDate:v315];
      }
      goto LABEL_276;
    }
  }
  BOOL v297 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];

  if (v297)
  {
    BOOL v298 = [(_HKMedicalIDData *)v4 clinicalContactsModifiedDate];

    if (!v298) {
      goto LABEL_266;
    }
    long long v299 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];
    v300 = [(_HKMedicalIDData *)v4 clinicalContactsModifiedDate];
    int v301 = objc_msgSend(v299, "hk_isBeforeDate:", v300);

    if (!v301)
    {
      v302 = [(_HKMedicalIDData *)self clinicalContactsModifiedDate];
      v303 = [(_HKMedicalIDData *)v4 clinicalContactsModifiedDate];
      int v304 = objc_msgSend(v302, "hk_isAfterDate:", v303);

      v305 = [(_HKMedicalIDData *)self clinicalContacts];
      if (v304)
      {
LABEL_267:
        v310 = self;
        [v310 setClinicalContacts:v305];

        v311 = self;
        goto LABEL_277;
      }
      v306 = [(_HKMedicalIDData *)v4 clinicalContacts];

      if (v305 != v306)
      {
        _HKInitializeLogging();
        v307 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v307, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]9();
        }

        v308 = [(_HKMedicalIDData *)self clinicalContacts];

        if (!v308)
        {
          _HKInitializeLogging();
          v309 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]8();
          }
        }
      }
LABEL_266:
      v305 = [(_HKMedicalIDData *)self clinicalContacts];
      goto LABEL_267;
    }
  }
LABEL_276:
  v320 = [(_HKMedicalIDData *)v4 clinicalContacts];
  v321 = self;
  [v321 setClinicalContacts:v320];

  v311 = v4;
LABEL_277:
  v322 = [(_HKMedicalIDData *)v311 clinicalContactsModifiedDate];
  v323 = self;
  [v323 setClinicalContactsModifiedDate:v322];

  v324 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];
  if (v324)
  {
  }
  else
  {
    v325 = [(_HKMedicalIDData *)v4 medicalConditionsModifiedDate];

    if (!v325)
    {
      v341 = [(_HKMedicalIDData *)self medicalConditions];
      v342 = [(_HKMedicalIDData *)v4 medicalConditions];

      if (v341 != v342)
      {
        _HKInitializeLogging();
        v343 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]4();
        }
      }
      v344 = [(_HKMedicalIDData *)self medicalConditions];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v345 = [(_HKMedicalIDData *)self medicalConditions];

        if (!v345) {
          goto LABEL_301;
        }
        v346 = [(_HKMedicalIDData *)self medicalConditions];
        v347 = self;
        [v347 setMedicalConditions:v346];

        v344 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];
        v348 = self;
        [v348 setMedicalConditionsModifiedDate:v344];
      }
      goto LABEL_301;
    }
  }
  v326 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];

  if (v326)
  {
    v327 = [(_HKMedicalIDData *)v4 medicalConditionsModifiedDate];

    if (!v327) {
      goto LABEL_291;
    }
    v328 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];
    v329 = [(_HKMedicalIDData *)v4 medicalConditionsModifiedDate];
    int v330 = objc_msgSend(v328, "hk_isBeforeDate:", v329);

    if (!v330)
    {
      v331 = [(_HKMedicalIDData *)self medicalConditionsModifiedDate];
      v332 = [(_HKMedicalIDData *)v4 medicalConditionsModifiedDate];
      int v333 = objc_msgSend(v331, "hk_isAfterDate:", v332);

      v334 = [(_HKMedicalIDData *)self medicalConditions];
      if (v333)
      {
LABEL_292:
        v339 = self;
        [v339 setMedicalConditions:v334];

        v340 = self;
        goto LABEL_302;
      }
      v335 = [(_HKMedicalIDData *)v4 medicalConditions];

      if (v334 != v335)
      {
        _HKInitializeLogging();
        v336 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]6();
        }

        v337 = [(_HKMedicalIDData *)self medicalConditions];

        if (!v337)
        {
          _HKInitializeLogging();
          v338 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v338, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]5();
          }
        }
      }
LABEL_291:
      v334 = [(_HKMedicalIDData *)self medicalConditions];
      goto LABEL_292;
    }
  }
LABEL_301:
  v349 = [(_HKMedicalIDData *)v4 medicalConditions];
  v350 = self;
  [v350 setMedicalConditions:v349];

  v340 = v4;
LABEL_302:
  v351 = [(_HKMedicalIDData *)v340 medicalConditionsModifiedDate];
  v352 = self;
  [v352 setMedicalConditionsModifiedDate:v351];

  v353 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];
  if (v353)
  {
  }
  else
  {
    v354 = [(_HKMedicalIDData *)v4 medicalNotesModifiedDate];

    if (!v354)
    {
      v370 = [(_HKMedicalIDData *)self medicalNotes];
      v371 = [(_HKMedicalIDData *)v4 medicalNotes];

      if (v370 != v371)
      {
        _HKInitializeLogging();
        v372 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v372, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]1();
        }
      }
      v373 = [(_HKMedicalIDData *)self medicalNotes];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v374 = [(_HKMedicalIDData *)self medicalNotes];

        if (!v374) {
          goto LABEL_326;
        }
        v375 = [(_HKMedicalIDData *)self medicalNotes];
        v376 = self;
        [v376 setMedicalNotes:v375];

        v373 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];
        v377 = self;
        [v377 setMedicalNotesModifiedDate:v373];
      }
      goto LABEL_326;
    }
  }
  v355 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];

  if (v355)
  {
    v356 = [(_HKMedicalIDData *)v4 medicalNotesModifiedDate];

    if (!v356) {
      goto LABEL_316;
    }
    v357 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];
    v358 = [(_HKMedicalIDData *)v4 medicalNotesModifiedDate];
    int v359 = objc_msgSend(v357, "hk_isBeforeDate:", v358);

    if (!v359)
    {
      v360 = [(_HKMedicalIDData *)self medicalNotesModifiedDate];
      v361 = [(_HKMedicalIDData *)v4 medicalNotesModifiedDate];
      int v362 = objc_msgSend(v360, "hk_isAfterDate:", v361);

      v363 = [(_HKMedicalIDData *)self medicalNotes];
      if (v362)
      {
LABEL_317:
        v368 = self;
        [v368 setMedicalNotes:v363];

        v369 = self;
        goto LABEL_327;
      }
      v364 = [(_HKMedicalIDData *)v4 medicalNotes];

      if (v363 != v364)
      {
        _HKInitializeLogging();
        v365 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v365, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]3();
        }

        v366 = [(_HKMedicalIDData *)self medicalNotes];

        if (!v366)
        {
          _HKInitializeLogging();
          v367 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v367, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]2();
          }
        }
      }
LABEL_316:
      v363 = [(_HKMedicalIDData *)self medicalNotes];
      goto LABEL_317;
    }
  }
LABEL_326:
  v378 = [(_HKMedicalIDData *)v4 medicalNotes];
  v379 = self;
  [v379 setMedicalNotes:v378];

  v369 = v4;
LABEL_327:
  v380 = [(_HKMedicalIDData *)v369 medicalNotesModifiedDate];
  v381 = self;
  [v381 setMedicalNotesModifiedDate:v380];

  v382 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];
  if (v382)
  {
  }
  else
  {
    v383 = [(_HKMedicalIDData *)v4 allergyInfoModifiedDate];

    if (!v383)
    {
      v399 = [(_HKMedicalIDData *)self allergyInfo];
      v400 = [(_HKMedicalIDData *)v4 allergyInfo];

      if (v399 != v400)
      {
        _HKInitializeLogging();
        v401 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]8();
        }
      }
      v402 = [(_HKMedicalIDData *)self allergyInfo];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v403 = [(_HKMedicalIDData *)self allergyInfo];

        if (!v403) {
          goto LABEL_351;
        }
        v404 = [(_HKMedicalIDData *)self allergyInfo];
        v405 = self;
        [v405 setAllergyInfo:v404];

        v402 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];
        v406 = self;
        [v406 setAllergyInfoModifiedDate:v402];
      }
      goto LABEL_351;
    }
  }
  v384 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];

  if (v384)
  {
    v385 = [(_HKMedicalIDData *)v4 allergyInfoModifiedDate];

    if (!v385) {
      goto LABEL_341;
    }
    v386 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];
    v387 = [(_HKMedicalIDData *)v4 allergyInfoModifiedDate];
    int v388 = objc_msgSend(v386, "hk_isBeforeDate:", v387);

    if (!v388)
    {
      v389 = [(_HKMedicalIDData *)self allergyInfoModifiedDate];
      v390 = [(_HKMedicalIDData *)v4 allergyInfoModifiedDate];
      int v391 = objc_msgSend(v389, "hk_isAfterDate:", v390);

      v392 = [(_HKMedicalIDData *)self allergyInfo];
      if (v391)
      {
LABEL_342:
        v397 = self;
        [v397 setAllergyInfo:v392];

        v398 = self;
        goto LABEL_352;
      }
      v393 = [(_HKMedicalIDData *)v4 allergyInfo];

      if (v392 != v393)
      {
        _HKInitializeLogging();
        v394 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v394, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]0();
        }

        v395 = [(_HKMedicalIDData *)self allergyInfo];

        if (!v395)
        {
          _HKInitializeLogging();
          v396 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v396, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]9();
          }
        }
      }
LABEL_341:
      v392 = [(_HKMedicalIDData *)self allergyInfo];
      goto LABEL_342;
    }
  }
LABEL_351:
  v407 = [(_HKMedicalIDData *)v4 allergyInfo];
  v408 = self;
  [v408 setAllergyInfo:v407];

  v398 = v4;
LABEL_352:
  v409 = [(_HKMedicalIDData *)v398 allergyInfoModifiedDate];
  v410 = self;
  [v410 setAllergyInfoModifiedDate:v409];

  v411 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];
  if (v411)
  {
  }
  else
  {
    v412 = [(_HKMedicalIDData *)v4 medicationInfoModifiedDate];

    if (!v412)
    {
      v428 = [(_HKMedicalIDData *)self medicationInfo];
      v429 = [(_HKMedicalIDData *)v4 medicationInfo];

      if (v428 != v429)
      {
        _HKInitializeLogging();
        v430 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v430, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]5();
        }
      }
      v431 = [(_HKMedicalIDData *)self medicationInfo];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v432 = [(_HKMedicalIDData *)self medicationInfo];

        if (!v432) {
          goto LABEL_376;
        }
        v433 = [(_HKMedicalIDData *)self medicationInfo];
        v434 = self;
        [v434 setMedicationInfo:v433];

        v431 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];
        v435 = self;
        [v435 setMedicationInfoModifiedDate:v431];
      }
      goto LABEL_376;
    }
  }
  v413 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];

  if (v413)
  {
    v414 = [(_HKMedicalIDData *)v4 medicationInfoModifiedDate];

    if (!v414) {
      goto LABEL_366;
    }
    v415 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];
    v416 = [(_HKMedicalIDData *)v4 medicationInfoModifiedDate];
    int v417 = objc_msgSend(v415, "hk_isBeforeDate:", v416);

    if (!v417)
    {
      v418 = [(_HKMedicalIDData *)self medicationInfoModifiedDate];
      v419 = [(_HKMedicalIDData *)v4 medicationInfoModifiedDate];
      int v420 = objc_msgSend(v418, "hk_isAfterDate:", v419);

      v421 = [(_HKMedicalIDData *)self medicationInfo];
      if (v420)
      {
LABEL_367:
        v426 = self;
        [v426 setMedicationInfo:v421];

        v427 = self;
        goto LABEL_377;
      }
      v422 = [(_HKMedicalIDData *)v4 medicationInfo];

      if (v421 != v422)
      {
        _HKInitializeLogging();
        v423 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v423, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]7();
        }

        v424 = [(_HKMedicalIDData *)self medicationInfo];

        if (!v424)
        {
          _HKInitializeLogging();
          v425 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v425, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]6();
          }
        }
      }
LABEL_366:
      v421 = [(_HKMedicalIDData *)self medicationInfo];
      goto LABEL_367;
    }
  }
LABEL_376:
  v436 = [(_HKMedicalIDData *)v4 medicationInfo];
  v437 = self;
  [v437 setMedicationInfo:v436];

  v427 = v4;
LABEL_377:
  v438 = [(_HKMedicalIDData *)v427 medicationInfoModifiedDate];
  v439 = self;
  [v439 setMedicationInfoModifiedDate:v438];

  v440 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];
  if (v440)
  {
  }
  else
  {
    v441 = [(_HKMedicalIDData *)v4 pregnancyStartDateModifiedDate];

    if (!v441)
    {
      v457 = [(_HKMedicalIDData *)self pregnancyStartDate];
      v458 = [(_HKMedicalIDData *)v4 pregnancyStartDate];

      if (v457 != v458)
      {
        _HKInitializeLogging();
        v459 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v459, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]2();
        }
      }
      v460 = [(_HKMedicalIDData *)self pregnancyStartDate];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v461 = [(_HKMedicalIDData *)self pregnancyStartDate];

        if (!v461) {
          goto LABEL_401;
        }
        v462 = [(_HKMedicalIDData *)self pregnancyStartDate];
        v463 = self;
        [v463 setPregnancyStartDate:v462];

        v460 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];
        v464 = self;
        [v464 setPregnancyStartDateModifiedDate:v460];
      }
      goto LABEL_401;
    }
  }
  v442 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];

  if (v442)
  {
    v443 = [(_HKMedicalIDData *)v4 pregnancyStartDateModifiedDate];

    if (!v443) {
      goto LABEL_391;
    }
    v444 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];
    v445 = [(_HKMedicalIDData *)v4 pregnancyStartDateModifiedDate];
    int v446 = objc_msgSend(v444, "hk_isBeforeDate:", v445);

    if (!v446)
    {
      v447 = [(_HKMedicalIDData *)self pregnancyStartDateModifiedDate];
      v448 = [(_HKMedicalIDData *)v4 pregnancyStartDateModifiedDate];
      int v449 = objc_msgSend(v447, "hk_isAfterDate:", v448);

      v450 = [(_HKMedicalIDData *)self pregnancyStartDate];
      if (v449)
      {
LABEL_392:
        v455 = self;
        [v455 setPregnancyStartDate:v450];

        v456 = self;
        goto LABEL_402;
      }
      v451 = [(_HKMedicalIDData *)v4 pregnancyStartDate];

      if (v450 != v451)
      {
        _HKInitializeLogging();
        v452 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v452, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]4();
        }

        v453 = [(_HKMedicalIDData *)self pregnancyStartDate];

        if (!v453)
        {
          _HKInitializeLogging();
          v454 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v454, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]3();
          }
        }
      }
LABEL_391:
      v450 = [(_HKMedicalIDData *)self pregnancyStartDate];
      goto LABEL_392;
    }
  }
LABEL_401:
  v465 = [(_HKMedicalIDData *)v4 pregnancyStartDate];
  v466 = self;
  [v466 setPregnancyStartDate:v465];

  v456 = v4;
LABEL_402:
  v467 = [(_HKMedicalIDData *)v456 pregnancyStartDateModifiedDate];
  v468 = self;
  [v468 setPregnancyStartDateModifiedDate:v467];

  v469 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];
  if (v469)
  {
  }
  else
  {
    v470 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDateModifiedDate];

    if (!v470)
    {
      v486 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
      v487 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDate];

      if (v486 != v487)
      {
        _HKInitializeLogging();
        v488 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v488, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]9();
        }
      }
      v489 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v490 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];

        if (!v490) {
          goto LABEL_426;
        }
        v491 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
        v492 = self;
        [v492 setPregnancyEstimatedDueDate:v491];

        v489 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];
        v493 = self;
        [v493 setPregnancyEstimatedDueDateModifiedDate:v489];
      }
      goto LABEL_426;
    }
  }
  v471 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];

  if (v471)
  {
    v472 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDateModifiedDate];

    if (!v472) {
      goto LABEL_416;
    }
    v473 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];
    v474 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDateModifiedDate];
    int v475 = objc_msgSend(v473, "hk_isBeforeDate:", v474);

    if (!v475)
    {
      v476 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDateModifiedDate];
      v477 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDateModifiedDate];
      int v478 = objc_msgSend(v476, "hk_isAfterDate:", v477);

      v479 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
      if (v478)
      {
LABEL_417:
        v484 = self;
        [v484 setPregnancyEstimatedDueDate:v479];

        v485 = self;
        goto LABEL_427;
      }
      v480 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDate];

      if (v479 != v480)
      {
        _HKInitializeLogging();
        v481 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v481, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]1();
        }

        v482 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];

        if (!v482)
        {
          _HKInitializeLogging();
          v483 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v483, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]0();
          }
        }
      }
LABEL_416:
      v479 = [(_HKMedicalIDData *)self pregnancyEstimatedDueDate];
      goto LABEL_417;
    }
  }
LABEL_426:
  v494 = [(_HKMedicalIDData *)v4 pregnancyEstimatedDueDate];
  v495 = self;
  [v495 setPregnancyEstimatedDueDate:v494];

  v485 = v4;
LABEL_427:
  v496 = [(_HKMedicalIDData *)v485 pregnancyEstimatedDueDateModifiedDate];
  v497 = self;
  [v497 setPregnancyEstimatedDueDateModifiedDate:v496];

  v498 = [(_HKMedicalIDData *)self medicationsListModifiedDate];
  if (v498)
  {
  }
  else
  {
    v499 = [(_HKMedicalIDData *)v4 medicationsListModifiedDate];

    if (!v499)
    {
      v515 = [(_HKMedicalIDData *)self medicationsList];
      v516 = [(_HKMedicalIDData *)v4 medicationsList];

      if (v515 != v516)
      {
        _HKInitializeLogging();
        v517 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v517, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]6();
        }
      }
      v518 = [(_HKMedicalIDData *)self medicationsList];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v519 = [(_HKMedicalIDData *)self medicationsList];

        if (!v519) {
          goto LABEL_451;
        }
        v520 = [(_HKMedicalIDData *)self medicationsList];
        v521 = self;
        [v521 setMedicationsList:v520];

        v518 = [(_HKMedicalIDData *)self medicationsListModifiedDate];
        v522 = self;
        [v522 setMedicationsListModifiedDate:v518];
      }
      goto LABEL_451;
    }
  }
  v500 = [(_HKMedicalIDData *)self medicationsListModifiedDate];

  if (v500)
  {
    v501 = [(_HKMedicalIDData *)v4 medicationsListModifiedDate];

    if (!v501) {
      goto LABEL_441;
    }
    v502 = [(_HKMedicalIDData *)self medicationsListModifiedDate];
    v503 = [(_HKMedicalIDData *)v4 medicationsListModifiedDate];
    int v504 = objc_msgSend(v502, "hk_isBeforeDate:", v503);

    if (!v504)
    {
      v505 = [(_HKMedicalIDData *)self medicationsListModifiedDate];
      v506 = [(_HKMedicalIDData *)v4 medicationsListModifiedDate];
      int v507 = objc_msgSend(v505, "hk_isAfterDate:", v506);

      v508 = [(_HKMedicalIDData *)self medicationsList];
      if (v507)
      {
LABEL_442:
        v513 = self;
        [v513 setMedicationsList:v508];

        v514 = self;
        goto LABEL_452;
      }
      v509 = [(_HKMedicalIDData *)v4 medicationsList];

      if (v508 != v509)
      {
        _HKInitializeLogging();
        v510 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v510, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]8();
        }

        v511 = [(_HKMedicalIDData *)self medicationsList];

        if (!v511)
        {
          _HKInitializeLogging();
          v512 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v512, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]7();
          }
        }
      }
LABEL_441:
      v508 = [(_HKMedicalIDData *)self medicationsList];
      goto LABEL_442;
    }
  }
LABEL_451:
  v523 = [(_HKMedicalIDData *)v4 medicationsList];
  v524 = self;
  [v524 setMedicationsList:v523];

  v514 = v4;
LABEL_452:
  v525 = [(_HKMedicalIDData *)v514 medicationsListModifiedDate];
  v526 = self;
  [v526 setMedicationsListModifiedDate:v525];

  v527 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];
  if (v527)
  {
  }
  else
  {
    v528 = [(_HKMedicalIDData *)v4 medicationsListVersionModifiedDate];

    if (!v528)
    {
      v544 = [(_HKMedicalIDData *)self medicationsListVersion];
      v545 = [(_HKMedicalIDData *)v4 medicationsListVersion];

      if (v544 != v545)
      {
        _HKInitializeLogging();
        v546 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v546, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]3();
        }
      }
      v547 = [(_HKMedicalIDData *)self medicationsListVersion];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v548 = [(_HKMedicalIDData *)self medicationsListVersion];

        if (!v548) {
          goto LABEL_476;
        }
        v549 = [(_HKMedicalIDData *)self medicationsListVersion];
        v550 = self;
        [v550 setMedicationsListVersion:v549];

        v547 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];
        v551 = self;
        [v551 setMedicationsListVersionModifiedDate:v547];
      }
      goto LABEL_476;
    }
  }
  v529 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];

  if (v529)
  {
    v530 = [(_HKMedicalIDData *)v4 medicationsListVersionModifiedDate];

    if (!v530) {
      goto LABEL_466;
    }
    v531 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];
    v532 = [(_HKMedicalIDData *)v4 medicationsListVersionModifiedDate];
    int v533 = objc_msgSend(v531, "hk_isBeforeDate:", v532);

    if (!v533)
    {
      v534 = [(_HKMedicalIDData *)self medicationsListVersionModifiedDate];
      v535 = [(_HKMedicalIDData *)v4 medicationsListVersionModifiedDate];
      int v536 = objc_msgSend(v534, "hk_isAfterDate:", v535);

      v537 = [(_HKMedicalIDData *)self medicationsListVersion];
      if (v536)
      {
LABEL_467:
        v542 = self;
        [v542 setMedicationsListVersion:v537];

        v543 = self;
        goto LABEL_477;
      }
      v538 = [(_HKMedicalIDData *)v4 medicationsListVersion];

      if (v537 != v538)
      {
        _HKInitializeLogging();
        v539 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v539, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]5();
        }

        v540 = [(_HKMedicalIDData *)self medicationsListVersion];

        if (!v540)
        {
          _HKInitializeLogging();
          v541 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v541, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]4();
          }
        }
      }
LABEL_466:
      v537 = [(_HKMedicalIDData *)self medicationsListVersion];
      goto LABEL_467;
    }
  }
LABEL_476:
  v552 = [(_HKMedicalIDData *)v4 medicationsListVersion];
  v553 = self;
  [v553 setMedicationsListVersion:v552];

  v543 = v4;
LABEL_477:
  v554 = [(_HKMedicalIDData *)v543 medicationsListVersionModifiedDate];
  v555 = self;
  [v555 setMedicationsListVersionModifiedDate:v554];

  v556 = [(_HKMedicalIDData *)self allergiesListModifiedDate];
  if (v556)
  {
  }
  else
  {
    v557 = [(_HKMedicalIDData *)v4 allergiesListModifiedDate];

    if (!v557)
    {
      v573 = [(_HKMedicalIDData *)self allergiesList];
      v574 = [(_HKMedicalIDData *)v4 allergiesList];

      if (v573 != v574)
      {
        _HKInitializeLogging();
        v575 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v575, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]0();
        }
      }
      v576 = [(_HKMedicalIDData *)self allergiesList];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v577 = [(_HKMedicalIDData *)self allergiesList];

        if (!v577) {
          goto LABEL_501;
        }
        v578 = [(_HKMedicalIDData *)self allergiesList];
        v579 = self;
        [v579 setAllergiesList:v578];

        v576 = [(_HKMedicalIDData *)self allergiesListModifiedDate];
        v580 = self;
        [v580 setAllergiesListModifiedDate:v576];
      }
      goto LABEL_501;
    }
  }
  v558 = [(_HKMedicalIDData *)self allergiesListModifiedDate];

  if (v558)
  {
    v559 = [(_HKMedicalIDData *)v4 allergiesListModifiedDate];

    if (!v559) {
      goto LABEL_491;
    }
    v560 = [(_HKMedicalIDData *)self allergiesListModifiedDate];
    v561 = [(_HKMedicalIDData *)v4 allergiesListModifiedDate];
    int v562 = objc_msgSend(v560, "hk_isBeforeDate:", v561);

    if (!v562)
    {
      v563 = [(_HKMedicalIDData *)self allergiesListModifiedDate];
      v564 = [(_HKMedicalIDData *)v4 allergiesListModifiedDate];
      int v565 = objc_msgSend(v563, "hk_isAfterDate:", v564);

      v566 = [(_HKMedicalIDData *)self allergiesList];
      if (v565)
      {
LABEL_492:
        v571 = self;
        [v571 setAllergiesList:v566];

        v572 = self;
        goto LABEL_502;
      }
      v567 = [(_HKMedicalIDData *)v4 allergiesList];

      if (v566 != v567)
      {
        _HKInitializeLogging();
        v568 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v568, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]2();
        }

        v569 = [(_HKMedicalIDData *)self allergiesList];

        if (!v569)
        {
          _HKInitializeLogging();
          v570 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v570, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:]1();
          }
        }
      }
LABEL_491:
      v566 = [(_HKMedicalIDData *)self allergiesList];
      goto LABEL_492;
    }
  }
LABEL_501:
  v581 = [(_HKMedicalIDData *)v4 allergiesList];
  v582 = self;
  [v582 setAllergiesList:v581];

  v572 = v4;
LABEL_502:
  v583 = [(_HKMedicalIDData *)v572 allergiesListModifiedDate];
  v584 = self;
  [v584 setAllergiesListModifiedDate:v583];

  v585 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];
  if (v585)
  {
  }
  else
  {
    v586 = [(_HKMedicalIDData *)v4 allergiesListVersionModifiedDate];

    if (!v586)
    {
      v602 = [(_HKMedicalIDData *)self allergiesListVersion];
      v603 = [(_HKMedicalIDData *)v4 allergiesListVersion];

      if (v602 != v603)
      {
        _HKInitializeLogging();
        v604 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v604, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.7();
        }
      }
      v605 = [(_HKMedicalIDData *)self allergiesListVersion];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v606 = [(_HKMedicalIDData *)self allergiesListVersion];

        if (!v606) {
          goto LABEL_526;
        }
        v607 = [(_HKMedicalIDData *)self allergiesListVersion];
        v608 = self;
        [v608 setAllergiesListVersion:v607];

        v605 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];
        v609 = self;
        [v609 setAllergiesListVersionModifiedDate:v605];
      }
      goto LABEL_526;
    }
  }
  v587 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];

  if (v587)
  {
    v588 = [(_HKMedicalIDData *)v4 allergiesListVersionModifiedDate];

    if (!v588) {
      goto LABEL_516;
    }
    v589 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];
    v590 = [(_HKMedicalIDData *)v4 allergiesListVersionModifiedDate];
    int v591 = objc_msgSend(v589, "hk_isBeforeDate:", v590);

    if (!v591)
    {
      v592 = [(_HKMedicalIDData *)self allergiesListVersionModifiedDate];
      v593 = [(_HKMedicalIDData *)v4 allergiesListVersionModifiedDate];
      int v594 = objc_msgSend(v592, "hk_isAfterDate:", v593);

      v595 = [(_HKMedicalIDData *)self allergiesListVersion];
      if (v594)
      {
LABEL_517:
        v600 = self;
        [v600 setAllergiesListVersion:v595];

        v601 = self;
        goto LABEL_527;
      }
      v596 = [(_HKMedicalIDData *)v4 allergiesListVersion];

      if (v595 != v596)
      {
        _HKInitializeLogging();
        v597 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v597, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.9();
        }

        v598 = [(_HKMedicalIDData *)self allergiesListVersion];

        if (!v598)
        {
          _HKInitializeLogging();
          v599 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v599, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.8();
          }
        }
      }
LABEL_516:
      v595 = [(_HKMedicalIDData *)self allergiesListVersion];
      goto LABEL_517;
    }
  }
LABEL_526:
  v610 = [(_HKMedicalIDData *)v4 allergiesListVersion];
  v611 = self;
  [v611 setAllergiesListVersion:v610];

  v601 = v4;
LABEL_527:
  v612 = [(_HKMedicalIDData *)v601 allergiesListVersionModifiedDate];
  v613 = self;
  [v613 setAllergiesListVersionModifiedDate:v612];

  v614 = [(_HKMedicalIDData *)self conditionsListModifiedDate];
  if (v614)
  {
  }
  else
  {
    v615 = [(_HKMedicalIDData *)v4 conditionsListModifiedDate];

    if (!v615)
    {
      v631 = [(_HKMedicalIDData *)self conditionsList];
      v632 = [(_HKMedicalIDData *)v4 conditionsList];

      if (v631 != v632)
      {
        _HKInitializeLogging();
        v633 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v633, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.4();
        }
      }
      v634 = [(_HKMedicalIDData *)self conditionsList];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v635 = [(_HKMedicalIDData *)self conditionsList];

        if (!v635) {
          goto LABEL_551;
        }
        v636 = [(_HKMedicalIDData *)self conditionsList];
        v637 = self;
        [v637 setConditionsList:v636];

        v634 = [(_HKMedicalIDData *)self conditionsListModifiedDate];
        v638 = self;
        [v638 setConditionsListModifiedDate:v634];
      }
      goto LABEL_551;
    }
  }
  v616 = [(_HKMedicalIDData *)self conditionsListModifiedDate];

  if (v616)
  {
    v617 = [(_HKMedicalIDData *)v4 conditionsListModifiedDate];

    if (!v617) {
      goto LABEL_541;
    }
    v618 = [(_HKMedicalIDData *)self conditionsListModifiedDate];
    v619 = [(_HKMedicalIDData *)v4 conditionsListModifiedDate];
    int v620 = objc_msgSend(v618, "hk_isBeforeDate:", v619);

    if (!v620)
    {
      v621 = [(_HKMedicalIDData *)self conditionsListModifiedDate];
      v622 = [(_HKMedicalIDData *)v4 conditionsListModifiedDate];
      int v623 = objc_msgSend(v621, "hk_isAfterDate:", v622);

      v624 = [(_HKMedicalIDData *)self conditionsList];
      if (v623)
      {
LABEL_542:
        v629 = self;
        [v629 setConditionsList:v624];

        v630 = self;
        goto LABEL_552;
      }
      v625 = [(_HKMedicalIDData *)v4 conditionsList];

      if (v624 != v625)
      {
        _HKInitializeLogging();
        v626 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v626, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:].cold.6();
        }

        v627 = [(_HKMedicalIDData *)self conditionsList];

        if (!v627)
        {
          _HKInitializeLogging();
          v628 = (id)HKLogMedicalID;
          if (os_log_type_enabled(v628, OS_LOG_TYPE_ERROR)) {
            -[_HKMedicalIDData merge:].cold.5();
          }
        }
      }
LABEL_541:
      v624 = [(_HKMedicalIDData *)self conditionsList];
      goto LABEL_542;
    }
  }
LABEL_551:
  v639 = [(_HKMedicalIDData *)v4 conditionsList];
  v640 = self;
  [v640 setConditionsList:v639];

  v630 = v4;
LABEL_552:
  v641 = [(_HKMedicalIDData *)v630 conditionsListModifiedDate];
  v642 = self;
  [v642 setConditionsListModifiedDate:v641];

  v643 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];
  if (v643)
  {
  }
  else
  {
    v644 = [(_HKMedicalIDData *)v4 conditionsListVersionModifiedDate];

    if (!v644)
    {
      v660 = [(_HKMedicalIDData *)self conditionsListVersion];
      v661 = [(_HKMedicalIDData *)v4 conditionsListVersion];

      if (v660 != v661)
      {
        _HKInitializeLogging();
        v662 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v662, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]();
        }
      }
      v663 = [(_HKMedicalIDData *)self conditionsListVersion];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v664 = [(_HKMedicalIDData *)self conditionsListVersion];

        if (!v664) {
          goto LABEL_576;
        }
        v665 = [(_HKMedicalIDData *)self conditionsListVersion];
        v666 = self;
        [v666 setConditionsListVersion:v665];

        v663 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];
        v667 = self;
        [v667 setConditionsListVersionModifiedDate:v663];
      }
      goto LABEL_576;
    }
  }
  v645 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];

  if (!v645) {
    goto LABEL_576;
  }
  v646 = [(_HKMedicalIDData *)v4 conditionsListVersionModifiedDate];

  if (!v646)
  {
LABEL_566:
    v653 = [(_HKMedicalIDData *)self conditionsListVersion];
    goto LABEL_567;
  }
  v647 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];
  v648 = [(_HKMedicalIDData *)v4 conditionsListVersionModifiedDate];
  int v649 = objc_msgSend(v647, "hk_isBeforeDate:", v648);

  if (v649)
  {
LABEL_576:
    v668 = [(_HKMedicalIDData *)v4 conditionsListVersion];
    v669 = self;
    [v669 setConditionsListVersion:v668];

    v659 = v4;
    goto LABEL_577;
  }
  v650 = [(_HKMedicalIDData *)self conditionsListVersionModifiedDate];
  v651 = [(_HKMedicalIDData *)v4 conditionsListVersionModifiedDate];
  int v652 = objc_msgSend(v650, "hk_isAfterDate:", v651);

  v653 = [(_HKMedicalIDData *)self conditionsListVersion];
  if (!v652)
  {
    v654 = [(_HKMedicalIDData *)v4 conditionsListVersion];

    if (v653 != v654)
    {
      _HKInitializeLogging();
      v655 = (id)HKLogMedicalID;
      if (os_log_type_enabled(v655, OS_LOG_TYPE_ERROR)) {
        -[_HKMedicalIDData merge:]();
      }

      v656 = [(_HKMedicalIDData *)self conditionsListVersion];

      if (!v656)
      {
        _HKInitializeLogging();
        v657 = (id)HKLogMedicalID;
        if (os_log_type_enabled(v657, OS_LOG_TYPE_ERROR)) {
          -[_HKMedicalIDData merge:]();
        }
      }
    }
    goto LABEL_566;
  }
LABEL_567:
  v658 = self;
  [v658 setConditionsListVersion:v653];

  v659 = self;
LABEL_577:
  v670 = [(_HKMedicalIDData *)v659 conditionsListVersionModifiedDate];
  v671 = self;
  [v671 setConditionsListVersionModifiedDate:v670];

  v672 = v5;
  return v672;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_int isDisabled = a3;
}

- (NSDate)isDisabledModifiedDate
{
  return self->_isDisabledModifiedDate;
}

- (void)setIsDisabledModifiedDate:(id)a3
{
}

- (BOOL)shareDuringEmergency
{
  return self->_shareDuringEmergency;
}

- (void)setShareDuringEmergency:(BOOL)a3
{
  self->_int shareDuringEmergency = a3;
}

- (NSDate)shareDuringEmergencyModifiedDate
{
  return self->_shareDuringEmergencyModifiedDate;
}

- (void)setShareDuringEmergencyModifiedDate:(id)a3
{
}

- (NSData)pictureData
{
  return self->_pictureData;
}

- (void)setPictureData:(id)a3
{
}

- (NSDate)pictureDataModifiedDate
{
  return self->_pictureDataModifiedDate;
}

- (void)setPictureDataModifiedDate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)nameModifiedDate
{
  return self->_nameModifiedDate;
}

- (void)setNameModifiedDate:(id)a3
{
}

- (NSDate)gmtBirthdate
{
  return self->_gmtBirthdate;
}

- (void)setGmtBirthdate:(id)a3
{
}

- (NSDate)gregorianBirthdayModifiedDate
{
  return self->_gregorianBirthdayModifiedDate;
}

- (void)setGregorianBirthdayModifiedDate:(id)a3
{
}

- (NSString)primaryLanguageCode
{
  return self->_primaryLanguageCode;
}

- (void)setPrimaryLanguageCode:(id)a3
{
}

- (NSDate)primaryLanguageCodeModifiedDate
{
  return self->_primaryLanguageCodeModifiedDate;
}

- (void)setPrimaryLanguageCodeModifiedDate:(id)a3
{
}

- (HKQuantity)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
}

- (NSDate)heightModifiedDate
{
  return self->_heightModifiedDate;
}

- (void)setHeightModifiedDate:(id)a3
{
}

- (HKQuantity)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
}

- (NSDate)weightModifiedDate
{
  return self->_weightModifiedDate;
}

- (void)setWeightModifiedDate:(id)a3
{
}

- (int64_t)bloodType
{
  return self->_bloodType;
}

- (void)setBloodType:(int64_t)a3
{
  self->_int64_t bloodType = a3;
}

- (NSDate)bloodTypeModifiedDate
{
  return self->_bloodTypeModifiedDate;
}

- (void)setBloodTypeModifiedDate:(id)a3
{
}

- (NSNumber)isOrganDonor
{
  return self->_isOrganDonor;
}

- (void)setIsOrganDonor:(id)a3
{
}

- (NSDate)isOrganDonorModifiedDate
{
  return self->_isOrganDonorModifiedDate;
}

- (void)setIsOrganDonorModifiedDate:(id)a3
{
}

- (NSArray)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void)setEmergencyContacts:(id)a3
{
}

- (NSDate)emergencyContactsModifiedDate
{
  return self->_emergencyContactsModifiedDate;
}

- (void)setEmergencyContactsModifiedDate:(id)a3
{
}

- (NSArray)clinicalContacts
{
  return self->_clinicalContacts;
}

- (void)setClinicalContacts:(id)a3
{
}

- (NSDate)clinicalContactsModifiedDate
{
  return self->_clinicalContactsModifiedDate;
}

- (void)setClinicalContactsModifiedDate:(id)a3
{
}

- (NSString)medicalConditions
{
  return self->_medicalConditions;
}

- (void)setMedicalConditions:(id)a3
{
}

- (NSDate)medicalConditionsModifiedDate
{
  return self->_medicalConditionsModifiedDate;
}

- (void)setMedicalConditionsModifiedDate:(id)a3
{
}

- (NSString)medicalNotes
{
  return self->_medicalNotes;
}

- (void)setMedicalNotes:(id)a3
{
}

- (NSDate)medicalNotesModifiedDate
{
  return self->_medicalNotesModifiedDate;
}

- (void)setMedicalNotesModifiedDate:(id)a3
{
}

- (NSString)allergyInfo
{
  return self->_allergyInfo;
}

- (void)setAllergyInfo:(id)a3
{
}

- (NSDate)allergyInfoModifiedDate
{
  return self->_allergyInfoModifiedDate;
}

- (void)setAllergyInfoModifiedDate:(id)a3
{
}

- (NSString)medicationInfo
{
  return self->_medicationInfo;
}

- (void)setMedicationInfo:(id)a3
{
}

- (NSDate)medicationInfoModifiedDate
{
  return self->_medicationInfoModifiedDate;
}

- (void)setMedicationInfoModifiedDate:(id)a3
{
}

- (NSDate)pregnancyStartDate
{
  return self->_pregnancyStartDate;
}

- (void)setPregnancyStartDate:(id)a3
{
}

- (NSString)pregnancyStartDateTimeZoneID
{
  return self->_pregnancyStartDateTimeZoneID;
}

- (void)setPregnancyStartDateTimeZoneID:(id)a3
{
}

- (NSDate)pregnancyStartDateModifiedDate
{
  return self->_pregnancyStartDateModifiedDate;
}

- (void)setPregnancyStartDateModifiedDate:(id)a3
{
}

- (NSDate)pregnancyEstimatedDueDate
{
  return self->_pregnancyEstimatedDueDate;
}

- (void)setPregnancyEstimatedDueDate:(id)a3
{
}

- (NSDate)pregnancyEstimatedDueDateModifiedDate
{
  return self->_pregnancyEstimatedDueDateModifiedDate;
}

- (void)setPregnancyEstimatedDueDateModifiedDate:(id)a3
{
}

- (NSArray)medicationsList
{
  return self->_medicationsList;
}

- (void)setMedicationsList:(id)a3
{
}

- (NSDate)medicationsListModifiedDate
{
  return self->_medicationsListModifiedDate;
}

- (void)setMedicationsListModifiedDate:(id)a3
{
}

- (NSNumber)medicationsListVersion
{
  return self->_medicationsListVersion;
}

- (void)setMedicationsListVersion:(id)a3
{
}

- (NSDate)medicationsListVersionModifiedDate
{
  return self->_medicationsListVersionModifiedDate;
}

- (void)setMedicationsListVersionModifiedDate:(id)a3
{
}

- (NSArray)allergiesList
{
  return self->_allergiesList;
}

- (void)setAllergiesList:(id)a3
{
}

- (NSDate)allergiesListModifiedDate
{
  return self->_allergiesListModifiedDate;
}

- (void)setAllergiesListModifiedDate:(id)a3
{
}

- (NSNumber)allergiesListVersion
{
  return self->_allergiesListVersion;
}

- (void)setAllergiesListVersion:(id)a3
{
}

- (NSDate)allergiesListVersionModifiedDate
{
  return self->_allergiesListVersionModifiedDate;
}

- (void)setAllergiesListVersionModifiedDate:(id)a3
{
}

- (NSArray)conditionsList
{
  return self->_conditionsList;
}

- (void)setConditionsList:(id)a3
{
}

- (NSDate)conditionsListModifiedDate
{
  return self->_conditionsListModifiedDate;
}

- (void)setConditionsListModifiedDate:(id)a3
{
}

- (NSNumber)conditionsListVersion
{
  return self->_conditionsListVersion;
}

- (void)setConditionsListVersion:(id)a3
{
}

- (NSDate)conditionsListVersionModifiedDate
{
  return self->_conditionsListVersionModifiedDate;
}

- (void)setConditionsListVersionModifiedDate:(id)a3
{
}

- (NSDate)birthdate
{
  return self->_birthdate;
}

- (void)setBirthdate:(id)a3
{
}

- (NSDate)legacyDateSaved
{
  return self->_legacyDateSaved;
}

- (void)setLegacyDateSaved:(id)a3
{
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(int64_t)a3
{
  self->_schemaVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDateSaved, 0);
  objc_storeStrong((id *)&self->_birthdate, 0);
  objc_storeStrong((id *)&self->_conditionsListVersionModifiedDate, 0);
  objc_storeStrong((id *)&self->_conditionsListVersion, 0);
  objc_storeStrong((id *)&self->_conditionsListModifiedDate, 0);
  objc_storeStrong((id *)&self->_conditionsList, 0);
  objc_storeStrong((id *)&self->_allergiesListVersionModifiedDate, 0);
  objc_storeStrong((id *)&self->_allergiesListVersion, 0);
  objc_storeStrong((id *)&self->_allergiesListModifiedDate, 0);
  objc_storeStrong((id *)&self->_allergiesList, 0);
  objc_storeStrong((id *)&self->_medicationsListVersionModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicationsListVersion, 0);
  objc_storeStrong((id *)&self->_medicationsListModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicationsList, 0);
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDateModifiedDate, 0);
  objc_storeStrong((id *)&self->_pregnancyEstimatedDueDate, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDateModifiedDate, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDateTimeZoneID, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDate, 0);
  objc_storeStrong((id *)&self->_medicationInfoModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicationInfo, 0);
  objc_storeStrong((id *)&self->_allergyInfoModifiedDate, 0);
  objc_storeStrong((id *)&self->_allergyInfo, 0);
  objc_storeStrong((id *)&self->_medicalNotesModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicalNotes, 0);
  objc_storeStrong((id *)&self->_medicalConditionsModifiedDate, 0);
  objc_storeStrong((id *)&self->_medicalConditions, 0);
  objc_storeStrong((id *)&self->_clinicalContactsModifiedDate, 0);
  objc_storeStrong((id *)&self->_clinicalContacts, 0);
  objc_storeStrong((id *)&self->_emergencyContactsModifiedDate, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_isOrganDonorModifiedDate, 0);
  objc_storeStrong((id *)&self->_isOrganDonor, 0);
  objc_storeStrong((id *)&self->_bloodTypeModifiedDate, 0);
  objc_storeStrong((id *)&self->_weightModifiedDate, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_heightModifiedDate, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCodeModifiedDate, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
  objc_storeStrong((id *)&self->_gregorianBirthdayModifiedDate, 0);
  objc_storeStrong((id *)&self->_gmtBirthdate, 0);
  objc_storeStrong((id *)&self->_nameModifiedDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pictureDataModifiedDate, 0);
  objc_storeStrong((id *)&self->_pictureData, 0);
  objc_storeStrong((id *)&self->_shareDuringEmergencyModifiedDate, 0);

  objc_storeStrong((id *)&self->_isDisabledModifiedDate, 0);
}

- (id)consolidatedSOSContactsWithSOSContactsManager:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 legacyContactsManager];
  uint64_t v32 = [v4 SOSLegacyContacts];
  id v5 = [(_HKMedicalIDData *)self emergencyContacts];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
  }
  id v33 = v8;

  uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v10 = [(_HKMedicalIDData *)self emergencyContacts];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        BOOL v16 = objc_alloc_init(_HKEmergencyContactWrapper);
        [(_HKEmergencyContactWrapper *)v16 setContact:v15];
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v12);
  }

  uint64_t v17 = v32;
  if ([v32 count])
  {
    int v31 = v4;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v32;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          v24 = objc_alloc_init(_HKEmergencyContact);
          uint64_t v25 = [v23 name];
          [(_HKEmergencyContact *)v24 setName:v25];

          uint64_t v26 = [v23 nameContactIdentifier];
          [(_HKEmergencyContact *)v24 setNameContactIdentifier:v26];

          uint64_t v27 = [v23 phoneNumber];
          [(_HKEmergencyContact *)v24 setPhoneNumber:v27];

          v28 = [v23 phoneNumberContactIdentifier];
          [(_HKEmergencyContact *)v24 setPhoneNumberContactIdentifier:v28];

          uint64_t v29 = objc_alloc_init(_HKEmergencyContactWrapper);
          [(_HKEmergencyContactWrapper *)v29 setContact:v24];
          if (([v9 containsObject:v29] & 1) == 0) {
            [v33 addObject:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v20);
    }

    uint64_t v4 = v31;
    uint64_t v17 = v32;
  }

  return v33;
}

- (void)merge:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Conditions List Version");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Conditions List Version");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Conditions List Version");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() conditionsListVersionModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Conditions List");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.5()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Conditions List");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.6()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Conditions List");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() conditionsListModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.7()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergies List Version");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.8()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergies List Version");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.9()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergies List Version");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() allergiesListVersionModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.10()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergies List");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.11()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergies List");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.12()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergies List");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() allergiesListModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.13()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medications List Version");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.14()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medications List Version");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.15()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medications List Version");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() medicationsListVersionModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.16()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medications List");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.17()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medications List");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.18()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medications List");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() medicationsListModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.19()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Pregnancy Estimated Due Date");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.20()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Pregnancy Estimated Due Date");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.21()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Pregnancy Estimated Due Date");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() pregnancyEstimatedDueDateModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.22()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Pregnancy Start Date");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.23()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Pregnancy Start Date");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.24()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Pregnancy Start Date");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() pregnancyStartDateModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.25()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medication");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.26()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medication");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.27()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medication");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() medicationInfoModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.28()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergy");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.29()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergy");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.30()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Allergy");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() allergyInfoModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.31()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medical Notes");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.32()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medical Notes");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.33()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medical Notes");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() medicalNotesModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.34()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medical Conditions");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.35()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medical Conditions");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.36()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Medical Conditions");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() medicalConditionsModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.37()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Clinical Contacts");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.38()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Clinical Contacts");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.39()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Clinical Contacts");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() clinicalContactsModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.40()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Emergency Contacts");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.41()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Emergency Contacts");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.42()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Emergency Contacts");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() emergencyContactsModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.43()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Blood Type");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ flags with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.44()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Blood Type");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() bloodTypeModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ flags with equal modification dates %{public}@", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.45()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Organ Donor");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.46()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Organ Donor");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.47()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Organ Donor");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() isOrganDonorModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.48()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Weight");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.49()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Weight");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.50()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Weight");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() weightModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.51()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Height");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.52()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Height");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.53()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Height");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() heightModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.54()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Primary Language Code");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.55()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Primary Language Code");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.56()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Primary Language Code");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() primaryLanguageCodeModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.57()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Gregorian Birthday");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.58()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Gregorian Birthday");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.59()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Gregorian Birthday");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() gregorianBirthdayModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.60()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Name");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.61()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Name");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.62()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Name");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() nameModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.63()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Picture");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ fields with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.64()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Picture");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Setting %{public}@ field to nil.", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.65()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Picture");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() pictureDataModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ fields with equal modification dates %{public}@.", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.66()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Share During Emergency");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ flags with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.67()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Share During Emergency");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() shareDuringEmergencyModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ flags with equal modification dates %{public}@", v5, v6, v7, v8, v9);
}

- (void)merge:.cold.68()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Disabled");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v1, v2, "%{public}@ Medical ID merge encountered different %{public}@ flags with nil modification dates", v3, v4, v5, v6, v7);
}

- (void)merge:.cold.69()
{
  OUTLINED_FUNCTION_4_0();
  HKSensitiveLogItem(@"Disabled");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() isDisabledModifiedDate];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v3, v4, "%{public}@ Medical ID merge encountered different %{public}@ flags with equal modification dates %{public}@", v5, v6, v7, v8, v9);
}

@end