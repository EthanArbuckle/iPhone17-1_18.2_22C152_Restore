@interface HKMedicationScheduleItemQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (HKMedicationScheduleItemQueryConfiguration)initWithCoder:(id)a3;
- (NSArray)sortDescriptors;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFromDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation HKMedicationScheduleItemQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationScheduleItemQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v10 copyWithZone:a3];
  v5 = [(HKMedicationScheduleItemQueryConfiguration *)self fromDate];
  [v4 setFromDate:v5];

  v6 = [(HKMedicationScheduleItemQueryConfiguration *)self toDate];
  [v4 setToDate:v6];

  v7 = [(HKMedicationScheduleItemQueryConfiguration *)self identifier];
  [v4 setIdentifier:v7];

  v8 = [(HKMedicationScheduleItemQueryConfiguration *)self sortDescriptors];
  [v4 setSortDescriptors:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationScheduleItemQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationScheduleItemQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FromDate"];
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ToDate"];
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"SortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleItemQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fromDate, @"FromDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_toDate forKey:@"ToDate"];
  [v4 encodeObject:self->_identifier forKey:@"Identifier"];
  [v4 encodeObject:self->_sortDescriptors forKey:@"SortDescriptors"];
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_toDate, 0);

  objc_storeStrong((id *)&self->_fromDate, 0);
}

@end