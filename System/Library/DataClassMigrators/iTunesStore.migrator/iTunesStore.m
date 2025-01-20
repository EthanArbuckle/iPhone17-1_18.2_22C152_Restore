void sub_5A00(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned char v10[24];

  v2 = a2;
  v3 = [(id)objc_opt_class() _logConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    v5 = v4 | 2;
  }
  else {
    v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  *(_DWORD *)v10 = 138543618;
  *(void *)&v10[4] = objc_opt_class();
  *(_WORD *)&v10[12] = 2114;
  *(void *)&v10[14] = v2;
  v7 = *(id *)&v10[4];
  LODWORD(v9) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16]);
    free(v8);
    SSFileLog();
LABEL_11:
  }
}

void sub_5B9C()
{
  v0 = [(id)objc_opt_class() _logConfig];
  if (!v0)
  {
    v0 = +[SSLogConfig sharedConfig];
  }
  unsigned int v1 = [v0 shouldLog];
  if ([v0 shouldLogToDisk]) {
    int v2 = v1 | 2;
  }
  else {
    int v2 = v1;
  }
  v3 = [v0 OSLogObject];
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    v2 &= 2u;
  }
  if (!v2) {
    goto LABEL_11;
  }
  LODWORD(v7) = 138543362;
  *(void *)((char *)&v7 + 4) = objc_opt_class();
  id v4 = *(id *)((char *)&v7 + 4);
  LODWORD(v6) = 12;
  v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    v3 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v5, 4, &v7, v6, v7);
    free(v5);
    SSFileLog();
LABEL_11:
  }
}

void sub_5D20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v7)
    {
      long long v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v19 = 138544130;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ Error running the device offer registration. error = %{public}@.", (uint8_t *)&v19, 0x2Au);
    }
  }
  +[AMSDefaults setMigratedDeviceOffers:1];
  v12 = +[AMSLogConfig sharedDataMigrationConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    v15 = AMSLogKey();
    v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v17 = +[NSDate date];
    [v17 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v19 = 138544130;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    v22 = v15;
    __int16 v23 = 2114;
    v24 = v16;
    __int16 v25 = 2048;
    id v26 = v18;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ finished. executionTime = %f", (uint8_t *)&v19, 0x2Au);
  }
}

void sub_5FD0(id a1)
{
  id v3 = objc_alloc_init((Class)SSMutableLogConfig);
  [v3 setCategory:@"migrator"];
  [v3 setSubsystem:@"com.apple.itunesstored"];
  id v1 = [v3 copy];
  int v2 = (void *)qword_14538;
  qword_14538 = (uint64_t)v1;
}

NSString *__cdecl sub_7328(id a1, ACAccount *a2)
{
  return (NSString *)[(ACAccount *)a2 hashedDescription];
}

void sub_80A8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (!v8) {
      goto LABEL_22;
    }
    int v18 = 138543362;
    id v19 = (id)objc_opt_class();
    id v10 = v19;
    LODWORD(v17) = 12;
    v11 = (void *)_os_log_send_and_compose_impl();
  }
  else
  {
    id v6 = +[SSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (!v13) {
      goto LABEL_22;
    }
    uint64_t v14 = objc_opt_class();
    v15 = *(void **)(a1 + 40);
    id v16 = v14;
    [v15 hashedDescription];
    int v18 = 138543874;
    id v19 = v14;
    __int16 v20 = 2114;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v22 = 2114;
    id v23 = v5;
    LODWORD(v17) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();
  }
  if (v11)
  {
    uint64_t v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v18, v17);
    free(v11);
    SSFileLog();
LABEL_22:
  }
}

void sub_8BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id a39)
{
}

void sub_8C08(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)uint64_t v14 = 138543618;
      *(void *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2114;
      *(void *)&v14[14] = v5;
      id v11 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      unsigned int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16]);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

void sub_931C(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (a2)
  {
    id v5 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (!v7) {
      goto LABEL_22;
    }
    *(_DWORD *)uint64_t v14 = 138543362;
    *(void *)&v14[4] = objc_opt_class();
    id v9 = *(id *)&v14[4];
    LODWORD(v13) = 12;
  }
  else
  {
    id v5 = +[SSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (!v11) {
      goto LABEL_22;
    }
    *(_DWORD *)uint64_t v14 = 138543618;
    *(void *)&v14[4] = objc_opt_class();
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v4;
    id v9 = *(id *)&v14[4];
    LODWORD(v13) = 22;
  }
  unsigned int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14);
    free(v12);
    SSFileLog();
LABEL_22:
  }
}

void sub_98BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    unsigned int v6 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v6)
    {
      unsigned int v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      unsigned int v10 = objc_opt_class();
      int v11 = *(void **)(a1 + 40);
      id v12 = v10;
      [v11 hashedDescription];
      int v15 = 138543874;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v19 = 2114;
      id v20 = v5;
      LODWORD(v14) = 32;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v15, v14);
      free(v13);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

BOOL sub_A844(id a1, SSAccount *a2)
{
  return [(SSAccount *)a2 isActive] ^ 1;
}

id sub_A864(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive])
  {
    id v4 = [v3 backingAccount];
    id v5 = [v4 identifier];
    unsigned int v6 = [*(id *)(a1 + 32) backingAccount];
    unsigned int v7 = [v6 identifier];
    id v8 = [v5 isEqualToString:v7];
  }
  else
  {
    id v8 = &dword_0 + 1;
  }

  return v8;
}

void sub_A90C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[SSLogConfig sharedAccountsMigrationConfig];
  unsigned int v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      unsigned int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    unsigned int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_22;
    }
    int v11 = objc_opt_class();
    id v12 = *(void **)(a1 + 32);
    id v13 = v11;
    uint64_t v14 = [v12 hashedDescription];
    *(_DWORD *)id v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    LODWORD(v20) = 22;
  }
  else
  {
    if (!v6)
    {
      unsigned int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    unsigned int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_22;
    }
    __int16 v17 = objc_opt_class();
    id v18 = *(void **)(a1 + 32);
    id v13 = v17;
    uint64_t v14 = [v18 hashedDescription];
    *(_DWORD *)id v21 = 138543874;
    *(void *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    *(_WORD *)&v21[22] = 2112;
    id v22 = v5;
    LODWORD(v20) = 32;
  }
  __int16 v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
    free(v19);
    SSFileLog();
LABEL_22:
  }
}

int64_t sub_AFA0(id a1, SSAccount *a2, SSAccount *a3)
{
  id v4 = a3;
  id v5 = [(SSAccount *)a2 backingAccount];
  uint64_t v6 = [(SSAccount *)v4 backingAccount];

  unsigned int v7 = [v5 creationDate];
  unsigned int v8 = [v6 creationDate];
  id v9 = [v7 compare:v8];

  return (int64_t)v9;
}

BOOL sub_B040(id a1, SSAccount *a2)
{
  return [(SSAccount *)a2 isActive];
}

int64_t sub_B544(id a1, SSAccount *a2, SSAccount *a3)
{
  id v4 = a3;
  id v5 = [(SSAccount *)a2 backingAccount];
  uint64_t v6 = [(SSAccount *)v4 backingAccount];

  unsigned int v7 = [v5 creationDate];
  unsigned int v8 = [v6 creationDate];
  id v9 = [v7 compare:v8];

  return (int64_t)v9;
}

BOOL sub_B5E4(id a1, SSAccount *a2)
{
  return [(SSAccount *)a2 isActive];
}

void sub_B5EC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[SSLogConfig sharedAccountsMigrationConfig];
  unsigned int v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      unsigned int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    unsigned int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_22;
    }
    int v11 = objc_opt_class();
    id v12 = *(void **)(a1 + 32);
    id v13 = v11;
    uint64_t v14 = [v12 hashedDescription];
    *(_DWORD *)id v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    LODWORD(v20) = 22;
  }
  else
  {
    if (!v6)
    {
      unsigned int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    unsigned int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (!v16) {
      goto LABEL_22;
    }
    __int16 v17 = objc_opt_class();
    id v18 = *(void **)(a1 + 32);
    id v13 = v17;
    uint64_t v14 = [v18 hashedDescription];
    *(_DWORD *)id v21 = 138543874;
    *(void *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    *(_WORD *)&v21[22] = 2114;
    id v22 = v5;
    LODWORD(v20) = 32;
  }
  __int16 v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
    free(v19);
    SSFileLog();
LABEL_22:
  }
}

NSString *__cdecl sub_BAC8(id a1, SSAccount *a2)
{
  return (NSString *)[(SSAccount *)a2 hashedDescription];
}

void sub_BF64(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    unsigned int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (v7)
    {
      *(_DWORD *)id v12 = 138543618;
      *(void *)&v12[4] = objc_opt_class();
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = v4;
      id v9 = *(id *)&v12[4];
      LODWORD(v11) = 22;
      unsigned int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      unsigned int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
      free(v10);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

uint64_t AMSHashIfNeeded()
{
  return _AMSHashIfNeeded();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t ISWeakLinkedClassForString()
{
  return _ISWeakLinkedClassForString();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SSAccountGetUniqueIdentifierFromValue()
{
  return _SSAccountGetUniqueIdentifierFromValue();
}

uint64_t SSDebugShouldUseAppstored()
{
  return _SSDebugShouldUseAppstored();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

uint64_t SSHashIfNeeded()
{
  return _SSHashIfNeeded();
}

uint64_t SSSafeCast()
{
  return _SSSafeCast();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend__cleanupDuplicateAccounts(void *a1, const char *a2, ...)
{
  return [a1 _cleanupDuplicateAccounts];
}

id objc_msgSend__cleanupFollowUps(void *a1, const char *a2, ...)
{
  return [a1 _cleanupFollowUps];
}

id objc_msgSend__encryptAccountFlags(void *a1, const char *a2, ...)
{
  return [a1 _encryptAccountFlags];
}

id objc_msgSend__isMajorVersionUpdate(void *a1, const char *a2, ...)
{
  return [a1 _isMajorVersionUpdate];
}

id objc_msgSend__logConfig(void *a1, const char *a2, ...)
{
  return [a1 _logConfig];
}

id objc_msgSend__migrateAccountsToAccountsFramework(void *a1, const char *a2, ...)
{
  return [a1 _migrateAccountsToAccountsFramework];
}

id objc_msgSend__migrateSandboxAccounts(void *a1, const char *a2, ...)
{
  return [a1 _migrateSandboxAccounts];
}

id objc_msgSend__postPushToken(void *a1, const char *a2, ...)
{
  return [a1 _postPushToken];
}

id objc_msgSend__repairAccounts(void *a1, const char *a2, ...)
{
  return [a1 _repairAccounts];
}

id objc_msgSend__repairAccountsWithStringDSID(void *a1, const char *a2, ...)
{
  return [a1 _repairAccountsWithStringDSID];
}

id objc_msgSend__repairBrokenAccounts(void *a1, const char *a2, ...)
{
  return [a1 _repairBrokenAccounts];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_backingAccount(void *a1, const char *a2, ...)
{
  return [a1 backingAccount];
}

id objc_msgSend_bagKeySet(void *a1, const char *a2, ...)
{
  return [a1 bagKeySet];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfileVersion];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_didRestoreFromCloudBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromCloudBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return [a1 didUpgrade];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasBrokenDSID(void *a1, const char *a2, ...)
{
  return [a1 hasBrokenDSID];
}

id objc_msgSend_hashedDescription(void *a1, const char *a2, ...)
{
  return [a1 hashedDescription];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isLocalAccount(void *a1, const char *a2, ...)
{
  return [a1 isLocalAccount];
}

id objc_msgSend_isMigrationNeeded(void *a1, const char *a2, ...)
{
  return [a1 isMigrationNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_migrate(void *a1, const char *a2, ...)
{
  return [a1 migrate];
}

id objc_msgSend_migrateToAccountsFramework(void *a1, const char *a2, ...)
{
  return [a1 migrateToAccountsFramework];
}

id objc_msgSend_migratedDeviceOffers(void *a1, const char *a2, ...)
{
  return [a1 migratedDeviceOffers];
}

id objc_msgSend_passwordEquivalentToken(void *a1, const char *a2, ...)
{
  return [a1 passwordEquivalentToken];
}

id objc_msgSend_pendingFollowUps(void *a1, const char *a2, ...)
{
  return [a1 pendingFollowUps];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedAccountsConfig];
}

id objc_msgSend_sharedAccountsMigrationConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedAccountsMigrationConfig];
}

id objc_msgSend_sharedAccountsMigrationConfigOversize(void *a1, const char *a2, ...)
{
  return [a1 sharedAccountsMigrationConfigOversize];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedDataMigrationConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedDataMigrationConfig];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return [a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return [a1 shouldLogToDisk];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}