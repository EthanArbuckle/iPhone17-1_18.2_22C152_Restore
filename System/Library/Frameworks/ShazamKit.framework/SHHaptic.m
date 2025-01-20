@interface SHHaptic
+ (BOOL)supportsSecureCoding;
- (NSArray)spatialOffsets;
- (NSArray)tracks;
- (NSError)tracksError;
- (SHHaptic)initWithCoder:(id)a3;
- (SHHaptic)initWithHapticTracks:(id)a3 representingMediaItem:(id)a4 spatialOffsets:(id)a5 error:(id)a6;
- (SHMediaItem)mediaItem;
- (id)tracksWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHHaptic

- (SHHaptic)initWithHapticTracks:(id)a3 representingMediaItem:(id)a4 spatialOffsets:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SHHaptic;
  v15 = [(SHHaptic *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tracks, a3);
    objc_storeStrong((id *)&v16->_mediaItem, a4);
    objc_storeStrong((id *)&v16->_spatialOffsets, a5);
    objc_storeStrong((id *)&v16->_tracksError, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHHaptic)initWithCoder:(id)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SHHapticMediaItemKey"];
  v9 = [v5 decodeObjectOfClasses:v7 forKey:@"SHHapticItemsKey"];
  v10 = [v5 decodeObjectOfClasses:v7 forKey:@"SHHapticSpatialOffsetKey"];

  id v11 = [(SHHaptic *)self initWithHapticTracks:v9 representingMediaItem:v8 spatialOffsets:v10 error:0];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SHHaptic *)self mediaItem];
  [v4 encodeObject:v5 forKey:@"SHHapticMediaItemKey"];

  v6 = [(SHHaptic *)self tracks];
  [v4 encodeObject:v6 forKey:@"SHHapticItemsKey"];

  id v7 = [(SHHaptic *)self spatialOffsets];
  [v4 encodeObject:v7 forKey:@"SHHapticSpatialOffsetKey"];
}

- (id)tracksWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = [(SHHaptic *)self tracksError];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263F6C498];
    id v7 = [(SHHaptic *)self tracksError];
    [v6 annotateError:a3 withError:v7];

    v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(SHHaptic *)self tracksError];
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_224B4B000, v8, OS_LOG_TYPE_ERROR, "Error with fetching haptic track %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v10 = [(SHHaptic *)self tracks];

  return v10;
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSArray)spatialOffsets
{
  return self->_spatialOffsets;
}

- (NSArray)tracks
{
  return self->_tracks;
}

- (NSError)tracksError
{
  return self->_tracksError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracksError, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_spatialOffsets, 0);

  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end