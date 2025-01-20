@interface ANAccountNotification
+ (BOOL)supportsSecureCoding;
- (ANAccountNotification)initWithCoder:(id)a3;
- (ANAccountNotification)initWithDictionaryRepresentation:(id)a3;
- (ANAccountNotification)initWithManagedObject:(id)a3;
- (ANNotificationAction)activateAction;
- (ANNotificationAction)dismissAction;
- (NSDate)date;
- (NSDictionary)userInfo;
- (NSString)accountTypeID;
- (NSString)activateButtonTitle;
- (NSString)callbackMachService;
- (NSString)description;
- (NSString)eventIdentifier;
- (NSString)identifier;
- (NSString)message;
- (NSString)title;
- (id)dictionaryRepresentation;
- (id)initForAccountWithType:(id)a3;
- (int64_t)destinations;
- (int64_t)sectionSubtype;
- (void)encodeWithCoder:(id)a3;
- (void)setActivateAction:(id)a3;
- (void)setActivateButtonTitle:(id)a3;
- (void)setCallbackMachService:(id)a3;
- (void)setDate:(id)a3;
- (void)setDestinations:(int64_t)a3;
- (void)setDismissAction:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSectionSubtype:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation ANAccountNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initForAccountWithType:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANAccountNotification;
  v5 = [(ANAccountNotification *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;
  }
  return v5;
}

- (ANAccountNotification)initWithManagedObject:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ANAccountNotification;
  v5 = [(ANAccountNotification *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 accountTypeID];
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    uint64_t v8 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 callbackMachServiceName];
    callbackMachService = v5->_callbackMachService;
    v5->_callbackMachService = (NSString *)v10;

    uint64_t v12 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v12;

    uint64_t v14 = [v4 message];
    message = v5->_message;
    v5->_message = (NSString *)v14;

    uint64_t v16 = [v4 date];
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    uint64_t v18 = [v4 userInfo];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v18;

    uint64_t v20 = [v4 eventID];
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v20;

    v22 = [v4 activateAction];

    if (v22)
    {
      v23 = [ANNotificationAction alloc];
      v24 = [v4 activateAction];
      uint64_t v25 = [(ANNotificationAction *)v23 initWithManagedObject:v24];
      activateAction = v5->_activateAction;
      v5->_activateAction = (ANNotificationAction *)v25;
    }
    v27 = [v4 dismissAction];

    if (v27)
    {
      v28 = [ANNotificationAction alloc];
      v29 = [v4 dismissAction];
      uint64_t v30 = [(ANNotificationAction *)v28 initWithManagedObject:v29];
      dismissAction = v5->_dismissAction;
      v5->_dismissAction = (ANNotificationAction *)v30;
    }
  }
  v32 = v5;

  return v32;
}

- (ANAccountNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ANAccountNotification;
  v5 = [(ANAccountNotification *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountTypeID"];
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventIdentifier"];
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_message"];
    message = v5->_message;
    v5->_message = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_callbackMachService"];
    callbackMachService = v5->_callbackMachService;
    v5->_callbackMachService = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activateAction"];
    activateAction = v5->_activateAction;
    v5->_activateAction = (ANNotificationAction *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dismissAction"];
    dismissAction = v5->_dismissAction;
    v5->_dismissAction = (ANNotificationAction *)v22;

    v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v31;

    v5->_destinations = [v4 decodeIntegerForKey:@"_destinations"];
    v5->_sectionSubtype = [v4 decodeIntegerForKey:@"_sectionSubtype"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountTypeID = self->_accountTypeID;
  id v5 = a3;
  [v5 encodeObject:accountTypeID forKey:@"_accountTypeID"];
  [v5 encodeObject:self->_eventIdentifier forKey:@"_eventIdentifier"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_message forKey:@"_message"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_date forKey:@"_date"];
  [v5 encodeObject:self->_callbackMachService forKey:@"_callbackMachService"];
  [v5 encodeObject:self->_activateAction forKey:@"_activateAction"];
  [v5 encodeObject:self->_dismissAction forKey:@"_dismissAction"];
  [v5 encodeObject:self->_userInfo forKey:@"_userInfo"];
  [v5 encodeInteger:self->_destinations forKey:@"_destinations"];
  [v5 encodeInteger:self->_sectionSubtype forKey:@"_sectionSubtype"];
}

- (ANAccountNotification)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ANAccountNotification;
  id v5 = [(ANAccountNotification *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"_accountTypeID"];
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"_eventIdentifier"];
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"_message"];
    message = v5->_message;
    v5->_message = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"_callbackMachService"];
    callbackMachService = v5->_callbackMachService;
    v5->_callbackMachService = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"_destinations"];
    v5->_destinations = [v22 integerValue];

    v23 = [v4 objectForKeyedSubscript:@"_sectionSubtype"];
    v5->_sectionSubtype = [v23 integerValue];

    v24 = [v4 objectForKeyedSubscript:@"_activateAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = [[ANNotificationAction alloc] initWithDictionaryRepresentation:v24];
      activateAction = v5->_activateAction;
      v5->_activateAction = v25;
    }
    uint64_t v27 = [v4 objectForKeyedSubscript:@"_dismissAction"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = [[ANNotificationAction alloc] initWithDictionaryRepresentation:v27];
      dismissAction = v5->_dismissAction;
      v5->_dismissAction = v28;
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_accountTypeID forKeyedSubscript:@"_accountTypeID"];
  [v3 setObject:self->_eventIdentifier forKeyedSubscript:@"_eventIdentifier"];
  [v3 setObject:self->_identifier forKeyedSubscript:@"_identifier"];
  [v3 setObject:self->_title forKeyedSubscript:@"_title"];
  [v3 setObject:self->_message forKeyedSubscript:@"_message"];
  [v3 setObject:self->_date forKeyedSubscript:@"_date"];
  [v3 setObject:self->_callbackMachService forKeyedSubscript:@"_callbackMachService"];
  [v3 setObject:self->_userInfo forKeyedSubscript:@"_userInfo"];
  id v4 = [NSNumber numberWithInteger:self->_destinations];
  [v3 setObject:v4 forKeyedSubscript:@"_destinations"];

  id v5 = [NSNumber numberWithInteger:self->_sectionSubtype];
  [v3 setObject:v5 forKeyedSubscript:@"_sectionSubtype"];

  uint64_t v6 = [(ANNotificationAction *)self->_activateAction dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"_activateAction"];

  v7 = [(ANNotificationAction *)self->_dismissAction dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"_dismissAction"];

  uint64_t v8 = (void *)[v3 copy];
  return v8;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%p> {ID: \"%@\", Type: \"%@\", title: \"%@\" }", self, self->_identifier, self->_accountTypeID, self->_title];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accountTypeID
{
  return self->_accountTypeID;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)activateButtonTitle
{
  return self->_activateButtonTitle;
}

- (void)setActivateButtonTitle:(id)a3
{
}

- (ANNotificationAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
}

- (ANNotificationAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (int64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(int64_t)a3
{
  self->_destinations = a3;
}

- (int64_t)sectionSubtype
{
  return self->_sectionSubtype;
}

- (void)setSectionSubtype:(int64_t)a3
{
  self->_sectionSubtype = a3;
}

- (NSString)callbackMachService
{
  return self->_callbackMachService;
}

- (void)setCallbackMachService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackMachService, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_activateButtonTitle, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accountTypeID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithManagedObject:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  int v2 = 62;
  _os_log_error_impl(&dword_221622000, v0, OS_LOG_TYPE_ERROR, "%s (%d) \"NSObjectInaccessibleException caught inside -[ANAccountNotification initWithManagedObject:]\"", v1, 0x12u);
}

@end