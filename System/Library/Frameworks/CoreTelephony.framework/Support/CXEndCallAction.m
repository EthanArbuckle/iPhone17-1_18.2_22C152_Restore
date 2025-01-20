@interface CXEndCallAction
- (BOOL)fulfill:(dict)a3;
- (BOOL)satisfiedBy:(dict)a3;
@end

@implementation CXEndCallAction

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v29 = 0;
  v4 = [(CXEndCallAction *)self callUUID];
  sub_100848F68(v4, &__s1);

  __p = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  v22[0] = a3.fObj.fObj;
  v22[1] = "kUuid";
  sub_100048BAC((uint64_t)v22, &object);
  fObj = 0;
  v31 = 0;
  uint64_t v32 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v32) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  fObj = a3.fObj.fObj;
  v31 = "kCallStatus";
  sub_100048BAC((uint64_t)&fObj, v22);
  int v6 = xpc::dyn_cast_or_default((xpc *)v22, 0, v5);
  xpc_release(v22[0]);
  char v7 = HIBYTE(v29);
  if (v29 >= 0) {
    size_t v8 = HIBYTE(v29);
  }
  else {
    size_t v8 = __n;
  }
  uint64_t v9 = HIBYTE(v26);
  int v10 = SHIBYTE(v26);
  if (v26 < 0) {
    uint64_t v9 = v25;
  }
  if (v8 != v9)
  {
    BOOL v20 = 0;
    if ((SHIBYTE(v26) & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_30;
  }
  if (v26 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (SHIBYTE(v29) < 0)
  {
    BOOL v20 = memcmp(__s1, p_p, __n) == 0;
    goto LABEL_24;
  }
  if (HIBYTE(v29))
  {
    uint64_t v12 = HIBYTE(v29) - 1;
    p_s1 = &__s1;
    do
    {
      int v15 = *(unsigned __int8 *)p_s1;
      p_s1 = (void **)((char *)p_s1 + 1);
      int v14 = v15;
      int v17 = *p_p++;
      int v16 = v17;
      BOOL v19 = v12-- != 0;
      BOOL v20 = v14 == v16;
    }
    while (v14 == v16 && v19);
LABEL_24:
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_25;
    }
LABEL_30:
    operator delete(__p);
    if ((v29 & 0x8000000000000000) == 0) {
      return v6 == 6 && v20;
    }
    goto LABEL_31;
  }
  BOOL v20 = 1;
  if (SHIBYTE(v26) < 0) {
    goto LABEL_30;
  }
LABEL_25:
  if ((v7 & 0x80) == 0) {
    return v6 == 6 && v20;
  }
LABEL_31:
  operator delete(__s1);
  return v6 == 6 && v20;
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
  BOOL v5 = [(CXEndCallAction *)self satisfiedBy:&object];
  xpc_release(object);
  xpc_object_t object = 0;
  if (v5)
  {
    int v6 = +[NSDate date];
    [(CXEndCallAction *)self fulfillWithDateEnded:v6];
  }
  return v5;
}

@end