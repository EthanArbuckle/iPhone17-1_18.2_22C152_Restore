@interface DOCSourceObserverInfos
- (DOCConfiguration)configuration;
- (DOCSourceObserverToken)token;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation DOCSourceObserverInfos

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setBlock:(id)a3
{
}

- (DOCSourceObserverToken)token
{
  return (DOCSourceObserverToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setToken:(id)a3
{
}

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_block, 0);
}

@end