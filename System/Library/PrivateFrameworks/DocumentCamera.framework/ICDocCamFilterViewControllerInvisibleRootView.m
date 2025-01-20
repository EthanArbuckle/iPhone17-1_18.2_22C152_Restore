@interface ICDocCamFilterViewControllerInvisibleRootView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)accessibilityContainerType;
@end

@implementation ICDocCamFilterViewControllerInvisibleRootView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(ICDocCamFilterViewControllerInvisibleRootView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        -[ICDocCamFilterViewControllerInvisibleRootView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamFilterViewControllerInvisibleRootView;
  -[ICDocCamFilterViewControllerInvisibleRootView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (ICDocCamFilterViewControllerInvisibleRootView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  return +[DCLocalization localizedStringForKey:@"Filter picker" value:@"Filter picker" table:@"Localizable"];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end