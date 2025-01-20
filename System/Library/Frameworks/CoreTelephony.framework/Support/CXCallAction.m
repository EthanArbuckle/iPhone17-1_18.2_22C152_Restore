@interface CXCallAction
- (BOOL)fail:(const void *)a3;
- (BOOL)fulfill:(dict)a3;
- (BOOL)satisfiedBy:(dict)a3;
- (void)asDictionary:(dict *)a3;
@end

@implementation CXCallAction

- (void)asDictionary:(dict *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CXCallAction;
  -[CXCallAction asDictionary:](&v12, "asDictionary:");
  v5 = [(CXCallAction *)self callUUID];
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
  v7[1] = "kUuid";
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
  v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  v19[0] = a3.fObj.fObj;
  v19[1] = "kUuid";
  sub_100048BAC((uint64_t)v19, &object);
  __p = 0;
  size_t __n = 0;
  uint64_t v26 = 0;
  xpc::dyn_cast_or_default();
  if (SHIBYTE(v26) < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  v4 = [(CXCallAction *)self callUUID];
  sub_100848F68(v4, &__p);
  if (v26 >= 0) {
    size_t v5 = HIBYTE(v26);
  }
  else {
    size_t v5 = __n;
  }
  uint64_t v6 = HIBYTE(v23);
  if (v23 < 0) {
    uint64_t v6 = v22;
  }
  if (v5 != v6)
  {
    BOOL v16 = 0;
    if ((v26 & 0x8000000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
  if (v23 >= 0) {
    v7 = (unsigned __int8 *)&v21;
  }
  else {
    v7 = (unsigned __int8 *)v21;
  }
  if (v26 < 0)
  {
    v17 = __p;
    BOOL v16 = memcmp(__p, v7, __n) == 0;
    goto LABEL_25;
  }
  if (HIBYTE(v26))
  {
    uint64_t v8 = HIBYTE(v26) - 1;
    p_p = &__p;
    do
    {
      int v11 = *(unsigned __int8 *)p_p;
      p_p = (void **)((char *)p_p + 1);
      int v10 = v11;
      int v13 = *v7++;
      int v12 = v13;
      BOOL v15 = v8-- != 0;
      BOOL v16 = v10 == v12;
    }
    while (v10 == v12 && v15);
    if (v26 < 0)
    {
LABEL_23:
      v17 = __p;
LABEL_25:
      operator delete(v17);
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_27:

  if (SHIBYTE(v23) < 0) {
    operator delete(v21);
  }
  return v16;
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
  BOOL v5 = [(CXCallAction *)self satisfiedBy:&object];
  xpc_release(object);
  xpc_object_t object = 0;
  if (v5) {
    [(CXCallAction *)self fulfill];
  }
  return v5;
}

- (BOOL)fail:(const void *)a3
{
  uint64_t v5 = *((unsigned __int8 *)a3 + 23);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *((void *)a3 + 1);
  }
  if (!v5)
  {
    BOOL v19 = 1;
    goto LABEL_30;
  }
  uint64_t v6 = [(CXCallAction *)self callUUID];
  sub_100848F68(v6, &__s1);
  if ((v25 & 0x80u) == 0) {
    size_t v7 = v25;
  }
  else {
    size_t v7 = __n;
  }
  uint64_t v8 = *((unsigned __int8 *)a3 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *((void *)a3 + 1);
  }
  if (v7 == v8)
  {
    if (v9 >= 0) {
      int v10 = (unsigned __int8 *)a3;
    }
    else {
      int v10 = *(unsigned __int8 **)a3;
    }
    if ((v25 & 0x80) != 0)
    {
      v20 = __s1;
      BOOL v19 = memcmp(__s1, v10, __n) == 0;
      goto LABEL_27;
    }
    if (!v25)
    {
      BOOL v19 = 1;
      goto LABEL_29;
    }
    uint64_t v11 = v25 - 1;
    p_s1 = &__s1;
    do
    {
      int v14 = *(unsigned __int8 *)p_s1;
      p_s1 = (void **)((char *)p_s1 + 1);
      int v13 = v14;
      int v16 = *v10++;
      int v15 = v16;
      BOOL v18 = v11-- != 0;
      BOOL v19 = v13 == v15;
    }
    while (v13 == v15 && v18);
  }
  else
  {
    BOOL v19 = 0;
  }
  if ((v25 & 0x80) != 0)
  {
    v20 = __s1;
LABEL_27:
    operator delete(v20);
  }
LABEL_29:

LABEL_30:
  BOOL v21 = +[TelephonyProviderDelegate sActionToType:self] == *((_DWORD *)a3 + 6)
     && v19;
  if (v21) {
    [(CXCallAction *)self fail];
  }
  return v21;
}

@end