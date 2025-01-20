@interface HKAudiogramSample(HDCodingSupport)
- (HDCodableBinarySample)codableRepresentationForSync;
@end

@implementation HKAudiogramSample(HDCodingSupport)

- (HDCodableBinarySample)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableBinarySample);
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F1879500;
  v3 = objc_msgSendSuper2(&v6, sel_codableRepresentationForSync);
  [(HDCodableBinarySample *)v2 setSample:v3];

  v4 = [a1 payload];
  [(HDCodableBinarySample *)v2 setPayload:v4];

  return v2;
}

@end