@interface CAMSampleBufferVideoFormatOutputCommand
- (CAMSampleBufferVideoFormatOutputCommand)initWithCoder:(id)a3;
- (CAMSampleBufferVideoFormatOutputCommand)initWithSampleBufferVideoFormat:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_videoFormat;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSampleBufferVideoFormatOutputCommand

- (CAMSampleBufferVideoFormatOutputCommand)initWithSampleBufferVideoFormat:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__videoFormat = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v8 = [a3 currentEffectsPreviewOutput];
  int64_t v4 = [(CAMSampleBufferVideoFormatOutputCommand *)self _videoFormat];
  if (v4 == 1)
  {
    v5 = NSDictionary;
    v6 = [NSNumber numberWithInt:1111970369];
    v7 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x263F04180], 0);

    [v8 setVideoSettings:v7];
    [v8 setAlwaysDiscardsLateVideoFrames:1];
  }
  else if (!v4)
  {
    [v8 setVideoSettings:0];
  }
}

- (int64_t)_videoFormat
{
  return self->__videoFormat;
}

- (CAMSampleBufferVideoFormatOutputCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  v5 = [(CAMCaptureCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->__videoFormat = [v4 decodeIntegerForKey:@"CAMSampleBufferVideoFormat"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMSampleBufferVideoFormatOutputCommand _videoFormat](self, "_videoFormat", v5.receiver, v5.super_class), @"CAMSampleBufferVideoFormat");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSampleBufferVideoFormatOutputCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMSampleBufferVideoFormatOutputCommand *)self _videoFormat];
  return v4;
}

@end