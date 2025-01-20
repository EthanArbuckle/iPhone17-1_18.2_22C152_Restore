@interface _TriggerEditorDelegateWrapper
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4;
- (HUTriggerEditorDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
@end

@implementation _TriggerEditorDelegateWrapper

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TriggerEditorDelegateWrapper *)self delegate];
  [v8 triggerEditor:v7 didFinishWithTriggerBuilder:v6];
}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_TriggerEditorDelegateWrapper *)self delegate];
  char v9 = [v8 triggerEditor:v7 shouldCommitTriggerBuilder:v6];

  return v9;
}

- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_TriggerEditorDelegateWrapper *)self delegate];
  [v11 triggerEditor:v10 didCommitTriggerBuilder:v9 withError:v8];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(_TriggerEditorDelegateWrapper *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (HUTriggerEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end