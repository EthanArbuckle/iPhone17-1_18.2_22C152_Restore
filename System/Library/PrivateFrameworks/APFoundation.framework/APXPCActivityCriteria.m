@interface APXPCActivityCriteria
- (APXPCActivityCriteria)init;
- (BOOL)allowBattery;
- (BOOL)isCPUIntensive;
- (BOOL)isDiskIntensive;
- (BOOL)isRepeating;
- (BOOL)requireBuddyComplete;
- (BOOL)requireClassCData;
- (BOOL)requireSleep;
- (BOOL)requiresNetworkConnectivity;
- (NSDictionary)customProperties;
- (const)priority;
- (double)scheduledTime;
- (id)translateCriteria;
- (int64_t)delay;
- (int64_t)firstRunInterval;
- (int64_t)gracePeriod;
- (int64_t)interval;
- (void)setAllowBattery:(BOOL)a3;
- (void)setCustomProperties:(id)a3;
- (void)setDelay:(int64_t)a3;
- (void)setFirstRunInterval:(int64_t)a3;
- (void)setGracePeriod:(int64_t)a3;
- (void)setInterval:(int64_t)a3;
- (void)setIsCPUIntensive:(BOOL)a3;
- (void)setIsDiskIntensive:(BOOL)a3;
- (void)setIsRepeating:(BOOL)a3;
- (void)setPriority:(const char *)a3;
- (void)setRequireBuddyComplete:(BOOL)a3;
- (void)setRequireClassCData:(BOOL)a3;
- (void)setRequireSleep:(BOOL)a3;
- (void)setRequiresNetworkConnectivity:(BOOL)a3;
- (void)setScheduledTime:(double)a3;
@end

@implementation APXPCActivityCriteria

- (APXPCActivityCriteria)init
{
  v4.receiver = self;
  v4.super_class = (Class)APXPCActivityCriteria;
  result = [(APXPCActivityCriteria *)&v4 init];
  if (result)
  {
    result->_requiresNetworkConnectivity = 1;
    v3 = (const char *)*MEMORY[0x1E4F142D0];
    result->_gracePeriod = *MEMORY[0x1E4F14200];
    result->_priority = v3;
    *(_WORD *)&result->_requireClassCData = 257;
    result->_scheduledTime = NAN;
  }
  return result;
}

- (id)translateCriteria
{
  v2 = self;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], [(APXPCActivityCriteria *)v2 allowBattery]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], [(APXPCActivityCriteria *)v2 requireSleep]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], [(APXPCActivityCriteria *)v2 isRepeating]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14168], [(APXPCActivityCriteria *)v2 isCPUIntensive]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14188], [(APXPCActivityCriteria *)v2 isDiskIntensive]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14338], [(APXPCActivityCriteria *)v2 requiresNetworkConnectivity]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], [(APXPCActivityCriteria *)v2 gracePeriod]);
  if (![(APXPCActivityCriteria *)v2 priority]) {
    [(APXPCActivityCriteria *)v2 setPriority:*MEMORY[0x1E4F142D0]];
  }
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], [(APXPCActivityCriteria *)v2 priority]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F14170], [(APXPCActivityCriteria *)v2 delay]);
  if ([(APXPCActivityCriteria *)v2 isRepeating]) {
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], [(APXPCActivityCriteria *)v2 interval]);
  }
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14308], [(APXPCActivityCriteria *)v2 requireBuddyComplete]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14320], [(APXPCActivityCriteria *)v2 requireClassCData]);
  [(APXPCActivityCriteria *)v2 scheduledTime];
  [(APXPCActivityCriteria *)v2 scheduledTime];
  xpc_dictionary_set_double(v3, "APScheduledTime", v4);

  return v3;
}

- (int64_t)firstRunInterval
{
  return self->_firstRunInterval;
}

- (void)setFirstRunInterval:(int64_t)a3
{
  self->_firstRunInterval = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_delay = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (BOOL)requiresNetworkConnectivity
{
  return self->_requiresNetworkConnectivity;
}

- (void)setRequiresNetworkConnectivity:(BOOL)a3
{
  self->_requiresNetworkConnectivity = a3;
}

- (BOOL)requireBuddyComplete
{
  return self->_requireBuddyComplete;
}

- (void)setRequireBuddyComplete:(BOOL)a3
{
  self->_requireBuddyComplete = a3;
}

- (BOOL)requireClassCData
{
  return self->_requireClassCData;
}

- (void)setRequireClassCData:(BOOL)a3
{
  self->_requireClassCData = a3;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_allowBattery = a3;
}

- (BOOL)requireSleep
{
  return self->_requireSleep;
}

- (void)setRequireSleep:(BOOL)a3
{
  self->_requireSleep = a3;
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (void)setIsRepeating:(BOOL)a3
{
  self->_isRepeating = a3;
}

- (int64_t)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int64_t)a3
{
  self->_gracePeriod = a3;
}

- (const)priority
{
  return self->_priority;
}

- (void)setPriority:(const char *)a3
{
  self->_priority = a3;
}

- (BOOL)isCPUIntensive
{
  return self->_isCPUIntensive;
}

- (void)setIsCPUIntensive:(BOOL)a3
{
  self->_isCPUIntensive = a3;
}

- (BOOL)isDiskIntensive
{
  return self->_isDiskIntensive;
}

- (void)setIsDiskIntensive:(BOOL)a3
{
  self->_isDiskIntensive = a3;
}

- (NSDictionary)customProperties
{
  return self->_customProperties;
}

- (void)setCustomProperties:(id)a3
{
  self->_customProperties = (NSDictionary *)a3;
}

- (double)scheduledTime
{
  return self->_scheduledTime;
}

- (void)setScheduledTime:(double)a3
{
  self->_scheduledTime = a3;
}

@end