@interface CVACalibration
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVACalibration)initWithCoder:(id)a3;
- (CVAIMUCalibration)imuCalibration;
- (NSArray)cameraCalibrations;
- (id)debugDescription;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraCalibrations:(id)a3;
- (void)setImuCalibration:(id)a3;
@end

@implementation CVACalibration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B98 == -1)
  {
    v2 = (void *)qword_267C58B90;
  }
  else
  {
    dispatch_once(&qword_267C58B98, &unk_26CB5E318);
    v2 = (void *)qword_267C58B90;
  }
  return v2;
}

- (CVACalibration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CVACalibration;
  v5 = [(CVACalibration *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"ccl"];
    cameraCalibrations = v5->_cameraCalibrations;
    v5->_cameraCalibrations = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"imui"];
    imuCalibration = v5->_imuCalibration;
    v5->_imuCalibration = (CVAIMUCalibration *)v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_cameraCalibrations forKey:@"ccl"];
  [v5 encodeObject:self->_imuCalibration forKey:@"imui"];
}

- (id)dictionary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_cameraCalibrations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionary", (void)v13);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  v17[0] = @"ccl";
  v17[1] = @"imui";
  v18[0] = v3;
  v10 = [(CVAIMUCalibration *)self->_imuCalibration dictionary];
  v18[1] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CVACalibration *)self dictionary];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (NSArray)cameraCalibrations
{
  return self->_cameraCalibrations;
}

- (void)setCameraCalibrations:(id)a3
{
}

- (CVAIMUCalibration)imuCalibration
{
  return self->_imuCalibration;
}

- (void)setImuCalibration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imuCalibration, 0);
  objc_storeStrong((id *)&self->_cameraCalibrations, 0);
}

@end