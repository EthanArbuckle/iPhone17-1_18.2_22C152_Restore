@interface _MKMapItemDetailView
- (CGSize)intrinsicContentSize;
- (_MKMapItemDetailView)initWithFrame:(CGRect)a3;
- (void)orientationDidChangeNotification:(id)a3;
@end

@implementation _MKMapItemDetailView

- (_MKMapItemDetailView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKMapItemDetailView;
  v3 = -[_MKMapItemDetailView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (!v5)
    {
      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v3 selector:sel_orientationDidChangeNotification_ name:*MEMORY[0x1E4F437D8] object:0];
    }
  }
  return v3;
}

- (void)orientationDidChangeNotification:(id)a3
{
  v4 = MKGetMKRemoteUILog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "MKMapItemDetailViewController orientationDidChangeNotification", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___MKMapItemDetailView_orientationDidChangeNotification___block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = MKGetMKRemoteUILog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    [(_MKMapItemDetailView *)self bounds];
    v6 = [NSString stringWithFormat:@"{%.1f, %.1f}", v4, v5];
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "MKMapItemDetailViewController intrinsicContentSize %{public}@", buf, 0xCu);
  }
  [(_MKMapItemDetailView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  result.height = v10;
  result.width = v8;
  return result;
}

@end