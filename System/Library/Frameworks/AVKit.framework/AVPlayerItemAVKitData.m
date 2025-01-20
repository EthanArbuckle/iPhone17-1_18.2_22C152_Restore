@interface AVPlayerItemAVKitData
- (AVPlayerItemAVKitData)init;
- (NSMutableDictionary)customPropertyStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)interstitialPolicyEnforcement;
- (void)setInterstitialPolicyEnforcement:(int64_t)a3;
@end

@implementation AVPlayerItemAVKitData

- (void).cxx_destruct
{
}

- (void)setInterstitialPolicyEnforcement:(int64_t)a3
{
  self->_interstitialPolicyEnforcement = a3;
}

- (int64_t)interstitialPolicyEnforcement
{
  return self->_interstitialPolicyEnforcement;
}

- (NSMutableDictionary)customPropertyStorage
{
  return self->_customPropertyStorage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVPlayerItemAVKitData);
  v5 = [(AVPlayerItemAVKitData *)v4 customPropertyStorage];
  v6 = [(AVPlayerItemAVKitData *)self customPropertyStorage];
  [v5 setDictionary:v6];

  [(AVPlayerItemAVKitData *)v4 setInterstitialPolicyEnforcement:1];
  return v4;
}

- (AVPlayerItemAVKitData)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVPlayerItemAVKitData;
  v2 = [(AVPlayerItemAVKitData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    customPropertyStorage = v2->_customPropertyStorage;
    v2->_customPropertyStorage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end