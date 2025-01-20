@interface MPCRecordingSession
- (ICEnvironmentMonitor)thermalMonitor;
- (MPCFirstFailureDetector)firstFailureDetector;
- (MPCRecordingSession)initWithModelID:(id)a3 samplingTime:(double)a4 renderingLimit:(double)a5 shouldRecordSamples:(BOOL)a6;
- (MPCSamplesRecorder)currentRecorder;
- (MPCStatisticsReporter)statisticsReporter;
- (NSString)modelID;
- (NSString)sessionID;
- (void)dealloc;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
- (void)flush;
- (void)recordSample:(id)a3;
- (void)samplesRecorderHasNewSamples:(id)a3;
- (void)save;
@end

@implementation MPCRecordingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRecorder, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_statisticsReporter, 0);
  objc_storeStrong((id *)&self->_firstFailureDetector, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (MPCSamplesRecorder)currentRecorder
{
  return self->_currentRecorder;
}

- (ICEnvironmentMonitor)thermalMonitor
{
  return self->_thermalMonitor;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (MPCStatisticsReporter)statisticsReporter
{
  return self->_statisticsReporter;
}

- (MPCFirstFailureDetector)firstFailureDetector
{
  return self->_firstFailureDetector;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int currentThermalLevel = self->_currentThermalLevel;
    int v7 = 138543874;
    v8 = self;
    __int16 v9 = 1024;
    int v10 = currentThermalLevel;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 currentThermalPressureLevel];
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure level changed: %d -> %ld", (uint8_t *)&v7, 0x1Cu);
  }

  self->_int currentThermalLevel = [v4 currentThermalPressureLevel];
}

- (void)samplesRecorderHasNewSamples:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCRecordingSession *)self statisticsReporter];
  [v5 reportRecordedResults:v4];
}

- (void)flush
{
  [(MPCRecordingSession *)self save];
  id v3 = [(MPCRecordingSession *)self statisticsReporter];
  [v3 flush];
}

- (void)save
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(MPCSamplesRecorder *)self->_currentRecorder numberOfSamples] >= 1)
  {
    id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      currentRecorder = self->_currentRecorder;
      int v6 = 138543618;
      int v7 = self;
      __int16 v8 = 2114;
      __int16 v9 = currentRecorder;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Current session statistics: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    id v5 = [(MPCRecordingSession *)self statisticsReporter];
    [v5 reportRecordedResults:self->_currentRecorder];
  }
}

- (void)recordSample:(id)a3
{
  uint64_t currentThermalLevel = self->_currentThermalLevel;
  id v5 = a3;
  [v5 setThermalLevel:currentThermalLevel];
  id v6 = [(MPCRecordingSession *)self currentRecorder];
  [v6 recordSample:v5];
}

- (void)dealloc
{
  [(ICEnvironmentMonitor *)self->_thermalMonitor unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MPCRecordingSession;
  [(MPCRecordingSession *)&v3 dealloc];
}

- (MPCRecordingSession)initWithModelID:(id)a3 samplingTime:(double)a4 renderingLimit:(double)a5 shouldRecordSamples:(BOOL)a6
{
  id v11 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MPCRecordingSession;
  uint64_t v12 = [(MPCRecordingSession *)&v25 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];
    sessionID = v12->_sessionID;
    v12->_sessionID = (NSString *)v14;

    objc_storeStrong((id *)&v12->_modelID, a3);
    v16 = objc_alloc_init(MPCStatisticsReporter);
    statisticsReporter = v12->_statisticsReporter;
    v12->_statisticsReporter = v16;

    v18 = [[MPCFirstFailureDetector alloc] initWithSamplingTime:a4 renderingLimit:a5];
    firstFailureDetector = v12->_firstFailureDetector;
    v12->_firstFailureDetector = v18;

    uint64_t v20 = [MEMORY[0x263F89110] sharedMonitor];
    thermalMonitor = v12->_thermalMonitor;
    v12->_thermalMonitor = (ICEnvironmentMonitor *)v20;

    [(ICEnvironmentMonitor *)v12->_thermalMonitor registerObserver:v12];
    v12->_uint64_t currentThermalLevel = [(ICEnvironmentMonitor *)v12->_thermalMonitor currentThermalPressureLevel];
    v12->_shouldRecordSamples = a6;
    v22 = [[MPCSamplesRecorder alloc] initWithRecordID:v12->_sessionID modelID:v12->_modelID firstFailureDetector:v12->_firstFailureDetector shouldStoreSamples:v12->_shouldRecordSamples delegate:v12];
    currentRecorder = v12->_currentRecorder;
    v12->_currentRecorder = v22;
  }
  return v12;
}

@end