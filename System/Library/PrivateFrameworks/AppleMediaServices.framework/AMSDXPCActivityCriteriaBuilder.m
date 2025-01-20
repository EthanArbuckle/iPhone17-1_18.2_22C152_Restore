@interface AMSDXPCActivityCriteriaBuilder
- (AMSDXPCActivityCriteriaBuilder)init;
- (AMSDXPCActivityCriteriaBuilder)initWithCanRunOnBattery:(BOOL)a3 delay:(id)a4 gracePeriod:(double)a5 inexpensiveNetworkConnection:(BOOL)a6 priority:(int64_t)a7 repeating:(BOOL)a8 requiresNetwork:(BOOL)a9;
- (BOOL)canRunOnBattery;
- (BOOL)inexpensiveNetworkConnection;
- (BOOL)repeating;
- (BOOL)requiresNetwork;
- (NSNumber)delay;
- (double)gracePeriod;
- (id)buildXPCObject;
- (int64_t)priority;
- (void)setCanRunOnBattery:(BOOL)a3;
- (void)setDelay:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setInexpensiveNetworkConnection:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRepeating:(BOOL)a3;
- (void)setRequiresNetwork:(BOOL)a3;
@end

@implementation AMSDXPCActivityCriteriaBuilder

- (AMSDXPCActivityCriteriaBuilder)init
{
  return [(AMSDXPCActivityCriteriaBuilder *)self initWithCanRunOnBattery:1 delay:0 gracePeriod:0 inexpensiveNetworkConnection:1 priority:0 repeating:1 requiresNetwork:14400.0];
}

- (AMSDXPCActivityCriteriaBuilder)initWithCanRunOnBattery:(BOOL)a3 delay:(id)a4 gracePeriod:(double)a5 inexpensiveNetworkConnection:(BOOL)a6 priority:(int64_t)a7 repeating:(BOOL)a8 requiresNetwork:(BOOL)a9
{
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AMSDXPCActivityCriteriaBuilder;
  v18 = [(AMSDXPCActivityCriteriaBuilder *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_canRunOnBattery = a3;
    objc_storeStrong((id *)&v18->_delay, a4);
    v19->_gracePeriod = a5;
    v19->_inexpensiveNetworkConnection = a6;
    v19->_priority = a7;
    v19->_repeating = a8;
    v19->_requiresNetwork = a9;
  }

  return v19;
}

- (id)buildXPCObject
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, [(AMSDXPCActivityCriteriaBuilder *)self repeating]);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, [(AMSDXPCActivityCriteriaBuilder *)self canRunOnBattery]);
  [(AMSDXPCActivityCriteriaBuilder *)self gracePeriod];
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)v4);
  int64_t v5 = [(AMSDXPCActivityCriteriaBuilder *)self priority];
  v6 = (const char **)&XPC_ACTIVITY_PRIORITY_UTILITY;
  if (!v5) {
    v6 = (const char **)&XPC_ACTIVITY_PRIORITY_MAINTENANCE;
  }
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, *v6);
  v7 = [(AMSDXPCActivityCriteriaBuilder *)self delay];

  if (v7)
  {
    v8 = [(AMSDXPCActivityCriteriaBuilder *)self delay];
    [v8 doubleValue];
    xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, (uint64_t)v9);
  }
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, [(AMSDXPCActivityCriteriaBuilder *)self requiresNetwork]);
  if ([(AMSDXPCActivityCriteriaBuilder *)self requiresNetwork]) {
    xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, [(AMSDXPCActivityCriteriaBuilder *)self inexpensiveNetworkConnection]);
  }
  return v3;
}

- (BOOL)canRunOnBattery
{
  return self->_canRunOnBattery;
}

- (void)setCanRunOnBattery:(BOOL)a3
{
  self->_canRunOnBattery = a3;
}

- (NSNumber)delay
{
  return self->_delay;
}

- (void)setDelay:(id)a3
{
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (BOOL)inexpensiveNetworkConnection
{
  return self->_inexpensiveNetworkConnection;
}

- (void)setInexpensiveNetworkConnection:(BOOL)a3
{
  self->_inexpensiveNetworkConnection = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (BOOL)requiresNetwork
{
  return self->_requiresNetwork;
}

- (void)setRequiresNetwork:(BOOL)a3
{
  self->_requiresNetwork = a3;
}

- (void).cxx_destruct
{
}

@end