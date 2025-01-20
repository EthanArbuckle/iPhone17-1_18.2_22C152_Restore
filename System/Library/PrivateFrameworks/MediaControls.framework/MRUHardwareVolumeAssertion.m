@interface MRUHardwareVolumeAssertion
- (MPVolumeControllerDataSource)volumeDataSource;
- (MRUHardwareVolumeAssertion)initWithHardwareVolumeController:(id)a3 volumeDataSource:(id)a4 reason:(id)a5;
- (MRUHardwareVolumeController)hardwareVolumeController;
- (NSString)description;
- (NSString)reason;
- (void)dealloc;
- (void)invalidate;
- (void)setHardwareVolumeController:(id)a3;
- (void)setReason:(id)a3;
- (void)setVolumeDataSource:(id)a3;
@end

@implementation MRUHardwareVolumeAssertion

- (MRUHardwareVolumeAssertion)initWithHardwareVolumeController:(id)a3 volumeDataSource:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRUHardwareVolumeAssertion;
  v11 = [(MRUHardwareVolumeAssertion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_hardwareVolumeController, v8);
    objc_storeWeak((id *)&v12->_volumeDataSource, v9);
    objc_storeStrong((id *)&v12->_reason, a5);
  }

  return v12;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeDataSource);
  v6 = [v3 stringWithFormat:@"%@ dataSource: %@ | reason: %@>", v4, WeakRetained, self->_reason];

  return (NSString *)v6;
}

- (void)dealloc
{
  [(MRUHardwareVolumeAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRUHardwareVolumeAssertion;
  [(MRUHardwareVolumeAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareVolumeController);
  [WeakRetained unregisterAssertion:self];
}

- (MRUHardwareVolumeController)hardwareVolumeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareVolumeController);

  return (MRUHardwareVolumeController *)WeakRetained;
}

- (void)setHardwareVolumeController:(id)a3
{
}

- (MPVolumeControllerDataSource)volumeDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeDataSource);

  return (MPVolumeControllerDataSource *)WeakRetained;
}

- (void)setVolumeDataSource:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_volumeDataSource);

  objc_destroyWeak((id *)&self->_hardwareVolumeController);
}

@end