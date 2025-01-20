@interface PHASEVolumeCommandForVolumeCategoryMode
- (NSString)volumeCategory;
- (NSString)volumeMode;
- (PHASESessionVolume)volume;
- (PHASEVolumeCommandForVolumeCategoryMode)initWithCategory:(id)a3 mode:(id)a4 volume:(id)a5;
- (id)description;
- (id)initInternalWithCategory:(id)a3 mode:(id)a4;
@end

@implementation PHASEVolumeCommandForVolumeCategoryMode

- (id)initInternalWithCategory:(id)a3 mode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHASEVolumeCommandForVolumeCategoryMode;
  v9 = [(PHASEVolumeCommand *)&v12 initInternal];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong(v10 + 2, a4);
  }

  return v10;
}

- (PHASEVolumeCommandForVolumeCategoryMode)initWithCategory:(id)a3 mode:(id)a4 volume:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (Phase::Logger *)a4;
  v10 = v9;
  if (a5)
  {
    self = (PHASEVolumeCommandForVolumeCategoryMode *)[(PHASEVolumeCommandForVolumeCategoryMode *)self initInternalWithCategory:v8 mode:v9];
    v11 = self;
  }
  else
  {
    objc_super v12 = **(id **)(Phase::Logger::GetInstance(v9) + 432);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "PHASESessionVolume.mm";
      __int16 v16 = 1024;
      int v17 = 164;
      _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid volume argument", (uint8_t *)&v14, 0x12u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  v4 = NSString;
  id v5 = [(NSString *)self->_volumeCategory description];
  uint64_t v6 = [v5 UTF8String];
  id v7 = [(NSString *)self->_volumeMode description];
  uint64_t v8 = [v7 UTF8String];
  volume = self->_volume;
  if (volume)
  {
    id v2 = [(PHASESessionVolume *)volume description];
    v10 = (const char *)[v2 UTF8String];
  }
  else
  {
    v10 = "-";
  }
  v11 = [v4 stringWithFormat:@"VolumeCommandForVolumeCategoryMode: category/mode [%s, %s], volume %s", v6, v8, v10];
  if (volume) {

  }
  return v11;
}

- (NSString)volumeCategory
{
  return self->_volumeCategory;
}

- (NSString)volumeMode
{
  return self->_volumeMode;
}

- (PHASESessionVolume)volume
{
  return self->_volume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_volumeMode, 0);

  objc_storeStrong((id *)&self->_volumeCategory, 0);
}

@end