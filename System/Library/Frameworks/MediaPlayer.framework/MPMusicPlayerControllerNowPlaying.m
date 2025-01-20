@interface MPMusicPlayerControllerNowPlaying
+ (BOOL)supportsSecureCoding;
+ (MPMusicPlayerControllerNowPlaying)nowPlayingWithItem:(id)a3 itemIdentifier:(id)a4 artworkIdentifier:(id)a5 index:(int64_t)a6 count:(int64_t)a7;
+ (MPMusicPlayerControllerNowPlaying)nowPlayingWithItem:(id)a3 itemIdentifier:(id)a4 itemUID:(unint64_t)a5 artworkIdentifier:(id)a6 audioFormat:(id)a7 index:(int64_t)a8 count:(int64_t)a9;
- (MPMediaItem)item;
- (MPMusicPlayerControllerNowPlaying)initWithCoder:(id)a3;
- (MPNowPlayingInfoAudioFormat)audioFormat;
- (NSString)artworkIdentifier;
- (NSString)itemIdentifier;
- (id)_init;
- (int64_t)count;
- (int64_t)index;
- (unint64_t)itemUID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMusicPlayerControllerNowPlaying

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPMusicPlayerControllerNowPlaying)nowPlayingWithItem:(id)a3 itemIdentifier:(id)a4 itemUID:(unint64_t)a5 artworkIdentifier:(id)a6 audioFormat:(id)a7 index:(int64_t)a8 count:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  v19 = (void *)[objc_alloc((Class)a1) _init];
  v20 = (void *)v19[1];
  v19[1] = v15;
  id v21 = v15;

  v22 = (void *)v19[2];
  v19[2] = v18;
  id v23 = v18;

  v24 = (void *)v19[3];
  v19[3] = v16;
  id v25 = v16;

  v26 = (void *)v19[5];
  v19[4] = a5;
  v19[5] = v17;

  v19[6] = a8;
  v19[7] = a9;

  return (MPMusicPlayerControllerNowPlaying *)v19;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerControllerNowPlaying;
  return [(MPMusicPlayerControllerNowPlaying *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  item = self->_item;
  id v5 = a3;
  [v5 encodeObject:item forKey:@"item"];
  [v5 encodeObject:self->_audioFormat forKey:@"audioFormat"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"itemID"];
  [v5 encodeObject:self->_artworkIdentifier forKey:@"artworkID"];
  [v5 encodeInteger:self->_index forKey:@"idx"];
  [v5 encodeInteger:self->_count forKey:@"count"];
  [v5 encodeInt64:self->_itemUID forKey:@"uid"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_audioFormat, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)index
{
  return self->_index;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (unint64_t)itemUID
{
  return self->_itemUID;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (MPNowPlayingInfoAudioFormat)audioFormat
{
  return self->_audioFormat;
}

- (MPMediaItem)item
{
  return self->_item;
}

- (MPMusicPlayerControllerNowPlaying)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMusicPlayerControllerNowPlaying;
  id v5 = [(MPMusicPlayerControllerNowPlaying *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"item"];
    item = v5->_item;
    v5->_item = (MPMediaItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioFormat"];
    audioFormat = v5->_audioFormat;
    v5->_audioFormat = (MPNowPlayingInfoAudioFormat *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkID"];
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v12;

    v5->_index = [v4 decodeIntegerForKey:@"idx"];
    v5->_count = [v4 decodeIntegerForKey:@"count"];
    v5->_itemUID = [v4 decodeInt64ForKey:@"uid"];
  }

  return v5;
}

+ (MPMusicPlayerControllerNowPlaying)nowPlayingWithItem:(id)a3 itemIdentifier:(id)a4 artworkIdentifier:(id)a5 index:(int64_t)a6 count:(int64_t)a7
{
  return +[MPMusicPlayerControllerNowPlaying nowPlayingWithItem:a3 itemIdentifier:a4 itemUID:0 artworkIdentifier:a5 audioFormat:0 index:a6 count:a7];
}

@end