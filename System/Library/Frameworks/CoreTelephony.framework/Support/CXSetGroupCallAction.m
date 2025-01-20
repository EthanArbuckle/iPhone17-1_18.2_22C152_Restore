@interface CXSetGroupCallAction
- (BOOL)satisfiedBy:(dict)a3;
- (void)asDictionary:(dict *)a3;
@end

@implementation CXSetGroupCallAction

- (void)asDictionary:(dict *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CXSetGroupCallAction;
  -[CXSetGroupCallAction asDictionary:](&v12, "asDictionary:");
  v5 = [(CXSetGroupCallAction *)self callUUIDToGroupWith];
  sub_100848F68(v5, __p);
  if (v9 >= 0) {
    v6 = __p;
  }
  else {
    v6 = (void **)__p[0];
  }
  xpc_object_t v10 = xpc_string_create((const char *)v6);
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  v7[0] = a3;
  v7[1] = "kUuidToMergeInto";
  sub_100035E70((uint64_t)v7, &v10, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v10);
  xpc_object_t v10 = 0;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)satisfiedBy:(dict)a3
{
  __s1 = 0;
  size_t __n = 0;
  uint64_t v33 = 0;
  v5 = [(CXSetGroupCallAction *)self callUUID];
  sub_100848F68(v5, &__s1);

  v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  v6 = [(CXSetGroupCallAction *)self callUUIDToGroupWith];
  sub_100848F68(v6, &v28);

  __p = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  v23[0] = a3.fObj.fObj;
  v23[1] = "kUuid";
  sub_100048BAC((uint64_t)v23, &object);
  fObj = 0;
  v35 = 0;
  uint64_t v36 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v36) < 0) {
    operator delete(fObj);
  }
  xpc_release(object);
  fObj = a3.fObj.fObj;
  v35 = "kCallStatus";
  sub_100048BAC((uint64_t)&fObj, v23);
  unsigned int v8 = xpc::dyn_cast_or_default((xpc *)v23, 0, v7);
  xpc_release(v23[0]);
  fObj = a3.fObj.fObj;
  v35 = "kIsInMultiParty";
  sub_100048BAC((uint64_t)&fObj, v23);
  char v10 = xpc::dyn_cast_or_default((xpc *)v23, 0, v9);
  xpc_release(v23[0]);
  uint64_t v11 = HIBYTE(v33);
  if (v33 >= 0) {
    size_t v12 = HIBYTE(v33);
  }
  else {
    size_t v12 = __n;
  }
  uint64_t v13 = HIBYTE(v27);
  int v14 = SHIBYTE(v27);
  if (v27 < 0) {
    uint64_t v13 = v26;
  }
  if (v12 != v13)
  {
LABEL_18:
    BOOL v18 = 0;
    LOBYTE(v17) = HIBYTE(v30);
    goto LABEL_29;
  }
  if (v27 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if (v33 < 0)
  {
    int v19 = memcmp(__s1, p_p, __n);
    unsigned int v17 = HIBYTE(v30);
    if (v19)
    {
      BOOL v18 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    if (HIBYTE(v33))
    {
      p_s1 = &__s1;
      while (*(unsigned __int8 *)p_s1 == *p_p)
      {
        p_s1 = (void **)((char *)p_s1 + 1);
        ++p_p;
        if (!--v11) {
          goto LABEL_17;
        }
      }
      goto LABEL_18;
    }
LABEL_17:
    unsigned int v17 = HIBYTE(v30);
  }
  if ((v17 & 0x80u) == 0) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = v29;
  }
  char v21 = v10 ^ (v20 == 0);
  if (v8 >= 2) {
    char v21 = 0;
  }
  if (v8 == 6) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v21;
  }
LABEL_29:
  if (v14 < 0)
  {
    operator delete(__p);
    if ((v30 & 0x8000000000000000) == 0) {
      goto LABEL_31;
    }
  }
  else if ((v17 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  operator delete(v28);
LABEL_31:
  if (SHIBYTE(v33) < 0) {
    operator delete(__s1);
  }
  return v18;
}

@end