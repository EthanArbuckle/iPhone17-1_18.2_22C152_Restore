@interface IRServiceDO
+ (BOOL)supportsSecureCoding;
+ (IRServiceDO)serviceDOWithLastSeenDate:(id)a3 clientIdentifier:(id)a4 serviceIdentifier:(id)a5 servicePackage:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServiceDO:(id)a3;
- (IRServiceDO)initWithCoder:(id)a3;
- (IRServiceDO)initWithLastSeenDate:(id)a3 clientIdentifier:(id)a4 serviceIdentifier:(id)a5 servicePackage:(int64_t)a6;
- (NSDate)lastSeenDate;
- (NSString)clientIdentifier;
- (NSString)serviceIdentifier;
- (id)copyWithReplacementClientIdentifier:(id)a3;
- (id)copyWithReplacementLastSeenDate:(id)a3;
- (id)copyWithReplacementServiceIdentifier:(id)a3;
- (id)copyWithReplacementServicePackage:(int64_t)a3;
- (id)description;
- (int64_t)servicePackage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRServiceDO

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_lastSeenDate, 0);
}

+ (IRServiceDO)serviceDOWithLastSeenDate:(id)a3 clientIdentifier:(id)a4 serviceIdentifier:(id)a5 servicePackage:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithLastSeenDate:v12 clientIdentifier:v11 serviceIdentifier:v10 servicePackage:a6];

  return (IRServiceDO *)v13;
}

- (id)copyWithReplacementLastSeenDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:v4 clientIdentifier:self->_clientIdentifier serviceIdentifier:self->_serviceIdentifier servicePackage:self->_servicePackage];

  return v5;
}

- (IRServiceDO)initWithLastSeenDate:(id)a3 clientIdentifier:(id)a4 serviceIdentifier:(id)a5 servicePackage:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IRServiceDO;
  v14 = [(IRServiceDO *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_lastSeenDate, a3);
    objc_storeStrong((id *)&v15->_clientIdentifier, a4);
    objc_storeStrong((id *)&v15->_serviceIdentifier, a5);
    v15->_servicePackage = a6;
  }

  return v15;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)copyWithReplacementClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:self->_lastSeenDate clientIdentifier:v4 serviceIdentifier:self->_serviceIdentifier servicePackage:self->_servicePackage];

  return v5;
}

- (id)copyWithReplacementServiceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLastSeenDate:self->_lastSeenDate clientIdentifier:self->_clientIdentifier serviceIdentifier:v4 servicePackage:self->_servicePackage];

  return v5;
}

- (id)copyWithReplacementServicePackage:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  lastSeenDate = self->_lastSeenDate;
  clientIdentifier = self->_clientIdentifier;
  serviceIdentifier = self->_serviceIdentifier;

  return (id)[v5 initWithLastSeenDate:lastSeenDate clientIdentifier:clientIdentifier serviceIdentifier:serviceIdentifier servicePackage:a3];
}

- (BOOL)isEqualToServiceDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v6 = self->_lastSeenDate != 0;
  v7 = [v4 lastSeenDate];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_12;
  }
  lastSeenDate = self->_lastSeenDate;
  if (lastSeenDate)
  {
    id v10 = [v5 lastSeenDate];
    int v11 = [(NSDate *)lastSeenDate isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  int v12 = self->_clientIdentifier != 0;
  id v13 = [v5 clientIdentifier];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_12;
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    v16 = [v5 clientIdentifier];
    int v17 = [(NSString *)clientIdentifier isEqual:v16];

    if (!v17) {
      goto LABEL_12;
    }
  }
  int v18 = self->_serviceIdentifier != 0;
  v19 = [v5 serviceIdentifier];
  int v20 = v19 == 0;

  if (v18 == v20
    || (serviceIdentifier = self->_serviceIdentifier) != 0
    && ([v5 serviceIdentifier],
        v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [(NSString *)serviceIdentifier isEqual:v22],
        v22,
        !v23))
  {
LABEL_12:
    BOOL v25 = 0;
  }
  else
  {
    int64_t servicePackage = self->_servicePackage;
    BOOL v25 = servicePackage == [v5 servicePackage];
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRServiceDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRServiceDO *)self isEqualToServiceDO:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_lastSeenDate hash];
  NSUInteger v4 = [(NSString *)self->_clientIdentifier hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_serviceIdentifier hash];
  return self->_servicePackage - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRServiceDO)initWithCoder:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSeenDate"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      id v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRServiceDO key \"lastSeenDate\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v32 = *MEMORY[0x263F08320];
      v33[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRServiceDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_15:

LABEL_16:
LABEL_17:
      int v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_6:
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v15);
        v16 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRServiceDO key \"clientIdentifier\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v30 = *MEMORY[0x263F08320];
        v31 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        int v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRServiceDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      int v18 = [v4 error];

      if (v18)
      {
        int v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v19);
        int v20 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v20);
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRServiceDO key \"serviceIdentifier\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v28 = *MEMORY[0x263F08320];
        v29 = v12;
        int v17 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRServiceDOOCNTErrorDomain" code:3 userInfo:v17];
        [v4 failWithError:v21];

        goto LABEL_14;
      }
    }
    else
    {
      int v23 = [v4 error];

      if (v23) {
        goto LABEL_17;
      }
    }
    uint64_t v24 = [v4 decodeInt64ForKey:@"servicePackage"];
    if (v24) {
      goto LABEL_23;
    }
    BOOL v25 = [v4 error];

    if (v25) {
      goto LABEL_17;
    }
    if ([v4 containsValueForKey:@"servicePackage"])
    {
LABEL_23:
      self = [(IRServiceDO *)self initWithLastSeenDate:v5 clientIdentifier:v7 serviceIdentifier:v9 servicePackage:v24];
      int v14 = self;
      goto LABEL_18;
    }
    uint64_t v26 = *MEMORY[0x263F08320];
    v27 = @"Missing serialized value for IRServiceDO.servicePackage";
    id v10 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    int v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRServiceDOOCNTErrorDomain" code:1 userInfo:v10];
    [v4 failWithError:v11];
    goto LABEL_16;
  }
  id v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = 0;
LABEL_20:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  lastSeenDate = self->_lastSeenDate;
  id v8 = v4;
  if (lastSeenDate)
  {
    [v4 encodeObject:lastSeenDate forKey:@"lastSeenDate"];
    id v4 = v8;
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    [v8 encodeObject:clientIdentifier forKey:@"clientIdentifier"];
    id v4 = v8;
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
  {
    [v8 encodeObject:serviceIdentifier forKey:@"serviceIdentifier"];
    id v4 = v8;
  }
  [v4 encodeInt64:self->_servicePackage forKey:@"servicePackage"];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v8 = *(_OWORD *)&self->_lastSeenDate;
  serviceIdentifier = self->_serviceIdentifier;
  NSUInteger v5 = [NSNumber numberWithInteger:self->_servicePackage];
  BOOL v6 = (void *)[v3 initWithFormat:@"<IRServiceDO | lastSeenDate:%@ clientIdentifier:%@ serviceIdentifier:%@ servicePackage:%@>", v8, serviceIdentifier, v5];

  return v6;
}

@end