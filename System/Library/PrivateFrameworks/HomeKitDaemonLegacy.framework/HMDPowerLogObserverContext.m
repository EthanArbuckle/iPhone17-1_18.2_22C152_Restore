@interface HMDPowerLogObserverContext
- (HMDPowerLogObserverContext)initWithLogEventDispatcher:(id)a3 powerLogger:(id)a4;
- (HMFPowerLogger)powerLogger;
- (HMMIntervalMapper)cameraConfigurationEventHistogram;
- (HMMIntervalMapper)homeConfigurationEventHistogram;
- (HMMLogEventDispatching)logEventDispatcher;
@end

@implementation HMDPowerLogObserverContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_powerLogger);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
  objc_storeStrong((id *)&self->_cameraConfigurationEventHistogram, 0);
  objc_storeStrong((id *)&self->_homeConfigurationEventHistogram, 0);
}

- (HMFPowerLogger)powerLogger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_powerLogger);
  return (HMFPowerLogger *)WeakRetained;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventDispatcher);
  return (HMMLogEventDispatching *)WeakRetained;
}

- (HMMIntervalMapper)cameraConfigurationEventHistogram
{
  return self->_cameraConfigurationEventHistogram;
}

- (HMMIntervalMapper)homeConfigurationEventHistogram
{
  return self->_homeConfigurationEventHistogram;
}

- (HMDPowerLogObserverContext)initWithLogEventDispatcher:(id)a3 powerLogger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDPowerLogObserverContext;
  v8 = [(HMDPowerLogObserverContext *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_logEventDispatcher, v6);
    objc_storeWeak((id *)&v9->_powerLogger, v7);
    v10 = (void *)MEMORY[0x1E4F6A270];
    v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC7918, &unk_1F2DC7930, &unk_1F2DC7948, &unk_1F2DC7960, &unk_1F2DC7978, &unk_1F2DC7990, &unk_1F2DC79A8, 0);
    uint64_t v12 = [v10 unsignedClosedOpenFixedIntervalMapper:v11];
    homeConfigurationEventHistogram = v9->_homeConfigurationEventHistogram;
    v9->_homeConfigurationEventHistogram = (HMMIntervalMapper *)v12;

    v14 = (void *)MEMORY[0x1E4F6A270];
    v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC7918, &unk_1F2DC7930, 0);
    uint64_t v16 = [v14 unsignedClosedOpenFixedIntervalMapper:v15];
    cameraConfigurationEventHistogram = v9->_cameraConfigurationEventHistogram;
    v9->_cameraConfigurationEventHistogram = (HMMIntervalMapper *)v16;
  }
  return v9;
}

@end