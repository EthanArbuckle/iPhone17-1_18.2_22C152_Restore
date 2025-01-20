@interface CXAction
- (BOOL)fail:(const void *)a3;
- (BOOL)fulfill:(dict)a3;
- (BOOL)satisfiedBy:(dict)a3;
- (void)asDictionary:(dict *)a3;
@end

@implementation CXAction

- (void)asDictionary:(dict *)a3
{
  v4 = [(CXAction *)self UUID];
  sub_100848F68(v4, __p);
  if (v8 >= 0) {
    v5 = __p;
  }
  else {
    v5 = (void **)__p[0];
  }
  xpc_object_t object = xpc_string_create((const char *)v5);
  if (!object) {
    xpc_object_t object = xpc_null_create();
  }
  v6[0] = a3;
  v6[1] = "kActionId";
  sub_100035E70((uint64_t)v6, &object, &v10);
  xpc_release(v10);
  xpc_object_t v10 = 0;
  xpc_release(object);
  xpc_object_t object = 0;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)satisfiedBy:(dict)a3
{
  return 1;
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
  BOOL v5 = [(CXAction *)self satisfiedBy:&object];
  xpc_release(object);
  xpc_object_t object = 0;
  if (v5) {
    [(CXAction *)self fulfill];
  }
  return v5;
}

- (BOOL)fail:(const void *)a3
{
  return 1;
}

@end