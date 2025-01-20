@interface MetadataWrapper
+ (id)decodeAccel:(id)a3;
+ (id)decodeCLLocation:(id)a3;
+ (id)decodeCLLocation:(id)a3 timestamp:(double *)a4;
+ (id)decodeCMDeviceMotion:(id)a3;
+ (id)decodeCompass:(id)a3;
+ (id)decodeGyro:(id)a3;
+ (id)encodeAccelerometerData:(id)a3 andAdditionalData:(id)a4;
+ (id)encodeCompassData:(id)a3;
+ (id)encodeCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5;
+ (id)encodeDeviceMotionData:(id)a3 andAdditionalData:(id)a4;
+ (id)encodeGyroscopeData:(id)a3 andAdditionalData:(id)a4;
@end

@implementation MetadataWrapper

+ (id)decodeAccel:(id)a3
{
  return +[CVAMetadataWrapper decodeAccel:a3];
}

+ (id)decodeGyro:(id)a3
{
  return +[CVAMetadataWrapper decodeGyro:a3];
}

+ (id)decodeCompass:(id)a3
{
  return +[CVAMetadataWrapper decodeCompass:a3];
}

+ (id)decodeCLLocation:(id)a3
{
  return +[CVAMetadataWrapper decodeCLLocation:a3];
}

+ (id)decodeCLLocation:(id)a3 timestamp:(double *)a4
{
  return +[CVAMetadataWrapper decodeCLLocation:a3 timestamp:a4];
}

+ (id)decodeCMDeviceMotion:(id)a3
{
  return +[CVAMetadataWrapper decodeCMDeviceMotion:a3];
}

+ (id)encodeAccelerometerData:(id)a3 andAdditionalData:(id)a4
{
  return +[CVAMetadataWrapper encodeAccelerometerData:a3 andAdditionalData:a4];
}

+ (id)encodeGyroscopeData:(id)a3 andAdditionalData:(id)a4
{
  return +[CVAMetadataWrapper encodeGyroscopeData:a3 andAdditionalData:a4];
}

+ (id)encodeCompassData:(id)a3
{
  return +[CVAMetadataWrapper encodeCompassData:a3];
}

+ (id)encodeCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5
{
  return +[CVAMetadataWrapper encodeCoreLocationData:a3 timestamp:a5 andAdditionalData:a4];
}

+ (id)encodeDeviceMotionData:(id)a3 andAdditionalData:(id)a4
{
  return +[CVAMetadataWrapper encodeDeviceMotionData:a3 andAdditionalData:a4];
}

@end