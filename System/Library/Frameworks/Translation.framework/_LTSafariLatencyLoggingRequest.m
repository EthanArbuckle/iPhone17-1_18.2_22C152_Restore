@interface _LTSafariLatencyLoggingRequest
+ (BOOL)supportsSecureCoding;
- (NSDictionary)dict;
- (NSString)processName;
- (_LTLocalePair)localePair;
- (_LTSafariLatencyLoggingRequest)init;
- (_LTSafariLatencyLoggingRequest)initWithCoder:(id)a3;
- (double)firstParagraphComplete;
- (double)firstResponse;
- (double)pageComplete;
- (double)progressComplete;
- (double)start;
- (void)encodeWithCoder:(id)a3;
- (void)markFirstParagraphComplete;
- (void)markPageComplete;
- (void)markProgressDone;
- (void)markResponse;
- (void)setLocalePair:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation _LTSafariLatencyLoggingRequest

- (void)encodeWithCoder:(id)a3
{
  double start = self->_start;
  id v5 = a3;
  [v5 encodeDouble:@"start" forKey:start];
  [v5 encodeDouble:@"firstResponse" forKey:self->_firstResponse];
  [v5 encodeDouble:@"firstParagraphComplete" forKey:self->_firstParagraphComplete];
  [v5 encodeDouble:@"progressComplete" forKey:self->_progressComplete];
  [v5 encodeDouble:@"pageComplete" forKey:self->_pageComplete];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
}

- (_LTSafariLatencyLoggingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTSafariLatencyLoggingRequest;
  id v5 = [(_LTSafariLatencyLoggingRequest *)&v15 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"start"];
    v5->_double start = v6;
    [v4 decodeDoubleForKey:@"firstResponse"];
    v5->_firstResponse = v7;
    [v4 decodeDoubleForKey:@"firstParagraphComplete"];
    v5->_firstParagraphComplete = v8;
    [v4 decodeDoubleForKey:@"progressComplete"];
    v5->_progressComplete = v9;
    [v4 decodeDoubleForKey:@"pageComplete"];
    v5->_pageComplete = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v11;

    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTSafariLatencyLoggingRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)_LTSafariLatencyLoggingRequest;
  v2 = [(_LTSafariLatencyLoggingRequest *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08AB0] processInfo];
    [v3 systemUptime];
    *((void *)v2 + 2) = v4;

    *((void *)v2 + 6) = 0xBFF0000000000000;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 24) = _Q0;
    double v10 = v2;
  }

  return (_LTSafariLatencyLoggingRequest *)v2;
}

- (void)markResponse
{
  if (self->_firstResponse < 0.0)
  {
    id v4 = [MEMORY[0x263F08AB0] processInfo];
    [v4 systemUptime];
    self->_firstResponse = v3;
  }
}

- (void)markFirstParagraphComplete
{
  if (self->_firstParagraphComplete < 0.0)
  {
    id v4 = [MEMORY[0x263F08AB0] processInfo];
    [v4 systemUptime];
    self->_firstParagraphComplete = v3;
  }
}

- (void)markProgressDone
{
  if (self->_progressComplete < 0.0)
  {
    id v4 = [MEMORY[0x263F08AB0] processInfo];
    [v4 systemUptime];
    self->_progressComplete = v3;
  }
}

- (void)markPageComplete
{
  if (self->_pageComplete < 0.0)
  {
    id v4 = [MEMORY[0x263F08AB0] processInfo];
    [v4 systemUptime];
    self->_pageComplete = v3;
  }
}

- (NSDictionary)dict
{
  v13[6] = *MEMORY[0x263EF8340];
  if (self->_firstResponse < 0.0) {
    self->_firstResponse = self->_start;
  }
  double start = self->_start;
  if (self->_firstParagraphComplete < 0.0) {
    self->_firstParagraphComplete = start;
  }
  if (self->_progressComplete < start) {
    self->_progressComplete = start;
  }
  v12[0] = @"localePair";
  id v4 = [(_LTLocalePair *)self->_localePair combinedLocaleIdentifier];
  processName = self->_processName;
  v13[0] = v4;
  v13[1] = processName;
  v12[1] = @"processName";
  v12[2] = @"timeToFirstResponse";
  double v6 = [NSNumber numberWithDouble:self->_firstResponse - self->_start];
  v13[2] = v6;
  v12[3] = @"timeToFirstParagraphComplete";
  double v7 = [NSNumber numberWithDouble:self->_firstParagraphComplete - self->_start];
  v13[3] = v7;
  v12[4] = @"timeToProgressComplete";
  double v8 = [NSNumber numberWithDouble:self->_progressComplete - self->_start];
  v13[4] = v8;
  v12[5] = @"timeToPageComplete";
  double v9 = [NSNumber numberWithDouble:self->_pageComplete - self->_start];
  v13[5] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];

  return (NSDictionary *)v10;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
}

- (double)start
{
  return self->_start;
}

- (double)firstResponse
{
  return self->_firstResponse;
}

- (double)firstParagraphComplete
{
  return self->_firstParagraphComplete;
}

- (double)progressComplete
{
  return self->_progressComplete;
}

- (double)pageComplete
{
  return self->_pageComplete;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_localePair, 0);
}

@end