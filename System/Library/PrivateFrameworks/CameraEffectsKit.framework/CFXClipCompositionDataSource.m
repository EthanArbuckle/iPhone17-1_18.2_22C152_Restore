@interface CFXClipCompositionDataSource
- (BOOL)isExporting;
- (BOOL)screenCanShow2160P;
- (BOOL)use2160Pcontent:(BOOL)a3;
- (CFXClip)clip;
- (CFXClipCompositionDataSource)initWithClip:(id)a3;
- (CGSize)frameSize;
- (CGSize)renderSize;
- (double)imageScale;
- (id)colorSpace;
- (int)duration;
- (int)frameRate;
- (int)timeScale;
- (int64_t)count;
- (void)setClip:(id)a3;
@end

@implementation CFXClipCompositionDataSource

- (CFXClipCompositionDataSource)initWithClip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFXClipCompositionDataSource;
  v6 = [(CFXClipCompositionDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clip, a3);
  }

  return v7;
}

- (CGSize)renderSize
{
  v2 = +[CFXMediaSettings sharedInstance];
  [v2 renderSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)frameSize
{
  v2 = +[CFXMediaSettings sharedInstance];
  [v2 frameSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int)duration
{
  v2 = [(CFXClipCompositionDataSource *)self clip];
  int v3 = [v2 duration];

  return v3;
}

- (int)frameRate
{
  v2 = +[CFXMediaSettings sharedInstance];
  int v3 = [v2 frameRate];

  return v3;
}

- (int)timeScale
{
  v2 = +[CFXMediaSettings sharedInstance];
  int v3 = [v2 timeScale];

  return v3;
}

- (BOOL)isExporting
{
  return 0;
}

- (int64_t)count
{
  return 1;
}

- (BOOL)use2160Pcontent:(BOOL)a3
{
  return 0;
}

- (BOOL)screenCanShow2160P
{
  return +[CFXVideoSettings screenCanShow2160P];
}

- (double)imageScale
{
  +[CFXVideoSettings imageScale];
  return result;
}

- (id)colorSpace
{
  v2 = [(CFXClip *)self->_clip mediaItem];
  int v3 = [v2 colorSpace];

  return v3;
}

- (CFXClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end