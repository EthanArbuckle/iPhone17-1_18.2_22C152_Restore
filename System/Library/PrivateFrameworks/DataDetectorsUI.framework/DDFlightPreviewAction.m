@interface DDFlightPreviewAction
+ (id)viewControllerProviderClass;
- (BOOL)wantsCustomViewControllerCommit;
- (CGSize)suggestedContentSize;
- (id)expandViewController;
- (id)menuActionClasses;
- (id)previewActions;
- (void)setPreviewMode:(BOOL)a3;
@end

@implementation DDFlightPreviewAction

+ (id)viewControllerProviderClass
{
  return @"DDRemoteFlightViewControllerProvider";
}

- (id)previewActions
{
  return 0;
}

- (BOOL)wantsCustomViewControllerCommit
{
  return 1;
}

- (id)expandViewController
{
  v3 = [DDFlightAction alloc];
  v4 = [(DDAction *)self url];
  v5 = [(DDAction *)self result];
  v6 = [(DDAction *)self context];
  v7 = [(DDAction *)v3 initWithURL:v4 result:v5 context:v6];
  v8 = [(DDFlightAction *)v7 viewController];

  return v8;
}

- (id)menuActionClasses
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(DDFlightPreviewAction *)self previewActions];
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v3 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = v3;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (CGSize)suggestedContentSize
{
  double v2 = 325.0;
  double v3 = 325.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewMode:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DDFlightPreviewAction;
  -[DDRemoteAction setPreviewMode:](&v8, sel_setPreviewMode_);
  if (!self->_previewModeSet && !a3)
  {
    self->_previewModeSet = 1;
    id v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    uint64_t v6 = *MEMORY[0x1E4F1C3A0];
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v5 runMode:v6 beforeDate:v7];

    usleep(0x7530u);
  }
}

@end