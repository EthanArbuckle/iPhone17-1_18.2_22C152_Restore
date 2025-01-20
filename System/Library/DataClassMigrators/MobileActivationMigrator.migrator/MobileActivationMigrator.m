NSError *createMobileActivationError(uint64_t a1, uint64_t a2, id a3, uint64_t a4, void *a5, void *a6, ...)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSString *v17;
  NSNumber *v18;
  NSError *v19;
  uint64_t vars8;
  va_list va;

  va_start(va, a6);
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = [objc_alloc((Class)NSMutableString) initWithFormat:v13 arguments:va];

  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = v15;
  if (v14) {
    [v15 setObject:v14 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      v17 = +[NSString stringWithUTF8String:a1];
      [v16 setObject:v17 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      v18 = +[NSNumber numberWithUnsignedInt:a2];
      [v16 setObject:v18 forKeyedSubscript:@"SourceLine"];
    }
  }
  v19 = +[NSError errorWithDomain:v11 code:a4 userInfo:v16];

  return v19;
}

uint64_t isRunningInRecovery()
{
  return 0;
}

uint64_t isRunningInRootLaunchdContext()
{
  return 0;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (isRunningInDiagnosticsMode_onceToken != -1) {
    dispatch_once(&isRunningInDiagnosticsMode_onceToken, &__block_literal_global_0);
  }
  return isRunningInDiagnosticsMode_retval;
}

void __isRunningInDiagnosticsMode_block_invoke(id a1)
{
  v1 = (void *)MGCopyAnswer();
  id v2 = isNSNumber(v1);

  if (v2) {
    isRunningInDiagnosticsMode_retval = [v1 BOOLValue];
  }
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t isSupportedDeviceIdentityClient(uint64_t a1, NSError **a2)
{
  if (isSupportedDeviceIdentityClient_onceToken != -1) {
    dispatch_once(&isSupportedDeviceIdentityClient_onceToken, &__block_literal_global_3);
  }
  id v3 = copy_process_name();
  if (!v3)
  {
    v7 = createMobileActivationError((uint64_t)"isSupportedDeviceIdentityClient", 295, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query process name.");
    id v6 = 0;
    if (a2)
    {
LABEL_12:
      v7 = v7;
      uint64_t v8 = 0;
      *a2 = v7;
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  BOOL v4 = is_virtual_machine();
  v5 = &isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  if (!v4) {
    v5 = &isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  }
  id v6 = (id)*v5;
  if (([v6 containsObject:v3] & 1) == 0)
  {
    v7 = createMobileActivationError((uint64_t)"isSupportedDeviceIdentityClient", 302, @"com.apple.MobileActivation.ErrorDomain", -25, 0, @"%@ is not allowed to use this API. File a radar with 'MobileActivation | all' for support.", v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      isSupportedDeviceIdentityClient_cold_1(v7);
      if (a2) {
        goto LABEL_12;
      }
    }
    else if (a2)
    {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v7 = 0;
  uint64_t v8 = 1;
LABEL_15:

  return v8;
}

void __isSupportedDeviceIdentityClient_block_invoke(id a1)
{
  id v1 = (void *)isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  isSupportedDeviceIdentityClient_virtualDeviceSupportedList = (uint64_t)&off_12068;

  id v2 = (void *)isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  isSupportedDeviceIdentityClient_physicalDeviceSupportedList = (uint64_t)&off_12080;
}

id copy_calling_process_name()
{
  return copy_process_name();
}

id copy_current_process_name()
{
  return copy_process_name();
}

id isSupportedRecoveryLogClient(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (isSupportedRecoveryLogClient_onceToken != -1)
  {
    dispatch_once(&isSupportedRecoveryLogClient_onceToken, &__block_literal_global_359);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    id v3 = 0;
    goto LABEL_6;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  id v3 = [(id)isSupportedRecoveryLogClient_supportedList containsObject:v2];
LABEL_6:

  return v3;
}

void __isSupportedRecoveryLogClient_block_invoke(id a1)
{
  id v1 = (void *)isSupportedRecoveryLogClient_supportedList;
  isSupportedRecoveryLogClient_supportedList = (uint64_t)&off_12098;
}

uint64_t isSupportedActivationLockClient(uint64_t a1, NSError **a2)
{
  if (isSupportedActivationLockClient_onceToken != -1) {
    dispatch_once(&isSupportedActivationLockClient_onceToken, &__block_literal_global_391);
  }
  id v3 = copy_process_name();
  if (!v3)
  {
    BOOL v4 = createMobileActivationError((uint64_t)"isSupportedActivationLockClient", 372, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to query process name.");
    if (a2)
    {
LABEL_10:
      BOOL v4 = v4;
      uint64_t v5 = 0;
      *a2 = v4;
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  if (([(id)isSupportedActivationLockClient_supportedList containsObject:v3] & 1) == 0)
  {
    BOOL v4 = createMobileActivationError((uint64_t)"isSupportedActivationLockClient", 377, @"com.apple.MobileActivation.ErrorDomain", -25, 0, @"%@ is not allowed to use this API. File a radar with 'MobileActivation | all' for support.", v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      isSupportedDeviceIdentityClient_cold_1(v4);
      if (a2) {
        goto LABEL_10;
      }
    }
    else if (a2)
    {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  BOOL v4 = 0;
  uint64_t v5 = 1;
LABEL_13:

  return v5;
}

void __isSupportedActivationLockClient_block_invoke(id a1)
{
  id v1 = (void *)isSupportedActivationLockClient_supportedList;
  isSupportedActivationLockClient_supportedList = (uint64_t)&off_120B0;
}

NSArray *copy_sorted_file_list(void *a1)
{
  id v1 = a1;
  id v2 = +[NSFileManager defaultManager];
  id v3 = +[NSURL URLWithString:v1];

  BOOL v4 = +[NSArray arrayWithObject:NSURLCreationDateKey];
  uint64_t v5 = [(NSFileManager *)v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v4 options:4 error:0];

  if (v5 && [(NSArray *)v5 count]) {
    id v6 = [(NSArray *)v5 sortedArrayUsingComparator:&__block_literal_global_399];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

int64_t __copy_sorted_file_list_block_invoke(id a1, id a2, id a3)
{
  id v4 = a3;
  id v15 = 0;
  unsigned int v5 = [a2 getResourceValue:&v15 forKey:NSURLCreationDateKey error:0];
  id v6 = v15;
  if (v5)
  {
    id v14 = 0;
    unsigned int v7 = [v4 getResourceValue:&v14 forKey:NSURLCreationDateKey error:0];
    id v8 = v14;
    if (v7)
    {
      [v6 timeIntervalSince1970];
      double v10 = v9;
      [v8 timeIntervalSince1970];
      if (v10 < v11) {
        int64_t v12 = 1;
      }
      else {
        int64_t v12 = -1;
      }
    }
    else
    {
      int64_t v12 = 0;
    }
  }
  else
  {
    int64_t v12 = 0;
    id v8 = 0;
  }

  return v12;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSArray(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSURL(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSDate(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id dictionary_to_xml(uint64_t a1)
{
  id v1 = +[NSPropertyListSerialization dataWithPropertyList:a1 format:100 options:0 error:0];
  if (v1) {
    id v2 = [objc_alloc((Class)NSString) initWithData:v1 encoding:4];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t store_data(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned int v7 = v6;
  if (!v5 || !v6)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"store_data", 532, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).");
    goto LABEL_11;
  }
  id v8 = +[NSFileManager defaultManager];
  unsigned __int8 v9 = [(NSFileManager *)v8 fileExistsAtPath:v5];

  id v10 = v5;
  int v11 = open_dprotected_np((const char *)[v10 fileSystemRepresentation], 1794, 4, 0);
  if (v11 == -1)
  {
    v21 = __error();
    v26 = strerror(*v21);
    MobileActivationError = createMobileActivationError((uint64_t)"store_data", 541, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create %@: %s", v10, v26);
LABEL_11:
    v19 = MobileActivationError;
    int v12 = -1;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v12 = v11;
  if ((v9 & 1) != 0
    || (id v13 = v10, !chmod((const char *)[v13 fileSystemRepresentation], 0x1B6u)))
  {
    id v17 = v7;
    id v18 = (id)write(v12, [v17 bytes], (size_t)objc_msgSend(v17, "length"));
    if (v18 == [v17 length])
    {
      v19 = 0;
      uint64_t v20 = 1;
LABEL_14:
      close(v12);
      uint64_t v22 = v20;
      goto LABEL_15;
    }
    v24 = __error();
    v27 = strerror(*v24);
    id v15 = createMobileActivationError((uint64_t)"store_data", 554, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to write data to %@: %s", v10, v27);
  }
  else
  {
    id v14 = __error();
    v25 = strerror(*v14);
    id v15 = createMobileActivationError((uint64_t)"store_data", 548, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to update file permissions for %@: %s", v13, v25);
  }
  v19 = v15;
  if (a3) {
LABEL_12:
  }
    *a3 = v19;
LABEL_13:
  uint64_t v20 = 0;
  uint64_t v22 = 0;
  if (v12 != -1) {
    goto LABEL_14;
  }
LABEL_15:

  return v22;
}

uint64_t store_dict(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned int v7 = v6;
  if (!v5 || !v6)
  {
    unsigned __int8 v9 = createMobileActivationError((uint64_t)"store_dict", 583, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input(s).");
    id v8 = 0;
    int v14 = -1;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v29 = 0;
  id v8 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v29];
  unsigned __int8 v9 = (NSError *)v29;
  if (!v8)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"store_dict", 591, @"com.apple.MobileActivation.ErrorDomain", -1, v9, @"Failed to serialize dictionary.");
LABEL_17:
    v24 = MobileActivationError;

    int v14 = -1;
    goto LABEL_20;
  }
  id v10 = +[NSFileManager defaultManager];
  unsigned __int8 v11 = [(NSFileManager *)v10 fileExistsAtPath:v5];

  id v12 = v5;
  int v13 = open_dprotected_np((const char *)[v12 fileSystemRepresentation], 1794, 4, 0);
  if (v13 == -1)
  {
    v23 = __error();
    v27 = strerror(*v23);
    MobileActivationError = createMobileActivationError((uint64_t)"store_dict", 600, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create %@: %s", v12, v27);
    goto LABEL_17;
  }
  int v14 = v13;
  if ((v11 & 1) != 0
    || (id v15 = v12, !chmod((const char *)[v15 fileSystemRepresentation], 0x1B6u)))
  {
    id v8 = v8;
    uint64_t v22 = (void *)write(v14, [(NSData *)v8 bytes], [(NSData *)v8 length]);
    if (v22 == (void *)[(NSData *)v8 length])
    {
      uint64_t v18 = 1;
      goto LABEL_11;
    }
    v25 = __error();
    v28 = strerror(*v25);
    id v17 = createMobileActivationError((uint64_t)"store_dict", 613, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to write data to %@: %s", v12, v28);
  }
  else
  {
    v16 = __error();
    v26 = strerror(*v16);
    id v17 = createMobileActivationError((uint64_t)"store_dict", 607, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to update file permissions for %@: %s", v15, v26);
  }
  v24 = v17;

LABEL_20:
  unsigned __int8 v9 = v24;
  if (a3) {
LABEL_9:
  }
    *a3 = v9;
LABEL_10:
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if (v14 != -1)
  {
LABEL_11:
    close(v14);
    uint64_t v19 = v18;
  }

  return v19;
}

NSMutableDictionary *load_dict(NSMutableDictionary *a1)
{
  if (a1)
  {
    a1 = +[NSMutableDictionary dictionaryWithContentsOfFile:a1];
    uint64_t v1 = vars8;
  }
  return a1;
}

id copy_process_name()
{
  int v0 = __chkstk_darwin();
  bzero(buffer, 0x1000uLL);
  memset(v8, 0, sizeof(v8));
  if (v0
    && (uint64_t v1 = +[NSXPCConnection currentConnection]) != 0)
  {
    id v2 = v1;
    pid_t v3 = [(NSXPCConnection *)v1 processIdentifier];
  }
  else
  {
    pid_t v3 = getpid();
  }
  proc_pidpath(v3, buffer, 0x1000u);
  int v4 = strlen(buffer);
  if ((v4 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v4] == 47) {
        break;
      }
    }
    while (v4-- > 0);
  }
  __strlcpy_chk();
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s", v8);

  return v6;
}

NSInteger numberOfDaysBetweenDates(void *a1, id a2)
{
  id v3 = a2;
  int v4 = v3;
  id v5 = 0;
  id v6 = 0;
  unsigned int v7 = 0;
  NSInteger v8 = 0;
  if (a1 && v3)
  {
    id v9 = a1;
    unsigned int v7 = +[NSCalendar currentCalendar];
    id v16 = 0;
    unsigned int v10 = [(NSCalendar *)v7 rangeOfUnit:16 startDate:&v16 interval:0 forDate:v9];

    id v5 = v16;
    if (v10)
    {
      id v15 = 0;
      unsigned int v11 = [(NSCalendar *)v7 rangeOfUnit:16 startDate:&v15 interval:0 forDate:v4];
      id v6 = v15;
      if (v11)
      {
        id v12 = [(NSCalendar *)v7 components:16 fromDate:v5 toDate:v6 options:0];
        if (v12)
        {
          int v13 = v12;
          NSInteger v8 = [(NSDateComponents *)v12 day];

          goto LABEL_9;
        }
      }
    }
    else
    {
      id v6 = 0;
    }
    NSInteger v8 = 0;
  }
LABEL_9:

  return v8;
}

NSMutableString *formatURLRequest(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableString stringWithString:@"\n---------REQUEST START---------\n"];
  id v3 = [v1 URL];
  id v4 = [v3 description];
  [(NSMutableString *)v2 appendFormat:@"URL: %@\n", v4];

  id v5 = [v1 HTTPMethod];
  [(NSMutableString *)v2 appendFormat:@"METHOD: %@\n", v5];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v1 allHTTPHeaderFields];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v1 valueForHTTPHeaderField:v11];
        [(NSMutableString *)v2 appendFormat:@"%@: %@\n", v11, v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v13 = objc_alloc((Class)NSString);
  id v14 = [v1 HTTPBody];
  id v15 = [v13 initWithData:v14 encoding:4];
  [(NSMutableString *)v2 appendFormat:@"BODY: \n%@\n", v15];

  [(NSMutableString *)v2 appendString:@"----------REQUEST END----------\n"];

  return v2;
}

NSMutableString *formatURLResponse(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = +[NSMutableString stringWithString:@"\n---------RESPONSE START---------\n"];
  id v8 = +[NSHTTPURLResponse localizedStringForStatusCode:a2];
  [(NSMutableString *)v7 appendFormat:@"HTTP Status Code: %ld (%s)\n", a2, [(NSString *)v8 UTF8String]];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [v9 objectForKeyedSubscript:v14];
        [(NSMutableString *)v7 appendFormat:@"%@: %@\n", v14, v15, (void)v18];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v16 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
  [(NSMutableString *)v7 appendFormat:@"BODY: \n%@\n", v16];

  [(NSMutableString *)v7 appendString:@"----------RESPONSE END----------\n"];

  return v7;
}

uint64_t is_erase_installed_build()
{
  if (copyUserDataDisposition_onceToken != -1) {
    dispatch_once(&copyUserDataDisposition_onceToken, &__block_literal_global_1);
  }
  return copyUserDataDisposition_dataDisposition & 1;
}

uint64_t is_upgrade_installed_build()
{
  if (copyUserDataDisposition_onceToken != -1) {
    dispatch_once(&copyUserDataDisposition_onceToken, &__block_literal_global_1);
  }
  return (copyUserDataDisposition_dataDisposition >> 1) & 1;
}

id data_migration_supported()
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  [@"com.apple.mobileactivationd" UTF8String];
  if ((os_variant_is_darwinos() & 1) != 0 || !xpc_user_sessions_enabled()) {
    return 0;
  }
  if (copyUserDataDisposition_onceToken != -1) {
    dispatch_once(&copyUserDataDisposition_onceToken, &__block_literal_global_1);
  }
  if ((copyUserDataDisposition_dataDisposition & 2) == 0) {
    return 0;
  }
  id v1 = +[GestaltHlpr getSharedInstance];
  id v2 = [v1 getBoolAnswer:@"DeviceSupportsMultiUser"];

  return v2;
}

void __copyUserDataDisposition_block_invoke(id a1)
{
  if ((os_variant_is_darwinos() & 1) == 0) {
    copyUserDataDisposition_dataDisposition = DMGetUserDataDisposition();
  }
}

uint64_t mobileactivationErrorHasDomainAndErrorCode(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    do
    {
      id v9 = [v5 domain];
      if ([v9 isEqualToString:v7])
      {
        id v10 = [v5 code];

        if (v10 == a3)
        {
          uint64_t v8 = 1;
          goto LABEL_9;
        }
      }
      else
      {
      }
      id v11 = [v5 userInfo];
      id v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v5 = v12;
    }
    while (v12);
    uint64_t v8 = 0;
  }
LABEL_9:

  return v8;
}

BOOL is_virtual_machine()
{
  int v3 = 0;
  size_t v2 = 4;
  return !sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0) && v3 == 1;
}

void sub_7364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void isSupportedDeviceIdentityClient_cold_1(void *a1)
{
  id v1 = [a1 localizedDescription];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

uint64_t DMGetUserDataDisposition()
{
  return _DMGetUserDataDisposition();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t xpc_user_sessions_enabled()
{
  return _xpc_user_sessions_enabled();
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return [a1 HTTPBody];
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return [a1 HTTPMethod];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHTTPHeaderFields];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_getSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 getSharedInstance];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}