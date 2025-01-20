@interface FAPushMessage
- (ACAccount)appleAccount;
- (ACAccount)gsAccount;
- (BOOL)isValid;
- (FAPushMessage)initWithMessage:(id)a3;
- (FAPushMessage)initWithMessage:(id)a3 accountStore:(id)a4;
- (NSDictionary)payload;
- (NSString)altDSID;
- (NSString)dsid;
- (NSString)event;
- (NSString)topic;
@end

@implementation FAPushMessage

- (FAPushMessage)initWithMessage:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FAPushMessage;
  v8 = [(FAPushMessage *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaultStore, a4);
    uint64_t v10 = [v6 topic];
    topic = v9->_topic;
    v9->_topic = (NSString *)v10;

    uint64_t v12 = [v6 userInfo];
    payload = v9->_payload;
    v9->_payload = (NSDictionary *)v12;

    uint64_t v14 = [(NSDictionary *)v9->_payload objectForKeyedSubscript:@"event"];
    event = v9->_event;
    v9->_event = (NSString *)v14;

    v16 = [(NSDictionary *)v9->_payload objectForKeyedSubscript:@"dsid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:
        uint64_t v19 = [(NSDictionary *)v9->_payload objectForKeyedSubscript:@"adsid"];
        altDSID = v9->_altDSID;
        v9->_altDSID = (NSString *)v19;

        goto LABEL_8;
      }
      v17 = [v16 stringValue];
    }
    dsid = v9->_dsid;
    v9->_dsid = v17;

    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (FAPushMessage)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = +[ACAccountStore defaultStore];
  id v6 = [(FAPushMessage *)self initWithMessage:v4 accountStore:v5];

  return v6;
}

- (ACAccount)appleAccount
{
  if (self->_dsid)
  {
    v2 = -[ACAccountStore aa_appleAccountWithPersonID:](self->_defaultStore, "aa_appleAccountWithPersonID:");
  }
  else if (self->_altDSID)
  {
    v2 = -[ACAccountStore aa_appleAccountWithAltDSID:](self->_defaultStore, "aa_appleAccountWithAltDSID:");
  }
  else
  {
    v2 = 0;
  }
  return (ACAccount *)v2;
}

- (ACAccount)gsAccount
{
  defaultStore = self->_defaultStore;
  v3 = [(FAPushMessage *)self appleAccount];
  id v4 = [(ACAccountStore *)defaultStore aida_accountForiCloudAccount:v3];

  return (ACAccount *)v4;
}

- (BOOL)isValid
{
  if (!self->_topic || !self->_payload || !self->_event || !self->_dsid && !self->_altDSID)
  {
    v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000351C4(v3);
    }
    goto LABEL_11;
  }
  v2 = [(FAPushMessage *)self appleAccount];
  v3 = v2;
  if (!v2)
  {
    id v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100035208();
    }
    goto LABEL_17;
  }
  if (([v2 aa_isAccountClass:AAAccountClassPrimary] & 1) == 0)
  {
    id v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100035278();
    }
LABEL_17:

LABEL_11:
    BOOL v4 = 0;
    goto LABEL_12;
  }
  BOOL v4 = 1;
LABEL_12:

  return v4;
}

- (NSString)topic
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_defaultStore, 0);
}

@end