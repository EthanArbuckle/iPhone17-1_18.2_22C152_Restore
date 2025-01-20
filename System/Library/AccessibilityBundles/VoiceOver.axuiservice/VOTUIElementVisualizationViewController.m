@interface VOTUIElementVisualizationViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)frames;
- (NSArray)labels;
- (NSArray)uiClasses;
- (void)_updateFramesForView;
- (void)didReceiveMemoryWarning;
- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
- (void)setFrames:(id)a3;
- (void)setFramesHidden:(BOOL)a3;
- (void)setLabels:(id)a3;
- (void)setUiClasses:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUIElementVisualizationViewController

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)VOTUIElementVisualizationViewController;
  [(VOTUIElementVisualizationViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  v8 = (NSArray *)a3;
  v9 = (NSArray *)a4;
  v10 = (NSArray *)a5;
  frames = self->_frames;
  self->_frames = v8;
  v12 = v8;

  labels = self->_labels;
  self->_labels = v9;
  v14 = v9;

  uiClasses = self->_uiClasses;
  self->_uiClasses = v10;

  [(VOTUIElementVisualizationViewController *)self _updateFramesForView];
}

- (void)_updateFramesForView
{
  v3 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v4 = self->_frames;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        CGRect v39 = CGRectFromString((NSString *)*(void *)(*((void *)&v34 + 1) + 8 * (void)v8));
        double x = v39.origin.x;
        double y = v39.origin.y;
        double width = v39.size.width;
        double height = v39.size.height;
        v13 = [(VOTUIElementVisualizationViewController *)self view];
        v14 = [v13 window];
        objc_msgSend(v14, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        v23 = [(VOTUIElementVisualizationViewController *)self view];
        objc_msgSend(v23, "convertRect:fromView:", 0, v16, v18, v20, v22);
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;

        v40.origin.double x = v25;
        v40.origin.double y = v27;
        v40.size.double width = v29;
        v40.size.double height = v31;
        v32 = NSStringFromCGRect(v40);
        [v3 addObject:v32];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v6);
  }

  v33 = [(VOTUIElementVisualizationViewController *)self view];
  [v33 setElementFrames:v3 labels:self->_labels uiClasses:self->_uiClasses];
}

- (void)viewDidLoad
{
  v3 = -[VOTUIElementVisualizationView initWithFrame:]([VOTUIElementVisualizationView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(VOTUIElementVisualizationViewController *)self setView:v3];

  v4.receiver = self;
  v4.super_class = (Class)VOTUIElementVisualizationViewController;
  [(VOTUIElementVisualizationViewController *)&v4 viewDidLoad];
}

- (void)setFramesHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VOTUIElementVisualizationViewController *)self view];
  [v4 setHidden:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (NSArray)uiClasses
{
  return self->_uiClasses;
}

- (void)setUiClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiClasses, 0);
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_frames, 0);
}

@end