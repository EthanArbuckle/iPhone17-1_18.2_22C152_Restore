@interface CTSuppServicesNotificationData
+ (BOOL)supportsSecureCoding;
- (CTSuppServicesNotificationData)initWithCoder:(id)a3;
- (NSNumber)active;
- (NSNumber)callBarringFacility;
- (NSNumber)callClass;
- (NSNumber)callForwardingNoReplyTime;
- (NSNumber)callForwardingReason;
- (NSNumber)callingLineIdRestriction;
- (NSNumber)callingLineIdRestrictionModification;
- (NSNumber)callingLinePresentation;
- (NSNumber)callingNamePresentation;
- (NSNumber)connectedLineIdRestriction;
- (NSNumber)connectedLinePresentation;
- (NSNumber)enabled;
- (NSNumber)mmiProcedure;
- (NSNumber)supplementaryServiceType;
- (NSString)callForwardingNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(id)a3;
- (void)setCallBarringFacility:(id)a3;
- (void)setCallClass:(id)a3;
- (void)setCallForwardingNoReplyTime:(id)a3;
- (void)setCallForwardingNumber:(id)a3;
- (void)setCallForwardingReason:(id)a3;
- (void)setCallingLineIdRestriction:(id)a3;
- (void)setCallingLineIdRestrictionModification:(id)a3;
- (void)setCallingLinePresentation:(id)a3;
- (void)setCallingNamePresentation:(id)a3;
- (void)setConnectedLineIdRestriction:(id)a3;
- (void)setConnectedLinePresentation:(id)a3;
- (void)setEnabled:(id)a3;
- (void)setMmiProcedure:(id)a3;
- (void)setSupplementaryServiceType:(id)a3;
@end

@implementation CTSuppServicesNotificationData

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSuppServicesNotificationData *)self callForwardingReason];

  if (v4)
  {
    v5 = [(CTSuppServicesNotificationData *)self callForwardingReason];
    [v3 appendFormat:@", callForwardingReason=%@", v5];
  }
  v6 = [(CTSuppServicesNotificationData *)self callForwardingNumber];

  if (v6)
  {
    v7 = [(CTSuppServicesNotificationData *)self callForwardingNumber];
    [v3 appendFormat:@", callForwardingNumber=%@", v7];
  }
  v8 = [(CTSuppServicesNotificationData *)self callClass];

  if (v8)
  {
    v9 = [(CTSuppServicesNotificationData *)self callClass];
    [v3 appendFormat:@", callClass=%@", v9];
  }
  v10 = [(CTSuppServicesNotificationData *)self enabled];

  if (v10)
  {
    v11 = [(CTSuppServicesNotificationData *)self enabled];
    [v3 appendFormat:@", enabled=%@", v11];
  }
  v12 = [(CTSuppServicesNotificationData *)self active];

  if (v12)
  {
    v13 = [(CTSuppServicesNotificationData *)self active];
    [v3 appendFormat:@", active=%@", v13];
  }
  v14 = [(CTSuppServicesNotificationData *)self callForwardingNoReplyTime];

  if (v14)
  {
    v15 = [(CTSuppServicesNotificationData *)self callForwardingNoReplyTime];
    [v3 appendFormat:@", callForwardingNoReplyTime=%@", v15];
  }
  v16 = [(CTSuppServicesNotificationData *)self mmiProcedure];

  if (v16)
  {
    v17 = [(CTSuppServicesNotificationData *)self mmiProcedure];
    [v3 appendFormat:@", mmiProcedure=%@", v17];
  }
  v18 = [(CTSuppServicesNotificationData *)self callBarringFacility];

  if (v18)
  {
    v19 = [(CTSuppServicesNotificationData *)self callBarringFacility];
    [v3 appendFormat:@", callBarringFacility=%@", v19];
  }
  v20 = [(CTSuppServicesNotificationData *)self supplementaryServiceType];

  if (v20)
  {
    v21 = [(CTSuppServicesNotificationData *)self supplementaryServiceType];
    [v3 appendFormat:@", supplementaryServiceType=%@", v21];
  }
  v22 = [(CTSuppServicesNotificationData *)self callingLineIdRestriction];

  if (v22)
  {
    v23 = [(CTSuppServicesNotificationData *)self callingLineIdRestriction];
    [v3 appendFormat:@", callingLineIdRestriction=%@", v23];
  }
  v24 = [(CTSuppServicesNotificationData *)self callingLineIdRestrictionModification];

  if (v24)
  {
    v25 = [(CTSuppServicesNotificationData *)self callingLineIdRestrictionModification];
    [v3 appendFormat:@", callingLineIdRestrictionModification=%@", v25];
  }
  v26 = [(CTSuppServicesNotificationData *)self connectedLineIdRestriction];

  if (v26)
  {
    v27 = [(CTSuppServicesNotificationData *)self connectedLineIdRestriction];
    [v3 appendFormat:@", connectedLineIdRestriction=%@", v27];
  }
  v28 = [(CTSuppServicesNotificationData *)self callingNamePresentation];

  if (v28)
  {
    v29 = [(CTSuppServicesNotificationData *)self callingNamePresentation];
    [v3 appendFormat:@", callingNamePresentation=%@", v29];
  }
  v30 = [(CTSuppServicesNotificationData *)self connectedLinePresentation];

  if (v30)
  {
    v31 = [(CTSuppServicesNotificationData *)self connectedLinePresentation];
    [v3 appendFormat:@", connectedLinePresentation=%@", v31];
  }
  v32 = [(CTSuppServicesNotificationData *)self callingLinePresentation];

  if (v32)
  {
    v33 = [(CTSuppServicesNotificationData *)self callingLinePresentation];
    [v3 appendFormat:@", callingLinePresentation=%@", v33];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSuppServicesNotificationData *)self callForwardingReason];
  v6 = (void *)[v5 copy];
  [v4 setCallForwardingReason:v6];

  v7 = [(CTSuppServicesNotificationData *)self callForwardingNumber];
  v8 = (void *)[v7 copy];
  [v4 setCallForwardingNumber:v8];

  v9 = [(CTSuppServicesNotificationData *)self callClass];
  v10 = (void *)[v9 copy];
  [v4 setCallClass:v10];

  v11 = [(CTSuppServicesNotificationData *)self enabled];
  v12 = (void *)[v11 copy];
  [v4 setEnabled:v12];

  v13 = [(CTSuppServicesNotificationData *)self active];
  v14 = (void *)[v13 copy];
  [v4 setActive:v14];

  v15 = [(CTSuppServicesNotificationData *)self callForwardingNoReplyTime];
  v16 = (void *)[v15 copy];
  [v4 setCallForwardingNoReplyTime:v16];

  v17 = [(CTSuppServicesNotificationData *)self mmiProcedure];
  v18 = (void *)[v17 copy];
  [v4 setMmiProcedure:v18];

  v19 = [(CTSuppServicesNotificationData *)self callBarringFacility];
  v20 = (void *)[v19 copy];
  [v4 setCallBarringFacility:v20];

  v21 = [(CTSuppServicesNotificationData *)self supplementaryServiceType];
  v22 = (void *)[v21 copy];
  [v4 setSupplementaryServiceType:v22];

  v23 = [(CTSuppServicesNotificationData *)self callingLineIdRestriction];
  v24 = (void *)[v23 copy];
  [v4 setCallingLineIdRestriction:v24];

  v25 = [(CTSuppServicesNotificationData *)self callingLineIdRestrictionModification];
  v26 = (void *)[v25 copy];
  [v4 setCallingLineIdRestrictionModification:v26];

  v27 = [(CTSuppServicesNotificationData *)self connectedLineIdRestriction];
  v28 = (void *)[v27 copy];
  [v4 setConnectedLineIdRestriction:v28];

  v29 = [(CTSuppServicesNotificationData *)self callingNamePresentation];
  v30 = (void *)[v29 copy];
  [v4 setCallingNamePresentation:v30];

  v31 = [(CTSuppServicesNotificationData *)self connectedLinePresentation];
  v32 = (void *)[v31 copy];
  [v4 setConnectedLinePresentation:v32];

  v33 = [(CTSuppServicesNotificationData *)self callingLinePresentation];
  v34 = (void *)[v33 copy];
  [v4 setCallingLinePresentation:v34];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTSuppServicesNotificationData *)self callForwardingReason];
  [v4 encodeObject:v5 forKey:@"callForwardingReason"];

  v6 = [(CTSuppServicesNotificationData *)self callForwardingNumber];
  [v4 encodeObject:v6 forKey:@"callForwardingNumber"];

  v7 = [(CTSuppServicesNotificationData *)self callClass];
  [v4 encodeObject:v7 forKey:@"callClass"];

  v8 = [(CTSuppServicesNotificationData *)self enabled];
  [v4 encodeObject:v8 forKey:@"enabled"];

  v9 = [(CTSuppServicesNotificationData *)self active];
  [v4 encodeObject:v9 forKey:@"active"];

  v10 = [(CTSuppServicesNotificationData *)self callForwardingNoReplyTime];
  [v4 encodeObject:v10 forKey:@"callForwardingNoReplyTime"];

  v11 = [(CTSuppServicesNotificationData *)self mmiProcedure];
  [v4 encodeObject:v11 forKey:@"mmiProcedure"];

  v12 = [(CTSuppServicesNotificationData *)self callBarringFacility];
  [v4 encodeObject:v12 forKey:@"callBarringFacility"];

  v13 = [(CTSuppServicesNotificationData *)self supplementaryServiceType];
  [v4 encodeObject:v13 forKey:@"supplementaryServiceType"];

  v14 = [(CTSuppServicesNotificationData *)self callingLineIdRestriction];
  [v4 encodeObject:v14 forKey:@"callingLineIdRestriction"];

  v15 = [(CTSuppServicesNotificationData *)self callingLineIdRestrictionModification];
  [v4 encodeObject:v15 forKey:@"callingLineIdRestrictionModification"];

  v16 = [(CTSuppServicesNotificationData *)self connectedLineIdRestriction];
  [v4 encodeObject:v16 forKey:@"connectedLineIdRestriction"];

  v17 = [(CTSuppServicesNotificationData *)self callingNamePresentation];
  [v4 encodeObject:v17 forKey:@"callingNamePresentation"];

  v18 = [(CTSuppServicesNotificationData *)self connectedLinePresentation];
  [v4 encodeObject:v18 forKey:@"connectedLinePresentation"];

  id v19 = [(CTSuppServicesNotificationData *)self callingLinePresentation];
  [v4 encodeObject:v19 forKey:@"callingLinePresentation"];
}

- (CTSuppServicesNotificationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CTSuppServicesNotificationData;
  v5 = [(CTSuppServicesNotificationData *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callForwardingReason"];
    callForwardingReason = v5->_callForwardingReason;
    v5->_callForwardingReason = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callForwardingNumber"];
    callForwardingNumber = v5->_callForwardingNumber;
    v5->_callForwardingNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callClass"];
    callClass = v5->_callClass;
    v5->_callClass = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enabled"];
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"active"];
    active = v5->_active;
    v5->_active = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callForwardingNoReplyTime"];
    callForwardingNoReplyTime = v5->_callForwardingNoReplyTime;
    v5->_callForwardingNoReplyTime = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mmiProcedure"];
    mmiProcedure = v5->_mmiProcedure;
    v5->_mmiProcedure = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callBarringFacility"];
    callBarringFacility = v5->_callBarringFacility;
    v5->_callBarringFacility = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementaryServiceType"];
    supplementaryServiceType = v5->_supplementaryServiceType;
    v5->_supplementaryServiceType = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callingLineIdRestriction"];
    callingLineIdRestriction = v5->_callingLineIdRestriction;
    v5->_callingLineIdRestriction = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callingLineIdRestrictionModification"];
    callingLineIdRestrictionModification = v5->_callingLineIdRestrictionModification;
    v5->_callingLineIdRestrictionModification = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedLineIdRestriction"];
    connectedLineIdRestriction = v5->_connectedLineIdRestriction;
    v5->_connectedLineIdRestriction = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callingNamePresentation"];
    callingNamePresentation = v5->_callingNamePresentation;
    v5->_callingNamePresentation = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedLinePresentation"];
    connectedLinePresentation = v5->_connectedLinePresentation;
    v5->_connectedLinePresentation = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callingLinePresentation"];
    callingLinePresentation = v5->_callingLinePresentation;
    v5->_callingLinePresentation = (NSNumber *)v34;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)callForwardingReason
{
  return self->_callForwardingReason;
}

- (void)setCallForwardingReason:(id)a3
{
}

- (NSNumber)callClass
{
  return self->_callClass;
}

- (void)setCallClass:(id)a3
{
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
}

- (NSString)callForwardingNumber
{
  return self->_callForwardingNumber;
}

- (void)setCallForwardingNumber:(id)a3
{
}

- (NSNumber)callForwardingNoReplyTime
{
  return self->_callForwardingNoReplyTime;
}

- (void)setCallForwardingNoReplyTime:(id)a3
{
}

- (NSNumber)mmiProcedure
{
  return self->_mmiProcedure;
}

- (void)setMmiProcedure:(id)a3
{
}

- (NSNumber)callBarringFacility
{
  return self->_callBarringFacility;
}

- (void)setCallBarringFacility:(id)a3
{
}

- (NSNumber)supplementaryServiceType
{
  return self->_supplementaryServiceType;
}

- (void)setSupplementaryServiceType:(id)a3
{
}

- (NSNumber)callingLineIdRestriction
{
  return self->_callingLineIdRestriction;
}

- (void)setCallingLineIdRestriction:(id)a3
{
}

- (NSNumber)callingLineIdRestrictionModification
{
  return self->_callingLineIdRestrictionModification;
}

- (void)setCallingLineIdRestrictionModification:(id)a3
{
}

- (NSNumber)connectedLineIdRestriction
{
  return self->_connectedLineIdRestriction;
}

- (void)setConnectedLineIdRestriction:(id)a3
{
}

- (NSNumber)callingNamePresentation
{
  return self->_callingNamePresentation;
}

- (void)setCallingNamePresentation:(id)a3
{
}

- (NSNumber)connectedLinePresentation
{
  return self->_connectedLinePresentation;
}

- (void)setConnectedLinePresentation:(id)a3
{
}

- (NSNumber)callingLinePresentation
{
  return self->_callingLinePresentation;
}

- (void)setCallingLinePresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingLinePresentation, 0);
  objc_storeStrong((id *)&self->_connectedLinePresentation, 0);
  objc_storeStrong((id *)&self->_callingNamePresentation, 0);
  objc_storeStrong((id *)&self->_connectedLineIdRestriction, 0);
  objc_storeStrong((id *)&self->_callingLineIdRestrictionModification, 0);
  objc_storeStrong((id *)&self->_callingLineIdRestriction, 0);
  objc_storeStrong((id *)&self->_supplementaryServiceType, 0);
  objc_storeStrong((id *)&self->_callBarringFacility, 0);
  objc_storeStrong((id *)&self->_mmiProcedure, 0);
  objc_storeStrong((id *)&self->_callForwardingNoReplyTime, 0);
  objc_storeStrong((id *)&self->_callForwardingNumber, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_callClass, 0);

  objc_storeStrong((id *)&self->_callForwardingReason, 0);
}

@end