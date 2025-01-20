@interface PHASEVolumeCommandForSession
- (PHASESessionVolume)volume;
- (PHASEVolumeCommandForSession)initWithSessionToken:(unsigned int)a3;
- (id)description;
- (id)initInternalWithSessionToken:(unsigned int)a3 volume:(id)a4;
- (unsigned)audioSessionToken;
@end

@implementation PHASEVolumeCommandForSession

- (id)initInternalWithSessionToken:(unsigned int)a3 volume:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v7 = (Phase::Logger *)a4;
  v8 = v7;
  if (a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)PHASEVolumeCommandForSession;
    v9 = [(PHASEVolumeCommand *)&v14 initInternal];
    v10 = v9;
    if (v9)
    {
      *((_DWORD *)v9 + 2) = a3;
      objc_storeStrong(v9 + 2, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = **(id **)(Phase::Logger::GetInstance(v7) + 432);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "PHASESessionVolume.mm";
      __int16 v17 = 1024;
      int v18 = 84;
      __int16 v19 = 1024;
      int v20 = 0;
      _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid audio session token 0x%x", buf, 0x18u);
    }
    v11 = 0;
  }

  return v11;
}

- (PHASEVolumeCommandForSession)initWithSessionToken:(unsigned int)a3
{
  return (PHASEVolumeCommandForSession *)[(PHASEVolumeCommandForSession *)self initInternalWithSessionToken:*(void *)&a3 volume:0];
}

- (id)description
{
  v3 = NSString;
  uint64_t audioSessionToken = self->_audioSessionToken;
  volume = self->_volume;
  if (volume)
  {
    id v2 = [(PHASESessionVolume *)self->_volume description];
    v6 = (const char *)[v2 UTF8String];
  }
  else
  {
    v6 = "-";
  }
  v7 = [v3 stringWithFormat:@"VolumeCommandForSession: session 0x%x, volume %s", audioSessionToken, v6];
  if (volume) {

  }
  return v7;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (PHASESessionVolume)volume
{
  return self->_volume;
}

- (void).cxx_destruct
{
}

@end