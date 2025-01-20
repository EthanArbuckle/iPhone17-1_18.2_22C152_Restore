@interface PHASEExternalInputStreamDefinition
+ (PHASEExternalInputStreamDefinition)new;
- (AVAudioFormat)format;
- (PHASEExternalInputStreamDefinition)init;
- (PHASEExternalInputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFrames:(unsigned int)a5;
- (PHASEExternalInputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFrames:(unsigned int)a5 audioSessionToken:(unsigned int)a6;
- (id)description;
- (int64_t)streamType;
- (unsigned)audioSessionToken;
- (unsigned)maximumFrames;
- (void)setFormat:(id)a3;
- (void)setMaximumFrames:(unsigned int)a3;
@end

@implementation PHASEExternalInputStreamDefinition

- (PHASEExternalInputStreamDefinition)init
{
  return 0;
}

+ (PHASEExternalInputStreamDefinition)new
{
  return 0;
}

- (PHASEExternalInputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFrames:(unsigned int)a5
{
  return [(PHASEExternalInputStreamDefinition *)self initWithStreamType:a3 format:a4 maximumFrames:*(void *)&a5 audioSessionToken:0];
}

- (PHASEExternalInputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFrames:(unsigned int)a5 audioSessionToken:(unsigned int)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHASEExternalInputStreamDefinition;
  v12 = [(PHASEExternalInputStreamDefinition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_streamType = a3;
    objc_storeStrong((id *)&v12->_format, a4);
    v13->_maximumFrames = a5;
    v13->_audioSessionToken = a6;
    if (!a6) {
      v13->_audioSessionToken = sDefaultAudioSessionToken();
    }
  }

  return v13;
}

- (void)setFormat:(id)a3
{
}

- (void)setMaximumFrames:(unsigned int)a3
{
  self->_maximumFrames = a3;
}

- (id)description
{
  v3 = NSString;
  uint64_t audioSessionToken = self->_audioSessionToken;
  int64_t streamType = self->_streamType;
  id v6 = [(AVAudioFormat *)self->_format description];
  v7 = [v3 stringWithFormat:@"<ExternalInputStreamDefinition@%p, type %d, audioSession 0x%x, format %s, max frames %d>", self, streamType, audioSessionToken, objc_msgSend(v6, "UTF8String"), self->_maximumFrames];

  return v7;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (unsigned)maximumFrames
{
  return self->_maximumFrames;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (void).cxx_destruct
{
}

@end