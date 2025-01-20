@interface AVAssetTrackEnumerator
+ (id)trackEnumeratorWithAsset:(id)a3;
- (AVAssetTrackEnumerator)initWithAsset:(id)a3;
- (AVAssetTrackEnumerator)initWithAsset:(id)a3 mediaCharacteristics:(id)a4;
- (AVAssetTrackEnumerator)initWithAsset:(id)a3 mediaType:(id)a4;
- (id)nextObject;
- (void)dealloc;
- (void)setMediaCharacteristics:(id)a3;
- (void)setMediaType:(id)a3;
@end

@implementation AVAssetTrackEnumerator

+ (id)trackEnumeratorWithAsset:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAsset:a3];
  return v3;
}

- (AVAssetTrackEnumerator)initWithAsset:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVAssetTrackEnumerator;
    v4 = [(AVAssetTrackEnumerator *)&v6 init];
    if (v4) {
      v4->_enumerator = (NSEnumerator *)(id)objc_msgSend((id)objc_msgSend(a3, "tracks"), "objectEnumerator");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (AVAssetTrackEnumerator)initWithAsset:(id)a3 mediaType:(id)a4
{
  v5 = [(AVAssetTrackEnumerator *)self initWithAsset:a3];
  [(AVAssetTrackEnumerator *)v5 setMediaType:a4];
  return v5;
}

- (AVAssetTrackEnumerator)initWithAsset:(id)a3 mediaCharacteristics:(id)a4
{
  v5 = [(AVAssetTrackEnumerator *)self initWithAsset:a3];
  [(AVAssetTrackEnumerator *)v5 setMediaCharacteristics:a4];
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetTrackEnumerator;
  [(AVAssetTrackEnumerator *)&v3 dealloc];
}

- (void)setMediaType:(id)a3
{
  id v5 = a3;

  self->_mediaType = (NSString *)a3;
}

- (void)setMediaCharacteristics:(id)a3
{
  id v5 = a3;

  self->_mediaCharacteristics = (NSArray *)a3;
}

- (id)nextObject
{
  for (id i = [(NSEnumerator *)self->_enumerator nextObject];
        i;
        id i = [(NSEnumerator *)self->_enumerator nextObject])
  {
    mediaType = self->_mediaType;
    if ((!mediaType || -[NSString isEqualToString:](mediaType, "isEqualToString:", [i mediaType]))
      && (!self->_mediaCharacteristics || (objc_msgSend(i, "hasMediaCharacteristics:") & 1) != 0))
    {
      break;
    }
  }
  return i;
}

@end