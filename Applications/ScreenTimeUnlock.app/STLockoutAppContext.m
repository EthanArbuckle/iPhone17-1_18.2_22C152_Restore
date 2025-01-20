@interface STLockoutAppContext
+ (BOOL)supportsSecureCoding;
+ (id)contextWithData:(id)a3;
- (NSDictionary)additionalParameters;
- (NSString)clientBundleID;
- (NSString)clientName;
- (NSString)eventType;
- (STLockoutAppContext)initWithCoder:(id)a3;
- (STLockoutAppContext)initWithEventType:(id)a3;
- (id)dataRepresentation;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalParameters:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientName:(id)a3;
@end

@implementation STLockoutAppContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STLockoutAppContext)initWithEventType:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STLockoutAppContext;
  v6 = [(STLockoutAppContext *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventType, a3);
    uint64_t v8 = +[NSString stringWithUTF8String:getprogname()];
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)v8;

    v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    clientBundleID = v7->_clientBundleID;
    v7->_clientBundleID = (NSString *)v11;
  }
  return v7;
}

- (STLockoutAppContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STLockoutAppContext;
  id v5 = [(STLockoutAppContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventType"];
    eventType = v5->_eventType;
    v5->_eventType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientName"];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientBundleID"];
    clientBundleID = v5->_clientBundleID;
    v5->_clientBundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_additionalParameters"];
    additionalParameters = v5->_additionalParameters;
    v5->_additionalParameters = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  eventType = self->_eventType;
  id v5 = a3;
  [v5 encodeObject:eventType forKey:@"_eventType"];
  [v5 encodeObject:self->_clientName forKey:@"_clientName"];
  [v5 encodeObject:self->_clientBundleID forKey:@"_clientBundleID"];
  [v5 encodeObject:self->_additionalParameters forKey:@"_additionalParameters"];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(STLockoutAppContext *)self eventType];
  uint64_t v6 = [(STLockoutAppContext *)self clientName];
  v7 = +[NSString stringWithFormat:@"<%@: %p { eventType: %@, clientName: %@ }>", v4, self, v5, v6];

  return v7;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(STLockoutAppContext *)self eventType];
  uint64_t v6 = [(STLockoutAppContext *)self clientName];
  v7 = [(STLockoutAppContext *)self clientBundleID];
  uint64_t v8 = [(STLockoutAppContext *)self additionalParameters];
  v9 = +[NSString stringWithFormat:@"<%@: %p { eventType: %@, clientName: %@, clientBundleID: %@, additionalParameters: %@ }>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);

  objc_storeStrong((id *)&self->_eventType, 0);
}

+ (id)contextWithData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"STLockoutAppContext.m", 82, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = [v6 decodeObjectOfClass:v7 forKey:v9];

  return v10;
}

- (id)dataRepresentation
{
  id v3 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 encodeObject:self forKey:v5];

  id v6 = [v3 encodedData];

  return v6;
}

@end