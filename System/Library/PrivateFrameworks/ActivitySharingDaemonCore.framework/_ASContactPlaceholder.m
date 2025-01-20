@interface _ASContactPlaceholder
- (ASContact)contact;
- (id)token;
- (void)setContact:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation _ASContactPlaceholder

- (id)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (ASContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong(&self->_token, 0);
}

@end