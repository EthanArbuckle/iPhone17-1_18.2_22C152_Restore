@interface MedicalIDChangeObserver
- (MedicalIDChangeObserver)init;
- (MedicalIDChangeObserverDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startObservingChanges;
@end

@implementation MedicalIDChangeObserver

- (void)startObservingChanges
{
  objc_initWeak(&location, self);
  v3 = (const char *)*MEMORY[0x1E4F2BED0];
  v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MedicalIDChangeObserver_startObservingChanges__block_invoke;
  v6[3] = &unk_1E6456858;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_medicalIDChangedToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setDelegate:(id)a3
{
}

- (MedicalIDChangeObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MedicalIDChangeObserver;
  result = [(MedicalIDChangeObserver *)&v3 init];
  if (result) {
    result->_medicalIDChangedToken = -1;
  }
  return result;
}

void __48__MedicalIDChangeObserver_startObservingChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 medicalIDDidChange];

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  int medicalIDChangedToken = self->_medicalIDChangedToken;
  if (medicalIDChangedToken != -1) {
    notify_cancel(medicalIDChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)MedicalIDChangeObserver;
  [(MedicalIDChangeObserver *)&v4 dealloc];
}

- (MedicalIDChangeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MedicalIDChangeObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end