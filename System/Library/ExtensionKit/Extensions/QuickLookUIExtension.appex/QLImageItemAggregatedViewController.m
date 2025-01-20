@interface QLImageItemAggregatedViewController
- (id)_imageMarkupPreviewController;
- (id)_imagePreviewController;
- (id)_instantiatePreviewControllerWithContents:(id)a3 context:(id)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
@end

@implementation QLImageItemAggregatedViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(QLImageItemAggregatedViewController *)self _instantiatePreviewControllerWithContents:v8 context:v9];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000034C0;
  v14[3] = &unk_100024960;
  objc_copyWeak(&v17, &location);
  id v12 = v11;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v12 loadPreviewControllerIfNeededWithContents:v8 context:v9 completionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)_instantiatePreviewControllerWithContents:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = [v8 canBeEdited];
  if ((v9 & 1) == 0)
  {
    v4 = [v8 item];
    if (![v4 editingMode])
    {
      char v10 = 0;
      goto LABEL_6;
    }
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass() ^ 1;
  if ((v9 & 1) == 0) {
LABEL_6:
  }

  v11 = [v8 contentType];

  if (v11)
  {
    id v12 = [v8 contentType];
    id v13 = +[UTType typeWithIdentifier:v12];

    _QLContentTypeConformsToRawImage();
  }
  if (v10) {
    [(QLImageItemAggregatedViewController *)self _imageMarkupPreviewController];
  }
  else {
  v14 = [(QLImageItemAggregatedViewController *)self _imagePreviewController];
  }

  return v14;
}

- (id)_imageMarkupPreviewController
{
  imageMarkupPreviewController = self->_imageMarkupPreviewController;
  if (!imageMarkupPreviewController)
  {
    v4 = (QLMarkupImageItemViewController *)objc_opt_new();
    v5 = self->_imageMarkupPreviewController;
    self->_imageMarkupPreviewController = v4;

    imageMarkupPreviewController = self->_imageMarkupPreviewController;
  }

  return imageMarkupPreviewController;
}

- (id)_imagePreviewController
{
  imagePreviewController = self->_imagePreviewController;
  if (!imagePreviewController)
  {
    v4 = (QLImageItemViewController *)objc_opt_new();
    v5 = self->_imagePreviewController;
    self->_imagePreviewController = v4;

    imagePreviewController = self->_imagePreviewController;
  }

  return imagePreviewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePreviewController, 0);

  objc_storeStrong((id *)&self->_imageMarkupPreviewController, 0);
}

@end