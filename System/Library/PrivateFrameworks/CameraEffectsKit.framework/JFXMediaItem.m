@interface JFXMediaItem
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeAddedToSequence;
- (BOOL)canHaveFilter;
- (BOOL)canSaveToCameraRoll;
- (BOOL)hasAudibleCharacteristic;
- (BOOL)hasPhotoCharacteristic;
- (BOOL)hasVisualCharacteristic;
- (BOOL)isEqual:(id)a3;
- (JFXMediaItem)init;
- (JFXMediaItem)initWithInfo:(id)a3 delegate:(id)a4;
- (JFXMediaItemDelegate)delegate;
- (PVColorSpace)colorSpace;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)info;
- (int)durationAt30fps;
- (int)playableMediaContentMode;
- (int64_t)interfaceOrientationForDisplay;
- (int64_t)mediaLoadState;
- (int64_t)mediaState;
- (int64_t)mediaType;
- (unint64_t)hash;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDurationAt30fps:(int)a3;
- (void)setInterfaceOrientationForDisplay:(int64_t)a3;
- (void)setMediaLoadState:(int64_t)a3;
- (void)setMediaState:(int64_t)a3;
- (void)setMediaType:(int64_t)a3;
@end

@implementation JFXMediaItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXMediaItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXMediaItem;
  result = [(JFXMediaItem *)&v3 init];
  if (result)
  {
    result->_mediaType = 0;
    result->_mediaState = 0;
    result->_durationAt30fps = 1;
    *(_OWORD *)&result->_mediaLoadState = xmmword_234D61160;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)JFXMediaItem;
  [(JFXMediaItem *)&v2 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"media type: %ld, duration: %ld", self->_mediaType, self->_durationAt30fps];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_mediaType;
  *((_DWORD *)result + 2) = self->_durationAt30fps;
  *((void *)result + 5) = self->_interfaceOrientationForDisplay;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (JFXMediaItem *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(JFXMediaItem *)self mediaType];
      BOOL v8 = 0;
      if (v6 == [(JFXMediaItem *)v5 mediaType])
      {
        int v7 = [(JFXMediaItem *)self durationAt30fps];
        if (v7 == [(JFXMediaItem *)v5 durationAt30fps]) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JFXMediaItem;
  return [(JFXMediaItem *)&v3 hash];
}

- (PVColorSpace)colorSpace
{
  return 0;
}

- (int)playableMediaContentMode
{
  return 1;
}

- (BOOL)canSaveToCameraRoll
{
  return 0;
}

- (BOOL)canBeAddedToSequence
{
  return 0;
}

- (BOOL)canHaveFilter
{
  return 1;
}

- (BOOL)hasAudibleCharacteristic
{
  return 0;
}

- (BOOL)hasVisualCharacteristic
{
  return 0;
}

- (BOOL)hasPhotoCharacteristic
{
  return 0;
}

- (JFXMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(JFXMediaItem *)self init];
  objc_storeWeak((id *)&v8->_delegate, v6);

  v9 = [v7 objectForKey:kMediaItemTypeKey];
  v8->_mediaType = (int)[v9 intValue];

  v10 = [v7 objectForKey:kMediaItemDurationKey];
  v8->_durationAt30fps = [v10 intValue];

  v11 = [v7 objectForKey:kMediaItemInterfaceOrientationForDisplayKey];

  v8->_interfaceOrientationForDisplay = (int)[v11 intValue];
  return v8;
}

- (id)info
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInteger:self->_mediaType];
  [v3 setObject:v4 forKey:kMediaItemTypeKey];

  v5 = [NSNumber numberWithInteger:self->_durationAt30fps];
  [v3 setObject:v5 forKey:kMediaItemDurationKey];

  id v6 = [NSNumber numberWithInteger:self->_interfaceOrientationForDisplay];
  [v3 setObject:v6 forKey:kMediaItemInterfaceOrientationForDisplayKey];

  return v3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaState
{
  return self->_mediaState;
}

- (void)setMediaState:(int64_t)a3
{
  self->_mediaState = a3;
}

- (int64_t)mediaLoadState
{
  return self->_mediaLoadState;
}

- (void)setMediaLoadState:(int64_t)a3
{
  self->_mediaLoadState = a3;
}

- (int)durationAt30fps
{
  return self->_durationAt30fps;
}

- (void)setDurationAt30fps:(int)a3
{
  self->_durationAt30fps = a3;
}

- (int64_t)interfaceOrientationForDisplay
{
  return self->_interfaceOrientationForDisplay;
}

- (void)setInterfaceOrientationForDisplay:(int64_t)a3
{
  self->_interfaceOrientationForDisplay = a3;
}

- (JFXMediaItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JFXMediaItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end