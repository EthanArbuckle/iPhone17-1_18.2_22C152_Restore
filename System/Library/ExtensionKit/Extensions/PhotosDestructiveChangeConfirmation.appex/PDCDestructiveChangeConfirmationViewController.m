@interface PDCDestructiveChangeConfirmationViewController
- (id)_contentViewControllerForUserInfo:(id)a3;
- (void)configureWithCompletion:(id)a3;
@end

@implementation PDCDestructiveChangeConfirmationViewController

- (void)configureWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(PDCDestructiveChangeConfirmationViewController *)self extensionContext];
  v6 = [v5 inputItems];
  v7 = [v6 firstObject];
  v8 = [v7 userInfo];

  v9 = [(PDCDestructiveChangeConfirmationViewController *)self _contentViewControllerForUserInfo:v8];
  if (v9)
  {
    [(PDCDestructiveChangeConfirmationViewController *)self addChildViewController:v9];
    v10 = [(PDCDestructiveChangeConfirmationViewController *)self view];
    double y = CGRectZero.origin.y;
    [v9 preferredContentSize];
    objc_msgSend(v10, "setFrame:", CGRectZero.origin.x, y, v12, v13);
    v14 = [v9 view];
    [v14 setAutoresizingMask:18];
    [v10 addSubview:v14];
    [v9 didMoveToParentViewController:self];
    [v9 preferredContentSize];
    -[PDCDestructiveChangeConfirmationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v4[2](v4);
  }
  else
  {
    v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to load view controller for user info %@", (uint8_t *)&v16, 0xCu);
    }

    -[PDCDestructiveChangeConfirmationViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGSizeZero.width, CGSizeZero.height);
    v4[2](v4);
  }
}

- (id)_contentViewControllerForUserInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"previewStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 objectForKeyedSubscript:@"assetLocalIdentifiers"];
    objc_opt_class();
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    v10 = v8;
    if (v9)
    {
      v11 = v9;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = 0;
            goto LABEL_16;
          }
        }
        v11 = (char *)[v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      v10 = v8;
    }
LABEL_16:
    id v15 = v10;

    if ([v4 isEqualToString:@"currentAssets"])
    {
      v14 = objc_alloc_init(PDCRemoteAssetPreviewController);
      int v16 = [v3 objectForKeyedSubscript:@"photoLibraryURLString"];
      v17 = +[NSURL URLWithString:v16];
      [(PDCRemoteAssetPreviewController *)v14 setPhotoLibraryURL:v17];

      [(PDCRemoteAssetPreviewController *)v14 setAssetLocalIdentifiers:v15];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end