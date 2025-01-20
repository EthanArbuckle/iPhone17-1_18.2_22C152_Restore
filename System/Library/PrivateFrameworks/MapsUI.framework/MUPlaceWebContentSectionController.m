@interface MUPlaceWebContentSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (BOOL)isLoading;
- (BOOL)isWebContentViewControllerParentPlacecardLoading:(id)a3;
- (MUPlaceWebContentSectionController)initWithMapItem:(id)a3 configuration:(id)a4;
- (MUPlaceWebContentSectionControllerDelegate)webContentDelegate;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (id)draggableContent;
- (int)analyticsModuleType;
- (void)_setupWebContentViewController;
- (void)removeWebContentViewController:(id)a3 arguments:(id)a4;
- (void)setWebContentDelegate:(id)a3;
- (void)webContentViewController:(id)a3 performHeightChangeWithBlock:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)webContentViewControllerDidStopLoading:(id)a3;
@end

@implementation MUPlaceWebContentSectionController

- (MUPlaceWebContentSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(MUWebContentTraits);
  [(MUWebContentTraits *)v8 setVibrant:+[MUInfoCardStyle platterStyle] == 1];
  -[MUWebContentTraits setNativelyDrawingPlatter:](v8, "setNativelyDrawingPlatter:", [v7 shouldDrawPlatter]);
  v9 = [MUWebContentViewController alloc];
  v10 = [v7 url];
  v11 = [(MUWebContentViewController *)v9 initWithURL:v10 traits:v8];

  if (v11 && ([v7 url], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v19.receiver = self;
    v19.super_class = (Class)MUPlaceWebContentSectionController;
    v13 = [(MUPlaceSectionController *)&v19 initWithMapItem:v6];
    if (v13)
    {
      v14 = MUGetPlaceCardLog();
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1931EA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", "", buf, 2u);
      }

      objc_storeStrong((id *)&v13->_webContentConfig, a4);
      v13->_shouldRemoveWebContent = 0;
      objc_storeStrong((id *)&v13->_webContentViewController, v11);
      [(MUPlaceWebContentSectionController *)v13 _setupWebContentViewController];
      v15 = MUGetPlaceCardLog();
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1931EA000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", "", buf, 2u);
      }
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v17 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_FAULT, "MUPlaceWebContentSectionController: Cannot load a webmodule with config %@ because the config url is empty", buf, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (void)_setupWebContentViewController
{
  [(MUWebContentViewController *)self->_webContentViewController setDelegate:self];
  int v3 = [(GEOWebContentModuleConfiguration *)self->_webContentConfig shouldDrawPlatter];
  v4 = [MUPlaceSectionView alloc];
  v5 = v4;
  if (v3)
  {
    id v6 = [(MUPlaceSectionController *)self sectionHeaderViewModel];
    id v7 = [(MUPlaceSectionView *)v5 initWithStyle:1 sectionHeaderViewModel:v6];
    sectionView = self->_sectionView;
    self->_sectionView = v7;

    v9 = [MUPlatterView alloc];
    v10 = [(MUWebContentViewController *)self->_webContentViewController view];
    v11 = [(MUPlatterView *)v9 initWithContentView:v10];

    v12 = self->_sectionView;
  }
  else
  {
    v13 = [(MUPlaceSectionView *)v4 initWithStyle:0 alwaysHideSeparators:0];
    v14 = self->_sectionView;
    self->_sectionView = v13;

    v15 = self->_sectionView;
    v11 = [(MUWebContentViewController *)self->_webContentViewController view];
    v12 = v15;
  }
  [(MUPlaceSectionView *)v12 attachViewToContentView:v11];

  v16 = self->_sectionView;
  [(MUPlaceSectionView *)v16 configureWithSectionController:self];
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_webContentViewController;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  webContentViewController = self->_webContentViewController;
  if (webContentViewController) {
    LOBYTE(webContentViewController) = [(MUWebContentViewController *)webContentViewController isLoading]
  }
                                    || !self->_shouldRemoveWebContent;
  return (char)webContentViewController;
}

- (BOOL)isLoading
{
  return [(MUWebContentViewController *)self->_webContentViewController isLoading];
}

- (BOOL)isWebContentViewControllerParentPlacecardLoading:(id)a3
{
  return 0;
}

- (void)removeWebContentViewController:(id)a3 arguments:(id)a4
{
  self->_shouldRemoveWebContent = 1;
  v5 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "MUPlaceWebContentSectionController: Webmodule requested removal, will tell parent to update", v7, 2u);
  }

  id v6 = [(MUPlaceSectionController *)self delegate];
  [v6 placeSectionControllerDidUpdateContent:self];
}

- (void)webContentViewController:(id)a3 performHeightChangeWithBlock:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke;
  v18[3] = &unk_1E574F6C8;
  objc_copyWeak(&v20, &location);
  v18[4] = self;
  id v13 = v10;
  id v19 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2;
  v15[3] = &unk_1E574F830;
  objc_copyWeak(&v17, &location);
  id v14 = v11;
  id v16 = v14;
  objc_msgSend(v12, "_mapsui_animateWithDuration:animations:completion:", v18, v15, 0.3);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained delegate];
    v4 = [v3 placeSectionControllerRequestsRootView:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_msgSend(v4, "_mapsui_layoutIfNeeded");

    id WeakRetained = v5;
  }
}

void __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    int v3 = [WeakRetained delegate];
    [v3 placeSectionControllerRequestsLayoutChange:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v4;
  }
}

- (void)webContentViewControllerDidStopLoading:(id)a3
{
  id v4 = [(MUPlaceWebContentSectionController *)self webContentDelegate];
  [v4 webContentSectionControllerDidStopLoading:self];
}

- (id)draggableContent
{
  return 0;
}

- (int)analyticsModuleType
{
  return 25;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceWebContentSectionControllerDelegate)webContentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webContentDelegate);
  return (MUPlaceWebContentSectionControllerDelegate *)WeakRetained;
}

- (void)setWebContentDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webContentDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
  objc_storeStrong((id *)&self->_webContentConfig, 0);
}

@end