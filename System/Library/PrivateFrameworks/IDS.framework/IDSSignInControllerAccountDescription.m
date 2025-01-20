@interface IDSSignInControllerAccountDescription
- (NSNumber)state;
- (NSString)serviceName;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setState:(id)a3;
@end

@implementation IDSSignInControllerAccountDescription

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end