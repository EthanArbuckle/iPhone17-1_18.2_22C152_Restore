@interface MUShareSheetPresenter
- (MUPresentationOptions)presentationOptions;
- (MUShareSheetPresenter)initWithPlaceItem:(id)a3 presentationOptions:(id)a4;
- (MUShareSheetPresenterDelegate)delegate;
- (_MKPlaceItem)placeItem;
- (void)mapkitActivityViewController:(id)a3 postCompletedActivityOfType:(id)a4 completed:(BOOL)a5;
- (void)mapkitActivityViewController:(id)a3 preCompletedActivityOfType:(id)a4 completed:(BOOL)a5;
- (void)present;
- (void)setDelegate:(id)a3;
@end

@implementation MUShareSheetPresenter

- (MUShareSheetPresenter)initWithPlaceItem:(id)a3 presentationOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUShareSheetPresenter;
  v9 = [(MUShareSheetPresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeItem, a3);
    objc_storeStrong((id *)&v10->_presentationOptions, a4);
  }

  return v10;
}

- (void)present
{
  v3 = [(MUShareSheetPresenter *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MUShareSheetPresenter *)self delegate];
    v6 = [v5 shareSheetPresenterRequestsOverridenActivityViewController:self];
    activityViewController = self->_activityViewController;
    self->_activityViewController = v6;
  }
  if (!self->_activityViewController)
  {
    id v8 = [(MUShareSheetPresenter *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(MUShareSheetPresenter *)self delegate];
      v11 = [v10 footerActivitiesForShareSheetPresenter:self];
    }
    else
    {
      v11 = 0;
    }
    objc_super v12 = [MUPlaceItemShareItemSource alloc];
    placeItem = self->_placeItem;
    v14 = (void *)[v11 copy];
    v15 = [(MUPlaceItemShareItemSource *)v12 initWithPlaceItem:placeItem applicationActivities:v14];

    v16 = [[MUActivityViewController alloc] initWithShareItem:v15];
    v17 = self->_activityViewController;
    self->_activityViewController = v16;
  }
  v18 = [(MUPresentationOptions *)self->_presentationOptions presentingViewController];
  if (v18)
  {
    id v29 = v18;
    v19 = [MEMORY[0x1E4F31038] sharedInstance];
    int v20 = [v19 userInterfaceIdiom];

    if ((v20 & 0xFFFFFFFD) == 1)
    {
      v21 = [v29 _popoverController];
      if (v21)
      {

        uint64_t v22 = 2;
      }
      else if ([v29 _isInPopoverPresentation])
      {
        uint64_t v22 = 2;
      }
      else
      {
        uint64_t v22 = 7;
      }
      [(MUActivityViewController *)self->_activityViewController setModalPresentationStyle:v22];
    }
    v23 = [(MUActivityViewController *)self->_activityViewController popoverPresentationController];
    v24 = [(MUPresentationOptions *)self->_presentationOptions barButtonItem];

    presentationOptions = self->_presentationOptions;
    if (v24)
    {
      v26 = [(MUPresentationOptions *)presentationOptions barButtonItem];
      [v23 setBarButtonItem:v26];
    }
    else
    {
      v27 = [(MUPresentationOptions *)presentationOptions sourceView];

      if (!v27)
      {
LABEL_21:
        [v23 setPermittedArrowDirections:15];
        [v29 presentViewController:self->_activityViewController animated:1 completion:0];

        v18 = v29;
        goto LABEL_22;
      }
      v28 = [(MUPresentationOptions *)self->_presentationOptions sourceView];
      [v23 setSourceView:v28];

      v26 = [(MUPresentationOptions *)self->_presentationOptions sourceView];
      [v26 bounds];
      objc_msgSend(v23, "setSourceRect:");
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (void)mapkitActivityViewController:(id)a3 preCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(MUShareSheetPresenter *)self delegate];
  [v8 shareSheetPresenter:self preCompletedActivityOfType:v7 completed:v5];
}

- (void)mapkitActivityViewController:(id)a3 postCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(MUShareSheetPresenter *)self delegate];
  [v8 shareSheetPresenter:self postCompletedActivityOfType:v7 completed:v5];
}

- (MUPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (MUShareSheetPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUShareSheetPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
}

@end