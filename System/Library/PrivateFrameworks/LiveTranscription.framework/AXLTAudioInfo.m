@interface AXLTAudioInfo
- (AXLTAudioInfo)initWithAudioInfo:(id)a3 requestType:(int64_t)a4 pid:(int)a5;
- (NSArray)audioHistogram;
- (int)pid;
- (int64_t)requestType;
- (void)setAudioHistogram:(id)a3;
- (void)setPid:(int)a3;
- (void)setRequestType:(int64_t)a3;
@end

@implementation AXLTAudioInfo

- (AXLTAudioInfo)initWithAudioInfo:(id)a3 requestType:(int64_t)a4 pid:(int)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXLTAudioInfo;
  v10 = [(AXLTAudioInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_requestType = a4;
    v10->_pid = a5;
    objc_storeStrong((id *)&v10->_audioHistogram, a3);
  }

  return v11;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSArray)audioHistogram
{
  return self->_audioHistogram;
}

- (void)setAudioHistogram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end