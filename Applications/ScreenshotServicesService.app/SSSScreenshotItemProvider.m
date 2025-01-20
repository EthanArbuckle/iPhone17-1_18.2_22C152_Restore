@interface SSSScreenshotItemProvider
- (NSString)overrideName;
- (SSSScreenshot)screenshot;
- (SSSScreenshotItemProvider)initWithScreenshot:(id)a3;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)item;
- (id)nameForScreenshot;
- (id)placeholderItemForScreenshot:(id)a3;
- (void)setOverrideName:(id)a3;
- (void)setScreenshot:(id)a3;
@end

@implementation SSSScreenshotItemProvider

- (SSSScreenshotItemProvider)initWithScreenshot:(id)a3
{
  id v4 = a3;
  v5 = [(SSSScreenshotItemProvider *)self placeholderItemForScreenshot:v4];
  v8.receiver = self;
  v8.super_class = (Class)SSSScreenshotItemProvider;
  v6 = [(SSSScreenshotItemProvider *)&v8 initWithPlaceholderItem:v5];
  [(SSSScreenshotItemProvider *)v6 setScreenshot:v4];

  return v6;
}

- (id)placeholderItemForScreenshot:(id)a3
{
  id v3 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, @"Subclass must override -[SSSScreenshotItemProvider placeholderItemForScreenshot:]", 0);
  return 0;
}

- (id)item
{
  id v2 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, @"Subclass must override -[SSSScreenshotItemProvider item]", 0);
  return &stru_10009B8B0;
}

- (id)nameForScreenshot
{
  overrideName = self->_overrideName;
  if (overrideName)
  {
    id v3 = overrideName;
  }
  else
  {
    id v4 = [(SSSScreenshotItemProvider *)self screenshot];
    id v3 = [v4 filename];
  }

  return v3;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = [(SSSScreenshotItemProvider *)self screenshot];
  v5 = [(SSSScreenshotItemProvider *)self placeholderItemForScreenshot:v4];

  return v5;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, @"Subclass must override -[SSSScreenshotItemProvider activityViewController:subjectForActivityType]", 0);
  v6 = [(SSSScreenshotItemProvider *)self screenshot];
  v7 = [v6 filename];

  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v5 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, @"Subclass must override -[SSSScreenshotItemProvider activityViewController:attachmentNameForActivityType]", 0);
  v6 = [(SSSScreenshotItemProvider *)self screenshot];
  v7 = [v6 filename];

  return v7;
}

- (SSSScreenshot)screenshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshot);

  return (SSSScreenshot *)WeakRetained;
}

- (void)setScreenshot:(id)a3
{
}

- (NSString)overrideName
{
  return self->_overrideName;
}

- (void)setOverrideName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideName, 0);

  objc_destroyWeak((id *)&self->_screenshot);
}

@end