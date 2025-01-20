@interface ACCAudioManager
+ (id)sharedACCAudioManager;
- (ACCAudioClient)audioClient;
- (ACCAudioManager)init;
- (BOOL)allowBackgroundAudioForClient:(id)a3;
- (BOOL)setDigitalAudioSampleRate:(unsigned int)a3;
- (id)deviceAudioStates;
- (id)supportedDigitalAudioSampleRates;
- (unsigned)supportedDigitalAudioSampleRate:(unsigned int)a3;
- (void)setAudioClient:(id)a3;
@end

@implementation ACCAudioManager

+ (id)sharedACCAudioManager
{
  if (sharedACCAudioManager_once != -1) {
    dispatch_once(&sharedACCAudioManager_once, &__block_literal_global);
  }
  v2 = (void *)sharedACCAudioManager_sharedInstance;

  return v2;
}

uint64_t __40__ACCAudioManager_sharedACCAudioManager__block_invoke()
{
  sharedACCAudioManager_sharedInstance = objc_alloc_init(ACCAudioManager);

  return MEMORY[0x270F9A758]();
}

- (ACCAudioManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCAudioManager;
  v2 = [(ACCAudioManager *)&v6 init];
  if (v2)
  {
    v3 = [[ACCAudioClient alloc] initWithDelegate:v2];
    audioClient = v2->_audioClient;
    v2->_audioClient = v3;
  }
  return v2;
}

- (BOOL)setDigitalAudioSampleRate:(unsigned int)a3
{
  return [(ACCAudioClient *)self->_audioClient setDigitalAudioSampleRate:*(void *)&a3];
}

- (unsigned)supportedDigitalAudioSampleRate:(unsigned int)a3
{
  return [(ACCAudioClient *)self->_audioClient supportedDigitalAudioSampleRate:*(void *)&a3];
}

- (id)supportedDigitalAudioSampleRates
{
  return [(ACCAudioClient *)self->_audioClient supportedDigitalAudioSampleRates];
}

- (id)deviceAudioStates
{
  return [(ACCAudioClient *)self->_audioClient deviceAudioStates];
}

- (BOOL)allowBackgroundAudioForClient:(id)a3
{
  return [(ACCAudioClient *)self->_audioClient allowBackgroundAudioForClient:a3];
}

- (ACCAudioClient)audioClient
{
  return self->_audioClient;
}

- (void)setAudioClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end