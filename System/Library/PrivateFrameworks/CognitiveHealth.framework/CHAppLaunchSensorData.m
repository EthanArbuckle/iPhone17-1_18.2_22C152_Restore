@interface CHAppLaunchSensorData
+ (BOOL)supportsSecureCoding;
- (CHAppLaunchSensorData)initWithBundleId:(id)a3 embeddingVector:(id)a4 modelVersion:(id)a5 algorithmType:(id)a6 trainingDate:(id)a7;
- (CHAppLaunchSensorData)initWithCoder:(id)a3;
- (NSArray)embeddingVector;
- (NSDate)trainingDate;
- (NSString)algorithmType;
- (NSString)bundleId;
- (NSString)modelVersion;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHAppLaunchSensorData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingDate, 0);
  objc_storeStrong((id *)&self->_algorithmType, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_embeddingVector, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (NSDate)trainingDate
{
  return self->_trainingDate;
}

- (NSString)algorithmType
{
  return self->_algorithmType;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSArray)embeddingVector
{
  return self->_embeddingVector;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 setDateFormat:@"MM-dd-yyyy HH:mm"];
  v4 = NSString;
  long long v10 = *(_OWORD *)&self->_bundleId;
  modelVersion = self->_modelVersion;
  algorithmType = self->_algorithmType;
  v7 = [v3 stringFromDate:self->_trainingDate];
  v8 = [v4 stringWithFormat:@"<CHAppLaunchSensorData for bundleId: %@\nEmbeddingVector: %@\nModel version: %@ | algo: %@ | trainingDate: %@", v10, modelVersion, algorithmType, v7];

  return v8;
}

- (CHAppLaunchSensorData)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x263F61E90];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = &_os_log_internal;
  v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"bundleId" withCoder:v5 expectNonNull:1 errorDomain:@"CHErrorDomain" errorCode:1 logHandle:&_os_log_internal];
  if (!v9)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"CHAppLaunchSensorData.m" lineNumber:63 description:@"bundleId can't be nil."];
  }
  long long v10 = (void *)MEMORY[0x263F61E90];
  v11 = (void *)MEMORY[0x24C5C6310]();
  id v12 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  v15 = [v10 robustDecodeObjectOfClasses:v14 forKey:@"embeddingVector" withCoder:v5 expectNonNull:0 errorDomain:@"CHErrorDomain" errorCode:1 logHandle:v8];

  v16 = [MEMORY[0x263F61E90] robustDecodeObjectOfClass:objc_opt_class() forKey:@"modelVersion" withCoder:v5 expectNonNull:0 errorDomain:@"CHErrorDomain" errorCode:1 logHandle:v8];
  v17 = [MEMORY[0x263F61E90] robustDecodeObjectOfClass:objc_opt_class() forKey:@"algorithmType" withCoder:v5 expectNonNull:0 errorDomain:@"CHErrorDomain" errorCode:1 logHandle:v8];
  v18 = [MEMORY[0x263F61E90] robustDecodeObjectOfClass:objc_opt_class() forKey:@"trainingDate" withCoder:v5 expectNonNull:0 errorDomain:@"CHErrorDomain" errorCode:1 logHandle:v8];
  v19 = [[CHAppLaunchSensorData alloc] initWithBundleId:v9 embeddingVector:v15 modelVersion:v16 algorithmType:v17 trainingDate:v18];

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_embeddingVector forKey:@"embeddingVector"];
  [v5 encodeObject:self->_modelVersion forKey:@"modelVersion"];
  [v5 encodeObject:self->_algorithmType forKey:@"algorithmType"];
  [v5 encodeObject:self->_trainingDate forKey:@"trainingDate"];
}

- (CHAppLaunchSensorData)initWithBundleId:(id)a3 embeddingVector:(id)a4 modelVersion:(id)a5 algorithmType:(id)a6 trainingDate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CHAppLaunchSensorData;
  v17 = [(CHAppLaunchSensorData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    objc_storeStrong((id *)&v18->_embeddingVector, a4);
    objc_storeStrong((id *)&v18->_modelVersion, a5);
    objc_storeStrong((id *)&v18->_algorithmType, a6);
    objc_storeStrong((id *)&v18->_trainingDate, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end