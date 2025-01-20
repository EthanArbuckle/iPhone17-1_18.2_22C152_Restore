@interface VOTUIMapsExplorationViewController
- (void)highlightExplorationSegmentWithIndex:(int64_t)a3;
- (void)loadView;
- (void)updateUIWithCenter:(CGPoint)a3;
- (void)updateUIWithCenter:(CGPoint)a3 andExplorationSegments:(id)a4;
- (void)updateUIWithCurrentLocation:(CGPoint)a3;
@end

@implementation VOTUIMapsExplorationViewController

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(VOTUIMapsExplorationViewController *)self setView:v3];
}

- (void)updateUIWithCenter:(CGPoint)a3 andExplorationSegments:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(VOTUIMapsExplorationViewController *)self view];
  objc_msgSend(v8, "updateUIWithCenter:andExplorationSegments:", v7, x, y);
}

- (void)updateUIWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VOTUIMapsExplorationViewController *)self view];
  objc_msgSend(v5, "updateUIWithCenter:", x, y);
}

- (void)updateUIWithCurrentLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VOTUIMapsExplorationViewController *)self view];
  objc_msgSend(v5, "updateUIWithCurrentLocation:", x, y);
}

- (void)highlightExplorationSegmentWithIndex:(int64_t)a3
{
  id v4 = [(VOTUIMapsExplorationViewController *)self view];
  [v4 highlightExplorationSegmentWithIndex:a3];
}

@end