@interface _AMMotionDetectionDataSample
+ (id)zeroMotionDataWithTimestamp:(double)a3;
- (NSArray)data;
- (double)timestampSeconds;
- (id)description;
- (void)setData:(id)a3;
- (void)setTimestampSeconds:(double)a3;
@end

@implementation _AMMotionDetectionDataSample

+ (id)zeroMotionDataWithTimestamp:(double)a3
{
  v4 = objc_alloc_init(_AMMotionDetectionDataSample);
  [(_AMMotionDetectionDataSample *)v4 setData:&unk_26FBC9260];
  [(_AMMotionDetectionDataSample *)v4 setTimestampSeconds:a3];
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  NSUInteger v4 = [(NSArray *)self->_data count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    NSUInteger v7 = v4 - 1;
    do
    {
      v8 = NSString;
      v9 = [(NSArray *)self->_data objectAtIndexedSubscript:v6];
      [v9 floatValue];
      v11 = objc_msgSend(v8, "stringWithFormat:", @"%0.3f", v10);

      v12 = @" %@,";
      if (v7 == v6) {
        v12 = @" %@");
      }
      if (v6) {
        v13 = v12;
      }
      else {
        v13 = CFSTR("( %@,");
      }
      objc_msgSend(v3, "appendFormat:", v13, v11);

      ++v6;
    }
    while (v5 != v6);
  }
  v14 = [NSString stringWithFormat:@"<%@:%p : t=%0.3fs data=%@>", objc_opt_class(), self, *(void *)&self->_timestampSeconds, v3];

  return v14;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (double)timestampSeconds
{
  return self->_timestampSeconds;
}

- (void)setTimestampSeconds:(double)a3
{
  self->_timestampSeconds = a3;
}

- (void).cxx_destruct
{
}

@end