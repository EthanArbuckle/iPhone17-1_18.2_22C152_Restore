@interface CLRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)conservativeEntry;
- (BOOL)containsCoordinate:(CLLocationCoordinate2D)coordinate;
- (BOOL)emergency;
- (BOOL)isEqual:(id)a3;
- (BOOL)notifyOnEntry;
- (BOOL)notifyOnExit;
- (CLLocationCoordinate2D)center;
- (CLLocationDistance)radius;
- (CLRegion)initCircularRegionWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius identifier:(NSString *)identifier;
- (CLRegion)initWithClientRegion:(id *)a3;
- (CLRegion)initWithCoder:(id)a3;
- (CLRegion)initWithIdentifier:(id)a3;
- (CLRegion)initWithIdentifier:(id)a3 andRegionType:(int)a4;
- (CLRegion)initWithIdentifier:(id)a3 onBehalfOf:(id)a4 regionType:(int)a5 notifyOnEntry:(BOOL)a6 notifyOnExit:(BOOL)a7 conservativeEntry:(BOOL)a8 emergency:(BOOL)a9;
- (CLRegion)initWithIdentifier:(id)a3 onBehalfOf:(id)a4 regionType:(int)a5 notifyOnEntry:(BOOL)a6 notifyOnExit:(BOOL)a7 conservativeEntry:(BOOL)a8 emergency:(BOOL)a9 deviceId:(id)a10 handoffTag:(id)a11;
- (NSString)handoffTag;
- (NSString)identifier;
- (NSString)onBehalfOfBundleId;
- (NSUUID)deviceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)referenceFrame;
- (int)type;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConservativeEntry:(BOOL)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setNotifyOnEntry:(BOOL)notifyOnEntry;
- (void)setNotifyOnExit:(BOOL)notifyOnExit;
- (void)setOnBehalfOfBundleId:(id)a3;
- (void)setReferenceFrame:(int)a3;
- (void)setType:(int)a3;
@end

@implementation CLRegion

- (CLRegion)initWithIdentifier:(id)a3 onBehalfOf:(id)a4 regionType:(int)a5 notifyOnEntry:(BOOL)a6 notifyOnExit:(BOOL)a7 conservativeEntry:(BOOL)a8 emergency:(BOOL)a9 deviceId:(id)a10 handoffTag:(id)a11
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005B20);
    }
    v22 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      v29 = "";
      _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"identifier is nil\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005B20);
      }
    }
    v19 = qword_1EB2713E0;
    if (!os_signpost_enabled((os_log_t)qword_1EB2713E0)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 68289026;
    int v27 = 0;
    __int16 v28 = 2082;
    v29 = "";
    v20 = "identifier is nil";
    v21 = "{\"msg%{public}.0s\":\"identifier is nil\"}";
LABEL_17:
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v20, v21, buf, 0x12u);
LABEL_20:

    return 0;
  }
  if ((unint64_t)[a3 lengthOfBytesUsingEncoding:4] >= 0x201)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005B20);
    }
    v18 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      v29 = "";
      _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"identifier is too long\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005B20);
      }
    }
    v19 = qword_1EB2713E0;
    if (!os_signpost_enabled((os_log_t)qword_1EB2713E0)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 68289026;
    int v27 = 0;
    __int16 v28 = 2082;
    v29 = "";
    v20 = "identifier is too long";
    v21 = "{\"msg%{public}.0s\":\"identifier is too long\"}";
    goto LABEL_17;
  }
  if (a10 && !a11) {
    goto LABEL_20;
  }
  v25.receiver = self;
  v25.super_class = (Class)CLRegion;
  v23 = [(CLRegion *)&v25 init];
  if (v23)
  {
    v23->_identifier = (NSString *)[a3 copy];
    v23->_notifyOnEntry = a6;
    v23->_notifyOnExit = a7;
    v23->_onBehalfOfBundleId = (NSString *)[a4 copy];
    v23->_type = a5;
    v23->_conservativeEntry = a8;
    v23->_emergency = a9;
    v23->_deviceId = (NSUUID *)[a10 copy];
    v23->_handoffTag = (NSString *)[a11 copy];
  }
  return v23;
}

- (CLRegion)initWithClientRegion:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLRegion;
  result = [(CLRegion *)&v9 init];
  if (result)
  {
    v5 = result;
    uint64_t v6 = [NSString stringWithUTF8String:a3];
    uint64_t v7 = [NSString stringWithUTF8String:a3->var1];
    LOBYTE(v8) = a3->var7;
    return [(CLRegion *)v5 initWithIdentifier:v6 onBehalfOf:v7 regionType:a3->var3 notifyOnEntry:a3->var4 notifyOnExit:a3->var5 conservativeEntry:a3->var6 emergency:v8];
  }
  return result;
}

- (CLRegion)initCircularRegionWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius identifier:(NSString *)identifier
{
  double longitude = center.longitude;
  double latitude = center.latitude;

  objc_super v9 = [CLCircularRegion alloc];

  return (CLRegion *)-[CLCircularRegion initWithCenter:radius:identifier:](v9, "initWithCenter:radius:identifier:", identifier, latitude, longitude, radius);
}

- (CLRegion)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLRegion;
  result = [(CLRegion *)&v6 init];
  if (result)
  {
    LOBYTE(v5) = 0;
    return [(CLRegion *)result initWithIdentifier:a3 onBehalfOf:0 regionType:1 notifyOnEntry:1 notifyOnExit:1 conservativeEntry:0 emergency:v5];
  }
  return result;
}

- (CLRegion)initWithIdentifier:(id)a3 andRegionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)CLRegion;
  result = [(CLRegion *)&v8 init];
  if (result)
  {
    LOBYTE(v7) = 0;
    return [(CLRegion *)result initWithIdentifier:a3 onBehalfOf:0 regionType:v4 notifyOnEntry:1 notifyOnExit:1 conservativeEntry:0 emergency:v7];
  }
  return result;
}

- (CLRegion)initWithIdentifier:(id)a3 onBehalfOf:(id)a4 regionType:(int)a5 notifyOnEntry:(BOOL)a6 notifyOnExit:(BOOL)a7 conservativeEntry:(BOOL)a8 emergency:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(CLRegion *)self initWithIdentifier:a3 onBehalfOf:a4 regionType:*(void *)&a5 notifyOnEntry:a6 notifyOnExit:a7 conservativeEntry:a8 emergency:v10 deviceId:0 handoffTag:0];
}

- (void)dealloc
{
  *(_OWORD *)&self->_identifier = 0u;
  *(_OWORD *)&self->_handoffTag = 0u;
  v3.receiver = self;
  v3.super_class = (Class)CLRegion;
  [(CLRegion *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLRegion)initWithCoder:(id)a3
{
  if ([(CLRegion *)self isMemberOfClass:objc_opt_class()])
  {

    uint64_t v5 = [CLCircularRegion alloc];
    return (CLRegion *)MEMORY[0x1F4181798](v5, sel_initLegacyObjectWithCoder_);
  }
  else
  {
    int v17 = 0;
    if ([a3 allowsKeyedCoding])
    {
      id v6 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLRegionCodingKeyIdentifier"];
      id v7 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLRegionCodingKeyOnBehalfOfBundleId"];
      uint64_t v8 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyNotifyOnEntry"];
      HIBYTE(v17) = v8;
      uint64_t v9 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyNotifyOnExit"];
      BYTE2(v17) = v9;
      uint64_t v10 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyConservativeEntry"];
      BYTE1(v17) = v10;
      char v11 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyEmergency"];
      LOBYTE(v17) = v11;
      if ([a3 containsValueForKey:@"kCLRegionCodingKeyRegionType"]) {
        uint64_t v12 = [a3 decodeIntForKey:@"kCLRegionCodingKeyRegionType"];
      }
      else {
        uint64_t v12 = 1;
      }
      id v13 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLRegionCodingKeyDeviceId"];
      id v14 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLRegionCodingKeyHandoffTag"];
    }
    else
    {
      id v6 = (id)[a3 decodeObject];
      id v7 = (id)[a3 decodeObject];
      [a3 decodeValueOfObjCType:"B" at:(char *)&v17 + 3];
      [a3 decodeValueOfObjCType:"B" at:(char *)&v17 + 2];
      [a3 decodeValueOfObjCType:"B" at:(char *)&v17 + 1];
      [a3 decodeValueOfObjCType:"B" at:&v17];
      id v13 = (id)[a3 decodeObject];
      id v14 = (id)[a3 decodeObject];
      uint64_t v8 = HIBYTE(v17) != 0;
      uint64_t v9 = BYTE2(v17) != 0;
      uint64_t v10 = BYTE1(v17) != 0;
      char v11 = v17 != 0;
      uint64_t v12 = 1;
    }
    LOBYTE(v16) = v11;
    return [(CLRegion *)self initWithIdentifier:v6 onBehalfOf:v7 regionType:v12 notifyOnEntry:v8 notifyOnExit:v9 conservativeEntry:v10 emergency:v16 deviceId:v13 handoffTag:v14];
  }
}

- (void)encodeWithCoder:(id)a3
{
  if ([(CLRegion *)self isMemberOfClass:objc_opt_class()])
  {
    id v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CLRegion.m" lineNumber:263 description:@"CLRegion is an abstract class. Use one of the derived classes"];
  }
  else
  {
    BOOL v7 = [(CLRegion *)self notifyOnEntry];
    BOOL v18 = v7;
    BOOL v8 = [(CLRegion *)self notifyOnExit];
    BOOL v17 = v8;
    BOOL v9 = [(CLRegion *)self conservativeEntry];
    BOOL v16 = v9;
    BOOL v10 = [(CLRegion *)self emergency];
    BOOL v15 = v10;
    uint64_t v11 = [(CLRegion *)self type];
    char v12 = [a3 allowsKeyedCoding];
    identifier = self->_identifier;
    if (v12)
    {
      [a3 encodeObject:identifier forKey:@"kCLRegionCodingKeyIdentifier"];
      [a3 encodeObject:self->_onBehalfOfBundleId forKey:@"kCLRegionCodingKeyOnBehalfOfBundleId"];
      [a3 encodeBool:v7 forKey:@"kCLRegionCodingKeyNotifyOnEntry"];
      [a3 encodeBool:v8 forKey:@"kCLRegionCodingKeyNotifyOnExit"];
      [a3 encodeBool:v9 forKey:@"kCLRegionCodingKeyConservativeEntry"];
      [a3 encodeBool:v10 forKey:@"kCLRegionCodingKeyEmergency"];
      [a3 encodeInt:v11 forKey:@"kCLRegionCodingKeyRegionType"];
      [a3 encodeObject:self->_deviceId forKey:@"kCLRegionCodingKeyDeviceId"];
      handoffTag = self->_handoffTag;
      [a3 encodeObject:handoffTag forKey:@"kCLRegionCodingKeyHandoffTag"];
    }
    else
    {
      [a3 encodeObject:identifier];
      [a3 encodeObject:self->_onBehalfOfBundleId];
      [a3 encodeValueOfObjCType:"B" at:&v18];
      [a3 encodeValueOfObjCType:"B" at:&v17];
      [a3 encodeValueOfObjCType:"B" at:&v16];
      [a3 encodeValueOfObjCType:"B" at:&v15];
      [a3 encodeObject:self->_deviceId];
      [a3 encodeObject:self->_handoffTag];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_emergency;
  return (id)[v4 initWithIdentifier:self->_identifier onBehalfOf:self->_onBehalfOfBundleId regionType:self->_type notifyOnEntry:self->_notifyOnEntry notifyOnExit:self->_notifyOnExit conservativeEntry:self->_conservativeEntry emergency:v6 deviceId:self->_deviceId handoffTag:self->_handoffTag];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v14 = v4;
    uint64_t v15 = v3;
    if (([a3 isMemberOfClass:objc_opt_class()] & 1) != 0
      || [(CLRegion *)self isMemberOfClass:objc_opt_class()]
      && ([a3 isMemberOfClass:objc_opt_class()] & 1) != 0
      || (int v11 = [(CLRegion *)self isMemberOfClass:objc_opt_class()]) != 0
      && (int v11 = [a3 isMemberOfClass:objc_opt_class()]) != 0)
    {
      if ([(CLRegion *)self onBehalfOfBundleId]
        || [a3 onBehalfOfBundleId])
      {
        char v12 = -[NSString isEqual:](-[CLRegion onBehalfOfBundleId](self, "onBehalfOfBundleId"), "isEqual:", [a3 onBehalfOfBundleId]);
      }
      else
      {
        char v12 = 1;
      }
      LOBYTE(v11) = -[NSString isEqualToString:](-[CLRegion identifier](self, "identifier"), "isEqualToString:", [a3 identifier]) & v12;
    }
  }
  return v11;
}

- (unint64_t)hash
{
  v2 = [(CLRegion *)self identifier];

  return [(NSString *)v2 hash];
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  [(CLRegion *)self center];
  double v7 = v6;
  [(CLRegion *)self center];
  double v9 = sub_1906D7AA4(latitude, longitude, v7, v8);
  [(CLRegion *)self radius];
  return v9 <= v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CLRegion (identifier:'%@')", self->_identifier];
}

- (CLLocationCoordinate2D)center
{
  objc_copyStruct(v4, &self->_center, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

- (CLLocationDistance)radius
{
  return self->_radius;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)notifyOnEntry
{
  return self->_notifyOnEntry;
}

- (void)setNotifyOnEntry:(BOOL)notifyOnEntry
{
  self->_notifyOnEntry = notifyOnEntry;
}

- (BOOL)notifyOnExit
{
  return self->_notifyOnExit;
}

- (void)setNotifyOnExit:(BOOL)notifyOnExit
{
  self->_notifyOnExit = notifyOnExit;
}

- (NSUUID)deviceId
{
  return self->_deviceId;
}

- (NSString)handoffTag
{
  return self->_handoffTag;
}

- (NSString)onBehalfOfBundleId
{
  return self->_onBehalfOfBundleId;
}

- (void)setOnBehalfOfBundleId:(id)a3
{
}

- (BOOL)conservativeEntry
{
  return self->_conservativeEntry;
}

- (void)setConservativeEntry:(BOOL)a3
{
  self->_conservativeEntry = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

- (BOOL)emergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

@end