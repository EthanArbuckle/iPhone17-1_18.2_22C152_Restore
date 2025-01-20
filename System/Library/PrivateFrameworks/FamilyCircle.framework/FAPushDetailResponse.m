@interface FAPushDetailResponse
- (BOOL)_BOOLeanValueOfObject:(id)a3;
- (BOOL)isSuccess;
- (BOOL)showDetailsOption;
- (BOOL)showMessage;
- (FAPushDetailResponse)initWithDictionary:(id)a3;
- (FAPushDetailResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSDictionary)eventDetails;
- (NSString)actionButtonLableText;
- (NSString)childFirstName;
- (NSString)childLastName;
- (NSString)inviteCode;
- (NSString)message;
- (NSString)organizerEmail;
- (NSString)organizerFirstName;
- (NSString)organizerLastName;
- (NSString)otherButtonLabelText;
- (NSString)pushTopic;
- (NSString)title;
- (NSURL)launchURLFromServer;
- (id)description;
- (void)setPushTopic:(id)a3;
@end

@implementation FAPushDetailResponse

- (FAPushDetailResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FAPushDetailResponse;
  v8 = [(FAPushDetailResponse *)&v16 initWithHTTPResponse:a3 data:v7 bodyIsPlist:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a4);
    if (v7)
    {
      id v15 = 0;
      uint64_t v10 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v15];
      id v11 = v15;
      p_super = &v9->_response->super;
      v9->_response = (NSDictionary *)v10;
    }
    else
    {
      id v11 = +[NSError fa_familyErrorWithCode:-1016];
      p_super = _FALogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_100036114(p_super);
      }
    }

    if (v11)
    {
      v13 = _FALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003607C(v11, v13);
      }
    }
  }

  return v9;
}

- (NSDictionary)eventDetails
{
  return self->_response;
}

- (BOOL)isSuccess
{
  v2 = [(NSDictionary *)self->_response objectForKeyedSubscript:@"status"];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 intValue] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)showMessage
{
  v2 = self;
  v3 = [(NSDictionary *)self->_response objectForKeyedSubscript:@"show-message"];
  LOBYTE(v2) = [(FAPushDetailResponse *)v2 _BOOLeanValueOfObject:v3];

  return (char)v2;
}

- (BOOL)showDetailsOption
{
  v2 = self;
  v3 = [(NSDictionary *)self->_response objectForKeyedSubscript:@"show-details-option"];
  LOBYTE(v2) = [(FAPushDetailResponse *)v2 _BOOLeanValueOfObject:v3];

  return (char)v2;
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"display-message-title"];
}

- (NSString)message
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"display-message"];
}

- (NSString)inviteCode
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"invite-code"];
}

- (NSString)organizerFirstName
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"organizer-first-name"];
}

- (NSString)organizerLastName
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"organizer-last-name"];
}

- (NSString)childFirstName
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"child-first-name"];
}

- (NSString)childLastName
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"child-last-name"];
}

- (NSString)organizerEmail
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"inviter-email"];
}

- (NSString)actionButtonLableText
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"action-button-label"];
}

- (NSString)otherButtonLabelText
{
  return (NSString *)[(NSDictionary *)self->_response objectForKeyedSubscript:@"other-button-label"];
}

- (NSURL)launchURLFromServer
{
  v2 = [(NSDictionary *)self->_response objectForKeyedSubscript:@"launchURL"];
  if (v2)
  {
    v3 = +[NSURLComponents componentsWithString:v2];
    BOOL v4 = [v3 scheme];
    unsigned int v5 = [&off_100050828 containsObject:v4];

    if (v5)
    {
      v6 = [v3 URL];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSString) initWithData:self->_data encoding:4];
  BOOL v4 = +[NSString stringWithFormat:@"FAPushDetailResponse - status: (%lu), body: (%@)", [(FAPushDetailResponse *)self statusCode], v3];

  return v4;
}

- (BOOL)_BOOLeanValueOfObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (FAPushDetailResponse)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAPushDetailResponse;
  v6 = [(FAPushDetailResponse *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end