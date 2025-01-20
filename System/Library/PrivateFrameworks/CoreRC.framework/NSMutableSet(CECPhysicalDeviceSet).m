@interface NSMutableSet(CECPhysicalDeviceSet)
- (void)physicalDeviceWithAddress:()CECPhysicalDeviceSet;
@end

@implementation NSMutableSet(CECPhysicalDeviceSet)

- (void)physicalDeviceWithAddress:()CECPhysicalDeviceSet
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(a1);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 physicalAddress] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end