@interface CSSiriPreferences
+ (id)sharedPreferences;
- (CSSiriPreferences)init;
- (CSSiriPreferences)initWithInstanceContext:(id)a3;
- (id)overrideAudioSessionActiveDelay;
- (id)serverAudioSessionActivationDelay;
- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold;
- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay;
- (unint64_t)internalUserClassification;
@end

@implementation CSSiriPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (unint64_t)internalUserClassification
{
  v2 = _AFBackedUpPreferencesValueForKey();
  unint64_t v3 = [v2 unsignedIntegerValue];

  if (v3 >= 3) {
    return 0;
  }
  else {
    return v3;
  }
}

- (id)serverAudioSessionActivationDelay
{
  if (+[CSUtils horsemanDeviceType] == 3) {
    v2 = &unk_1F13B8618;
  }
  else {
    v2 = 0;
  }
  unint64_t v3 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold
{
  if (+[CSUtils horsemanDeviceType] == 3) {
    v2 = &unk_1F13B8608;
  }
  else {
    v2 = 0;
  }
  unint64_t v3 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay
{
  if (+[CSUtils horsemanDeviceType] == 3) {
    v2 = &unk_1F13B85F8;
  }
  else {
    v2 = 0;
  }
  unint64_t v3 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)overrideAudioSessionActiveDelay
{
  v2 = _AFPreferencesValueForKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (CSSiriPreferences)init
{
  return [(CSSiriPreferences *)self initWithInstanceContext:0];
}

- (CSSiriPreferences)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSiriPreferences;
  id v5 = [(CSSiriPreferences *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create(0, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    if (v4)
    {
      v8 = (AFInstanceContext *)v4;
    }
    else
    {
      v8 = [MEMORY[0x1E4F4E4A8] defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v8;
  }
  return v5;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken_8089 != -1) {
    dispatch_once(&sharedPreferences_onceToken_8089, &__block_literal_global_8090);
  }
  v2 = (void *)sharedPreferences_sharedPreferences;
  return v2;
}

void __38__CSSiriPreferences_sharedPreferences__block_invoke()
{
  v0 = [CSSiriPreferences alloc];
  id v3 = [MEMORY[0x1E4F4E4A8] currentContext];
  uint64_t v1 = [(CSSiriPreferences *)v0 initWithInstanceContext:v3];
  v2 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = v1;
}

@end