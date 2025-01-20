@interface AKAuthenticationContextSanitizer
- (AKAccountManager)accountManager;
- (AKAuthenticationContextSanitizer)init;
- (AKDevice)device;
- (BOOL)_sanitizeContext:(id)a3;
- (BOOL)_validateAppleIDAuthContext:(id)a3;
- (BOOL)_validateAppleIDAuthContext:(id)a3 forAuthMode:(unint64_t)a4;
- (BOOL)_validateAuthContext:(id)a3;
- (BOOL)_validateFederatedAppleIDAuthContext:(id)a3;
- (BOOL)_validateNativeAppleIDAuthContext:(id)a3;
- (BOOL)_validateSilentPreferredFederatedAppleIDAuthContext:(id)a3;
- (BOOL)sanitizeContext:(id)a3;
- (id)_accountForAppleIDAuthContext:(id)a3;
- (void)_annotateTransformationOfProperty:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (void)setAccountManager:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation AKAuthenticationContextSanitizer

- (AKAuthenticationContextSanitizer)init
{
  v11.receiver = self;
  v11.super_class = (Class)AKAuthenticationContextSanitizer;
  v2 = [(AKAuthenticationContextSanitizer *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[AKDevice currentDevice];
    device = v2->_device;
    v2->_device = (AKDevice *)v3;

    uint64_t v5 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.akd.context-validator", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (BOOL)sanitizeContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F3CC;
  block[3] = &unk_1002299B0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (AKAccountManager)accountManager
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10000F910;
  v10 = sub_10000F7D8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F4F4;
  v5[3] = &unk_100228178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AKAccountManager *)v3;
}

- (void)setAccountManager:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F5A0;
  v7[3] = &unk_100226C00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (AKDevice)device
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10000F910;
  v10 = sub_10000F7D8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F69C;
  v5[3] = &unk_100228178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AKDevice *)v3;
}

- (void)setDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F748;
  v7[3] = &unk_100226C00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)_sanitizeContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableDictionary dictionary];
  transformationAnnotations = self->_transformationAnnotations;
  self->_transformationAnnotations = v5;

  BOOL v7 = [(AKAuthenticationContextSanitizer *)self _validateAuthContext:v4];
  id v8 = self->_transformationAnnotations;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007F818;
  v10[3] = &unk_100227D88;
  v10[4] = self;
  [(NSMutableDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v10];
  return v7;
}

- (BOOL)_validateAuthContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Validating authentication context (%@)", (uint8_t *)&v11, 0x16u);
  }

  objc_opt_class();
  id v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  if (!v6)
  {
LABEL_8:
    id v8 = 0;
    goto LABEL_9;
  }
  unsigned int v7 = [(AKAuthenticationContextSanitizer *)self _validateAppleIDAuthContext:v6];
  id v8 = v6;
  if (v7)
  {
LABEL_9:
    BOOL v9 = 1;
    goto LABEL_10;
  }
  BOOL v9 = 0;
  id v8 = v6;
LABEL_10:

  return v9;
}

- (BOOL)_validateAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[AKAuthenticationContextSanitizer _validateAppleIDAuthContext:forAuthMode:](self, "_validateAppleIDAuthContext:forAuthMode:", v4, [v4 authenticationMode]);

  return (char)self;
}

- (BOOL)_validateAppleIDAuthContext:(id)a3 forAuthMode:(unint64_t)a4
{
  id v6 = a3;
  if (!a4) {
    goto LABEL_5;
  }
  if (a4 != 2)
  {
    if (a4 == 1
      && ![(AKAuthenticationContextSanitizer *)self _validateNativeAppleIDAuthContext:v6])
    {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  if ([(AKAuthenticationContextSanitizer *)self _validateFederatedAppleIDAuthContext:v6])
  {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)_validateNativeAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  if ([v4 authenticationType] == (id)3)
  {
    [(AKAuthenticationContextSanitizer *)self _annotateTransformationOfProperty:@"authenticationType" fromValue:@"InteractiveUsernameOnly" toValue:@"Interactive"];
    [v4 setAuthenticationType:2];
  }
  uint64_t v5 = [v4 companionDevice];
  id v6 = [v5 uniqueDeviceIdentifier];
  BOOL v7 = +[AKDevice currentDevice];
  id v8 = [v7 uniqueDeviceIdentifier];
  unsigned int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring companion device and proceeding with silent auth", v12, 2u);
    }

    [v4 setCompanionDevice:0];
  }

  return 1;
}

- (BOOL)_validateFederatedAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authenticationType];
  if (v5 == (id)2)
  {
    [(AKAuthenticationContextSanitizer *)self _annotateTransformationOfProperty:@"authenticationType" fromValue:@"Interactive" toValue:@"InteractiveUsernameOnly"];
    [v4 setAuthenticationType:3];
  }
  else if (!v5 {
         && ![(AKAuthenticationContextSanitizer *)self _validateSilentPreferredFederatedAppleIDAuthContext:v4])
  }
  {
    BOOL v6 = 0;
    goto LABEL_10;
  }
  if ([v4 authenticationType] == (id)3
    && [(AKDevice *)self->_device isMultiUserMode])
  {
    [(AKAuthenticationContextSanitizer *)self _annotateTransformationOfProperty:@"authenticationType" fromValue:@"InteractiveUsernameOnly" toValue:@"Interactive"];
    [v4 setAuthenticationType:2];
  }
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)_validateSilentPreferredFederatedAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthenticationContextSanitizer *)self _accountForAppleIDAuthContext:v4];
  if (!v5
    || ([(AKAccountManager *)self->_accountManager continuationTokenForAccount:v5],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6)
    || ([v4 proxiedDevice], BOOL v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    [(AKAuthenticationContextSanitizer *)self _annotateTransformationOfProperty:@"authenticationType" fromValue:@"SilentPreferred" toValue:@"InteractiveUsernameOnly"];
    [v4 setAuthenticationType:3];
  }

  return 1;
}

- (id)_accountForAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  id v5 = [v4 authKitAccount:&v9];
  id v6 = v9;
  if (v6)
  {
    BOOL v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int v11 = self;
      __int16 v12 = 2112;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve AuthKit account for context (%@) with error: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (void)_annotateTransformationOfProperty:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v8 = a3;
  id v9 = +[NSString stringWithFormat:@"%@ -> %@", a4, a5];
  [(NSMutableDictionary *)self->_transformationAnnotations setObject:v9 forKeyedSubscript:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformationAnnotations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end