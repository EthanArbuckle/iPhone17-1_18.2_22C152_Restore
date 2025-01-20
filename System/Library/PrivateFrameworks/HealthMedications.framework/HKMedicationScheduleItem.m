@interface HKMedicationScheduleItem
+ (BOOL)isScheduleItemIdentifier:(id)a3 matchingDateTime:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)makeStableIdentifierFromScheduledDateTime:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)notificationSent;
- (HKMedicationScheduleItem)initWithCoder:(id)a3;
- (HKMedicationScheduleItem)initWithScheduledDateTime:(id)a3 notificationSent:(BOOL)a4 doses:(id)a5;
- (NSArray)doses;
- (NSDate)scheduledDateTime;
- (NSString)identifier;
- (id)_dosesDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationScheduleItem

- (HKMedicationScheduleItem)initWithScheduledDateTime:(id)a3 notificationSent:(BOOL)a4 doses:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationScheduleItem;
  v10 = [(HKMedicationScheduleItem *)&v18 init];
  if (v10)
  {
    uint64_t v11 = +[HKMedicationScheduleItem makeStableIdentifierFromScheduledDateTime:v8];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v8 copy];
    scheduledDateTime = v10->_scheduledDateTime;
    v10->_scheduledDateTime = (NSDate *)v13;

    v10->_notificationSent = a4;
    uint64_t v15 = [v9 copy];
    doses = v10->_doses;
    v10->_doses = (NSArray *)v15;
  }
  return v10;
}

+ (BOOL)isScheduleItemIdentifier:(id)a3 matchingDateTime:(id)a4
{
  id v5 = a3;
  v6 = +[HKMedicationScheduleItem makeStableIdentifierFromScheduledDateTime:a4];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMedicationScheduleItem *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSString *)v4->_identifier isEqual:self->_identifier];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

+ (id)makeStableIdentifierFromScheduledDateTime:(id)a3
{
  v3 = NSString;
  [a3 timeIntervalSinceReferenceDate];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%f", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_scheduledDateTime forKey:@"scheduledDateTime"];
  [v5 encodeBool:self->_notificationSent forKey:@"notificationSent"];
  [v5 encodeObject:self->_doses forKey:@"doses"];
}

- (HKMedicationScheduleItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationScheduleItem;
  id v5 = [(HKMedicationScheduleItem *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledDateTime"];
    scheduledDateTime = v5->_scheduledDateTime;
    v5->_scheduledDateTime = (NSDate *)v8;

    v5->_notificationSent = [v4 decodeBoolForKey:@"notificationSent"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"doses"];
    doses = v5->_doses;
    v5->_doses = (NSArray *)v13;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKMedicationScheduleItem *)self identifier];
  uint64_t v6 = [(HKMedicationScheduleItem *)self scheduledDateTime];
  BOOL v7 = [(HKMedicationScheduleItem *)self notificationSent];
  uint64_t v8 = -[HKMedicationScheduleItem _dosesDescription](self);
  id v9 = [v3 stringWithFormat:@"<%@: %p>: identifier: %@ scheduledDateTime: %@ notificationSent: %i doses:\n%@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (id)_dosesDescription
{
  id v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28E78] string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v3 = [v1 doses];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = NSString;
          id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
          v10 = [v8 stringWithFormat:@"%@\n", v9];
          [v2 appendString:v10];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    id v1 = [NSString stringWithString:v2];
  }

  return v1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)scheduledDateTime
{
  return self->_scheduledDateTime;
}

- (BOOL)notificationSent
{
  return self->_notificationSent;
}

- (NSArray)doses
{
  return self->_doses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doses, 0);
  objc_storeStrong((id *)&self->_scheduledDateTime, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end