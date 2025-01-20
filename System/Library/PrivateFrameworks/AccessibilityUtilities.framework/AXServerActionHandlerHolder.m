@interface AXServerActionHandlerHolder
- (NSString)identifier;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AXServerActionHandlerHolder

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end