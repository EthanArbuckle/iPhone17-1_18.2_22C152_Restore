@interface DOCActivity
+ (BOOL)isDestructiveActionIdentifier:(id)a3;
+ (id)_activityWithIdentifier:(id)a3 forBrowserAction:(id)a4 actionPerformerProxy:(id)a5;
+ (id)_imageNameForActivityIdentifier:(id)a3;
+ (id)_titleForActivityIdentifier:(id)a3;
+ (id)activityForBrowserAction:(id)a3 actionPerformerProxy:(id)a4;
+ (id)activityWithIdentifier:(id)a3 actionPerformerProxy:(id)a4;
+ (int64_t)_activityStyleForActivityIdentifier:(id)a3;
+ (int64_t)activityCategory;
- (BOOL)_needsResolvedActivityItems;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (DOCActivity)initWithIdentifier:(id)a3 actionPerformer:(id)a4 forBrowserAction:(id)a5;
- (DOCItemActivityPerformer)actionPerformerProxy;
- (NSArray)items;
- (NSString)identifier;
- (NSString)imageName;
- (NSString)localizedTitle;
- (UIImage)image;
- (void)performActivity;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageName:(id)a3;
- (void)setItems:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)validate;
@end

@implementation DOCActivity

+ (id)activityWithIdentifier:(id)a3 actionPerformerProxy:(id)a4
{
  return (id)[a1 _activityWithIdentifier:a3 forBrowserAction:0 actionPerformerProxy:a4];
}

+ (id)activityForBrowserAction:(id)a3 actionPerformerProxy:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 identifier];
  v9 = [a1 _activityWithIdentifier:v8 forBrowserAction:v7 actionPerformerProxy:v6];

  return v9;
}

+ (id)_activityWithIdentifier:(id)a3 forBrowserAction:(id)a4 actionPerformerProxy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 identifier];
  uint64_t v12 = [a1 _activityStyleForActivityIdentifier:v11];

  if (v12 == 1 || v9 && [v9 actionStyle] == 1) {
    v13 = off_2641B0AB0;
  }
  else {
    v13 = off_2641B0A88;
  }
  v14 = (void *)[objc_alloc(*v13) initWithIdentifier:v8 actionPerformer:v10 forBrowserAction:v9];

  return v14;
}

+ (BOOL)isDestructiveActionIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = @"com.apple.DocumentManager.action.trash";
  id v8 = @"com.apple.DocumentManager.action.mixedDelete";
  id v9 = @"com.apple.DocumentManager.action.delete";
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:&v7 count:3];
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4, v7, v8, v9, v10);

  return (char)v3;
}

+ (int64_t)_activityStyleForActivityIdentifier:(id)a3
{
  return [a1 isDestructiveActionIdentifier:a3];
}

+ (id)_imageNameForActivityIdentifier:(id)a3
{
  v3 = (__CFString *)a3;
  if (@"com.apple.DocumentManager.action.copySharedLink" == v3)
  {
    v5 = @"square.and.arrow.up";
  }
  else if (@"com.apple.DocumentManager.action.copy" == v3)
  {
    v5 = @"doc.on.doc";
  }
  else if (@"com.apple.DocumentManager.action.archive" == v3 {
         || @"com.apple.DocumentManager.action.unarchive" == v3)
  }
  {
    v5 = @"archivebox";
  }
  else if (@"com.apple.DocumentManager.action.rename" == v3)
  {
    v5 = @"pencil";
  }
  else if (@"com.apple.DocumentManager.action.duplicate" == v3)
  {
    v5 = @"plus.square.on.square";
  }
  else if (@"com.apple.DocumentManager.action.move" == v3)
  {
    v5 = @"folder";
  }
  else if (@"com.apple.DocumentManager.action.trash" == v3)
  {
    v5 = @"trash";
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_titleForActivityIdentifier:(id)a3
{
  v3 = (__CFString *)a3;
  id v4 = v3;
  if (@"com.apple.DocumentManager.action.copySharedLink" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Copy Link [Action Sheet]";
    id v9 = @"Copy Link";
  }
  else if (@"com.apple.DocumentManager.action.copy" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Copy [Action Sheet]";
    id v9 = @"Copy";
  }
  else if (@"com.apple.DocumentManager.action.archive" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Compress [Action Sheet]";
    id v9 = @"Compress";
  }
  else if (@"com.apple.DocumentManager.action.unarchive" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Uncompress [Action Sheet]";
    id v9 = @"Uncompress";
  }
  else if (@"com.apple.DocumentManager.action.rename" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Rename [Action Sheet]";
    id v9 = @"Rename";
  }
  else if (@"com.apple.DocumentManager.action.duplicate" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Duplicate [Action Sheet]";
    id v9 = @"Duplicate";
  }
  else if (@"com.apple.DocumentManager.action.move" == v3)
  {
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Move [Action Sheet]";
    id v9 = @"Move";
  }
  else
  {
    if (@"com.apple.DocumentManager.action.trash" != v3)
    {
      v5 = 0;
      goto LABEL_19;
    }
    id v6 = _DocumentManagerBundle();
    id v7 = v6;
    id v8 = @"Delete [Action Sheet]";
    id v9 = @"Delete";
  }
  v5 = [v6 localizedStringForKey:v8 value:v9 table:@"Localizable"];

LABEL_19:
  return v5;
}

- (DOCActivity)initWithIdentifier:(id)a3 actionPerformer:(id)a4 forBrowserAction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"DOCActivity.m", 148, @"Invalid parameter not satisfying: %@", @"actionPerformer" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v42 = [MEMORY[0x263F08690] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"DOCActivity.m", 149, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  v43.receiver = self;
  v43.super_class = (Class)DOCActivity;
  uint64_t v12 = [(UIActivity *)&v43 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionPerformerProxy, a4);
    if (v11)
    {
      v14 = [v11 identifier];
      uint64_t v15 = [v14 copy];
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v15;
    }
    else
    {
      v17 = (NSString *)v9;
      v14 = v13->_identifier;
      v13->_identifier = v17;
    }

    uint64_t v18 = [(id)objc_opt_class() _imageNameForActivityIdentifier:v9];
    imageName = v13->_imageName;
    v13->_imageName = (NSString *)v18;

    if (v11 && !v13->_imageName)
    {
      v20 = [v11 image];
      v21 = [MEMORY[0x263F82B60] mainScreen];
      v22 = [v21 traitCollection];
      v23 = [v22 preferredContentSizeCategory];

      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v23);
      uint64_t v25 = *MEMORY[0x263F83570];
      if (IsAccessibilityCategory)
      {
        v26 = (void *)MEMORY[0x263F82768];
        v27 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83420]];
        v28 = [v26 preferredFontDescriptorWithTextStyle:v25 compatibleWithTraitCollection:v27];

        v29 = [v28 fontDescriptorWithSymbolicTraits:0x8000];

        v30 = [MEMORY[0x263F82760] fontWithDescriptor:v29 size:0.0];
        v31 = (void *)MEMORY[0x263F82818];
        [v30 pointSize];
        v32 = objc_msgSend(v31, "configurationWithPointSize:");
      }
      else
      {
        v32 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570] scale:*MEMORY[0x263F836C8]];
      }

      uint64_t v33 = [v20 imageWithConfiguration:v32];
      image = v13->_image;
      v13->_image = (UIImage *)v33;
    }
    uint64_t v35 = [(id)objc_opt_class() _titleForActivityIdentifier:v9];
    localizedTitle = v13->_localizedTitle;
    v13->_localizedTitle = (NSString *)v35;

    uint64_t v37 = [(NSString *)v13->_localizedTitle length];
    if (v11 && !v37)
    {
      uint64_t v38 = [v11 localizedTitle];
      v39 = v13->_localizedTitle;
      v13->_localizedTitle = (NSString *)v38;
    }
    [(DOCActivity *)v13 validate];
  }

  return v13;
}

- (void)validate
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 144);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21361D000, a2, OS_LOG_TYPE_DEBUG, "Unable to find image name for activity with identifier %@", (uint8_t *)&v3, 0xCu);
}

- (BOOL)_needsResolvedActivityItems
{
  return 0;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)performActivity
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self;
  uint64_t v4 = [(DOCActivity *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        id v17 = 0;
        long long v10 = [MEMORY[0x263F054E0] wrapperWithURL:v9 readonly:0 error:&v17];
        id v11 = v17;
        if (v10)
        {
          [v3 addObject:v10];
        }
        else
        {
          long long v12 = *MEMORY[0x263F3AC28];
          if (!*MEMORY[0x263F3AC28])
          {
            DOCInitLogging();
            long long v12 = *MEMORY[0x263F3AC28];
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v23 = v9;
            __int16 v24 = 2112;
            id v25 = v11;
            _os_log_error_impl(&dword_21361D000, v12, OS_LOG_TYPE_ERROR, "Unable to wrap url %@ with error %@", buf, 0x16u);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  long long v13 = [(DOCActivity *)v15 actionPerformerProxy];
  v14 = [(DOCActivity *)v15 activityType];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __30__DOCActivity_performActivity__block_invoke;
  v16[3] = &unk_2641B2590;
  v16[4] = v15;
  [v13 performAction:v14 withURLs:v3 completionHandler:v16];
}

uint64_t __30__DOCActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (DOCItemActivityPerformer)actionPerformerProxy
{
  return (DOCItemActivityPerformer *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_actionPerformerProxy, 0);
}

@end