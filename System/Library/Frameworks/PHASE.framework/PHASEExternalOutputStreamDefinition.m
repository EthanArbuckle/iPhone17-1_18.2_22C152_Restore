@interface PHASEExternalOutputStreamDefinition
+ (PHASEExternalOutputStreamDefinition)new;
- (AVAudioFormat)format;
- (PHASEExternalOutputStreamDefinition)init;
- (PHASEExternalOutputStreamDefinition)initWithStreamCollection:(id)a3 index:(unint64_t)a4 format:(id)a5 maximumFramesToRender:(unsigned int)a6 audioSessionToken:(unsigned int)a7;
- (PHASEExternalOutputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFramesToRender:(unsigned int)a5;
- (PHASEExternalOutputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFramesToRender:(unsigned int)a5 audioSessionToken:(unsigned int)a6;
- (PHASEExternalStreamCollection)streamCollection;
- (id)description;
- (int64_t)streamType;
- (unint64_t)streamIndex;
- (unsigned)audioSessionToken;
- (unsigned)maximumFramesToRender;
- (void)setFormat:(id)a3;
- (void)setMaximumFramesToRender:(unsigned int)a3;
@end

@implementation PHASEExternalOutputStreamDefinition

- (PHASEExternalOutputStreamDefinition)init
{
  return 0;
}

+ (PHASEExternalOutputStreamDefinition)new
{
  return 0;
}

- (PHASEExternalOutputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFramesToRender:(unsigned int)a5
{
  return [(PHASEExternalOutputStreamDefinition *)self initWithStreamType:a3 format:a4 maximumFramesToRender:*(void *)&a5 audioSessionToken:0];
}

- (PHASEExternalOutputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFramesToRender:(unsigned int)a5 audioSessionToken:(unsigned int)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHASEExternalOutputStreamDefinition;
  v12 = [(PHASEExternalOutputStreamDefinition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_streamType = a3;
    objc_storeStrong((id *)&v12->_format, a4);
    v13->_maximumFramesToRender = a5;
    v13->_audioSessionToken = a6;
    if (!a6) {
      v13->_audioSessionToken = sDefaultAudioSessionToken();
    }
  }

  return v13;
}

- (PHASEExternalOutputStreamDefinition)initWithStreamCollection:(id)a3 index:(unint64_t)a4 format:(id)a5 maximumFramesToRender:(unsigned int)a6 audioSessionToken:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  objc_super v15 = (Phase::Logger *)[v13 streamCount];
  if ((unint64_t)v15 <= a4)
  {
    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v15)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315906;
      v22 = "PHASEExternalStream.mm";
      __int16 v23 = 1024;
      int v24 = 302;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = [v13 streamCount];
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream index %lu for stream count %lu", (uint8_t *)&v21, 0x26u);
    }

    v18 = 0;
  }
  else
  {
    v16 = -[PHASEExternalOutputStreamDefinition initWithStreamType:format:maximumFramesToRender:audioSessionToken:](self, "initWithStreamType:format:maximumFramesToRender:audioSessionToken:", [v13 streamType], v14, v8, v7);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_streamCollection, a3);
      v17->_streamIndex = a4;
    }
    self = v17;
    v18 = self;
  }

  return v18;
}

- (id)description
{
  v4 = NSString;
  uint64_t streamType_low = LODWORD(self->_streamType);
  streamCollection = self->_streamCollection;
  if (streamCollection)
  {
    v2 = [(PHASEExternalStreamCollection *)self->_streamCollection uuid];
    uint64_t v7 = [v2 UUIDString];
  }
  else
  {
    uint64_t v7 = @"-";
  }
  unint64_t streamIndex = self->_streamIndex;
  uint64_t audioSessionToken = self->_audioSessionToken;
  id v10 = [(AVAudioFormat *)self->_format description];
  id v11 = [v4 stringWithFormat:@"<ExternalOutputStreamDefinition@%p, type %d, collection [%@, %lu], audioSession 0x%x, format %s, max frames %d>", self, streamType_low, v7, streamIndex, audioSessionToken, objc_msgSend(v10, "UTF8String"), self->_maximumFramesToRender];

  if (streamCollection)
  {
  }

  return v11;
}

- (void)setFormat:(id)a3
{
}

- (void)setMaximumFramesToRender:(unsigned int)a3
{
  self->_maximumFramesToRender = a3;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (unsigned)maximumFramesToRender
{
  return self->_maximumFramesToRender;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (PHASEExternalStreamCollection)streamCollection
{
  return self->_streamCollection;
}

- (unint64_t)streamIndex
{
  return self->_streamIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamCollection, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

@end