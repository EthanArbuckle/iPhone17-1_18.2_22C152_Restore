@interface IMParentalControlsService
- (BOOL)disableService;
- (BOOL)forceAllowlist;
- (NSSet)allowlist;
- (NSString)name;
- (void)dealloc;
- (void)setAllowlist:(id)a3;
- (void)setDisableService:(BOOL)a3;
- (void)setForceAllowlist:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation IMParentalControlsService

- (BOOL)disableService
{
  return self->_disableService;
}

- (void)setName:(id)a3
{
}

- (void)dealloc
{
  objc_msgSend_setAllowlist_(self, a2, 0, v2);
  objc_msgSend_setName_(self, v4, 0, v5);
  v6.receiver = self;
  v6.super_class = (Class)IMParentalControlsService;
  [(IMParentalControlsService *)&v6 dealloc];
}

- (void)setDisableService:(BOOL)a3
{
  self->_disableService = a3;
}

- (BOOL)forceAllowlist
{
  return self->_forceAllowlist;
}

- (void)setForceAllowlist:(BOOL)a3
{
  self->_forceAllowlist = a3;
}

- (NSSet)allowlist
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllowlist:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_allowlist, 0);
}

@end