@interface CXAnswerCallAction
- (BOOL)fulfill:(dict)a3;
- (BOOL)satisfiedBy:(dict)a3;
@end

@implementation CXAnswerCallAction

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v27 = 0;
  v4 = [(CXAnswerCallAction *)self callUUID];
  sub_100848F68(v4, &__s1);

  __p = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v20[0] = a3.fObj.fObj;
  v20[1] = "kUuid";
  sub_100048BAC((uint64_t)v20, &object);
  fObj = 0;
  v29 = 0;
  uint64_t v30 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v30) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  fObj = a3.fObj.fObj;
  v29 = "kCallDirectionMobileOriginated";
  sub_100048BAC((uint64_t)&fObj, v20);
  char v6 = xpc::dyn_cast_or_default((xpc *)v20, 0, v5);
  xpc_release(v20[0]);
  fObj = a3.fObj.fObj;
  v29 = "kCallStatus";
  sub_100048BAC((uint64_t)&fObj, v20);
  int v8 = xpc::dyn_cast_or_default((xpc *)v20, 0, v7);
  xpc_release(v20[0]);
  uint64_t v9 = HIBYTE(v27);
  char v10 = HIBYTE(v27);
  if (v27 >= 0) {
    size_t v11 = HIBYTE(v27);
  }
  else {
    size_t v11 = __n;
  }
  uint64_t v12 = HIBYTE(v24);
  int v13 = SHIBYTE(v24);
  if (v24 < 0) {
    uint64_t v12 = v23;
  }
  if (v11 != v12) {
    goto LABEL_19;
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
      goto LABEL_19;
    }
  }
  else if (HIBYTE(v27))
  {
    p_s1 = &__s1;
    while (*(unsigned __int8 *)p_s1 == *p_p)
    {
      p_s1 = (void **)((char *)p_s1 + 1);
      ++p_p;
      if (!--v9) {
        goto LABEL_22;
      }
    }
LABEL_19:
    char v16 = 0;
    if ((v13 & 0x80000000) == 0) {
      goto LABEL_20;
    }
LABEL_29:
    operator delete(__p);
    if ((v27 & 0x8000000000000000) == 0) {
      return v16;
    }
LABEL_30:
    operator delete(__s1);
    return v16;
  }
LABEL_22:
  if (v8) {
    BOOL v18 = v8 == 6;
  }
  else {
    BOOL v18 = 1;
  }
  char v19 = v18;
  char v16 = v19 & ~v6;
  if (v13 < 0) {
    goto LABEL_29;
  }
LABEL_20:
  if (v10 < 0) {
    goto LABEL_30;
  }
  return v16;
}

- (BOOL)fulfill:(dict)a3
{
  BOOL v5 = *(void **)a3.fObj.fObj;
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  BOOL v6 = [(CXAnswerCallAction *)self satisfiedBy:&object];
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
    [(CXAnswerCallAction *)self fulfillWithDateConnected:v9];
  }
  return v6;
}

@end