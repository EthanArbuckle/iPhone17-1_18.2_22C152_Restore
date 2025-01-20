@interface AVOutputDeviceDiscoverySessionAvailableOutputDevices
+ (AVOutputDeviceDiscoverySessionAvailableOutputDevices)outputDeviceDiscoverySessionAvailableOutputDevicesWithAvailableFigEndpoints:(id)a3;
- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)init;
- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)otherDevices;
- (NSArray)recentlyUsedDevices;
- (id)impl;
- (unint64_t)hash;
- (void)_loadOutputDevices;
- (void)dealloc;
@end

@implementation AVOutputDeviceDiscoverySessionAvailableOutputDevices

- (NSArray)recentlyUsedDevices
{
  result = &self->_availableOutputDevices->_recentlyUsedDevices->super;
  if (!result)
  {
    [(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)self _loadOutputDevices];
    return &self->_availableOutputDevices->_recentlyUsedDevices->super;
  }
  return result;
}

- (void)_loadOutputDevices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(-[AVOutputDeviceDiscoverySessionAvailableOutputDevices impl](self, "impl"), "allDevices");
  self->_availableOutputDevices->_recentlyUsedDevices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_availableOutputDevices->_otherDevices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 frecencyScore];
        if (v9 <= 0.0) {
          uint64_t v10 = 24;
        }
        else {
          uint64_t v10 = 16;
        }
        [*(id *)((char *)&self->_availableOutputDevices->super.isa + v10) addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  if ([v3 count]) {
    [(NSMutableArray *)self->_availableOutputDevices->_recentlyUsedDevices addObject:+[AVOutputDevice sharedLocalDevice]];
  }
  [(NSMutableArray *)self->_availableOutputDevices->_otherDevices sortUsingComparator:&__block_literal_global_131];
}

- (NSArray)otherDevices
{
  result = &self->_availableOutputDevices->_otherDevices->super;
  if (!result)
  {
    [(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)self _loadOutputDevices];
    return &self->_availableOutputDevices->_otherDevices->super;
  }
  return result;
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceDiscoverySessionAvailableOutputDevices;
  uint64_t v4 = [(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)&v8 init];
  if (v4
    && (uint64_t v5 = objc_alloc_init(AVOutputDeviceDiscoverySessionAvailableOutputDevicesInternal),
        (v4->_availableOutputDevices = v5) != 0)
    && (v4->_availableOutputDevices->impl = (AVOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)a3) != 0)
  {
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)impl
{
  return self->_availableOutputDevices->impl;
}

- (void)dealloc
{
  availableOutputDevices = self->_availableOutputDevices;
  if (availableOutputDevices)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVOutputDeviceDiscoverySessionAvailableOutputDevices;
  [(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)&v4 dealloc];
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)init
{
  v3 = objc_alloc_init(AVEmptyOutputDeviceDiscoverySessionAvailableOutputDevices);
  objc_super v4 = [(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)self initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  BOOL v5 = -[NSArray isEqualToArray:](-[AVOutputDeviceDiscoverySessionAvailableOutputDevices recentlyUsedDevices](self, "recentlyUsedDevices"), "isEqualToArray:", [a3 recentlyUsedDevices]);
  return v5 & -[NSArray isEqualToArray:](-[AVOutputDeviceDiscoverySessionAvailableOutputDevices otherDevices](self, "otherDevices"), "isEqualToArray:", [a3 otherDevices]);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)[(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)self recentlyUsedDevices] hash];
  return [(NSArray *)[(AVOutputDeviceDiscoverySessionAvailableOutputDevices *)self otherDevices] hash] ^ v3;
}

uint64_t __74__AVOutputDeviceDiscoverySessionAvailableOutputDevices__loadOutputDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];
  return [v4 localizedStandardCompare:v5];
}

+ (AVOutputDeviceDiscoverySessionAvailableOutputDevices)outputDeviceDiscoverySessionAvailableOutputDevicesWithAvailableFigEndpoints:(id)a3
{
  uint64_t v3 = [[AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl alloc] initWithAvailableFigEndpoints:a3];
  objc_super v4 = [[AVOutputDeviceDiscoverySessionAvailableOutputDevices alloc] initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:v3];

  return v4;
}

@end