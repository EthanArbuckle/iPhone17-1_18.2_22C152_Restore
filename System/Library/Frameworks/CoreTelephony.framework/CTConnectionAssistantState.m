@interface CTConnectionAssistantState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmergencyVoiceCallCapable;
- (CTCAConnectionClosedState)connectionClosedState;
- (CTCAConnectionState)connectionState;
- (CTCAConversationState)conversationState;
- (CTCALocationState)locationState;
- (CTCARoadsideConversationState)roadsideConversationState;
- (CTCAServiceIntervals)serviceIntervals;
- (CTCAServicePartners)servicePartners;
- (CTCASilenceInterval)silenceInterval;
- (CTCATarget)currentTarget;
- (CTCATargetVisibility)targetVisibility;
- (CTCATryOutState)tryOutState;
- (CTConnectionAssistantState)initWithCoder:(id)a3;
- (CTStewieState)stewieState;
- (NSArray)backupTargets;
- (NSString)iso3166Alpha3CountryCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)internetInterface;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupTargets:(id)a3;
- (void)setConnectionClosedState:(id)a3;
- (void)setConnectionState:(id)a3;
- (void)setConversationState:(id)a3;
- (void)setCurrentTarget:(id)a3;
- (void)setInternetInterface:(int64_t)a3;
- (void)setIsEmergencyVoiceCallCapable:(BOOL)a3;
- (void)setIso3166Alpha3CountryCode:(id)a3;
- (void)setLocationState:(id)a3;
- (void)setRoadsideConversationState:(id)a3;
- (void)setServiceIntervals:(id)a3;
- (void)setServicePartners:(id)a3;
- (void)setSilenceInterval:(id)a3;
- (void)setStewieState:(id)a3;
- (void)setTargetVisibility:(id)a3;
- (void)setTryOutState:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CTConnectionAssistantState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", version=%llu", -[CTConnectionAssistantState version](self, "version")];
  v4 = [(CTConnectionAssistantState *)self stewieState];
  [v3 appendFormat:@", stewieState=%@", v4];

  unint64_t v5 = [(CTConnectionAssistantState *)self internetInterface];
  if (v5 > 2) {
    v6 = "???";
  }
  else {
    v6 = off_1E5266C80[v5];
  }
  [v3 appendFormat:@", internetInterface=%s", v6];
  v7 = [(CTConnectionAssistantState *)self currentTarget];
  [v3 appendFormat:@", currentTarget=%@", v7];

  v8 = [(CTConnectionAssistantState *)self backupTargets];
  [v3 appendFormat:@", backupTargets=%@", v8];

  v9 = [(CTConnectionAssistantState *)self targetVisibility];
  [v3 appendFormat:@", targetVisibility=%@", v9];

  v10 = [(CTConnectionAssistantState *)self locationState];
  [v3 appendFormat:@", locationState=%@", v10];

  v11 = [(CTConnectionAssistantState *)self serviceIntervals];
  [v3 appendFormat:@", serviceIntervals=%@", v11];

  v12 = [(CTConnectionAssistantState *)self silenceInterval];
  [v3 appendFormat:@", silenceInterval=%@", v12];

  v13 = [(CTConnectionAssistantState *)self connectionState];
  [v3 appendFormat:@", connectionState=%@", v13];

  v14 = [(CTConnectionAssistantState *)self conversationState];
  [v3 appendFormat:@", conversationState=%@", v14];

  v15 = [(CTConnectionAssistantState *)self roadsideConversationState];
  [v3 appendFormat:@", roadsideConversationState=%@", v15];

  v16 = [(CTConnectionAssistantState *)self iso3166Alpha3CountryCode];
  [v3 appendFormat:@", iso3166Alpha3CountryCode=%@", v16];

  v17 = [(CTConnectionAssistantState *)self servicePartners];
  [v3 appendFormat:@", servicePartners=%@", v17];

  v18 = [(CTConnectionAssistantState *)self connectionClosedState];
  [v3 appendFormat:@", connectionClosedState=%@", v18];

  v19 = [(CTConnectionAssistantState *)self tryOutState];
  [v3 appendFormat:@", tryOutState=%@", v19];

  BOOL v20 = [(CTConnectionAssistantState *)self isEmergencyVoiceCallCapable];
  v21 = "no";
  if (v20) {
    v21 = "yes";
  }
  [v3 appendFormat:@", isEmergencyVoiceCallCapable=%s", v21];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setVersion:", -[CTConnectionAssistantState version](self, "version"));
  v6 = [(CTConnectionAssistantState *)self stewieState];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setStewieState:v7];

  objc_msgSend(v5, "setInternetInterface:", -[CTConnectionAssistantState internetInterface](self, "internetInterface"));
  v8 = [(CTConnectionAssistantState *)self currentTarget];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setCurrentTarget:v9];

  v10 = [(CTConnectionAssistantState *)self backupTargets];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setBackupTargets:v11];

  v12 = [(CTConnectionAssistantState *)self targetVisibility];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setTargetVisibility:v13];

  v14 = [(CTConnectionAssistantState *)self locationState];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setLocationState:v15];

  v16 = [(CTConnectionAssistantState *)self serviceIntervals];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setServiceIntervals:v17];

  v18 = [(CTConnectionAssistantState *)self silenceInterval];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSilenceInterval:v19];

  BOOL v20 = [(CTConnectionAssistantState *)self connectionState];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setConnectionState:v21];

  v22 = [(CTConnectionAssistantState *)self conversationState];
  v23 = (void *)[v22 copyWithZone:a3];
  [v5 setConversationState:v23];

  v24 = [(CTConnectionAssistantState *)self roadsideConversationState];
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setRoadsideConversationState:v25];

  v26 = [(CTConnectionAssistantState *)self iso3166Alpha3CountryCode];
  v27 = (void *)[v26 copyWithZone:a3];
  [v5 setIso3166Alpha3CountryCode:v27];

  v28 = [(CTConnectionAssistantState *)self servicePartners];
  v29 = (void *)[v28 copyWithZone:a3];
  [v5 setServicePartners:v29];

  v30 = [(CTConnectionAssistantState *)self connectionClosedState];
  v31 = (void *)[v30 copyWithZone:a3];
  [v5 setConnectionClosedState:v31];

  v32 = [(CTConnectionAssistantState *)self tryOutState];
  v33 = (void *)[v32 copyWithZone:a3];
  [v5 setTryOutState:v33];

  objc_msgSend(v5, "setIsEmergencyVoiceCallCapable:", -[CTConnectionAssistantState isEmergencyVoiceCallCapable](self, "isEmergencyVoiceCallCapable"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CTConnectionAssistantState version](self, "version"));
  [v19 encodeObject:v4 forKey:@"version"];

  unint64_t v5 = [(CTConnectionAssistantState *)self stewieState];
  [v19 encodeObject:v5 forKey:@"stewieState"];

  objc_msgSend(v19, "encodeInteger:forKey:", -[CTConnectionAssistantState internetInterface](self, "internetInterface"), @"internetInterface");
  v6 = [(CTConnectionAssistantState *)self currentTarget];
  [v19 encodeObject:v6 forKey:@"currentTarget"];

  v7 = [(CTConnectionAssistantState *)self backupTargets];
  [v19 encodeObject:v7 forKey:@"backupTargets"];

  v8 = [(CTConnectionAssistantState *)self targetVisibility];
  [v19 encodeObject:v8 forKey:@"targetVisibility"];

  v9 = [(CTConnectionAssistantState *)self locationState];
  [v19 encodeObject:v9 forKey:@"locationState"];

  v10 = [(CTConnectionAssistantState *)self serviceIntervals];
  [v19 encodeObject:v10 forKey:@"serviceIntervals"];

  v11 = [(CTConnectionAssistantState *)self silenceInterval];
  [v19 encodeObject:v11 forKey:@"silenceInterval"];

  v12 = [(CTConnectionAssistantState *)self connectionState];
  [v19 encodeObject:v12 forKey:@"connectionState"];

  v13 = [(CTConnectionAssistantState *)self conversationState];
  [v19 encodeObject:v13 forKey:@"conversationState"];

  v14 = [(CTConnectionAssistantState *)self roadsideConversationState];
  [v19 encodeObject:v14 forKey:@"roadsideConversationState"];

  v15 = [(CTConnectionAssistantState *)self iso3166Alpha3CountryCode];
  [v19 encodeObject:v15 forKey:@"iso3166Alpha3CountryCode"];

  v16 = [(CTConnectionAssistantState *)self servicePartners];
  [v19 encodeObject:v16 forKey:@"servicePartners"];

  v17 = [(CTConnectionAssistantState *)self connectionClosedState];
  [v19 encodeObject:v17 forKey:@"connectionClosedState"];

  objc_msgSend(v19, "encodeBool:forKey:", -[CTConnectionAssistantState isEmergencyVoiceCallCapable](self, "isEmergencyVoiceCallCapable"), @"isEmergencyVoiceCallCapable");
  v18 = [(CTConnectionAssistantState *)self tryOutState];
  [v19 encodeObject:v18 forKey:@"tryOutState"];
}

- (CTConnectionAssistantState)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CTConnectionAssistantState;
  unint64_t v5 = [(CTConnectionAssistantState *)&v39 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    v5->_version = [v6 unsignedLongLongValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stewieState"];
    stewieState = v5->_stewieState;
    v5->_stewieState = (CTStewieState *)v7;

    v5->_internetInterface = [v4 decodeIntegerForKey:@"internetInterface"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentTarget"];
    currentTarget = v5->_currentTarget;
    v5->_currentTarget = (CTCATarget *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"backupTargets"];
    backupTargets = v5->_backupTargets;
    v5->_backupTargets = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetVisibility"];
    targetVisibility = v5->_targetVisibility;
    v5->_targetVisibility = (CTCATargetVisibility *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationState"];
    locationState = v5->_locationState;
    v5->_locationState = (CTCALocationState *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIntervals"];
    serviceIntervals = v5->_serviceIntervals;
    v5->_serviceIntervals = (CTCAServiceIntervals *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"silenceInterval"];
    silenceInterval = v5->_silenceInterval;
    v5->_silenceInterval = (CTCASilenceInterval *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionState"];
    connectionState = v5->_connectionState;
    v5->_connectionState = (CTCAConnectionState *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationState"];
    conversationState = v5->_conversationState;
    v5->_conversationState = (CTCAConversationState *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roadsideConversationState"];
    roadsideConversationState = v5->_roadsideConversationState;
    v5->_roadsideConversationState = (CTCARoadsideConversationState *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iso3166Alpha3CountryCode"];
    iso3166Alpha3CountryCode = v5->_iso3166Alpha3CountryCode;
    v5->_iso3166Alpha3CountryCode = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"servicePartners"];
    servicePartners = v5->_servicePartners;
    v5->_servicePartners = (CTCAServicePartners *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionClosedState"];
    connectionClosedState = v5->_connectionClosedState;
    v5->_connectionClosedState = (CTCAConnectionClosedState *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tryOutState"];
    tryOutState = v5->_tryOutState;
    v5->_tryOutState = (CTCATryOutState *)v36;

    v5->_isEmergencyVoiceCallCapable = [v4 decodeBoolForKey:@"isEmergencyVoiceCallCapable"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (CTStewieState)stewieState
{
  return self->_stewieState;
}

- (void)setStewieState:(id)a3
{
}

- (int64_t)internetInterface
{
  return self->_internetInterface;
}

- (void)setInternetInterface:(int64_t)a3
{
  self->_internetInterface = a3;
}

- (CTCATarget)currentTarget
{
  return self->_currentTarget;
}

- (void)setCurrentTarget:(id)a3
{
}

- (NSArray)backupTargets
{
  return self->_backupTargets;
}

- (void)setBackupTargets:(id)a3
{
}

- (CTCATargetVisibility)targetVisibility
{
  return self->_targetVisibility;
}

- (void)setTargetVisibility:(id)a3
{
}

- (CTCALocationState)locationState
{
  return self->_locationState;
}

- (void)setLocationState:(id)a3
{
}

- (CTCAServiceIntervals)serviceIntervals
{
  return self->_serviceIntervals;
}

- (void)setServiceIntervals:(id)a3
{
}

- (CTCASilenceInterval)silenceInterval
{
  return self->_silenceInterval;
}

- (void)setSilenceInterval:(id)a3
{
}

- (CTCAConnectionState)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(id)a3
{
}

- (CTCAConversationState)conversationState
{
  return self->_conversationState;
}

- (void)setConversationState:(id)a3
{
}

- (CTCARoadsideConversationState)roadsideConversationState
{
  return self->_roadsideConversationState;
}

- (void)setRoadsideConversationState:(id)a3
{
}

- (NSString)iso3166Alpha3CountryCode
{
  return self->_iso3166Alpha3CountryCode;
}

- (void)setIso3166Alpha3CountryCode:(id)a3
{
}

- (CTCAServicePartners)servicePartners
{
  return self->_servicePartners;
}

- (void)setServicePartners:(id)a3
{
}

- (CTCAConnectionClosedState)connectionClosedState
{
  return self->_connectionClosedState;
}

- (void)setConnectionClosedState:(id)a3
{
}

- (CTCATryOutState)tryOutState
{
  return self->_tryOutState;
}

- (void)setTryOutState:(id)a3
{
}

- (BOOL)isEmergencyVoiceCallCapable
{
  return self->_isEmergencyVoiceCallCapable;
}

- (void)setIsEmergencyVoiceCallCapable:(BOOL)a3
{
  self->_isEmergencyVoiceCallCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tryOutState, 0);
  objc_storeStrong((id *)&self->_connectionClosedState, 0);
  objc_storeStrong((id *)&self->_servicePartners, 0);
  objc_storeStrong((id *)&self->_iso3166Alpha3CountryCode, 0);
  objc_storeStrong((id *)&self->_roadsideConversationState, 0);
  objc_storeStrong((id *)&self->_conversationState, 0);
  objc_storeStrong((id *)&self->_connectionState, 0);
  objc_storeStrong((id *)&self->_silenceInterval, 0);
  objc_storeStrong((id *)&self->_serviceIntervals, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_targetVisibility, 0);
  objc_storeStrong((id *)&self->_backupTargets, 0);
  objc_storeStrong((id *)&self->_currentTarget, 0);

  objc_storeStrong((id *)&self->_stewieState, 0);
}

@end