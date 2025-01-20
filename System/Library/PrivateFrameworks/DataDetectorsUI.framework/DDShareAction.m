@interface DDShareAction
- (DDShareAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)iconName;
- (id)localizedName;
- (id)viewController;
- (int)interactionType;
- (void)performFromView:(id)a3;
- (void)prepareViewControllerForActionController:(id)a3;
- (void)viewController;
@end

@implementation DDShareAction

- (DDShareAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)DDShareAction;
  v5 = [(DDAction *)&v10 initWithURL:a3 result:a4 context:a5];
  v6 = v5;
  if (v5 && !v5->super._contact && !v5->super._ics && !v5->super._url)
  {
    v9 = v5->super._result;
    if (!v9)
    {
      v7 = 0;
      goto LABEL_6;
    }
    DDMapURLForResult(v9);
    v7 = (DDShareAction *)objc_claimAutoreleasedReturnValue();

    if (!v7) {
      goto LABEL_6;
    }
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (id)localizedName
{
  return DDLocalizedString(@"Share…");
}

- (id)iconName
{
  return @"square.and.arrow.up";
}

- (int)interactionType
{
  return 1;
}

- (id)viewController
{
  v54[1] = *MEMORY[0x1E4F143B8];
  viewController = self->super._viewController;
  if (!viewController)
  {
    if (self->super._contact)
    {
      v4 = (void *)MEMORY[0x1E4F1CB10];
      v5 = NSTemporaryDirectory();
      v6 = [v4 fileURLWithPath:v5 relativeToURL:0];

      v7 = [MEMORY[0x1E4F1B910] stringFromContact:self->super._contact style:0];
      v8 = [NSString stringWithFormat:@"%@.vcf", v7];
      v9 = [v6 URLByAppendingPathComponent:v8];

      objc_super v10 = (void *)MEMORY[0x1E4F1B998];
      v54[0] = self->super._contact;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      id v49 = 0;
      v12 = [v10 dataWithContacts:v11 error:&v49];
      id v13 = v49;

      if (v13
        || (v48 = 0, [v12 writeToURL:v9 options:1 error:&v48], (id v13 = v48) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          [(DDShareAction *)(uint64_t)v13 viewController];
        }

        v21 = 0;
      }
      else
      {
        v53 = v9;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      }
    }
    else if (self->super._ics)
    {
      v22 = (void *)MEMORY[0x1E4F1CB10];
      v23 = NSTemporaryDirectory();
      v24 = [v22 fileURLWithPath:v23 relativeToURL:0];

      v25 = [(NSDictionary *)self->super._context objectForKeyedSubscript:0x1EF5023F8];
      v26 = _eventTitleFromCache(v25);

      if ([v26 length])
      {
        id v27 = v26;
      }
      else
      {
        DDLocalizedString(@"New Event");
        id v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v27;
      v29 = [NSString stringWithFormat:@"%@.ics", v27];
      v30 = [v24 URLByAppendingPathComponent:v29];

      ics = self->super._ics;
      id v47 = 0;
      [(NSString *)ics writeToURL:v30 atomically:1 encoding:4 error:&v47];
      id v32 = v47;
      if (v32)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          [(DDShareAction *)(uint64_t)v32 viewController];
        }
        v21 = 0;
      }
      else
      {
        v52 = v30;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      }
    }
    else
    {
      if (self->super._url)
      {
        url = self->super._url;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&url count:1];
        if (!v21) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      v43 = self->super._result;
      if (!v43) {
        goto LABEL_24;
      }
      v44 = DDMapURLForResult(v43);
      if (!v44)
      {
        uint64_t v45 = DDResultCopyExtractedURL();
        if (!v45) {
          goto LABEL_24;
        }
        v46 = (void *)v45;
        v44 = [MEMORY[0x1E4F1CB10] URLWithString:v45];

        if (!v44) {
          goto LABEL_24;
        }
      }
      v50 = v44;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    }
    if (!v21)
    {
LABEL_24:
      viewController = self->super._viewController;
      goto LABEL_25;
    }
LABEL_23:
    v40 = (UIViewController *)[objc_alloc(MEMORY[0x1E4F42718]) initWithActivityItems:v21 applicationActivities:0];
    v41 = self->super._viewController;
    self->super._viewController = v40;

    goto LABEL_24;
  }
LABEL_25:
  return viewController;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DDShareAction;
  id v4 = a3;
  [(DDAction *)&v5 prepareViewControllerForActionController:v4];
  objc_msgSend(v4, "action:presentationShouldBeModal:", self, 0, v5.receiver, v5.super_class);
}

- (void)performFromView:(id)a3
{
  id v9 = a3;
  id v4 = [(DDShareAction *)self viewController];
  objc_super v5 = v4;
  if (v4)
  {
    v6 = [v4 popoverPresentationController];
    [(DDAction *)self setupPopoverPresentationController:v6 view:v9];
    v7 = [v9 window];
    v8 = [v7 rootViewController];
    [v8 presentViewController:v5 animated:1 completion:0];
  }
}

- (void)viewController
{
}

@end