@interface DDPreviewAction
+ (id)previewActionForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (BOOL)menuHasHeaderView;
- (BOOL)prefersActionMenuStyle;
- (BOOL)requiresEmbeddingNavigationController;
- (BOOL)showMenuTitle;
- (BOOL)wantsSeamlessCommit;
- (CGSize)suggestedContentSize;
- (id)commitURL;
- (id)createViewController;
- (id)expandViewController;
- (id)menuActionClasses;
- (id)menuActions;
- (id)menuHeaderView;
- (id)platterSubtitle;
- (id)platterTitle;
- (id)previewViewController;
- (id)viewController;
- (void)dealloc;
@end

@implementation DDPreviewAction

- (void)dealloc
{
  viewController = self->super._viewController;
  self->super._viewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)DDPreviewAction;
  [(DDAction *)&v4 dealloc];
}

+ (id)previewActionForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  uint64_t v7 = (uint64_t)a3;
  id v8 = a5;
  v9 = v8;
  if (v7 | (unint64_t)a4)
  {
    if (a4)
    {
      int Category = DDResultGetCategory();
      switch(Category)
      {
        case 0:
        case 5:
          CFStringRef Type = (const __CFString *)DDResultGetType();
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F0E8])
            || CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F038]))
          {
            v19 = DDURLPreviewAction;
            goto LABEL_49;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F000]))
          {
            v19 = DDFlightPreviewAction;
            goto LABEL_49;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F080]))
          {
            v19 = DDParsecPreviewAction;
            goto LABEL_49;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5EF80])
            || CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F070]))
          {
            goto LABEL_46;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            +[DDPreviewAction previewActionForURL:result:context:]((uint64_t)Type, v7);
          }
          break;
        case 1:
          if (+[DDNewsPreviewAction handlesUrl:v7 result:a4])
          {
            goto LABEL_29;
          }
          if (+[DDURLPreviewAction handlesUrl:v7 result:a4]) {
            goto LABEL_31;
          }
          if (+[DDChatBotAction handlesUrl:v7 result:a4]) {
            goto LABEL_43;
          }
          if (+[DDPersonAction handlesUrl:v7 result:a4]) {
            goto LABEL_45;
          }
          break;
        case 2:
          v19 = DDPersonAction;
          goto LABEL_49;
        case 3:
          v19 = DDMapAction;
          goto LABEL_49;
        case 4:
          v19 = DDTimeLineAction;
          goto LABEL_49;
        default:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            +[DDPreviewAction previewActionForURL:result:context:]((uint64_t)a4, v7, Category);
          }
          break;
      }
    }
    if (+[DDNewsPreviewAction handlesUrl:v7 result:a4])
    {
LABEL_29:
      v19 = DDNewsPreviewAction;
    }
    else if (+[DDURLPreviewAction handlesUrl:v7 result:a4])
    {
LABEL_31:
      v19 = DDURLPreviewAction;
    }
    else if (+[DDMapAction handlesUrl:v7 result:a4])
    {
      v19 = DDMapAction;
    }
    else if (+[DDChatBotAction handlesUrl:v7 result:a4])
    {
LABEL_43:
      v19 = DDChatBotAction;
    }
    else
    {
      if (!+[DDPersonAction handlesUrl:v7 result:a4])
      {
LABEL_46:
        v15 = 0;
        goto LABEL_50;
      }
LABEL_45:
      v19 = DDPersonAction;
    }
LABEL_49:
    v15 = (DDTimeLineAction *)[[v19 alloc] initWithURL:v7 result:a4 context:v9];
  }
  else
  {
    v10 = [v8 objectForKeyedSubscript:@"Contact"];
    v11 = v10;
    if (v10)
    {
      if (DDContactHasNameInfo(v10)
        || !+[DDMapAction actionAvailableForContact:v11])
      {
        v12 = DDPersonAction;
      }
      else
      {
        v12 = DDMapAction;
      }
      v15 = (DDTimeLineAction *)[[v12 alloc] initWithURL:0 result:0 context:v9];
    }
    else
    {
      v16 = [v9 objectForKeyedSubscript:@"ICS"];
      if ([v16 length]
        && (([v9 objectForKeyedSubscript:0x1EF5023F8],
             (v17 = objc_claimAutoreleasedReturnValue()) != 0)
         || (+[DDAddEventAction cachedEventForICSString:v16], (v17 = objc_claimAutoreleasedReturnValue()) != 0)))
      {
        uint64_t v18 = +[DDAction contextByAddingValue:v17 toKey:0x1EF5023F8 inContext:v9];

        v15 = [(DDAction *)[DDTimeLineAction alloc] initWithURL:0 result:0 context:v18];
        v9 = (void *)v18;
      }
      else
      {
        v15 = 0;
      }
    }
  }
LABEL_50:

  return v15;
}

- (id)createViewController
{
  return 0;
}

- (id)viewController
{
  viewController = self->super._viewController;
  if (!viewController)
  {
    objc_super v4 = [(DDPreviewAction *)self createViewController];
    v5 = self->super._viewController;
    self->super._viewController = v4;

    viewController = self->super._viewController;
  }
  return viewController;
}

- (id)previewViewController
{
  int isDeviceLocked = dd_isDeviceLocked();
  objc_super v4 = [(DDPreviewAction *)self viewController];
  v5 = v4;
  if (isDeviceLocked)
  {
    if ([v4 _canShowWhileLocked]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v5 = v6;
  }
  return v5;
}

- (id)commitURL
{
  return 0;
}

- (BOOL)wantsSeamlessCommit
{
  return 0;
}

- (id)expandViewController
{
  [(DDPreviewAction *)self setPreviewMode:0];
  return [(DDPreviewAction *)self viewController];
}

- (BOOL)prefersActionMenuStyle
{
  return 0;
}

- (BOOL)requiresEmbeddingNavigationController
{
  return 0;
}

- (id)platterTitle
{
  return 0;
}

- (id)platterSubtitle
{
  return 0;
}

- (BOOL)showMenuTitle
{
  return 1;
}

- (id)menuActions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(DDPreviewAction *)self menuActionClasses];
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  id v3 = 0;
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v4;
        v5 = *(void **)(*((void *)&v23 + 1) + 8 * v4);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(objc_class **)(*((void *)&v19 + 1) + 8 * i);
              if ([(objc_class *)v11 isAvailable])
              {
                v12 = (void *)[[v11 alloc] initWithURL:self->super._url result:self->super._result context:self->super._context];
                if (v12)
                {
                  if (!v3) {
                    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  [v3 addObject:v12];
                }
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }

  v13 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v3);

  return v13;
}

- (id)menuActionClasses
{
  return 0;
}

- (CGSize)suggestedContentSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)menuHasHeaderView
{
  return 0;
}

- (id)menuHeaderView
{
  return 0;
}

+ (void)previewActionForURL:(uint64_t)a1 result:(uint64_t)a2 context:(int)a3 .cold.1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109634;
  v3[1] = a3;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown DDResult category %d for result %@; could not find any actions for URL %@",
    (uint8_t *)v3,
    0x1Cu);
}

+ (void)previewActionForURL:(uint64_t)a1 result:(uint64_t)a2 context:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown result type %@ in the Misc category; no actions found (URL %@)",
    (uint8_t *)&v2,
    0x16u);
}

@end