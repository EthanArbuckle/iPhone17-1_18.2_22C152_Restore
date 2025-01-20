@interface GKPlaceholderView
+ (GKPlaceholderView)placeholderViewWithTitle:(id)a3 message:(id)a4 frame:(CGRect)a5;
+ (void)initialize;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation GKPlaceholderView

+ (void)initialize
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F639B0] sharedPalette];
  v3 = objc_opt_class();
  v8[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [v3 appearanceWhenContainedInInstancesOfClasses:v4];

  [v5 setBackgroundColor:0];
  v6 = [(id)objc_opt_class() appearance];
  v7 = [v2 viewBackgroundColor];
  [v6 setBackgroundColor:v7];
}

+ (GKPlaceholderView)placeholderViewWithTitle:(id)a3 message:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  id v11 = a3;
  v12 = -[_UIContentUnavailableView initWithFrame:title:style:]([GKPlaceholderView alloc], "initWithFrame:title:style:", v11, 0, x, y, width, height);

  [(_UIContentUnavailableView *)v12 setMessage:v10];

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(GKPlaceholderView *)self subviews];
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
        if ([v13 isUserInteractionEnabled])
        {
          -[GKPlaceholderView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          if (objc_msgSend(v13, "pointInside:withEvent:", v7))
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
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
LABEL_12:

  return v14;
}

@end