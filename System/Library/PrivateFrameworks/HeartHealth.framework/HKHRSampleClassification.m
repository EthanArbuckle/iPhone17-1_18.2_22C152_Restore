@interface HKHRSampleClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHRSampleClassification)initWithCoder:(id)a3;
- (HKHRSampleClassification)initWithSampleUUID:(id)a3 classification:(int64_t)a4 sampleDateInterval:(id)a5 sampleTimeZone:(id)a6;
- (NSDateInterval)sampleDateInterval;
- (NSTimeZone)sampleTimeZone;
- (NSUUID)sampleUUID;
- (id)description;
- (int64_t)classification;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHRSampleClassification

- (HKHRSampleClassification)initWithSampleUUID:(id)a3 classification:(int64_t)a4 sampleDateInterval:(id)a5 sampleTimeZone:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKHRSampleClassification;
  v14 = [(HKHRSampleClassification *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sampleUUID, a3);
    v15->_classification = a4;
    objc_storeStrong((id *)&v15->_sampleDateInterval, a5);
    objc_storeStrong((id *)&v15->_sampleTimeZone, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHRSampleClassification *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(NSUUID *)self->_sampleUUID isEqual:v5->_sampleUUID]
        && self->_classification == v5->_classification
        && [(NSDateInterval *)self->_sampleDateInterval isEqualToDateInterval:v5->_sampleDateInterval]&& [(NSTimeZone *)self->_sampleTimeZone isEqualToTimeZone:v5->_sampleTimeZone];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = self->_classification ^ [(NSUUID *)self->_sampleUUID hash];
  uint64_t v4 = [(NSDateInterval *)self->_sampleDateInterval hash];
  return v3 ^ v4 ^ [(NSTimeZone *)self->_sampleTimeZone hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sampleUUID = self->_sampleUUID;
  id v5 = a3;
  [v5 encodeObject:sampleUUID forKey:@"SampleUUID"];
  [v5 encodeInteger:self->_classification forKey:@"Classification"];
  [v5 encodeObject:self->_sampleDateInterval forKey:@"SampleDateInterval"];
  [v5 encodeObject:self->_sampleTimeZone forKey:@"SampleTimeZone"];
}

- (HKHRSampleClassification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHRSampleClassification;
  id v5 = [(HKHRSampleClassification *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SampleUUID"];
    sampleUUID = v5->_sampleUUID;
    v5->_sampleUUID = (NSUUID *)v6;

    v5->_classification = [v4 decodeIntegerForKey:@"Classification"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SampleDateInterval"];
    sampleDateInterval = v5->_sampleDateInterval;
    v5->_sampleDateInterval = (NSDateInterval *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SampleTimeZone"];
    sampleTimeZone = v5->_sampleTimeZone;
    v5->_sampleTimeZone = (NSTimeZone *)v10;
  }
  return v5;
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global);
  }
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSUUID *)self->_sampleUUID UUIDString];
  uint64_t v6 = (void *)description_formatter;
  int64_t classification = self->_classification;
  uint64_t v8 = [(NSDateInterval *)self->_sampleDateInterval endDate];
  v9 = [v6 stringFromDate:v8];
  uint64_t v10 = [(NSTimeZone *)self->_sampleTimeZone abbreviation];
  id v11 = [v3 stringWithFormat:@"<%@:%p UUID:%@ classification:%ld endDate:%@, timeZone:%@>", v4, self, v5, classification, v9, v10];

  return v11;
}

uint64_t __39__HKHRSampleClassification_description__block_invoke()
{
  description_formatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28D48]);

  return MEMORY[0x1F41817F8]();
}

- (NSUUID)sampleUUID
{
  return self->_sampleUUID;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSDateInterval)sampleDateInterval
{
  return self->_sampleDateInterval;
}

- (NSTimeZone)sampleTimeZone
{
  return self->_sampleTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTimeZone, 0);
  objc_storeStrong((id *)&self->_sampleDateInterval, 0);

  objc_storeStrong((id *)&self->_sampleUUID, 0);
}

@end