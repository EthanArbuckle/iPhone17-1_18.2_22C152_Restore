@interface AKConsentedApplication
+ (BOOL)supportsSecureCoding;
- (AKAppiTunesMetadata)appiTunesMetadata;
- (AKConsentedApplication)initWithCoder:(id)a3;
- (AKConsentedApplication)initWithResponseInfo:(id)a3;
- (NSArray)scopes;
- (NSDate)creationDate;
- (NSString)clientID;
- (NSString)clientName;
- (NSString)origin;
- (NSString)primaryClientID;
- (NSString)transferState;
- (id)description;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setAppiTunesMetadata:(id)a3;
- (void)setClientID:(id)a3;
- (void)setClientName:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPrimaryClientID:(id)a3;
- (void)setScopes:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTransferState:(id)a3;
@end

@implementation AKConsentedApplication

- (AKConsentedApplication)initWithResponseInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AKConsentedApplication *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"scopes"];
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"client_id"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"client_name"];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v10;

    v5->_state = 2;
    origin = v5->_origin;
    v5->_origin = (NSString *)@"0";

    v13 = [v4 objectForKeyedSubscript:@"credential_state"];

    if (v13)
    {
      v14 = [v4 objectForKey:@"credential_state"];
      v5->_state = [v14 integerValue];
    }
    v15 = [v4 objectForKeyedSubscript:@"transfer_state"];

    if (v15)
    {
      uint64_t v16 = [v4 objectForKey:@"transfer_state"];
      transferState = v5->_transferState;
      v5->_transferState = (NSString *)v16;
    }
    v18 = [v4 objectForKeyedSubscript:@"primary_client_id"];

    if (v18)
    {
      uint64_t v19 = [v4 objectForKey:@"primary_client_id"];
      primaryClientID = v5->_primaryClientID;
      v5->_primaryClientID = (NSString *)v19;
    }
    v21 = [v4 objectForKeyedSubscript:@"origin"];

    if (v21)
    {
      uint64_t v22 = [v4 objectForKey:@"origin"];
      v23 = v5->_origin;
      v5->_origin = (NSString *)v22;
    }
    v24 = [v4 objectForKeyedSubscript:@"consented_date"];

    if (v24)
    {
      v25 = [v4 objectForKey:@"consented_date"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = (void *)MEMORY[0x1E4F1C9C8];
        [v25 doubleValue];
        uint64_t v28 = [v26 dateWithTimeIntervalSince1970:v27 / 1000.0];
        creationDate = v5->_creationDate;
        v5->_creationDate = (NSDate *)v28;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKConsentedApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKConsentedApplication *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"scopes"];
    scopes = v5->_scopes;
    v5->_scopes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client_id"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client_name"];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v13;

    v5->_state = [v4 decodeIntegerForKey:@"credential_state"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transfer_state"];
    transferState = v5->_transferState;
    v5->_transferState = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primary_client_id"];
    primaryClientID = v5->_primaryClientID;
    v5->_primaryClientID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"origin"];
    origin = v5->_origin;
    v5->_origin = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consented_date"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  scopes = self->_scopes;
  id v5 = a3;
  [v5 encodeObject:scopes forKey:@"scopes"];
  [v5 encodeObject:self->_clientID forKey:@"client_id"];
  [v5 encodeObject:self->_clientName forKey:@"client_name"];
  [v5 encodeInteger:self->_state forKey:@"credential_state"];
  [v5 encodeObject:self->_transferState forKey:@"transfer_state"];
  [v5 encodeObject:self->_primaryClientID forKey:@"primary_client_id"];
  [v5 encodeObject:self->_origin forKey:@"origin"];
  [v5 encodeObject:self->_creationDate forKey:@"consented_date"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p {\n\tclientID: %@, \n\tclientName: %@, \n\tscopes: %@, \n\tstate: %li, \n\ttransferState: %@, \n\tprimaryClientID: %@, \n\torigin: %@, \n", objc_opt_class(), self, self->_clientID, self->_clientName, self->_scopes, self->_state, self->_transferState, self->_primaryClientID, self->_origin];
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(id)a3
{
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (NSString)primaryClientID
{
  return self->_primaryClientID;
}

- (void)setPrimaryClientID:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (AKAppiTunesMetadata)appiTunesMetadata
{
  return self->_appiTunesMetadata;
}

- (void)setAppiTunesMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appiTunesMetadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_primaryClientID, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_transferState, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);

  objc_storeStrong((id *)&self->_scopes, 0);
}

@end