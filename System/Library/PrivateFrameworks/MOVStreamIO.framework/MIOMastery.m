@interface MIOMastery
+ (id)masteryFromConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 frameRate:(double)a5;
+ (id)masteryLossless;
+ (id)masteryWithBitrate:(double)a3;
+ (id)masteryWithQuality:(double)a3;
- (MIOMastery)initWithKey:(id)a3 value:(id)a4;
- (NSString)propertyKey;
- (id)propertyValue;
@end

@implementation MIOMastery

- (MIOMastery)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIOMastery;
  v9 = [(MIOMastery *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyKey, a3);
    objc_storeStrong(&v10->_propertyValue, a4);
  }

  return v10;
}

+ (id)masteryLossless
{
  v2 = [MIOMastery alloc];
  v3 = [(MIOMastery *)v2 initWithKey:*MEMORY[0x263F1E640] value:&unk_26CB7D4C0];

  return v3;
}

+ (id)masteryWithQuality:(double)a3
{
  v4 = [MIOMastery alloc];
  uint64_t v5 = *MEMORY[0x263F1E640];
  v6 = [NSNumber numberWithDouble:a3];
  id v7 = [(MIOMastery *)v4 initWithKey:v5 value:v6];

  return v7;
}

+ (id)masteryWithBitrate:(double)a3
{
  v4 = [MIOMastery alloc];
  uint64_t v5 = *MEMORY[0x263F1E4E8];
  v6 = [NSNumber numberWithDouble:a3];
  id v7 = [(MIOMastery *)v4 initWithKey:v5 value:v6];

  return v7;
}

+ (id)masteryFromConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 frameRate:(double)a5
{
  id v7 = a3;
  id v8 = [v7 objectForKey:@"ColorStreamBitrate"];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 integerValue];
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    objc_super v12 = [v7 objectForKey:@"StreamEncoderType"];
    uint64_t v13 = [v12 intValue];

    uint64_t v10 = +[MOVStreamIOUtility getDefaultBitrateForVideoDimension:Dimensions atExpectedFramerate:v13 forEncoderType:a5];
  }
  unint64_t v14 = v10;
  v15 = [v7 objectForKey:@"EncodingQuality"];

  if (v15
    && ([v15 doubleValue],
        +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:"),
        v16 >= 0.0))
  {
    uint64_t v17 = +[MIOMastery masteryWithQuality:](MIOMastery, "masteryWithQuality:");
  }
  else
  {
    uint64_t v17 = +[MIOMastery masteryWithBitrate:(double)v14];
  }
  v18 = (void *)v17;

  return v18;
}

- (NSString)propertyKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)propertyValue
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyValue, 0);

  objc_storeStrong((id *)&self->_propertyKey, 0);
}

@end