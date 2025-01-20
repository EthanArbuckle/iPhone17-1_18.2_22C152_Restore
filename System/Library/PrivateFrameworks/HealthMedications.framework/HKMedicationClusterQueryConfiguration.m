@interface HKMedicationClusterQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (HKMedicationClusterQueryConfiguration)initWithCoder:(id)a3;
- (NSArray)existingMedications;
- (NSArray)scanResult;
- (NSArray)textSearchTokens;
- (NSDate)sinceDate;
- (NSString)machineReadableCode;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)codeAttributeType;
- (int64_t)queryType;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setCodeAttributeType:(int64_t)a3;
- (void)setExistingMedications:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setMachineReadableCode:(id)a3;
- (void)setQueryType:(int64_t)a3;
- (void)setScanResult:(id)a3;
- (void)setSinceDate:(id)a3;
- (void)setTextSearchTokens:(id)a3;
@end

@implementation HKMedicationClusterQueryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationClusterQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationClusterQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v17 initWithCoder:v4];
  if (v5)
  {
    v5->_queryType = [v4 decodeIntegerForKey:@"QueryType"];
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"ScanResult"];
    scanResult = v5->_scanResult;
    v5->_scanResult = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MachineReadableCode"];
    machineReadableCode = v5->_machineReadableCode;
    v5->_machineReadableCode = (NSString *)v8;

    v5->_codeAttributeType = (int)[v4 decodeIntForKey:@"CodeAttributeType"];
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"TextSearchTokens"];
    textSearchTokens = v5->_textSearchTokens;
    v5->_textSearchTokens = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"ExistingMedications"];
    existingMedications = v5->_existingMedications;
    v5->_existingMedications = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SinceDate"];
    sinceDate = v5->_sinceDate;
    v5->_sinceDate = (NSDate *)v14;

    v5->_limit = [v4 decodeIntegerForKey:@"Limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationClusterQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_queryType, @"QueryType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_scanResult forKey:@"ScanResult"];
  [v4 encodeObject:self->_machineReadableCode forKey:@"MachineReadableCode"];
  [v4 encodeInteger:self->_codeAttributeType forKey:@"CodeAttributeType"];
  [v4 encodeObject:self->_textSearchTokens forKey:@"TextSearchTokens"];
  [v4 encodeObject:self->_existingMedications forKey:@"ExistingMedications"];
  [v4 encodeObject:self->_sinceDate forKey:@"SinceDate"];
  [v4 encodeInteger:self->_limit forKey:@"Limit"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationClusterQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v11 copyWithZone:a3];
  [v4 setQueryType:self->_queryType];
  objc_super v5 = (void *)[(NSArray *)self->_scanResult copy];
  [v4 setScanResult:v5];

  uint64_t v6 = (void *)[(NSString *)self->_machineReadableCode copy];
  [v4 setMachineReadableCode:v6];

  [v4 setCodeAttributeType:self->_codeAttributeType];
  v7 = (void *)[(NSArray *)self->_textSearchTokens copy];
  [v4 setTextSearchTokens:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_existingMedications copy];
  [v4 setExistingMedications:v8];

  v9 = (void *)[(NSDate *)self->_sinceDate copy];
  [v4 setSinceDate:v9];

  [v4 setLimit:self->_limit];
  return v4;
}

- (int64_t)queryType
{
  return self->_queryType;
}

- (void)setQueryType:(int64_t)a3
{
  self->_queryType = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSArray)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
}

- (NSString)machineReadableCode
{
  return self->_machineReadableCode;
}

- (void)setMachineReadableCode:(id)a3
{
}

- (int64_t)codeAttributeType
{
  return self->_codeAttributeType;
}

- (void)setCodeAttributeType:(int64_t)a3
{
  self->_codeAttributeType = a3;
}

- (NSArray)textSearchTokens
{
  return self->_textSearchTokens;
}

- (void)setTextSearchTokens:(id)a3
{
}

- (NSArray)existingMedications
{
  return self->_existingMedications;
}

- (void)setExistingMedications:(id)a3
{
}

- (NSDate)sinceDate
{
  return self->_sinceDate;
}

- (void)setSinceDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sinceDate, 0);
  objc_storeStrong((id *)&self->_existingMedications, 0);
  objc_storeStrong((id *)&self->_textSearchTokens, 0);
  objc_storeStrong((id *)&self->_machineReadableCode, 0);

  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end