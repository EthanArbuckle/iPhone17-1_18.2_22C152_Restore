@interface AFAccount
+ (BOOL)supportsSecureCoding;
- (AFAccount)initWithCoder:(id)a3;
- (AFAccount)initWithMessageDictionary:(id)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)peerSiriEnabled;
- (NSDate)connectionPolicyDate;
- (NSDate)connectionPolicyFirstFailureDate;
- (NSDictionary)connectionPolicy;
- (NSDictionary)lastSyncDates;
- (NSString)aceHost;
- (NSString)assistantIdentifier;
- (NSString)connectionPolicyHostname;
- (NSString)group;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)label;
- (NSString)localeIdentifier;
- (NSString)loggingAssistantIdentifier;
- (NSString)peerAssistantIdentifier;
- (NSString)peerHostname;
- (NSString)peerLanguageCode;
- (NSString)peerLoggingAssistantIdentifier;
- (NSString)peerSpeechIdentifier;
- (NSString)peerUserAgentString;
- (NSString)predefinedServer;
- (NSString)speechIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messageDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setAceHost:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setConnectionPolicyDate:(id)a3;
- (void)setConnectionPolicyFirstFailureDate:(id)a3;
- (void)setConnectionPolicyHostname:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLastSyncDates:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLoggingAssistantIdentifier:(id)a3;
- (void)setPeerAssistantIdentifier:(id)a3;
- (void)setPeerHostname:(id)a3;
- (void)setPeerLanguageCode:(id)a3;
- (void)setPeerLoggingAssistantIdentifier:(id)a3;
- (void)setPeerSiriEnabled:(BOOL)a3;
- (void)setPeerSpeechIdentifier:(id)a3;
- (void)setPeerUserAgentString:(id)a3;
- (void)setPredefinedServer:(id)a3;
- (void)setSpeechIdentifier:(id)a3;
@end

@implementation AFAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPolicyFirstFailureDate, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDates, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_connectionPolicyHostname, 0);
  objc_storeStrong((id *)&self->_connectionPolicyDate, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_predefinedServer, 0);
  objc_storeStrong((id *)&self->_peerHostname, 0);
  objc_storeStrong((id *)&self->_peerLanguageCode, 0);
  objc_storeStrong((id *)&self->_peerUserAgentString, 0);
  objc_storeStrong((id *)&self->_peerSpeechIdentifier, 0);
  objc_storeStrong((id *)&self->_peerLoggingAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_speechIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setConnectionPolicyFirstFailureDate:(id)a3
{
}

- (NSDate)connectionPolicyFirstFailureDate
{
  return self->_connectionPolicyFirstFailureDate;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLastSyncDates:(id)a3
{
}

- (NSDictionary)lastSyncDates
{
  return self->_lastSyncDates;
}

- (void)setGroup:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (void)setConnectionPolicyHostname:(id)a3
{
}

- (NSString)connectionPolicyHostname
{
  return self->_connectionPolicyHostname;
}

- (void)setConnectionPolicyDate:(id)a3
{
}

- (NSDate)connectionPolicyDate
{
  return self->_connectionPolicyDate;
}

- (void)setConnectionPolicy:(id)a3
{
}

- (NSDictionary)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setAceHost:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setPredefinedServer:(id)a3
{
}

- (NSString)predefinedServer
{
  return self->_predefinedServer;
}

- (void)setPeerHostname:(id)a3
{
}

- (NSString)peerHostname
{
  return self->_peerHostname;
}

- (void)setPeerSiriEnabled:(BOOL)a3
{
  self->_peerSiriEnabled = a3;
}

- (BOOL)peerSiriEnabled
{
  return self->_peerSiriEnabled;
}

- (void)setPeerLanguageCode:(id)a3
{
}

- (NSString)peerLanguageCode
{
  return self->_peerLanguageCode;
}

- (void)setPeerUserAgentString:(id)a3
{
}

- (NSString)peerUserAgentString
{
  return self->_peerUserAgentString;
}

- (void)setPeerSpeechIdentifier:(id)a3
{
}

- (NSString)peerSpeechIdentifier
{
  return self->_peerSpeechIdentifier;
}

- (void)setPeerLoggingAssistantIdentifier:(id)a3
{
}

- (NSString)peerLoggingAssistantIdentifier
{
  return self->_peerLoggingAssistantIdentifier;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setHostname:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setSpeechIdentifier:(id)a3
{
}

- (NSString)speechIdentifier
{
  return self->_speechIdentifier;
}

- (void)setLoggingAssistantIdentifier:(id)a3
{
}

- (NSString)loggingAssistantIdentifier
{
  return self->_loggingAssistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 identifier];
    v7 = [(AFAccount *)self identifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 label];
      v9 = [(AFAccount *)self label];
      if ([v8 isEqualToString:v9])
      {
        v10 = [v5 assistantIdentifier];
        v11 = [(AFAccount *)self assistantIdentifier];
        if ([v10 isEqualToString:v11])
        {
          uint64_t v12 = [v5 loggingAssistantIdentifier];
          uint64_t v13 = [(AFAccount *)self loggingAssistantIdentifier];
          v69 = (void *)v12;
          v14 = (void *)v12;
          v15 = (void *)v13;
          if ([v14 isEqualToString:v13])
          {
            v66 = v15;
            v16 = [v5 speechIdentifier];
            v67 = [(AFAccount *)self speechIdentifier];
            v68 = v16;
            if ([v16 isEqualToString:v67])
            {
              v17 = [v5 hostname];
              v64 = [(AFAccount *)self hostname];
              v65 = v17;
              if ([v17 isEqualToString:v64])
              {
                v18 = [v5 peerAssistantIdentifier];
                v62 = [(AFAccount *)self peerAssistantIdentifier];
                v63 = v18;
                if ([v18 isEqualToString:v62])
                {
                  uint64_t v19 = [v5 peerLoggingAssistantIdentifier];
                  uint64_t v20 = [(AFAccount *)self peerLoggingAssistantIdentifier];
                  v61 = (void *)v19;
                  v21 = (void *)v19;
                  v22 = (void *)v20;
                  if ([v21 isEqualToString:v20])
                  {
                    v58 = v22;
                    v23 = [v5 peerSpeechIdentifier];
                    v59 = [(AFAccount *)self peerSpeechIdentifier];
                    v60 = v23;
                    if ([v23 isEqualToString:v59])
                    {
                      uint64_t v24 = [v5 peerUserAgentString];
                      uint64_t v25 = [(AFAccount *)self peerUserAgentString];
                      v57 = (void *)v24;
                      v26 = (void *)v24;
                      v27 = (void *)v25;
                      if ([v26 isEqualToString:v25])
                      {
                        v55 = v27;
                        uint64_t v28 = [v5 predefinedServer];
                        uint64_t v29 = [(AFAccount *)self predefinedServer];
                        v56 = (void *)v28;
                        v30 = (void *)v28;
                        v31 = (void *)v29;
                        if ([v30 isEqualToString:v29])
                        {
                          v54 = [v5 aceHost];
                          v53 = [(AFAccount *)self aceHost];
                          if (objc_msgSend(v54, "isEqualToString:"))
                          {
                            v52 = v31;
                            v32 = [v5 connectionPolicy];
                            v50 = [(AFAccount *)self connectionPolicy];
                            v51 = v32;
                            if (objc_msgSend(v32, "isEqual:"))
                            {
                              v33 = [v5 connectionPolicyDate];
                              v48 = [(AFAccount *)self connectionPolicyDate];
                              v49 = v33;
                              if (objc_msgSend(v33, "isEqual:"))
                              {
                                v34 = [v5 connectionPolicyHostname];
                                v46 = [(AFAccount *)self connectionPolicyHostname];
                                v47 = v34;
                                if (objc_msgSend(v34, "isEqualToString:"))
                                {
                                  v35 = [v5 group];
                                  v44 = [(AFAccount *)self group];
                                  v45 = v35;
                                  if (objc_msgSend(v35, "isEqualToString:"))
                                  {
                                    uint64_t v36 = [v5 lastSyncDates];
                                    uint64_t v37 = [(AFAccount *)self lastSyncDates];
                                    v43 = (void *)v36;
                                    v38 = (void *)v36;
                                    v39 = (void *)v37;
                                    if (objc_msgSend(v38, "isEqual:"))
                                    {
                                      int v42 = [v5 isActive];
                                      int v40 = v42 ^ [(AFAccount *)self isActive] ^ 1;
                                    }
                                    else
                                    {
                                      LOBYTE(v40) = 0;
                                    }
                                  }
                                  else
                                  {
                                    LOBYTE(v40) = 0;
                                  }
                                }
                                else
                                {
                                  LOBYTE(v40) = 0;
                                }
                              }
                              else
                              {
                                LOBYTE(v40) = 0;
                              }
                            }
                            else
                            {
                              LOBYTE(v40) = 0;
                            }

                            v31 = v52;
                          }
                          else
                          {
                            LOBYTE(v40) = 0;
                          }
                        }
                        else
                        {
                          LOBYTE(v40) = 0;
                        }

                        v27 = v55;
                      }
                      else
                      {
                        LOBYTE(v40) = 0;
                      }
                    }
                    else
                    {
                      LOBYTE(v40) = 0;
                    }
                    v22 = v58;
                  }
                  else
                  {
                    LOBYTE(v40) = 0;
                  }
                }
                else
                {
                  LOBYTE(v40) = 0;
                }
                v15 = v66;
              }
              else
              {
                LOBYTE(v40) = 0;
                v15 = v66;
              }
            }
            else
            {
              LOBYTE(v40) = 0;
              v15 = v66;
            }
          }
          else
          {
            LOBYTE(v40) = 0;
          }
        }
        else
        {
          LOBYTE(v40) = 0;
        }
      }
      else
      {
        LOBYTE(v40) = 0;
      }
    }
    else
    {
      LOBYTE(v40) = 0;
    }
  }
  else
  {
    LOBYTE(v40) = 0;
  }

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(AFAccount *)self identifier];
  [v4 setIdentifier:v5];

  v6 = [(AFAccount *)self label];
  [v4 setLabel:v6];

  v7 = [(AFAccount *)self assistantIdentifier];
  [v4 setAssistantIdentifier:v7];

  v8 = [(AFAccount *)self loggingAssistantIdentifier];
  [v4 setLoggingAssistantIdentifier:v8];

  v9 = [(AFAccount *)self speechIdentifier];
  [v4 setSpeechIdentifier:v9];

  v10 = [(AFAccount *)self hostname];
  [v4 setHostname:v10];

  v11 = [(AFAccount *)self peerAssistantIdentifier];
  [v4 setPeerAssistantIdentifier:v11];

  uint64_t v12 = [(AFAccount *)self peerLoggingAssistantIdentifier];
  [v4 setPeerLoggingAssistantIdentifier:v12];

  uint64_t v13 = [(AFAccount *)self peerSpeechIdentifier];
  [v4 setPeerSpeechIdentifier:v13];

  v14 = [(AFAccount *)self peerUserAgentString];
  [v4 setPeerUserAgentString:v14];

  v15 = [(AFAccount *)self predefinedServer];
  [v4 setPredefinedServer:v15];

  v16 = [(AFAccount *)self aceHost];
  [v4 setAceHost:v16];

  v17 = [(AFAccount *)self connectionPolicy];
  [v4 setConnectionPolicy:v17];

  v18 = [(AFAccount *)self connectionPolicyDate];
  [v4 setConnectionPolicyDate:v18];

  uint64_t v19 = [(AFAccount *)self connectionPolicyHostname];
  [v4 setConnectionPolicyHostname:v19];

  uint64_t v20 = [(AFAccount *)self connectionPolicyFirstFailureDate];
  [v4 setConnectionPolicyFirstFailureDate:v20];

  v21 = [(AFAccount *)self group];
  [v4 setGroup:v21];

  v22 = [(AFAccount *)self lastSyncDates];
  [v4 setLastSyncDates:v22];

  v23 = [(AFAccount *)self localeIdentifier];
  [v4 setLocaleIdentifier:v23];

  objc_msgSend(v4, "setIsActive:", -[AFAccount isActive](self, "isActive"));
  return v4;
}

- (AFAccount)initWithCoder:(id)a3
{
  v49[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)AFAccount;
  id v5 = [(AFAccount *)&v48 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_assistantIdentifier"];
    assistantIdentifier = v5->_assistantIdentifier;
    v5->_assistantIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_loggingAssistantIdentifier"];
    loggingAssistantIdentifier = v5->_loggingAssistantIdentifier;
    v5->_loggingAssistantIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechIdentifier"];
    speechIdentifier = v5->_speechIdentifier;
    v5->_speechIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hostname"];
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_peerAssistantIdentifier"];
    peerAssistantIdentifier = v5->_peerAssistantIdentifier;
    v5->_peerAssistantIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_peerLoggingAssistantIdentifier"];
    peerLoggingAssistantIdentifier = v5->_peerLoggingAssistantIdentifier;
    v5->_peerLoggingAssistantIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_peerSpeechIdentifier"];
    peerSpeechIdentifier = v5->_peerSpeechIdentifier;
    v5->_peerSpeechIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_peerUserAgentString"];
    peerUserAgentString = v5->_peerUserAgentString;
    v5->_peerUserAgentString = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_predefinedServer"];
    predefinedServer = v5->_predefinedServer;
    v5->_predefinedServer = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_aceHost"];
    aceHost = v5->_aceHost;
    v5->_aceHost = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v49[2] = objc_opt_class();
    v49[3] = objc_opt_class();
    v49[4] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:5];
    v32 = [v30 setWithArray:v31];
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"kAFAccountInfoConnectionPolicyKey"];
    connectionPolicy = v5->_connectionPolicy;
    v5->_connectionPolicy = (NSDictionary *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_connectionPolicyDate"];
    connectionPolicyDate = v5->_connectionPolicyDate;
    v5->_connectionPolicyDate = (NSDate *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_connectionPolicyHostname"];
    connectionPolicyHostname = v5->_connectionPolicyHostname;
    v5->_connectionPolicyHostname = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_connectionPolicyFirstFailureDate"];
    connectionPolicyFirstFailureDate = v5->_connectionPolicyFirstFailureDate;
    v5->_connectionPolicyFirstFailureDate = (NSDate *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_group"];
    group = v5->_group;
    v5->_group = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastSyncDates"];
    lastSyncDates = v5->_lastSyncDates;
    v5->_lastSyncDates = (NSDictionary *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localeIdentifier"];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v45;

    v5->_isActive = [v4 decodeBoolForKey:@"_isActive"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_label forKey:@"_label"];
  [v5 encodeObject:self->_assistantIdentifier forKey:@"_assistantIdentifier"];
  [v5 encodeObject:self->_loggingAssistantIdentifier forKey:@"_loggingAssistantIdentifier"];
  [v5 encodeObject:self->_speechIdentifier forKey:@"_speechIdentifier"];
  [v5 encodeObject:self->_hostname forKey:@"_hostname"];
  [v5 encodeObject:self->_peerAssistantIdentifier forKey:@"_peerAssistantIdentifier"];
  [v5 encodeObject:self->_peerLoggingAssistantIdentifier forKey:@"_peerLoggingAssistantIdentifier"];
  [v5 encodeObject:self->_peerSpeechIdentifier forKey:@"_peerSpeechIdentifier"];
  [v5 encodeObject:self->_peerUserAgentString forKey:@"_peerUserAgentString"];
  [v5 encodeObject:self->_predefinedServer forKey:@"_predefinedServer"];
  [v5 encodeObject:self->_aceHost forKey:@"_aceHost"];
  [v5 encodeObject:self->_connectionPolicy forKey:@"_connectionPolicy"];
  [v5 encodeObject:self->_connectionPolicyDate forKey:@"_connectionPolicyDate"];
  [v5 encodeObject:self->_connectionPolicyHostname forKey:@"_connectionPolicyHostname"];
  [v5 encodeObject:self->_connectionPolicyFirstFailureDate forKey:@"_connectionPolicyFirstFailureDate"];
  [v5 encodeObject:self->_group forKey:@"_group"];
  [v5 encodeObject:self->_lastSyncDates forKey:@"_lastSyncDates"];
  [v5 encodeObject:self->_localeIdentifier forKey:@"_localeIdentifier"];
  [v5 encodeBool:self->_isActive forKey:@"_isActive"];
}

- (id)messageDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"kAFAccountInfoIdentifierKey"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:@"kAFAccountInfoLabelKey"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"kAFAccountInfoHostnameKey"];
  }
  predefinedServer = self->_predefinedServer;
  if (predefinedServer) {
    [v4 setObject:predefinedServer forKey:@"kAFAccountInfoPredefinedServerKey"];
  }
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    [v4 setObject:assistantIdentifier forKey:@"kAFAccountInfoAssistantIdentifierKey"];
  }
  loggingAssistantIdentifier = self->_loggingAssistantIdentifier;
  if (loggingAssistantIdentifier) {
    [v4 setObject:loggingAssistantIdentifier forKey:@"kAFAccountInfoLoggingAssistantIdentifierKey"];
  }
  speechIdentifier = self->_speechIdentifier;
  if (speechIdentifier) {
    [v4 setObject:speechIdentifier forKey:@"kAFAccountInfoSpeechIdentifierKey"];
  }
  aceHost = self->_aceHost;
  if (aceHost) {
    [v4 setObject:aceHost forKey:@"kAFAccountInfoAceHostKey"];
  }
  peerAssistantIdentifier = self->_peerAssistantIdentifier;
  if (peerAssistantIdentifier) {
    [v4 setObject:peerAssistantIdentifier forKey:@"kAFAccountInfoPeerAssistantIdentifierKey"];
  }
  peerLoggingAssistantIdentifier = self->_peerLoggingAssistantIdentifier;
  if (peerLoggingAssistantIdentifier) {
    [v4 setObject:peerLoggingAssistantIdentifier forKey:@"kAFAccountInfoPeerLoggingAssistantIdentifierKey"];
  }
  peerSpeechIdentifier = self->_peerSpeechIdentifier;
  if (peerSpeechIdentifier) {
    [v4 setObject:peerSpeechIdentifier forKey:@"kAFAccountInfoPeerSpeechIdentifierKey"];
  }
  peerUserAgentString = self->_peerUserAgentString;
  if (peerUserAgentString) {
    [v4 setObject:peerUserAgentString forKey:@"kAFAccountInfoPeerUserAgentStringKey"];
  }
  peerLanguageCode = self->_peerLanguageCode;
  if (peerLanguageCode) {
    [v4 setObject:peerLanguageCode forKey:@"kAFAccountInfoPeerLanguageCodeKey"];
  }
  uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_peerSiriEnabled];
  [v4 setObject:v18 forKey:@"kAFAccountInfoPeerSiriEnabledKey"];

  peerHostname = self->_peerHostname;
  if (peerHostname) {
    [v4 setObject:peerHostname forKey:@"kAFAccountInfoPeerHostnameKey"];
  }
  connectionPolicy = self->_connectionPolicy;
  if (connectionPolicy) {
    [v4 setObject:connectionPolicy forKey:@"kAFAccountInfoConnectionPolicyKey"];
  }
  connectionPolicyDate = self->_connectionPolicyDate;
  if (connectionPolicyDate) {
    [v4 setObject:connectionPolicyDate forKey:@"kAFAccountInfoConnectionPolicyDateKey"];
  }
  connectionPolicyFirstFailureDate = self->_connectionPolicyFirstFailureDate;
  if (connectionPolicyFirstFailureDate) {
    [v4 setObject:connectionPolicyFirstFailureDate forKey:@"kAFAccountConnectionPolicyFirstFailureDate"];
  }
  connectionPolicyHostname = self->_connectionPolicyHostname;
  if (connectionPolicyHostname) {
    [v4 setObject:connectionPolicyHostname forKey:@"kAFAccountInfoConnectionPolicyHostnameKey"];
  }
  group = self->_group;
  if (group) {
    [v4 setObject:group forKey:@"kAFAccountInfoGroupKey"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:@"kAFAccountInfoLocaleIdentifierKey"];
  }
  return v4;
}

- (AFAccount)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(AFAccount *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"kAFAccountInfoIdentifierKey"];
    [(AFAccount *)v5 setIdentifier:v6];

    v7 = [v4 objectForKey:@"kAFAccountInfoLabelKey"];
    [(AFAccount *)v5 setLabel:v7];

    uint64_t v8 = [v4 objectForKey:@"kAFAccountInfoAssistantIdentifierKey"];
    [(AFAccount *)v5 setAssistantIdentifier:v8];

    v9 = [v4 objectForKey:@"kAFAccountInfoLoggingAssistantIdentifierKey"];
    [(AFAccount *)v5 setLoggingAssistantIdentifier:v9];

    uint64_t v10 = [v4 objectForKey:@"kAFAccountInfoSpeechIdentifierKey"];
    [(AFAccount *)v5 setSpeechIdentifier:v10];

    v11 = [v4 objectForKey:@"kAFAccountInfoHostnameKey"];
    [(AFAccount *)v5 setHostname:v11];

    uint64_t v12 = [v4 objectForKey:@"kAFAccountInfoPeerAssistantIdentifierKey"];
    [(AFAccount *)v5 setPeerAssistantIdentifier:v12];

    uint64_t v13 = [v4 objectForKey:@"kAFAccountInfoPeerLoggingAssistantIdentifierKey"];
    [(AFAccount *)v5 setPeerLoggingAssistantIdentifier:v13];

    uint64_t v14 = [v4 objectForKey:@"kAFAccountInfoPeerSpeechIdentifierKey"];
    [(AFAccount *)v5 setPeerSpeechIdentifier:v14];

    v15 = [v4 objectForKey:@"kAFAccountInfoPeerUserAgentStringKey"];
    [(AFAccount *)v5 setPeerUserAgentString:v15];

    uint64_t v16 = [v4 objectForKey:@"kAFAccountInfoPeerLanguageCodeKey"];
    [(AFAccount *)v5 setPeerLanguageCode:v16];

    v17 = [v4 objectForKey:@"kAFAccountInfoPeerSiriEnabledKey"];
    -[AFAccount setPeerSiriEnabled:](v5, "setPeerSiriEnabled:", [v17 BOOLValue]);

    uint64_t v18 = [v4 objectForKey:@"kAFAccountInfoPeerHostnameKey"];
    [(AFAccount *)v5 setPeerHostname:v18];

    uint64_t v19 = [v4 objectForKey:@"kAFAccountInfoPredefinedServerKey"];
    [(AFAccount *)v5 setPredefinedServer:v19];

    uint64_t v20 = [v4 objectForKey:@"kAFAccountInfoAceHostKey"];
    [(AFAccount *)v5 setAceHost:v20];

    v21 = [v4 objectForKey:@"kAFAccountInfoConnectionPolicyKey"];
    [(AFAccount *)v5 setConnectionPolicy:v21];

    uint64_t v22 = [v4 objectForKey:@"kAFAccountInfoConnectionPolicyDateKey"];
    [(AFAccount *)v5 setConnectionPolicyDate:v22];

    v23 = [v4 objectForKey:@"kAFAccountConnectionPolicyFirstFailureDate"];
    [(AFAccount *)v5 setConnectionPolicyFirstFailureDate:v23];

    uint64_t v24 = [v4 objectForKey:@"kAFAccountInfoConnectionPolicyHostnameKey"];
    [(AFAccount *)v5 setConnectionPolicyHostname:v24];

    uint64_t v25 = [v4 objectForKey:@"kAFAccountInfoGroupKey"];
    [(AFAccount *)v5 setGroup:v25];

    uint64_t v26 = [v4 objectForKey:@"kAFAccountInfoLocaleIdentifierKey"];
    [(AFAccount *)v5 setLocaleIdentifier:v26];

    v27 = [v4 objectForKey:@"kAFAccountInfoIsActiveKey"];
    v5->_isActive = [v27 BOOLValue];
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AFAccount;
  v3 = [(AFAccount *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@": %@ { Assistant: %@, Host: %@, Ace Host: %@, Group: %@ }", self->_identifier, self->_assistantIdentifier, self->_hostname, self->_aceHost, self->_group];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end