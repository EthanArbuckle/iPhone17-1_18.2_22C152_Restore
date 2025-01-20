@interface MDMRequestBase
+ (NSString)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)_validateAccessRights:(unint64_t)a3 requiredAccessRights:(unint64_t)a4 error:(id *)a5;
- (BOOL)isRequestAllowedWithError:(id *)a3;
- (BOOL)isUserEnrollment;
- (BOOL)shouldBlockUserSwitch;
- (MDMRequestHandlerProtocol)delegate;
- (id)_notAuthorizedError;
- (unint64_t)accessRights;
- (unint64_t)channelType;
- (void)setAccessRights:(unint64_t)a3;
- (void)setChannelType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserEnrollment:(BOOL)a3;
@end

@implementation MDMRequestBase

+ (NSString)requestType
{
  return (NSString *)&stru_26E549450;
}

+ (unint64_t)requiredAccessRights
{
  return 0;
}

- (BOOL)isRequestAllowedWithError:(id *)a3
{
  if ([(MDMRequestBase *)self isUserEnrollment]
    || (BOOL v5 = -[MDMRequestBase _validateAccessRights:requiredAccessRights:error:](self, "_validateAccessRights:requiredAccessRights:error:", -[MDMRequestBase accessRights](self, "accessRights"), [(id)objc_opt_class() requiredAccessRights], a3)))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)shouldBlockUserSwitch
{
  return 1;
}

- (BOOL)_validateAccessRights:(unint64_t)a3 requiredAccessRights:(unint64_t)a4 error:(id *)a5
{
  unint64_t v6 = a4 & a3;
  if ((a4 & a3) != a4 && a5 != 0)
  {
    *a5 = [(MDMRequestBase *)self _notAuthorizedError];
  }
  return v6 == a4;
}

- (id)_notAuthorizedError
{
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  v4 = DMCErrorArray();
  BOOL v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12007, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (MDMRequestHandlerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MDMRequestHandlerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)accessRights
{
  return self->_accessRights;
}

- (void)setAccessRights:(unint64_t)a3
{
  self->_accessRights = a3;
}

- (BOOL)isUserEnrollment
{
  return self->_isUserEnrollment;
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (void).cxx_destruct
{
}

@end