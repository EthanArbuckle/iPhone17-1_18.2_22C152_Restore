@interface AEAssessmentUIConfiguration
+ (BOOL)supportsSecureCoding;
- (AEAssessmentUIConfiguration)init;
- (AEAssessmentUIConfiguration)initWithCoder:(id)a3;
- (AEAssessmentUIConfiguration)initWithPresentDisplayShields:(BOOL)a3 captureDisplays:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCaptureDisplays;
- (BOOL)shouldPresentDisplayShields;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)isEqualToConfiguration:(void *)a1;
@end

@implementation AEAssessmentUIConfiguration

- (AEAssessmentUIConfiguration)init
{
  return [(AEAssessmentUIConfiguration *)self initWithPresentDisplayShields:1 captureDisplays:1];
}

- (AEAssessmentUIConfiguration)initWithPresentDisplayShields:(BOOL)a3 captureDisplays:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AEAssessmentUIConfiguration;
  result = [(AEAssessmentUIConfiguration *)&v7 init];
  if (result)
  {
    result->_presentDisplayShields = a3;
    result->_captureDisplays = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[AEAssessmentUIConfiguration shouldPresentDisplayShields](self, "shouldPresentDisplayShields"));
  [v5 encodeObject:v6 forKey:@"presentDisplayShields"];

  objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentUIConfiguration shouldCaptureDisplays](self, "shouldCaptureDisplays"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"captureDisplays"];
}

- (AEAssessmentUIConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEAssessmentUIConfiguration;
  id v5 = [(AEAssessmentUIConfiguration *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentDisplayShields"];
    v5->_presentDisplayShields = [v6 BOOLValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captureDisplays"];
    v5->_captureDisplays = [v7 BOOLValue];
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentUIConfiguration shouldPresentDisplayShields](self, "shouldPresentDisplayShields"));
  uint64_t v4 = [v3 hash];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentUIConfiguration shouldCaptureDisplays](self, "shouldCaptureDisplays"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AEAssessmentUIConfiguration *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAssessmentUIConfiguration *)v4 isMemberOfClass:objc_opt_class()]) {
    unsigned __int8 v6 = -[AEAssessmentUIConfiguration isEqualToConfiguration:](self, v5);
  }
  else {
LABEL_5:
  }
    unsigned __int8 v6 = 0;
LABEL_7:

  return v6;
}

- (void)isEqualToConfiguration:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 shouldPresentDisplayShields];
    if (v4 == [v3 shouldPresentDisplayShields])
    {
      int v5 = [a1 shouldCaptureDisplays];
      a1 = (void *)(v5 ^ [v3 shouldCaptureDisplays] ^ 1);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(AEAssessmentUIConfiguration *)self shouldPresentDisplayShields]) {
    int v5 = @"Yes";
  }
  else {
    int v5 = @"No";
  }
  if ([(AEAssessmentUIConfiguration *)self shouldCaptureDisplays]) {
    unsigned __int8 v6 = @"Yes";
  }
  else {
    unsigned __int8 v6 = @"No";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p { shouldPresentDisplayShields = %@, shouldCaptureDisplays = %@ }>", v4, self, v5, v6];
}

- (BOOL)shouldPresentDisplayShields
{
  return self->_presentDisplayShields;
}

- (BOOL)shouldCaptureDisplays
{
  return self->_captureDisplays;
}

@end