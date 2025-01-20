@interface MKPlaceCardFooterActionsViewController
- (BOOL)_canShowWhileLocked;
- (void)reloadData;
- (void)viewDidLoad;
@end

@implementation MKPlaceCardFooterActionsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v3 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceCardFooterActionsViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCardFooterActionsViewController;
  [(MKPlaceCardActionsViewController *)&v8 viewDidLoad];
  [(MKPlaceCardActionsViewController *)self setHaveTwoColumns:0];
  [(MKPlaceCardActionsViewController *)self setAllowRowSelection:1];
  -[MKPlaceCardActionsViewController setShowTopButtonSeparator:](self, "setShowTopButtonSeparator:", objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_accessibilityTextEnabled"));
  v4 = [(MKPlaceSectionViewController *)self sectionView];
  [v4 setShowsBottomHairline:0];

  [(MKPlaceCardActionsViewController *)self setShowTopSeparator:0];
  v5 = [(MKPlaceCardActionsViewController *)self actionManager];
  v6 = [v5 createFooterActions];
  [(MKPlaceCardActionsViewController *)self setActionItemArray:v6];

  v7 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceCardFooterActionsViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (void)reloadData
{
  id v4 = [(MKPlaceCardActionsViewController *)self actionManager];
  v3 = [v4 createFooterActions];
  [(MKPlaceCardActionsViewController *)self setActionItemArray:v3];
}

@end