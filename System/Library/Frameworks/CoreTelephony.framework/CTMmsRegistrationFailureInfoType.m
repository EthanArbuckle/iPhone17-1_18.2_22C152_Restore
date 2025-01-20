@interface CTMmsRegistrationFailureInfoType
+ (BOOL)supportsSecureCoding;
- (BOOL)activationForMms;
- (BOOL)dataActive;
- (BOOL)isDataAttached;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTMmsRegistrationFailureInfoType:(id)a3;
- (CTMmsRegistrationFailureInfoType)init;
- (CTMmsRegistrationFailureInfoType)initWithCoder:(id)a3;
- (NSNumber)pdpContextId;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationForMms:(BOOL)a3;
- (void)setDataActive:(BOOL)a3;
- (void)setIsDataAttached:(BOOL)a3;
- (void)setPdpContextId:(id)a3;
@end

@implementation CTMmsRegistrationFailureInfoType

- (CTMmsRegistrationFailureInfoType)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTMmsRegistrationFailureInfoType;
  v2 = [(CTMmsRegistrationFailureInfoType *)&v5 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CTMmsRegistrationFailureInfoType *)v2 setPdpContextId:v3];

    [(CTMmsRegistrationFailureInfoType *)v2 setDataActive:0];
    [(CTMmsRegistrationFailureInfoType *)v2 setIsDataAttached:0];
    [(CTMmsRegistrationFailureInfoType *)v2 setActivationForMms:1];
  }
  return v2;
}

- (BOOL)isEqualToCTMmsRegistrationFailureInfoType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(CTMmsRegistrationFailureInfoType *)self pdpContextId];
    v6 = [v4 pdpContextId];
    if (v5 == v6
      && (int v7 = [(CTMmsRegistrationFailureInfoType *)self dataActive],
          v7 == [v4 dataActive])
      && (int v8 = [(CTMmsRegistrationFailureInfoType *)self isDataAttached],
          v8 == [v4 isDataAttached]))
    {
      BOOL v11 = [(CTMmsRegistrationFailureInfoType *)self activationForMms];
      int v9 = v11 ^ [v4 activationForMms] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTMmsRegistrationFailureInfoType *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTMmsRegistrationFailureInfoType *)self isEqualToCTMmsRegistrationFailureInfoType:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = [(CTMmsRegistrationFailureInfoType *)self pdpContextId];
  [v4 setPdpContextId:v5];

  objc_msgSend(v4, "setDataActive:", -[CTMmsRegistrationFailureInfoType dataActive](self, "dataActive"));
  objc_msgSend(v4, "setIsDataAttached:", -[CTMmsRegistrationFailureInfoType isDataAttached](self, "isDataAttached"));
  objc_msgSend(v4, "setActivationForMms:", -[CTMmsRegistrationFailureInfoType activationForMms](self, "activationForMms"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  pdpContextId = self->_pdpContextId;
  id v5 = a3;
  [v5 encodeObject:pdpContextId forKey:@"pdp_context_id"];
  [v5 encodeBool:self->_dataActive forKey:@"data_active"];
  [v5 encodeBool:self->_isDataAttached forKey:@"is_data_attached"];
  [v5 encodeBool:self->_activationForMms forKey:@"activation_for_mms"];
}

- (CTMmsRegistrationFailureInfoType)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTMmsRegistrationFailureInfoType;
  id v5 = [(CTMmsRegistrationFailureInfoType *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pdp_context_id"];
    pdpContextId = v5->_pdpContextId;
    v5->_pdpContextId = (NSNumber *)v6;

    v5->_dataActive = [v4 decodeBoolForKey:@"data_active"];
    v5->_isDataAttached = [v4 decodeBoolForKey:@"is_data_attached"];
    v5->_activationForMms = [v4 decodeBoolForKey:@"activation_for_mms"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)pdpContextId
{
  return self->_pdpContextId;
}

- (void)setPdpContextId:(id)a3
{
}

- (BOOL)dataActive
{
  return self->_dataActive;
}

- (void)setDataActive:(BOOL)a3
{
  self->_dataActive = a3;
}

- (BOOL)isDataAttached
{
  return self->_isDataAttached;
}

- (void)setIsDataAttached:(BOOL)a3
{
  self->_isDataAttached = a3;
}

- (BOOL)activationForMms
{
  return self->_activationForMms;
}

- (void)setActivationForMms:(BOOL)a3
{
  self->_activationForMms = a3;
}

- (void).cxx_destruct
{
}

@end