@interface CPWRootViewController
- (BOOL)isInstrumentCluster;
- (CPWRootViewController)initWithWallpaper:(id)a3 assetLibrary:(id)a4 wallpaperProvider:(id)a5 wallpaperCache:(id)a6 isInstrumentCluster:(BOOL)a7;
- (CRSUIWallpaperDataProviding)wallpaperProvider;
- (CRWallpaperData)wallpaper;
- (NSString)overlayPath;
- (UIImageView)cachedImageView;
- (UIImageView)overlayImageView;
- (UIView)uncachedWallpaperView;
- (_TtC16CarPlayWallpaper15CPWAssetLibrary)assetLibrary;
- (_TtC16CarPlayWallpaper22CPWWallpaperImageCache)wallpaperCache;
- (id)_cacheKeyForWallpaper:(id)a3;
- (id)createImageFromLayer:(id)a3;
- (id)resolveWallpaper:(id)a3;
- (int64_t)userInterfaceStyle;
- (void)_updateOverlayImageViewWithPath:(id)a3;
- (void)_updateWallpaperImage;
- (void)createImageOfResolvedWallpaper:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setAssetLibrary:(id)a3;
- (void)setCachedImageView:(id)a3;
- (void)setCachedWallpaperImage:(id)a3;
- (void)setOverlayImageView:(id)a3;
- (void)setOverlayPath:(id)a3;
- (void)setUncachedWallpaperView:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)setWallpaperCache:(id)a3;
- (void)setWallpaperProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation CPWRootViewController

- (CPWRootViewController)initWithWallpaper:(id)a3 assetLibrary:(id)a4 wallpaperProvider:(id)a5 wallpaperCache:(id)a6 isInstrumentCluster:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CPWRootViewController;
  v17 = [(CPWRootViewController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_wallpaper, a3);
    v18->_isInstrumentCluster = a7;
    objc_storeStrong((id *)&v18->_wallpaperProvider, a5);
    [(CRSUIWallpaperDataProviding *)v18->_wallpaperProvider setDataProviderDelegate:v18];
    objc_storeStrong((id *)&v18->_wallpaperCache, a6);
    if (v18->_isInstrumentCluster)
    {
      objc_storeStrong((id *)&v18->_assetLibrary, a4);
      [(CPWAssetLibrary *)v18->_assetLibrary addObserver:v18];
    }
  }

  return v18;
}

- (void)setWallpaper:(id)a3
{
  id v5 = a3;
  if ((-[CRWallpaperData isEqual:](self->_wallpaper, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_wallpaper, a3);
    [(CPWRootViewController *)self _updateWallpaperImage];
  }
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)CPWRootViewController;
  [(CPWRootViewController *)&v25 viewDidLoad];
  v3 = +[UIColor tableBackgroundColor];
  v4 = [(CPWRootViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc_init((Class)UIImageView);
  [v5 setContentMode:2];
  [v5 setClipsToBounds:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(CPWRootViewController *)self view];
  [v6 addSubview:v5];

  v23 = [v5 leadingAnchor];
  v24 = [(CPWRootViewController *)self view];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v19 = [v5 trailingAnchor];
  objc_super v20 = [(CPWRootViewController *)self view];
  v18 = [v20 trailingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v26[1] = v17;
  id v16 = [v5 topAnchor];
  v7 = [(CPWRootViewController *)self view];
  v8 = [v7 topAnchor];
  v9 = [v16 constraintEqualToAnchor:v8];
  v26[2] = v9;
  v10 = [v5 bottomAnchor];
  v11 = [(CPWRootViewController *)self view];
  v12 = [v11 bottomAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12];
  v26[3] = v13;
  id v14 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v14];

  [(CPWRootViewController *)self setCachedImageView:v5];
  [(CPWRootViewController *)self _updateWallpaperImage];
  if (self->_isInstrumentCluster)
  {
    id v15 = [(CPWAssetLibrary *)self->_assetLibrary wallpaperOverlayPath];
    [(CPWRootViewController *)self _updateOverlayImageViewWithPath:v15];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPWRootViewController;
  [(CPWRootViewController *)&v4 traitCollectionDidChange:a3];
  [(CPWRootViewController *)self _updateWallpaperImage];
}

- (void)_updateWallpaperImage
{
  v3 = [(CPWRootViewController *)self wallpaper];
  if (v3)
  {
    objc_super v4 = [(CPWRootViewController *)self wallpaperProvider];
    unsigned __int8 v5 = [v4 isReady];

    if (v5)
    {
      v6 = [(CPWRootViewController *)self userInterfaceStyle];
      v7 = sub_100005818(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v8 = @"light";
        if (v6 == (void *)2) {
          CFStringRef v8 = @"dark";
        }
        *(_DWORD *)buf = 138543362;
        CFStringRef v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current interface style: %{public}@", buf, 0xCu);
      }

      v9 = [(CPWRootViewController *)self wallpaperProvider];
      v10 = [v9 loadWallpaperFromData:v3];

      if (v10)
      {
        v11 = [(CPWRootViewController *)self _cacheKeyForWallpaper:v10];
        v12 = [(CPWRootViewController *)self wallpaperCache];
        id v13 = [v12 imageWithKey:v11];

        if (v13)
        {
          id v14 = sub_100005818(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v3 identifier];
            *(_DWORD *)buf = 138543618;
            CFStringRef v27 = v15;
            __int16 v28 = 2114;
            v29 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found cached wallpaper image %{public}@ (%{public}@)", buf, 0x16u);
          }
          [(CPWRootViewController *)self setCachedWallpaperImage:v13];
        }
        else
        {
          id v16 = [(CPWRootViewController *)self resolveWallpaper:v10];
          v17 = sub_100005818(0);
          v18 = v17;
          if (v16)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v19 = [v3 identifier];
              *(_DWORD *)buf = 138543362;
              CFStringRef v27 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Displaying wallpaper %{public}@", buf, 0xCu);
            }
            objc_super v20 = [v16 view];
            [(CPWRootViewController *)self setUncachedWallpaperView:v20];

            if (v11)
            {
              objc_initWeak((id *)buf, self);
              v21 = [(CPWRootViewController *)self resolveWallpaper:v10];
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472;
              v22[2] = sub_10000621C;
              v22[3] = &unk_100014778;
              objc_copyWeak(v25, (id *)buf);
              v23 = v11;
              id v24 = v3;
              v25[1] = v6;
              [(CPWRootViewController *)self createImageOfResolvedWallpaper:v21 completion:v22];

              objc_destroyWeak(v25);
              objc_destroyWeak((id *)buf);
            }
          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10000E00C(v3);
            }
          }
        }
      }
      else
      {
        v11 = sub_100005818(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10000DF80(v3);
        }
      }
    }
    else
    {
      v10 = sub_100005818(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10000E098();
      }
    }
  }
  else
  {
    v10 = sub_100005818(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000DF4C();
    }
  }
}

- (id)resolveWallpaper:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPWRootViewController *)self wallpaperProvider];
  unsigned __int8 v6 = [v5 isReady];

  v7 = sub_100005818(0);
  CFStringRef v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 identifier];
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolving wallpaper %{public}@", (uint8_t *)&v12, 0xCu);
    }
    CFStringRef v8 = [(CPWRootViewController *)self wallpaperProvider];
    v10 = [v8 resolveWallpaper:v4];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000E098();
    }
    v10 = 0;
  }

  return v10;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(CPWRootViewController *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  if (!v3)
  {
    id v4 = sub_100005818(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current interface style is unspecified - falling back to dark style", v6, 2u);
    }

    return 2;
  }
  return (int64_t)v3;
}

- (id)_cacheKeyForWallpaper:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPWRootViewController *)self wallpaperProvider];
  unsigned int v6 = [v5 isReady];

  if (v6 && ([v4 cacheID], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    int64_t v8 = [(CPWRootViewController *)self userInterfaceStyle];
    v9 = [v4 cacheID];
    if (v8 == 2) {
      CFStringRef v10 = @"Dark";
    }
    else {
      CFStringRef v10 = @"Light";
    }
    v11 = [(CPWRootViewController *)self wallpaperProvider];
    int v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%@-%lu", v9, v10, [v11 version]);
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (void)setUncachedWallpaperView:(id)a3
{
  unsigned __int8 v5 = (UIView *)a3;
  uncachedWallpaperView = self->_uncachedWallpaperView;
  if (uncachedWallpaperView != v5)
  {
    [(UIView *)uncachedWallpaperView removeFromSuperview];
    objc_storeStrong((id *)&self->_uncachedWallpaperView, a3);
    if (v5)
    {
      v7 = [(CPWRootViewController *)self cachedImageView];
      [v7 setImage:0];

      [(UIView *)v5 setContentMode:2];
      [(UIView *)v5 setClipsToBounds:1];
      [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      int64_t v8 = [(CPWRootViewController *)self view];
      v9 = [(CPWRootViewController *)self cachedImageView];
      [v8 insertSubview:v5 belowSubview:v9];

      objc_super v25 = [(UIView *)v5 leadingAnchor];
      v26 = [(CPWRootViewController *)self view];
      id v24 = [v26 leadingAnchor];
      v23 = [v25 constraintEqualToAnchor:v24];
      v27[0] = v23;
      v21 = [(UIView *)v5 trailingAnchor];
      v22 = [(CPWRootViewController *)self view];
      objc_super v20 = [v22 trailingAnchor];
      v19 = [v21 constraintEqualToAnchor:v20];
      v27[1] = v19;
      CFStringRef v10 = [(UIView *)v5 topAnchor];
      v11 = [(CPWRootViewController *)self view];
      int v12 = [v11 topAnchor];
      id v13 = [v10 constraintEqualToAnchor:v12];
      v27[2] = v13;
      id v14 = [(UIView *)v5 bottomAnchor];
      id v15 = [(CPWRootViewController *)self view];
      id v16 = [v15 bottomAnchor];
      v17 = [v14 constraintEqualToAnchor:v16];
      v27[3] = v17;
      v18 = +[NSArray arrayWithObjects:v27 count:4];
      +[NSLayoutConstraint activateConstraints:v18];
    }
  }
}

- (void)setCachedWallpaperImage:(id)a3
{
  id v8 = a3;
  id v4 = [(CPWRootViewController *)self cachedImageView];
  id v5 = [v4 image];

  if (v5 != v8)
  {
    [(UIView *)self->_uncachedWallpaperView removeFromSuperview];
    uncachedWallpaperView = self->_uncachedWallpaperView;
    self->_uncachedWallpaperView = 0;

    v7 = [(CPWRootViewController *)self cachedImageView];
    [v7 setImage:v8];
  }
}

- (void)_updateOverlayImageViewWithPath:(id)a3
{
  id v4 = a3;
  if ([(CPWRootViewController *)self isInstrumentCluster])
  {
    id v5 = [(CPWRootViewController *)self overlayPath];
    unsigned __int8 v6 = [v5 isEqualToString:v4];

    if ((v6 & 1) == 0)
    {
      if (v4)
      {
        id v7 = [objc_alloc((Class)NSData) initWithContentsOfFile:v4];
        if (v7)
        {
          id v8 = [objc_alloc((Class)UIImage) initWithData:v7];
          overlayImageView = self->_overlayImageView;
          if (!overlayImageView)
          {
            CFStringRef v10 = (UIImageView *)objc_alloc_init((Class)UIImageView);
            v11 = self->_overlayImageView;
            self->_overlayImageView = v10;

            [(UIImageView *)self->_overlayImageView setContentMode:2];
            [(UIImageView *)self->_overlayImageView setClipsToBounds:1];
            [(UIImageView *)self->_overlayImageView setTranslatesAutoresizingMaskIntoConstraints:0];
            [(CPWRootViewController *)self view];
            int v12 = v35 = v8;
            [v12 addSubview:self->_overlayImageView];

            [(UIImageView *)self->_overlayImageView setTranslatesAutoresizingMaskIntoConstraints:0];
            v33 = [(UIImageView *)self->_overlayImageView leadingAnchor];
            v34 = [(CPWRootViewController *)self view];
            v32 = [v34 leadingAnchor];
            v31 = [v33 constraintEqualToAnchor:v32];
            v37[0] = v31;
            v29 = [(UIImageView *)self->_overlayImageView trailingAnchor];
            v30 = [(CPWRootViewController *)self view];
            __int16 v28 = [v30 trailingAnchor];
            CFStringRef v27 = [v29 constraintEqualToAnchor:v28];
            v37[1] = v27;
            objc_super v25 = [(UIImageView *)self->_overlayImageView topAnchor];
            v26 = [(CPWRootViewController *)self view];
            id v24 = [v26 topAnchor];
            id v13 = [v25 constraintEqualToAnchor:v24];
            v37[2] = v13;
            id v14 = [(UIImageView *)self->_overlayImageView bottomAnchor];
            id v15 = [(CPWRootViewController *)self view];
            id v16 = [v15 bottomAnchor];
            v17 = [v14 constraintEqualToAnchor:v16];
            v37[3] = v17;
            v18 = +[NSArray arrayWithObjects:v37 count:4];
            +[NSLayoutConstraint activateConstraints:v18];

            id v8 = v35;
            overlayImageView = self->_overlayImageView;
          }
          [(UIImageView *)overlayImageView setImage:v8];
          v19 = [(CPWRootViewController *)self view];
          [v19 bringSubviewToFront:self->_overlayImageView];

          [(CPWRootViewController *)self setOverlayPath:v4];
          objc_super v20 = sub_100005818(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Wallpaper overlay updated.", buf, 2u);
          }
        }
        else
        {
          v23 = sub_100005818(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_10000E0D8();
          }

          [(UIImageView *)self->_overlayImageView removeFromSuperview];
          [(CPWRootViewController *)self setOverlayImageView:0];
          [(CPWRootViewController *)self setOverlayPath:0];
        }
      }
      else
      {
        v21 = sub_100005818(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Wallpaper overlay removed from superview.", buf, 2u);
        }

        v22 = [(CPWRootViewController *)self overlayImageView];
        [v22 removeFromSuperview];

        [(CPWRootViewController *)self setOverlayImageView:0];
        [(CPWRootViewController *)self setOverlayPath:0];
      }
    }
  }
}

- (void)createImageOfResolvedWallpaper:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      int64_t v9 = [(CPWRootViewController *)self userInterfaceStyle];
      CFStringRef v10 = [v6 view];
      id v11 = objc_alloc_init((Class)UIWindow);
      int v12 = v11;
      BOOL v13 = v9 == 2;
      if (v9 == 2) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
      [v11 setOverrideUserInterfaceStyle:v14];
      [v12 addSubview:v10];
      [v10 bounds];
      if (CGRectIsEmpty(v25))
      {
        id v15 = [(CPWRootViewController *)self view];
        [v15 frame];
        double v17 = v16;
        v18 = [(CPWRootViewController *)self view];
        [v18 frame];
        [v10 setFrame:0.0, 0.0, v17];
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100007174;
      v20[3] = &unk_1000147A0;
      v20[4] = self;
      id v21 = v10;
      BOOL v24 = v13;
      id v22 = v6;
      id v23 = v8;
      id v19 = v10;
      +[CATransaction bs_performAfterSynchronizedCommit:v20];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (id)createImageFromLayer:(id)a3
{
  id v3 = a3;
  id v4 = MTLCreateSystemDefaultDevice();
  if (v4)
  {
    [v3 bounds];
    if (v5 != 0.0)
    {
      double v7 = v6;
      if (v6 != 0.0)
      {
        double v8 = v5;
        uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
        v29[0] = kIOSurfaceWidth;
        CFStringRef v10 = +[NSNumber numberWithDouble:v8];
        v30[0] = v10;
        v29[1] = kIOSurfaceHeight;
        id v11 = +[NSNumber numberWithDouble:v7];
        v30[1] = v11;
        v29[2] = kIOSurfacePixelFormat;
        int v12 = +[NSNumber numberWithUnsignedInt:1111970369];
        v30[2] = v12;
        v30[3] = &off_100014DD8;
        v29[3] = kIOSurfaceBytesPerElement;
        v29[4] = kIOSurfaceBytesPerRow;
        BOOL v13 = +[NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
        v30[4] = v13;
        v29[5] = kIOSurfaceAllocSize;
        uint64_t v14 = +[NSNumber numberWithUnsignedInteger:(unint64_t)(v7 * (double)(unint64_t)AlignedBytesPerRow)];
        v30[5] = v14;
        CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];

        IOSurfaceRef v16 = IOSurfaceCreate(v15);
        double v17 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:80 width:(unint64_t)v8 height:(unint64_t)v7 mipmapped:0];
        [v17 setUsage:7];
        id v18 = [v4 newTextureWithDescriptor:v17 iosurface:v16 plane:0];
        v28[0] = &off_100014DF0;
        CFStringRef v25 = @"kCARendererFlags";
        v26 = kCARendererColorSpace;
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
        uint64_t v27 = kCARendererClearsDestination;
        v28[1] = DeviceRGB;
        v28[2] = &__kCFBooleanTrue;
        objc_super v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:&v25 count:3];
        +[CATransaction begin];
        +[CATransaction setDisableActions:1];
        id v21 = +[CARenderer rendererWithMTLTexture:v18 options:v20];
        [v21 setLayer:v3];
        [v3 bounds];
        [v21 setBounds:];
        +[CATransaction flush];
        +[CATransaction commit];
        [v21 beginFrameAtTime:0 timeStamp:0.0];
        [v21 bounds];
        [v21 addUpdateRect:];
        [v21 render];
        [v21 endFrame];
        id v22 = (CGImage *)CGImageCreateFromIOSurface();
        id v23 = +[UIImage imageWithCGImage:v22];
        CGImageRelease(v22);
        CFRelease(v16);

        goto LABEL_10;
      }
    }
    sub_100005818(0);
    CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_10000E21C();
    }
  }
  else
  {
    sub_100005818(0);
    CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_10000E1E8();
    }
  }
  id v23 = 0;
LABEL_10:

  return v23;
}

- (void)invalidate
{
  id v2 = [(CPWRootViewController *)self wallpaperProvider];
  [v2 invalidate];
}

- (CRWallpaperData)wallpaper
{
  return self->_wallpaper;
}

- (UIView)uncachedWallpaperView
{
  return self->_uncachedWallpaperView;
}

- (UIImageView)cachedImageView
{
  return self->_cachedImageView;
}

- (void)setCachedImageView:(id)a3
{
}

- (BOOL)isInstrumentCluster
{
  return self->_isInstrumentCluster;
}

- (CRSUIWallpaperDataProviding)wallpaperProvider
{
  return self->_wallpaperProvider;
}

- (void)setWallpaperProvider:(id)a3
{
}

- (_TtC16CarPlayWallpaper22CPWWallpaperImageCache)wallpaperCache
{
  return self->_wallpaperCache;
}

- (void)setWallpaperCache:(id)a3
{
}

- (UIImageView)overlayImageView
{
  return self->_overlayImageView;
}

- (void)setOverlayImageView:(id)a3
{
}

- (NSString)overlayPath
{
  return self->_overlayPath;
}

- (void)setOverlayPath:(id)a3
{
}

- (_TtC16CarPlayWallpaper15CPWAssetLibrary)assetLibrary
{
  return self->_assetLibrary;
}

- (void)setAssetLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLibrary, 0);
  objc_storeStrong((id *)&self->_overlayPath, 0);
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_wallpaperCache, 0);
  objc_storeStrong((id *)&self->_wallpaperProvider, 0);
  objc_storeStrong((id *)&self->_cachedImageView, 0);
  objc_storeStrong((id *)&self->_uncachedWallpaperView, 0);

  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end