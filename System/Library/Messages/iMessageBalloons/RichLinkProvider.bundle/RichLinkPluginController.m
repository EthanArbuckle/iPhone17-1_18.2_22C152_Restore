@interface RichLinkPluginController
- (BOOL)allowsOpeningSensitiveURLs;
- (BOOL)canPresentCustomizationPicker;
- (BOOL)handlePresentationAction;
- (BOOL)isInteractive;
- (BOOL)wantsEdgeToEdgeLayout;
- (BOOL)wantsTranscriptGroupMonograms;
- (BOOL)wantsTranscriptTimestampDrawer;
- (CKTranscriptLinkCustomizationPickerDelegate)customizationPickerDelegate;
- (CKTranscriptPluginView)pluginContentView;
- (RichLinkPluginController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4;
- (UIColor)balloonOutlineColor;
- (UIViewController)contentViewController;
- (double)maximumWidthForLinkViewInCustomizationPicker:(id)a3;
- (id)rendererForRichLinkPluginDataSource:(id)a3;
- (void)customizationPicker:(id)a3 didSelectVariantAtIndex:(int64_t)a4;
- (void)dealloc;
- (void)presentCustomizationPicker;
- (void)restoreOriginalPluginBackgroundIfNeeded;
- (void)setAllowsOpeningSensitiveURLs:(BOOL)a3;
- (void)setCustomizationPickerDelegate:(id)a3;
- (void)setOpaquePluginBackgroundIfNeeded:(id)a3;
@end

@implementation RichLinkPluginController

- (RichLinkPluginController)initWithDataSource:(id)a3 isFromMe:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RichLinkPluginController;
  v7 = [(RichLinkPluginController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    [(RichLinkPluginDataSource *)v8->_dataSource addClient:v8];
  }

  return v8;
}

- (void)dealloc
{
  if (self->_keyboardHidden) {
    +[UIKeyboard setKeyboardAlpha:1.0];
  }
  v3.receiver = self;
  v3.super_class = (Class)RichLinkPluginController;
  [(RichLinkPluginController *)&v3 dealloc];
}

- (id)rendererForRichLinkPluginDataSource:(id)a3
{
  return self->_view;
}

- (CKTranscriptPluginView)pluginContentView
{
  view = self->_view;
  if (!view)
  {
    v4 = [(RichLinkPluginDataSource *)self->_dataSource createRichLinkView];
    v5 = self->_view;
    self->_view = v4;

    [(LPLinkView *)self->_view _setAllowsOpeningSensitiveURLs:self->_allowsOpeningSensitiveURLs];
    view = self->_view;
  }

  return (CKTranscriptPluginView *)view;
}

- (BOOL)handlePresentationAction
{
  return 1;
}

- (BOOL)allowsOpeningSensitiveURLs
{
  return self->_allowsOpeningSensitiveURLs;
}

- (void)setAllowsOpeningSensitiveURLs:(BOOL)a3
{
  self->_allowsOpeningSensitiveURLs = a3;
}

- (void)setOpaquePluginBackgroundIfNeeded:(id)a3
{
}

- (void)restoreOriginalPluginBackgroundIfNeeded
{
}

- (UIViewController)contentViewController
{
  id v2 = [(RichLinkPluginDataSource *)self->_dataSource originalURL];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSURLComponents) initWithURL:v2 resolvingAgainstBaseURL:0];
    v4 = [v3 host];
    id v5 = [v4 caseInsensitiveCompare:@"itunes.apple.com"];

    if (!v5) {
      goto LABEL_16;
    }
    id v6 = [v3 host];
    id v7 = [v6 caseInsensitiveCompare:@"itunes.com"];

    if (!v7) {
      goto LABEL_16;
    }
    v8 = [v3 host];
    id v9 = [v8 caseInsensitiveCompare:@"itun.es"];

    if (!v9) {
      goto LABEL_16;
    }
    objc_super v10 = [v3 host];
    id v11 = [v10 caseInsensitiveCompare:@"appsto.re"];

    if (!v11) {
      goto LABEL_16;
    }
    v12 = [v3 host];
    id v13 = [v12 caseInsensitiveCompare:@"apps.apple.com"];

    if (!v13) {
      goto LABEL_16;
    }
    v14 = [v3 host];
    id v15 = [v14 caseInsensitiveCompare:@"music.apple.com"];

    if (!v15) {
      goto LABEL_16;
    }
    v16 = [v3 host];
    id v17 = [v16 caseInsensitiveCompare:@"movies.apple.com"];

    if (!v17) {
      goto LABEL_16;
    }
    v18 = [v3 host];
    id v19 = [v18 caseInsensitiveCompare:@"tv.apple.com"];

    if (!v19) {
      goto LABEL_16;
    }
    v20 = [v3 host];
    id v21 = [v20 caseInsensitiveCompare:@"books.apple.com"];

    if (!v21) {
      goto LABEL_16;
    }
    v22 = [v3 host];
    id v23 = [v22 caseInsensitiveCompare:@"podcasts.apple.com"];

    if (!v23) {
      goto LABEL_16;
    }
    v24 = [v3 host];
    id v25 = [v24 caseInsensitiveCompare:@"maps.apple.com"];

    if (!v25) {
      goto LABEL_16;
    }
    v26 = [v3 host];
    BOOL v27 = sub_324C(v26, &off_CA48);

    if (v27)
    {
      v28 = [v2 pathComponents];
      if ((unint64_t)[v28 count] <= 1)
      {
      }
      else
      {
        v29 = [v28 objectAtIndexedSubscript:1];
        BOOL v30 = sub_324C(v29, &off_CA60);

        if (v30)
        {
LABEL_16:

          id v31 = +[UIDevice currentDevice];
          v32 = [v31 _tapticEngine];
          [v32 actuateFeedback:2];

          v33 = 0;
          goto LABEL_20;
        }
      }
    }
  }
  id v31 = objc_msgSend(objc_alloc((Class)MLULookupItem), "initWithURL:dataDetectorsResult:text:range:", v2, 0, &stru_C4E0, 0, 0);
  [v31 resolve];
  v33 = [v31 viewControllerToPresent];
LABEL_20:

  return (UIViewController *)v33;
}

- (BOOL)wantsTranscriptTimestampDrawer
{
  return 1;
}

- (BOOL)wantsTranscriptGroupMonograms
{
  return 1;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 0;
}

- (BOOL)isInteractive
{
  return 1;
}

- (UIColor)balloonOutlineColor
{
  id v2 = [(LPLinkView *)self->_view _dominantBackgroundColor];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIColor separatorColor];
  }
  id v5 = v4;

  return (UIColor *)v5;
}

- (BOOL)canPresentCustomizationPicker
{
  id v2 = [(LPLinkView *)self->_view _metadataVariants];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)presentCustomizationPicker
{
  BOOL v3 = [(RichLinkPluginDataSource *)self->_dataSource balloonMaskIncludingTail:0 userInterfaceStyle:1];
  id v4 = [objc_alloc((Class)LPCustomizationPickerViewController) initWithSource:self->_view];
  [v4 setCustomizationDelegate:self];
  [v4 setMask:v3];
  id v5 = [(LPLinkView *)self->_view traitCollection];
  if (![v5 userInterfaceIdiom]
    || [v5 horizontalSizeClass] == (char *)&dword_0 + 1
    || [v5 verticalSizeClass] == (char *)&dword_0 + 1)
  {
    [v4 setModalPresentationStyle:4];
    [v4 setTransitioningDelegate:v4];
  }
  else
  {
    [v4 setModalPresentationStyle:7];
    id v9 = [v4 popoverPresentationController];
    [v9 setPermittedArrowDirections:12];

    view = self->_view;
    id v11 = [v4 popoverPresentationController];
    [v11 setSourceView:view];
  }
  id v6 = +[UIViewController _viewControllerForFullScreenPresentationFromView:self->_view];
  if (v6)
  {
    id v7 = [(RichLinkPluginController *)self customizationPickerDelegate];
    [v7 customizationPickerControllerWillPresent:v4];

    self->_keyboardHidden = 1;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2F04;
    v12[3] = &unk_C318;
    v12[4] = self;
    id v13 = v4;
    [v6 presentViewController:v13 animated:1 completion:v12];
  }
  else
  {
    v8 = LPLogChannelPlugin();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_6E8C(v8);
    }
  }
}

- (void)customizationPicker:(id)a3 didSelectVariantAtIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(LPLinkView *)self->_view _selectedVariantIndex];
  if (!v7
    || (v8 = (void *)v7,
        [(LPLinkView *)self->_view _selectedVariantIndex],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 integerValue],
        v9,
        v8,
        v10 != (id)a4))
  {
    id v11 = +[NSNumber numberWithInteger:a4];
    [(LPLinkView *)self->_view _setSelectedVariantIndex:v11];

    dataSource = self->_dataSource;
    id v13 = [(LPLinkView *)self->_view _flattenedMetadata];
    [(RichLinkPluginDataSource *)dataSource setFlattenedMetadataForSending:v13];
  }
  v14 = [(RichLinkPluginController *)self customizationPickerDelegate];
  [v14 customizationPickerControllerWillDismiss:v6];

  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_3110;
  v22 = &unk_C318;
  id v23 = self;
  id v15 = v6;
  id v24 = v15;
  [v15 dismissViewControllerAnimated:1 completion:&v19];
  v16 = [(RichLinkPluginController *)self customizationPickerDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v17 = +[UIDevice currentDevice];
    unint64_t v18 = (unint64_t)[v17 userInterfaceIdiom];

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      +[UIKeyboard setKeyboardAlpha:0.0];
    }
  }
  else
  {
  }
}

- (double)maximumWidthForLinkViewInCustomizationPicker:(id)a3
{
  id v4 = a3;
  id v5 = [(RichLinkPluginController *)self customizationPickerDelegate];
  id v6 = [v5 transitionContextForCustomizationPickerController:v4];

  [v6 maxWidthForSourceView];
  double v8 = v7;

  return v8;
}

- (CKTranscriptLinkCustomizationPickerDelegate)customizationPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizationPickerDelegate);

  return (CKTranscriptLinkCustomizationPickerDelegate *)WeakRetained;
}

- (void)setCustomizationPickerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customizationPickerDelegate);
  objc_storeStrong((id *)&self->_view, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end