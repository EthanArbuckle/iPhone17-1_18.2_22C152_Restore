@interface HFPlaybackArchive
- (BOOL)isAutoPlayEnabled;
- (BOOL)isRepeatEnabled;
- (BOOL)isRepeatSupported;
- (BOOL)isShuffleEnabled;
- (BOOL)isShuffleSupported;
- (HFPlaybackArchive)initWithMediaPlayerPlaybackArchive:(id)a3;
- (MPPlaybackArchive)mediaPlayerPlaybackArchive;
- (NSData)artworkImageData;
- (unint64_t)targetOptions;
- (void)setArtworkImageData:(id)a3;
- (void)setAutoPlayEnabled:(BOOL)a3;
- (void)setMediaPlayerPlaybackArchive:(id)a3;
- (void)setRepeatEnabled:(BOOL)a3;
- (void)setShuffleEnabled:(BOOL)a3;
- (void)setTargetOptions:(unint64_t)a3;
@end

@implementation HFPlaybackArchive

- (HFPlaybackArchive)initWithMediaPlayerPlaybackArchive:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFPlaybackArchive;
  v6 = [(HFPlaybackArchive *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaPlayerPlaybackArchive, a3);
  }

  return v7;
}

- (unint64_t)targetOptions
{
  if ([(HFPlaybackArchive *)self isShuffleEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = [(HFPlaybackArchive *)self isRepeatEnabled];
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)setTargetOptions:(unint64_t)a3
{
  [(HFPlaybackArchive *)self setShuffleEnabled:(a3 >> 1) & 1];
  [(HFPlaybackArchive *)self setRepeatEnabled:(a3 >> 2) & 1];
}

- (BOOL)isShuffleSupported
{
  v2 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  unint64_t v3 = ((unint64_t)[v2 supportedOptions] >> 1) & 1;

  return v3;
}

- (BOOL)isShuffleEnabled
{
  v2 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  char v3 = [v2 BOOLValueForOption:1];

  return v3;
}

- (void)setShuffleEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  [v4 setBOOLValue:v3 forOption:1];
}

- (BOOL)isRepeatSupported
{
  v2 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  unint64_t v3 = ((unint64_t)[v2 supportedOptions] >> 2) & 1;

  return v3;
}

- (BOOL)isRepeatEnabled
{
  v2 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  char v3 = [v2 BOOLValueForOption:2];

  return v3;
}

- (void)setRepeatEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  [v4 setBOOLValue:v3 forOption:2];
}

- (void)setAutoPlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
  [v4 setBOOLValue:v3 forOption:3];
}

- (NSData)artworkImageData
{
  artworkImageData = self->_artworkImageData;
  if (artworkImageData)
  {
    BOOL v3 = artworkImageData;
  }
  else
  {
    id v4 = [(HFPlaybackArchive *)self mediaPlayerPlaybackArchive];
    uint64_t v5 = [v4 displayProperties];
    BOOL v3 = [v5 artworkImageData];
  }
  return v3;
}

- (MPPlaybackArchive)mediaPlayerPlaybackArchive
{
  return self->_mediaPlayerPlaybackArchive;
}

- (void)setMediaPlayerPlaybackArchive:(id)a3
{
}

- (BOOL)isAutoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (void)setArtworkImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImageData, 0);
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackArchive, 0);
}

@end