@interface DMCRFMBRestoreDelegate
- (DMCRFMBRestoreDelegate)initWithDelegate:(id)a3 source:(id)a4;
- (DMCRFSnapshotSource)snapshotSource;
- (DMCRFSnapshotSourceDelegate)delegate;
- (void)managerDidFinishRestore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSnapshotSource:(id)a3;
@end

@implementation DMCRFMBRestoreDelegate

- (DMCRFMBRestoreDelegate)initWithDelegate:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DMCRFMBRestoreDelegate;
  v8 = [(DMCRFMBRestoreDelegate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_snapshotSource, v7);
  }

  return v9;
}

- (void)managerDidFinishRestore:(id)a3
{
  v4 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_DEFAULT, "managed restore, DMCRFMBRestoreDelegate calling linked delegate", v7, 2u);
  }
  v5 = [(DMCRFMBRestoreDelegate *)self delegate];
  id v6 = [(DMCRFMBRestoreDelegate *)self snapshotSource];
  [v5 snapshotSourceDidFinishRestore:v6];
}

- (DMCRFSnapshotSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCRFSnapshotSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMCRFSnapshotSource)snapshotSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotSource);
  return (DMCRFSnapshotSource *)WeakRetained;
}

- (void)setSnapshotSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end