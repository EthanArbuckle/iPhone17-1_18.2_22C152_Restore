@interface CADChangeTrackingClientId
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCustomClientId;
- (BOOL)hasSuffix;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChangeTrackingClientId:(id)a3;
- (CADChangeTrackingClientId)clientIdWithBundleId:(id)a3;
- (CADChangeTrackingClientId)initWithCoder:(id)a3;
- (CADChangeTrackingClientId)initWithCustomClientId:(id)a3;
- (CADChangeTrackingClientId)initWithSuffix:(id)a3;
- (NSString)customClientId;
- (NSString)suffix;
- (id)clientId;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADChangeTrackingClientId

- (CADChangeTrackingClientId)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADChangeTrackingClientId;
  v5 = [(CADChangeTrackingClientId *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientId"];
    customClientId = v5->_customClientId;
    v5->_customClientId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Suffix"];
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CADChangeTrackingClientId *)self customClientId];
  [v4 encodeObject:v5 forKey:@"ClientId"];

  id v6 = [(CADChangeTrackingClientId *)self suffix];
  [v4 encodeObject:v6 forKey:@"Suffix"];
}

- (CADChangeTrackingClientId)clientIdWithBundleId:(id)a3
{
  id v4 = a3;
  if ([(CADChangeTrackingClientId *)self hasCustomClientId])
  {
    id v5 = [(CADChangeTrackingClientId *)self customClientId];
  }
  else
  {
    if ([(CADChangeTrackingClientId *)self hasSuffix])
    {
      id v6 = [(CADChangeTrackingClientId *)self suffix];
      v7 = [v4 stringByAppendingFormat:@"~%@", v6];

      goto LABEL_7;
    }
    id v5 = v4;
  }
  v7 = v5;
LABEL_7:

  return (CADChangeTrackingClientId *)v7;
}

- (id)description
{
  if ([(CADChangeTrackingClientId *)self hasCustomClientId])
  {
    v3 = NSString;
    id v4 = [(CADChangeTrackingClientId *)self clientId];
    [v3 stringWithFormat:@"ClientId: {%@}", v4];
LABEL_5:
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if ([(CADChangeTrackingClientId *)self hasSuffix])
  {
    id v5 = NSString;
    id v4 = [(CADChangeTrackingClientId *)self suffix];
    [v5 stringWithFormat:@"Suffix: {%@}", v4];
    goto LABEL_5;
  }
  id v6 = @"No Custom ClientID or Suffix";
LABEL_7:
  return v6;
}

- (BOOL)hasSuffix
{
  v2 = [(CADChangeTrackingClientId *)self suffix];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)hasCustomClientId
{
  v2 = [(CADChangeTrackingClientId *)self customClientId];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)customClientId
{
  return self->_customClientId;
}

- (NSString)suffix
{
  return self->_suffix;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customClientId, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
}

- (CADChangeTrackingClientId)initWithCustomClientId:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADChangeTrackingClientId;
  id v6 = [(CADChangeTrackingClientId *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_customClientId, a3);
  }

  return v7;
}

- (CADChangeTrackingClientId)initWithSuffix:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADChangeTrackingClientId;
  id v6 = [(CADChangeTrackingClientId *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suffix, a3);
  }

  return v7;
}

- (id)clientId
{
  if ([(CADChangeTrackingClientId *)self hasCustomClientId])
  {
    BOOL v3 = [(CADChangeTrackingClientId *)self customClientId];
  }
  else if ([(CADChangeTrackingClientId *)self hasSuffix])
  {
    id v4 = [(CADChangeTrackingClientId *)self suffix];
    BOOL v3 = [@"~" stringByAppendingString:v4];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (BOOL)isEqualToChangeTrackingClientId:(id)a3
{
  id v4 = (CADChangeTrackingClientId *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4 {
         && ([(CADChangeTrackingClientId *)self suffix],
  }
             id v6 = objc_claimAutoreleasedReturnValue(),
             [(CADChangeTrackingClientId *)v5 suffix],
             v7 = objc_claimAutoreleasedReturnValue(),
             v7,
             v6,
             v6 == v7))
  {
    objc_super v9 = [(CADChangeTrackingClientId *)self customClientId];
    v10 = [(CADChangeTrackingClientId *)v5 customClientId];
    BOOL v8 = v9 == v10;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CADChangeTrackingClientId *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CADChangeTrackingClientId *)self isEqualToChangeTrackingClientId:v4];
  }

  return v5;
}

@end