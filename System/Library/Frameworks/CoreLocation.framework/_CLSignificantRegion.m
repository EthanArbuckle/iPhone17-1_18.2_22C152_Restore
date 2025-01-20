@interface _CLSignificantRegion
+ (BOOL)supportsSecureCoding;
- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5;
- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 onBehalfOfBundleId:(id)a6 referenceFrame:(int)a7;
- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 lowPower:(BOOL)a6 identifier:(id)a7 onBehalfOfBundleId:(id)a8 notifyOnEntry:(BOOL)a9 notifyOnExit:(BOOL)a10 conservativeEntry:(BOOL)a11 emergency:(BOOL)a12 deviceId:(id)a13 handoffTag:(id)a14;
- (_CLSignificantRegion)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLSignificantRegion

- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5
{
  return (_CLSignificantRegion *)MEMORY[0x1F4181798](self, sel_initWithCenter_radius_identifier_onBehalfOfBundleId_referenceFrame_);
}

- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 onBehalfOfBundleId:(id)a6 referenceFrame:(int)a7
{
  LOWORD(v8) = 0;
  return [(_CLSignificantRegion *)self initWithCenter:*(void *)&a7 radius:0 referenceFrame:a5 lowPower:a6 identifier:1 onBehalfOfBundleId:1 notifyOnEntry:a3.latitude notifyOnExit:a3.longitude conservativeEntry:a4 emergency:v8 deviceId:0 handoffTag:0];
}

- (_CLSignificantRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 lowPower:(BOOL)a6 identifier:(id)a7 onBehalfOfBundleId:(id)a8 notifyOnEntry:(BOOL)a9 notifyOnExit:(BOOL)a10 conservativeEntry:(BOOL)a11 emergency:(BOOL)a12 deviceId:(id)a13 handoffTag:(id)a14
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006020);
    }
    v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_FAULT, "LowPower not supported for this object/platform", buf, 2u);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006020);
    }
    __int16 v22 = 0;
LABEL_23:
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[_CLSignificantRegion initWithCenter:radius:referenceFrame:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
    return 0;
  }
  if (a11)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006020);
    }
    v15 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_FAULT, "Conservative not supported for this object/platform", buf, 2u);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006020);
    }
    __int16 v22 = 0;
    goto LABEL_23;
  }
  v21.receiver = self;
  v21.super_class = (Class)_CLSignificantRegion;
  BYTE2(v20) = a12;
  LOWORD(v20) = a10;
  v18 = -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:](&v21, sel_initWithCenter_radius_referenceFrame_allowMonitoringWhenNearby_lowPower_identifier_onBehalfOfBundleId_notifyOnEntry_notifyOnExit_conservativeEntry_emergency_deviceId_handoffTag_, *(void *)&a5, 0, 0, a7, a8, a9, a3.latitude, a3.longitude, a4, v20, a13, a14);
  v16 = v18;
  if (v18) {
    [(CLRegion *)v18 setType:3];
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLSignificantRegion)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLSignificantRegion.m", 117, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v9.receiver = self;
  v9.super_class = (Class)_CLSignificantRegion;
  v6 = [(CLCircularRegion *)&v9 initWithCoder:a3];
  v7 = v6;
  if (v6) {
    [(CLRegion *)v6 setType:3];
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLSignificantRegion.m", 127, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  v6.receiver = self;
  v6.super_class = (Class)_CLSignificantRegion;
  [(CLCircularRegion *)&v6 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRegion type](self, "type"), @"kCLSignificantRegionCodingKeyType");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CLSignificantRegion;
  id v4 = [(CLCircularRegion *)&v6 copyWithZone:a3];
  if (v4) {
    objc_msgSend(v4, "setType:", -[CLRegion type](self, "type"));
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CLRegion *)self identifier];
  [(CLCircularRegion *)self geoCenter];
  uint64_t v6 = v5;
  [(CLCircularRegion *)self geoCenter];
  uint64_t v8 = v7;
  [(CLCircularRegion *)self geoRadius];
  return (id)[v3 stringWithFormat:@"CLSignificantRegion (identifier:'%@', center:<%+.8f,%+.8f>, radius:%.2fm, frame:%d)", v4, v6, v8, v9, -[CLCircularRegion geoReferenceFrame](self, "geoReferenceFrame")];
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_CLSignificantRegion;
  unint64_t v3 = [(CLCircularRegion *)&v5 hash];
  return v3 ^ [(CLRegion *)self type];
}

@end