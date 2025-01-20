@interface CXStartCallAction
- (BOOL)fulfill:(dict)a3;
- (BOOL)satisfiedBy:(dict)a3;
- (void)asDictionary:(dict *)a3;
@end

@implementation CXStartCallAction

- (void)asDictionary:(dict *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CXStartCallAction;
  -[CXStartCallAction asDictionary:](&v34, "asDictionary:");
  v5 = [(CXStartCallAction *)self handle];
  v6 = [v5 value];
  if (v6)
  {
    v7 = [(CXStartCallAction *)self handle];
    v8 = [v7 value];
    id v9 = [v8 length];

    if (v9)
    {
      v10 = [(CXStartCallAction *)self handle];
      id v11 = [v10 value];
      xpc_object_t v32 = xpc_string_create((const char *)[v11 cStringUsingEncoding:4]);
      if (!v32) {
        xpc_object_t v32 = xpc_null_create();
      }
      __p = a3;
      v28 = "kPhoneNumber";
      sub_100035E70((uint64_t)&__p, &v32, &v33);
      xpc_release(v33);
      xpc_object_t v33 = 0;
      xpc_release(v32);
      xpc_object_t v32 = 0;

      goto LABEL_16;
    }
  }
  else
  {
  }
  if ([(CXStartCallAction *)self isVoicemail])
  {
    xpc_object_t v30 = xpc_string_create("kDialVoicemail");
    if (!v30) {
      xpc_object_t v30 = xpc_null_create();
    }
    __p = a3;
    v28 = "kPhoneNumber";
    sub_100035E70((uint64_t)&__p, &v30, &v31);
    xpc_release(v31);
    xpc_object_t v31 = 0;
    xpc_release(v30);
    xpc_object_t v30 = 0;
  }
  else if ([(CXStartCallAction *)self isEmergency])
  {
    __p = 0;
    v28 = 0;
    uint64_t v29 = 0;
    ctu::cf::assign();
    xpc_object_t v25 = xpc_string_create((const char *)&__p);
    if (!v25) {
      xpc_object_t v25 = xpc_null_create();
    }
    v24[0] = a3;
    v24[1] = "kPhoneNumber";
    sub_100035E70((uint64_t)v24, &v25, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_release(v25);
    xpc_object_t v25 = 0;
    if (SHIBYTE(v29) < 0) {
      operator delete(__p);
    }
  }
LABEL_16:
  xpc_object_t v22 = xpc_int64_create([(CXStartCallAction *)self isRelay]);
  if (!v22) {
    xpc_object_t v22 = xpc_null_create();
  }
  __p = a3;
  v28 = "kCallSourceMode";
  sub_100035E70((uint64_t)&__p, &v22, &v23);
  xpc_release(v23);
  xpc_object_t v23 = 0;
  xpc_release(v22);
  xpc_object_t v22 = 0;
  xpc_object_t v20 = xpc_int64_create(+[TelephonyProviderDelegate getTTYType:[(CXStartCallAction *)self ttyType]]);
  if (!v20) {
    xpc_object_t v20 = xpc_null_create();
  }
  __p = a3;
  v28 = "kIsTTY";
  sub_100035E70((uint64_t)&__p, &v20, &v21);
  xpc_release(v21);
  xpc_object_t v21 = 0;
  xpc_release(v20);
  xpc_object_t v20 = 0;
  v12 = [(CXStartCallAction *)self localSenderIdentityUUID];
  +[TelephonyProviderDelegate sSenderIdentityUuidToSimSlot:v12];

  unsigned int v13 = subscriber::simSlotAsInstance();
  xpc_object_t v18 = xpc_int64_create(v13);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  __p = a3;
  v28 = "kCallSimSlot";
  sub_100035E70((uint64_t)&__p, &v18, &v19);
  xpc_release(v19);
  xpc_object_t v19 = 0;
  xpc_release(v18);
  xpc_object_t v18 = 0;
  uint64_t v14 = [(CXStartCallAction *)self localSenderIdentityUUID];
  v15 = (void *)v14;
  if (v14) {
    LOBYTE(v14) = [(CXStartCallAction *)self isEmergency];
  }
  xpc_object_t v16 = xpc_BOOL_create(v14);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  __p = a3;
  v28 = "kIsEmergencyCall";
  sub_100035E70((uint64_t)&__p, &v16, &v17);
  xpc_release(v17);
  xpc_object_t v17 = 0;
  xpc_release(v16);
  xpc_object_t v16 = 0;
}

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v27 = 0;
  v4 = [(CXStartCallAction *)self callUUID];
  sub_100848F68(v4, &__s1);

  __p = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v20[0] = a3.fObj.fObj;
  v20[1] = "kUuid";
  sub_100048BAC((uint64_t)v20, &object);
  fObj = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v30) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  fObj = a3.fObj.fObj;
  uint64_t v29 = "kCallDirectionMobileOriginated";
  sub_100048BAC((uint64_t)&fObj, v20);
  char v6 = xpc::dyn_cast_or_default((xpc *)v20, 0, v5);
  xpc_release(v20[0]);
  fObj = a3.fObj.fObj;
  uint64_t v29 = "kCallStatus";
  sub_100048BAC((uint64_t)&fObj, v20);
  int v8 = xpc::dyn_cast_or_default((xpc *)v20, 0, v7);
  xpc_release(v20[0]);
  BOOL v10 = v8 == 4 || (v8 & 0xFFFFFFFE) == 6;
  uint64_t v11 = HIBYTE(v27);
  char v12 = HIBYTE(v27);
  if (v27 >= 0) {
    size_t v13 = HIBYTE(v27);
  }
  else {
    size_t v13 = __n;
  }
  uint64_t v14 = HIBYTE(v24);
  int v15 = SHIBYTE(v24);
  if (v24 < 0) {
    uint64_t v14 = v23;
  }
  if (v13 != v14) {
    goto LABEL_25;
  }
  if (v24 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (SHIBYTE(v27) < 0)
  {
    if (memcmp(__s1, p_p, __n)) {
      goto LABEL_25;
    }
  }
  else if (HIBYTE(v27))
  {
    p_s1 = &__s1;
    while (*(unsigned __int8 *)p_s1 == *p_p)
    {
      p_s1 = (void **)((char *)p_s1 + 1);
      ++p_p;
      if (!--v11) {
        goto LABEL_28;
      }
    }
LABEL_25:
    BOOL v18 = 0;
    if ((v15 & 0x80000000) == 0) {
      goto LABEL_26;
    }
LABEL_29:
    operator delete(__p);
    if ((v27 & 0x8000000000000000) == 0) {
      return v18;
    }
LABEL_30:
    operator delete(__s1);
    return v18;
  }
LABEL_28:
  BOOL v18 = v6 & v10;
  if (v15 < 0) {
    goto LABEL_29;
  }
LABEL_26:
  if (v12 < 0) {
    goto LABEL_30;
  }
  return v18;
}

- (BOOL)fulfill:(dict)a3
{
  v4 = *(void **)a3.fObj.fObj;
  xpc_object_t object = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  BOOL v5 = [(CXStartCallAction *)self satisfiedBy:&object];
  xpc_release(object);
  xpc_object_t object = 0;
  if (v5)
  {
    char v6 = +[NSDate date];
    [(CXStartCallAction *)self fulfillWithDateStarted:v6];
  }
  return v5;
}

@end