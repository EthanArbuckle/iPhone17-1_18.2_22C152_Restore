@interface DADeviceConnectionProfileCommand
- (ASTProfileResult)profile;
- (NSArray)components;
- (id)completion;
- (int64_t)commandType;
- (void)setCompletion:(id)a3;
- (void)setComponents:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation DADeviceConnectionProfileCommand

- (int64_t)commandType
{
  return 2;
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (ASTProfileResult)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
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
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

@end