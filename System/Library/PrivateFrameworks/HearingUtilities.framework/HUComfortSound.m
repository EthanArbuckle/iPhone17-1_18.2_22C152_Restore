@interface HUComfortSound
+ (BOOL)supportsSecureCoding;
+ (id)comfortSoundWithAsset:(id)a3;
+ (id)defaultComfortSoundForGroup:(unint64_t)a3;
+ (id)soundWithName:(id)a3 path:(id)a4 andGroup:(unint64_t)a5;
- (AXAsset)asset;
- (BOOL)isEqual:(id)a3;
- (HUComfortSound)initWithCoder:(id)a3;
- (HUComfortSoundsShuffler)fileShuffler;
- (NSString)name;
- (NSURL)path;
- (id)description;
- (id)localizedName;
- (id)nextFilePath;
- (unint64_t)soundGroup;
- (void)encodeWithCoder:(id)a3;
- (void)nextFilePath;
- (void)setAsset:(id)a3;
- (void)setFileShuffler:(id)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
- (void)setSoundGroup:(unint64_t)a3;
@end

@implementation HUComfortSound

+ (id)comfortSoundWithAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 properties];
  v5 = [v4 valueForKey:@"SoundName"];
  v6 = [v3 localURL];
  v7 = [v3 properties];
  v8 = [v7 valueForKey:@"SoundGroup"];
  v9 = +[HUComfortSound soundWithName:path:andGroup:](HUComfortSound, "soundWithName:path:andGroup:", v5, v6, [v8 unsignedIntegerValue]);

  [v9 setAsset:v3];

  return v9;
}

+ (id)defaultComfortSoundForGroup:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    v4 = 0;
  }
  else {
    v4 = off_2640FCAF0[a3 - 1];
  }
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"m4a"];
  v7 = +[HUComfortSound soundWithName:v4 path:v6 andGroup:a3];

  return v7;
}

+ (id)soundWithName:(id)a3 path:(id)a4 andGroup:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    v9 = objc_alloc_init(HUComfortSound);
    [(HUComfortSound *)v9 setName:v7];
    [(HUComfortSound *)v9 setPath:v8];
    [(HUComfortSound *)v9 setSoundGroup:a5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HUComfortSound)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUComfortSound;
  v5 = [(HUComfortSound *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HUComfortSoundNameKey"];
    [(HUComfortSound *)v5 setName:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HUComfortSoundPathKey"];
    [(HUComfortSound *)v5 setPath:v7];

    -[HUComfortSound setSoundGroup:](v5, "setSoundGroup:", [v4 decodeIntegerForKey:@"HUComfortSoundGroupKey"]);
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HUComfortSoundAssetKey"];
    [(HUComfortSound *)v5 setAsset:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HUComfortSound *)self name];
  [v4 encodeObject:v5 forKey:@"HUComfortSoundNameKey"];

  v6 = [(HUComfortSound *)self path];
  [v4 encodeObject:v6 forKey:@"HUComfortSoundPathKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HUComfortSound soundGroup](self, "soundGroup"), @"HUComfortSoundGroupKey");
  id v7 = [(HUComfortSound *)self asset];
  [v4 encodeObject:v7 forKey:@"HUComfortSoundAssetKey"];
}

- (id)localizedName
{
  v2 = NSString;
  id v3 = [(HUComfortSound *)self name];
  id v4 = [v2 stringWithFormat:@"%@_%@", @"ComfortSound", v3];
  v5 = hearingLocString(v4);

  return v5;
}

- (id)nextFilePath
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = [(HUComfortSound *)self path];

  if (!v3)
  {
    id v4 = *MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_FAULT)) {
      [(HUComfortSound *)(uint64_t)self nextFilePath];
    }
  }
  fileShuffler = self->_fileShuffler;
  if (!fileShuffler)
  {
    v6 = [(HUComfortSound *)self path];
    id v7 = [v6 pathExtension];
    int v8 = [v7 isEqualToString:@"m4a"];

    if (v8)
    {
      v26[0] = v6;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
      id v10 = 0;
LABEL_15:
      v19 = +[HUComfortSoundsShuffler shufflerWithArray:v9];
      v20 = self->_fileShuffler;
      self->_fileShuffler = v19;

      fileShuffler = self->_fileShuffler;
      goto LABEL_16;
    }
    v11 = [MEMORY[0x263F08850] defaultManager];
    id v23 = 0;
    v12 = [v11 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:0 error:&v23];
    id v10 = v23;

    if (v10)
    {
      CSInitializeLogging();
      v13 = [NSString stringWithFormat:@"Error loading assets %@", v10];
      v14 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSound nextFilePath]", 178, v13];
      v15 = (void *)*MEMORY[0x263F47288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v14;
        v17 = v15;
        uint64_t v18 = [v16 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v25 = v18;
        _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else if ([v12 count])
    {
      v9 = objc_msgSend(v12, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
      goto LABEL_14;
    }
    v9 = 0;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  v21 = [(HUComfortSoundsShuffler *)fileShuffler nextObject];

  return v21;
}

uint64_t __30__HUComfortSound_nextFilePath__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"m4a"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 path];
    v6 = [(HUComfortSound *)self path];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HUComfortSound;
  id v4 = [(HUComfortSound *)&v10 description];
  v5 = [(HUComfortSound *)self name];
  unint64_t v6 = [(HUComfortSound *)self soundGroup];
  char v7 = [(HUComfortSound *)self path];
  int v8 = [v3 stringWithFormat:@"%@ - %@ [%lu] = %@", v4, v5, v6, v7];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSURL)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)soundGroup
{
  return self->_soundGroup;
}

- (void)setSoundGroup:(unint64_t)a3
{
  self->_soundGroup = a3;
}

- (AXAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (HUComfortSoundsShuffler)fileShuffler
{
  return self->_fileShuffler;
}

- (void)setFileShuffler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileShuffler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)nextFilePath
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_20CC86000, a2, OS_LOG_TYPE_FAULT, "Comfort sound path is nil %@", (uint8_t *)&v2, 0xCu);
}

@end