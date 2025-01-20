@interface BYODEmail
- (BYODEmail)initWithDictionary:(id)a3;
- (NSString)email;
- (NSString)status;
- (void)setEmail:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation BYODEmail

- (BYODEmail)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODEmail;
  v5 = [(BYODEmail *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"email"];
    email = v5->_email;
    v5->_email = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v8;
  }
  return v5;
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end