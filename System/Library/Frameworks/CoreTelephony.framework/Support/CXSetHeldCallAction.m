@interface CXSetHeldCallAction
- (BOOL)satisfiedBy:(dict)a3;
- (void)asDictionary:(dict *)a3;
@end

@implementation CXSetHeldCallAction

- (void)asDictionary:(dict *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CXSetHeldCallAction;
  -[CXSetHeldCallAction asDictionary:](&v8, "asDictionary:");
  xpc_object_t v6 = xpc_BOOL_create([(CXSetHeldCallAction *)self isOnHold]);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  v5[0] = a3;
  v5[1] = "kOnHold";
  sub_100035E70((uint64_t)v5, &v6, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v6);
}

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v31 = 0;
  v5 = [(CXSetHeldCallAction *)self callUUID];
  sub_100848F68(v5, &__s1);

  __p = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  v24[0] = a3.fObj.fObj;
  v24[1] = "kUuid";
  sub_100048BAC((uint64_t)v24, &object);
  fObj = 0;
  v33 = 0;
  uint64_t v34 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v34) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  fObj = a3.fObj.fObj;
  v33 = "kCallStatus";
  sub_100048BAC((uint64_t)&fObj, v24);
  int v7 = xpc::dyn_cast_or_default((xpc *)v24, 0, v6);
  xpc_release(v24[0]);
  if (v31 >= 0) {
    size_t v8 = HIBYTE(v31);
  }
  else {
    size_t v8 = __n;
  }
  uint64_t v9 = HIBYTE(v28);
  if (v28 < 0) {
    uint64_t v9 = v27;
  }
  if (v8 != v9)
  {
    BOOL v19 = 0;
    if (v7) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  if (v28 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (v31 < 0)
  {
    BOOL v19 = memcmp(__s1, p_p, __n) == 0;
    goto LABEL_24;
  }
  if (HIBYTE(v31))
  {
    uint64_t v11 = HIBYTE(v31) - 1;
    p_s1 = &__s1;
    do
    {
      int v14 = *(unsigned __int8 *)p_s1;
      p_s1 = (void **)((char *)p_s1 + 1);
      int v13 = v14;
      int v16 = *p_p++;
      int v15 = v16;
      BOOL v18 = v11-- != 0;
      BOOL v19 = v13 == v15;
    }
    while (v13 == v15 && v18);
LABEL_24:
    if (v7) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  BOOL v19 = 1;
  if (v7)
  {
LABEL_25:
    if (v7 == 1) {
      LOBYTE(v20) = [(CXSetHeldCallAction *)self isOnHold];
    }
    else {
      LOBYTE(v20) = 0;
    }
    goto LABEL_30;
  }
LABEL_29:
  unsigned int v20 = ![(CXSetHeldCallAction *)self isOnHold];
LABEL_30:
  if (v7 == 6) {
    char v21 = 1;
  }
  else {
    char v21 = v20;
  }
  if (v19) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = 0;
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v31) < 0) {
    operator delete(__s1);
  }
  return v22;
}

@end