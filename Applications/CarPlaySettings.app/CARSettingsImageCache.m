@interface CARSettingsImageCache
+ (UIImage)accessibilityIcon;
+ (UIImage)albumArtImage;
+ (UIImage)announceImage;
+ (UIImage)appearanceImage;
+ (UIImage)appleIntelligenceImage;
+ (UIImage)checkmark;
+ (UIImage)devicePickerImage;
+ (UIImage)displayImage;
+ (UIImage)dndImage;
+ (UIImage)internalImage;
+ (UIImage)leftChevron;
+ (UIImage)rightChevron;
+ (UIImage)silentModeIcon;
+ (UIImage)silentModeOffIcon;
+ (UIImage)silentModeOnIcon;
+ (UIImage)siriImage;
+ (UIImage)soundsIcon;
+ (UIImage)wallpaperImage;
+ (id)imageForColor:(id)a3 size:(CGSize)a4;
@end

@implementation CARSettingsImageCache

+ (UIImage)accessibilityIcon
{
  v2 = (void *)qword_1000B07B0;
  if (!qword_1000B07B0)
  {
    v3 = +[NSBundle mainBundle];
    v4 = +[UIScreen _carScreen];
    v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"AccessibilityIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    v7 = (void *)qword_1000B07B0;
    qword_1000B07B0 = v6;

    v2 = (void *)qword_1000B07B0;
  }

  return (UIImage *)v2;
}

+ (UIImage)leftChevron
{
  v2 = (void *)qword_1000B07B8;
  if (!qword_1000B07B8)
  {
    v3 = +[UIScreen _carScreen];
    v4 = [v3 traitCollection];
    uint64_t v5 = +[UIImage _kitImageNamed:@"UINavigationBarBackIndicatorDefault.png" withTrait:v4];
    uint64_t v6 = (void *)qword_1000B07B8;
    qword_1000B07B8 = v5;

    v2 = (void *)qword_1000B07B8;
  }

  return (UIImage *)v2;
}

+ (UIImage)rightChevron
{
  v3 = (void *)qword_1000B07C0;
  if (!qword_1000B07C0)
  {
    id v4 = [a1 leftChevron];
    id v5 = [v4 CGImage];
    uint64_t v6 = [a1 leftChevron];
    [v6 scale];
    uint64_t v7 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v5, 1);
    v8 = (void *)qword_1000B07C0;
    qword_1000B07C0 = v7;

    v3 = (void *)qword_1000B07C0;
  }

  return (UIImage *)v3;
}

+ (UIImage)checkmark
{
  v2 = (void *)qword_1000B07C8;
  if (!qword_1000B07C8)
  {
    v3 = +[UIScreen _carScreen];
    id v4 = [v3 traitCollection];
    uint64_t v5 = +[UIImage _kitImageNamed:@"UIPreferencesBlueCheck.png" withTrait:v4];
    uint64_t v6 = (void *)qword_1000B07C8;
    qword_1000B07C8 = v5;

    v2 = (void *)qword_1000B07C8;
  }

  return (UIImage *)v2;
}

+ (UIImage)dndImage
{
  v2 = (void *)qword_1000B07D0;
  if (!qword_1000B07D0)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"DNDWDIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B07D0;
    qword_1000B07D0 = v6;

    v2 = (void *)qword_1000B07D0;
  }

  return (UIImage *)v2;
}

+ (UIImage)displayImage
{
  v2 = (void *)qword_1000B07D8;
  if (!qword_1000B07D8)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"DisplayIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B07D8;
    qword_1000B07D8 = v6;

    v2 = (void *)qword_1000B07D8;
  }

  return (UIImage *)v2;
}

+ (UIImage)appearanceImage
{
  v2 = (void *)qword_1000B07E0;
  if (!qword_1000B07E0)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"AppearanceIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B07E0;
    qword_1000B07E0 = v6;

    v2 = (void *)qword_1000B07E0;
  }

  return (UIImage *)v2;
}

+ (UIImage)wallpaperImage
{
  v2 = (void *)qword_1000B07E8;
  if (!qword_1000B07E8)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"WallpaperIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B07E8;
    qword_1000B07E8 = v6;

    v2 = (void *)qword_1000B07E8;
  }

  return (UIImage *)v2;
}

+ (UIImage)siriImage
{
  v2 = (void *)qword_1000B07F0;
  if (!qword_1000B07F0)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"SiriOrbIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B07F0;
    qword_1000B07F0 = v6;

    v2 = (void *)qword_1000B07F0;
  }

  return (UIImage *)v2;
}

+ (UIImage)appleIntelligenceImage
{
  v2 = (void *)qword_1000B07F8;
  if (!qword_1000B07F8)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"AIIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B07F8;
    qword_1000B07F8 = v6;

    v2 = (void *)qword_1000B07F8;
  }

  return (UIImage *)v2;
}

+ (UIImage)albumArtImage
{
  v2 = (void *)qword_1000B0800;
  if (!qword_1000B0800)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"AlbumArtIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0800;
    qword_1000B0800 = v6;

    v2 = (void *)qword_1000B0800;
  }

  return (UIImage *)v2;
}

+ (UIImage)internalImage
{
  v2 = (void *)qword_1000B0808;
  if (!qword_1000B0808)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"InternalIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0808;
    qword_1000B0808 = v6;

    v2 = (void *)qword_1000B0808;
  }

  return (UIImage *)v2;
}

+ (UIImage)announceImage
{
  v2 = (void *)qword_1000B0810;
  if (!qword_1000B0810)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"AnnounceIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0810;
    qword_1000B0810 = v6;

    v2 = (void *)qword_1000B0810;
  }

  return (UIImage *)v2;
}

+ (UIImage)silentModeIcon
{
  v2 = (void *)qword_1000B0818;
  if (!qword_1000B0818)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"SilentModeIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0818;
    qword_1000B0818 = v6;

    v2 = (void *)qword_1000B0818;
  }

  return (UIImage *)v2;
}

+ (UIImage)soundsIcon
{
  v2 = (void *)qword_1000B0820;
  if (!qword_1000B0820)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"SoundsIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0820;
    qword_1000B0820 = v6;

    v2 = (void *)qword_1000B0820;
  }

  return (UIImage *)v2;
}

+ (UIImage)silentModeOnIcon
{
  v2 = (void *)qword_1000B0828;
  if (!qword_1000B0828)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"RedBell" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0828;
    qword_1000B0828 = v6;

    v2 = (void *)qword_1000B0828;
  }

  return (UIImage *)v2;
}

+ (UIImage)silentModeOffIcon
{
  v2 = (void *)qword_1000B0830;
  if (!qword_1000B0830)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"GreyBell" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0830;
    qword_1000B0830 = v6;

    v2 = (void *)qword_1000B0830;
  }

  return (UIImage *)v2;
}

+ (UIImage)devicePickerImage
{
  v2 = (void *)qword_1000B0838;
  if (!qword_1000B0838)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = +[UIScreen _carScreen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = +[UIImage imageNamed:@"DevicePickerIcon" inBundle:v3 compatibleWithTraitCollection:v5];
    uint64_t v7 = (void *)qword_1000B0838;
    qword_1000B0838 = v6;

    v2 = (void *)qword_1000B0838;
  }

  return (UIImage *)v2;
}

+ (id)imageForColor:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  v10.CGFloat width = width;
  v10.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  [v6 setFill];

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  UIRectFill(v11);
  uint64_t v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

@end