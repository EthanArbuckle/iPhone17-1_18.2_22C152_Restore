@interface PHASETapDescription
- (AVAudioFormat)format;
- (NSString)sceneIdentifier;
- (NSString)uidString;
- (PHASETapDescription)initWithAudioSessionToken:(unsigned int)a3 tapType:(int64_t)a4;
- (PHASETapDescription)initWithProcessIdentifier:(int)a3 tapType:(int64_t)a4;
- (PHASETapDescription)initWithSceneIdentifier:(id)a3 tapType:(int64_t)a4;
- (PHASETapDescription)initWithStreamType:(int64_t)a3 tapType:(int64_t)a4;
- (id)initInternalWithType:(int64_t)a3;
- (id)initScreenSharingTapOfType:(int64_t)a3;
- (id)initSystemTapOfType:(int64_t)a3;
- (int)processIdentifier;
- (int64_t)binding;
- (int64_t)streamType;
- (int64_t)type;
- (unsigned)audioSessionToken;
@end

@implementation PHASETapDescription

- (id)initInternalWithType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PHASETapDescription;
  v4 = [(PHASETapDescription *)&v12 init];
  v5 = v4;
  if (v4)
  {
    uidString = v4->_uidString;
    v4->_uidString = 0;

    v5->_type = a3;
    *(_OWORD *)&v5->_binding = xmmword_2220A59B0;
    v5->_audioSessionToken = 0;
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = 0;

    v5->_processIdentifier = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:6553601];
    uint64_t v9 = [objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:1 sampleRate:0 interleaved:v8 channelLayout:48000.0];
    format = v5->_format;
    v5->_format = (AVAudioFormat *)v9;
  }
  return v5;
}

- (id)initSystemTapOfType:(int64_t)a3
{
  id result = [(PHASETapDescription *)self initInternalWithType:a3];
  if (result) {
    *((void *)result + 4) = 0;
  }
  return result;
}

- (id)initScreenSharingTapOfType:(int64_t)a3
{
  id result = [(PHASETapDescription *)self initInternalWithType:a3];
  if (result) {
    *((void *)result + 4) = 5;
  }
  return result;
}

- (PHASETapDescription)initWithProcessIdentifier:(int)a3 tapType:(int64_t)a4
{
  v5 = self;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 <= 0)
  {
    v8 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      v11 = "PHASETaps.mm";
      __int16 v12 = 1024;
      int v13 = 124;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid processIdentifier %d", (uint8_t *)&v10, 0x18u);
    }
    v7 = 0;
  }
  else
  {
    v6 = [(PHASETapDescription *)self initInternalWithType:a4];
    if (v6)
    {
      v6[4] = 1;
      *((_DWORD *)v6 + 5) = a3;
    }
    v5 = v6;
    v7 = v5;
  }

  return v7;
}

- (PHASETapDescription)initWithAudioSessionToken:(unsigned int)a3 tapType:(int64_t)a4
{
  v5 = self;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 + 1 > 1)
  {
    v8 = [(PHASETapDescription *)self initInternalWithType:a4];
    if (v8)
    {
      v8[4] = 2;
      *((_DWORD *)v8 + 4) = a3;
    }
    v5 = v8;
    v7 = v5;
  }
  else
  {
    v6 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      v11 = "PHASETaps.mm";
      __int16 v12 = 1024;
      int v13 = 141;
      __int16 v14 = 1024;
      unsigned int v15 = a3;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid audioSessionToken 0x%x", (uint8_t *)&v10, 0x18u);
    }
    v7 = 0;
  }

  return v7;
}

- (PHASETapDescription)initWithSceneIdentifier:(id)a3 tapType:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v7 = (Phase::Logger *)a3;
  v8 = v7;
  if (v7 && (v7 = (Phase::Logger *)[(Phase::Logger *)v7 length]) != 0)
  {
    uint64_t v9 = [(PHASETapDescription *)self initInternalWithType:a4];
    int v10 = v9;
    if (v9)
    {
      v9[4] = (id)3;
      objc_storeStrong(v9 + 6, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    __int16 v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315650;
      unsigned int v15 = "PHASETaps.mm";
      __int16 v16 = 1024;
      int v17 = 158;
      __int16 v18 = 2080;
      uint64_t v19 = [(Phase::Logger *)v8 UTF8String];
      _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid sceneIdentifier %s", (uint8_t *)&v14, 0x1Cu);
    }

    v11 = 0;
  }

  return v11;
}

- (PHASETapDescription)initWithStreamType:(int64_t)a3 tapType:(int64_t)a4
{
  v4 = self;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    v5 = [(PHASETapDescription *)self initInternalWithType:a4];
    if (v5) {
      v5[2] = xmmword_2220A4EC0;
    }
    v4 = v5;
    v6 = v4;
  }
  else
  {
    v8 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      v11 = "PHASETaps.mm";
      __int16 v12 = 1024;
      int v13 = 175;
      __int16 v14 = 2048;
      int64_t v15 = a3;
      _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid streamType %ld", (uint8_t *)&v10, 0x1Cu);
    }
    v6 = 0;
  }

  return v6;
}

- (NSString)uidString
{
  uidString = self->_uidString;
  if (!uidString || ![(NSMutableString *)uidString length])
  {
    v4 = (NSMutableString *)objc_opt_new();
    v5 = self->_uidString;
    self->_uidString = v4;

    int64_t type = self->_type;
    v7 = "Default";
    if (type == 1) {
      v7 = "PreSpatial_PreSessionVolume";
    }
    if (type) {
      v8 = v7;
    }
    else {
      v8 = "PreSpatial";
    }
    [(NSMutableString *)self->_uidString appendFormat:@"PhaseTap-%s-", v8];
    switch(self->_binding)
    {
      case 0:
        uint64_t v9 = self->_uidString;
        int v10 = @"System";
        goto LABEL_15;
      case 1:
        [(NSMutableString *)self->_uidString appendFormat:@"Process-%d", self->_processIdentifier];
        break;
      case 2:
        [(NSMutableString *)self->_uidString appendFormat:@"SessionID-0x%x", self->_audioSessionToken];
        break;
      case 3:
        [(NSMutableString *)self->_uidString appendFormat:@"SceneID-%s", [(NSString *)self->_sceneIdentifier UTF8String]];
        break;
      case 4:
        [(NSMutableString *)self->_uidString appendFormat:@"Stream-%d", self->_streamType];
        break;
      case 5:
        uint64_t v9 = self->_uidString;
        int v10 = @"ScreenSharing";
LABEL_15:
        -[NSMutableString appendFormat:](v9, "appendFormat:", v10, v13);
        break;
      default:
        break;
    }
  }
  v11 = (void *)[(NSMutableString *)self->_uidString copy];

  return (NSString *)v11;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)binding
{
  return self->_binding;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);

  objc_storeStrong((id *)&self->_uidString, 0);
}

@end