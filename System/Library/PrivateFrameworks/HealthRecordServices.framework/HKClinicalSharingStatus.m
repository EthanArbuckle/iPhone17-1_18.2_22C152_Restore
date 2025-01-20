@interface HKClinicalSharingStatus
+ (BOOL)supportsSecureCoding;
+ (id)unknownStatus;
+ (int64_t)clinicalSharingFeatureStatusWithAccountState:(int64_t)a3 gatewayFeatureStatus:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (HKClinicalSharingStatus)init;
- (HKClinicalSharingStatus)initWithCoder:(id)a3;
- (HKClinicalSharingStatus)initWithFirstSharedDate:(id)a3 lastSharedDate:(id)a4 featureStatus:(int64_t)a5 userStatus:(int64_t)a6 multiDeviceStatus:(int64_t)a7 primaryDeviceName:(id)a8;
- (NSDate)firstSharedDate;
- (NSDate)lastSharedDate;
- (NSString)primaryDeviceName;
- (id)description;
- (int64_t)featureStatus;
- (int64_t)multiDeviceStatus;
- (int64_t)userStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalSharingStatus

- (HKClinicalSharingStatus)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalSharingStatus)initWithFirstSharedDate:(id)a3 lastSharedDate:(id)a4 featureStatus:(int64_t)a5 userStatus:(int64_t)a6 multiDeviceStatus:(int64_t)a7 primaryDeviceName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKClinicalSharingStatus;
  v17 = [(HKClinicalSharingStatus *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    firstSharedDate = v17->_firstSharedDate;
    v17->_firstSharedDate = (NSDate *)v18;

    uint64_t v20 = [v15 copy];
    lastSharedDate = v17->_lastSharedDate;
    v17->_lastSharedDate = (NSDate *)v20;

    v17->_featureStatus = a5;
    v17->_userStatus = a6;
    v17->_multiDeviceStatus = a7;
    uint64_t v22 = [v16 copy];
    primaryDeviceName = v17->_primaryDeviceName;
    v17->_primaryDeviceName = (NSString *)v22;
  }
  return v17;
}

+ (id)unknownStatus
{
  v2 = (void *)[objc_alloc((Class)a1) initWithFirstSharedDate:0 lastSharedDate:0 featureStatus:0 userStatus:0 multiDeviceStatus:0 primaryDeviceName:0];

  return v2;
}

+ (int64_t)clinicalSharingFeatureStatusWithAccountState:(int64_t)a3 gatewayFeatureStatus:(int64_t)a4
{
  int64_t result = 4;
  switch(a3)
  {
    case 0:
      int64_t result = 2;
      break;
    case 1:
    case 6:
      if ((unint64_t)a4 >= 5) {
        int64_t result = 1;
      }
      else {
        int64_t result = a4;
      }
      break;
    case 2:
    case 4:
      int64_t result = 3;
      break;
    case 3:
      if ((unint64_t)a4 >= 5) {
        int64_t result = 5;
      }
      else {
        int64_t result = qword_221D87BA8[a4];
      }
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_firstSharedDate hash];
  uint64_t v4 = [(NSDate *)self->_lastSharedDate hash] ^ v3;
  primaryDeviceName = self->_primaryDeviceName;
  int64_t v6 = v4 ^ self->_featureStatus ^ self->_userStatus ^ self->_multiDeviceStatus;
  return v6 ^ [(NSString *)primaryDeviceName hash];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v6 = (HKClinicalSharingStatus *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
LABEL_32:

      goto LABEL_33;
    }
    firstSharedDate = self->_firstSharedDate;
    v10 = [(HKClinicalSharingStatus *)v8 firstSharedDate];
    if (firstSharedDate != v10)
    {
      uint64_t v11 = [(HKClinicalSharingStatus *)v8 firstSharedDate];
      if (!v11)
      {
        char v13 = 0;
        goto LABEL_31;
      }
      uint64_t v3 = (void *)v11;
      v12 = self->_firstSharedDate;
      uint64_t v4 = [(HKClinicalSharingStatus *)v8 firstSharedDate];
      if (![(NSDate *)v12 isEqual:v4])
      {
        char v13 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v33 = v4;
    }
    lastSharedDate = self->_lastSharedDate;
    id v15 = [(HKClinicalSharingStatus *)v8 lastSharedDate];
    if (lastSharedDate != v15)
    {
      uint64_t v16 = [(HKClinicalSharingStatus *)v8 lastSharedDate];
      if (!v16)
      {
        char v13 = 0;
        goto LABEL_29;
      }
      uint64_t v4 = (void *)v16;
      v17 = self->_lastSharedDate;
      uint64_t v18 = [(HKClinicalSharingStatus *)v8 lastSharedDate];
      v19 = v17;
      uint64_t v20 = (void *)v18;
      if (([(NSDate *)v19 isEqual:v18] & 1) == 0)
      {

        char v13 = 0;
        goto LABEL_35;
      }
      v32 = v20;
    }
    int64_t featureStatus = self->_featureStatus;
    if (featureStatus == [(HKClinicalSharingStatus *)v8 featureStatus])
    {
      int64_t userStatus = self->_userStatus;
      if (userStatus == [(HKClinicalSharingStatus *)v8 userStatus])
      {
        int64_t multiDeviceStatus = self->_multiDeviceStatus;
        if (multiDeviceStatus == [(HKClinicalSharingStatus *)v8 multiDeviceStatus])
        {
          primaryDeviceName = self->_primaryDeviceName;
          uint64_t v25 = [(HKClinicalSharingStatus *)v8 primaryDeviceName];
          if (primaryDeviceName == (NSString *)v25)
          {

            char v13 = 1;
LABEL_27:
            if (lastSharedDate == v15) {
              goto LABEL_34;
            }

LABEL_29:
            uint64_t v4 = v33;

            if (firstSharedDate != v10) {
              goto LABEL_30;
            }
LABEL_31:

            goto LABEL_32;
          }
          v31 = (void *)v25;
          uint64_t v26 = [(HKClinicalSharingStatus *)v8 primaryDeviceName];
          if (v26)
          {
            v27 = self->_primaryDeviceName;
            v30 = (void *)v26;
            v28 = [(HKClinicalSharingStatus *)v8 primaryDeviceName];
            char v13 = [(NSString *)v27 isEqualToString:v28];

            if (lastSharedDate == v15)
            {

LABEL_35:
              uint64_t v4 = v33;
              if (firstSharedDate == v10) {
                goto LABEL_31;
              }
              goto LABEL_30;
            }

LABEL_34:
            goto LABEL_35;
          }
        }
      }
    }
    char v13 = 0;
    goto LABEL_27;
  }
  char v13 = 1;
LABEL_33:

  return v13;
}

- (id)description
{
  v17 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = HKClinicalSharingFeatureStatusToString(self->_featureStatus);
  int64_t v6 = HKClinicalSharingUserStatusToString(self->_userStatus);
  v7 = HKClinicalSharingMultiDeviceStatusToString(self->_multiDeviceStatus);
  primaryDeviceName = self->_primaryDeviceName;
  uint64_t v9 = [(NSDate *)self->_firstSharedDate hk_rfc3339String];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = @"never";
  }
  uint64_t v12 = [(NSDate *)self->_lastSharedDate hk_rfc3339String];
  char v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"never";
  }
  id v15 = [v17 stringWithFormat:@"<%@ %p\n\tFeature status: %@\n\tUser status:    %@\n\tDevice status:  %@\n\tPrimary device: %@\n\tFirst Share:    %@\n\tLast Share:     %@>", v4, self, v5, v6, v7, primaryDeviceName, v11, v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  firstSharedDate = self->_firstSharedDate;
  id v5 = a3;
  [v5 encodeObject:firstSharedDate forKey:@"firstSharedDate"];
  [v5 encodeObject:self->_lastSharedDate forKey:@"lastSharedDate"];
  [v5 encodeInteger:self->_featureStatus forKey:@"featureStatus"];
  [v5 encodeInteger:self->_userStatus forKey:@"userStatus"];
  [v5 encodeInteger:self->_multiDeviceStatus forKey:@"multiDeviceStatus"];
  [v5 encodeObject:self->_primaryDeviceName forKey:@"primaryDeviceName"];
}

- (HKClinicalSharingStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"featureStatus"]
    && [v4 containsValueForKey:@"userStatus"]
    && ([v4 containsValueForKey:@"multiDeviceStatus"] & 1) != 0)
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstSharedDate"];
    int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSharedDate"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"featureStatus"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"userStatus"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"multiDeviceStatus"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryDeviceName"];
    self = [(HKClinicalSharingStatus *)self initWithFirstSharedDate:v5 lastSharedDate:v6 featureStatus:v7 userStatus:v8 multiDeviceStatus:v9 primaryDeviceName:v10];

    uint64_t v11 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSDate)firstSharedDate
{
  return self->_firstSharedDate;
}

- (NSDate)lastSharedDate
{
  return self->_lastSharedDate;
}

- (int64_t)featureStatus
{
  return self->_featureStatus;
}

- (int64_t)userStatus
{
  return self->_userStatus;
}

- (int64_t)multiDeviceStatus
{
  return self->_multiDeviceStatus;
}

- (NSString)primaryDeviceName
{
  return self->_primaryDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDeviceName, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);

  objc_storeStrong((id *)&self->_firstSharedDate, 0);
}

@end