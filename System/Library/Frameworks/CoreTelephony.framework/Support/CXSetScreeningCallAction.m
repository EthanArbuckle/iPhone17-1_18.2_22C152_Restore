@interface CXSetScreeningCallAction
- (BOOL)satisfiedBy:(dict)a3;
@end

@implementation CXSetScreeningCallAction

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v23 = 0;
  v5 = [(CXSetScreeningCallAction *)self callUUID];
  sub_100848F68(v5, &__s1);

  __p = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  v16[0] = a3.fObj.fObj;
  v16[1] = "kUuid";
  sub_100048BAC((uint64_t)v16, &object);
  fObj = 0;
  v25 = 0;
  uint64_t v26 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v26) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  uint64_t v6 = HIBYTE(v23);
  if (v23 >= 0) {
    size_t v7 = HIBYTE(v23);
  }
  else {
    size_t v7 = __n;
  }
  uint64_t v8 = HIBYTE(v20);
  if (v20 < 0) {
    uint64_t v8 = v19;
  }
  if (v7 != v8) {
    goto LABEL_24;
  }
  if (v20 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (v23 < 0)
  {
    if (memcmp(__s1, p_p, __n))
    {
LABEL_24:
      BOOL v14 = 0;
      goto LABEL_25;
    }
  }
  else if (HIBYTE(v23))
  {
    p_s1 = &__s1;
    while (*(unsigned __int8 *)p_s1 == *p_p)
    {
      p_s1 = (void **)((char *)p_s1 + 1);
      ++p_p;
      if (!--v6) {
        goto LABEL_19;
      }
    }
    goto LABEL_24;
  }
LABEL_19:
  if (!xpc_dictionary_get_value(*(xpc_object_t *)a3.fObj.fObj, "kCallSourceMode")) {
    goto LABEL_24;
  }
  if ([(CXSetScreeningCallAction *)self isScreening]) {
    int v11 = 2;
  }
  else {
    int v11 = 0;
  }
  fObj = a3.fObj.fObj;
  v25 = "kCallSourceMode";
  sub_100048BAC((uint64_t)&fObj, v16);
  int v13 = xpc::dyn_cast_or_default((xpc *)v16, 0, v12);
  xpc_release(v16[0]);
  BOOL v14 = v11 == v13;
LABEL_25:
  if (SHIBYTE(v20) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(__s1);
  }
  return v14;
}

@end