@interface CNContactListActionAuthorizationContext
- (CNContactListAction)action;
- (int64_t)type;
- (void)setAction:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CNContactListActionAuthorizationContext

- (void).cxx_destruct
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setAction:(id)a3
{
}

- (CNContactListAction)action
{
  return self->_action;
}

@end