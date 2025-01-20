@interface HUForwardingTriggerActionBuilderDelegate
- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4;
- (HUForwardingTriggerActionBuilderDelegate)initWithTriggerActionBuilderEditorDelegate:(id)a3;
- (HUTriggerActionBuilderEditorDelegate)triggerActionBuilderEditorDelegate;
- (void)setTriggerActionBuilderEditorDelegate:(id)a3;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
@end

@implementation HUForwardingTriggerActionBuilderDelegate

- (HUForwardingTriggerActionBuilderDelegate)initWithTriggerActionBuilderEditorDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUForwardingTriggerActionBuilderDelegate;
  v5 = [(HUForwardingTriggerActionBuilderDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUForwardingTriggerActionBuilderDelegate *)v5 setTriggerActionBuilderEditorDelegate:v4];
  }

  return v6;
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_super v8 = [v6 triggerActionSets];
  }
  else
  {
    objc_super v8 = 0;
  }
  v9 = [(HUForwardingTriggerActionBuilderDelegate *)self triggerActionBuilderEditorDelegate];

  if (v9)
  {
    v10 = [(HUForwardingTriggerActionBuilderDelegate *)self triggerActionBuilderEditorDelegate];
    [v10 actionBuilderEditor:v11 didFinishWithTriggerActionSetBuilder:v8];
  }
}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  return 1;
}

- (HUTriggerActionBuilderEditorDelegate)triggerActionBuilderEditorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_triggerActionBuilderEditorDelegate);

  return (HUTriggerActionBuilderEditorDelegate *)WeakRetained;
}

- (void)setTriggerActionBuilderEditorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end