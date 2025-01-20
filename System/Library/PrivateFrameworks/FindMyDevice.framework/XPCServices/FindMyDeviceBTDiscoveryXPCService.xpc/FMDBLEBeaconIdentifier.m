@interface FMDBLEBeaconIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)identifierBLEDevice:(id)a3 other:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (FMDBLEBeaconIdentifier)initWithBLEDevice:(id)a3 other:(BOOL)a4;
- (FMDBLEBeaconIdentifier)initWithCoder:(id)a3;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setString:(id)a3;
@end

@implementation FMDBLEBeaconIdentifier

- (FMDBLEBeaconIdentifier)initWithBLEDevice:(id)a3 other:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDBLEBeaconIdentifier;
  v7 = [(FMDBLEBeaconIdentifier *)&v10 init];
  if (v7)
  {
    v8 = +[FMDBLEBeaconIdentifier identifierBLEDevice:v6 other:v4];
    [(FMDBLEBeaconIdentifier *)v7 setString:v8];
  }
  return v7;
}

- (BOOL)isValid
{
  v3 = [(FMDBLEBeaconIdentifier *)self string];
  if (v3)
  {
    BOOL v4 = [(FMDBLEBeaconIdentifier *)self string];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(FMDBLEBeaconIdentifier *)self string];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (FMDBLEBeaconIdentifier *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(FMDBLEBeaconIdentifier *)v4 string];
      id v6 = [(FMDBLEBeaconIdentifier *)self string];
      unsigned __int8 v7 = [v5 isEqualToString:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [+[FMDBLEBeaconIdentifier allocWithZone:a3] init];
  BOOL v5 = [(FMDBLEBeaconIdentifier *)self string];
  [(FMDBLEBeaconIdentifier *)v4 setString:v5];

  return v4;
}

+ (id)identifierBLEDevice:(id)a3 other:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 bluetoothAddress];
  if (v6)
  {
    unsigned __int8 v7 = [v5 bluetoothAddress];
    v8 = objc_msgSend(v7, "fm_MACAddressString");
  }
  else
  {
    v8 = 0;
  }

  v9 = [v5 advertisementFields];
  objc_super v10 = [v9 objectForKeyedSubscript:@"hsStatus"];

  if (v10)
  {
    unsigned int v11 = [v10 unsignedIntValue];
    if ((dword_100013314 & v11) != 0) {
      v12 = @"_l";
    }
    else {
      v12 = @"_r";
    }
    v13 = v12;
    if (v4)
    {
      if ((dword_100013314 & v11) != 0) {
        v14 = @"_r";
      }
      else {
        v14 = @"_l";
      }
      v15 = v14;

      v13 = v15;
    }
    uint64_t v16 = [v8 stringByAppendingString:v13];

    v8 = (void *)v16;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDBLEBeaconIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDBLEBeaconIdentifier;
  id v5 = [(FMDBLEBeaconIdentifier *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    unsigned __int8 v7 = NSStringFromSelector("string");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDBLEBeaconIdentifier *)v5 setString:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(FMDBLEBeaconIdentifier *)self string];
  id v5 = NSStringFromSelector("string");
  [v4 encodeObject:v6 forKey:v5];
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end