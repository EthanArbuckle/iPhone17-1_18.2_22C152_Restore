@interface JFXEffectAssetRequestOptions
- (BOOL)isNetworkAccessDisabled;
- (JFXEffectAssetRequestOptions)init;
- (NSArray)filterOptionsArray;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)priority;
- (void)setFilterOptionsArray:(id)a3;
- (void)setNetworkAccessDisabled:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation JFXEffectAssetRequestOptions

- (JFXEffectAssetRequestOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectAssetRequestOptions;
  result = [(JFXEffectAssetRequestOptions *)&v3 init];
  if (result) {
    result->_priority = 2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 24) = self->_priority;
  *(unsigned char *)(v4 + 8) = self->_networkAccessDisabled;
  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_filterOptionsArray copyItems:1];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  return (id)v4;
}

- (NSArray)filterOptionsArray
{
  return self->_filterOptionsArray;
}

- (void)setFilterOptionsArray:(id)a3
{
}

- (BOOL)isNetworkAccessDisabled
{
  return self->_networkAccessDisabled;
}

- (void)setNetworkAccessDisabled:(BOOL)a3
{
  self->_networkAccessDisabled = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
}

@end