@interface CTStewieState
+ (BOOL)supportsSecureCoding;
- (BOOL)displayInactiveSOSInStatusBar;
- (BOOL)displaySatelliteIcon;
- (BOOL)isActiveService:(int64_t)a3;
- (BOOL)isAllowedService:(int64_t)a3;
- (BOOL)isCongestedService:(int64_t)a3;
- (BOOL)isDemoAllowedForService:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToState:(id)a3;
- (BOOL)isOffGridCriteriaSatisfied:(int64_t)a3;
- (BOOL)isPermittedAtCurrentLocation:(int64_t)a3;
- (BOOL)isStewieActive;
- (BOOL)isStewieActiveOverBB;
- (BOOL)isStewieActiveOverInternet;
- (BOOL)isSubscribedService:(int64_t)a3;
- (BOOL)isSubscriptionRequired:(int64_t)a3;
- (BOOL)isSubscriptionStatusNetworkDetermined:(int64_t)a3;
- (CTStewieState)init;
- (CTStewieState)initWithCoder:(id)a3;
- (CTStewieState)initWithStewieState:(const StewieState *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)activeServices;
- (int64_t)allowedServices;
- (int64_t)baseReason;
- (int64_t)configuredForLocationServices;
- (int64_t)congestedServices;
- (int64_t)dataPathAssertedServices;
- (int64_t)demoAllowedServices;
- (int64_t)offGridCriteriaSatisfiedServices;
- (int64_t)reason;
- (int64_t)status;
- (int64_t)statusReasonForService:(int64_t)a3;
- (int64_t)subscribedServices;
- (int64_t)subscriptionDeterminedServices;
- (int64_t)transportType;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveServices:(int64_t)a3;
- (void)setAllowedServices:(int64_t)a3;
- (void)setBaseReason:(int64_t)a3;
- (void)setConfiguredForLocationServices:(int64_t)a3;
- (void)setCongestedServices:(int64_t)a3;
- (void)setDataPathAssertedServices:(int64_t)a3;
- (void)setDemoAllowedServices:(int64_t)a3;
- (void)setDisplaySatelliteIcon:(BOOL)a3;
- (void)setOffGridCriteriaSatisfiedServices:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSubscribedServices:(int64_t)a3;
- (void)setSubscriptionDeterminedServices:(int64_t)a3;
- (void)setTransportType:(int64_t)a3;
@end

@implementation CTStewieState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", allowedServices=%ld", -[CTStewieState allowedServices](self, "allowedServices")];
  [v3 appendFormat:@", activeServices=%ld", -[CTStewieState activeServices](self, "activeServices")];
  [v3 appendFormat:@", subscriptionDeterminedServices=%ld", -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices")];
  [v3 appendFormat:@", subscribedServices=%ld", -[CTStewieState subscribedServices](self, "subscribedServices")];
  [v3 appendFormat:@", congestedServices=%ld", -[CTStewieState congestedServices](self, "congestedServices")];
  [v3 appendFormat:@", dataPathAssertedServices=%ld", -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices")];
  [v3 appendFormat:@", demoAllowedServices=%ld", -[CTStewieState demoAllowedServices](self, "demoAllowedServices")];
  [v3 appendFormat:@", offGridCriteriaSatisfiedServices=%ld", -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices")];
  [v3 appendFormat:@", configuredForLocationServices=%ld", -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices")];
  unint64_t v4 = [(CTStewieState *)self status];
  if (v4 > 6) {
    v5 = "???";
  }
  else {
    v5 = off_1E5263548[v4];
  }
  [v3 appendFormat:@", status=%s", v5];
  unint64_t v6 = [(CTStewieState *)self reason];
  if (v6 > 8) {
    v7 = "???";
  }
  else {
    v7 = off_1E5263580[v6];
  }
  [v3 appendFormat:@", reason=%s", v7];
  [v3 appendFormat:@", baseReason=%s", CTStewieServiceStatusReasonAsString(-[CTStewieState baseReason](self, "baseReason"))];
  unint64_t v8 = [(CTStewieState *)self transportType];
  if (v8 > 2) {
    v9 = "???";
  }
  else {
    v9 = off_1E52635C8[v8];
  }
  [v3 appendFormat:@", transportType=%s", v9];
  BOOL v10 = [(CTStewieState *)self displaySatelliteIcon];
  v11 = "no";
  if (v10) {
    v11 = "yes";
  }
  [v3 appendFormat:@", displaySatelliteIcon=%s", v11];
  [v3 appendString:@">"];

  return v3;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (int64_t)subscriptionDeterminedServices
{
  return self->_subscriptionDeterminedServices;
}

- (int64_t)subscribedServices
{
  return self->_subscribedServices;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)offGridCriteriaSatisfiedServices
{
  return self->_offGridCriteriaSatisfiedServices;
}

- (int64_t)demoAllowedServices
{
  return self->_demoAllowedServices;
}

- (int64_t)dataPathAssertedServices
{
  return self->_dataPathAssertedServices;
}

- (int64_t)congestedServices
{
  return self->_congestedServices;
}

- (int64_t)configuredForLocationServices
{
  return self->_configuredForLocationServices;
}

- (int64_t)baseReason
{
  return self->_baseReason;
}

- (BOOL)displayInactiveSOSInStatusBar
{
  BOOL v3 = 1;
  if (![(CTStewieState *)self isAllowedService:1]) {
    BOOL v3 = [(CTStewieState *)self isActiveService:1];
  }
  return [(CTStewieState *)self displaySatelliteIcon] && v3;
}

- (BOOL)isStewieActiveOverBB
{
  BOOL v3 = [(CTStewieState *)self isStewieActive];
  if (v3) {
    LOBYTE(v3) = [(CTStewieState *)self transportType] == 1;
  }
  return v3;
}

- (BOOL)isStewieActive
{
  return [(CTStewieState *)self activeServices] != 0;
}

- (BOOL)isActiveService:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self activeServices]) == 0;
}

- (int64_t)activeServices
{
  return self->_activeServices;
}

- (BOOL)displaySatelliteIcon
{
  return self->_displaySatelliteIcon;
}

- (BOOL)isAllowedService:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self allowedServices]) == 0;
}

- (int64_t)allowedServices
{
  return self->_allowedServices;
}

- (CTStewieState)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTStewieState;
  v2 = [(CTStewieState *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_displaySatelliteIcon = 0;
    *(_OWORD *)&v2->_allowedServices = 0u;
    *(_OWORD *)&v2->_status = 0u;
    *(_OWORD *)&v2->_transportType = 0u;
    *(_OWORD *)&v2->_subscribedServices = 0u;
    *(_OWORD *)&v2->_dataPathAssertedServices = 0u;
    *(_OWORD *)&v2->_offGridCriteriaSatisfiedServices = 0u;
    v2->_baseReason = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (CTStewieState)initWithStewieState:(const StewieState *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CTStewieState;
  unint64_t v4 = [(CTStewieState *)&v14 init];
  v5 = v4;
  if (v4)
  {
    [(CTStewieState *)v4 setAllowedServices:a3->var0];
    [(CTStewieState *)v5 setActiveServices:a3->var1];
    [(CTStewieState *)v5 setSubscriptionDeterminedServices:a3->var2];
    [(CTStewieState *)v5 setSubscribedServices:a3->var3];
    [(CTStewieState *)v5 setCongestedServices:a3->var4];
    [(CTStewieState *)v5 setDataPathAssertedServices:a3->var5];
    [(CTStewieState *)v5 setDemoAllowedServices:a3->var6];
    [(CTStewieState *)v5 setOffGridCriteriaSatisfiedServices:a3->var7];
    [(CTStewieState *)v5 setConfiguredForLocationServices:a3->var8];
    if ((a3->var9 - 1) > 3u) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_1845DCA10[(char)(a3->var9 - 1)];
    }
    [(CTStewieState *)v5 setStatus:v6];
    unsigned int v7 = a3->var10 - 1;
    if (v7 > 5) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_1845DCA30[(char)v7];
    }
    [(CTStewieState *)v5 setReason:v8];
    if (a3->var10 - 1 < 7) {
      uint64_t v9 = (a3->var10 - 1) + 1;
    }
    else {
      uint64_t v9 = 0;
    }
    [(CTStewieState *)v5 setBaseReason:v9];
    int var11 = a3->var11;
    if (var11 == 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = var11 == 1;
    }
    [(CTStewieState *)v5 setTransportType:v11];
    [(CTStewieState *)v5 setDisplaySatelliteIcon:a3->var12];
    v12 = v5;
  }

  return v5;
}

- (BOOL)isEqualToState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTStewieState *)self allowedServices];
  if (v5 != [v4 allowedServices]) {
    goto LABEL_15;
  }
  int64_t v6 = [(CTStewieState *)self activeServices];
  if (v6 != [v4 activeServices]) {
    goto LABEL_15;
  }
  int64_t v7 = [(CTStewieState *)self subscriptionDeterminedServices];
  if (v7 != [v4 subscriptionDeterminedServices]) {
    goto LABEL_15;
  }
  int64_t v8 = [(CTStewieState *)self subscribedServices];
  if (v8 != [v4 subscribedServices]) {
    goto LABEL_15;
  }
  int64_t v9 = [(CTStewieState *)self congestedServices];
  if (v9 != [v4 congestedServices]) {
    goto LABEL_15;
  }
  int64_t v10 = [(CTStewieState *)self dataPathAssertedServices];
  if (v10 != [v4 dataPathAssertedServices]) {
    goto LABEL_15;
  }
  int64_t v11 = [(CTStewieState *)self demoAllowedServices];
  if (v11 == [v4 demoAllowedServices]
    && (int64_t v12 = [(CTStewieState *)self offGridCriteriaSatisfiedServices],
        v12 == [v4 offGridCriteriaSatisfiedServices])
    && (int64_t v13 = [(CTStewieState *)self configuredForLocationServices],
        v13 == [v4 configuredForLocationServices])
    && (int64_t v14 = -[CTStewieState status](self, "status"), v14 == [v4 status])
    && (int64_t v15 = -[CTStewieState reason](self, "reason"), v15 == [v4 reason])
    && (int64_t v16 = -[CTStewieState baseReason](self, "baseReason"), v16 == [v4 baseReason])
    && (int64_t v17 = -[CTStewieState transportType](self, "transportType"), v17 == [v4 transportType]))
  {
    BOOL v18 = [(CTStewieState *)self displaySatelliteIcon];
    int v19 = v18 ^ [v4 displaySatelliteIcon] ^ 1;
  }
  else
  {
LABEL_15:
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieState *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CTStewieState *)self isEqualToState:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowedServices:", -[CTStewieState allowedServices](self, "allowedServices"));
  objc_msgSend(v4, "setActiveServices:", -[CTStewieState activeServices](self, "activeServices"));
  objc_msgSend(v4, "setSubscriptionDeterminedServices:", -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices"));
  objc_msgSend(v4, "setSubscribedServices:", -[CTStewieState subscribedServices](self, "subscribedServices"));
  objc_msgSend(v4, "setCongestedServices:", -[CTStewieState congestedServices](self, "congestedServices"));
  objc_msgSend(v4, "setDataPathAssertedServices:", -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices"));
  objc_msgSend(v4, "setDemoAllowedServices:", -[CTStewieState demoAllowedServices](self, "demoAllowedServices"));
  objc_msgSend(v4, "setOffGridCriteriaSatisfiedServices:", -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices"));
  objc_msgSend(v4, "setConfiguredForLocationServices:", -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices"));
  objc_msgSend(v4, "setReason:", -[CTStewieState reason](self, "reason"));
  objc_msgSend(v4, "setBaseReason:", -[CTStewieState baseReason](self, "baseReason"));
  objc_msgSend(v4, "setStatus:", -[CTStewieState status](self, "status"));
  objc_msgSend(v4, "setTransportType:", -[CTStewieState transportType](self, "transportType"));
  objc_msgSend(v4, "setDisplaySatelliteIcon:", -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState allowedServices](self, "allowedServices"), @"allowedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState activeServices](self, "activeServices"), @"activeServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices"), @"subscriptionDeterminedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState subscribedServices](self, "subscribedServices"), @"subscribedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState congestedServices](self, "congestedServices"), @"congestedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices"), @"dataPathAssertedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState demoAllowedServices](self, "demoAllowedServices"), @"demoAllowedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices"), @"offGridCriteriaSatisfiedServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices"), @"configuredForLocationServices");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState status](self, "status"), @"status");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState reason](self, "reason"), @"reason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState baseReason](self, "baseReason"), @"baseReason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState transportType](self, "transportType"), @"transportType");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon"), @"displaySatelliteIcon");
}

- (CTStewieState)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTStewieState;
  BOOL v5 = [(CTStewieState *)&v8 init];
  if (v5)
  {
    v5->_allowedServices = [v4 decodeIntegerForKey:@"allowedServices"];
    v5->_activeServices = [v4 decodeIntegerForKey:@"activeServices"];
    v5->_subscriptionDeterminedServices = [v4 decodeIntegerForKey:@"subscriptionDeterminedServices"];
    v5->_subscribedServices = [v4 decodeIntegerForKey:@"subscribedServices"];
    v5->_congestedServices = [v4 decodeIntegerForKey:@"congestedServices"];
    v5->_dataPathAssertedServices = [v4 decodeIntegerForKey:@"dataPathAssertedServices"];
    v5->_demoAllowedServices = [v4 decodeIntegerForKey:@"demoAllowedServices"];
    v5->_offGridCriteriaSatisfiedServices = [v4 decodeIntegerForKey:@"offGridCriteriaSatisfiedServices"];
    v5->_configuredForLocationServices = [v4 decodeIntegerForKey:@"configuredForLocationServices"];
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    v5->_baseReason = [v4 decodeIntegerForKey:@"baseReason"];
    v5->_transportType = [v4 decodeIntegerForKey:@"transportType"];
    v5->_displaySatelliteIcon = [v4 decodeBoolForKey:@"displaySatelliteIcon"];
    int64_t v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isStewieActiveOverInternet
{
  BOOL v3 = [(CTStewieState *)self isStewieActive];
  if (v3) {
    LOBYTE(v3) = [(CTStewieState *)self transportType] == 2;
  }
  return v3;
}

- (BOOL)isSubscriptionRequired:(int64_t)a3
{
  return (a3 & 0x3D) != 0;
}

- (BOOL)isSubscribedService:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self subscribedServices] & 0x3DLL) == 0;
}

- (BOOL)isSubscriptionStatusNetworkDetermined:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self subscriptionDeterminedServices]) == 0;
}

- (BOOL)isCongestedService:(int64_t)a3
{
  return ([(CTStewieState *)self congestedServices] & a3) != 0;
}

- (BOOL)isDemoAllowedForService:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self demoAllowedServices]) == 0;
}

- (BOOL)isPermittedAtCurrentLocation:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self configuredForLocationServices]) == 0;
}

- (BOOL)isOffGridCriteriaSatisfied:(int64_t)a3
{
  return (a3 & ~[(CTStewieState *)self offGridCriteriaSatisfiedServices]) == 0;
}

- (int64_t)statusReasonForService:(int64_t)a3
{
  int64_t result = 0;
  BOOL v6 = (a3 & (a3 - 1)) != 0 && a3 > 0;
  if ((a3 & 0x3F) != 0 && !v6)
  {
    int64_t result = [(CTStewieState *)self status];
    if (result)
    {
      if ([(CTStewieState *)self isAllowedService:a3])
      {
        return 0;
      }
      else if ([(CTStewieState *)self baseReason])
      {
        return [(CTStewieState *)self baseReason];
      }
      else if ([(CTStewieState *)self isPermittedAtCurrentLocation:a3])
      {
        if ([(CTStewieState *)self isSubscribedService:a3])
        {
          if ([(CTStewieState *)self isCongestedService:a3])
          {
            return 10;
          }
          else if ([(CTStewieState *)self isOffGridCriteriaSatisfied:a3])
          {
            return 0;
          }
          else
          {
            return 11;
          }
        }
        else if ([(CTStewieState *)self isSubscriptionStatusNetworkDetermined:a3])
        {
          return 8;
        }
        else
        {
          return 9;
        }
      }
      else
      {
        return 4;
      }
    }
  }
  return result;
}

- (void)setAllowedServices:(int64_t)a3
{
  self->_allowedServices = a3;
}

- (void)setActiveServices:(int64_t)a3
{
  self->_activeServices = a3;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void)setSubscriptionDeterminedServices:(int64_t)a3
{
  self->_subscriptionDeterminedServices = a3;
}

- (void)setSubscribedServices:(int64_t)a3
{
  self->_subscribedServices = a3;
}

- (void)setCongestedServices:(int64_t)a3
{
  self->_congestedServices = a3;
}

- (void)setDataPathAssertedServices:(int64_t)a3
{
  self->_dataPathAssertedServices = a3;
}

- (void)setDemoAllowedServices:(int64_t)a3
{
  self->_demoAllowedServices = a3;
}

- (void)setOffGridCriteriaSatisfiedServices:(int64_t)a3
{
  self->_offGridCriteriaSatisfiedServices = a3;
}

- (void)setConfiguredForLocationServices:(int64_t)a3
{
  self->_configuredForLocationServices = a3;
}

- (void)setBaseReason:(int64_t)a3
{
  self->_baseReason = a3;
}

- (void)setDisplaySatelliteIcon:(BOOL)a3
{
  self->_displaySatelliteIcon = a3;
}

@end