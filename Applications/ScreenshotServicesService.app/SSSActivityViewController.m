@interface SSSActivityViewController
- (BOOL)_customizationAvailableForActivityViewController:(id)a3;
- (BOOL)didRenameScreenshot;
- (BOOL)isSharingMixedScreenshots;
- (BOOL)isSharingMultipleScreenScreenshots;
- (BOOL)isSharingSingleFullPageScreenshot;
- (BOOL)isSharingSingleFullPageScreenshotAsImageUsingAutomatic;
- (BOOL)isSharingSingleFullPageScreenshotAsPDFUsingAutomatic;
- (BOOL)isSharingSingleScreenScreenshot;
- (BOOL)pdfCanBeConvertedToImage;
- (BOOL)screenshotItemProvidersContainsPDF;
- (BOOL)screenshotItemProvidersContainsPDFAsImage;
- (NSArray)activityItemProviders;
- (NSString)renameOption;
- (SSSActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 editMode:(int64_t)a5;
- (id)_bestFormatForScreenshotItemProvider:(id)a3;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)_updateItemProvidersWithOptions;
- (id)renameGroup;
- (id)screenshotItemProviders;
- (id)screenshots;
- (id)sendAsGroup;
- (int64_t)editMode;
- (int64_t)shareAsOption;
- (void)didChangeRenameOption;
- (void)didChangeShareOptions;
- (void)reportStatistics;
- (void)setActivityItemProviders:(id)a3;
- (void)setEditMode:(int64_t)a3;
- (void)setRenameOption:(id)a3;
- (void)setShareAsOption:(int64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SSSActivityViewController

- (id)screenshotItemProviders
{
  v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(SSSActivityViewController *)self activityItemProviders];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)screenshots
{
  v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(SSSActivityViewController *)self screenshotItemProviders];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 screenshot];

        if (v10)
        {
          v11 = [v9 screenshot];
          [v3 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return v12;
}

- (BOOL)didRenameScreenshot
{
  v2 = [(SSSActivityViewController *)self renameOption];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)screenshotItemProvidersContainsPDF
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SSSActivityViewController *)self activityItemProviders];
  BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)screenshotItemProvidersContainsPDFAsImage
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SSSActivityViewController *)self activityItemProviders];
  BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isSharingSingleFullPageScreenshot
{
  if ((id)[(SSSActivityViewController *)self editMode] != (id)1) {
    return 0;
  }
  BOOL v3 = [(SSSActivityViewController *)self screenshots];
  BOOL v4 = [v3 count] == (id)1;

  return v4;
}

- (BOOL)isSharingSingleFullPageScreenshotAsImageUsingAutomatic
{
  if (![(SSSActivityViewController *)self isSharingSingleFullPageScreenshot]
    || [(SSSActivityViewController *)self editMode])
  {
    return 0;
  }

  return [(SSSActivityViewController *)self screenshotItemProvidersContainsPDF];
}

- (BOOL)isSharingSingleFullPageScreenshotAsPDFUsingAutomatic
{
  if (![(SSSActivityViewController *)self isSharingSingleFullPageScreenshot]
    || [(SSSActivityViewController *)self editMode])
  {
    return 0;
  }

  return [(SSSActivityViewController *)self screenshotItemProvidersContainsPDFAsImage];
}

- (BOOL)isSharingSingleScreenScreenshot
{
  if ([(SSSActivityViewController *)self editMode]) {
    return 0;
  }
  BOOL v4 = [(SSSActivityViewController *)self screenshots];
  BOOL v3 = [v4 count] == (id)1;

  return v3;
}

- (BOOL)isSharingMultipleScreenScreenshots
{
  if ([(SSSActivityViewController *)self editMode]) {
    return 0;
  }
  BOOL v4 = [(SSSActivityViewController *)self screenshots];
  BOOL v3 = (unint64_t)[v4 count] > 1;

  return v3;
}

- (BOOL)isSharingMixedScreenshots
{
  if ((id)[(SSSActivityViewController *)self editMode] != (id)1) {
    return 0;
  }
  BOOL v3 = [(SSSActivityViewController *)self screenshots];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (SSSActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 editMode:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SSSActivityViewController;
  long long v9 = [(SSSActivityViewController *)&v16 initWithActivityItems:v8 applicationActivities:a4];
  long long v10 = v9;
  if (v9)
  {
    [(SSSActivityViewController *)v9 setActivityItemProviders:v8];
    [(SSSActivityViewController *)v10 setObjectManipulationDelegate:v10];
    v10->_editMode = a5;
    renameOption = v10->_renameOption;
    v10->_renameOption = 0;

    if ([(SSSActivityViewController *)v10 isSharingSingleFullPageScreenshot])
    {
      id v12 = [(SSSActivityViewController *)v10 screenshots];
      long long v13 = [v12 firstObject];
      v10->_pdfCanBeConvertedToImage = [v13 pdfCanBeConvertedToImage];
    }
    else
    {
      v10->_pdfCanBeConvertedToImage = 0;
    }
    if ([(SSSActivityViewController *)v10 pdfCanBeConvertedToImage]) {
      uint64_t UsedFullPageScreenshotShareAsOption = _SSGetLastUsedFullPageScreenshotShareAsOption();
    }
    else {
      uint64_t UsedFullPageScreenshotShareAsOption = 0;
    }
    v10->_shareAsOption = UsedFullPageScreenshotShareAsOption;
    [(SSSActivityViewController *)v10 didChangeShareOptions];
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSSActivityViewController;
  [(SSSActivityViewController *)&v7 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016F58;
  v4[3] = &unk_100099E00;
  objc_copyWeak(&v5, &location);
  [(SSSActivityViewController *)self setPreCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reportStatistics
{
  int64_t v3 = [(SSSActivityViewController *)self shareAsOption];
  if (v3)
  {
    if (v3 == 2)
    {
      BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
      [v4 didShareFullPageScreenshotAsPDF];
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_17;
      }
      BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
      [v4 didShareFullPageScreenshotAsImage];
    }
  }
  else if ([(SSSActivityViewController *)self isSharingSingleFullPageScreenshotAsImageUsingAutomatic])
  {
    BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didShareFullPageScreenshotAsAutomaticImage];
  }
  else if ([(SSSActivityViewController *)self isSharingSingleFullPageScreenshotAsPDFUsingAutomatic])
  {
    BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didShareFullPageScreenshotAsAutomaticPDF];
  }
  else if ([(SSSActivityViewController *)self isSharingSingleScreenScreenshot])
  {
    BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didShareScreenSingleScreenshots];
  }
  else if ([(SSSActivityViewController *)self isSharingMultipleScreenScreenshots])
  {
    BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didShareScreenMultipleScreenshots];
  }
  else
  {
    if (![(SSSActivityViewController *)self isSharingMixedScreenshots]) {
      goto LABEL_17;
    }
    BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didShareFullPageMixedScreenshots];
  }

LABEL_17:
  if ([(SSSActivityViewController *)self didRenameScreenshot])
  {
    id v5 = +[SSSStatisticsManager sharedStatisticsManager];
    [v5 didRenameScreenshot];
  }
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  return 1;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  BOOL v4 = +[NSMutableArray array];
  if ([(SSSActivityViewController *)self pdfCanBeConvertedToImage])
  {
    id v5 = [(SSSActivityViewController *)self sendAsGroup];
    [v4 addObject:v5];
  }
  id v6 = [(SSSActivityViewController *)self renameGroup];
  [v4 addObject:v6];

  return v4;
}

- (id)sendAsGroup
{
  int64_t v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"SHARING_OPTIONS_SEND_AS_AUTOMATIC" value:@"Automatic" table:0];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"SHARING_OPTIONS_SEND_AS_IMAGE" value:@"Single Image" table:0];

  objc_super v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"SHARING_OPTIONS_SEND_AS_PDF" value:@"PDF Document" table:0];

  v24[0] = v4;
  v24[1] = v6;
  v24[2] = v8;
  long long v9 = +[NSArray arrayWithObjects:v24 count:3];
  long long v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"SHARING_OPTIONS_SEND_AS_GROUP_FOOTER_TEXT" value:@"Automatic selects the best format based on the screenshot being shared." table:0];

  objc_initWeak(&location, self);
  int64_t v12 = [(SSSActivityViewController *)self shareAsOption];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000174E0;
  v20[3] = &unk_100099E28;
  objc_copyWeak(&v21, &location);
  long long v13 = +[_UIActivityItemCustomization pickerCustomizationWithIdentifier:@"SHARING_OPTIONS_SEND_AS_PICKER" options:v9 selectedOptionIndex:v12 footerText:v11 valueChangedHandler:v20];
  long long v14 = +[NSBundle mainBundle];
  long long v15 = [v14 localizedStringForKey:@"SHARING_OPTIONS_SEND_AS_GROUP_TITLE" value:@"Send as" table:0];

  id v16 = objc_alloc((Class)_UIActivityItemCustomizationGroup);
  v23 = v13;
  long long v17 = +[NSArray arrayWithObjects:&v23 count:1];
  id v18 = [v16 _initGroupWithName:v15 identifier:@"SHARING_OPTIONS_SEND_AS_GROUP" customizations:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v18;
}

- (id)renameGroup
{
  int64_t v3 = [(SSSActivityViewController *)self screenshots];
  BOOL v4 = [v3 count] == (id)1;

  id v5 = [(SSSActivityViewController *)self renameOption];
  id v6 = v5;
  if (v4)
  {
    if (v5)
    {
      objc_super v7 = v5;
    }
    else
    {
      v11 = [(SSSActivityViewController *)self screenshots];
      int64_t v12 = [v11 firstObject];
      objc_super v7 = [v12 filename];
    }
    long long v9 = [(SSSActivityViewController *)self screenshots];
    long long v13 = [v9 firstObject];
    long long v10 = [v13 filename];
  }
  else
  {
    id v8 = &stru_10009B8B0;
    if (v5) {
      id v8 = v5;
    }
    objc_super v7 = v8;

    long long v9 = +[NSBundle mainBundle];
    long long v10 = [v9 localizedStringForKey:@"SHARING_OPTIONS_RENAME_MULTIPLE_PLACEHOLDER" value:@"Multiple names" table:0];
  }

  objc_initWeak(&location, self);
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100017850;
  v24 = &unk_100099E50;
  objc_copyWeak(&v25, &location);
  long long v14 = +[_UIActivityItemCustomization textFieldCustomizationWithText:v7 placeholder:v10 identifier:@"SHARING_OPTIONS_RENAME_GROUP" footerText:0 textChangedHandler:&v21];
  long long v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"SHARING_OPTIONS_RENAME_GROUP_TITLE" value:@"File Name" table:0];

  id v17 = objc_alloc((Class)_UIActivityItemCustomizationGroup);
  v27 = v14;
  id v18 = +[NSArray arrayWithObjects:&v27 count:1];
  id v19 = [v17 _initGroupWithName:v16 identifier:@"SHARING_OPTIONS_RENAME_GROUP" customizations:v18];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v19;
}

- (void)didChangeRenameOption
{
  int64_t v3 = [(SSSActivityViewController *)self renameOption];

  if (v3)
  {
    BOOL v4 = [(SSSActivityViewController *)self renameOption];
    id v5 = +[NSCharacterSet whitespaceCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];

    if (![v6 length]) {
      goto LABEL_5;
    }
    if (![(SSSActivityViewController *)self isSharingSingleFullPageScreenshot]) {
      goto LABEL_6;
    }
    objc_super v7 = [(SSSActivityViewController *)self screenshots];
    id v8 = [v7 firstObject];
    long long v9 = [v8 filename];
    unsigned __int8 v10 = [v6 isEqualToString:v9];

    if (v10) {
LABEL_5:
    }
      v11 = 0;
    else {
LABEL_6:
    }
      v11 = v6;
    [(SSSActivityViewController *)self setRenameOption:v11];
  }

  [(SSSActivityViewController *)self didChangeShareOptions];
}

- (void)didChangeShareOptions
{
  id v4 = [(SSSActivityViewController *)self _updateItemProvidersWithOptions];
  [(SSSActivityViewController *)self setActivityItemProviders:v4];
  int64_t v3 = +[NSArray array];
  [(SSSActivityViewController *)self _updateActivityItems:v3];

  [(SSSActivityViewController *)self _updateActivityItems:self->_activityItemProviders];
}

- (id)_updateItemProvidersWithOptions
{
  int64_t v3 = +[NSMutableArray array];
  id v4 = [(SSSActivityViewController *)self activityItemProviders];
  id v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(SSSActivityViewController *)self activityItemProviders];
      long long v9 = [v8 objectAtIndex:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      [v3 addObject:v9];
LABEL_19:

      ++v7;
      id v18 = [(SSSActivityViewController *)self activityItemProviders];
      id v19 = [v18 count];

      if (v7 >= (unint64_t)v19) {
        goto LABEL_20;
      }
    }
    id v10 = v9;
    int64_t v11 = [(SSSActivityViewController *)self shareAsOption];
    if (v11 == 2)
    {
      long long v13 = SSSScreenshotItemProviderPDF;
    }
    else
    {
      if (v11 != 1)
      {
        if (v11)
        {
          id v12 = 0;
        }
        else
        {
          id v12 = [(SSSActivityViewController *)self _bestFormatForScreenshotItemProvider:v10];
        }
        goto LABEL_13;
      }
      long long v13 = SSSScreenshotItemProviderPDFAsImage;
    }
    id v14 = [v13 alloc];
    long long v15 = [v10 screenshot];
    id v12 = [v14 initWithScreenshot:v15];

LABEL_13:
    if ([(SSSActivityViewController *)self didRenameScreenshot])
    {
      id v16 = [(SSSActivityViewController *)self renameOption];
      if (v6)
      {
        id v17 = +[NSString stringWithFormat:@"%@ %li", v16, v6];
        [v12 setOverrideName:v17];
      }
      else
      {
        [v12 setOverrideName:v16];
      }
    }
    [v3 addObject:v12];
    ++v6;

    goto LABEL_19;
  }
LABEL_20:

  return v3;
}

- (id)_bestFormatForScreenshotItemProvider:(id)a3
{
  id v4 = a3;
  if ([(SSSActivityViewController *)self isSharingSingleFullPageScreenshot]
    && [(SSSActivityViewController *)self pdfCanBeConvertedToImage])
  {
    id v5 = [(SSSActivityViewController *)self screenshots];
    uint64_t v6 = [v5 firstObject];
    unint64_t v7 = [v6 PDFDocument];
    [v7 pageCount];
  }
  id v8 = objc_alloc((Class)objc_opt_class());
  long long v9 = [v4 screenshot];
  id v10 = [v8 initWithScreenshot:v9];

  return v10;
}

- (NSArray)activityItemProviders
{
  return self->_activityItemProviders;
}

- (void)setActivityItemProviders:(id)a3
{
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(int64_t)a3
{
  self->_editMode = a3;
}

- (int64_t)shareAsOption
{
  return self->_shareAsOption;
}

- (void)setShareAsOption:(int64_t)a3
{
  self->_shareAsOption = a3;
}

- (NSString)renameOption
{
  return self->_renameOption;
}

- (void)setRenameOption:(id)a3
{
}

- (BOOL)pdfCanBeConvertedToImage
{
  return self->_pdfCanBeConvertedToImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renameOption, 0);

  objc_storeStrong((id *)&self->_activityItemProviders, 0);
}

@end