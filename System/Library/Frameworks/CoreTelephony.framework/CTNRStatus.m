@interface CTNRStatus
+ (BOOL)supportsSecureCoding;
+ (id)default;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNSADisabled;
- (BOOL)isSADisabled;
- (BOOL)isSASwitchConfigurable;
- (BOOL)isSASwitchVisible;
- (CTNRStatus)initWithCoder:(id)a3;
- (CTNRStatus)initWithSASwitchVisible:(BOOL)a3 saSwitchConfigurable:(BOOL)a4 saDisabledByBaseband:(BOOL)a5 saDisabledReasonMask:(unint64_t)a6 nsaDisabledByBaseband:(BOOL)a7 nsaDisabledReasonMask:(unint64_t)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)nsaDisabledReasonMask;
- (unint64_t)saDisabledReasonMask;
- (void)encodeWithCoder:(id)a3;
- (void)setNsaDisabled:(BOOL)a3;
- (void)setNsaDisabledReasonMask:(unint64_t)a3;
- (void)setSaDisabled:(BOOL)a3;
- (void)setSaDisabledReasonMask:(unint64_t)a3;
- (void)setSaSwitchConfigurable:(BOOL)a3;
- (void)setSaSwitchVisible:(BOOL)a3;
@end

@implementation CTNRStatus

+ (id)default
{
  v2 = [[CTNRStatus alloc] initWithSASwitchVisible:0 saSwitchConfigurable:0 saDisabledByBaseband:1 saDisabledReasonMask:0 nsaDisabledByBaseband:1 nsaDisabledReasonMask:0];

  return v2;
}

- (CTNRStatus)initWithSASwitchVisible:(BOOL)a3 saSwitchConfigurable:(BOOL)a4 saDisabledByBaseband:(BOOL)a5 saDisabledReasonMask:(unint64_t)a6 nsaDisabledByBaseband:(BOOL)a7 nsaDisabledReasonMask:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CTNRStatus;
  result = [(CTNRStatus *)&v15 init];
  if (result)
  {
    result->_saSwitchVisible = a3;
    result->_saSwitchConfigurable = a4;
    result->_saDisabled = a5;
    result->_nsaDisabled = a7;
    result->_saDisabledReasonMask = a6;
    result->_nsaDisabledReasonMask = a8;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CTNRStatus isSASwitchVisible](self, "isSASwitchVisible"));
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CTNRStatus isSASwitchConfigurable](self, "isSASwitchConfigurable"));
  [v3 appendFormat:@" SA switch=(visible:%@, configurable:%@)", v4, v5];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CTNRStatus isSADisabled](self, "isSADisabled"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTNRStatus saDisabledReasonMask](self, "saDisabledReasonMask"));
  [v3 appendFormat:@" SA=(disabled:%@, reasonMask:%@)", v6, v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CTNRStatus isNSADisabled](self, "isNSADisabled"));
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTNRStatus nsaDisabledReasonMask](self, "nsaDisabledReasonMask"));
  [v3 appendFormat:@" NSA=(disabled:%@, reasonMask:%@)", v8, v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTNRStatus *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v5 = [(CTNRStatus *)self isSASwitchVisible],
          v5 == [(CTNRStatus *)v4 isSASwitchVisible])
      && (BOOL v6 = [(CTNRStatus *)self isSASwitchConfigurable],
          v6 == [(CTNRStatus *)v4 isSASwitchConfigurable])
      && (BOOL v7 = [(CTNRStatus *)self isSADisabled], v7 == [(CTNRStatus *)v4 isSADisabled])
      && (unint64_t v8 = [(CTNRStatus *)self saDisabledReasonMask],
          v8 == [(CTNRStatus *)v4 saDisabledReasonMask])
      && (BOOL v9 = [(CTNRStatus *)self isNSADisabled], v9 == [(CTNRStatus *)v4 isNSADisabled]))
    {
      unint64_t v12 = [(CTNRStatus *)self nsaDisabledReasonMask];
      BOOL v10 = v12 == [(CTNRStatus *)v4 nsaDisabledReasonMask];
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CTNRStatus *)self isSASwitchVisible];
  BOOL v6 = [(CTNRStatus *)self isSASwitchConfigurable];
  BOOL v7 = [(CTNRStatus *)self isSADisabled];
  unint64_t v8 = [(CTNRStatus *)self saDisabledReasonMask];
  BOOL v9 = [(CTNRStatus *)self isNSADisabled];
  unint64_t v10 = [(CTNRStatus *)self nsaDisabledReasonMask];

  return (id)[v4 initWithSASwitchVisible:v5 saSwitchConfigurable:v6 saDisabledByBaseband:v7 saDisabledReasonMask:v8 nsaDisabledByBaseband:v9 nsaDisabledReasonMask:v10];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isSASwitchVisible](self, "isSASwitchVisible"), @"saSwitchVisible");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isSASwitchConfigurable](self, "isSASwitchConfigurable"), @"saSwitchConfigurable");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isSADisabled](self, "isSADisabled"), @"saDisabled");
  BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTNRStatus saDisabledReasonMask](self, "saDisabledReasonMask"));
  [v4 encodeObject:v5 forKey:@"saDisabledReasonMask"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isNSADisabled](self, "isNSADisabled"), @"nsaDisabled");
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTNRStatus nsaDisabledReasonMask](self, "nsaDisabledReasonMask"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"nsaDisabledReasonMask"];
}

- (CTNRStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTNRStatus;
  BOOL v5 = [(CTNRStatus *)&v9 init];
  if (v5)
  {
    v5->_saSwitchVisible = [v4 decodeBoolForKey:@"saSwitchVisible"];
    v5->_saSwitchConfigurable = [v4 decodeBoolForKey:@"saSwitchConfigurable"];
    v5->_saDisabled = [v4 decodeBoolForKey:@"saDisabled"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saDisabledReasonMask"];
    v5->_saDisabledReasonMask = [v6 unsignedIntegerValue];

    v5->_nsaDisabled = [v4 decodeBoolForKey:@"nsaDisabled"];
    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nsaDisabledReasonMask"];
    v5->_nsaDisabledReasonMask = [v7 unsignedIntegerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSASwitchVisible
{
  return self->_saSwitchVisible;
}

- (void)setSaSwitchVisible:(BOOL)a3
{
  self->_saSwitchVisible = a3;
}

- (BOOL)isSASwitchConfigurable
{
  return self->_saSwitchConfigurable;
}

- (void)setSaSwitchConfigurable:(BOOL)a3
{
  self->_saSwitchConfigurable = a3;
}

- (BOOL)isSADisabled
{
  return self->_saDisabled;
}

- (void)setSaDisabled:(BOOL)a3
{
  self->_saDisabled = a3;
}

- (unint64_t)saDisabledReasonMask
{
  return self->_saDisabledReasonMask;
}

- (void)setSaDisabledReasonMask:(unint64_t)a3
{
  self->_saDisabledReasonMask = a3;
}

- (BOOL)isNSADisabled
{
  return self->_nsaDisabled;
}

- (void)setNsaDisabled:(BOOL)a3
{
  self->_nsaDisabled = a3;
}

- (unint64_t)nsaDisabledReasonMask
{
  return self->_nsaDisabledReasonMask;
}

- (void)setNsaDisabledReasonMask:(unint64_t)a3
{
  self->_nsaDisabledReasonMask = a3;
}

@end