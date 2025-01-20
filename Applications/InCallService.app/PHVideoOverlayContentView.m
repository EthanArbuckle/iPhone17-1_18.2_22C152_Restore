@interface PHVideoOverlayContentView
- (double)textFontSize;
- (double)titleFontSize;
- (void)resetView;
@end

@implementation PHVideoOverlayContentView

- (void)resetView
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PHVideoOverlayContentView *)self subviews];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) removeFromSuperview];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (double)textFontSize
{
  if (qword_100326188 != -1) {
    dispatch_once(&qword_100326188, &stru_1002CF540);
  }
  return *(double *)&qword_100326180;
}

- (double)titleFontSize
{
  if (qword_100326198 != -1) {
    dispatch_once(&qword_100326198, &stru_1002CF560);
  }
  return *(double *)&qword_100326190;
}

@end