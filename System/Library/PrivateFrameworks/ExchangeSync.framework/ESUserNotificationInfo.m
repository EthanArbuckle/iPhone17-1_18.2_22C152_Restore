@interface ESUserNotificationInfo
- (NSString)groupIdentifier;
- (id)handler;
- (void)setGroupIdentifier:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation ESUserNotificationInfo

- (void)setHandler:(id)a3
{
  if (self->_handler != a3)
  {
    self->_handler = (id)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (id)handler
{
  v2 = (void *)MEMORY[0x23ECA4FC0](self->_handler, a2);
  return v2;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end