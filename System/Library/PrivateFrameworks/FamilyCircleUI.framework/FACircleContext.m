@interface FACircleContext
+ (BOOL)supportsSecureCoding;
+ (FACircleContext)contextWithData:(id)a3;
- (AKAppleIDAuthenticationContext)authContext;
- (BOOL)isPlatformSupported;
- (FACircleContext)init;
- (FACircleContext)initWithCoder:(id)a3;
- (FACircleContext)initWithEventType:(id)a3;
- (NSData)dataRepresentation;
- (NSDictionary)additionalParameters;
- (NSDictionary)ephemeralAuthResults;
- (NSDictionary)userInfo;
- (NSString)clientBundleID;
- (NSString)clientName;
- (NSString)eventType;
- (NSString)urlEndpoint;
- (NSURL)urlForContext;
- (id)debugDescription;
- (id)description;
- (unint64_t)activityIndicatorStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityIndicatorStyle:(unint64_t)a3;
- (void)setAdditionalParameters:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientName:(id)a3;
- (void)setEphemeralAuthResults:(id)a3;
- (void)setUrlEndpoint:(id)a3;
- (void)setUrlForContext:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation FACircleContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FACircleContext)init
{
  return 0;
}

- (BOOL)isPlatformSupported
{
  return 1;
}

- (FACircleContext)initWithEventType:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FACircleContext;
  v6 = [(FACircleContext *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventType, a3);
    uint64_t v8 = [NSString stringWithUTF8String:getprogname()];
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)v8;

    v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    clientBundleID = v7->_clientBundleID;
    v7->_clientBundleID = (NSString *)v11;

    v7->_activityIndicatorStyle = 1;
  }

  return v7;
}

- (FACircleContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FACircleContext;
  id v5 = [(FACircleContext *)&v26 init];
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

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_additionalParameters"];
    additionalParameters = v5->_additionalParameters;
    v5->_additionalParameters = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlEndpoint"];
    urlEndpoint = v5->_urlEndpoint;
    v5->_urlEndpoint = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlForContext"];
    urlForContext = v5->_urlForContext;
    v5->_urlForContext = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authContext"];
    authContext = v5->_authContext;
    v5->_authContext = (AKAppleIDAuthenticationContext *)v22;

    v24 = NSStringFromSelector(sel_activityIndicatorStyle);
    v5->_activityIndicatorStyle = [v4 decodeIntegerForKey:v24];
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
  [v5 encodeObject:self->_urlEndpoint forKey:@"_urlEndpoint"];
  [v5 encodeObject:self->_authContext forKey:@"_authContext"];
  [v5 encodeObject:self->_urlForContext forKey:@"_urlForContext"];
  unint64_t activityIndicatorStyle = self->_activityIndicatorStyle;
  NSStringFromSelector(sel_activityIndicatorStyle);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:activityIndicatorStyle forKey:v7];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(FACircleContext *)self eventType];
  id v7 = [(FACircleContext *)self clientName];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p { eventType: %@, clientName: %@ }>", v5, self, v6, v7];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(FACircleContext *)self eventType];
  id v7 = [(FACircleContext *)self clientName];
  uint64_t v8 = [(FACircleContext *)self clientBundleID];
  v9 = [(FACircleContext *)self additionalParameters];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p { eventType: %@, clientName: %@, clientBundleID: %@, additionalParameters: %@ }>", v5, self, v6, v7, v8, v9];

  return v10;
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

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
}

- (unint64_t)activityIndicatorStyle
{
  return self->_activityIndicatorStyle;
}

- (void)setActivityIndicatorStyle:(unint64_t)a3
{
  self->_unint64_t activityIndicatorStyle = a3;
}

- (NSURL)urlForContext
{
  return self->_urlForContext;
}

- (void)setUrlForContext:(id)a3
{
}

- (NSString)urlEndpoint
{
  return self->_urlEndpoint;
}

- (void)setUrlEndpoint:(id)a3
{
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_urlEndpoint, 0);
  objc_storeStrong((id *)&self->_urlForContext, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

+ (FACircleContext)contextWithData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08928];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  uint64_t v6 = objc_opt_class();
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v9 = [v5 decodeObjectOfClass:v6 forKey:v8];

  return (FACircleContext *)v9;
}

- (NSData)dataRepresentation
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 encodeObject:self forKey:v5];

  uint64_t v6 = [v3 encodedData];

  return (NSData *)v6;
}

@end