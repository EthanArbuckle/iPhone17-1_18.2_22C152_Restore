@interface CSSpeechDetectionDevicePresentMonitor
+ (id)sharedInstance;
- (BOOL)isPresent;
- (CSSpeechDetectionDevicePresentMonitor)init;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingSpeechDetectionVADPresence;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
- (void)handleSpeechDetectionVADPresentChange:(id)a3;
@end

@implementation CSSpeechDetectionDevicePresentMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2127 != -1) {
    dispatch_once(&sharedInstance_onceToken_2127, &__block_literal_global_2128);
  }
  v2 = (void *)sharedInstance_sharedInstance_2129;
  return v2;
}

- (BOOL)isPresent
{
  v2 = +[CSFPreferences sharedPreferences];
  char v3 = [v2 programmableAudioInjectionEnabled];

  if (v3) {
    return 1;
  }
  if (CSIsVirtualMachine_onceToken != -1) {
    dispatch_once(&CSIsVirtualMachine_onceToken, &__block_literal_global_27);
  }
  if (CSIsVirtualMachine_isVM) {
    return 1;
  }
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  v6 = [v5 attributeForKey:*MEMORY[0x1E4F74AF8]];

  LOBYTE(v5) = [v6 containsObject:@"VirtualAudioDevice_SpeechDetection"];
  return (char)v5;
}

uint64_t __79__CSSpeechDetectionDevicePresentMonitor_handleSpeechDetectionVADPresentChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserver:a2];
}

- (void)handleSpeechDetectionVADPresentChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSpeechDetectionDevicePresentMonitor handleSpeechDetectionVADPresentChange:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__CSSpeechDetectionDevicePresentMonitor_handleSpeechDetectionVADPresentChange___block_invoke;
  v5[3] = &unk_1E6201240;
  v5[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v5];
}

- (void)_startObservingSystemControllerLifecycle
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = (uint64_t *)MEMORY[0x1E4F74E28];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E28] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  uint64_t v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel__systemControllerDied_ name:v7 object:v8];
}

- (void)_systemControllerDied:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSSpeechDetectionDevicePresentMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSSpeechDetectionDevicePresentMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSSpeechDetectionDevicePresentMonitor *)self _startObservingSpeechDetectionVADPresence];
  [(CSSpeechDetectionDevicePresentMonitor *)self handleSpeechDetectionVADPresentChange:0];
}

- (void)_startObservingSpeechDetectionVADPresence
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (uint64_t *)MEMORY[0x1E4F74B00];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74B00] object:0];

  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*v4];
  v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v5 setAttribute:v9 forKey:*MEMORY[0x1E4F74EB0] error:0];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *v4;
  __int16 v8 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v6 addObserver:self selector:sel_handleSpeechDetectionVADPresentChange_ name:v7 object:v8];
}

- (void)_stopMonitoring
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  [(CSSpeechDetectionDevicePresentMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSSpeechDetectionDevicePresentMonitor *)self _startObservingSpeechDetectionVADPresence];
}

- (CSSpeechDetectionDevicePresentMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSpeechDetectionDevicePresentMonitor;
  return [(CSEventMonitor *)&v3 init];
}

uint64_t __55__CSSpeechDetectionDevicePresentMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2129 = objc_alloc_init(CSSpeechDetectionDevicePresentMonitor);
  return MEMORY[0x1F41817F8]();
}

@end