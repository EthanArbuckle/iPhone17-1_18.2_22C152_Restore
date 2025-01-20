@interface CVAUserEvent
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVAUserEvent)initWithCoder:(id)a3;
- (CVAUserEvent)initWithEventType:(unint64_t)a3 timestamp:(double)a4;
- (NSArray)transformCameraToAnchor;
- (NSData)anchorData;
- (NSNumber)movLowestTimestamp;
- (NSNumber)sessionID;
- (NSString)peerDisplayName;
- (NSUUID)uuid;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (unint64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorData:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setMovLowestTimestamp:(id)a3;
- (void)setPeerDisplayName:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTransformCameraToAnchor:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CVAUserEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B68 == -1)
  {
    v2 = (void *)qword_267C58B60;
  }
  else
  {
    dispatch_once(&qword_267C58B68, &unk_26CB5E2B8);
    v2 = (void *)qword_267C58B60;
  }
  return v2;
}

- (CVAUserEvent)initWithEventType:(unint64_t)a3 timestamp:(double)a4
{
  v18.receiver = self;
  v18.super_class = (Class)CVAUserEvent;
  v6 = [(CVAUserEvent *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_eventType = a3;
    v6->_timestamp = a4;
    peerDisplayName = v6->_peerDisplayName;
    v6->_peerDisplayName = (NSString *)&stru_26CB5E6E0;

    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v9;

    uint64_t v11 = objc_opt_new();
    anchorData = v7->_anchorData;
    v7->_anchorData = (NSData *)v11;

    uint64_t v13 = objc_opt_new();
    transformCameraToAnchor = v7->_transformCameraToAnchor;
    v7->_transformCameraToAnchor = (NSArray *)v13;

    sessionID = v7->_sessionID;
    v7->_sessionID = (NSNumber *)&unk_26CB67A68;

    movLowestTimestamp = v7->_movLowestTimestamp;
    v7->_movLowestTimestamp = (NSNumber *)&unk_26CB67A68;
  }
  return v7;
}

- (CVAUserEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CVAUserEvent;
  v5 = [(CVAUserEvent *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_eventType = [v4 decodeIntegerForKey:@"ev"];
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v7;
    uint64_t v8 = [v4 decodeObjectForKey:@"pd"];
    peerDisplayName = v5->_peerDisplayName;
    v5->_peerDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"andt"];
    anchorData = v5->_anchorData;
    v5->_anchorData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"tcta"];
    transformCameraToAnchor = v5->_transformCameraToAnchor;
    v5->_transformCameraToAnchor = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"sid"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"mlt"];
    movLowestTimestamp = v5->_movLowestTimestamp;
    v5->_movLowestTimestamp = (NSNumber *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeInteger:self->_eventType forKey:@"ev"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeObject:self->_peerDisplayName forKey:@"pd"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeObject:self->_anchorData forKey:@"andt"];
  [v5 encodeObject:self->_transformCameraToAnchor forKey:@"tcta"];
  [v5 encodeObject:self->_sessionID forKey:@"sid"];
  [v5 encodeObject:self->_movLowestTimestamp forKey:@"mlt"];
}

- (id)dictionary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10[0] = @"ev";
  v3 = [NSNumber numberWithUnsignedInteger:self->_eventType];
  v11[0] = v3;
  v10[1] = @"t";
  id v4 = [NSNumber numberWithDouble:self->_timestamp];
  peerDisplayName = self->_peerDisplayName;
  sessionID = self->_sessionID;
  v11[1] = v4;
  v11[2] = peerDisplayName;
  v10[2] = @"pd";
  v10[3] = @"uuid";
  v11[3] = self->_uuid;
  v10[4] = @"andt";
  v10[5] = @"tcta";
  v10[6] = @"sid";
  v10[7] = @"mlt";
  long long v12 = *(_OWORD *)&self->_anchorData;
  movLowestTimestamp = self->_movLowestTimestamp;
  uint64_t v13 = sessionID;
  uint64_t v14 = movLowestTimestamp;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVAUserEvent *)self dictionary];
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSData)anchorData
{
  return self->_anchorData;
}

- (void)setAnchorData:(id)a3
{
}

- (NSArray)transformCameraToAnchor
{
  return self->_transformCameraToAnchor;
}

- (void)setTransformCameraToAnchor:(id)a3
{
}

- (NSString)peerDisplayName
{
  return self->_peerDisplayName;
}

- (void)setPeerDisplayName:(id)a3
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSNumber)movLowestTimestamp
{
  return self->_movLowestTimestamp;
}

- (void)setMovLowestTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movLowestTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_peerDisplayName, 0);
  objc_storeStrong((id *)&self->_transformCameraToAnchor, 0);
  objc_storeStrong((id *)&self->_anchorData, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end