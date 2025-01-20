@interface BYODEmailListResult
- (BYODEmailListResult)initWithDictionary:(id)a3;
- (NSArray)emails;
- (NSString)defaultSendFromEmail;
- (void)setDefaultSendFromEmail:(id)a3;
- (void)setEmails:(id)a3;
@end

@implementation BYODEmailListResult

- (BYODEmailListResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODEmailListResult;
  v5 = [(BYODEmailListResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"emails"];
    emails = v5->_emails;
    v5->_emails = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKey:@"defaultSendFromEmail"];
    defaultSendFromEmail = v5->_defaultSendFromEmail;
    v5->_defaultSendFromEmail = (NSString *)v8;
  }
  return v5;
}

- (NSArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
}

- (NSString)defaultSendFromEmail
{
  return self->_defaultSendFromEmail;
}

- (void)setDefaultSendFromEmail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSendFromEmail, 0);

  objc_storeStrong((id *)&self->_emails, 0);
}

@end