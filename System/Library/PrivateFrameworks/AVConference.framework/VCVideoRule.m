@interface VCVideoRule
- (BOOL)isEqual:(id)a3;
- (BOOL)isVideoFullHD;
- (NSString)description;
- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5;
- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5 payload:(int)a6;
- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5 payload:(int)a6 priority:(float)a7;
- (float)fPref;
- (float)fRate;
- (int)iHeight;
- (int)iPayload;
- (int)iWidth;
- (int64_t)compare:(id)a3;
- (int64_t)compareByPref:(id)a3;
- (void)setFPref:(float)a3;
- (void)setFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5;
- (void)setToVideoRule:(id)a3;
@end

@implementation VCVideoRule

- (float)fRate
{
  return self->_frameRate;
}

- (int)iWidth
{
  return self->_width;
}

- (int)iHeight
{
  return self->_height;
}

- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5 payload:(int)a6 priority:(float)a7
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoRule;
  result = [(VCVideoRule *)&v13 init];
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
    result->_frameRate = a5;
    result->_priority = a7;
    result->_payload = a6;
  }
  return result;
}

- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5
{
  return -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:priority:](self, "initWithFrameWidth:frameHeight:frameRate:payload:priority:", *(void *)&a3, *(void *)&a4, 123);
}

- (VCVideoRule)initWithFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5 payload:(int)a6
{
  return -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:priority:](self, "initWithFrameWidth:frameHeight:frameRate:payload:priority:", *(void *)&a3, *(void *)&a4, *(void *)&a6);
}

- (int64_t)compare:(id)a3
{
  int v5 = self->_height * self->_width;
  int v6 = [a3 iWidth];
  if (v5 > (int)([a3 iHeight] * v6)) {
    return 1;
  }
  int v8 = self->_height * self->_width;
  int v9 = [a3 iWidth];
  if (v8 != [a3 iHeight] * v9) {
    return -1;
  }
  float frameRate = self->_frameRate;
  [a3 fRate];
  if (frameRate > v11) {
    return 1;
  }
  float v12 = self->_frameRate;
  [a3 fRate];
  if (v12 == v13) {
    return 0;
  }
  else {
    return -1;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    int payload = self->_payload;
    if (payload == [a3 iPayload]
      && (int width = self->_width, width == [a3 iWidth])
      && (int height = self->_height, height == [a3 iHeight])
      && (float frameRate = self->_frameRate, [a3 fRate], frameRate == v10))
    {
      float priority = self->_priority;
      [a3 fPref];
      LOBYTE(v5) = priority == v12;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int64_t)compareByPref:(id)a3
{
  float priority = self->_priority;
  [a3 fPref];
  if (priority > v6) {
    return 1;
  }
  float v8 = self->_priority;
  [a3 fPref];
  if (v8 == v9) {
    return 0;
  }
  else {
    return -1;
  }
}

- (NSString)description
{
  v3 = NSString;
  double frameRate = self->_frameRate;
  uint64_t width = self->_width;
  uint64_t height = self->_height;
  [(VCVideoRule *)self fPref];
  return (NSString *)[v3 stringWithFormat:@"Video rule width %d height %d frame rate %.1f pref %.2f payload: %d", width, height, *(void *)&frameRate, v7, self->_payload];
}

- (void)setToVideoRule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a3 iWidth];
  uint64_t v6 = [a3 iHeight];
  [a3 fRate];
  -[VCVideoRule setFrameWidth:frameHeight:frameRate:](self, "setFrameWidth:frameHeight:frameRate:", v5, v6);
}

- (void)setFrameWidth:(int)a3 frameHeight:(int)a4 frameRate:(float)a5
{
  self->_uint64_t width = a3;
  self->_uint64_t height = a4;
  self->_double frameRate = a5;
}

- (BOOL)isVideoFullHD
{
  return self->_width * self->_height > 2073599;
}

- (float)fPref
{
  return self->_priority;
}

- (void)setFPref:(float)a3
{
  self->_float priority = a3;
}

- (int)iPayload
{
  return self->_payload;
}

@end