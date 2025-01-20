@interface HMDXPCActivityInterface
- (BOOL)setState:(int64_t)a3 forXPCActivity:(id)a4;
- (id)criteriaForXPCActivity:(id)a3;
- (int64_t)stateForXPCActivity:(id)a3;
- (void)registerXPCActivityWithActivityIdentifier:(id)a3 criteria:(id)a4 activityBlock:(id)a5;
- (void)setCriteria:(id)a3 forXPCActivity:(id)a4;
- (void)unregisterXPCActivityWithActivityIdentifier:(id)a3;
@end

@implementation HMDXPCActivityInterface

- (void)unregisterXPCActivityWithActivityIdentifier:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  xpc_activity_unregister(v3);
}

- (int64_t)stateForXPCActivity:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (BOOL)setState:(int64_t)a3 forXPCActivity:(id)a4
{
  return xpc_activity_set_state((xpc_activity_t)a4, a3);
}

- (void)setCriteria:(id)a3 forXPCActivity:(id)a4
{
}

- (id)criteriaForXPCActivity:(id)a3
{
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  return v3;
}

- (void)registerXPCActivityWithActivityIdentifier:(id)a3 criteria:(id)a4 activityBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  xpc_object_t criteria = a4;
  xpc_activity_register((const char *)[v7 UTF8String], criteria, v8);
}

@end