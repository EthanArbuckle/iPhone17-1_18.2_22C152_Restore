@interface CXSetTTYTypeCallAction
- (BOOL)satisfiedBy:(dict)a3;
@end

@implementation CXSetTTYTypeCallAction

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v28 = 0;
  v4 = [(CXSetTTYTypeCallAction *)self callUUID];
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
  v30 = "kTextStreamToken";
  v21[0] = 0;
  BOOL v5 = sub_100706E38((uint64_t)&fObj);
  char v6 = HIBYTE(v28);
  if (v28 >= 0) {
    size_t v7 = HIBYTE(v28);
  }
  else {
    size_t v7 = __n;
  }
  uint64_t v8 = HIBYTE(v25);
  int v9 = SHIBYTE(v25);
  if (v25 < 0) {
    uint64_t v8 = v24;
  }
  if (v7 != v8)
  {
    BOOL v19 = 0;
    if ((SHIBYTE(v25) & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  if (v25 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (SHIBYTE(v28) < 0)
  {
    BOOL v19 = memcmp(__s1, p_p, __n) == 0;
    goto LABEL_24;
  }
  if (HIBYTE(v28))
  {
    uint64_t v11 = HIBYTE(v28) - 1;
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
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_25;
    }
LABEL_28:
    operator delete(__p);
    if ((v28 & 0x8000000000000000) == 0) {
      return v19 && !v5;
    }
LABEL_29:
    operator delete(__s1);
    return v19 && !v5;
  }
  BOOL v19 = 1;
  if (SHIBYTE(v25) < 0) {
    goto LABEL_28;
  }
LABEL_25:
  if (v6 < 0) {
    goto LABEL_29;
  }
  return v19 && !v5;
}

@end