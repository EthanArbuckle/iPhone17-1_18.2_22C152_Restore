@interface CFXExportClipDataSource
- (BOOL)isExporting;
- (BOOL)screenCanShow2160P;
- (BOOL)use2160Pcontent:(BOOL)a3;
- (CFXClip)clip;
- (CFXExportClipDataSource)initWithClip:(id)a3;
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

@implementation CFXExportClipDataSource

- (CFXExportClipDataSource)initWithClip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFXExportClipDataSource;
  v6 = [(CFXExportClipDataSource *)&v9 init];
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
  v2 = [(CFXExportClipDataSource *)self clip];
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
  return 1;
}

- (int64_t)count
{
  return 1;
}

- (double)imageScale
{
  +[CFXVideoSettings imageScale];
  return result;
}

- (BOOL)screenCanShow2160P
{
  return 0;
}

- (BOOL)use2160Pcontent:(BOOL)a3
{
  return 0;
}

- (id)colorSpace
{
  v2 = [(CFXExportClipDataSource *)self clip];
  int v3 = [v2 mediaItem];
  double v4 = [v3 colorSpace];

  return v4;
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