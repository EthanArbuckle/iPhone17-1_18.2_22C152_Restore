@interface RTPointOfInterestAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)applePaySupport;
- (NSString)category;
- (RTPointOfInterestAttributes)init;
- (RTPointOfInterestAttributes)initWithApplePaySupport:(BOOL)a3 category:(id)a4 muid:(unint64_t)a5 nearbyPoiCount:(unint64_t)a6;
- (RTPointOfInterestAttributes)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)muid;
- (unint64_t)nearbyPoiCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPointOfInterestAttributes

- (RTPointOfInterestAttributes)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithApplePaySupport_category_muid_nearbyPoiCount_);
}

- (RTPointOfInterestAttributes)initWithApplePaySupport:(BOOL)a3 category:(id)a4 muid:(unint64_t)a5 nearbyPoiCount:(unint64_t)a6
{
  id v11 = a4;
  if (a5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTPointOfInterestAttributes;
    v12 = [(RTPointOfInterestAttributes *)&v17 init];
    v13 = v12;
    if (v12)
    {
      v12->_applePaySupport = a3;
      objc_storeStrong((id *)&v12->_category, a4);
      v13->_muid = a5;
      v13->_nearbyPoiCount = a6;
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: muid > 0", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)description
{
  uint64_t v2 = @"YES";
  if (!self->_applePaySupport) {
    uint64_t v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"muid, %lu, applePaySupport, %@, category, %@, nearbyPOICount, %lu", self->_muid, v2, self->_category, self->_nearbyPoiCount];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL applePaySupport = self->_applePaySupport;
  id v5 = a3;
  [v5 encodeBool:applePaySupport forKey:@"applePaySupport"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeInteger:self->_muid forKey:@"muid"];
  [v5 encodeInteger:self->_nearbyPoiCount forKey:@"nearbyPoiCount"];
}

- (RTPointOfInterestAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"applePaySupport"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"muid"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"nearbyPoiCount"];

  v9 = [(RTPointOfInterestAttributes *)self initWithApplePaySupport:v5 category:v6 muid:v7 nearbyPoiCount:v8];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL applePaySupport = self->_applePaySupport;
  unint64_t muid = self->_muid;
  category = self->_category;
  unint64_t nearbyPoiCount = self->_nearbyPoiCount;
  return (id)[v4 initWithApplePaySupport:applePaySupport category:category muid:muid nearbyPoiCount:nearbyPoiCount];
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)category
{
  return self->_category;
}

- (unint64_t)nearbyPoiCount
{
  return self->_nearbyPoiCount;
}

- (BOOL)applePaySupport
{
  return self->_applePaySupport;
}

- (void).cxx_destruct
{
}

@end