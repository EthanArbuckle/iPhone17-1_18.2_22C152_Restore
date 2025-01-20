@interface HMDNaturalLightingContext
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDNaturalLightingContext)initWithCoder:(id)a3;
- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4;
- (HMDNaturalLightingCurve)curve;
- (NSTimeZone)timeZone;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDNaturalLightingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_curve, 0);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16, 1);
}

- (HMDNaturalLightingCurve)curve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v4 = [(HMDNaturalLightingContext *)self curve];
  id v5 = [v3 initWithName:@"Curve" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc((Class)HMFAttributeDescription);
  v7 = [(HMDNaturalLightingContext *)self timeZone];
  id v8 = [v6 initWithName:@"Time Zone" value:v7];
  v11[1] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(HMDNaturalLightingContext *)self curve];
  unint64_t v4 = (unint64_t)[v3 hash];

  id v5 = [(HMDNaturalLightingContext *)self timeZone];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 curve];
    v9 = [(HMDNaturalLightingContext *)self curve];
    if ([v8 isEqual:v9])
    {
      v10 = [v7 timeZone];
      v11 = [v7 timeZone];
      unsigned __int8 v12 = [v10 isEqual:v11];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNaturalLightingContext *)self curve];
  [v4 encodeObject:v5 forKey:@"HHNLC.cck"];

  id v6 = [(HMDNaturalLightingContext *)self timeZone];
  [v4 encodeObject:v6 forKey:@"HHNLC.tzk"];
}

- (HMDNaturalLightingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HHNLC.cck"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HHNLC.tzk"];
    if (v6)
    {
      v7 = [(HMDNaturalLightingContext *)self initWithCurve:v5 timeZone:v6];
      id v8 = v7;
    }
    else
    {
      v7 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        int v16 = 138543362;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode time zone", (uint8_t *)&v16, 0xCu);
      }
      id v8 = 0;
    }
  }
  else
  {
    v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode curve", (uint8_t *)&v16, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (HMDNaturalLightingContext)initWithCurve:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDNaturalLightingContext;
  id v8 = [(HMDNaturalLightingContext *)&v14 init];
  if (v8)
  {
    v9 = (HMDNaturalLightingCurve *)[v6 copy];
    curve = v8->_curve;
    v8->_curve = v9;

    v11 = (NSTimeZone *)[v7 copy];
    timeZone = v8->_timeZone;
    v8->_timeZone = v11;
  }
  return v8;
}

+ (id)logCategory
{
  if (qword_100036CB8 != -1) {
    dispatch_once(&qword_100036CB8, &stru_10002CAA8);
  }
  v2 = (void *)qword_100036CC0;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end