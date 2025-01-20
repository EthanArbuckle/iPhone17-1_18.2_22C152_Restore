@interface PHASEVolumeCommandForVolumeCategoryModeAndSession
- (PHASEVolumeCommandForVolumeCategoryModeAndSession)initWithCategory:(id)a3 mode:(id)a4 sessionToken:(unsigned int)a5;
- (id)description;
- (unsigned)audioSessionToken;
@end

@implementation PHASEVolumeCommandForVolumeCategoryModeAndSession

- (PHASEVolumeCommandForVolumeCategoryModeAndSession)initWithCategory:(id)a3 mode:(id)a4 sessionToken:(unsigned int)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (Phase::Logger *)a4;
  v10 = v9;
  if (a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)PHASEVolumeCommandForVolumeCategoryModeAndSession;
    v11 = [(PHASEVolumeCommandForVolumeCategoryMode *)&v15 initInternalWithCategory:v8 mode:v9];
    if (v11) {
      v11[8] = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v13 = **(id **)(Phase::Logger::GetInstance(v9) + 432);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "PHASESessionVolume.mm";
      __int16 v18 = 1024;
      int v19 = 195;
      __int16 v20 = 1024;
      int v21 = 0;
      _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid audio session token 0x%x", buf, 0x18u);
    }
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PHASEVolumeCommandForVolumeCategoryMode *)self volumeCategory];
  id v5 = [v4 description];
  uint64_t v6 = [v5 UTF8String];
  v7 = [(PHASEVolumeCommandForVolumeCategoryMode *)self volumeMode];
  id v8 = [v7 description];
  v9 = [v3 stringWithFormat:@"VolumeCommandForVolumeCategoryModeAndSession: category/mode [%s, %s], session 0x%x", v6, objc_msgSend(v8, "UTF8String"), self->_audioSessionToken];

  return v9;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

@end