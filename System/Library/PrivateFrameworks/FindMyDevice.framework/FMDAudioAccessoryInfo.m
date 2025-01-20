@interface FMDAudioAccessoryInfo
+ (BOOL)supportsSecureCoding;
- (FMDAudioAccessoryInfo)initWithCoder:(id)a3;
- (FMDAudioAccessoryInfo)initWithSystemSerialNumber:(id)a3 leftSerialNumber:(id)a4 rightSerialNumber:(id)a5;
- (NSString)leftSerialNumber;
- (NSString)rightSerialNumber;
- (NSString)systemSerialNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setLeftSerialNumber:(id)a3;
- (void)setRightSerialNumber:(id)a3;
- (void)setSystemSerialNumber:(id)a3;
@end

@implementation FMDAudioAccessoryInfo

- (FMDAudioAccessoryInfo)initWithSystemSerialNumber:(id)a3 leftSerialNumber:(id)a4 rightSerialNumber:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDAudioAccessoryInfo;
  v11 = [(FMDAudioAccessoryInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(FMDAudioAccessoryInfo *)v11 setSystemSerialNumber:v8];
    [(FMDAudioAccessoryInfo *)v12 setLeftSerialNumber:v9];
    [(FMDAudioAccessoryInfo *)v12 setRightSerialNumber:v10];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDAudioAccessoryInfo *)self systemSerialNumber];
  [v4 encodeObject:v5 forKey:@"systemSerialNumber"];

  v6 = [(FMDAudioAccessoryInfo *)self leftSerialNumber];
  [v4 encodeObject:v6 forKey:@"leftSerialNumber"];

  id v7 = [(FMDAudioAccessoryInfo *)self rightSerialNumber];
  [v4 encodeObject:v7 forKey:@"rightSerialNumber"];
}

- (FMDAudioAccessoryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAudioAccessoryInfo;
  v5 = [(FMDAudioAccessoryInfo *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemSerialNumber"];
    [(FMDAudioAccessoryInfo *)v5 setSystemSerialNumber:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leftSerialNumber"];
    [(FMDAudioAccessoryInfo *)v5 setLeftSerialNumber:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rightSerialNumber"];
    [(FMDAudioAccessoryInfo *)v5 setRightSerialNumber:v8];
  }
  return v5;
}

- (NSString)systemSerialNumber
{
  return self->_systemSerialNumber;
}

- (void)setSystemSerialNumber:(id)a3
{
}

- (NSString)leftSerialNumber
{
  return self->_leftSerialNumber;
}

- (void)setLeftSerialNumber:(id)a3
{
}

- (NSString)rightSerialNumber
{
  return self->_rightSerialNumber;
}

- (void)setRightSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSerialNumber, 0);
  objc_storeStrong((id *)&self->_leftSerialNumber, 0);

  objc_storeStrong((id *)&self->_systemSerialNumber, 0);
}

@end