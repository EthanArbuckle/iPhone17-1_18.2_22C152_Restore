@interface _LSOpenResourceOperationDelegateWrapper
- (_LSOpenResourceOperationDelegateWrapper)initWithOperation:(id)a3 wrappedDelegate:(id)a4;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
@end

@implementation _LSOpenResourceOperationDelegateWrapper

- (_LSOpenResourceOperationDelegateWrapper)initWithOperation:(id)a3 wrappedDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_LSOpenResourceOperationDelegateWrapper;
  v8 = [(_LSOpenResourceOperationDelegateWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_operation, v6);
    objc_storeStrong((id *)&v9->_delegate, a4);
  }

  return v9;
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    [(LSOpenResourceOperationDelegate *)self->_delegate openResourceOperation:WeakRetained didFinishCopyingResource:v6];
  }
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4 = a3;
  if (self->_delegate)
  {
    id v7 = v4;
    char v5 = objc_opt_respondsToSelector();
    id v4 = v7;
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
      [(LSOpenResourceOperationDelegate *)self->_delegate openResourceOperationDidComplete:WeakRetained];

      id v4 = v7;
    }
  }
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LSOpenResourceOperationDelegateWrapper openResourceOperation:didFailWithError:]();
    }

    [(LSOpenResourceOperationDelegate *)self->_delegate openResourceOperation:WeakRetained didFailWithError:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_destroyWeak((id *)&self->_operation);
}

- (void)openResourceOperation:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "LaunchServices: open operation %{public}@ failed with error: %{public}@");
}

@end