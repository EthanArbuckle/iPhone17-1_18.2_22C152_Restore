@interface BKIdentity
+ (id)identity;
- (BKAccessory)accessory;
- (BKAccessoryGroup)accessoryGroup;
- (BKDevice)device;
- (BKIdentity)initWithServerIdentity:(id)a3 device:(id)a4;
- (BOOL)canAddPeriocularEnrollment;
- (BOOL)hasPeriocularEnrollment;
- (BOOL)hasPeriocularEnrollmentWithGlasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentity:(id)a3;
- (BOOL)placeholderIdentity;
- (NSDate)creationTime;
- (NSString)name;
- (NSUUID)uuid;
- (id)serverIdentity;
- (int64_t)secondaryPeriocularEnrollments;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)userID;
- (void)setAccessory:(id)a3;
- (void)setAccessoryGroup:(id)a3;
- (void)setCanAddPeriocularEnrollment:(BOOL)a3;
- (void)setCreationTime:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHasPeriocularEnrollment:(BOOL)a3;
- (void)setHasPeriocularEnrollmentWithGlasses:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlaceholderIdentity:(BOOL)a3;
- (void)setSecondaryPeriocularEnrollments:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserID:(unsigned int)a3;
- (void)setUuid:(id)a3;
@end

@implementation BKIdentity

+ (id)identity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BKIdentity)initWithServerIdentity:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BKIdentity;
  v8 = [(BKIdentity *)&v25 init];
  v9 = v8;
  if (v6 && v8)
  {
    uint64_t v10 = [v6 uuid];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    v9->_userID = [v6 userID];
    uint64_t v12 = [v6 name];
    name = v9->_name;
    v9->_name = (NSString *)v12;

    uint64_t v14 = [v6 creationTime];
    creationTime = v9->_creationTime;
    v9->_creationTime = (NSDate *)v14;

    objc_storeStrong((id *)&v9->_device, a4);
    v16 = [BKAccessory alloc];
    v17 = [v6 accessory];
    uint64_t v18 = [(BKAccessory *)v16 initWithServerAccessory:v17 device:v7];
    accessory = v9->_accessory;
    v9->_accessory = (BKAccessory *)v18;

    uint64_t v20 = [(BKAccessory *)v9->_accessory accessoryGroup];
    accessoryGroup = v9->_accessoryGroup;
    v9->_accessoryGroup = (BKAccessoryGroup *)v20;

    v9->_placeholderIdentity = [v6 flags] & 1;
    if ([v6 type] == 4)
    {
      v9->_hasPeriocularEnrollment = ([v6 flags] >> 16) & 1;
      v9->_hasPeriocularEnrollmentWithGlasses = ([v6 flags] & 0x20000) != 0;
      v9->_canAddPeriocularEnrollment = ([v6 flags] & 0x40000) != 0;
      v9->_secondaryPeriocularEnrollments = ([v6 flags] >> 19) & 7;
    }
    int v22 = [v6 type];
    uint64_t v23 = 2 * (v22 == 4);
    if (v22 == 1) {
      uint64_t v23 = 1;
    }
    v9->_type = v23;
  }

  return v9;
}

- (id)serverIdentity
{
  v3 = +[BiometricKitIdentity biometricKitIdentity];
  [v3 setUuid:self->_uuid];
  [v3 setUserID:self->_userID];
  [v3 setName:self->_name];
  [v3 setCreationTime:self->_creationTime];
  int64_t type = self->_type;
  if (type == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 4 * (type == 2);
  }
  [v3 setType:v5];
  return v3;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_type == *((void *)v4 + 3) && self->_userID == *((_DWORD *)v4 + 3)) {
    char v6 = [(NSUUID *)self->_uuid isEqual:*((void *)v4 + 2)];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKIdentity *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BKIdentity *)self isEqualToIdentity:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_userID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
}

- (BKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BKAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (BKAccessoryGroup)accessoryGroup
{
  return self->_accessoryGroup;
}

- (void)setAccessoryGroup:(id)a3
{
}

- (BOOL)placeholderIdentity
{
  return self->_placeholderIdentity;
}

- (void)setPlaceholderIdentity:(BOOL)a3
{
  self->_placeholderIdentity = a3;
}

- (BOOL)hasPeriocularEnrollment
{
  return self->_hasPeriocularEnrollment;
}

- (void)setHasPeriocularEnrollment:(BOOL)a3
{
  self->_hasPeriocularEnrollment = a3;
}

- (BOOL)hasPeriocularEnrollmentWithGlasses
{
  return self->_hasPeriocularEnrollmentWithGlasses;
}

- (void)setHasPeriocularEnrollmentWithGlasses:(BOOL)a3
{
  self->_hasPeriocularEnrollmentWithGlasses = a3;
}

- (BOOL)canAddPeriocularEnrollment
{
  return self->_canAddPeriocularEnrollment;
}

- (void)setCanAddPeriocularEnrollment:(BOOL)a3
{
  self->_canAddPeriocularEnrollment = a3;
}

- (int64_t)secondaryPeriocularEnrollments
{
  return self->_secondaryPeriocularEnrollments;
}

- (void)setSecondaryPeriocularEnrollments:(int64_t)a3
{
  self->_secondaryPeriocularEnrollments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryGroup, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end