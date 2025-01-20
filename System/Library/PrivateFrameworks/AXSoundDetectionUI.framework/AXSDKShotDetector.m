@interface AXSDKShotDetector
+ (BOOL)supportsSecureCoding;
- (AXSDKShotDetector)initWithCoder:(id)a3;
- (AXSDKShotDetector)initWithName:(id)a3;
- (AXSDKShotDetector)initWithName:(id)a3 andIdentifier:(id)a4;
- (BOOL)isCustom;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKShotDetector:(id)a3;
- (BOOL)isModelReady;
- (BOOL)isTrainingComplete;
- (BOOL)modelFailed;
- (BOOL)shouldRetrain;
- (NSDate)lastAttemptedTrainingDate;
- (NSString)category;
- (NSString)name;
- (id)debugDescription;
- (id)description;
- (id)mlModel;
- (id)modelURL;
- (id)modelURLString;
- (id)recordings;
- (unint64_t)compatibilityVersion;
- (unint64_t)contentVersion;
- (unint64_t)hash;
- (unint64_t)trainings;
- (void)addRecording:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mlModel;
- (void)setCategory:(id)a3;
- (void)setLastAttemptedTrainingDate:(id)a3;
- (void)setModelFailed:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRecordings:(id)a3;
- (void)setTrainings:(unint64_t)a3;
@end

@implementation AXSDKShotDetector

- (AXSDKShotDetector)initWithName:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXSDKShotDetector;
  v6 = [(AXSDKShotDetector *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customName, a3);
    objc_storeStrong((id *)&v7->_kshotCategory, (id)*MEMORY[0x263F21CB8]);
    lastAttemptedTrainingDate = v7->_lastAttemptedTrainingDate;
    v7->_lastAttemptedTrainingDate = 0;

    [(AXSDKShotDetector *)v7 setName:v7->_customName];
    v9 = [MEMORY[0x263F08C38] UUID];
    v10 = [v9 UUIDString];
    [(AXSDDetector *)v7 setIdentifier:v10];

    [(AXSDKShotDetector *)v7 setCategory:v7->_kshotCategory];
    [(AXSDKShotDetector *)v7 setModelFailed:0];
    [(AXSDKShotDetector *)v7 setTrainings:0];
  }

  return v7;
}

- (AXSDKShotDetector)initWithName:(id)a3 andIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXSDKShotDetector;
  v9 = [(AXSDKShotDetector *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customName, a3);
    objc_storeStrong((id *)&v10->_kshotCategory, (id)*MEMORY[0x263F21CB8]);
    lastAttemptedTrainingDate = v10->_lastAttemptedTrainingDate;
    v10->_lastAttemptedTrainingDate = 0;

    [(AXSDKShotDetector *)v10 setName:v10->_customName];
    objc_super v12 = [v8 UUIDString];
    [(AXSDDetector *)v10 setIdentifier:v12];

    [(AXSDKShotDetector *)v10 setCategory:v10->_kshotCategory];
    [(AXSDKShotDetector *)v10 setModelFailed:0];
    [(AXSDKShotDetector *)v10 setTrainings:0];
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSDKShotDetector *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(AXSDDetector *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  id v7 = [(AXSDKShotDetector *)self category];
  [v4 encodeObject:v7 forKey:@"category"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXSDKShotDetector modelFailed](self, "modelFailed"), @"modelFailed");
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSDKShotDetector trainings](self, "trainings"));
  [v4 encodeObject:v8 forKey:@"trainings"];

  id v9 = [(AXSDKShotDetector *)self lastAttemptedTrainingDate];
  [v4 encodeObject:v9 forKey:@"lastAttemptedTrainingDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSDKShotDetector)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXSDKShotDetector;
  id v5 = [(AXSDKShotDetector *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"name"];
    [(AXSDKShotDetector *)v5 setName:v6];

    id v7 = [v4 decodeObjectForKey:@"identifier"];
    [(AXSDDetector *)v5 setIdentifier:v7];

    id v8 = [v4 decodeObjectForKey:@"category"];
    [(AXSDKShotDetector *)v5 setCategory:v8];

    -[AXSDKShotDetector setModelFailed:](v5, "setModelFailed:", [v4 decodeBoolForKey:@"modelFailed"]);
    id v9 = [v4 decodeObjectForKey:@"trainings"];
    -[AXSDKShotDetector setTrainings:](v5, "setTrainings:", [v9 unsignedIntegerValue]);

    v10 = [v4 decodeObjectForKey:@"lastAttemptedTrainingDate"];
    [(AXSDKShotDetector *)v5 setLastAttemptedTrainingDate:v10];
  }
  return v5;
}

- (NSString)name
{
  return self->_customName;
}

- (void)setName:(id)a3
{
}

- (NSString)category
{
  return self->_kshotCategory;
}

- (void)setCategory:(id)a3
{
}

- (BOOL)isCustom
{
  return 1;
}

- (unint64_t)compatibilityVersion
{
  return 3;
}

- (unint64_t)contentVersion
{
  return 1;
}

- (BOOL)isEqualToKShotDetector:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSDDetector *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)modelURL
{
  v2 = NSURL;
  v3 = [(AXSDKShotDetector *)self modelURLString];
  id v4 = [v2 fileURLWithPath:v3];

  return v4;
}

- (id)modelURLString
{
  v2 = (void *)*MEMORY[0x263F21CD8];
  v3 = [(AXSDDetector *)self identifier];
  id v4 = [v2 stringByAppendingPathComponent:v3];
  id v5 = [v4 stringByAppendingPathExtension:*MEMORY[0x263F21CE0]];

  return v5;
}

- (BOOL)isModelReady
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(AXSDKShotDetector *)self modelURLString];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)recordings
{
  v3 = [MEMORY[0x263F21DA0] sharedInstance];
  id v4 = [v3 kShotSoundRecordingsForDetector:self];

  return v4;
}

- (void)setRecordings:(id)a3
{
  id v4 = (void *)MEMORY[0x263F21DA0];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  id v7 = [v6 kShotSoundRecordings];
  id v10 = (id)[v7 mutableCopy];

  id v8 = [(AXSDDetector *)self identifier];
  [v10 setValue:v5 forKey:v8];

  id v9 = [MEMORY[0x263F21DA0] sharedInstance];
  [v9 setKShotSoundRecordings:v10];
}

- (void)addRecording:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSDKShotDetector *)self recordings];
  id v6 = (id)[v5 mutableCopy];

  [v6 addObject:v4];
  [(AXSDKShotDetector *)self setRecordings:v6];
}

- (BOOL)isTrainingComplete
{
  v2 = [(AXSDKShotDetector *)self recordings];
  BOOL v3 = (unint64_t)[v2 count] > 4;

  return v3;
}

- (id)mlModel
{
  BOOL v3 = NSURL;
  id v4 = [(AXSDKShotDetector *)self modelURLString];
  id v5 = [v3 URLWithString:v4];

  if (v5)
  {
    id v14 = 0;
    id v6 = [MEMORY[0x263F00D80] compileModelAtURL:v5 error:&v14];
    id v7 = v14;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v13 = 0;
      v11 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v6 error:&v13];
      id v9 = v13;
    }
    else
    {
      id v9 = v7;
      id v10 = AXLogUltron();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXSDKShotDetector mlModel](self);
      }

      v11 = 0;
    }
  }
  else
  {
    id v9 = AXLogUltronKShot();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXSDKShotDetector mlModel](self);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXSDKShotDetector *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AXSDKShotDetector *)self isEqualToKShotDetector:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(AXSDDetector *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)shouldRetrain
{
  if ([(AXSDKShotDetector *)self modelFailed] || [(AXSDKShotDetector *)self isModelReady]) {
    return 0;
  }
  return [(AXSDKShotDetector *)self isTrainingComplete];
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(AXSDDetector *)self identifier];
  id v6 = [v3 stringWithFormat:@"[%@] Identifier: %@", v4, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = [(AXSDKShotDetector *)self description];
  BOOL v5 = [(AXSDKShotDetector *)self name];
  id v6 = [(AXSDKShotDetector *)self category];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSDKShotDetector isModelReady](self, "isModelReady"));
  BOOL v8 = [(AXSDKShotDetector *)self modelURLString];
  id v9 = [(AXSDKShotDetector *)self recordings];
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSDKShotDetector modelFailed](self, "modelFailed"));
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSDKShotDetector trainings](self, "trainings"));
  objc_super v12 = [(AXSDKShotDetector *)self lastAttemptedTrainingDate];
  id v13 = [v3 stringWithFormat:@"%@, Name: %@, Category: %@, Is Ready: %@, Model URL: %@, Recordings: %@, Model Failed: %@, Trainings: %@, Last Attempted Training Date: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)modelFailed
{
  return self->_modelFailed;
}

- (void)setModelFailed:(BOOL)a3
{
  self->_modelFailed = a3;
}

- (unint64_t)trainings
{
  return self->_trainings;
}

- (void)setTrainings:(unint64_t)a3
{
  self->_trainings = a3;
}

- (NSDate)lastAttemptedTrainingDate
{
  return self->_lastAttemptedTrainingDate;
}

- (void)setLastAttemptedTrainingDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAttemptedTrainingDate, 0);
  objc_storeStrong((id *)&self->_kshotCategory, 0);
  objc_storeStrong((id *)&self->_customName, 0);
}

- (void)mlModel
{
  v2 = [a1 name];
  id v9 = [a1 identifier];
  OUTLINED_FUNCTION_3_1(&dword_226F20000, v3, v4, "Unable to compile MLModel for detector %@ %@. error: %@", v5, v6, v7, v8, 2u);
}

@end