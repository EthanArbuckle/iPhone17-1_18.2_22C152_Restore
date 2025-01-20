@interface CSAudioInjectionEngineFactory
+ (id)engineWithDeviceType:(int64_t)a3 streamHandleId:(unint64_t)a4;
@end

@implementation CSAudioInjectionEngineFactory

+ (id)engineWithDeviceType:(int64_t)a3 streamHandleId:(unint64_t)a4
{
  if ((unint64_t)(a3 - 5) > 3) {
    v4 = off_10024D078;
  }
  else {
    v4 = (&off_1002532E8)[a3 - 5];
  }
  id v5 = [objc_alloc(*v4) initWithStreamHandleId:a4];
  return v5;
}

@end