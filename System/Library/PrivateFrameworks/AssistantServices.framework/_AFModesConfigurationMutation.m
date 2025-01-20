@interface _AFModesConfigurationMutation
- (BOOL)getIsAudioAccessoryButtonActivation;
- (BOOL)getIsConnectedToCarPlay;
- (BOOL)getIsDeviceScreenON;
- (BOOL)getIsDeviceUnlocked;
- (BOOL)getIsEyesFree;
- (BOOL)getIsFlexibleFollowup;
- (BOOL)getIsForCarDND;
- (BOOL)getIsInAmbient;
- (BOOL)getIsInPocket;
- (BOOL)getIsMapsNavigationActive;
- (BOOL)getIsMediaPlaying;
- (BOOL)getIsRequestMadeWithPhysicalDeviceInteraction;
- (BOOL)getIsSiriAutoPrompt;
- (BOOL)getIsUIFree;
- (BOOL)getIsVoiceTriggerRequest;
- (BOOL)getLiftToWakeDetected;
- (BOOL)getUserInitiatedWakeDetected;
- (BOOL)getUserTypedInSiri;
- (BOOL)isDirty;
- (_AFModesConfigurationMutation)initWithBase:(id)a3;
- (id)getModeOverrideValue;
- (int64_t)getButtonPressDetected;
- (int64_t)getDeviceMotion;
- (int64_t)getDeviceOrientation;
- (int64_t)getDeviceRaised;
- (int64_t)getFaceDetected;
- (int64_t)getFlatDevicePosture;
- (int64_t)getIsBacklightOn;
- (int64_t)getIsInSleepLock;
- (int64_t)getIsInTheaterMode;
- (int64_t)getIsInWaterLock;
- (int64_t)getIsInWorkout;
- (int64_t)getIsOnWrist;
- (int64_t)getIsUserEngagedWithDevice;
- (int64_t)getTouchScreenDetected;
- (void)setButtonPressDetected:(int64_t)a3;
- (void)setDeviceMotion:(int64_t)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDeviceRaised:(int64_t)a3;
- (void)setFaceDetected:(int64_t)a3;
- (void)setFlatDevicePosture:(int64_t)a3;
- (void)setIsAudioAccessoryButtonActivation:(BOOL)a3;
- (void)setIsBacklightOn:(int64_t)a3;
- (void)setIsConnectedToCarPlay:(BOOL)a3;
- (void)setIsDeviceScreenON:(BOOL)a3;
- (void)setIsDeviceUnlocked:(BOOL)a3;
- (void)setIsEyesFree:(BOOL)a3;
- (void)setIsFlexibleFollowup:(BOOL)a3;
- (void)setIsForCarDND:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInPocket:(BOOL)a3;
- (void)setIsInSleepLock:(int64_t)a3;
- (void)setIsInTheaterMode:(int64_t)a3;
- (void)setIsInWaterLock:(int64_t)a3;
- (void)setIsInWorkout:(int64_t)a3;
- (void)setIsMapsNavigationActive:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setIsOnWrist:(int64_t)a3;
- (void)setIsRequestMadeWithPhysicalDeviceInteraction:(BOOL)a3;
- (void)setIsSiriAutoPrompt:(BOOL)a3;
- (void)setIsUIFree:(BOOL)a3;
- (void)setIsUserEngagedWithDevice:(int64_t)a3;
- (void)setIsVoiceTriggerRequest:(BOOL)a3;
- (void)setLiftToWakeDetected:(BOOL)a3;
- (void)setModeOverrideValue:(id)a3;
- (void)setTouchScreenDetected:(int64_t)a3;
- (void)setUserInitiatedWakeDetected:(BOOL)a3;
- (void)setUserTypedInSiri:(BOOL)a3;
@end

@implementation _AFModesConfigurationMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeOverrideValue, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setIsUserEngagedWithDevice:(int64_t)a3
{
  uint64_t v3 = *(void *)&self->_mutationFlags | 0x200000001;
  self->_isUserEngagedWithDevice = a3;
  *(void *)&self->_mutationFlags = v3;
}

- (int64_t)getIsUserEngagedWithDevice
{
  if ((*(unsigned char *)(&self->_mutationFlags + 1) & 2) != 0) {
    return self->_isUserEngagedWithDevice;
  }
  else {
    return [(AFModesConfiguration *)self->_base isUserEngagedWithDevice];
  }
}

- (void)setIsOnWrist:(int64_t)a3
{
  self->_isOnWrist = a3;
  *(void *)&self->_mutationFlags |= 0x100000001uLL;
}

- (int64_t)getIsOnWrist
{
  if (*(unsigned char *)(&self->_mutationFlags + 1)) {
    return self->_isOnWrist;
  }
  else {
    return [(AFModesConfiguration *)self->_base isOnWrist];
  }
}

- (void)setIsInTheaterMode:(int64_t)a3
{
  self->_isInTheaterMode = a3;
  *(void *)&self->_mutationFlags |= 0x80000001uLL;
}

- (int64_t)getIsInTheaterMode
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 0x80) != 0) {
    return self->_isInTheaterMode;
  }
  else {
    return [(AFModesConfiguration *)self->_base isInTheaterMode];
  }
}

- (void)setIsInSleepLock:(int64_t)a3
{
  self->_isInSleepLock = a3;
  *(void *)&self->_mutationFlags |= 0x40000001uLL;
}

- (int64_t)getIsInSleepLock
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 0x40) != 0) {
    return self->_isInSleepLock;
  }
  else {
    return [(AFModesConfiguration *)self->_base isInSleepLock];
  }
}

- (void)setIsInWaterLock:(int64_t)a3
{
  self->_isInWaterLock = a3;
  *(void *)&self->_mutationFlags |= 0x20000001uLL;
}

- (int64_t)getIsInWaterLock
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 0x20) != 0) {
    return self->_isInWaterLock;
  }
  else {
    return [(AFModesConfiguration *)self->_base isInWaterLock];
  }
}

- (void)setIsBacklightOn:(int64_t)a3
{
  self->_isBacklightOn = a3;
  *(void *)&self->_mutationFlags |= 0x10000001uLL;
}

- (int64_t)getIsBacklightOn
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 0x10) != 0) {
    return self->_isBacklightOn;
  }
  else {
    return [(AFModesConfiguration *)self->_base isBacklightOn];
  }
}

- (void)setIsInWorkout:(int64_t)a3
{
  self->_isInWorkout = a3;
  *(void *)&self->_mutationFlags |= 0x8000001uLL;
}

- (int64_t)getIsInWorkout
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 8) != 0) {
    return self->_isInWorkout;
  }
  else {
    return [(AFModesConfiguration *)self->_base isInWorkout];
  }
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
  *(void *)&self->_mutationFlags |= 0x4000001uLL;
}

- (int64_t)getDeviceOrientation
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 4) != 0) {
    return self->_deviceOrientation;
  }
  else {
    return [(AFModesConfiguration *)self->_base deviceOrientation];
  }
}

- (void)setFlatDevicePosture:(int64_t)a3
{
  self->_flatDevicePosture = a3;
  *(void *)&self->_mutationFlags |= 0x2000001uLL;
}

- (int64_t)getFlatDevicePosture
{
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 2) != 0) {
    return self->_flatDevicePosture;
  }
  else {
    return [(AFModesConfiguration *)self->_base flatDevicePosture];
  }
}

- (void)setButtonPressDetected:(int64_t)a3
{
  self->_buttonPressDetected = a3;
  *(void *)&self->_mutationFlags |= 0x1000001uLL;
}

- (int64_t)getButtonPressDetected
{
  if (*((unsigned char *)&self->_mutationFlags + 3)) {
    return self->_buttonPressDetected;
  }
  else {
    return [(AFModesConfiguration *)self->_base buttonPressDetected];
  }
}

- (void)setTouchScreenDetected:(int64_t)a3
{
  self->_touchScreenDetected = a3;
  *(void *)&self->_mutationFlags |= 0x800001uLL;
}

- (int64_t)getTouchScreenDetected
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 0x80) != 0) {
    return self->_touchScreenDetected;
  }
  else {
    return [(AFModesConfiguration *)self->_base touchScreenDetected];
  }
}

- (void)setFaceDetected:(int64_t)a3
{
  self->_faceDetected = a3;
  *(void *)&self->_mutationFlags |= 0x400001uLL;
}

- (int64_t)getFaceDetected
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 0x40) != 0) {
    return self->_faceDetected;
  }
  else {
    return [(AFModesConfiguration *)self->_base faceDetected];
  }
}

- (void)setDeviceRaised:(int64_t)a3
{
  self->_deviceRaised = a3;
  *(void *)&self->_mutationFlags |= 0x200001uLL;
}

- (int64_t)getDeviceRaised
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 0x20) != 0) {
    return self->_deviceRaised;
  }
  else {
    return [(AFModesConfiguration *)self->_base deviceRaised];
  }
}

- (void)setDeviceMotion:(int64_t)a3
{
  self->_deviceMotion = a3;
  *(void *)&self->_mutationFlags |= 0x100001uLL;
}

- (int64_t)getDeviceMotion
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 0x10) != 0) {
    return self->_deviceMotion;
  }
  else {
    return [(AFModesConfiguration *)self->_base deviceMotion];
  }
}

- (void)setUserInitiatedWakeDetected:(BOOL)a3
{
  self->_userInitiatedWakeDetected = a3;
  *(void *)&self->_mutationFlags |= 0x80001uLL;
}

- (BOOL)getUserInitiatedWakeDetected
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 8) != 0) {
    return self->_userInitiatedWakeDetected;
  }
  else {
    return [(AFModesConfiguration *)self->_base userInitiatedWakeDetected];
  }
}

- (void)setLiftToWakeDetected:(BOOL)a3
{
  self->_liftToWakeDetected = a3;
  *(void *)&self->_mutationFlags |= 0x40001uLL;
}

- (BOOL)getLiftToWakeDetected
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 4) != 0) {
    return self->_liftToWakeDetected;
  }
  else {
    return [(AFModesConfiguration *)self->_base liftToWakeDetected];
  }
}

- (void)setIsInPocket:(BOOL)a3
{
  self->_isInPocket = a3;
  *(void *)&self->_mutationFlags |= 0x20001uLL;
}

- (BOOL)getIsInPocket
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 2) != 0) {
    return self->_isInPocket;
  }
  else {
    return [(AFModesConfiguration *)self->_base isInPocket];
  }
}

- (void)setIsDeviceScreenON:(BOOL)a3
{
  self->_isDeviceScreenON = a3;
  *(void *)&self->_mutationFlags |= 0x10001uLL;
}

- (BOOL)getIsDeviceScreenON
{
  if (*((unsigned char *)&self->_mutationFlags + 2)) {
    return self->_isDeviceScreenON;
  }
  else {
    return [(AFModesConfiguration *)self->_base isDeviceScreenON];
  }
}

- (void)setIsDeviceUnlocked:(BOOL)a3
{
  self->_isDeviceUnlocked = a3;
  *(void *)&self->_mutationFlags |= 0x8001uLL;
}

- (BOOL)getIsDeviceUnlocked
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x80) != 0) {
    return self->_isDeviceUnlocked;
  }
  else {
    return [(AFModesConfiguration *)self->_base isDeviceUnlocked];
  }
}

- (void)setModeOverrideValue:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x4001uLL;
}

- (id)getModeOverrideValue
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x40) != 0)
  {
    v2 = self->_modeOverrideValue;
  }
  else
  {
    v2 = [(AFModesConfiguration *)self->_base modeOverrideValue];
  }
  return v2;
}

- (void)setUserTypedInSiri:(BOOL)a3
{
  self->_userTypedInSiri = a3;
  *(void *)&self->_mutationFlags |= 0x2001uLL;
}

- (BOOL)getUserTypedInSiri
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x20) != 0) {
    return self->_userTypedInSiri;
  }
  else {
    return [(AFModesConfiguration *)self->_base userTypedInSiri];
  }
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
  *(void *)&self->_mutationFlags |= 0x1001uLL;
}

- (BOOL)getIsMediaPlaying
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x10) != 0) {
    return self->_isMediaPlaying;
  }
  else {
    return [(AFModesConfiguration *)self->_base isMediaPlaying];
  }
}

- (void)setIsFlexibleFollowup:(BOOL)a3
{
  self->_isFlexibleFollowup = a3;
  *(void *)&self->_mutationFlags |= 0x801uLL;
}

- (BOOL)getIsFlexibleFollowup
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 8) != 0) {
    return self->_isFlexibleFollowup;
  }
  else {
    return [(AFModesConfiguration *)self->_base isFlexibleFollowup];
  }
}

- (void)setIsSiriAutoPrompt:(BOOL)a3
{
  self->_isSiriAutoPrompt = a3;
  *(void *)&self->_mutationFlags |= 0x401uLL;
}

- (BOOL)getIsSiriAutoPrompt
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 4) != 0) {
    return self->_isSiriAutoPrompt;
  }
  else {
    return [(AFModesConfiguration *)self->_base isSiriAutoPrompt];
  }
}

- (void)setIsAudioAccessoryButtonActivation:(BOOL)a3
{
  self->_isAudioAccessoryButtonActivation = a3;
  *(void *)&self->_mutationFlags |= 0x201uLL;
}

- (BOOL)getIsAudioAccessoryButtonActivation
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 2) != 0) {
    return self->_isAudioAccessoryButtonActivation;
  }
  else {
    return [(AFModesConfiguration *)self->_base isAudioAccessoryButtonActivation];
  }
}

- (void)setIsRequestMadeWithPhysicalDeviceInteraction:(BOOL)a3
{
  self->_isRequestMadeWithPhysicalDeviceInteraction = a3;
  *(void *)&self->_mutationFlags |= 0x101uLL;
}

- (BOOL)getIsRequestMadeWithPhysicalDeviceInteraction
{
  if (*((unsigned char *)&self->_mutationFlags + 1)) {
    return self->_isRequestMadeWithPhysicalDeviceInteraction;
  }
  else {
    return [(AFModesConfiguration *)self->_base isRequestMadeWithPhysicalDeviceInteraction];
  }
}

- (void)setIsConnectedToCarPlay:(BOOL)a3
{
  self->_isConnectedToCarPlay = a3;
  *(void *)&self->_mutationFlags |= 0x81uLL;
}

- (BOOL)getIsConnectedToCarPlay
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x80) != 0) {
    return self->_isConnectedToCarPlay;
  }
  else {
    return [(AFModesConfiguration *)self->_base isConnectedToCarPlay];
  }
}

- (void)setIsVoiceTriggerRequest:(BOOL)a3
{
  self->_isVoiceTriggerRequest = a3;
  *(void *)&self->_mutationFlags |= 0x41uLL;
}

- (BOOL)getIsVoiceTriggerRequest
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0) {
    return self->_isVoiceTriggerRequest;
  }
  else {
    return [(AFModesConfiguration *)self->_base isVoiceTriggerRequest];
  }
}

- (void)setIsMapsNavigationActive:(BOOL)a3
{
  self->_isMapsNavigationActive = a3;
  *(void *)&self->_mutationFlags |= 0x21uLL;
}

- (BOOL)getIsMapsNavigationActive
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_isMapsNavigationActive;
  }
  else {
    return [(AFModesConfiguration *)self->_base isMapsNavigationActive];
  }
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
  *(void *)&self->_mutationFlags |= 0x11uLL;
}

- (BOOL)getIsInAmbient
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_isInAmbient;
  }
  else {
    return [(AFModesConfiguration *)self->_base isInAmbient];
  }
}

- (void)setIsForCarDND:(BOOL)a3
{
  self->_isForCarDND = a3;
  *(void *)&self->_mutationFlags |= 9uLL;
}

- (BOOL)getIsForCarDND
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_isForCarDND;
  }
  else {
    return [(AFModesConfiguration *)self->_base isForCarDND];
  }
}

- (void)setIsUIFree:(BOOL)a3
{
  self->_isUIFree = a3;
  *(void *)&self->_mutationFlags |= 5uLL;
}

- (BOOL)getIsUIFree
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_isUIFree;
  }
  else {
    return [(AFModesConfiguration *)self->_base isUIFree];
  }
}

- (void)setIsEyesFree:(BOOL)a3
{
  self->_isEyesFree = a3;
  *(void *)&self->_mutationFlags |= 3uLL;
}

- (BOOL)getIsEyesFree
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_isEyesFree;
  }
  else {
    return [(AFModesConfiguration *)self->_base isEyesFree];
  }
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (_AFModesConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFModesConfigurationMutation;
  v6 = [(_AFModesConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end