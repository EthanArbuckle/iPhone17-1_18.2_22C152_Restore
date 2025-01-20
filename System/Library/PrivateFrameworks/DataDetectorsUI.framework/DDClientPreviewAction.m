@interface DDClientPreviewAction
+ (BOOL)clientCanPerformActionWithUrl:(id)a3;
+ (id)clientActionsDelegate;
+ (void)setClientActionsDelegate:(id)a3;
- (id)iconName;
- (id)localizedName;
- (id)menuActions;
- (id)viewController;
- (void)localizedName;
- (void)performFromView:(id)a3;
@end

@implementation DDClientPreviewAction

+ (void)setClientActionsDelegate:(id)a3
{
  id obj = a1;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak(&_clientActionsDelegate_0, v4);

  objc_sync_exit(obj);
}

+ (id)clientActionsDelegate
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&_clientActionsDelegate_0);
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (BOOL)clientCanPerformActionWithUrl:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"x-apple-data-detectors-clientdefined"];

  if (!v5)
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  v6 = +[DDAction clientActionsDelegate];
  if (!v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v6 canHandleClientActionFromUrl:v3] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[DDClientPreviewAction clientCanPerformActionWithUrl:](v3);
    }

    goto LABEL_9;
  }

  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (id)localizedName
{
  p_url = &self->super.super._url;
  if (self->super.super._url)
  {
    id v4 = +[DDAction clientActionsDelegate];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      int v5 = [v4 localizedTitleForClientActionFromUrl:*p_url context:self->super.super._context];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }
  if (![v5 length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDClientPreviewAction localizedName]((id *)p_url);
    }
    uint64_t v6 = DDLocalizedString(@"Action");

    int v5 = (void *)v6;
  }
  return v5;
}

- (id)iconName
{
  if (self->super.super._url)
  {
    id v3 = +[DDAction clientActionsDelegate];
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v4 = [v3 glyphForClientActionFromUrl:self->super.super._url];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)performFromView:(id)a3
{
  id v4 = a3;
  if (self->super.super._url)
  {
    int v5 = +[DDAction clientActionsDelegate];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v5 handleClientActionFromUrl:self->super.super._url context:self->super.super._context];

      goto LABEL_8;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[DDClientPreviewAction performFromView:]((id *)&self->super.super._url);
  }
LABEL_8:
}

- (id)viewController
{
  if (self->super.super._url)
  {
    id v3 = +[DDAction clientActionsDelegate];
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v4 = [v3 previewForClientActionFromUrl:self->super.super._url];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)menuActions
{
  return +[DDActionGroup groupWithAction:]((uint64_t)DDActionGroup, self);
}

+ (void)clientCanPerformActionWithUrl:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "The custom action delegate answered that it could not handle url %p (%@)", v3, v4, v5, v6, v7);
}

- (void)localizedName
{
  v1 = [*a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "The custom action delegate did not return a title for url %p (%@)", v3, v4, v5, v6, v7);
}

- (void)performFromView:(id *)a1 .cold.1(id *a1)
{
  v1 = [*a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "The custom action delegate did not handle url %p (%@)", v3, v4, v5, v6, v7);
}

@end