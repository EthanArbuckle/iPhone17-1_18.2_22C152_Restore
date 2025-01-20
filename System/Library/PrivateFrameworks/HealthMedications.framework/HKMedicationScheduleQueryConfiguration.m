@interface HKMedicationScheduleQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (HKMedicationScheduleQueryConfiguration)initWithCoder:(id)a3;
- (NSArray)sortDescriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation HKMedicationScheduleQueryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationScheduleQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationScheduleQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_limit = [v4 decodeIntegerForKey:@"Limit"];
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"SortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, @"Limit", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sortDescriptors forKey:@"SortDescriptors"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicationScheduleQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setLimit:self->_limit];
  [v4 setSortDescriptors:self->_sortDescriptors];
  return v4;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
}

@end