@interface CARConnectionSession
+ (BOOL)supportsSecureCoding;
- (CARConnectionSession)initWithCoder:(id)a3;
- (CARConnectionSession)initWithEvents:(id)a3 sessionIdentifier:(id)a4 vehicleInformation:(id)a5;
- (NSArray)events;
- (NSDictionary)vehicleInformation;
- (NSString)transportType;
- (NSUUID)sessionIdentifier;
- (id)allEventsOfTypes:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CARConnectionSession

- (CARConnectionSession)initWithEvents:(id)a3 sessionIdentifier:(id)a4 vehicleInformation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CARConnectionSession;
  v12 = [(CARConnectionSession *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_events, a3);
    objc_storeStrong((id *)&v13->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v13->_vehicleInformation, a5);
    uint64_t v14 = [v11 objectForKeyedSubscript:@"transportType"];
    transportType = v13->_transportType;
    v13->_transportType = (NSString *)v14;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARConnectionSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CARConnectionSession;
  v5 = [(CARConnectionSession *)&v23 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPSessionEventsKey"];
    events = v5->_events;
    v5->_events = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSessionIdentifierKey"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSessionTransportTypeKey"];
    transportType = v5->_transportType;
    v5->_transportType = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"kCPSessionVehicleInformationKey"];
    vehicleInformation = v5->_vehicleInformation;
    v5->_vehicleInformation = (NSDictionary *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CARConnectionSession *)self events];
  [v4 encodeObject:v5 forKey:@"kCPSessionEventsKey"];

  v6 = [(CARConnectionSession *)self sessionIdentifier];
  [v4 encodeObject:v6 forKey:@"kCPSessionIdentifierKey"];

  uint64_t v7 = [(CARConnectionSession *)self transportType];
  [v4 encodeObject:v7 forKey:@"kCPSessionTransportTypeKey"];

  id v8 = [(CARConnectionSession *)self vehicleInformation];
  [v4 encodeObject:v8 forKey:@"kCPSessionVehicleInformationKey"];
}

- (id)allEventsOfTypes:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [(CARConnectionSession *)self events];
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];

  id v8 = [v7 predicateWithFormat:@"%@ CONTAINS eventType", v5];
  uint64_t v9 = [v6 filteredArrayUsingPredicate:v8];
  id v10 = [v4 setWithArray:v9];

  return v10;
}

- (NSArray)events
{
  return self->_events;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (NSDictionary)vehicleInformation
{
  return self->_vehicleInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleInformation, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end