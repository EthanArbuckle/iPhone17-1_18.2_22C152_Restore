@interface HMDCameraRecordingMetricUUIDUtilities
+ (id)UUIDRotationSalt;
+ (id)currentEphemeralUUIDWithUUID:(id)a3 rotationScheduleDays:(unint64_t)a4;
+ (id)ephemeralUUIDWithUUID:(id)a3 forTimestamp:(unint64_t)a4 rotationSchedule:(unint64_t)a5;
+ (id)ephemeralUUIDWithUUID:(id)a3 forTimestamp:(unint64_t)a4 rotationScheduleDays:(unint64_t)a5;
@end

@implementation HMDCameraRecordingMetricUUIDUtilities

+ (id)ephemeralUUIDWithUUID:(id)a3 forTimestamp:(unint64_t)a4 rotationScheduleDays:(unint64_t)a5
{
  return (id)[a1 ephemeralUUIDWithUUID:a3 forTimestamp:a4 rotationSchedule:86400000 * a5];
}

+ (id)currentEphemeralUUIDWithUUID:(id)a3 rotationScheduleDays:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  v8 = [v6 date];
  [v8 timeIntervalSince1970];
  v10 = [a1 ephemeralUUIDWithUUID:v7 forTimestamp:(unint64_t)(v9 * 1000.0) rotationScheduleDays:a4];

  return v10;
}

+ (id)ephemeralUUIDWithUUID:(id)a3 forTimestamp:(unint64_t)a4 rotationSchedule:(unint64_t)a5
{
  unint64_t v14 = a4 / a5;
  v5 = (void *)MEMORY[0x263EFF990];
  id v6 = a3;
  id v7 = [v5 dataWithBytes:&v14 length:8];
  v8 = [(id)objc_opt_class() UUIDRotationSalt];
  [v7 appendData:v8];

  double v9 = objc_msgSend(v6, "hm_convertToData");

  [v7 appendData:v9];
  id v10 = objc_alloc(MEMORY[0x263F08C38]);
  objc_msgSend(v7, "hm_generateSHA1");
  id v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));

  return v12;
}

+ (id)UUIDRotationSalt
{
  if (UUIDRotationSalt_onceToken != -1) {
    dispatch_once(&UUIDRotationSalt_onceToken, &__block_literal_global_123389);
  }
  v2 = (void *)UUIDRotationSalt__UUIDRotationSalt;
  return v2;
}

void __57__HMDCameraRecordingMetricUUIDUtilities_UUIDRotationSalt__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF8F8];
  id v3 = [@"4CB147FB-C2E8-40AA-913F-119C13110BD0" dataUsingEncoding:4];
  uint64_t v1 = [v0 dataWithBytes:objc_msgSend(v3, "bytes"), objc_msgSend(@"4CB147FB-C2E8-40AA-913F-119C13110BD0", "length") length];
  v2 = (void *)UUIDRotationSalt__UUIDRotationSalt;
  UUIDRotationSalt__UUIDRotationSalt = v1;
}

@end