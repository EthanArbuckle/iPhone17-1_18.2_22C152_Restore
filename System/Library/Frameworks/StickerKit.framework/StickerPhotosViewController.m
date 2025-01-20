@interface StickerPhotosViewController
- (StickerPhotosViewController)initWithCoder:(id)a3;
- (StickerPhotosViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StickerPhotosViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for StickerPhotosViewController();
  [(StickerPhotosViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2453BC73C(a3);
}

- (StickerPhotosViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (StickerPhotosViewController *)StickerPhotosViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (StickerPhotosViewController)initWithCoder:(id)a3
{
  return (StickerPhotosViewController *)StickerPhotosViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___StickerPhotosViewController_delegate;

  sub_245203A28((uint64_t)v3);
}

@end