@interface CXPullCallAction
- (BOOL)fulfill:(dict)a3;
- (BOOL)satisfiedBy:(dict)a3;
@end

@implementation CXPullCallAction

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v28 = 0;
  v4 = [(CXPullCallAction *)self callUUID];
  sub_100848F68(v4, &__s1);

  __p = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  v21[0] = a3.fObj.fObj;
  v21[1] = "kUuid";
  sub_100048BAC((uint64_t)v21, &object);
  fObj = 0;
  v30 = 0;
  uint64_t v31 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v31) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  fObj = a3.fObj.fObj;
  v30 = "kCallStatus";
  sub_100048BAC((uint64_t)&fObj, v21);
  int v6 = xpc::dyn_cast_or_default((xpc *)v21, 0, v5);
  xpc_release(v21[0]);
  fObj = a3.fObj.fObj;
  v30 = "kIsThumperCall";
  sub_100048BAC((uint64_t)&fObj, v21);
  unsigned __int8 v8 = xpc::dyn_cast_or_default((xpc *)v21, 0, v7);
  xpc_release(v21[0]);
  uint64_t v9 = HIBYTE(v28);
  char v10 = HIBYTE(v28);
  if (v28 >= 0) {
    size_t v11 = HIBYTE(v28);
  }
  else {
    size_t v11 = __n;
  }
  uint64_t v12 = HIBYTE(v25);
  int v13 = SHIBYTE(v25);
  if (v25 < 0) {
    uint64_t v12 = v24;
  }
  if (v11 != v12) {
    goto LABEL_18;
  }
  if (v25 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (SHIBYTE(v28) < 0)
  {
    LOBYTE(v9) = memcmp(__s1, p_p, __n) != 0;
  }
  else
  {
    if (HIBYTE(v28))
    {
      p_s1 = &__s1;
      while (*(unsigned __int8 *)p_s1 == *p_p)
      {
        p_s1 = (void **)((char *)p_s1 + 1);
        ++p_p;
        if (!--v9) {
          goto LABEL_25;
        }
      }
LABEL_18:
      BOOL v16 = 0;
      if ((SHIBYTE(v25) & 0x80000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    LOBYTE(v9) = 0;
  }
LABEL_25:
  if (v6) {
    BOOL v18 = v6 == 6;
  }
  else {
    BOOL v18 = 1;
  }
  char v19 = v18;
  if ((v8 ^ 1)) {
    char v20 = 0;
  }
  else {
    char v20 = v19;
  }
  if (v9) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v20;
  }
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_20;
  }
LABEL_19:
  operator delete(__p);
  char v10 = HIBYTE(v28);
LABEL_20:
  if (v10 < 0) {
    operator delete(__s1);
  }
  return v16;
}

- (BOOL)fulfill:(dict)a3
{
  uint64_t v5 = *(void **)a3.fObj.fObj;
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  BOOL v6 = [(CXPullCallAction *)self satisfiedBy:&object];
  xpc_release(object);
  xpc_object_t object = 0;
  if (v6)
  {
    v11[0] = a3.fObj.fObj;
    v11[1] = "kCallStartTime";
    sub_100048BAC((uint64_t)v11, &v12);
    uint64_t v8 = xpc::dyn_cast_or_default((xpc *)&v12, 0, v7);
    xpc_release(v12);
    uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:(double)v8];
    [(CXPullCallAction *)self fulfillWithDateConnected:v9];
  }
  return v6;
}

@end