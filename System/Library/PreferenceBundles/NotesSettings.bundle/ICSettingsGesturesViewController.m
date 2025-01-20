@interface ICSettingsGesturesViewController
- (BOOL)allowFingerToSwipeFromCornerOrDefaultFallback;
- (BOOL)backingStoreForAllowFingerToSwipeFromCorner;
- (BOOL)chamoisWindowingEnabled;
- (ICSettingsGesturesDefaults)cornerGestureDefaults;
- (ICSettingsGesturesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSBundle)settingsBundle;
- (NSUserDefaults)springBoardDefaults;
- (PSSpecifier)fingerSwipeSpecifier;
- (id)allowFingerToSwipeFromCorner:(id)a3;
- (id)bottomLeftCornerGestureFeature:(id)a3;
- (id)bottomRightCornerGestureFeature:(id)a3;
- (id)fingerAndPencilSectionFooter;
- (id)specifiers;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowFingerToSwipeFromCorner:(id)a3 specifier:(id)a4;
- (void)setBackingStoreForAllowFingerToSwipeFromCorner:(BOOL)a3;
- (void)setBottomLeftCornerGestureFeature:(id)a3 specifier:(id)a4;
- (void)setBottomRightCornerGestureFeature:(id)a3 specifier:(id)a4;
- (void)setCornerGestureDefaults:(id)a3;
- (void)setFingerSwipeSpecifier:(id)a3;
- (void)setSpringBoardDefaults:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsGesturesViewController

- (ICSettingsGesturesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ICSettingsGesturesViewController;
  v4 = [(ICSettingsGesturesViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(ICSettingsGesturesDefaults);
    cornerGestureDefaults = v4->_cornerGestureDefaults;
    v4->_cornerGestureDefaults = v5;

    v4->_backingStoreForAllowFingerToSwipeFromCorner = 1;
    v7 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
    springBoardDefaults = v4->_springBoardDefaults;
    v4->_springBoardDefaults = v7;

    [(NSUserDefaults *)v4->_springBoardDefaults addObserver:v4 forKeyPath:@"SBChamoisWindowingEnabled" options:1 context:&off_22CB0];
  }
  return v4;
}

- (void)dealloc
{
  [(NSUserDefaults *)self->_springBoardDefaults removeObserver:self forKeyPath:@"SBChamoisWindowingEnabled" context:&off_22CB0];
  v3.receiver = self;
  v3.super_class = (Class)ICSettingsGesturesViewController;
  [(ICSettingsGesturesViewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsGesturesViewController;
  [(ICSettingsGesturesViewController *)&v4 viewDidAppear:a3];
  [(ICSettingsGesturesViewController *)self ic_submitNavigationEventForIdentifier:@"CORNER_GESTURES" titleStringKey:@"CORNER_GESTURES" navigationComponents:&off_1F160];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICSettingsGesturesViewController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/SettingsBundle/ICSettingsGesturesViewController.m"])
  {
    unsigned __int8 v13 = [(ICSettingsGesturesViewController *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &off_22CB0 && (v13 & 1) == 0)
    {
      v14 = [(ICSettingsGesturesViewController *)self fingerSwipeSpecifier];
      v15 = +[NSNumber numberWithInt:[(ICSettingsGesturesViewController *)self chamoisWindowingEnabled] ^ 1];
      [v14 setProperty:v15 forKey:PSEnabledKey];

      id v16 = [(ICSettingsGesturesViewController *)self fingerSwipeSpecifier];
      [(ICSettingsGesturesViewController *)self reloadSpecifier:v16 animated:1];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ICSettingsGesturesViewController;
    [(ICSettingsGesturesViewController *)&v17 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (NSBundle)settingsBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)fingerAndPencilSectionFooter
{
  unsigned int v3 = [(ICSettingsGesturesViewController *)self allowFingerToSwipeFromCornerOrDefaultFallback];
  objc_super v4 = [(ICSettingsGesturesViewController *)self settingsBundle];
  v5 = v4;
  if (v3)
  {
    CFStringRef v6 = @"FINGER_AND_PENCIL_GESTURES";
    CFStringRef v7 = @"Actions when you swipe your finger or pencil from a bottom corner.";
  }
  else
  {
    CFStringRef v6 = @"PENCIL_GESTURES";
    CFStringRef v7 = @"Actions when you swipe your pencil from a bottom corner.";
  }
  v8 = [v4 localizedStringForKey:v6 value:v7 table:@"Settings"];

  return v8;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  unsigned int v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    CFStringRef v6 = +[NSMutableArray array];
    CFStringRef v7 = [(ICSettingsGesturesViewController *)self settingsBundle];
    v8 = [v7 localizedStringForKey:@"CORNER_GESTURES" value:@"Corner Gestures" table:@"Settings"];
    uint64_t v9 = +[PSSpecifier groupSpecifierWithName:v8];

    v40 = (void *)v9;
    [v6 addObject:v9];
    id v10 = [(ICSettingsGesturesViewController *)self settingsBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"ALLOW_FINGER_TO_SWIPE_FROM_CORNER" value:@"Allow Finger to Swipe From Corner" table:@"Settings"];

    v39 = (void *)v11;
    id v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setAllowFingerToSwipeFromCorner:specifier:" get:"allowFingerToSwipeFromCorner:" detail:0 cell:6 edit:0];
    [v12 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];
    unsigned __int8 v13 = +[NSNumber numberWithInt:[(ICSettingsGesturesViewController *)self chamoisWindowingEnabled] ^ 1];
    [v12 setProperty:v13 forKey:PSEnabledKey];

    [(ICSettingsGesturesViewController *)self setFingerSwipeSpecifier:v12];
    v38 = v12;
    [v6 addObject:v12];
    +[PSSpecifier groupSpecifierWithID:@"GESTURES"];
    v37 = v32 = v6;
    objc_msgSend(v6, "addObject:");
    v14 = [(ICSettingsGesturesViewController *)self settingsBundle];
    uint64_t v15 = [v14 localizedStringForKey:@"OFF" value:@"Off" table:@"Settings"];

    id v16 = [(ICSettingsGesturesViewController *)self settingsBundle];
    uint64_t v17 = [v16 localizedStringForKey:@"QUICK_NOTE" value:@"Quick Note" table:@"Settings"];

    v18 = [(ICSettingsGesturesViewController *)self settingsBundle];
    uint64_t v19 = [v18 localizedStringForKey:@"SCREENSHOT" value:@"Screenshot" table:@"Settings"];

    v20 = +[NSMutableArray array];
    [v20 addObject:&off_1F298];
    if (+[ICDeviceSupport deviceSupportsSystemPaper](ICDeviceSupport, "deviceSupportsSystemPaper"))[v20 addObject:&off_1F2B0]; {
    [v20 addObject:&off_1F2C8];
    }
    v21 = +[NSMutableDictionary dictionary];
    v36 = (void *)v15;
    [v21 setObject:v15 forKeyedSubscript:&off_1F298];
    if (+[ICDeviceSupport deviceSupportsSystemPaper](ICDeviceSupport, "deviceSupportsSystemPaper"))[v21 setObject:v17 forKeyedSubscript:&off_1F2B0]; {
    v35 = (void *)v19;
    }
    [v21 setObject:v19 forKeyedSubscript:&off_1F2C8];
    v22 = [(ICSettingsGesturesViewController *)self settingsBundle];
    v33 = [v22 localizedStringForKey:@"BOTTOM_LEFT_CORNER_SWIPE" value:@"Left Corner Swipe" table:@"Settings"];

    v34 = (void *)v17;
    v23 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:"setBottomLeftCornerGestureFeature:specifier:" get:"bottomLeftCornerGestureFeature:" detail:objc_opt_class() cell:2 edit:0];
    [v23 setIdentifier:@"BOTTOM_LEFT_CORNER_SWIPE"];
    [v23 setValues:v20];
    [v23 setTitleDictionary:v21];
    [v32 addObject:v23];
    v24 = [(ICSettingsGesturesViewController *)self settingsBundle];
    v25 = [v24 localizedStringForKey:@"BOTTOM_RIGHT_CORNER_SWIPE" value:@"Right Corner Swipe" table:@"Settings"];

    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"setBottomRightCornerGestureFeature:specifier:" get:"bottomRightCornerGestureFeature:" detail:objc_opt_class() cell:2 edit:0];
    [v26 setIdentifier:@"BOTTOM_RIGHT_CORNER_SWIPE"];
    [v26 setValues:v20];
    [v26 setTitleDictionary:v21];
    [v32 addObject:v26];
    v27 = [(ICSettingsGesturesViewController *)self settingsBundle];
    v28 = [v27 localizedStringForKey:@"CORNER_GESTURES_FOOTER" value:@"Select the action that occurs when you swipe diagonally from the bottom corner." table:@"Settings"];

    [v37 setProperty:v28 forKey:PSFooterTextGroupKey];
    id v29 = [v32 copy];
    v30 = *(void **)&self->PSListController_opaque[v2];
    *(void *)&self->PSListController_opaque[v2] = v29;

    id v4 = *(id *)&self->PSListController_opaque[v2];
  }

  return v4;
}

- (id)allowFingerToSwipeFromCorner:(id)a3
{
  BOOL v4 = ![(ICSettingsGesturesViewController *)self chamoisWindowingEnabled]
    && [(ICSettingsGesturesViewController *)self allowFingerToSwipeFromCornerOrDefaultFallback];

  return +[NSNumber numberWithInt:v4];
}

- (void)setAllowFingerToSwipeFromCorner:(id)a3 specifier:(id)a4
{
  -[ICSettingsGesturesViewController setBackingStoreForAllowFingerToSwipeFromCorner:](self, "setBackingStoreForAllowFingerToSwipeFromCorner:", [a3 BOOLValue]);
  v5 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  unint64_t v6 = (unint64_t)[v5 bottomLeftTouchTypes];

  CFStringRef v7 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  unint64_t v8 = (unint64_t)[v7 bottomRightTouchTypes];

  unsigned int v9 = [(ICSettingsGesturesViewController *)self backingStoreForAllowFingerToSwipeFromCorner];
  uint64_t v10 = v6 | 1;
  if (!v6) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v8 | 1;
  if (!v8) {
    uint64_t v11 = 0;
  }
  if (v9) {
    unint64_t v12 = v10;
  }
  else {
    unint64_t v12 = v6 & 0xFFFFFFFFFFFFFFFELL;
  }
  if (v9) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = v8 & 0xFFFFFFFFFFFFFFFELL;
  }
  v14 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  [v14 setBottomLeftTouchTypes:v12];

  id v15 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  [v15 setBottomRightTouchTypes:v13];
}

- (id)bottomLeftCornerGestureFeature:(id)a3
{
  unsigned int v3 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  BOOL v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 bottomLeftFeature]);

  return v4;
}

- (void)setBottomLeftCornerGestureFeature:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  unint64_t v7 = (unint64_t)[v6 bottomLeftTouchTypes];

  if ([(ICSettingsGesturesViewController *)self allowFingerToSwipeFromCornerOrDefaultFallback]&& (v7 & 1) == 0)
  {
    unint64_t v8 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
    [v8 setBottomLeftTouchTypes:v7 | 1];
  }
  unsigned int v9 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  id v10 = [v5 integerValue];

  [v9 setBottomLeftFeature:v10];
  id v11 = [(ICSettingsGesturesViewController *)self fingerSwipeSpecifier];
  [(ICSettingsGesturesViewController *)self reloadSpecifier:v11 animated:1];
}

- (id)bottomRightCornerGestureFeature:(id)a3
{
  unsigned int v3 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  BOOL v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 bottomRightFeature]);

  return v4;
}

- (void)setBottomRightCornerGestureFeature:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  unint64_t v7 = (unint64_t)[v6 bottomRightTouchTypes];

  if ([(ICSettingsGesturesViewController *)self allowFingerToSwipeFromCornerOrDefaultFallback]&& (v7 & 1) == 0)
  {
    unint64_t v8 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
    [v8 setBottomRightTouchTypes:v7 | 1];
  }
  unsigned int v9 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  id v10 = [v5 integerValue];

  [v9 setBottomRightFeature:v10];
  id v11 = [(ICSettingsGesturesViewController *)self fingerSwipeSpecifier];
  [(ICSettingsGesturesViewController *)self reloadSpecifier:v11 animated:1];
}

- (BOOL)allowFingerToSwipeFromCornerOrDefaultFallback
{
  unsigned int v3 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  unint64_t v4 = (unint64_t)[v3 bottomLeftTouchTypes];

  id v5 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
  unint64_t v6 = (unint64_t)[v5 bottomRightTouchTypes];

  if (v6 | v4)
  {
    unint64_t v7 = [(ICSettingsGesturesViewController *)self cornerGestureDefaults];
    unsigned __int8 v8 = [v7 anyCornerGestureAllowsDirectTouches];

    return v8;
  }
  else
  {
    return [(ICSettingsGesturesViewController *)self backingStoreForAllowFingerToSwipeFromCorner];
  }
}

- (BOOL)chamoisWindowingEnabled
{
  uint64_t v2 = [(ICSettingsGesturesViewController *)self springBoardDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SBChamoisWindowingEnabled"];

  return v3;
}

- (BOOL)backingStoreForAllowFingerToSwipeFromCorner
{
  return self->_backingStoreForAllowFingerToSwipeFromCorner;
}

- (void)setBackingStoreForAllowFingerToSwipeFromCorner:(BOOL)a3
{
  self->_backingStoreForAllowFingerToSwipeFromCorner = a3;
}

- (ICSettingsGesturesDefaults)cornerGestureDefaults
{
  return self->_cornerGestureDefaults;
}

- (void)setCornerGestureDefaults:(id)a3
{
}

- (NSUserDefaults)springBoardDefaults
{
  return self->_springBoardDefaults;
}

- (void)setSpringBoardDefaults:(id)a3
{
}

- (PSSpecifier)fingerSwipeSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fingerSwipeSpecifier);

  return (PSSpecifier *)WeakRetained;
}

- (void)setFingerSwipeSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fingerSwipeSpecifier);
  objc_storeStrong((id *)&self->_springBoardDefaults, 0);

  objc_storeStrong((id *)&self->_cornerGestureDefaults, 0);
}

@end