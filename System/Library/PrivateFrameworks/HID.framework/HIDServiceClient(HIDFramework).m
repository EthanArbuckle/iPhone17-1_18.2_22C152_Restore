@interface HIDServiceClient(HIDFramework)
- (BOOL)conformsToUsagePage:()HIDFramework usage:;
- (BOOL)setProperty:()HIDFramework forKey:;
- (id)eventMatching:()HIDFramework;
- (id)propertiesForKeys:()HIDFramework;
- (id)propertyForKey:()HIDFramework;
- (uint64_t)serviceID;
- (void)setRemovalHandler:()HIDFramework;
@end

@implementation HIDServiceClient(HIDFramework)

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDServiceClientConformsTo(a1, usagePage, usage) != 0;
}

- (void)setRemovalHandler:()HIDFramework
{
  id aBlock = a3;
  uint64_t v4 = a1 + (int)*MEMORY[0x1E4F2EEE8];
  os_unfair_recursive_lock_lock_with_options();
  if (*(void *)(v4 + 112)) {
    -[HIDServiceClient(HIDFramework) setRemovalHandler:]();
  }
  *(void *)(v4 + 112) = _Block_copy(aBlock);
  os_unfair_recursive_lock_unlock();
  IOHIDServiceClientRegisterRemovalCallback();
}

- (id)propertyForKey:()HIDFramework
{
  v3 = (void *)IOHIDServiceClientCopyProperty(a1, key);
  return v3;
}

- (id)propertiesForKeys:()HIDFramework
{
  v0 = (void *)IOHIDServiceClientCopyProperties();
  return v0;
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDServiceClientSetProperty(a1, key, a3) != 0;
}

- (id)eventMatching:()HIDFramework
{
  v0 = (void *)IOHIDServiceClientCopyMatchingEvent();
  return v0;
}

- (uint64_t)serviceID
{
  v1 = IOHIDServiceClientGetRegistryID(a1);
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedLongLongValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setRemovalHandler:()HIDFramework .cold.1()
{
}

@end