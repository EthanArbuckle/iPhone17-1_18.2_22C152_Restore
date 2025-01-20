@interface UIView(ContentView)
- (id)_bottomVisibleView;
@end

@implementation UIView(ContentView)

- (id)_bottomVisibleView
{
  v2 = [a1 subviews];
  uint64_t v3 = [v2 count];

  int64_t v4 = 0;
  if (v3)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [a1 subviews];
      v7 = [v6 objectAtIndexedSubscript:v5];

      int v8 = [v7 isHidden];
      if (v4 <= (uint64_t)v5) {
        unint64_t v9 = v5;
      }
      else {
        unint64_t v9 = v4;
      }
      if (!v8) {
        int64_t v4 = v9;
      }

      ++v5;
      v10 = [a1 subviews];
      unint64_t v11 = [v10 count];
    }
    while (v5 < v11);
  }
  v12 = [a1 subviews];
  v13 = [v12 objectAtIndexedSubscript:v4];

  return v13;
}

@end