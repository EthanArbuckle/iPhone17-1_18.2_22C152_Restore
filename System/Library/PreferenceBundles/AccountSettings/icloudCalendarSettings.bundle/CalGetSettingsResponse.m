@interface CalGetSettingsResponse
- (BOOL)makoAccount;
- (BOOL)sharedCalendarEmail;
- (CalGetSettingsResponse)initWithDictionary:(id)a3;
- (CalGetSettingsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)emails;
- (id)description;
- (void)setEmails:(id)a3;
- (void)setMakoAccount:(BOOL)a3;
- (void)setSharedCalendarEmail:(BOOL)a3;
@end

@implementation CalGetSettingsResponse

- (CalGetSettingsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CalGetSettingsResponse;
  v4 = [(CalGetSettingsResponse *)&v7 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4
    && [*(id *)&v4->super.AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse] statusCode] == stru_B8.segname)
  {
    return [(CalGetSettingsResponse *)v5 initWithDictionary:*(void *)&v5->super.AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
  }
  return v5;
}

- (CalGetSettingsResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CalGetSettingsResponse;
  v5 = [(CalBaseResponse *)&v25 initWithDictionary:v4];
  v6 = v5;
  if (v4 && v5)
  {
    objc_super v7 = [v4 objectForKeyedSubscript:@"makoAccount"];
    v6->_makoAccount = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"sharedCalendarEmail"];
    v6->_sharedCalendarEmail = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"email"];
    v10 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v15);
          v17 = [CalInviteEmail alloc];
          v18 = -[CalInviteEmail initWithDictionary:](v17, "initWithDictionary:", v16, (void)v21);
          [(NSArray *)v10 addObject:v18];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }

    emails = v6->_emails;
    v6->_emails = v10;
  }
  return v6;
}

- (id)description
{
  v3 = +[NSNumber numberWithBool:[(CalGetSettingsResponse *)self makoAccount]];
  id v4 = +[NSNumber numberWithBool:[(CalGetSettingsResponse *)self sharedCalendarEmail]];
  v5 = [(CalGetSettingsResponse *)self emails];
  v6 = +[NSString stringWithFormat:@"makoAccount => %@, sharedCalendarUpdates => %@ inviteEmailList => %@", v3, v4, v5];

  return v6;
}

- (BOOL)makoAccount
{
  return self->_makoAccount;
}

- (void)setMakoAccount:(BOOL)a3
{
  self->_makoAccount = a3;
}

- (BOOL)sharedCalendarEmail
{
  return self->_sharedCalendarEmail;
}

- (void)setSharedCalendarEmail:(BOOL)a3
{
  self->_sharedCalendarEmail = a3;
}

- (NSArray)emails
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEmails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end