@interface MKPlaceAttributionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)resizableViewsDisabled;
- (MKMapItem)mapItem;
- (MKPlaceAttributionCell)attributionCell;
- (NSArray)urlStrings;
- (NSAttributedString)attributionString;
- (_MKInfoCardAnalyticsDelegate)analyticsDelegate;
- (_MKMapItemAttribution)attribution;
- (id)infoAttributionString;
- (void)infoCardThemeChanged;
- (void)loadView;
- (void)openURL;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setAttributionCell:(id)a3;
- (void)setAttributionString:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setResizableViewsDisabled:(BOOL)a3;
- (void)setUrlStrings:(id)a3;
- (void)updateLogo;
- (void)viewDidLoad;
@end

@implementation MKPlaceAttributionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  if (!self->_attributionCell)
  {
    v3 = [MKPlaceAttributionCell alloc];
    v4 = -[MKPlaceAttributionCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    attributionCell = self->_attributionCell;
    self->_attributionCell = v4;

    [(MKPlaceAttributionCell *)self->_attributionCell setCellDelegate:self];
    [(MKViewWithHairline *)self->_attributionCell setTopHairlineHidden:1];
    [(MKViewWithHairline *)self->_attributionCell setBottomHairlineHidden:0];
    v6 = self->_attributionCell;
    [(MKPlaceAttributionViewController *)self setView:v6];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceAttributionViewController;
  [(MKPlaceAttributionViewController *)&v3 viewDidLoad];
  if (self->_mapItem) {
    [(MKPlaceAttributionViewController *)self updateLogo];
  }
}

- (void)updateLogo
{
  objc_super v3 = [(MKPlaceAttributionViewController *)self infoAttributionString];
  [(MKPlaceAttributionViewController *)self setAttributionString:v3];

  attributionCell = self->_attributionCell;
  attributionString = self->_attributionString;

  [(MKPlaceAttributionCell *)attributionCell setAttributionString:attributionString];
}

- (void)infoCardThemeChanged
{
  v4.receiver = self;
  v4.super_class = (Class)MKPlaceAttributionViewController;
  [(UIViewController *)&v4 infoCardThemeChanged];
  objc_super v3 = [(MKPlaceAttributionViewController *)self infoAttributionString];
  [(MKPlaceAttributionViewController *)self setAttributionString:v3];
}

- (id)infoAttributionString
{
  objc_super v3 = [(UIViewController *)self mk_theme];
  int v4 = [v3 isDarkTheme];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(MKPlaceAttributionViewController *)self mapItem];
  v7 = [(MKPlaceAttributionViewController *)self mapItem];
  v8 = [v7 _attribution];
  v9 = _MKLocalizedStringFromThisBundle(@"Find out more on %@ ");
  v10 = _MKLocalizedStringFromThisBundle(@"Find out more on %@ ");
  v11 = [v6 _attributionFor:v8 sourceStringFormat:v9 moreSourceStringFormat:v10 imageTintColor:v5];

  return v11;
}

- (void)setMapItem:(id)a3
{
  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    objc_storeStrong((id *)&self->_mapItem, a3);
    if (self->_attributionCell) {
      [(MKPlaceAttributionViewController *)self updateLogo];
    }
  }
}

- (void)setAttributionString:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  attributionString = self->_attributionString;
  if (v4)
  {
    if (([(NSAttributedString *)attributionString isEqual:v4] & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F42670] defaultParagraphStyle];
      v7 = (void *)[v6 mutableCopy];

      [v7 setAlignment:4];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v4];
      uint64_t v9 = *MEMORY[0x1E4F42540];
      v18[0] = v7;
      uint64_t v10 = *MEMORY[0x1E4F42510];
      v17[0] = v9;
      v17[1] = v10;
      v11 = [(UIViewController *)self mk_theme];
      v12 = [v11 tintColor];
      v18[1] = v12;
      v17[2] = *MEMORY[0x1E4F42508];
      v13 = +[MKPlaceAttributionCell fontForLabel];
      v18[2] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
      objc_msgSend(v8, "addAttributes:range:", v14, 0, objc_msgSend(v8, "length"));

      v15 = (NSAttributedString *)[v8 copy];
      v16 = self->_attributionString;
      self->_attributionString = v15;

      [(MKPlaceAttributionCell *)self->_attributionCell setAttributionString:self->_attributionString];
    }
  }
  else
  {
    self->_attributionString = 0;

    [(MKPlaceAttributionCell *)self->_attributionCell setAttributionString:self->_attributionString];
  }
}

- (void)openURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  id v4 = [(MKPlaceAttributionViewController *)self mapItem];
  v5 = [v4 _attribution];
  v6 = [v5 providerID];
  v7 = [(MKPlaceAttributionViewController *)self mapItem];
  v8 = [v7 _attribution];
  uint64_t v9 = [v8 providerID];
  [WeakRetained infoCardAnalyticsDidSelectAction:6023 eventValue:v6 feedbackDelegateSelector:180 actionRichProviderId:v9];

  urlStrings = self->_urlStrings;
  attribution = self->_attribution;

  +[MKAppLaunchController launchAttributionURLs:urlStrings withAttribution:attribution completionHandler:0];
}

- (NSArray)urlStrings
{
  return self->_urlStrings;
}

- (void)setUrlStrings:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSAttributedString)attributionString
{
  return self->_attributionString;
}

- (MKPlaceAttributionCell)attributionCell
{
  return self->_attributionCell;
}

- (void)setAttributionCell:(id)a3
{
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  self->_resizableViewsDisabled = a3;
}

- (_MKMapItemAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (_MKInfoCardAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_attributionCell, 0);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_urlStrings, 0);
}

@end