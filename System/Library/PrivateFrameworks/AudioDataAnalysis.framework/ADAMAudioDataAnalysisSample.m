@interface ADAMAudioDataAnalysisSample
+ (BOOL)supportsSecureCoding;
- (ADAMAudioDataAnalysisSample)initWithCoder:(id)a3;
- (NSDateInterval)dateInterval;
- (NSDictionary)metadata;
- (NSNumber)data;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initAudioSampleWithType:(unsigned int)a3 data:(id)a4 dateInterval:(id)a5 metadata:(id)a6;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAMAudioDataAnalysisSample

- (id)initAudioSampleWithType:(unsigned int)a3 data:(id)a4 dateInterval:(id)a5 metadata:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ADAMAudioDataAnalysisSample;
  v14 = [(ADAMAudioDataAnalysisSample *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->type = a3;
    objc_storeStrong((id *)&v14->data, a4);
    objc_storeStrong((id *)&v15->dateInterval, a5);
    uint64_t v16 = [v13 copy];
    metadata = v15->metadata;
    v15->metadata = (NSDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    uuid = v15->uuid;
    v15->uuid = (NSUUID *)v18;
  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[ADAMAudioDataAnalysisSample type](self, "type"), @"kADAMAudioDataAnalysisType");
  v5 = [(ADAMAudioDataAnalysisSample *)self data];
  [v5 doubleValue];
  objc_msgSend(v4, "encodeDouble:forKey:", @"kADAMAudioDataAnalysisData");

  v6 = [(ADAMAudioDataAnalysisSample *)self dateInterval];
  [v4 encodeObject:v6 forKey:@"kADAMAudioDataAnalysisSampleDateInterval"];

  v7 = [(ADAMAudioDataAnalysisSample *)self metadata];
  [v4 encodeObject:v7 forKey:@"kADAMAudioDataAnalysisSampleMetadata"];

  id v8 = [(ADAMAudioDataAnalysisSample *)self uuid];
  [v4 encodeObject:v8 forKey:@"kADAMAudioDataAnalysisSampleUUID"];
}

- (ADAMAudioDataAnalysisSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ADAMAudioDataAnalysisSample;
  v5 = [(ADAMAudioDataAnalysisSample *)&v21 init];
  if (v5)
  {
    v5->type = [v4 decodeInt32ForKey:@"kADAMAudioDataAnalysisType"];
    v6 = NSNumber;
    [v4 decodeDoubleForKey:@"kADAMAudioDataAnalysisData"];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    data = v5->data;
    v5->data = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kADAMAudioDataAnalysisSampleDateInterval"];
    dateInterval = v5->dateInterval;
    v5->dateInterval = (NSDateInterval *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kADAMAudioDataAnalysisSampleMetadata"];
    uint64_t v16 = [v15 copy];
    metadata = v5->metadata;
    v5->metadata = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kADAMAudioDataAnalysisSampleUUID"];
    uuid = v5->uuid;
    v5->uuid = (NSUUID *)v18;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(ADAMAudioDataAnalysisSample *)self type];
  uint64_t v7 = [(ADAMAudioDataAnalysisSample *)self data];
  id v8 = [(ADAMAudioDataAnalysisSample *)self dateInterval];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  v10 = [(ADAMAudioDataAnalysisSample *)self metadata];
  id v11 = (void *)[v10 copyWithZone:a3];
  uint64_t v12 = (void *)[v5 initAudioSampleWithType:v6 data:v7 dateInterval:v9 metadata:v11];

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ADAMAudioDataAnalysisSample *)self uuid];
  v5 = [(ADAMAudioDataAnalysisSample *)self data];
  uint64_t v6 = +[ADAFUtil stringFromDataType:[(ADAMAudioDataAnalysisSample *)self type]];
  uint64_t v7 = [(ADAMAudioDataAnalysisSample *)self dateInterval];
  id v8 = [(ADAMAudioDataAnalysisSample *)self metadata];
  uint64_t v9 = [v3 stringWithFormat:@"ADAMAudioDataAnalysisSample: uuid = %@, data = %@, type = %@, date= %@, metadata= %@", v4, v5, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)data
{
  return self->data;
}

- (NSDateInterval)dateInterval
{
  return self->dateInterval;
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (unsigned)type
{
  return self->type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->dateInterval, 0);

  objc_storeStrong((id *)&self->data, 0);
}

@end