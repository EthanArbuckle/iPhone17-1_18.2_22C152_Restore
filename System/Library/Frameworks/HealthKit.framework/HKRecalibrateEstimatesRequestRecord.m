@interface HKRecalibrateEstimatesRequestRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKRecalibrateEstimatesRequestRecord)initWithCoder:(id)a3;
- (HKRecalibrateEstimatesRequestRecord)initWithSessionIdentifier:(id)a3 source:(id)a4 sampleType:(id)a5 effectiveDate:(id)a6;
- (HKSampleType)sampleType;
- (HKSource)source;
- (NSDate)effectiveDate;
- (NSUUID)sessionIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKRecalibrateEstimatesRequestRecord

- (HKRecalibrateEstimatesRequestRecord)initWithSessionIdentifier:(id)a3 source:(id)a4 sampleType:(id)a5 effectiveDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKRecalibrateEstimatesRequestRecord;
  v14 = [(HKRecalibrateEstimatesRequestRecord *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    source = v14->_source;
    v14->_source = (HKSource *)v17;

    uint64_t v19 = [v12 copy];
    sampleType = v14->_sampleType;
    v14->_sampleType = (HKSampleType *)v19;

    uint64_t v21 = [v13 copy];
    effectiveDate = v14->_effectiveDate;
    v14->_effectiveDate = (NSDate *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (![(NSUUID *)self->_sessionIdentifier isEqual:v5[1]]
      || ![(HKSource *)self->_source isEqual:v5[2]]
      || ![(HKObjectType *)self->_sampleType isEqual:v5[3]])
    {
      goto LABEL_9;
    }
    effectiveDate = self->_effectiveDate;
    v7 = (NSDate *)v5[4];
    if (effectiveDate == v7)
    {
      char v8 = 1;
      goto LABEL_10;
    }
    if (v7) {
      char v8 = -[NSDate isEqualToDate:](effectiveDate, "isEqualToDate:");
    }
    else {
LABEL_9:
    }
      char v8 = 0;
LABEL_10:

    goto LABEL_11;
  }
  char v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_sessionIdentifier hash];
  unint64_t v4 = [(HKSource *)self->_source hash] ^ v3;
  unint64_t v5 = [(HKObjectType *)self->_sampleType hash];
  return v4 ^ v5 ^ [(NSDate *)self->_effectiveDate hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p sessionId:%@, source:%@, sampleType:%@, effectiveDate:%@>", objc_opt_class(), self, self->_sessionIdentifier, self->_source, self->_sampleType, self->_effectiveDate];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRecalibrateEstimatesRequestRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKRecalibrateEstimatesRequestRecord;
  unint64_t v5 = [(HKRecalibrateEstimatesRequestRecord *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session_id"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (HKSource *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sample_type"];
    sampleType = v5->_sampleType;
    v5->_sampleType = (HKSampleType *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eff_date"];
    effectiveDate = v5->_effectiveDate;
    v5->_effectiveDate = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"session_id"];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeObject:self->_sampleType forKey:@"sample_type"];
  [v5 encodeObject:self->_effectiveDate forKey:@"eff_date"];
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKSource)source
{
  return self->_source;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end