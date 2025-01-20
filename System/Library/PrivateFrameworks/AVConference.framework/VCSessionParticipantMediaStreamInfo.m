@interface VCSessionParticipantMediaStreamInfo
- (BOOL)isOneToOneSupported;
- (NSArray)streamConfigs;
- (VCMediaStream)stream;
- (VCSessionParticipantMediaStreamInfo)init;
- (void)addStreamConfig:(id)a3;
- (void)dealloc;
- (void)setStream:(id)a3;
@end

@implementation VCSessionParticipantMediaStreamInfo

- (VCSessionParticipantMediaStreamInfo)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCSessionParticipantMediaStreamInfo;
  v2 = [(VCSessionParticipantMediaStreamInfo *)&v4 init];
  if (v2) {
    v2->_streamConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantMediaStreamInfo;
  [(VCSessionParticipantMediaStreamInfo *)&v3 dealloc];
}

- (void)addStreamConfig:(id)a3
{
  -[NSMutableArray addObject:](self->_streamConfigs, "addObject:");
  if (self->_isOneToOneSupported) {
    char v5 = 1;
  }
  else {
    char v5 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne");
  }
  self->_isOneToOneSupported = v5;
}

- (VCMediaStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (NSArray)streamConfigs
{
  return &self->_streamConfigs->super;
}

- (BOOL)isOneToOneSupported
{
  return self->_isOneToOneSupported;
}

@end