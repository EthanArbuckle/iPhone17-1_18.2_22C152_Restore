@interface IRConfiguration
+ (BOOL)supportsSecureCoding;
+ (IRConfiguration)new;
- (BOOL)isEqual:(id)a3;
- (IRConfiguration)init;
- (IRConfiguration)initWithCoder:(id)a3;
- (IRConfiguration)initWithServiceToken:(id)a3;
- (IRServiceToken)serviceToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation IRConfiguration

- (void).cxx_destruct
{
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)encodeWithCoder:(id)a3
{
  serviceToken = self->_serviceToken;
  id v5 = a3;
  [v5 encodeObject:serviceToken forKey:@"serviceToken"];
  id v6 = [NSNumber numberWithInteger:self->_mode];
  [v5 encodeObject:v6 forKey:@"mode"];
}

- (IRConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IRConfiguration;
  id v5 = [(IRConfiguration *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceToken"];
    if (v6)
    {
      uint64_t v7 = self;

      serviceToken = v5->_serviceToken;
      v5->_serviceToken = (IRServiceToken *)v7;

      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
      id v6 = v9;
      if (v9)
      {
        int64_t v10 = (int)[(IRConfiguration *)v9 intValue];

        v5->_mode = v10;
        id v6 = v5;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (IRServiceToken)serviceToken
{
  return self->_serviceToken;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithServiceToken:self->_serviceToken];
  id v6 = [(IRServiceToken *)self->_serviceToken copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = [(IRConfiguration *)self mode];
  return v5;
}

- (int64_t)mode
{
  return self->_mode;
}

- (IRConfiguration)initWithServiceToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRConfiguration;
  id v6 = [(IRConfiguration *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceToken, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", serviceToken: %@", self->_serviceToken];
  [v6 appendFormat:@", mode: %ld", self->_mode];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(IRConfiguration *)self serviceToken];
    uint64_t v7 = [v5 serviceToken];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      objc_super v9 = [(IRConfiguration *)self serviceToken];
      int64_t v10 = [v5 serviceToken];

      if (v9 != v10)
      {
        BOOL v8 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int64_t v11 = [(IRConfiguration *)self mode];
    BOOL v8 = v11 == [v5 mode];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  return [(IRServiceToken *)self->_serviceToken hash] ^ self->_mode ^ 0x1F;
}

- (IRConfiguration)init
{
}

+ (IRConfiguration)new
{
}

@end