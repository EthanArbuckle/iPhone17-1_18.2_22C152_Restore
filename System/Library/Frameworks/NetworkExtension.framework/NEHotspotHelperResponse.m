@interface NEHotspotHelperResponse
- (id)description;
- (void)dealloc;
- (void)deliver;
- (void)setNetwork:(NEHotspotNetwork *)network;
- (void)setNetworkList:(NSArray *)networkList;
@end

@implementation NEHotspotHelperResponse

- (void)deliver
{
  if (self) {
    self = (NEHotspotHelperResponse *)self->_response;
  }
  MEMORY[0x1F410FB58](self, a2);
}

- (void)setNetworkList:(NSArray *)networkList
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = networkList;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = v3;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10) {
          v11 = *(const void **)(v10 + 8);
        }
        else {
          v11 = 0;
        }
        CFArrayAppendValue(Mutable, v11);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }

  if (Mutable)
  {
    CNPluginResponseSetNetworkList();
    CFRelease(Mutable);
  }
}

- (void)setNetwork:(NEHotspotNetwork *)network
{
  v3 = network;
  CNPluginResponseSetNetwork();
}

- (id)description
{
  if (self) {
    self = (NEHotspotHelperResponse *)self->_response;
  }
  v2 = (__CFString *)CFCopyDescription(self);

  return v2;
}

- (void)dealloc
{
  if (self)
  {
    response = self->_response;
    if (response) {
      CFRelease(response);
    }
    self->_response = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHotspotHelperResponse;
  [(NEHotspotHelperResponse *)&v4 dealloc];
}

@end