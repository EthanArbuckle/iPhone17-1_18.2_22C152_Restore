@interface WFApertureIconAccessoryView
- (BOOL)awaitingIconOwnershipSwap;
- (BOOL)isRunningFromActionButton;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (WFApertureIconAccessoryView)initWithIcon:(id)a3 runningContext:(id)a4;
- (WFWorkflowRunningContext)runningContext;
- (void)layoutSubviews;
- (void)openShortcutInEditor;
- (void)setAwaitingIconOwnershipSwap:(BOOL)a3;
- (void)setIcon:(id)a3 animated:(BOOL)a4;
- (void)setRunningContext:(id)a3;
@end

@implementation WFApertureIconAccessoryView

- (void).cxx_destruct
{
}

- (void)setAwaitingIconOwnershipSwap:(BOOL)a3
{
  self->_awaitingIconOwnershipSwap = a3;
}

- (BOOL)awaitingIconOwnershipSwap
{
  return self->_awaitingIconOwnershipSwap;
}

- (void)setRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (BOOL)isRunningFromActionButton
{
  v2 = [(WFApertureIconAccessoryView *)self runningContext];
  v3 = [v2 runSource];
  unsigned __int8 v4 = [v3 isEqualToString:WFWorkflowRunSourceActionButton];

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v8 = [(WFApertureIconAccessoryView *)self awaitingIconOwnershipSwap];
  if (a4 == 4 || !v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)WFApertureIconAccessoryView;
    -[WFApertureIconAccessoryView sizeThatFits:](&v11, "sizeThatFits:", width, height);
  }
  else
  {
    double v9 = CGSizeZero.width;
    double v10 = CGSizeZero.height;
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)openShortcutInEditor
{
  v3 = [(WFApertureIconAccessoryView *)self runningContext];
  unsigned __int8 v4 = [v3 workflowIdentifier];

  if (v4)
  {
    v5 = [(WFApertureIconAccessoryView *)self runningContext];
    v6 = [v5 workflowIdentifier];
    v7 = +[NSString stringWithFormat:@"shortcuts://open-shortcut?id=%@", v6];
    id v9 = +[NSURL URLWithString:v7];

    unsigned int v8 = +[WFApplicationContext sharedContext];
    [v8 openURL:v9];
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)WFApertureIconAccessoryView;
  [(WFApertureIconAccessoryView *)&v9 layoutSubviews];
  [(WFApertureIconAccessoryView *)self bounds];
  if (v3 <= 24.0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = 1;
    uint64_t v5 = 1;
  }
  [(WFApertureIconAccessoryView *)self setMode:v4 animated:v5];
  if ([(WFApertureIconAccessoryView *)self awaitingIconOwnershipSwap])
  {
    dispatch_time_t v6 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000489C;
    block[3] = &unk_100038C80;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v7 = [(WFApertureIconAccessoryView *)self systemApertureElementContext];
    [v7 setElementNeedsUpdate];
  }
}

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(WFApertureIconAccessoryView *)self icon];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)WFApertureIconAccessoryView;
    [(WFApertureIconAccessoryView *)&v11 setIcon:v6 animated:v4];
    dispatch_time_t v9 = dispatch_time(0, 150000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000049F4;
    block[3] = &unk_100038C80;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (WFApertureIconAccessoryView)initWithIcon:(id)a3 runningContext:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFApertureIconAccessoryView;
  unsigned __int8 v8 = [(WFApertureIconAccessoryView *)&v13 initWithIcon:a3];
  dispatch_time_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_runningContext, a4);
    v9->_awaitingIconOwnershipSwap = [(WFApertureIconAccessoryView *)v9 isRunningFromActionButton];
    id v10 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"openShortcutInEditor"];
    [(WFApertureIconAccessoryView *)v9 addGestureRecognizer:v10];

    objc_super v11 = v9;
  }

  return v9;
}

@end