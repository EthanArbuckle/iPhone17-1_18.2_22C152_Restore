@interface CVAMetadataWrapper
+ (BOOL)locationFromTrackName:(id)a3 location:(int64_t *)a4;
+ (id)accelerometerTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)alsTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)commonSet;
+ (id)compassTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)decodeALS:(id)a3;
+ (id)decodeAccel:(id)a3;
+ (id)decodeCLLocation:(id)a3;
+ (id)decodeCLLocation:(id)a3 timestamp:(double *)a4;
+ (id)decodeCMData:(id)a3;
+ (id)decodeCMDeviceMotion:(id)a3;
+ (id)decodeCVACalibration:(id)a3;
+ (id)decodeCVACameraCalibrationData:(id)a3;
+ (id)decodeCVADepthTOF:(id)a3;
+ (id)decodeCVAFeatureBuffer:(id)a3;
+ (id)decodeCVATimedValue:(id)a3;
+ (id)decodeCVAUserEvent:(id)a3;
+ (id)decodeClass:(id)a3 class:(Class)a4;
+ (id)decodeClass:(id)a3 class:(Class)a4 error:(id *)a5;
+ (id)decodeCommon:(id)a3;
+ (id)decodeCompass:(id)a3;
+ (id)decodeDeviceMotion:(id)a3;
+ (id)decodeDictionary:(id)a3;
+ (id)decodeGyro:(id)a3;
+ (id)decodeIMU:(id)a3;
+ (id)decodeLocationDict:(id)a3;
+ (id)decodeMotion:(id)a3;
+ (id)decodeNSCoderObject:(id)a3 class:(Class)a4;
+ (id)decodeNSCoderObject:(id)a3 class:(Class)a4 error:(id *)a5;
+ (id)decodeNSCoderObject:(id)a3 classes:(id)a4;
+ (id)decodeNSCoderObject:(id)a3 classes:(id)a4 error:(id *)a5;
+ (id)decodePRDevice:(id)a3;
+ (id)decodeWiFi:(id)a3;
+ (id)deviceMotionTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)encodeALSData:(id)a3;
+ (id)encodeCMData:(id)a3;
+ (id)encodeCVACalibration:(id)a3;
+ (id)encodeCVACameraCalibrationData:(id)a3;
+ (id)encodeCVADepthTOF:(id)a3;
+ (id)encodeCVAFeatureBuffer:(id)a3;
+ (id)encodeCVATimedValue:(id)a3;
+ (id)encodeCVAUserEvent:(id)a3;
+ (id)encodeClass:(id)a3 andAdditionalData:(id)a4;
+ (id)encodeCompassData:(id)a3;
+ (id)encodeCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5;
+ (id)encodeDeviceMotionData:(id)a3;
+ (id)encodeDeviceMotionData:(id)a3 andAdditionalData:(id)a4;
+ (id)encodeDictionary:(id)a3;
+ (id)encodeIMUData:(id)a3;
+ (id)encodeMotionData:(id)a3;
+ (id)encodeNSCoderObject:(id)a3;
+ (id)encodePRDevice:(id)a3;
+ (id)encodeWiFiData:(id)a3;
+ (id)gyroTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)imuTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)locationTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)motionTrackName:(int64_t *)a3 prefix:(id)a4;
+ (id)trackNameFromPrefix:(int64_t *)a3 prefix:(id)a4 defaultValue:(id)a5;
+ (id)validTracks;
+ (id)version;
+ (id)wifiTrackName:(int64_t *)a3 prefix:(id)a4;
@end

@implementation CVAMetadataWrapper

+ (id)version
{
  return @"1.2.0";
}

+ (id)trackNameFromPrefix:(int64_t *)a3 prefix:(id)a4 defaultValue:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (a3)
    {
LABEL_3:
      id v10 = [NSString stringWithFormat:@"%@.%ld", v7, *a3];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = (id)[v8 copy];
    if (a3) {
      goto LABEL_3;
    }
  }
  id v10 = v7;
LABEL_6:
  v11 = v10;

  return v11;
}

+ (id)imuTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)accelerometerTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)gyroTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)motionTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)deviceMotionTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)locationTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)alsTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)wifiTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)compassTrackName:(int64_t *)a3 prefix:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](CVAMetadataWrapper, sel_trackNameFromPrefix_prefix_defaultValue_);
}

+ (id)validTracks
{
  if (qword_267C58C28 == -1)
  {
    v2 = (void *)qword_267C58C20;
  }
  else
  {
    dispatch_once(&qword_267C58C28, &unk_26CB5E458);
    v2 = (void *)qword_267C58C20;
  }
  return v2;
}

+ (BOOL)locationFromTrackName:(id)a3 location:(int64_t *)a4
{
  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x263EFF980];
    id v7 = [a3 componentsSeparatedByString:@"."];
    id v8 = [v6 arrayWithArray:v7];

    if ((unint64_t)[v8 count] >= 2)
    {
      v9 = +[CVAMetadataWrapper validTracks];
      id v10 = [v8 lastObject];
      [v8 removeLastObject];
      v11 = [v8 componentsJoinedByString:@"."];
      int v4 = [v9 containsObject:v11];
      if (v4) {
        *a4 = [v10 integerValue];
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)encodeIMUData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeMotionData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCompassData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeALSData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeWiFiData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeDeviceMotionData:(id)a3 andAdditionalData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CVACMDeviceMotionData alloc] initWithCMDeviceMotion:v6];
  id v8 = [(CVACMDeviceMotionData *)v7 dictionary];
  v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];

  [v9 addEntriesFromDictionary:v8];
  id v10 = +[CVAMetadataWrapper encodeClass:v6 andAdditionalData:v9];

  return v10;
}

+ (id)encodeDeviceMotionData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[CVACLLocation alloc] initWithCLLocation:v8 timestamp:a4];
  id v10 = [(CVACLLocation *)v9 dictionary];
  v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];

  [v11 addEntriesFromDictionary:v10];
  v12 = +[CVAMetadataWrapper encodeClass:v8 andAdditionalData:v11];

  return v12;
}

+ (id)encodePRDevice:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCMData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCVAUserEvent:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCVATimedValue:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCVAFeatureBuffer:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCVADepthTOF:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCVACalibration:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeCVACameraCalibrationData:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeDictionary:(id)a3
{
  return +[CVAMetadataWrapper encodeNSCoderObject:a3];
}

+ (id)encodeClass:(id)a3 andAdditionalData:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v13 = 0;
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v13];
  id v8 = v13;
  if (v8)
  {
    NSLog(&cfstr_Metadatawrappe.isa, v5);
    v9 = 0;
  }
  else
  {
    uint64_t v14 = qword_267C58B28;
    v15[0] = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
    [v11 addEntriesFromDictionary:v10];
    v9 = +[CVAMetadataWrapper encodeNSCoderObject:v11];
  }
  return v9;
}

+ (id)encodeNSCoderObject:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  int v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 localizedDescription];
    NSLog(&cfstr_Metadatawrappe_0.isa, v7, v3);

    id v8 = 0;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

+ (id)commonSet
{
  if (qword_267C58C38 == -1)
  {
    v2 = (void *)qword_267C58C30;
  }
  else
  {
    dispatch_once(&qword_267C58C38, &unk_26CB5E478);
    v2 = (void *)qword_267C58C30;
  }
  return v2;
}

+ (id)decodeCommon:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x263F08928];
  id v5 = +[CVAMetadataWrapper commonSet];
  id v19 = 0;
  id v6 = [v4 unarchivedObjectOfClasses:v5 fromData:v3 error:&v19];
  id v7 = v19;

  if (v7)
  {

    id v18 = 0;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:1 error:&v18];
    id v9 = v18;
    if (v9)
    {

      id v16 = 0;
      uint64_t v17 = 0;
      id v10 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:&v17 error:&v16];
      id v11 = v16;
      v12 = v11;
      if (v11)
      {
        id v13 = [v11 localizedDescription];
        NSLog(&cfstr_Metadatawrappe_1.isa, v13);

        id v14 = 0;
      }
      else
      {
        id v14 = v10;
      }
    }
    else
    {
      id v14 = v8;
    }
  }
  else
  {
    id v14 = v6;
  }

  return v14;
}

+ (id)decodeIMU:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int v4 = +[CVASpuFastPathComboAxisData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeAccel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v11 = 0;
  id v5 = +[CVAMetadataWrapper decodeClass:v3 class:v4 error:&v11];
  id v6 = v11;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[CVAMetadataWrapper decodeCommon:v3];
    if (v8)
    {
      id v7 = [[CVACMAccelerometerData alloc] initWithDictionary:v8];
    }
    else
    {
      if (v6)
      {
        id v9 = [v6 localizedDescription];
        NSLog(&cfstr_Metadatawrappe_2.isa, v4, v9);
      }
      id v7 = 0;
    }
  }
  return v7;
}

+ (id)decodeGyro:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v11 = 0;
  id v5 = +[CVAMetadataWrapper decodeClass:v3 class:v4 error:&v11];
  id v6 = v11;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[CVAMetadataWrapper decodeCommon:v3];
    if (v8)
    {
      id v7 = [[CVACMGyroData alloc] initWithDictionary:v8];
    }
    else
    {
      if (v6)
      {
        id v9 = [v6 localizedDescription];
        NSLog(&cfstr_Metadatawrappe_2.isa, v4, v9);
      }
      id v7 = 0;
    }
  }
  return v7;
}

+ (id)decodeCompass:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVACMCompassData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeMotion:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVACMMotionData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeALS:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVACMALSData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeWiFi:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVACMWiFiData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeDeviceMotion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[CVACMDeviceMotionData classes];
  id v14 = 0;
  id v6 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v5 error:&v14];
  id v7 = v14;

  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    id v13 = v7;
    uint64_t v9 = +[CVAMetadataWrapper decodeClass:v3 class:v4 error:&v13];
    id v8 = v13;

    if (v9)
    {
      id v6 = (CVACMDeviceMotionData *)v9;
    }
    else
    {
      id v10 = +[CVAMetadataWrapper decodeCommon:v3];
      if (v10)
      {
        id v6 = [[CVACMDeviceMotionData alloc] initWithDictionary:v10];
      }
      else
      {
        if (v8)
        {
          id v11 = [v8 localizedDescription];
          NSLog(&cfstr_Metadatawrappe_2.isa, v4, v11);
        }
        id v6 = 0;
      }
    }
  }

  return v6;
}

+ (id)decodeCMDeviceMotion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CVAMetadataWrapper decodeClass:v3 class:objc_opt_class()];

  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)decodeDictionary:(id)a3
{
  id v3 = +[CVAMetadataWrapper decodeCommon:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];
    [v4 removeObjectForKey:qword_267C58B28];

    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v3;

      id v5 = v7;
    }
    else
    {

      id v5 = 0;
    }
  }
  return v5;
}

+ (id)decodeClass:(id)a3 class:(Class)a4
{
  id v5 = +[CVAMetadataWrapper decodeCommon:a3];
  id v6 = [v5 valueForKey:qword_267C58B28];

  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:qword_267C58B28];
    id v8 = +[CVAMetadataWrapper decodeNSCoderObject:v7 class:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)decodeClass:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v7 = +[CVAMetadataWrapper decodeCommon:a3];
  id v8 = [v7 valueForKey:qword_267C58B28];

  if (v8)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:qword_267C58B28];
    id v10 = +[CVAMetadataWrapper decodeNSCoderObject:v9 class:a4 error:a5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)decodeLocationDict:(id)a3
{
  id v3 = +[CVAMetadataWrapper decodeCommon:a3];
  uint64_t v4 = [[CVACLLocation alloc] initWithDictionary:v3];
  id v5 = [(CVACLLocation *)v4 dictionary];

  return v5;
}

+ (id)decodeCLLocation:(id)a3
{
  return +[CVAMetadataWrapper decodeCLLocation:a3 timestamp:0];
}

+ (id)decodeCLLocation:(id)a3 timestamp:(double *)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = +[CVAMetadataWrapper decodeCommon:v5];
    id v7 = [[CVACLLocation alloc] initWithDictionary:v6];
    [(CVACLLocation *)v7 timestamp];
    *(void *)a4 = v8;
  }
  uint64_t v9 = +[CVAMetadataWrapper decodeClass:v5 class:objc_opt_class()];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

+ (id)decodePRDevice:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVAPRDevice classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCMData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CMData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCVAUserEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVAUserEvent classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCVATimedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVATimedValue classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCVAFeatureBuffer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVAFeatureBuffer classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCVADepthTOF:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVADepthTOF classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCVACalibration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVACalibration classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeCVACameraCalibrationData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = +[CVACameraCalibrationData classes];
  id v5 = +[CVAMetadataWrapper decodeNSCoderObject:v3 classes:v4];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (id)decodeNSCoderObject:(id)a3 classes:(id)a4
{
  id v5 = a4;
  id v12 = 0;
  id v6 = +[CVAMetadataWrapper decodeNSCoderObject:a3 classes:v5 error:&v12];
  id v7 = v12;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 localizedDescription];
    NSLog(&cfstr_Metadatawrappe_3.isa, v5, v9);

    id v10 = 0;
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

+ (id)decodeNSCoderObject:(id)a3 classes:(id)a4 error:(id *)a5
{
  return (id)[MEMORY[0x263F08928] unarchivedObjectOfClasses:a4 fromData:a3 error:a5];
}

+ (id)decodeNSCoderObject:(id)a3 class:(Class)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  Class v11 = a4;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v11 count:1];
  uint64_t v8 = objc_msgSend(v4, "setWithArray:", v7, v11, v12);
  uint64_t v9 = +[CVAMetadataWrapper decodeNSCoderObject:v6 classes:v8];

  return v9;
}

+ (id)decodeNSCoderObject:(id)a3 class:(Class)a4 error:(id *)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263EFFA08];
  Class v13 = a4;
  id v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:&v13 count:1];
  id v10 = objc_msgSend(v6, "setWithArray:", v9, v13, v14);
  Class v11 = +[CVAMetadataWrapper decodeNSCoderObject:v8 classes:v10 error:a5];

  return v11;
}

@end