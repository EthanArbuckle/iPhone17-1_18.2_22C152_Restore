@interface HDCodableMedicalIDData
+ (Class)allergiesListType;
+ (Class)clinicalContactsType;
+ (Class)conditionsListType;
+ (Class)emergencyContactsType;
+ (Class)medicationsListType;
- (BOOL)hasAllergiesListModifiedDate;
- (BOOL)hasAllergiesListVersion;
- (BOOL)hasAllergiesListVersionModifiedDate;
- (BOOL)hasAllergyInfo;
- (BOOL)hasAllergyInfoModifiedDate;
- (BOOL)hasBloodType;
- (BOOL)hasBloodTypeModifiedDate;
- (BOOL)hasClinicalContactsModifiedDate;
- (BOOL)hasConditionsListModifiedDate;
- (BOOL)hasConditionsListVersion;
- (BOOL)hasConditionsListVersionModifiedDate;
- (BOOL)hasDateSaved;
- (BOOL)hasEmergencyContactsModifiedDate;
- (BOOL)hasGregorianBirthday;
- (BOOL)hasGregorianBirthdayModifiedDate;
- (BOOL)hasHeight;
- (BOOL)hasHeightModifiedDate;
- (BOOL)hasIsDisabled;
- (BOOL)hasIsDisabledModifiedDate;
- (BOOL)hasIsOrganDonor;
- (BOOL)hasIsOrganDonorModifiedDate;
- (BOOL)hasMedicalConditions;
- (BOOL)hasMedicalConditionsModifiedDate;
- (BOOL)hasMedicalIDBytes;
- (BOOL)hasMedicalNotes;
- (BOOL)hasMedicalNotesModifiedDate;
- (BOOL)hasMedicationInfo;
- (BOOL)hasMedicationInfoModifiedDate;
- (BOOL)hasMedicationsListModifiedDate;
- (BOOL)hasMedicationsListVersion;
- (BOOL)hasMedicationsListVersionModifiedDate;
- (BOOL)hasName;
- (BOOL)hasNameModifiedDate;
- (BOOL)hasPictureData;
- (BOOL)hasPictureDataModifiedDate;
- (BOOL)hasPregnancyEstimatedDueDate;
- (BOOL)hasPregnancyEstimatedDueDateModifiedDate;
- (BOOL)hasPregnancyStartDate;
- (BOOL)hasPregnancyStartDateModifiedDate;
- (BOOL)hasPrimaryLanguageCode;
- (BOOL)hasPrimaryLanguageCodeModifiedDate;
- (BOOL)hasSchemaVersion;
- (BOOL)hasShareDuringEmergency;
- (BOOL)hasShareDuringEmergencyModifiedDate;
- (BOOL)hasWeight;
- (BOOL)hasWeightModifiedDate;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shareDuringEmergency;
- (HDCodableDateComponents)gregorianBirthday;
- (HDCodableQuantity)height;
- (HDCodableQuantity)weight;
- (NSData)medicalIDBytes;
- (NSData)pictureData;
- (NSMutableArray)allergiesLists;
- (NSMutableArray)clinicalContacts;
- (NSMutableArray)conditionsLists;
- (NSMutableArray)emergencyContacts;
- (NSMutableArray)medicationsLists;
- (NSString)allergyInfo;
- (NSString)medicalConditions;
- (NSString)medicalNotes;
- (NSString)medicationInfo;
- (NSString)name;
- (NSString)primaryLanguageCode;
- (double)allergiesListModifiedDate;
- (double)allergiesListVersionModifiedDate;
- (double)allergyInfoModifiedDate;
- (double)bloodTypeModifiedDate;
- (double)clinicalContactsModifiedDate;
- (double)conditionsListModifiedDate;
- (double)conditionsListVersionModifiedDate;
- (double)dateSaved;
- (double)emergencyContactsModifiedDate;
- (double)gregorianBirthdayModifiedDate;
- (double)heightModifiedDate;
- (double)isDisabledModifiedDate;
- (double)isOrganDonorModifiedDate;
- (double)medicalConditionsModifiedDate;
- (double)medicalNotesModifiedDate;
- (double)medicationInfoModifiedDate;
- (double)medicationsListModifiedDate;
- (double)medicationsListVersionModifiedDate;
- (double)nameModifiedDate;
- (double)pictureDataModifiedDate;
- (double)pregnancyEstimatedDueDate;
- (double)pregnancyEstimatedDueDateModifiedDate;
- (double)pregnancyStartDate;
- (double)pregnancyStartDateModifiedDate;
- (double)primaryLanguageCodeModifiedDate;
- (double)shareDuringEmergencyModifiedDate;
- (double)weightModifiedDate;
- (id)allergiesListAtIndex:(unint64_t)a3;
- (id)bloodTypeAsString:(int)a3;
- (id)clinicalContactsAtIndex:(unint64_t)a3;
- (id)conditionsListAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emergencyContactsAtIndex:(unint64_t)a3;
- (id)medicationsListAtIndex:(unint64_t)a3;
- (int)StringAsBloodType:(id)a3;
- (int)bloodType;
- (int64_t)allergiesListVersion;
- (int64_t)conditionsListVersion;
- (int64_t)isOrganDonor;
- (int64_t)medicationsListVersion;
- (unint64_t)allergiesListsCount;
- (unint64_t)clinicalContactsCount;
- (unint64_t)conditionsListsCount;
- (unint64_t)emergencyContactsCount;
- (unint64_t)hash;
- (unint64_t)medicationsListsCount;
- (unsigned)schemaVersion;
- (void)addAllergiesList:(id)a3;
- (void)addClinicalContacts:(id)a3;
- (void)addConditionsList:(id)a3;
- (void)addEmergencyContacts:(id)a3;
- (void)addMedicationsList:(id)a3;
- (void)clearAllergiesLists;
- (void)clearClinicalContacts;
- (void)clearConditionsLists;
- (void)clearEmergencyContacts;
- (void)clearMedicationsLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllergiesListModifiedDate:(double)a3;
- (void)setAllergiesListVersion:(int64_t)a3;
- (void)setAllergiesListVersionModifiedDate:(double)a3;
- (void)setAllergiesLists:(id)a3;
- (void)setAllergyInfo:(id)a3;
- (void)setAllergyInfoModifiedDate:(double)a3;
- (void)setBloodType:(int)a3;
- (void)setBloodTypeModifiedDate:(double)a3;
- (void)setClinicalContacts:(id)a3;
- (void)setClinicalContactsModifiedDate:(double)a3;
- (void)setConditionsListModifiedDate:(double)a3;
- (void)setConditionsListVersion:(int64_t)a3;
- (void)setConditionsListVersionModifiedDate:(double)a3;
- (void)setConditionsLists:(id)a3;
- (void)setDateSaved:(double)a3;
- (void)setEmergencyContacts:(id)a3;
- (void)setEmergencyContactsModifiedDate:(double)a3;
- (void)setGregorianBirthday:(id)a3;
- (void)setGregorianBirthdayModifiedDate:(double)a3;
- (void)setHasAllergiesListModifiedDate:(BOOL)a3;
- (void)setHasAllergiesListVersion:(BOOL)a3;
- (void)setHasAllergiesListVersionModifiedDate:(BOOL)a3;
- (void)setHasAllergyInfoModifiedDate:(BOOL)a3;
- (void)setHasBloodType:(BOOL)a3;
- (void)setHasBloodTypeModifiedDate:(BOOL)a3;
- (void)setHasClinicalContactsModifiedDate:(BOOL)a3;
- (void)setHasConditionsListModifiedDate:(BOOL)a3;
- (void)setHasConditionsListVersion:(BOOL)a3;
- (void)setHasConditionsListVersionModifiedDate:(BOOL)a3;
- (void)setHasDateSaved:(BOOL)a3;
- (void)setHasEmergencyContactsModifiedDate:(BOOL)a3;
- (void)setHasGregorianBirthdayModifiedDate:(BOOL)a3;
- (void)setHasHeightModifiedDate:(BOOL)a3;
- (void)setHasIsDisabled:(BOOL)a3;
- (void)setHasIsDisabledModifiedDate:(BOOL)a3;
- (void)setHasIsOrganDonor:(BOOL)a3;
- (void)setHasIsOrganDonorModifiedDate:(BOOL)a3;
- (void)setHasMedicalConditionsModifiedDate:(BOOL)a3;
- (void)setHasMedicalNotesModifiedDate:(BOOL)a3;
- (void)setHasMedicationInfoModifiedDate:(BOOL)a3;
- (void)setHasMedicationsListModifiedDate:(BOOL)a3;
- (void)setHasMedicationsListVersion:(BOOL)a3;
- (void)setHasMedicationsListVersionModifiedDate:(BOOL)a3;
- (void)setHasNameModifiedDate:(BOOL)a3;
- (void)setHasPictureDataModifiedDate:(BOOL)a3;
- (void)setHasPregnancyEstimatedDueDate:(BOOL)a3;
- (void)setHasPregnancyEstimatedDueDateModifiedDate:(BOOL)a3;
- (void)setHasPregnancyStartDate:(BOOL)a3;
- (void)setHasPregnancyStartDateModifiedDate:(BOOL)a3;
- (void)setHasPrimaryLanguageCodeModifiedDate:(BOOL)a3;
- (void)setHasSchemaVersion:(BOOL)a3;
- (void)setHasShareDuringEmergency:(BOOL)a3;
- (void)setHasShareDuringEmergencyModifiedDate:(BOOL)a3;
- (void)setHasWeightModifiedDate:(BOOL)a3;
- (void)setHeight:(id)a3;
- (void)setHeightModifiedDate:(double)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsDisabledModifiedDate:(double)a3;
- (void)setIsOrganDonor:(int64_t)a3;
- (void)setIsOrganDonorModifiedDate:(double)a3;
- (void)setMedicalConditions:(id)a3;
- (void)setMedicalConditionsModifiedDate:(double)a3;
- (void)setMedicalIDBytes:(id)a3;
- (void)setMedicalNotes:(id)a3;
- (void)setMedicalNotesModifiedDate:(double)a3;
- (void)setMedicationInfo:(id)a3;
- (void)setMedicationInfoModifiedDate:(double)a3;
- (void)setMedicationsListModifiedDate:(double)a3;
- (void)setMedicationsListVersion:(int64_t)a3;
- (void)setMedicationsListVersionModifiedDate:(double)a3;
- (void)setMedicationsLists:(id)a3;
- (void)setName:(id)a3;
- (void)setNameModifiedDate:(double)a3;
- (void)setPictureData:(id)a3;
- (void)setPictureDataModifiedDate:(double)a3;
- (void)setPregnancyEstimatedDueDate:(double)a3;
- (void)setPregnancyEstimatedDueDateModifiedDate:(double)a3;
- (void)setPregnancyStartDate:(double)a3;
- (void)setPregnancyStartDateModifiedDate:(double)a3;
- (void)setPrimaryLanguageCode:(id)a3;
- (void)setPrimaryLanguageCodeModifiedDate:(double)a3;
- (void)setSchemaVersion:(unsigned int)a3;
- (void)setShareDuringEmergency:(BOOL)a3;
- (void)setShareDuringEmergencyModifiedDate:(double)a3;
- (void)setWeight:(id)a3;
- (void)setWeightModifiedDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicalIDData

- (BOOL)hasMedicalIDBytes
{
  return self->_medicalIDBytes != 0;
}

- (void)setDateSaved:(double)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_dateSaved = a3;
}

- (void)setHasDateSaved:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDateSaved
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSchemaVersion:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_schemaVersion = a3;
}

- (void)setHasSchemaVersion:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasSchemaVersion
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setIsDisabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_isDisabled = a3;
}

- (void)setHasIsDisabled:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsDisabled
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsDisabledModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_isDisabledModifiedDate = a3;
}

- (void)setHasIsDisabledModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasIsDisabledModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasPictureData
{
  return self->_pictureData != 0;
}

- (void)setPictureDataModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_pictureDataModifiedDate = a3;
}

- (void)setHasPictureDataModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPictureDataModifiedDate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setNameModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_nameModifiedDate = a3;
}

- (void)setHasNameModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasNameModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasGregorianBirthday
{
  return self->_gregorianBirthday != 0;
}

- (void)setGregorianBirthdayModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_gregorianBirthdayModifiedDate = a3;
}

- (void)setHasGregorianBirthdayModifiedDate:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGregorianBirthdayModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasHeight
{
  return self->_height != 0;
}

- (void)setHeightModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_heightModifiedDate = a3;
}

- (void)setHasHeightModifiedDate:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasHeightModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasWeight
{
  return self->_weight != 0;
}

- (void)setWeightModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_weightModifiedDate = a3;
}

- (void)setHasWeightModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasWeightModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (int)bloodType
{
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    return self->_bloodType;
  }
  else {
    return 0;
  }
}

- (void)setBloodType:(int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_bloodType = a3;
}

- (void)setHasBloodType:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasBloodType
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (id)bloodTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E62FA3F0[a3];
  }

  return v3;
}

- (int)StringAsBloodType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSet"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APositive"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANegative"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BPositive"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BNegative"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ABPositive"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ABNegative"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"OPositive"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ONegative"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setBloodTypeModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_bloodTypeModifiedDate = a3;
}

- (void)setHasBloodTypeModifiedDate:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBloodTypeModifiedDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsOrganDonor:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_isOrganDonor = a3;
}

- (void)setHasIsOrganDonor:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIsOrganDonor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsOrganDonorModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_isOrganDonorModifiedDate = a3;
}

- (void)setHasIsOrganDonorModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasIsOrganDonorModifiedDate
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearEmergencyContacts
{
}

- (void)addEmergencyContacts:(id)a3
{
  id v4 = a3;
  emergencyContacts = self->_emergencyContacts;
  id v8 = v4;
  if (!emergencyContacts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_emergencyContacts;
    self->_emergencyContacts = v6;

    id v4 = v8;
    emergencyContacts = self->_emergencyContacts;
  }
  [(NSMutableArray *)emergencyContacts addObject:v4];
}

- (unint64_t)emergencyContactsCount
{
  return [(NSMutableArray *)self->_emergencyContacts count];
}

- (id)emergencyContactsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_emergencyContacts objectAtIndex:a3];
}

+ (Class)emergencyContactsType
{
  return (Class)objc_opt_class();
}

- (void)setEmergencyContactsModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_emergencyContactsModifiedDate = a3;
}

- (void)setHasEmergencyContactsModifiedDate:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasEmergencyContactsModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearClinicalContacts
{
}

- (void)addClinicalContacts:(id)a3
{
  id v4 = a3;
  clinicalContacts = self->_clinicalContacts;
  id v8 = v4;
  if (!clinicalContacts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clinicalContacts;
    self->_clinicalContacts = v6;

    id v4 = v8;
    clinicalContacts = self->_clinicalContacts;
  }
  [(NSMutableArray *)clinicalContacts addObject:v4];
}

- (unint64_t)clinicalContactsCount
{
  return [(NSMutableArray *)self->_clinicalContacts count];
}

- (id)clinicalContactsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clinicalContacts objectAtIndex:a3];
}

+ (Class)clinicalContactsType
{
  return (Class)objc_opt_class();
}

- (void)setClinicalContactsModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_clinicalContactsModifiedDate = a3;
}

- (void)setHasClinicalContactsModifiedDate:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasClinicalContactsModifiedDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasMedicalConditions
{
  return self->_medicalConditions != 0;
}

- (void)setMedicalConditionsModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_medicalConditionsModifiedDate = a3;
}

- (void)setHasMedicalConditionsModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMedicalConditionsModifiedDate
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasMedicalNotes
{
  return self->_medicalNotes != 0;
}

- (void)setMedicalNotesModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_medicalNotesModifiedDate = a3;
}

- (void)setHasMedicalNotesModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMedicalNotesModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasAllergyInfo
{
  return self->_allergyInfo != 0;
}

- (void)setAllergyInfoModifiedDate:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_allergyInfoModifiedDate = a3;
}

- (void)setHasAllergyInfoModifiedDate:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAllergyInfoModifiedDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasMedicationInfo
{
  return self->_medicationInfo != 0;
}

- (void)setMedicationInfoModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_medicationInfoModifiedDate = a3;
}

- (void)setHasMedicationInfoModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMedicationInfoModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setShareDuringEmergency:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_shareDuringEmergency = a3;
}

- (void)setHasShareDuringEmergency:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasShareDuringEmergency
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setShareDuringEmergencyModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_shareDuringEmergencyModifiedDate = a3;
}

- (void)setHasShareDuringEmergencyModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasShareDuringEmergencyModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasPrimaryLanguageCode
{
  return self->_primaryLanguageCode != 0;
}

- (void)setPrimaryLanguageCodeModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_primaryLanguageCodeModifiedDate = a3;
}

- (void)setHasPrimaryLanguageCodeModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasPrimaryLanguageCodeModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setPregnancyStartDate:(double)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_pregnancyStartDate = a3;
}

- (void)setHasPregnancyStartDate:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasPregnancyStartDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setPregnancyStartDateModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_pregnancyStartDateModifiedDate = a3;
}

- (void)setHasPregnancyStartDateModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasPregnancyStartDateModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setPregnancyEstimatedDueDate:(double)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_pregnancyEstimatedDueDate = a3;
}

- (void)setHasPregnancyEstimatedDueDate:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasPregnancyEstimatedDueDate
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setPregnancyEstimatedDueDateModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_pregnancyEstimatedDueDateModifiedDate = a3;
}

- (void)setHasPregnancyEstimatedDueDateModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPregnancyEstimatedDueDateModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)clearMedicationsLists
{
}

- (void)addMedicationsList:(id)a3
{
  id v4 = a3;
  medicationsLists = self->_medicationsLists;
  id v8 = v4;
  if (!medicationsLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_medicationsLists;
    self->_medicationsLists = v6;

    id v4 = v8;
    medicationsLists = self->_medicationsLists;
  }
  [(NSMutableArray *)medicationsLists addObject:v4];
}

- (unint64_t)medicationsListsCount
{
  return [(NSMutableArray *)self->_medicationsLists count];
}

- (id)medicationsListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_medicationsLists objectAtIndex:a3];
}

+ (Class)medicationsListType
{
  return (Class)objc_opt_class();
}

- (void)setMedicationsListModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_medicationsListModifiedDate = a3;
}

- (void)setHasMedicationsListModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMedicationsListModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMedicationsListVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_medicationsListVersion = a3;
}

- (void)setHasMedicationsListVersion:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMedicationsListVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMedicationsListVersionModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_medicationsListVersionModifiedDate = a3;
}

- (void)setHasMedicationsListVersionModifiedDate:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMedicationsListVersionModifiedDate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)clearAllergiesLists
{
}

- (void)addAllergiesList:(id)a3
{
  id v4 = a3;
  allergiesLists = self->_allergiesLists;
  id v8 = v4;
  if (!allergiesLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_allergiesLists;
    self->_allergiesLists = v6;

    id v4 = v8;
    allergiesLists = self->_allergiesLists;
  }
  [(NSMutableArray *)allergiesLists addObject:v4];
}

- (unint64_t)allergiesListsCount
{
  return [(NSMutableArray *)self->_allergiesLists count];
}

- (id)allergiesListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allergiesLists objectAtIndex:a3];
}

+ (Class)allergiesListType
{
  return (Class)objc_opt_class();
}

- (void)setAllergiesListModifiedDate:(double)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_allergiesListModifiedDate = a3;
}

- (void)setHasAllergiesListModifiedDate:(BOOL)a3
{
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAllergiesListModifiedDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAllergiesListVersion:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_allergiesListVersion = a3;
}

- (void)setHasAllergiesListVersion:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAllergiesListVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAllergiesListVersionModifiedDate:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_allergiesListVersionModifiedDate = a3;
}

- (void)setHasAllergiesListVersionModifiedDate:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAllergiesListVersionModifiedDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearConditionsLists
{
}

- (void)addConditionsList:(id)a3
{
  id v4 = a3;
  conditionsLists = self->_conditionsLists;
  id v8 = v4;
  if (!conditionsLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_conditionsLists;
    self->_conditionsLists = v6;

    id v4 = v8;
    conditionsLists = self->_conditionsLists;
  }
  [(NSMutableArray *)conditionsLists addObject:v4];
}

- (unint64_t)conditionsListsCount
{
  return [(NSMutableArray *)self->_conditionsLists count];
}

- (id)conditionsListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_conditionsLists objectAtIndex:a3];
}

+ (Class)conditionsListType
{
  return (Class)objc_opt_class();
}

- (void)setConditionsListModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_conditionsListModifiedDate = a3;
}

- (void)setHasConditionsListModifiedDate:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasConditionsListModifiedDate
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setConditionsListVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_conditionsListVersion = a3;
}

- (void)setHasConditionsListVersion:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasConditionsListVersion
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setConditionsListVersionModifiedDate:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_conditionsListVersionModifiedDate = a3;
}

- (void)setHasConditionsListVersionModifiedDate:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($668054F355966D14195D4E399A549C9C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasConditionsListVersionModifiedDate
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicalIDData;
  id v4 = [(HDCodableMedicalIDData *)&v8 description];
  v5 = [(HDCodableMedicalIDData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  medicalIDBytes = self->_medicalIDBytes;
  if (medicalIDBytes) {
    [v3 setObject:medicalIDBytes forKey:@"medicalIDBytes"];
  }
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    v79 = [NSNumber numberWithDouble:self->_dateSaved];
    [v4 setObject:v79 forKey:@"dateSaved"];

    $668054F355966D14195D4E399A549C9C has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(void *)&has & 0x200000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_122;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  v80 = [NSNumber numberWithUnsignedInt:self->_schemaVersion];
  [v4 setObject:v80 forKey:@"schemaVersion"];

  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_122:
  v81 = [NSNumber numberWithBool:self->_isDisabled];
  [v4 setObject:v81 forKey:@"isDisabled"];

  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithDouble:self->_isDisabledModifiedDate];
    [v4 setObject:v7 forKey:@"isDisabledModifiedDate"];
  }
LABEL_8:
  pictureData = self->_pictureData;
  if (pictureData) {
    [v4 setObject:pictureData forKey:@"pictureData"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_pictureDataModifiedDate];
    [v4 setObject:v9 forKey:@"pictureDataModifiedDate"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_nameModifiedDate];
    [v4 setObject:v11 forKey:@"nameModifiedDate"];
  }
  gregorianBirthday = self->_gregorianBirthday;
  if (gregorianBirthday)
  {
    v13 = [(HDCodableDateComponents *)gregorianBirthday dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"gregorianBirthday"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    v14 = [NSNumber numberWithDouble:self->_gregorianBirthdayModifiedDate];
    [v4 setObject:v14 forKey:@"gregorianBirthdayModifiedDate"];
  }
  height = self->_height;
  if (height)
  {
    v16 = [(HDCodableQuantity *)height dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"height"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    v17 = [NSNumber numberWithDouble:self->_heightModifiedDate];
    [v4 setObject:v17 forKey:@"heightModifiedDate"];
  }
  weight = self->_weight;
  if (weight)
  {
    v19 = [(HDCodableQuantity *)weight dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"weight"];
  }
  $668054F355966D14195D4E399A549C9C v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
  {
    v82 = [NSNumber numberWithDouble:self->_weightModifiedDate];
    [v4 setObject:v82 forKey:@"weightModifiedDate"];

    $668054F355966D14195D4E399A549C9C v20 = self->_has;
    if ((*(_DWORD *)&v20 & 0x80000000) == 0)
    {
LABEL_28:
      if ((*(unsigned char *)&v20 & 0x10) == 0) {
        goto LABEL_29;
      }
      goto LABEL_146;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  uint64_t bloodType = self->_bloodType;
  if (bloodType >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_bloodType);
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = off_1E62FA3F0[bloodType];
  }
  [v4 setObject:v84 forKey:@"bloodType"];

  $668054F355966D14195D4E399A549C9C v20 = self->_has;
  if ((*(unsigned char *)&v20 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v20 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_147;
  }
LABEL_146:
  v97 = [NSNumber numberWithDouble:self->_bloodTypeModifiedDate];
  [v4 setObject:v97 forKey:@"bloodTypeModifiedDate"];

  $668054F355966D14195D4E399A549C9C v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v20 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_147:
  v98 = [NSNumber numberWithLongLong:self->_isOrganDonor];
  [v4 setObject:v98 forKey:@"isOrganDonor"];

  if ((*(void *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    v21 = [NSNumber numberWithDouble:self->_isOrganDonorModifiedDate];
    [v4 setObject:v21 forKey:@"isOrganDonorModifiedDate"];
  }
LABEL_32:
  if ([(NSMutableArray *)self->_emergencyContacts count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_emergencyContacts, "count"));
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v23 = self->_emergencyContacts;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v115 objects:v123 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v116;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v116 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v115 + 1) + 8 * i) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v115 objects:v123 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"emergencyContacts"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    v29 = [NSNumber numberWithDouble:self->_emergencyContactsModifiedDate];
    [v4 setObject:v29 forKey:@"emergencyContactsModifiedDate"];
  }
  if ([(NSMutableArray *)self->_clinicalContacts count])
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clinicalContacts, "count"));
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    v31 = self->_clinicalContacts;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v111 objects:v122 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v112;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v112 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v111 + 1) + 8 * j) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v111 objects:v122 count:16];
      }
      while (v33);
    }

    [v4 setObject:v30 forKey:@"clinicalContacts"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v37 = [NSNumber numberWithDouble:self->_clinicalContactsModifiedDate];
    [v4 setObject:v37 forKey:@"clinicalContactsModifiedDate"];
  }
  medicalConditions = self->_medicalConditions;
  if (medicalConditions) {
    [v4 setObject:medicalConditions forKey:@"medicalConditions"];
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    v39 = [NSNumber numberWithDouble:self->_medicalConditionsModifiedDate];
    [v4 setObject:v39 forKey:@"medicalConditionsModifiedDate"];
  }
  medicalNotes = self->_medicalNotes;
  if (medicalNotes) {
    [v4 setObject:medicalNotes forKey:@"medicalNotes"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    v41 = [NSNumber numberWithDouble:self->_medicalNotesModifiedDate];
    [v4 setObject:v41 forKey:@"medicalNotesModifiedDate"];
  }
  allergyInfo = self->_allergyInfo;
  if (allergyInfo) {
    [v4 setObject:allergyInfo forKey:@"allergyInfo"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v43 = [NSNumber numberWithDouble:self->_allergyInfoModifiedDate];
    [v4 setObject:v43 forKey:@"allergyInfoModifiedDate"];
  }
  medicationInfo = self->_medicationInfo;
  if (medicationInfo) {
    [v4 setObject:medicationInfo forKey:@"medicationInfo"];
  }
  $668054F355966D14195D4E399A549C9C v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x40000) != 0)
  {
    v85 = [NSNumber numberWithDouble:self->_medicationInfoModifiedDate];
    [v4 setObject:v85 forKey:@"medicationInfoModifiedDate"];

    $668054F355966D14195D4E399A549C9C v45 = self->_has;
    if ((*(void *)&v45 & 0x400000000) == 0)
    {
LABEL_70:
      if ((*(_DWORD *)&v45 & 0x20000000) == 0) {
        goto LABEL_72;
      }
      goto LABEL_71;
    }
  }
  else if ((*(void *)&v45 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  v86 = [NSNumber numberWithBool:self->_shareDuringEmergency];
  [v4 setObject:v86 forKey:@"shareDuringEmergency"];

  if ((*(void *)&self->_has & 0x20000000) != 0)
  {
LABEL_71:
    v46 = [NSNumber numberWithDouble:self->_shareDuringEmergencyModifiedDate];
    [v4 setObject:v46 forKey:@"shareDuringEmergencyModifiedDate"];
  }
LABEL_72:
  primaryLanguageCode = self->_primaryLanguageCode;
  if (primaryLanguageCode) {
    [v4 setObject:primaryLanguageCode forKey:@"primaryLanguageCode"];
  }
  $668054F355966D14195D4E399A549C9C v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x10000000) != 0)
  {
    v87 = [NSNumber numberWithDouble:self->_primaryLanguageCodeModifiedDate];
    [v4 setObject:v87 forKey:@"primaryLanguageCodeModifiedDate"];

    $668054F355966D14195D4E399A549C9C v48 = self->_has;
    if ((*(_DWORD *)&v48 & 0x4000000) == 0)
    {
LABEL_76:
      if ((*(_DWORD *)&v48 & 0x8000000) == 0) {
        goto LABEL_77;
      }
      goto LABEL_132;
    }
  }
  else if ((*(_DWORD *)&v48 & 0x4000000) == 0)
  {
    goto LABEL_76;
  }
  v88 = [NSNumber numberWithDouble:self->_pregnancyStartDate];
  [v4 setObject:v88 forKey:@"pregnancyStartDate"];

  $668054F355966D14195D4E399A549C9C v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x8000000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v48 & 0x1000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_133;
  }
LABEL_132:
  v89 = [NSNumber numberWithDouble:self->_pregnancyStartDateModifiedDate];
  [v4 setObject:v89 forKey:@"pregnancyStartDateModifiedDate"];

  $668054F355966D14195D4E399A549C9C v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x1000000) == 0)
  {
LABEL_78:
    if ((*(_DWORD *)&v48 & 0x2000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_133:
  v90 = [NSNumber numberWithDouble:self->_pregnancyEstimatedDueDate];
  [v4 setObject:v90 forKey:@"pregnancyEstimatedDueDate"];

  if ((*(void *)&self->_has & 0x2000000) != 0)
  {
LABEL_79:
    v49 = [NSNumber numberWithDouble:self->_pregnancyEstimatedDueDateModifiedDate];
    [v4 setObject:v49 forKey:@"pregnancyEstimatedDueDateModifiedDate"];
  }
LABEL_80:
  if ([(NSMutableArray *)self->_medicationsLists count])
  {
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_medicationsLists, "count"));
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v51 = self->_medicationsLists;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v107 objects:v121 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v108;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v108 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v107 + 1) + 8 * k) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v107 objects:v121 count:16];
      }
      while (v53);
    }

    [v4 setObject:v50 forKey:@"medicationsList"];
  }
  $668054F355966D14195D4E399A549C9C v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x80000) != 0)
  {
    v91 = [NSNumber numberWithDouble:self->_medicationsListModifiedDate];
    [v4 setObject:v91 forKey:@"medicationsListModifiedDate"];

    $668054F355966D14195D4E399A549C9C v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x100000) == 0)
    {
LABEL_91:
      if ((*(_DWORD *)&v57 & 0x200000) == 0) {
        goto LABEL_93;
      }
      goto LABEL_92;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x100000) == 0)
  {
    goto LABEL_91;
  }
  v92 = [NSNumber numberWithLongLong:self->_medicationsListVersion];
  [v4 setObject:v92 forKey:@"medicationsListVersion"];

  if ((*(void *)&self->_has & 0x200000) != 0)
  {
LABEL_92:
    v58 = [NSNumber numberWithDouble:self->_medicationsListVersionModifiedDate];
    [v4 setObject:v58 forKey:@"medicationsListVersionModifiedDate"];
  }
LABEL_93:
  if ([(NSMutableArray *)self->_allergiesLists count])
  {
    v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_allergiesLists, "count"));
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v60 = self->_allergiesLists;
    uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v103 objects:v120 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v104;
      do
      {
        for (uint64_t m = 0; m != v62; ++m)
        {
          if (*(void *)v104 != v63) {
            objc_enumerationMutation(v60);
          }
          v65 = [*(id *)(*((void *)&v103 + 1) + 8 * m) dictionaryRepresentation];
          [v59 addObject:v65];
        }
        uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v103 objects:v120 count:16];
      }
      while (v62);
    }

    [v4 setObject:v59 forKey:@"allergiesList"];
  }
  $668054F355966D14195D4E399A549C9C v66 = self->_has;
  if (*(unsigned char *)&v66)
  {
    v93 = [NSNumber numberWithDouble:self->_allergiesListModifiedDate];
    [v4 setObject:v93 forKey:@"allergiesListModifiedDate"];

    $668054F355966D14195D4E399A549C9C v66 = self->_has;
    if ((*(unsigned char *)&v66 & 2) == 0)
    {
LABEL_104:
      if ((*(unsigned char *)&v66 & 4) == 0) {
        goto LABEL_106;
      }
      goto LABEL_105;
    }
  }
  else if ((*(unsigned char *)&v66 & 2) == 0)
  {
    goto LABEL_104;
  }
  v94 = [NSNumber numberWithLongLong:self->_allergiesListVersion];
  [v4 setObject:v94 forKey:@"allergiesListVersion"];

  if ((*(void *)&self->_has & 4) != 0)
  {
LABEL_105:
    v67 = [NSNumber numberWithDouble:self->_allergiesListVersionModifiedDate];
    [v4 setObject:v67 forKey:@"allergiesListVersionModifiedDate"];
  }
LABEL_106:
  if ([(NSMutableArray *)self->_conditionsLists count])
  {
    v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_conditionsLists, "count"));
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v69 = self->_conditionsLists;
    uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v99 objects:v119 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v100;
      do
      {
        for (uint64_t n = 0; n != v71; ++n)
        {
          if (*(void *)v100 != v72) {
            objc_enumerationMutation(v69);
          }
          v74 = [*(id *)(*((void *)&v99 + 1) + 8 * n) dictionaryRepresentation];
          [v68 addObject:v74];
        }
        uint64_t v71 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v99 objects:v119 count:16];
      }
      while (v71);
    }

    [v4 setObject:v68 forKey:@"conditionsList"];
  }
  $668054F355966D14195D4E399A549C9C v75 = self->_has;
  if ((*(unsigned char *)&v75 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v75 & 0x80) == 0) {
      goto LABEL_117;
    }
LABEL_142:
    v96 = [NSNumber numberWithLongLong:self->_conditionsListVersion];
    [v4 setObject:v96 forKey:@"conditionsListVersion"];

    if ((*(void *)&self->_has & 0x100) == 0) {
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  v95 = [NSNumber numberWithDouble:self->_conditionsListModifiedDate];
  [v4 setObject:v95 forKey:@"conditionsListModifiedDate"];

  $668054F355966D14195D4E399A549C9C v75 = self->_has;
  if ((*(unsigned char *)&v75 & 0x80) != 0) {
    goto LABEL_142;
  }
LABEL_117:
  if ((*(_WORD *)&v75 & 0x100) != 0)
  {
LABEL_118:
    v76 = [NSNumber numberWithDouble:self->_conditionsListVersionModifiedDate];
    [v4 setObject:v76 forKey:@"conditionsListVersionModifiedDate"];
  }
LABEL_119:
  id v77 = v4;

  return v77;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalIDDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_medicalIDBytes) {
    PBDataWriterWriteDataField();
  }
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteDoubleField();
    $668054F355966D14195D4E399A549C9C has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(void *)&has & 0x200000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_112;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x2000) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_pictureData) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_gregorianBirthday) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_height) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_weight) {
    PBDataWriterWriteSubmessage();
  }
  $668054F355966D14195D4E399A549C9C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    $668054F355966D14195D4E399A549C9C v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_28:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_29;
      }
      goto LABEL_116;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  PBDataWriterWriteInt32Field();
  $668054F355966D14195D4E399A549C9C v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteDoubleField();
  $668054F355966D14195D4E399A549C9C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_117:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x8000) != 0) {
LABEL_31:
  }
    PBDataWriterWriteDoubleField();
LABEL_32:
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v7 = self->_emergencyContacts;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v54;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v12 = self->_clinicalContacts;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v14);
  }

  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_medicalConditions) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 2)) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_medicalNotes) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_allergyInfo) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_medicationInfo) {
    PBDataWriterWriteStringField();
  }
  $668054F355966D14195D4E399A549C9C v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000) != 0)
  {
    PBDataWriterWriteDoubleField();
    $668054F355966D14195D4E399A549C9C v17 = self->_has;
    if ((*(void *)&v17 & 0x400000000) == 0)
    {
LABEL_66:
      if ((*(_DWORD *)&v17 & 0x20000000) == 0) {
        goto LABEL_68;
      }
      goto LABEL_67;
    }
  }
  else if ((*(void *)&v17 & 0x400000000) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x20000000) != 0) {
LABEL_67:
  }
    PBDataWriterWriteDoubleField();
LABEL_68:
  if (self->_primaryLanguageCode) {
    PBDataWriterWriteStringField();
  }
  $668054F355966D14195D4E399A549C9C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    $668054F355966D14195D4E399A549C9C v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x4000000) == 0)
    {
LABEL_72:
      if ((*(_DWORD *)&v18 & 0x8000000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_124;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x4000000) == 0)
  {
    goto LABEL_72;
  }
  PBDataWriterWriteDoubleField();
  $668054F355966D14195D4E399A549C9C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x8000000) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteDoubleField();
  $668054F355966D14195D4E399A549C9C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v18 & 0x2000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_125:
  PBDataWriterWriteDoubleField();
  if ((*(void *)&self->_has & 0x2000000) != 0) {
LABEL_75:
  }
    PBDataWriterWriteDoubleField();
LABEL_76:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v19 = self->_medicationsLists;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v46;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v21);
  }

  $668054F355966D14195D4E399A549C9C v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    PBDataWriterWriteDoubleField();
    $668054F355966D14195D4E399A549C9C v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x100000) == 0)
    {
LABEL_85:
      if ((*(_DWORD *)&v24 & 0x200000) == 0) {
        goto LABEL_87;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x100000) == 0)
  {
    goto LABEL_85;
  }
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x200000) != 0) {
LABEL_86:
  }
    PBDataWriterWriteDoubleField();
LABEL_87:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v25 = self->_allergiesLists;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v27);
  }

  $668054F355966D14195D4E399A549C9C v30 = self->_has;
  if (*(unsigned char *)&v30)
  {
    PBDataWriterWriteDoubleField();
    $668054F355966D14195D4E399A549C9C v30 = self->_has;
    if ((*(unsigned char *)&v30 & 2) == 0)
    {
LABEL_96:
      if ((*(unsigned char *)&v30 & 4) == 0) {
        goto LABEL_98;
      }
      goto LABEL_97;
    }
  }
  else if ((*(unsigned char *)&v30 & 2) == 0)
  {
    goto LABEL_96;
  }
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 4) != 0) {
LABEL_97:
  }
    PBDataWriterWriteDoubleField();
LABEL_98:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v31 = self->_conditionsLists;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v33);
  }

  $668054F355966D14195D4E399A549C9C v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v36 & 0x80) == 0) {
      goto LABEL_107;
    }
LABEL_134:
    PBDataWriterWriteInt64Field();
    if ((*(void *)&self->_has & 0x100) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
  PBDataWriterWriteDoubleField();
  $668054F355966D14195D4E399A549C9C v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x80) != 0) {
    goto LABEL_134;
  }
LABEL_107:
  if ((*(_WORD *)&v36 & 0x100) != 0) {
LABEL_108:
  }
    PBDataWriterWriteDoubleField();
LABEL_109:
}

- (void)copyTo:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v33 = v4;
  if (self->_medicalIDBytes)
  {
    objc_msgSend(v4, "setMedicalIDBytes:");
    id v4 = v33;
  }
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *((void *)v4 + 10) = *(void *)&self->_dateSaved;
    *(void *)(v4 + 404) |= 0x200uLL;
    $668054F355966D14195D4E399A549C9C has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(void *)&has & 0x200000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_99;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 96) = self->_schemaVersion;
  *(void *)(v4 + 404) |= 0x100000000uLL;
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_99:
  v4[400] = self->_isDisabled;
  *(void *)(v4 + 404) |= 0x200000000uLL;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_7:
    *((void *)v4 + 14) = *(void *)&self->_isDisabledModifiedDate;
    *(void *)(v4 + 404) |= 0x2000uLL;
  }
LABEL_8:
  if (self->_pictureData)
  {
    objc_msgSend(v33, "setPictureData:");
    id v4 = v33;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((void *)v4 + 24) = *(void *)&self->_pictureDataModifiedDate;
    *(void *)(v4 + 404) |= 0x800000uLL;
  }
  if (self->_name)
  {
    objc_msgSend(v33, "setName:");
    id v4 = v33;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *((void *)v4 + 23) = *(void *)&self->_nameModifiedDate;
    *(void *)(v4 + 404) |= 0x400000uLL;
  }
  if (self->_gregorianBirthday)
  {
    objc_msgSend(v33, "setGregorianBirthday:");
    id v4 = v33;
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *((void *)v4 + 12) = *(void *)&self->_gregorianBirthdayModifiedDate;
    *(void *)(v4 + 404) |= 0x800uLL;
  }
  if (self->_height)
  {
    objc_msgSend(v33, "setHeight:");
    id v4 = v33;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *((void *)v4 + 13) = *(void *)&self->_heightModifiedDate;
    *(void *)(v4 + 404) |= 0x1000uLL;
  }
  if (self->_weight)
  {
    objc_msgSend(v33, "setWeight:");
    id v4 = v33;
  }
  $668054F355966D14195D4E399A549C9C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) != 0)
  {
    *((void *)v4 + 31) = *(void *)&self->_weightModifiedDate;
    *(void *)(v4 + 404) |= 0x40000000uLL;
    $668054F355966D14195D4E399A549C9C v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_28:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_29;
      }
      goto LABEL_103;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)v4 + 68) = self->_bloodType;
  *(void *)(v4 + 404) |= 0x80000000uLL;
  $668054F355966D14195D4E399A549C9C v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
LABEL_104:
    *((void *)v4 + 15) = self->_isOrganDonor;
    *(void *)(v4 + 404) |= 0x4000uLL;
    if ((*(void *)&self->_has & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_103:
  *((void *)v4 + 5) = *(void *)&self->_bloodTypeModifiedDate;
  *(void *)(v4 + 404) |= 0x10uLL;
  $668054F355966D14195D4E399A549C9C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0) {
    goto LABEL_104;
  }
LABEL_30:
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
LABEL_31:
    *((void *)v4 + 16) = *(void *)&self->_isOrganDonorModifiedDate;
    *(void *)(v4 + 404) |= 0x8000uLL;
  }
LABEL_32:
  if ([(HDCodableMedicalIDData *)self emergencyContactsCount])
  {
    [v33 clearEmergencyContacts];
    unint64_t v7 = [(HDCodableMedicalIDData *)self emergencyContactsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(HDCodableMedicalIDData *)self emergencyContactsAtIndex:i];
        [v33 addEmergencyContacts:v10];
      }
    }
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *((void *)v33 + 11) = *(void *)&self->_emergencyContactsModifiedDate;
    *(void *)(v33 + 404) |= 0x400uLL;
  }
  if ([(HDCodableMedicalIDData *)self clinicalContactsCount])
  {
    [v33 clearClinicalContacts];
    unint64_t v11 = [(HDCodableMedicalIDData *)self clinicalContactsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(HDCodableMedicalIDData *)self clinicalContactsAtIndex:j];
        [v33 addClinicalContacts:v14];
      }
    }
  }
  uint64_t v15 = v33;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((void *)v33 + 6) = *(void *)&self->_clinicalContactsModifiedDate;
    *(void *)(v33 + 404) |= 0x20uLL;
  }
  if (self->_medicalConditions)
  {
    objc_msgSend(v33, "setMedicalConditions:");
    uint64_t v15 = v33;
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    *((void *)v15 + 17) = *(void *)&self->_medicalConditionsModifiedDate;
    *(void *)(v15 + 404) |= 0x10000uLL;
  }
  if (self->_medicalNotes)
  {
    objc_msgSend(v33, "setMedicalNotes:");
    uint64_t v15 = v33;
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *((void *)v15 + 18) = *(void *)&self->_medicalNotesModifiedDate;
    *(void *)(v15 + 404) |= 0x20000uLL;
  }
  if (self->_allergyInfo)
  {
    objc_msgSend(v33, "setAllergyInfo:");
    uint64_t v15 = v33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v15 + 4) = *(void *)&self->_allergyInfoModifiedDate;
    *(void *)(v15 + 404) |= 8uLL;
  }
  if (self->_medicationInfo)
  {
    objc_msgSend(v33, "setMedicationInfo:");
    uint64_t v15 = v33;
  }
  $668054F355966D14195D4E399A549C9C v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) != 0)
  {
    *((void *)v15 + 19) = *(void *)&self->_medicationInfoModifiedDate;
    *(void *)(v15 + 404) |= 0x40000uLL;
    $668054F355966D14195D4E399A549C9C v16 = self->_has;
    if ((*(void *)&v16 & 0x400000000) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v16 & 0x20000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
  }
  else if ((*(void *)&v16 & 0x400000000) == 0)
  {
    goto LABEL_60;
  }
  v15[401] = self->_shareDuringEmergency;
  *(void *)(v15 + 404) |= 0x400000000uLL;
  if ((*(void *)&self->_has & 0x20000000) != 0)
  {
LABEL_61:
    *((void *)v15 + 30) = *(void *)&self->_shareDuringEmergencyModifiedDate;
    *(void *)(v15 + 404) |= 0x20000000uLL;
  }
LABEL_62:
  if (self->_primaryLanguageCode)
  {
    objc_msgSend(v33, "setPrimaryLanguageCode:");
    uint64_t v15 = v33;
  }
  $668054F355966D14195D4E399A549C9C v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000000) != 0)
  {
    *((void *)v15 + 29) = *(void *)&self->_primaryLanguageCodeModifiedDate;
    *(void *)(v15 + 404) |= 0x10000000uLL;
    $668054F355966D14195D4E399A549C9C v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x4000000) == 0)
    {
LABEL_66:
      if ((*(_DWORD *)&v17 & 0x8000000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_111;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x4000000) == 0)
  {
    goto LABEL_66;
  }
  *((void *)v15 + 27) = *(void *)&self->_pregnancyStartDate;
  *(void *)(v15 + 404) |= 0x4000000uLL;
  $668054F355966D14195D4E399A549C9C v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x8000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0) {
      goto LABEL_68;
    }
LABEL_112:
    *((void *)v15 + 25) = *(void *)&self->_pregnancyEstimatedDueDate;
    *(void *)(v15 + 404) |= 0x1000000uLL;
    if ((*(void *)&self->_has & 0x2000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
LABEL_111:
  *((void *)v15 + 28) = *(void *)&self->_pregnancyStartDateModifiedDate;
  *(void *)(v15 + 404) |= 0x8000000uLL;
  $668054F355966D14195D4E399A549C9C v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) != 0) {
    goto LABEL_112;
  }
LABEL_68:
  if ((*(_DWORD *)&v17 & 0x2000000) != 0)
  {
LABEL_69:
    *((void *)v15 + 26) = *(void *)&self->_pregnancyEstimatedDueDateModifiedDate;
    *(void *)(v15 + 404) |= 0x2000000uLL;
  }
LABEL_70:
  if ([(HDCodableMedicalIDData *)self medicationsListsCount])
  {
    [v33 clearMedicationsLists];
    unint64_t v18 = [(HDCodableMedicalIDData *)self medicationsListsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t k = 0; k != v19; ++k)
      {
        uint64_t v21 = [(HDCodableMedicalIDData *)self medicationsListAtIndex:k];
        [v33 addMedicationsList:v21];
      }
    }
  }
  $668054F355966D14195D4E399A549C9C v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) == 0)
  {
    if ((*(_DWORD *)&v22 & 0x100000) == 0) {
      goto LABEL_76;
    }
LABEL_115:
    *((void *)v33 + 21) = self->_medicationsListVersion;
    *(void *)(v33 + 404) |= 0x100000uLL;
    if ((*(void *)&self->_has & 0x200000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  *((void *)v33 + 20) = *(void *)&self->_medicationsListModifiedDate;
  *(void *)(v33 + 404) |= 0x80000uLL;
  $668054F355966D14195D4E399A549C9C v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x100000) != 0) {
    goto LABEL_115;
  }
LABEL_76:
  if ((*(_DWORD *)&v22 & 0x200000) != 0)
  {
LABEL_77:
    *((void *)v33 + 22) = *(void *)&self->_medicationsListVersionModifiedDate;
    *(void *)(v33 + 404) |= 0x200000uLL;
  }
LABEL_78:
  if ([(HDCodableMedicalIDData *)self allergiesListsCount])
  {
    [v33 clearAllergiesLists];
    unint64_t v23 = [(HDCodableMedicalIDData *)self allergiesListsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t m = 0; m != v24; ++m)
      {
        uint64_t v26 = [(HDCodableMedicalIDData *)self allergiesListAtIndex:m];
        [v33 addAllergiesList:v26];
      }
    }
  }
  $668054F355966D14195D4E399A549C9C v27 = self->_has;
  if ((*(unsigned char *)&v27 & 1) == 0)
  {
    if ((*(unsigned char *)&v27 & 2) == 0) {
      goto LABEL_84;
    }
LABEL_118:
    *((void *)v33 + 2) = self->_allergiesListVersion;
    *(void *)(v33 + 404) |= 2uLL;
    if ((*(void *)&self->_has & 4) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
  *((void *)v33 + 1) = *(void *)&self->_allergiesListModifiedDate;
  *(void *)(v33 + 404) |= 1uLL;
  $668054F355966D14195D4E399A549C9C v27 = self->_has;
  if ((*(unsigned char *)&v27 & 2) != 0) {
    goto LABEL_118;
  }
LABEL_84:
  if ((*(unsigned char *)&v27 & 4) != 0)
  {
LABEL_85:
    *((void *)v33 + 3) = *(void *)&self->_allergiesListVersionModifiedDate;
    *(void *)(v33 + 404) |= 4uLL;
  }
LABEL_86:
  if ([(HDCodableMedicalIDData *)self conditionsListsCount])
  {
    [v33 clearConditionsLists];
    unint64_t v28 = [(HDCodableMedicalIDData *)self conditionsListsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (uint64_t n = 0; n != v29; ++n)
      {
        v31 = [(HDCodableMedicalIDData *)self conditionsListAtIndex:n];
        [v33 addConditionsList:v31];
      }
    }
  }
  $668054F355966D14195D4E399A549C9C v32 = self->_has;
  if ((*(unsigned char *)&v32 & 0x40) != 0)
  {
    *((void *)v33 + 7) = *(void *)&self->_conditionsListModifiedDate;
    *(void *)(v33 + 404) |= 0x40uLL;
    $668054F355966D14195D4E399A549C9C v32 = self->_has;
    if ((*(unsigned char *)&v32 & 0x80) == 0)
    {
LABEL_92:
      if ((*(_WORD *)&v32 & 0x100) == 0) {
        goto LABEL_94;
      }
      goto LABEL_93;
    }
  }
  else if ((*(unsigned char *)&v32 & 0x80) == 0)
  {
    goto LABEL_92;
  }
  *((void *)v33 + 8) = self->_conditionsListVersion;
  *(void *)(v33 + 404) |= 0x80uLL;
  if ((*(void *)&self->_has & 0x100) != 0)
  {
LABEL_93:
    *((void *)v33 + 9) = *(void *)&self->_conditionsListVersionModifiedDate;
    *(void *)(v33 + 404) |= 0x100uLL;
  }
LABEL_94:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_medicalIDBytes copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v6;

  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *(double *)(v5 + 80) = self->_dateSaved;
    *(void *)(v5 + 404) |= 0x200uLL;
    $668054F355966D14195D4E399A549C9C has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x200000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_90;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 384) = self->_schemaVersion;
  *(void *)(v5 + 404) |= 0x100000000uLL;
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_90:
  *(unsigned char *)(v5 + 400) = self->_isDisabled;
  *(void *)(v5 + 404) |= 0x200000000uLL;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    *(double *)(v5 + 112) = self->_isDisabledModifiedDate;
    *(void *)(v5 + 404) |= 0x2000uLL;
  }
LABEL_6:
  uint64_t v9 = [(NSData *)self->_pictureData copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v9;

  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *(double *)(v5 + 192) = self->_pictureDataModifiedDate;
    *(void *)(v5 + 404) |= 0x800000uLL;
  }
  uint64_t v11 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v11;

  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *(double *)(v5 + 184) = self->_nameModifiedDate;
    *(void *)(v5 + 404) |= 0x400000uLL;
  }
  id v13 = [(HDCodableDateComponents *)self->_gregorianBirthday copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v13;

  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *(double *)(v5 + 96) = self->_gregorianBirthdayModifiedDate;
    *(void *)(v5 + 404) |= 0x800uLL;
  }
  id v15 = [(HDCodableQuantity *)self->_height copyWithZone:a3];
  $668054F355966D14195D4E399A549C9C v16 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v15;

  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(double *)(v5 + 104) = self->_heightModifiedDate;
    *(void *)(v5 + 404) |= 0x1000uLL;
  }
  id v17 = [(HDCodableQuantity *)self->_weight copyWithZone:a3];
  unint64_t v18 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v17;

  $668054F355966D14195D4E399A549C9C v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x40000000) != 0)
  {
    *(double *)(v5 + 248) = self->_weightModifiedDate;
    *(void *)(v5 + 404) |= 0x40000000uLL;
    $668054F355966D14195D4E399A549C9C v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x80000000) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&v19 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_94;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v5 + 272) = self->_bloodType;
  *(void *)(v5 + 404) |= 0x80000000uLL;
  $668054F355966D14195D4E399A549C9C v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v19 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(double *)(v5 + 40) = self->_bloodTypeModifiedDate;
  *(void *)(v5 + 404) |= 0x10uLL;
  $668054F355966D14195D4E399A549C9C v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v19 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_95:
  *(void *)(v5 + 120) = self->_isOrganDonor;
  *(void *)(v5 + 404) |= 0x4000uLL;
  if ((*(void *)&self->_has & 0x8000) != 0)
  {
LABEL_19:
    *(double *)(v5 + 128) = self->_isOrganDonorModifiedDate;
    *(void *)(v5 + 404) |= 0x8000uLL;
  }
LABEL_20:
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v20 = self->_emergencyContacts;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v84;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v84 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * v24) copyWithZone:a3];
        [(id)v5 addEmergencyContacts:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v22);
  }

  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(double *)(v5 + 88) = self->_emergencyContactsModifiedDate;
    *(void *)(v5 + 404) |= 0x400uLL;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v26 = self->_clinicalContacts;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v80;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v80 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * v30) copyWithZone:a3];
        [(id)v5 addClinicalContacts:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v28);
  }

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_clinicalContactsModifiedDate;
    *(void *)(v5 + 404) |= 0x20uLL;
  }
  uint64_t v32 = [(NSString *)self->_medicalConditions copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v32;

  if (*((unsigned char *)&self->_has + 2))
  {
    *(double *)(v5 + 136) = self->_medicalConditionsModifiedDate;
    *(void *)(v5 + 404) |= 0x10000uLL;
  }
  uint64_t v34 = [(NSString *)self->_medicalNotes copyWithZone:a3];
  uint64_t v35 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v34;

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(double *)(v5 + 144) = self->_medicalNotesModifiedDate;
    *(void *)(v5 + 404) |= 0x20000uLL;
  }
  uint64_t v36 = [(NSString *)self->_allergyInfo copyWithZone:a3];
  long long v37 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v36;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_allergyInfoModifiedDate;
    *(void *)(v5 + 404) |= 8uLL;
  }
  uint64_t v38 = [(NSString *)self->_medicationInfo copyWithZone:a3];
  long long v39 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v38;

  $668054F355966D14195D4E399A549C9C v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x40000) != 0)
  {
    *(double *)(v5 + 152) = self->_medicationInfoModifiedDate;
    *(void *)(v5 + 404) |= 0x40000uLL;
    $668054F355966D14195D4E399A549C9C v40 = self->_has;
    if ((*(void *)&v40 & 0x400000000) == 0)
    {
LABEL_46:
      if ((*(_DWORD *)&v40 & 0x20000000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  else if ((*(void *)&v40 & 0x400000000) == 0)
  {
    goto LABEL_46;
  }
  *(unsigned char *)(v5 + 401) = self->_shareDuringEmergency;
  *(void *)(v5 + 404) |= 0x400000000uLL;
  if ((*(void *)&self->_has & 0x20000000) != 0)
  {
LABEL_47:
    *(double *)(v5 + 240) = self->_shareDuringEmergencyModifiedDate;
    *(void *)(v5 + 404) |= 0x20000000uLL;
  }
LABEL_48:
  uint64_t v41 = [(NSString *)self->_primaryLanguageCode copyWithZone:a3];
  long long v42 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v41;

  $668054F355966D14195D4E399A549C9C v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x10000000) != 0)
  {
    *(double *)(v5 + 232) = self->_primaryLanguageCodeModifiedDate;
    *(void *)(v5 + 404) |= 0x10000000uLL;
    $668054F355966D14195D4E399A549C9C v43 = self->_has;
    if ((*(_DWORD *)&v43 & 0x4000000) == 0)
    {
LABEL_50:
      if ((*(_DWORD *)&v43 & 0x8000000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_102;
    }
  }
  else if ((*(_DWORD *)&v43 & 0x4000000) == 0)
  {
    goto LABEL_50;
  }
  *(double *)(v5 + 216) = self->_pregnancyStartDate;
  *(void *)(v5 + 404) |= 0x4000000uLL;
  $668054F355966D14195D4E399A549C9C v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x8000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v43 & 0x1000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(double *)(v5 + 224) = self->_pregnancyStartDateModifiedDate;
  *(void *)(v5 + 404) |= 0x8000000uLL;
  $668054F355966D14195D4E399A549C9C v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x1000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v43 & 0x2000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_103:
  *(double *)(v5 + 200) = self->_pregnancyEstimatedDueDate;
  *(void *)(v5 + 404) |= 0x1000000uLL;
  if ((*(void *)&self->_has & 0x2000000) != 0)
  {
LABEL_53:
    *(double *)(v5 + 208) = self->_pregnancyEstimatedDueDateModifiedDate;
    *(void *)(v5 + 404) |= 0x2000000uLL;
  }
LABEL_54:
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v44 = self->_medicationsLists;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v76;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v76 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * v48) copyWithZone:a3];
        [(id)v5 addMedicationsList:v49];

        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v46);
  }

  $668054F355966D14195D4E399A549C9C v50 = self->_has;
  if ((*(_DWORD *)&v50 & 0x80000) != 0)
  {
    *(double *)(v5 + 160) = self->_medicationsListModifiedDate;
    *(void *)(v5 + 404) |= 0x80000uLL;
    $668054F355966D14195D4E399A549C9C v50 = self->_has;
    if ((*(_DWORD *)&v50 & 0x100000) == 0)
    {
LABEL_63:
      if ((*(_DWORD *)&v50 & 0x200000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_DWORD *)&v50 & 0x100000) == 0)
  {
    goto LABEL_63;
  }
  *(void *)(v5 + 168) = self->_medicationsListVersion;
  *(void *)(v5 + 404) |= 0x100000uLL;
  if ((*(void *)&self->_has & 0x200000) != 0)
  {
LABEL_64:
    *(double *)(v5 + 176) = self->_medicationsListVersionModifiedDate;
    *(void *)(v5 + 404) |= 0x200000uLL;
  }
LABEL_65:
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v51 = self->_allergiesLists;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v71 objects:v88 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v72;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * v55) copyWithZone:a3];
        [(id)v5 addAllergiesList:v56];

        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v71 objects:v88 count:16];
    }
    while (v53);
  }

  $668054F355966D14195D4E399A549C9C v57 = self->_has;
  if (*(unsigned char *)&v57)
  {
    *(double *)(v5 + 8) = self->_allergiesListModifiedDate;
    *(void *)(v5 + 404) |= 1uLL;
    $668054F355966D14195D4E399A549C9C v57 = self->_has;
    if ((*(unsigned char *)&v57 & 2) == 0)
    {
LABEL_74:
      if ((*(unsigned char *)&v57 & 4) == 0) {
        goto LABEL_76;
      }
      goto LABEL_75;
    }
  }
  else if ((*(unsigned char *)&v57 & 2) == 0)
  {
    goto LABEL_74;
  }
  *(void *)(v5 + 16) = self->_allergiesListVersion;
  *(void *)(v5 + 404) |= 2uLL;
  if ((*(void *)&self->_has & 4) != 0)
  {
LABEL_75:
    *(double *)(v5 + 24) = self->_allergiesListVersionModifiedDate;
    *(void *)(v5 + 404) |= 4uLL;
  }
LABEL_76:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v58 = self->_conditionsLists;
  uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v67 objects:v87 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v68;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v68 != v61) {
          objc_enumerationMutation(v58);
        }
        uint64_t v63 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * v62), "copyWithZone:", a3, (void)v67);
        [(id)v5 addConditionsList:v63];

        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v67 objects:v87 count:16];
    }
    while (v60);
  }

  $668054F355966D14195D4E399A549C9C v64 = self->_has;
  if ((*(unsigned char *)&v64 & 0x40) == 0)
  {
    if ((*(unsigned char *)&v64 & 0x80) == 0) {
      goto LABEL_85;
    }
LABEL_112:
    *(void *)(v5 + 64) = self->_conditionsListVersion;
    *(void *)(v5 + 404) |= 0x80uLL;
    if ((*(void *)&self->_has & 0x100) == 0) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }
  *(double *)(v5 + 56) = self->_conditionsListModifiedDate;
  *(void *)(v5 + 404) |= 0x40uLL;
  $668054F355966D14195D4E399A549C9C v64 = self->_has;
  if ((*(unsigned char *)&v64 & 0x80) != 0) {
    goto LABEL_112;
  }
LABEL_85:
  if ((*(_WORD *)&v64 & 0x100) != 0)
  {
LABEL_86:
    *(double *)(v5 + 72) = self->_conditionsListVersionModifiedDate;
    *(void *)(v5 + 404) |= 0x100uLL;
  }
LABEL_87:
  id v65 = (id)v5;

  return v65;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_230;
  }
  medicalIDBytes = self->_medicalIDBytes;
  if ((unint64_t)medicalIDBytes | *((void *)v4 + 41))
  {
    if (!-[NSData isEqual:](medicalIDBytes, "isEqual:")) {
      goto LABEL_230;
    }
  }
  $668054F355966D14195D4E399A549C9C has = self->_has;
  uint64_t v7 = *(void *)(v4 + 404);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_dateSaved != *((double *)v4 + 10)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_230;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_schemaVersion != *((_DWORD *)v4 + 96)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_230;
    }
    if (self->_isDisabled)
    {
      if (!v4[400]) {
        goto LABEL_230;
      }
    }
    else if (v4[400])
    {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_isDisabledModifiedDate != *((double *)v4 + 14)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_230;
  }
  pictureData = self->_pictureData;
  if ((unint64_t)pictureData | *((void *)v4 + 46))
  {
    if (!-[NSData isEqual:](pictureData, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_pictureDataModifiedDate != *((double *)v4 + 24)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_230;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_nameModifiedDate != *((double *)v4 + 23)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_230;
  }
  gregorianBirthday = self->_gregorianBirthday;
  if ((unint64_t)gregorianBirthday | *((void *)v4 + 38))
  {
    if (!-[HDCodableDateComponents isEqual:](gregorianBirthday, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_gregorianBirthdayModifiedDate != *((double *)v4 + 12)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_230;
  }
  height = self->_height;
  if ((unint64_t)height | *((void *)v4 + 39))
  {
    if (!-[HDCodableQuantity isEqual:](height, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_heightModifiedDate != *((double *)v4 + 13)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_230;
  }
  weight = self->_weight;
  if ((unint64_t)weight | *((void *)v4 + 49))
  {
    if (!-[HDCodableQuantity isEqual:](weight, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_weightModifiedDate != *((double *)v4 + 31)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_bloodType != *((_DWORD *)v4 + 68)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bloodTypeModifiedDate != *((double *)v4 + 5)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_isOrganDonor != *((void *)v4 + 15)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_isOrganDonorModifiedDate != *((double *)v4 + 16)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_230;
  }
  emergencyContacts = self->_emergencyContacts;
  if ((unint64_t)emergencyContacts | *((void *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](emergencyContacts, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_emergencyContactsModifiedDate != *((double *)v4 + 11)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_230;
  }
  clinicalContacts = self->_clinicalContacts;
  if ((unint64_t)clinicalContacts | *((void *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](clinicalContacts, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_clinicalContactsModifiedDate != *((double *)v4 + 6)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_230;
  }
  medicalConditions = self->_medicalConditions;
  if ((unint64_t)medicalConditions | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](medicalConditions, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_medicalConditionsModifiedDate != *((double *)v4 + 17)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_230;
  }
  medicalNotes = self->_medicalNotes;
  if ((unint64_t)medicalNotes | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](medicalNotes, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_medicalNotesModifiedDate != *((double *)v4 + 18)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_230;
  }
  allergyInfo = self->_allergyInfo;
  if ((unint64_t)allergyInfo | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](allergyInfo, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_allergyInfoModifiedDate != *((double *)v4 + 4)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_230;
  }
  medicationInfo = self->_medicationInfo;
  if ((unint64_t)medicationInfo | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](medicationInfo, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_medicationInfoModifiedDate != *((double *)v4 + 19)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_230;
    }
    if (self->_shareDuringEmergency)
    {
      if (!v4[401]) {
        goto LABEL_230;
      }
    }
    else if (v4[401])
    {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_shareDuringEmergencyModifiedDate != *((double *)v4 + 30)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_230;
  }
  primaryLanguageCode = self->_primaryLanguageCode;
  if ((unint64_t)primaryLanguageCode | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](primaryLanguageCode, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_primaryLanguageCodeModifiedDate != *((double *)v4 + 29)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_pregnancyStartDate != *((double *)v4 + 27)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_pregnancyStartDateModifiedDate != *((double *)v4 + 28)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_pregnancyEstimatedDueDate != *((double *)v4 + 25)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_pregnancyEstimatedDueDateModifiedDate != *((double *)v4 + 26)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_230;
  }
  medicationsLists = self->_medicationsLists;
  if ((unint64_t)medicationsLists | *((void *)v4 + 44))
  {
    if (!-[NSMutableArray isEqual:](medicationsLists, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_medicationsListModifiedDate != *((double *)v4 + 20)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_medicationsListVersion != *((void *)v4 + 21)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_medicationsListVersionModifiedDate != *((double *)v4 + 22)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_230;
  }
  allergiesLists = self->_allergiesLists;
  if ((unint64_t)allergiesLists | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](allergiesLists, "isEqual:")) {
      goto LABEL_230;
    }
    $668054F355966D14195D4E399A549C9C has = self->_has;
    uint64_t v7 = *(void *)(v4 + 404);
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_allergiesListModifiedDate != *((double *)v4 + 1)) {
      goto LABEL_230;
    }
  }
  else if (v7)
  {
    goto LABEL_230;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_allergiesListVersion != *((void *)v4 + 2)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_230;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_allergiesListVersionModifiedDate != *((double *)v4 + 3)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_230;
  }
  conditionsLists = self->_conditionsLists;
  if ((unint64_t)conditionsLists | *((void *)v4 + 36))
  {
    if (-[NSMutableArray isEqual:](conditionsLists, "isEqual:"))
    {
      $668054F355966D14195D4E399A549C9C has = self->_has;
      uint64_t v7 = *(void *)(v4 + 404);
      goto LABEL_215;
    }
LABEL_230:
    BOOL v23 = 0;
    goto LABEL_231;
  }
LABEL_215:
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_conditionsListModifiedDate != *((double *)v4 + 7)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_230;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_conditionsListVersion != *((void *)v4 + 8)) {
      goto LABEL_230;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_230;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_conditionsListVersionModifiedDate != *((double *)v4 + 9)) {
      goto LABEL_230;
    }
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = (v7 & 0x100) == 0;
  }
LABEL_231:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v191 = [(NSData *)self->_medicalIDBytes hash];
  $668054F355966D14195D4E399A549C9C has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double dateSaved = self->_dateSaved;
    double v6 = -dateSaved;
    if (dateSaved >= 0.0) {
      double v6 = self->_dateSaved;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    uint64_t v189 = 2654435761 * self->_schemaVersion;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v189 = 0;
    if ((*(void *)&has & 0x200000000) != 0)
    {
LABEL_11:
      uint64_t v188 = 2654435761 * self->_isDisabled;
      goto LABEL_14;
    }
  }
  uint64_t v188 = 0;
LABEL_14:
  unint64_t v190 = v4;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    double isDisabledModifiedDate = self->_isDisabledModifiedDate;
    double v11 = -isDisabledModifiedDate;
    if (isDisabledModifiedDate >= 0.0) {
      double v11 = self->_isDisabledModifiedDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v187 = v9;
  uint64_t v186 = [(NSData *)self->_pictureData hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    double pictureDataModifiedDate = self->_pictureDataModifiedDate;
    double v16 = -pictureDataModifiedDate;
    if (pictureDataModifiedDate >= 0.0) {
      double v16 = self->_pictureDataModifiedDate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v185 = v14;
  NSUInteger v184 = [(NSString *)self->_name hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    double nameModifiedDate = self->_nameModifiedDate;
    double v21 = -nameModifiedDate;
    if (nameModifiedDate >= 0.0) {
      double v21 = self->_nameModifiedDate;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  unint64_t v183 = v19;
  unint64_t v182 = [(HDCodableDateComponents *)self->_gregorianBirthday hash];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    double gregorianBirthdayModifiedDate = self->_gregorianBirthdayModifiedDate;
    double v26 = -gregorianBirthdayModifiedDate;
    if (gregorianBirthdayModifiedDate >= 0.0) {
      double v26 = self->_gregorianBirthdayModifiedDate;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  unint64_t v181 = v24;
  unint64_t v180 = [(HDCodableQuantity *)self->_height hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    double heightModifiedDate = self->_heightModifiedDate;
    double v31 = -heightModifiedDate;
    if (heightModifiedDate >= 0.0) {
      double v31 = self->_heightModifiedDate;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v179 = v29;
  unint64_t v178 = [(HDCodableQuantity *)self->_weight hash];
  $668054F355966D14195D4E399A549C9C v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x40000000) != 0)
  {
    double weightModifiedDate = self->_weightModifiedDate;
    double v37 = -weightModifiedDate;
    if (weightModifiedDate >= 0.0) {
      double v37 = self->_weightModifiedDate;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  if ((*(_DWORD *)&v34 & 0x80000000) != 0)
  {
    uint64_t v176 = 2654435761 * self->_bloodType;
    if ((*(unsigned char *)&v34 & 0x10) != 0) {
      goto LABEL_64;
    }
LABEL_69:
    unint64_t v44 = 0;
    goto LABEL_72;
  }
  uint64_t v176 = 0;
  if ((*(unsigned char *)&v34 & 0x10) == 0) {
    goto LABEL_69;
  }
LABEL_64:
  double bloodTypeModifiedDate = self->_bloodTypeModifiedDate;
  double v41 = -bloodTypeModifiedDate;
  if (bloodTypeModifiedDate >= 0.0) {
    double v41 = self->_bloodTypeModifiedDate;
  }
  long double v42 = floor(v41 + 0.5);
  double v43 = (v41 - v42) * 1.84467441e19;
  unint64_t v44 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
  if (v43 >= 0.0)
  {
    if (v43 > 0.0) {
      v44 += (unint64_t)v43;
    }
  }
  else
  {
    v44 -= (unint64_t)fabs(v43);
  }
LABEL_72:
  if ((*(_WORD *)&v34 & 0x4000) != 0) {
    uint64_t v174 = 2654435761 * self->_isOrganDonor;
  }
  else {
    uint64_t v174 = 0;
  }
  unint64_t v175 = v44;
  if ((*(_WORD *)&v34 & 0x8000) != 0)
  {
    double isOrganDonorModifiedDate = self->_isOrganDonorModifiedDate;
    double v47 = -isOrganDonorModifiedDate;
    if (isOrganDonorModifiedDate >= 0.0) {
      double v47 = self->_isOrganDonorModifiedDate;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v173 = v45;
  uint64_t v172 = [(NSMutableArray *)self->_emergencyContacts hash];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    double emergencyContactsModifiedDate = self->_emergencyContactsModifiedDate;
    double v52 = -emergencyContactsModifiedDate;
    if (emergencyContactsModifiedDate >= 0.0) {
      double v52 = self->_emergencyContactsModifiedDate;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  unint64_t v171 = v50;
  uint64_t v170 = [(NSMutableArray *)self->_clinicalContacts hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    double clinicalContactsModifiedDate = self->_clinicalContactsModifiedDate;
    double v57 = -clinicalContactsModifiedDate;
    if (clinicalContactsModifiedDate >= 0.0) {
      double v57 = self->_clinicalContactsModifiedDate;
    }
    long double v58 = floor(v57 + 0.5);
    double v59 = (v57 - v58) * 1.84467441e19;
    unint64_t v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0) {
        v55 += (unint64_t)v59;
      }
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    unint64_t v55 = 0;
  }
  unint64_t v169 = v55;
  NSUInteger v168 = [(NSString *)self->_medicalConditions hash];
  if (*((unsigned char *)&self->_has + 2))
  {
    double medicalConditionsModifiedDate = self->_medicalConditionsModifiedDate;
    double v62 = -medicalConditionsModifiedDate;
    if (medicalConditionsModifiedDate >= 0.0) {
      double v62 = self->_medicalConditionsModifiedDate;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v60 += (unint64_t)v64;
      }
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    unint64_t v60 = 0;
  }
  unint64_t v167 = v60;
  NSUInteger v166 = [(NSString *)self->_medicalNotes hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    double medicalNotesModifiedDate = self->_medicalNotesModifiedDate;
    double v67 = -medicalNotesModifiedDate;
    if (medicalNotesModifiedDate >= 0.0) {
      double v67 = self->_medicalNotesModifiedDate;
    }
    long double v68 = floor(v67 + 0.5);
    double v69 = (v67 - v68) * 1.84467441e19;
    unint64_t v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0) {
        v65 += (unint64_t)v69;
      }
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    unint64_t v65 = 0;
  }
  unint64_t v165 = v65;
  NSUInteger v164 = [(NSString *)self->_allergyInfo hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    double allergyInfoModifiedDate = self->_allergyInfoModifiedDate;
    double v72 = -allergyInfoModifiedDate;
    if (allergyInfoModifiedDate >= 0.0) {
      double v72 = self->_allergyInfoModifiedDate;
    }
    long double v73 = floor(v72 + 0.5);
    double v74 = (v72 - v73) * 1.84467441e19;
    unint64_t v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0) {
        v70 += (unint64_t)v74;
      }
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    unint64_t v70 = 0;
  }
  unint64_t v163 = v70;
  NSUInteger v162 = [(NSString *)self->_medicationInfo hash];
  $668054F355966D14195D4E399A549C9C v75 = self->_has;
  if ((*(_DWORD *)&v75 & 0x40000) != 0)
  {
    double medicationInfoModifiedDate = self->_medicationInfoModifiedDate;
    double v78 = -medicationInfoModifiedDate;
    if (medicationInfoModifiedDate >= 0.0) {
      double v78 = self->_medicationInfoModifiedDate;
    }
    long double v79 = floor(v78 + 0.5);
    double v80 = (v78 - v79) * 1.84467441e19;
    unint64_t v76 = 2654435761u * (unint64_t)fmod(v79, 1.84467441e19);
    if (v80 >= 0.0)
    {
      if (v80 > 0.0) {
        v76 += (unint64_t)v80;
      }
    }
    else
    {
      v76 -= (unint64_t)fabs(v80);
    }
  }
  else
  {
    unint64_t v76 = 0;
  }
  if ((*(void *)&v75 & 0x400000000) != 0) {
    uint64_t v160 = 2654435761 * self->_shareDuringEmergency;
  }
  else {
    uint64_t v160 = 0;
  }
  unint64_t v161 = v76;
  if ((*(_DWORD *)&v75 & 0x20000000) != 0)
  {
    double shareDuringEmergencyModifiedDate = self->_shareDuringEmergencyModifiedDate;
    double v83 = -shareDuringEmergencyModifiedDate;
    if (shareDuringEmergencyModifiedDate >= 0.0) {
      double v83 = self->_shareDuringEmergencyModifiedDate;
    }
    long double v84 = floor(v83 + 0.5);
    double v85 = (v83 - v84) * 1.84467441e19;
    unint64_t v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0) {
        v81 += (unint64_t)v85;
      }
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    unint64_t v81 = 0;
  }
  unint64_t v159 = v81;
  NSUInteger v158 = [(NSString *)self->_primaryLanguageCode hash];
  $668054F355966D14195D4E399A549C9C v86 = self->_has;
  if ((*(_DWORD *)&v86 & 0x10000000) != 0)
  {
    double primaryLanguageCodeModifiedDate = self->_primaryLanguageCodeModifiedDate;
    double v89 = -primaryLanguageCodeModifiedDate;
    if (primaryLanguageCodeModifiedDate >= 0.0) {
      double v89 = self->_primaryLanguageCodeModifiedDate;
    }
    long double v90 = floor(v89 + 0.5);
    double v91 = (v89 - v90) * 1.84467441e19;
    unint64_t v87 = 2654435761u * (unint64_t)fmod(v90, 1.84467441e19);
    if (v91 >= 0.0)
    {
      if (v91 > 0.0) {
        v87 += (unint64_t)v91;
      }
    }
    else
    {
      v87 -= (unint64_t)fabs(v91);
    }
  }
  else
  {
    unint64_t v87 = 0;
  }
  if ((*(_DWORD *)&v86 & 0x4000000) != 0)
  {
    double pregnancyStartDate = self->_pregnancyStartDate;
    double v94 = -pregnancyStartDate;
    if (pregnancyStartDate >= 0.0) {
      double v94 = self->_pregnancyStartDate;
    }
    long double v95 = floor(v94 + 0.5);
    double v96 = (v94 - v95) * 1.84467441e19;
    unint64_t v92 = 2654435761u * (unint64_t)fmod(v95, 1.84467441e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0) {
        v92 += (unint64_t)v96;
      }
    }
    else
    {
      v92 -= (unint64_t)fabs(v96);
    }
  }
  else
  {
    unint64_t v92 = 0;
  }
  if ((*(_DWORD *)&v86 & 0x8000000) != 0)
  {
    double pregnancyStartDateModifiedDate = self->_pregnancyStartDateModifiedDate;
    double v99 = -pregnancyStartDateModifiedDate;
    if (pregnancyStartDateModifiedDate >= 0.0) {
      double v99 = self->_pregnancyStartDateModifiedDate;
    }
    long double v100 = floor(v99 + 0.5);
    double v101 = (v99 - v100) * 1.84467441e19;
    unint64_t v97 = 2654435761u * (unint64_t)fmod(v100, 1.84467441e19);
    if (v101 >= 0.0)
    {
      if (v101 > 0.0) {
        v97 += (unint64_t)v101;
      }
    }
    else
    {
      v97 -= (unint64_t)fabs(v101);
    }
  }
  else
  {
    unint64_t v97 = 0;
  }
  if ((*(_DWORD *)&v86 & 0x1000000) != 0)
  {
    double pregnancyEstimatedDueDate = self->_pregnancyEstimatedDueDate;
    double v104 = -pregnancyEstimatedDueDate;
    if (pregnancyEstimatedDueDate >= 0.0) {
      double v104 = self->_pregnancyEstimatedDueDate;
    }
    long double v105 = floor(v104 + 0.5);
    double v106 = (v104 - v105) * 1.84467441e19;
    unint64_t v102 = 2654435761u * (unint64_t)fmod(v105, 1.84467441e19);
    if (v106 >= 0.0)
    {
      if (v106 > 0.0) {
        v102 += (unint64_t)v106;
      }
    }
    else
    {
      v102 -= (unint64_t)fabs(v106);
    }
  }
  else
  {
    unint64_t v102 = 0;
  }
  unint64_t v155 = v102;
  unint64_t v177 = v35;
  if ((*(_DWORD *)&v86 & 0x2000000) != 0)
  {
    double pregnancyEstimatedDueDateModifiedDate = self->_pregnancyEstimatedDueDateModifiedDate;
    double v109 = -pregnancyEstimatedDueDateModifiedDate;
    if (pregnancyEstimatedDueDateModifiedDate >= 0.0) {
      double v109 = self->_pregnancyEstimatedDueDateModifiedDate;
    }
    long double v110 = floor(v109 + 0.5);
    double v111 = (v109 - v110) * 1.84467441e19;
    unint64_t v107 = 2654435761u * (unint64_t)fmod(v110, 1.84467441e19);
    if (v111 >= 0.0)
    {
      if (v111 > 0.0) {
        v107 += (unint64_t)v111;
      }
    }
    else
    {
      v107 -= (unint64_t)fabs(v111);
    }
  }
  else
  {
    unint64_t v107 = 0;
  }
  unint64_t v154 = v107;
  uint64_t v153 = [(NSMutableArray *)self->_medicationsLists hash];
  $668054F355966D14195D4E399A549C9C v112 = self->_has;
  if ((*(_DWORD *)&v112 & 0x80000) != 0)
  {
    double medicationsListModifiedDate = self->_medicationsListModifiedDate;
    double v115 = -medicationsListModifiedDate;
    if (medicationsListModifiedDate >= 0.0) {
      double v115 = self->_medicationsListModifiedDate;
    }
    long double v116 = floor(v115 + 0.5);
    double v117 = (v115 - v116) * 1.84467441e19;
    unint64_t v113 = 2654435761u * (unint64_t)fmod(v116, 1.84467441e19);
    if (v117 >= 0.0)
    {
      if (v117 > 0.0) {
        v113 += (unint64_t)v117;
      }
    }
    else
    {
      v113 -= (unint64_t)fabs(v117);
    }
  }
  else
  {
    unint64_t v113 = 0;
  }
  if ((*(_DWORD *)&v112 & 0x100000) != 0) {
    uint64_t v151 = 2654435761 * self->_medicationsListVersion;
  }
  else {
    uint64_t v151 = 0;
  }
  unint64_t v152 = v113;
  unint64_t v157 = v87;
  if ((*(_DWORD *)&v112 & 0x200000) != 0)
  {
    double medicationsListVersionModifiedDate = self->_medicationsListVersionModifiedDate;
    double v120 = -medicationsListVersionModifiedDate;
    if (medicationsListVersionModifiedDate >= 0.0) {
      double v120 = self->_medicationsListVersionModifiedDate;
    }
    long double v121 = floor(v120 + 0.5);
    double v122 = (v120 - v121) * 1.84467441e19;
    unint64_t v118 = 2654435761u * (unint64_t)fmod(v121, 1.84467441e19);
    if (v122 >= 0.0)
    {
      if (v122 > 0.0) {
        v118 += (unint64_t)v122;
      }
    }
    else
    {
      v118 -= (unint64_t)fabs(v122);
    }
  }
  else
  {
    unint64_t v118 = 0;
  }
  unint64_t v156 = v92;
  uint64_t v150 = [(NSMutableArray *)self->_allergiesLists hash];
  $668054F355966D14195D4E399A549C9C v123 = self->_has;
  if (*(unsigned char *)&v123)
  {
    double allergiesListModifiedDate = self->_allergiesListModifiedDate;
    double v126 = -allergiesListModifiedDate;
    if (allergiesListModifiedDate >= 0.0) {
      double v126 = self->_allergiesListModifiedDate;
    }
    long double v127 = floor(v126 + 0.5);
    double v128 = (v126 - v127) * 1.84467441e19;
    unint64_t v124 = 2654435761u * (unint64_t)fmod(v127, 1.84467441e19);
    if (v128 >= 0.0)
    {
      if (v128 > 0.0) {
        v124 += (unint64_t)v128;
      }
    }
    else
    {
      v124 -= (unint64_t)fabs(v128);
    }
  }
  else
  {
    unint64_t v124 = 0;
  }
  if ((*(unsigned char *)&v123 & 2) != 0)
  {
    uint64_t v148 = 2654435761 * self->_allergiesListVersion;
    if ((*(unsigned char *)&v123 & 4) != 0) {
      goto LABEL_211;
    }
LABEL_216:
    unint64_t v133 = 0;
    goto LABEL_219;
  }
  uint64_t v148 = 0;
  if ((*(unsigned char *)&v123 & 4) == 0) {
    goto LABEL_216;
  }
LABEL_211:
  double allergiesListVersionModifiedDate = self->_allergiesListVersionModifiedDate;
  double v130 = -allergiesListVersionModifiedDate;
  if (allergiesListVersionModifiedDate >= 0.0) {
    double v130 = self->_allergiesListVersionModifiedDate;
  }
  long double v131 = floor(v130 + 0.5);
  double v132 = (v130 - v131) * 1.84467441e19;
  unint64_t v133 = 2654435761u * (unint64_t)fmod(v131, 1.84467441e19);
  if (v132 >= 0.0)
  {
    if (v132 > 0.0) {
      v133 += (unint64_t)v132;
    }
  }
  else
  {
    v133 -= (unint64_t)fabs(v132);
  }
LABEL_219:
  uint64_t v134 = [(NSMutableArray *)self->_conditionsLists hash];
  $668054F355966D14195D4E399A549C9C v135 = self->_has;
  if ((*(unsigned char *)&v135 & 0x40) != 0)
  {
    double conditionsListModifiedDate = self->_conditionsListModifiedDate;
    double v138 = -conditionsListModifiedDate;
    if (conditionsListModifiedDate >= 0.0) {
      double v138 = self->_conditionsListModifiedDate;
    }
    long double v139 = floor(v138 + 0.5);
    double v140 = (v138 - v139) * 1.84467441e19;
    unint64_t v136 = 2654435761u * (unint64_t)fmod(v139, 1.84467441e19);
    if (v140 >= 0.0)
    {
      if (v140 > 0.0) {
        v136 += (unint64_t)v140;
      }
    }
    else
    {
      v136 -= (unint64_t)fabs(v140);
    }
  }
  else
  {
    unint64_t v136 = 0;
  }
  if ((*(unsigned char *)&v135 & 0x80) != 0)
  {
    uint64_t v141 = 2654435761 * self->_conditionsListVersion;
    if ((*(_WORD *)&v135 & 0x100) != 0) {
      goto LABEL_229;
    }
LABEL_234:
    unint64_t v146 = 0;
    return v190 ^ v191 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v97 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v118 ^ v150 ^ v124 ^ v149 ^ v133 ^ v134 ^ v136 ^ v141 ^ v146;
  }
  uint64_t v141 = 0;
  if ((*(_WORD *)&v135 & 0x100) == 0) {
    goto LABEL_234;
  }
LABEL_229:
  double conditionsListVersionModifiedDate = self->_conditionsListVersionModifiedDate;
  double v143 = -conditionsListVersionModifiedDate;
  if (conditionsListVersionModifiedDate >= 0.0) {
    double v143 = self->_conditionsListVersionModifiedDate;
  }
  long double v144 = floor(v143 + 0.5);
  double v145 = (v143 - v144) * 1.84467441e19;
  unint64_t v146 = 2654435761u * (unint64_t)fmod(v144, 1.84467441e19);
  if (v145 >= 0.0)
  {
    if (v145 > 0.0) {
      v146 += (unint64_t)v145;
    }
  }
  else
  {
    v146 -= (unint64_t)fabs(v145);
  }
  return v190 ^ v191 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v97 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v118 ^ v150 ^ v124 ^ v149 ^ v133 ^ v134 ^ v136 ^ v141 ^ v146;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (char *)a3;
  if (*((void *)v4 + 41)) {
    -[HDCodableMedicalIDData setMedicalIDBytes:](self, "setMedicalIDBytes:");
  }
  uint64_t v5 = *(void *)(v4 + 404);
  if ((v5 & 0x200) != 0)
  {
    self->_double dateSaved = *((double *)v4 + 10);
    *(void *)&self->_has |= 0x200uLL;
    uint64_t v5 = *(void *)(v4 + 404);
    if ((v5 & 0x100000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x200000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  self->_schemaVersiouint64_t n = *((_DWORD *)v4 + 96);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *(void *)(v4 + 404);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  self->_isDisabled = v4[400];
  *(void *)&self->_has |= 0x200000000uLL;
  if ((*(void *)(v4 + 404) & 0x2000) != 0)
  {
LABEL_7:
    self->_double isDisabledModifiedDate = *((double *)v4 + 14);
    *(void *)&self->_has |= 0x2000uLL;
  }
LABEL_8:
  if (*((void *)v4 + 46)) {
    -[HDCodableMedicalIDData setPictureData:](self, "setPictureData:");
  }
  if (v4[406] < 0)
  {
    self->_double pictureDataModifiedDate = *((double *)v4 + 24);
    *(void *)&self->_has |= 0x800000uLL;
  }
  if (*((void *)v4 + 45)) {
    -[HDCodableMedicalIDData setName:](self, "setName:");
  }
  if ((v4[406] & 0x40) != 0)
  {
    self->_double nameModifiedDate = *((double *)v4 + 23);
    *(void *)&self->_has |= 0x400000uLL;
  }
  gregorianBirthday = self->_gregorianBirthday;
  uint64_t v7 = *((void *)v4 + 38);
  if (gregorianBirthday)
  {
    if (v7) {
      -[HDCodableDateComponents mergeFrom:](gregorianBirthday, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[HDCodableMedicalIDData setGregorianBirthday:](self, "setGregorianBirthday:");
  }
  if ((v4[405] & 8) != 0)
  {
    self->_double gregorianBirthdayModifiedDate = *((double *)v4 + 12);
    *(void *)&self->_has |= 0x800uLL;
  }
  height = self->_height;
  uint64_t v9 = *((void *)v4 + 39);
  if (height)
  {
    if (v9) {
      -[HDCodableQuantity mergeFrom:](height, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[HDCodableMedicalIDData setHeight:](self, "setHeight:");
  }
  if ((v4[405] & 0x10) != 0)
  {
    self->_double heightModifiedDate = *((double *)v4 + 13);
    *(void *)&self->_has |= 0x1000uLL;
  }
  weight = self->_weight;
  uint64_t v11 = *((void *)v4 + 49);
  if (weight)
  {
    if (v11) {
      -[HDCodableQuantity mergeFrom:](weight, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[HDCodableMedicalIDData setWeight:](self, "setWeight:");
  }
  uint64_t v12 = *(void *)(v4 + 404);
  if ((v12 & 0x40000000) != 0)
  {
    self->_double weightModifiedDate = *((double *)v4 + 31);
    *(void *)&self->_has |= 0x40000000uLL;
    uint64_t v12 = *(void *)(v4 + 404);
    if ((v12 & 0x80000000) == 0)
    {
LABEL_41:
      if ((v12 & 0x10) == 0) {
        goto LABEL_42;
      }
      goto LABEL_125;
    }
  }
  else if ((v12 & 0x80000000) == 0)
  {
    goto LABEL_41;
  }
  self->_uint64_t bloodType = *((_DWORD *)v4 + 68);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v12 = *(void *)(v4 + 404);
  if ((v12 & 0x10) == 0)
  {
LABEL_42:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_double bloodTypeModifiedDate = *((double *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v12 = *(void *)(v4 + 404);
  if ((v12 & 0x4000) == 0)
  {
LABEL_43:
    if ((v12 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_126:
  self->_isOrganDonor = *((void *)v4 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  if ((*(void *)(v4 + 404) & 0x8000) != 0)
  {
LABEL_44:
    self->_double isOrganDonorModifiedDate = *((double *)v4 + 16);
    *(void *)&self->_has |= 0x8000uLL;
  }
LABEL_45:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v13 = *((id *)v4 + 37);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v60 != v16) {
          objc_enumerationMutation(v13);
        }
        [(HDCodableMedicalIDData *)self addEmergencyContacts:*(void *)(*((void *)&v59 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v15);
  }

  if ((v4[405] & 4) != 0)
  {
    self->_double emergencyContactsModifiedDate = *((double *)v4 + 11);
    *(void *)&self->_has |= 0x400uLL;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v18 = *((id *)v4 + 35);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(v18);
        }
        [(HDCodableMedicalIDData *)self addClinicalContacts:*(void *)(*((void *)&v55 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v20);
  }

  if ((v4[404] & 0x20) != 0)
  {
    self->_double clinicalContactsModifiedDate = *((double *)v4 + 6);
    *(void *)&self->_has |= 0x20uLL;
  }
  if (*((void *)v4 + 40)) {
    -[HDCodableMedicalIDData setMedicalConditions:](self, "setMedicalConditions:");
  }
  if (v4[406])
  {
    self->_double medicalConditionsModifiedDate = *((double *)v4 + 17);
    *(void *)&self->_has |= 0x10000uLL;
  }
  if (*((void *)v4 + 42)) {
    -[HDCodableMedicalIDData setMedicalNotes:](self, "setMedicalNotes:");
  }
  if ((v4[406] & 2) != 0)
  {
    self->_double medicalNotesModifiedDate = *((double *)v4 + 18);
    *(void *)&self->_has |= 0x20000uLL;
  }
  if (*((void *)v4 + 33)) {
    -[HDCodableMedicalIDData setAllergyInfo:](self, "setAllergyInfo:");
  }
  if ((v4[404] & 8) != 0)
  {
    self->_double allergyInfoModifiedDate = *((double *)v4 + 4);
    *(void *)&self->_has |= 8uLL;
  }
  if (*((void *)v4 + 43)) {
    -[HDCodableMedicalIDData setMedicationInfo:](self, "setMedicationInfo:");
  }
  uint64_t v23 = *(void *)(v4 + 404);
  if ((v23 & 0x40000) != 0)
  {
    self->_double medicationInfoModifiedDate = *((double *)v4 + 19);
    *(void *)&self->_has |= 0x40000uLL;
    uint64_t v23 = *(void *)(v4 + 404);
    if ((v23 & 0x400000000) == 0)
    {
LABEL_79:
      if ((v23 & 0x20000000) == 0) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
  }
  else if ((v23 & 0x400000000) == 0)
  {
    goto LABEL_79;
  }
  self->_shareDuringEmergency = v4[401];
  *(void *)&self->_has |= 0x400000000uLL;
  if ((*(void *)(v4 + 404) & 0x20000000) != 0)
  {
LABEL_80:
    self->_double shareDuringEmergencyModifiedDate = *((double *)v4 + 30);
    *(void *)&self->_has |= 0x20000000uLL;
  }
LABEL_81:
  if (*((void *)v4 + 47)) {
    -[HDCodableMedicalIDData setPrimaryLanguageCode:](self, "setPrimaryLanguageCode:");
  }
  uint64_t v24 = *(void *)(v4 + 404);
  if ((v24 & 0x10000000) != 0)
  {
    self->_double primaryLanguageCodeModifiedDate = *((double *)v4 + 29);
    *(void *)&self->_has |= 0x10000000uLL;
    uint64_t v24 = *(void *)(v4 + 404);
    if ((v24 & 0x4000000) == 0)
    {
LABEL_85:
      if ((v24 & 0x8000000) == 0) {
        goto LABEL_86;
      }
      goto LABEL_133;
    }
  }
  else if ((v24 & 0x4000000) == 0)
  {
    goto LABEL_85;
  }
  self->_double pregnancyStartDate = *((double *)v4 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v24 = *(void *)(v4 + 404);
  if ((v24 & 0x8000000) == 0)
  {
LABEL_86:
    if ((v24 & 0x1000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_double pregnancyStartDateModifiedDate = *((double *)v4 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v24 = *(void *)(v4 + 404);
  if ((v24 & 0x1000000) == 0)
  {
LABEL_87:
    if ((v24 & 0x2000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
LABEL_134:
  self->_double pregnancyEstimatedDueDate = *((double *)v4 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  if ((*(void *)(v4 + 404) & 0x2000000) != 0)
  {
LABEL_88:
    self->_double pregnancyEstimatedDueDateModifiedDate = *((double *)v4 + 26);
    *(void *)&self->_has |= 0x2000000uLL;
  }
LABEL_89:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v25 = *((id *)v4 + 44);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v52 != v28) {
          objc_enumerationMutation(v25);
        }
        [(HDCodableMedicalIDData *)self addMedicationsList:*(void *)(*((void *)&v51 + 1) + 8 * k)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v27);
  }

  uint64_t v30 = *(void *)(v4 + 404);
  if ((v30 & 0x80000) != 0)
  {
    self->_double medicationsListModifiedDate = *((double *)v4 + 20);
    *(void *)&self->_has |= 0x80000uLL;
    uint64_t v30 = *(void *)(v4 + 404);
    if ((v30 & 0x100000) == 0)
    {
LABEL_98:
      if ((v30 & 0x200000) == 0) {
        goto LABEL_100;
      }
      goto LABEL_99;
    }
  }
  else if ((v30 & 0x100000) == 0)
  {
    goto LABEL_98;
  }
  self->_medicationsListVersiouint64_t n = *((void *)v4 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  if ((*(void *)(v4 + 404) & 0x200000) != 0)
  {
LABEL_99:
    self->_double medicationsListVersionModifiedDate = *((double *)v4 + 22);
    *(void *)&self->_has |= 0x200000uLL;
  }
LABEL_100:
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v31 = *((id *)v4 + 32);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v31);
        }
        [(HDCodableMedicalIDData *)self addAllergiesList:*(void *)(*((void *)&v47 + 1) + 8 * m)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v64 count:16];
    }
    while (v33);
  }

  uint64_t v36 = *(void *)(v4 + 404);
  if (v36)
  {
    self->_double allergiesListModifiedDate = *((double *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v36 = *(void *)(v4 + 404);
    if ((v36 & 2) == 0)
    {
LABEL_109:
      if ((v36 & 4) == 0) {
        goto LABEL_111;
      }
      goto LABEL_110;
    }
  }
  else if ((v36 & 2) == 0)
  {
    goto LABEL_109;
  }
  self->_allergiesListVersiouint64_t n = *((void *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  if ((*(void *)(v4 + 404) & 4) != 0)
  {
LABEL_110:
    self->_double allergiesListVersionModifiedDate = *((double *)v4 + 3);
    *(void *)&self->_has |= 4uLL;
  }
LABEL_111:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v37 = *((id *)v4 + 36);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v43 objects:v63 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v44;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(v37);
        }
        -[HDCodableMedicalIDData addConditionsList:](self, "addConditionsList:", *(void *)(*((void *)&v43 + 1) + 8 * n), (void)v43);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v43 objects:v63 count:16];
    }
    while (v39);
  }

  uint64_t v42 = *(void *)(v4 + 404);
  if ((v42 & 0x40) == 0)
  {
    if ((v42 & 0x80) == 0) {
      goto LABEL_120;
    }
LABEL_143:
    self->_conditionsListVersiouint64_t n = *((void *)v4 + 8);
    *(void *)&self->_has |= 0x80uLL;
    if ((*(void *)(v4 + 404) & 0x100) == 0) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
  self->_double conditionsListModifiedDate = *((double *)v4 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v42 = *(void *)(v4 + 404);
  if ((v42 & 0x80) != 0) {
    goto LABEL_143;
  }
LABEL_120:
  if ((v42 & 0x100) != 0)
  {
LABEL_121:
    self->_double conditionsListVersionModifiedDate = *((double *)v4 + 9);
    *(void *)&self->_has |= 0x100uLL;
  }
LABEL_122:
}

- (NSData)medicalIDBytes
{
  return self->_medicalIDBytes;
}

- (void)setMedicalIDBytes:(id)a3
{
}

- (double)dateSaved
{
  return self->_dateSaved;
}

- (unsigned)schemaVersion
{
  return self->_schemaVersion;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (double)isDisabledModifiedDate
{
  return self->_isDisabledModifiedDate;
}

- (NSData)pictureData
{
  return self->_pictureData;
}

- (void)setPictureData:(id)a3
{
}

- (double)pictureDataModifiedDate
{
  return self->_pictureDataModifiedDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)nameModifiedDate
{
  return self->_nameModifiedDate;
}

- (HDCodableDateComponents)gregorianBirthday
{
  return self->_gregorianBirthday;
}

- (void)setGregorianBirthday:(id)a3
{
}

- (double)gregorianBirthdayModifiedDate
{
  return self->_gregorianBirthdayModifiedDate;
}

- (HDCodableQuantity)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
}

- (double)heightModifiedDate
{
  return self->_heightModifiedDate;
}

- (HDCodableQuantity)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
}

- (double)weightModifiedDate
{
  return self->_weightModifiedDate;
}

- (double)bloodTypeModifiedDate
{
  return self->_bloodTypeModifiedDate;
}

- (int64_t)isOrganDonor
{
  return self->_isOrganDonor;
}

- (double)isOrganDonorModifiedDate
{
  return self->_isOrganDonorModifiedDate;
}

- (NSMutableArray)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void)setEmergencyContacts:(id)a3
{
}

- (double)emergencyContactsModifiedDate
{
  return self->_emergencyContactsModifiedDate;
}

- (NSMutableArray)clinicalContacts
{
  return self->_clinicalContacts;
}

- (void)setClinicalContacts:(id)a3
{
}

- (double)clinicalContactsModifiedDate
{
  return self->_clinicalContactsModifiedDate;
}

- (NSString)medicalConditions
{
  return self->_medicalConditions;
}

- (void)setMedicalConditions:(id)a3
{
}

- (double)medicalConditionsModifiedDate
{
  return self->_medicalConditionsModifiedDate;
}

- (NSString)medicalNotes
{
  return self->_medicalNotes;
}

- (void)setMedicalNotes:(id)a3
{
}

- (double)medicalNotesModifiedDate
{
  return self->_medicalNotesModifiedDate;
}

- (NSString)allergyInfo
{
  return self->_allergyInfo;
}

- (void)setAllergyInfo:(id)a3
{
}

- (double)allergyInfoModifiedDate
{
  return self->_allergyInfoModifiedDate;
}

- (NSString)medicationInfo
{
  return self->_medicationInfo;
}

- (void)setMedicationInfo:(id)a3
{
}

- (double)medicationInfoModifiedDate
{
  return self->_medicationInfoModifiedDate;
}

- (BOOL)shareDuringEmergency
{
  return self->_shareDuringEmergency;
}

- (double)shareDuringEmergencyModifiedDate
{
  return self->_shareDuringEmergencyModifiedDate;
}

- (NSString)primaryLanguageCode
{
  return self->_primaryLanguageCode;
}

- (void)setPrimaryLanguageCode:(id)a3
{
}

- (double)primaryLanguageCodeModifiedDate
{
  return self->_primaryLanguageCodeModifiedDate;
}

- (double)pregnancyStartDate
{
  return self->_pregnancyStartDate;
}

- (double)pregnancyStartDateModifiedDate
{
  return self->_pregnancyStartDateModifiedDate;
}

- (double)pregnancyEstimatedDueDate
{
  return self->_pregnancyEstimatedDueDate;
}

- (double)pregnancyEstimatedDueDateModifiedDate
{
  return self->_pregnancyEstimatedDueDateModifiedDate;
}

- (NSMutableArray)medicationsLists
{
  return self->_medicationsLists;
}

- (void)setMedicationsLists:(id)a3
{
}

- (double)medicationsListModifiedDate
{
  return self->_medicationsListModifiedDate;
}

- (int64_t)medicationsListVersion
{
  return self->_medicationsListVersion;
}

- (double)medicationsListVersionModifiedDate
{
  return self->_medicationsListVersionModifiedDate;
}

- (NSMutableArray)allergiesLists
{
  return self->_allergiesLists;
}

- (void)setAllergiesLists:(id)a3
{
}

- (double)allergiesListModifiedDate
{
  return self->_allergiesListModifiedDate;
}

- (int64_t)allergiesListVersion
{
  return self->_allergiesListVersion;
}

- (double)allergiesListVersionModifiedDate
{
  return self->_allergiesListVersionModifiedDate;
}

- (NSMutableArray)conditionsLists
{
  return self->_conditionsLists;
}

- (void)setConditionsLists:(id)a3
{
}

- (double)conditionsListModifiedDate
{
  return self->_conditionsListModifiedDate;
}

- (int64_t)conditionsListVersion
{
  return self->_conditionsListVersion;
}

- (double)conditionsListVersionModifiedDate
{
  return self->_conditionsListVersionModifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
  objc_storeStrong((id *)&self->_pictureData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_medicationsLists, 0);
  objc_storeStrong((id *)&self->_medicationInfo, 0);
  objc_storeStrong((id *)&self->_medicalNotes, 0);
  objc_storeStrong((id *)&self->_medicalIDBytes, 0);
  objc_storeStrong((id *)&self->_medicalConditions, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_gregorianBirthday, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_conditionsLists, 0);
  objc_storeStrong((id *)&self->_clinicalContacts, 0);
  objc_storeStrong((id *)&self->_allergyInfo, 0);

  objc_storeStrong((id *)&self->_allergiesLists, 0);
}

@end