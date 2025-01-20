@interface AFModesConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFModesConfiguration)init;
- (AFModesConfiguration)initWithBuilder:(id)a3;
- (AFModesConfiguration)initWithCoder:(id)a3;
- (AFModesConfiguration)initWithIsEyesFree:(BOOL)a3 isUIFree:(BOOL)a4 isForCarDND:(BOOL)a5 isInAmbient:(BOOL)a6 isMapsNavigationActive:(BOOL)a7 isVoiceTriggerRequest:(BOOL)a8 isConnectedToCarPlay:(BOOL)a9 isRequestMadeWithPhysicalDeviceInteraction:(BOOL)a10 isAudioAccessoryButtonActivation:(BOOL)a11 isSiriAutoPrompt:(BOOL)a12 isFlexibleFollowup:(BOOL)a13 isMediaPlaying:(BOOL)a14 userTypedInSiri:(BOOL)a15 modeOverrideValue:(id)a16 isDeviceUnlocked:(BOOL)a17 isDeviceScreenON:(BOOL)a18 isInPocket:(BOOL)a19 liftToWakeDetected:(BOOL)a20 userInitiatedWakeDetected:(BOOL)a21 deviceMotion:(int64_t)a22 deviceRaised:(int64_t)a23 faceDetected:(int64_t)a24 touchScreenDetected:(int64_t)a25 buttonPressDetected:(int64_t)a26 flatDevicePosture:(int64_t)a27 deviceOrientation:(int64_t)a28 isInWorkout:(int64_t)a29 isBacklightOn:(int64_t)a30 isInWaterLock:(int64_t)a31 isInSleepLock:(int64_t)a32 isInTheaterMode:(int64_t)a33 isOnWrist:(int64_t)a34 isUserEngagedWithDevice:(int64_t)a35;
- (BOOL)isAudioAccessoryButtonActivation;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isDeviceScreenON;
- (BOOL)isDeviceUnlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEyesFree;
- (BOOL)isFlexibleFollowup;
- (BOOL)isForCarDND;
- (BOOL)isInAmbient;
- (BOOL)isInPocket;
- (BOOL)isMapsNavigationActive;
- (BOOL)isMediaPlaying;
- (BOOL)isRequestMadeWithPhysicalDeviceInteraction;
- (BOOL)isSiriAutoPrompt;
- (BOOL)isUIFree;
- (BOOL)isVoiceTriggerRequest;
- (BOOL)liftToWakeDetected;
- (BOOL)userInitiatedWakeDetected;
- (BOOL)userTypedInSiri;
- (NSString)modeOverrideValue;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)buttonPressDetected;
- (int64_t)deviceMotion;
- (int64_t)deviceOrientation;
- (int64_t)deviceRaised;
- (int64_t)faceDetected;
- (int64_t)flatDevicePosture;
- (int64_t)isBacklightOn;
- (int64_t)isInSleepLock;
- (int64_t)isInTheaterMode;
- (int64_t)isInWaterLock;
- (int64_t)isInWorkout;
- (int64_t)isOnWrist;
- (int64_t)isUserEngagedWithDevice;
- (int64_t)touchScreenDetected;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFModesConfiguration

- (void).cxx_destruct
{
}

- (int64_t)isUserEngagedWithDevice
{
  return self->_isUserEngagedWithDevice;
}

- (int64_t)isOnWrist
{
  return self->_isOnWrist;
}

- (int64_t)isInTheaterMode
{
  return self->_isInTheaterMode;
}

- (int64_t)isInSleepLock
{
  return self->_isInSleepLock;
}

- (int64_t)isInWaterLock
{
  return self->_isInWaterLock;
}

- (int64_t)isBacklightOn
{
  return self->_isBacklightOn;
}

- (int64_t)isInWorkout
{
  return self->_isInWorkout;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)flatDevicePosture
{
  return self->_flatDevicePosture;
}

- (int64_t)buttonPressDetected
{
  return self->_buttonPressDetected;
}

- (int64_t)touchScreenDetected
{
  return self->_touchScreenDetected;
}

- (int64_t)faceDetected
{
  return self->_faceDetected;
}

- (int64_t)deviceRaised
{
  return self->_deviceRaised;
}

- (int64_t)deviceMotion
{
  return self->_deviceMotion;
}

- (BOOL)userInitiatedWakeDetected
{
  return self->_userInitiatedWakeDetected;
}

- (BOOL)liftToWakeDetected
{
  return self->_liftToWakeDetected;
}

- (BOOL)isInPocket
{
  return self->_isInPocket;
}

- (BOOL)isDeviceScreenON
{
  return self->_isDeviceScreenON;
}

- (BOOL)isDeviceUnlocked
{
  return self->_isDeviceUnlocked;
}

- (NSString)modeOverrideValue
{
  return self->_modeOverrideValue;
}

- (BOOL)userTypedInSiri
{
  return self->_userTypedInSiri;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (BOOL)isFlexibleFollowup
{
  return self->_isFlexibleFollowup;
}

- (BOOL)isSiriAutoPrompt
{
  return self->_isSiriAutoPrompt;
}

- (BOOL)isAudioAccessoryButtonActivation
{
  return self->_isAudioAccessoryButtonActivation;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  return self->_isRequestMadeWithPhysicalDeviceInteraction;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_isConnectedToCarPlay;
}

- (BOOL)isVoiceTriggerRequest
{
  return self->_isVoiceTriggerRequest;
}

- (BOOL)isMapsNavigationActive
{
  return self->_isMapsNavigationActive;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isForCarDND
{
  return self->_isForCarDND;
}

- (BOOL)isUIFree
{
  return self->_isUIFree;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL isEyesFree = self->_isEyesFree;
  id v6 = a3;
  v7 = [v4 numberWithBool:isEyesFree];
  [v6 encodeObject:v7 forKey:@"AFModesConfiguration::isEyesFree"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isUIFree];
  [v6 encodeObject:v8 forKey:@"AFModesConfiguration::isUIFree"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isForCarDND];
  [v6 encodeObject:v9 forKey:@"AFModesConfiguration::isForCarDND"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isInAmbient];
  [v6 encodeObject:v10 forKey:@"AFModesConfiguration::isInAmbient"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isMapsNavigationActive];
  [v6 encodeObject:v11 forKey:@"AFModesConfiguration::isMapsNavigationActive"];

  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isVoiceTriggerRequest];
  [v6 encodeObject:v12 forKey:@"AFModesConfiguration::isVoiceTriggerRequest"];

  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isConnectedToCarPlay];
  [v6 encodeObject:v13 forKey:@"AFModesConfiguration::isConnectedToCarPlay"];

  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isRequestMadeWithPhysicalDeviceInteraction];
  [v6 encodeObject:v14 forKey:@"AFModesConfiguration::isRequestMadeWithPhysicalDeviceInteraction"];

  v15 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAudioAccessoryButtonActivation];
  [v6 encodeObject:v15 forKey:@"AFModesConfiguration::isAudioAccessoryButtonActivation"];

  v16 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSiriAutoPrompt];
  [v6 encodeObject:v16 forKey:@"AFModesConfiguration::isSiriAutoPrompt"];

  v17 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFlexibleFollowup];
  [v6 encodeObject:v17 forKey:@"AFModesConfiguration::isFlexibleFollowup"];

  v18 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isMediaPlaying];
  [v6 encodeObject:v18 forKey:@"AFModesConfiguration::isMediaPlaying"];

  v19 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_userTypedInSiri];
  [v6 encodeObject:v19 forKey:@"AFModesConfiguration::userTypedInSiri"];

  [v6 encodeObject:self->_modeOverrideValue forKey:@"AFModesConfiguration::modeOverrideValue"];
  v20 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceUnlocked];
  [v6 encodeObject:v20 forKey:@"AFModesConfiguration::isDeviceUnlocked"];

  v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceScreenON];
  [v6 encodeObject:v21 forKey:@"AFModesConfiguration::isDeviceScreenON"];

  v22 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isInPocket];
  [v6 encodeObject:v22 forKey:@"AFModesConfiguration::isInPocket"];

  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_liftToWakeDetected];
  [v6 encodeObject:v23 forKey:@"AFModesConfiguration::liftToWakeDetected"];

  v24 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_userInitiatedWakeDetected];
  [v6 encodeObject:v24 forKey:@"AFModesConfiguration::userInitiatedWakeDetected"];

  v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceMotion];
  [v6 encodeObject:v25 forKey:@"AFModesConfiguration::deviceMotion"];

  v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceRaised];
  [v6 encodeObject:v26 forKey:@"AFModesConfiguration::deviceRaised"];

  v27 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_faceDetected];
  [v6 encodeObject:v27 forKey:@"AFModesConfiguration::faceDetected"];

  v28 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_touchScreenDetected];
  [v6 encodeObject:v28 forKey:@"AFModesConfiguration::touchScreenDetected"];

  v29 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_buttonPressDetected];
  [v6 encodeObject:v29 forKey:@"AFModesConfiguration::buttonPressDetected"];

  v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_flatDevicePosture];
  [v6 encodeObject:v30 forKey:@"AFModesConfiguration::flatDevicePosture"];

  v31 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceOrientation];
  [v6 encodeObject:v31 forKey:@"AFModesConfiguration::deviceOrientation"];

  v32 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInWorkout];
  [v6 encodeObject:v32 forKey:@"AFModesConfiguration::isInWorkout"];

  v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isBacklightOn];
  [v6 encodeObject:v33 forKey:@"AFModesConfiguration::isBacklightOn"];

  v34 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInWaterLock];
  [v6 encodeObject:v34 forKey:@"AFModesConfiguration::isInWaterLock"];

  v35 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInSleepLock];
  [v6 encodeObject:v35 forKey:@"AFModesConfiguration::isInSleepLock"];

  v36 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInTheaterMode];
  [v6 encodeObject:v36 forKey:@"AFModesConfiguration::isInTheaterMode"];

  v37 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isOnWrist];
  [v6 encodeObject:v37 forKey:@"AFModesConfiguration::isOnWrist"];

  id v38 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isUserEngagedWithDevice];
  [v6 encodeObject:v38 forKey:@"AFModesConfiguration::isUserEngagedWithDevice"];
}

- (AFModesConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isEyesFree"];
  unsigned int v72 = [v4 BOOLValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isUIFree"];
  unsigned int v71 = [v5 BOOLValue];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isForCarDND"];
  unsigned int v70 = [v6 BOOLValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isInAmbient"];
  unsigned int v69 = [v7 BOOLValue];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isMapsNavigationActive"];
  unsigned int v68 = [v8 BOOLValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isVoiceTriggerRequest"];
  unsigned int v67 = [v9 BOOLValue];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isConnectedToCarPlay"];
  char v66 = [v10 BOOLValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isRequestMadeWithPhysicalDeviceInteraction"];
  char v65 = [v11 BOOLValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isAudioAccessoryButtonActivation"];
  char v64 = [v12 BOOLValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isSiriAutoPrompt"];
  char v63 = [v13 BOOLValue];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isFlexibleFollowup"];
  char v62 = [v14 BOOLValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isMediaPlaying"];
  char v61 = [v15 BOOLValue];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::userTypedInSiri"];
  char v60 = [v16 BOOLValue];

  v59 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::modeOverrideValue"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isDeviceUnlocked"];
  char v58 = [v17 BOOLValue];

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isDeviceScreenON"];
  char v57 = [v18 BOOLValue];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isInPocket"];
  char v56 = [v19 BOOLValue];

  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::liftToWakeDetected"];
  char v55 = [v20 BOOLValue];

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::userInitiatedWakeDetected"];
  char v54 = [v21 BOOLValue];

  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::deviceMotion"];
  uint64_t v53 = [v22 integerValue];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::deviceRaised"];
  uint64_t v52 = [v23 integerValue];

  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::faceDetected"];
  uint64_t v51 = [v24 integerValue];

  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::touchScreenDetected"];
  uint64_t v50 = [v25 integerValue];

  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::buttonPressDetected"];
  uint64_t v49 = [v26 integerValue];

  v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::flatDevicePosture"];
  uint64_t v48 = [v27 integerValue];

  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::deviceOrientation"];
  uint64_t v29 = [v28 integerValue];

  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isInWorkout"];
  uint64_t v31 = [v30 integerValue];

  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isBacklightOn"];
  uint64_t v33 = [v32 integerValue];

  v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isInWaterLock"];
  uint64_t v35 = [v34 integerValue];

  v36 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isInSleepLock"];
  uint64_t v37 = [v36 integerValue];

  id v38 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isInTheaterMode"];
  uint64_t v39 = [v38 integerValue];

  v40 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isOnWrist"];
  uint64_t v41 = [v40 integerValue];

  v42 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFModesConfiguration::isUserEngagedWithDevice"];

  uint64_t v43 = [v42 integerValue];
  BYTE4(v47) = v54;
  BYTE3(v47) = v55;
  BYTE2(v47) = v56;
  BYTE1(v47) = v57;
  LOBYTE(v47) = v58;
  BYTE6(v46) = v60;
  BYTE5(v46) = v61;
  BYTE4(v46) = v62;
  BYTE3(v46) = v63;
  BYTE2(v46) = v64;
  BYTE1(v46) = v65;
  LOBYTE(v46) = v66;
  v44 = -[AFModesConfiguration initWithIsEyesFree:isUIFree:isForCarDND:isInAmbient:isMapsNavigationActive:isVoiceTriggerRequest:isConnectedToCarPlay:isRequestMadeWithPhysicalDeviceInteraction:isAudioAccessoryButtonActivation:isSiriAutoPrompt:isFlexibleFollowup:isMediaPlaying:userTypedInSiri:modeOverrideValue:isDeviceUnlocked:isDeviceScreenON:isInPocket:liftToWakeDetected:userInitiatedWakeDetected:deviceMotion:deviceRaised:faceDetected:touchScreenDetected:buttonPressDetected:flatDevicePosture:deviceOrientation:isInWorkout:isBacklightOn:isInWaterLock:isInSleepLock:isInTheaterMode:isOnWrist:isUserEngagedWithDevice:](self, "initWithIsEyesFree:isUIFree:isForCarDND:isInAmbient:isMapsNavigationActive:isVoiceTriggerRequest:isConnectedToCarPlay:isRequestMadeWithPhysicalDeviceInteraction:isAudioAccessoryButtonActivation:isSiriAutoPrompt:isFlexibleFollowup:isMediaPlaying:userTypedInSiri:modeOverrideValue:isDeviceUnlocked:isDeviceScreenON:isInPocket:liftToWakeDetected:userInitiatedWakeDetected:deviceMotion:deviceRaised:faceDetected:touchScreenDetected:buttonPressDetected:flatDevicePosture:deviceOrientation:isInWorkout:isBacklightOn:isInWaterLock:isInSleepLock:isInTheaterMode:isOnWrist:isUserEngagedWithDevice:", v72, v71, v70, v69, v68, v67, v46, v59, v47, v53, v52, v51,
          v50,
          v49,
          v48,
          v29,
          v31,
          v33,
          v35,
          v37,
          v39,
          v41,
          v43);

  return v44;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFModesConfiguration *)a3;
  if (self == v4)
  {
    BOOL v40 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isEyesFree = self->_isEyesFree;
      if (isEyesFree != [(AFModesConfiguration *)v5 isEyesFree]) {
        goto LABEL_40;
      }
      BOOL isUIFree = self->_isUIFree;
      if (isUIFree != [(AFModesConfiguration *)v5 isUIFree]) {
        goto LABEL_40;
      }
      BOOL isForCarDND = self->_isForCarDND;
      if (isForCarDND != [(AFModesConfiguration *)v5 isForCarDND]) {
        goto LABEL_40;
      }
      BOOL isInAmbient = self->_isInAmbient;
      if (isInAmbient != [(AFModesConfiguration *)v5 isInAmbient]) {
        goto LABEL_40;
      }
      BOOL isMapsNavigationActive = self->_isMapsNavigationActive;
      if (isMapsNavigationActive != [(AFModesConfiguration *)v5 isMapsNavigationActive]) {
        goto LABEL_40;
      }
      BOOL isVoiceTriggerRequest = self->_isVoiceTriggerRequest;
      if (isVoiceTriggerRequest != [(AFModesConfiguration *)v5 isVoiceTriggerRequest]) {
        goto LABEL_40;
      }
      BOOL isConnectedToCarPlay = self->_isConnectedToCarPlay;
      if (isConnectedToCarPlay != [(AFModesConfiguration *)v5 isConnectedToCarPlay]) {
        goto LABEL_40;
      }
      BOOL isRequestMadeWithPhysicalDeviceInteraction = self->_isRequestMadeWithPhysicalDeviceInteraction;
      if (isRequestMadeWithPhysicalDeviceInteraction != [(AFModesConfiguration *)v5 isRequestMadeWithPhysicalDeviceInteraction])goto LABEL_40; {
      BOOL isAudioAccessoryButtonActivation = self->_isAudioAccessoryButtonActivation;
      }
      if (isAudioAccessoryButtonActivation != [(AFModesConfiguration *)v5 isAudioAccessoryButtonActivation])goto LABEL_40; {
      BOOL isSiriAutoPrompt = self->_isSiriAutoPrompt;
      }
      if (isSiriAutoPrompt != [(AFModesConfiguration *)v5 isSiriAutoPrompt]) {
        goto LABEL_40;
      }
      BOOL isFlexibleFollowup = self->_isFlexibleFollowup;
      if (isFlexibleFollowup != [(AFModesConfiguration *)v5 isFlexibleFollowup]) {
        goto LABEL_40;
      }
      BOOL isMediaPlaying = self->_isMediaPlaying;
      if (isMediaPlaying != [(AFModesConfiguration *)v5 isMediaPlaying]) {
        goto LABEL_40;
      }
      BOOL userTypedInSiri = self->_userTypedInSiri;
      if (userTypedInSiri != [(AFModesConfiguration *)v5 userTypedInSiri]) {
        goto LABEL_40;
      }
      BOOL isDeviceUnlocked = self->_isDeviceUnlocked;
      if (isDeviceUnlocked != [(AFModesConfiguration *)v5 isDeviceUnlocked]) {
        goto LABEL_40;
      }
      BOOL isDeviceScreenON = self->_isDeviceScreenON;
      if (isDeviceScreenON != [(AFModesConfiguration *)v5 isDeviceScreenON]) {
        goto LABEL_40;
      }
      BOOL isInPocket = self->_isInPocket;
      if (isInPocket != [(AFModesConfiguration *)v5 isInPocket]) {
        goto LABEL_40;
      }
      BOOL liftToWakeDetected = self->_liftToWakeDetected;
      if (liftToWakeDetected != [(AFModesConfiguration *)v5 liftToWakeDetected]) {
        goto LABEL_40;
      }
      BOOL userInitiatedWakeDetected = self->_userInitiatedWakeDetected;
      if (userInitiatedWakeDetected != [(AFModesConfiguration *)v5 userInitiatedWakeDetected])goto LABEL_40; {
      int64_t deviceMotion = self->_deviceMotion;
      }
      if (deviceMotion != [(AFModesConfiguration *)v5 deviceMotion]) {
        goto LABEL_40;
      }
      int64_t deviceRaised = self->_deviceRaised;
      if (deviceRaised != [(AFModesConfiguration *)v5 deviceRaised]) {
        goto LABEL_40;
      }
      int64_t faceDetected = self->_faceDetected;
      if (faceDetected != [(AFModesConfiguration *)v5 faceDetected]) {
        goto LABEL_40;
      }
      int64_t touchScreenDetected = self->_touchScreenDetected;
      if (touchScreenDetected != [(AFModesConfiguration *)v5 touchScreenDetected]) {
        goto LABEL_40;
      }
      int64_t buttonPressDetected = self->_buttonPressDetected;
      if (buttonPressDetected != [(AFModesConfiguration *)v5 buttonPressDetected]) {
        goto LABEL_40;
      }
      int64_t flatDevicePosture = self->_flatDevicePosture;
      if (flatDevicePosture != [(AFModesConfiguration *)v5 flatDevicePosture]) {
        goto LABEL_40;
      }
      int64_t deviceOrientation = self->_deviceOrientation;
      if (deviceOrientation != [(AFModesConfiguration *)v5 deviceOrientation]) {
        goto LABEL_40;
      }
      int64_t isInWorkout = self->_isInWorkout;
      if (isInWorkout == [(AFModesConfiguration *)v5 isInWorkout]
        && (int64_t isBacklightOn = self->_isBacklightOn,
            isBacklightOn == [(AFModesConfiguration *)v5 isBacklightOn])
        && (int64_t isInWaterLock = self->_isInWaterLock,
            isInWaterLock == [(AFModesConfiguration *)v5 isInWaterLock])
        && (int64_t isInSleepLock = self->_isInSleepLock,
            isInSleepLock == [(AFModesConfiguration *)v5 isInSleepLock])
        && (int64_t isInTheaterMode = self->_isInTheaterMode,
            isInTheaterMode == [(AFModesConfiguration *)v5 isInTheaterMode])
        && (int64_t isOnWrist = self->_isOnWrist, isOnWrist == [(AFModesConfiguration *)v5 isOnWrist])
        && (int64_t isUserEngagedWithDevice = self->_isUserEngagedWithDevice,
            isUserEngagedWithDevice == [(AFModesConfiguration *)v5 isUserEngagedWithDevice]))
      {
        id v38 = [(AFModesConfiguration *)v5 modeOverrideValue];
        modeOverrideValue = self->_modeOverrideValue;
        BOOL v40 = modeOverrideValue == v38 || [(NSString *)modeOverrideValue isEqual:v38];
      }
      else
      {
LABEL_40:
        BOOL v40 = 0;
      }
    }
    else
    {
      BOOL v40 = 0;
    }
  }

  return v40;
}

- (unint64_t)hash
{
  unsigned int v68 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEyesFree];
  uint64_t v3 = [v68 hash];
  unsigned int v67 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isUIFree];
  uint64_t v4 = [v67 hash] ^ v3;
  char v66 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isForCarDND];
  uint64_t v5 = [v66 hash];
  char v65 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isInAmbient];
  uint64_t v6 = v4 ^ v5 ^ [v65 hash];
  char v64 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isMapsNavigationActive];
  uint64_t v7 = [v64 hash];
  char v63 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isVoiceTriggerRequest];
  uint64_t v8 = v7 ^ [v63 hash];
  char v62 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isConnectedToCarPlay];
  uint64_t v9 = v6 ^ v8 ^ [v62 hash];
  char v61 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isRequestMadeWithPhysicalDeviceInteraction];
  uint64_t v10 = [v61 hash];
  char v60 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAudioAccessoryButtonActivation];
  uint64_t v11 = v10 ^ [v60 hash];
  v59 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSiriAutoPrompt];
  uint64_t v12 = v11 ^ [v59 hash];
  char v58 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFlexibleFollowup];
  uint64_t v13 = v9 ^ v12 ^ [v58 hash];
  char v57 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isMediaPlaying];
  uint64_t v14 = [v57 hash];
  char v56 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_userTypedInSiri];
  uint64_t v15 = v14 ^ [v56 hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_modeOverrideValue hash];
  char v55 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceUnlocked];
  uint64_t v17 = v16 ^ [v55 hash];
  char v54 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceScreenON];
  uint64_t v18 = v13 ^ v17 ^ [v54 hash];
  uint64_t v53 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isInPocket];
  uint64_t v19 = [v53 hash];
  uint64_t v52 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_liftToWakeDetected];
  uint64_t v20 = v19 ^ [v52 hash];
  uint64_t v51 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_userInitiatedWakeDetected];
  uint64_t v21 = v20 ^ [v51 hash];
  uint64_t v50 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceMotion];
  uint64_t v22 = v21 ^ [v50 hash];
  uint64_t v49 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceRaised];
  uint64_t v23 = v22 ^ [v49 hash];
  uint64_t v48 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_faceDetected];
  uint64_t v24 = v18 ^ v23 ^ [v48 hash];
  uint64_t v47 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_touchScreenDetected];
  uint64_t v25 = [v47 hash];
  uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_buttonPressDetected];
  uint64_t v26 = v25 ^ [v46 hash];
  v45 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_flatDevicePosture];
  uint64_t v27 = v26 ^ [v45 hash];
  v44 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deviceOrientation];
  uint64_t v28 = v27 ^ [v44 hash];
  uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInWorkout];
  uint64_t v30 = v28 ^ [v29 hash];
  uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isBacklightOn];
  uint64_t v32 = v30 ^ [v31 hash];
  uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInWaterLock];
  uint64_t v34 = v24 ^ v32 ^ [v33 hash];
  uint64_t v35 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInSleepLock];
  uint64_t v36 = [v35 hash];
  uint64_t v37 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isInTheaterMode];
  uint64_t v38 = v36 ^ [v37 hash];
  uint64_t v39 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isOnWrist];
  uint64_t v40 = v38 ^ [v39 hash];
  uint64_t v41 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_isUserEngagedWithDevice];
  unint64_t v42 = v34 ^ v40 ^ [v41 hash];

  return v42;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v90 = [NSString alloc];
  v97.receiver = self;
  v97.super_class = (Class)AFModesConfiguration;
  v96 = [(AFModesConfiguration *)&v97 description];
  unint64_t deviceMotion = self->_deviceMotion;
  if (deviceMotion > 3) {
    uint64_t v5 = @"(unknown)";
  }
  else {
    uint64_t v5 = off_1E592A840[deviceMotion];
  }
  BOOL isEyesFree = self->_isEyesFree;
  BOOL isUIFree = self->_isUIFree;
  BOOL isForCarDND = self->_isForCarDND;
  BOOL isInAmbient = self->_isInAmbient;
  BOOL isMapsNavigationActive = self->_isMapsNavigationActive;
  BOOL isVoiceTriggerRequest = self->_isVoiceTriggerRequest;
  BOOL isConnectedToCarPlay = self->_isConnectedToCarPlay;
  BOOL isRequestMadeWithPhysicalDeviceInteraction = self->_isRequestMadeWithPhysicalDeviceInteraction;
  BOOL isAudioAccessoryButtonActivation = self->_isAudioAccessoryButtonActivation;
  BOOL isSiriAutoPrompt = self->_isSiriAutoPrompt;
  BOOL isFlexibleFollowup = self->_isFlexibleFollowup;
  BOOL isMediaPlaying = self->_isMediaPlaying;
  BOOL userTypedInSiri = self->_userTypedInSiri;
  modeOverrideValue = self->_modeOverrideValue;
  BOOL isDeviceUnlocked = self->_isDeviceUnlocked;
  BOOL isDeviceScreenON = self->_isDeviceScreenON;
  BOOL isInPocket = self->_isInPocket;
  BOOL userInitiatedWakeDetected = self->_userInitiatedWakeDetected;
  BOOL liftToWakeDetected = self->_liftToWakeDetected;
  v95 = v5;
  unint64_t deviceRaised = self->_deviceRaised;
  if (deviceRaised > 2) {
    uint64_t v14 = @"(unknown)";
  }
  else {
    uint64_t v14 = off_1E592A860[deviceRaised];
  }
  v94 = v14;
  unint64_t faceDetected = self->_faceDetected;
  if (faceDetected > 2) {
    NSUInteger v16 = @"(unknown)";
  }
  else {
    NSUInteger v16 = off_1E592A860[faceDetected];
  }
  v93 = v16;
  unint64_t touchScreenDetected = self->_touchScreenDetected;
  if (touchScreenDetected > 2) {
    uint64_t v18 = @"(unknown)";
  }
  else {
    uint64_t v18 = off_1E592A860[touchScreenDetected];
  }
  v92 = v18;
  unint64_t buttonPressDetected = self->_buttonPressDetected;
  if (buttonPressDetected > 2) {
    uint64_t v20 = @"(unknown)";
  }
  else {
    uint64_t v20 = off_1E592A860[buttonPressDetected];
  }
  v88 = v20;
  unint64_t flatDevicePosture = self->_flatDevicePosture;
  if (flatDevicePosture > 2) {
    uint64_t v22 = @"(unknown)";
  }
  else {
    uint64_t v22 = off_1E592A860[flatDevicePosture];
  }
  v75 = v22;
  unint64_t deviceOrientation = self->_deviceOrientation;
  if (deviceOrientation > 6) {
    uint64_t v24 = @"(unknown)";
  }
  else {
    uint64_t v24 = off_1E5928170[deviceOrientation];
  }
  unsigned int v67 = v24;
  unint64_t isInWorkout = self->_isInWorkout;
  if (isInWorkout > 2) {
    uint64_t v26 = @"(unknown)";
  }
  else {
    uint64_t v26 = off_1E592A860[isInWorkout];
  }
  char v66 = v26;
  unint64_t isBacklightOn = self->_isBacklightOn;
  if (isBacklightOn > 2) {
    uint64_t v28 = @"(unknown)";
  }
  else {
    uint64_t v28 = off_1E592A860[isBacklightOn];
  }
  char v64 = v28;
  unint64_t isInWaterLock = self->_isInWaterLock;
  if (isInWaterLock > 2) {
    uint64_t v30 = @"(unknown)";
  }
  else {
    uint64_t v30 = off_1E592A860[isInWaterLock];
  }
  char v63 = v30;
  unint64_t isInSleepLock = self->_isInSleepLock;
  if (isInSleepLock > 2) {
    uint64_t v32 = @"(unknown)";
  }
  else {
    uint64_t v32 = off_1E592A860[isInSleepLock];
  }
  char v62 = v32;
  unint64_t isInTheaterMode = self->_isInTheaterMode;
  if (isInTheaterMode > 2) {
    uint64_t v34 = @"(unknown)";
  }
  else {
    uint64_t v34 = off_1E592A860[isInTheaterMode];
  }
  char v61 = v34;
  unint64_t isOnWrist = self->_isOnWrist;
  if (isOnWrist > 2) {
    uint64_t v36 = @"(unknown)";
  }
  else {
    uint64_t v36 = off_1E592A860[isOnWrist];
  }
  uint64_t v37 = v36;
  unint64_t isUserEngagedWithDevice = self->_isUserEngagedWithDevice;
  if (isUserEngagedWithDevice > 2) {
    uint64_t v39 = @"(unknown)";
  }
  else {
    uint64_t v39 = off_1E592A860[isUserEngagedWithDevice];
  }
  uint64_t v40 = @"YES";
  if (userInitiatedWakeDetected) {
    uint64_t v41 = @"YES";
  }
  else {
    uint64_t v41 = @"NO";
  }
  if (liftToWakeDetected) {
    unint64_t v42 = @"YES";
  }
  else {
    unint64_t v42 = @"NO";
  }
  unsigned int v70 = v42;
  if (isInPocket) {
    uint64_t v43 = @"YES";
  }
  else {
    uint64_t v43 = @"NO";
  }
  unsigned int v72 = v43;
  if (isDeviceScreenON) {
    v44 = @"YES";
  }
  else {
    v44 = @"NO";
  }
  v74 = v44;
  if (isDeviceUnlocked) {
    v45 = @"YES";
  }
  else {
    v45 = @"NO";
  }
  v77 = v45;
  if (userTypedInSiri) {
    uint64_t v46 = @"YES";
  }
  else {
    uint64_t v46 = @"NO";
  }
  v79 = v46;
  if (isMediaPlaying) {
    uint64_t v47 = @"YES";
  }
  else {
    uint64_t v47 = @"NO";
  }
  v81 = v47;
  if (isFlexibleFollowup) {
    uint64_t v48 = @"YES";
  }
  else {
    uint64_t v48 = @"NO";
  }
  v83 = v48;
  if (isSiriAutoPrompt) {
    uint64_t v49 = @"YES";
  }
  else {
    uint64_t v49 = @"NO";
  }
  v85 = v49;
  if (isAudioAccessoryButtonActivation) {
    uint64_t v50 = @"YES";
  }
  else {
    uint64_t v50 = @"NO";
  }
  if (isRequestMadeWithPhysicalDeviceInteraction) {
    uint64_t v51 = @"YES";
  }
  else {
    uint64_t v51 = @"NO";
  }
  if (isConnectedToCarPlay) {
    uint64_t v52 = @"YES";
  }
  else {
    uint64_t v52 = @"NO";
  }
  if (isVoiceTriggerRequest) {
    uint64_t v53 = @"YES";
  }
  else {
    uint64_t v53 = @"NO";
  }
  if (isMapsNavigationActive) {
    char v54 = @"YES";
  }
  else {
    char v54 = @"NO";
  }
  if (isInAmbient) {
    char v55 = @"YES";
  }
  else {
    char v55 = @"NO";
  }
  if (isForCarDND) {
    char v56 = @"YES";
  }
  else {
    char v56 = @"NO";
  }
  if (isUIFree) {
    char v57 = @"YES";
  }
  else {
    char v57 = @"NO";
  }
  if (!isEyesFree) {
    uint64_t v40 = @"NO";
  }
  v87 = v40;
  char v60 = v57;
  char v58 = v39;
  v91 = objc_msgSend(v90, "initWithFormat:", @"%@ {BOOL isEyesFree = %@, isUIFree = %@, isForCarDND = %@, isInAmbient = %@, isMapsNavigationActive = %@, isVoiceTriggerRequest = %@, isConnectedToCarPlay = %@, isRequestMadeWithPhysicalDeviceInteraction = %@, isAudioAccessoryButtonActivation = %@, isSiriAutoPrompt = %@, isFlexibleFollowup = %@, isMediaPlaying = %@, userTypedInSiri = %@, modeOverrideValue = %@, isDeviceUnlocked = %@, isDeviceScreenON = %@, isInPocket = %@, liftToWakeDetected = %@, userInitiatedWakeDetected = %@, deviceMotion = %@, deviceRaised = %@, faceDetected = %@, touchScreenDetected = %@, buttonPressDetected = %@, flatDevicePosture = %@, deviceOrientation = %@, isInWorkout = %@, isBacklightOn = %@, isInWaterLock = %@, isInSleepLock = %@, isInTheaterMode = %@, isOnWrist = %@, isUserEngagedWithDevice = %@}", v96, v87, v60, v56, v55, v54, v53, v52, v51, v50, v85, v83, v81, v79, modeOverrideValue, v77,
                  v74,
                  v72,
                  v70,
                  v41,
                  v95,
                  v94,
                  v93,
                  v92,
                  v88,
                  v75,
                  v67,
                  v66,
                  v64,
                  v63,
                  v62,
                  v61,
                  v37,
                  v58);

  return v91;
}

- (id)description
{
  return [(AFModesConfiguration *)self _descriptionWithIndent:0];
}

- (AFModesConfiguration)initWithIsEyesFree:(BOOL)a3 isUIFree:(BOOL)a4 isForCarDND:(BOOL)a5 isInAmbient:(BOOL)a6 isMapsNavigationActive:(BOOL)a7 isVoiceTriggerRequest:(BOOL)a8 isConnectedToCarPlay:(BOOL)a9 isRequestMadeWithPhysicalDeviceInteraction:(BOOL)a10 isAudioAccessoryButtonActivation:(BOOL)a11 isSiriAutoPrompt:(BOOL)a12 isFlexibleFollowup:(BOOL)a13 isMediaPlaying:(BOOL)a14 userTypedInSiri:(BOOL)a15 modeOverrideValue:(id)a16 isDeviceUnlocked:(BOOL)a17 isDeviceScreenON:(BOOL)a18 isInPocket:(BOOL)a19 liftToWakeDetected:(BOOL)a20 userInitiatedWakeDetected:(BOOL)a21 deviceMotion:(int64_t)a22 deviceRaised:(int64_t)a23 faceDetected:(int64_t)a24 touchScreenDetected:(int64_t)a25 buttonPressDetected:(int64_t)a26 flatDevicePosture:(int64_t)a27 deviceOrientation:(int64_t)a28 isInWorkout:(int64_t)a29 isBacklightOn:(int64_t)a30 isInWaterLock:(int64_t)a31 isInSleepLock:(int64_t)a32 isInTheaterMode:(int64_t)a33 isOnWrist:(int64_t)a34 isUserEngagedWithDevice:(int64_t)a35
{
  id v37 = a16;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __612__AFModesConfiguration_initWithIsEyesFree_isUIFree_isForCarDND_isInAmbient_isMapsNavigationActive_isVoiceTriggerRequest_isConnectedToCarPlay_isRequestMadeWithPhysicalDeviceInteraction_isAudioAccessoryButtonActivation_isSiriAutoPrompt_isFlexibleFollowup_isMediaPlaying_userTypedInSiri_modeOverrideValue_isDeviceUnlocked_isDeviceScreenON_isInPocket_liftToWakeDetected_userInitiatedWakeDetected_deviceMotion_deviceRaised_faceDetected_touchScreenDetected_buttonPressDetected_flatDevicePosture_deviceOrientation_isInWorkout_isBacklightOn_isInWaterLock_isInSleepLock_isInTheaterMode_isOnWrist_isUserEngagedWithDevice___block_invoke;
  v46[3] = &unk_1E5928B00;
  BOOL v56 = a3;
  BOOL v57 = a4;
  BOOL v58 = a5;
  BOOL v59 = a6;
  BOOL v60 = a7;
  BOOL v61 = a8;
  BOOL v62 = a9;
  BOOL v63 = a10;
  BOOL v64 = a11;
  BOOL v65 = a12;
  BOOL v66 = a13;
  BOOL v67 = a14;
  BOOL v68 = a15;
  id v47 = v37;
  BOOL v69 = a17;
  BOOL v70 = a18;
  BOOL v71 = a19;
  BOOL v72 = a20;
  BOOL v73 = a21;
  long long v48 = *(_OWORD *)&a22;
  long long v49 = *(_OWORD *)&a24;
  long long v50 = *(_OWORD *)&a26;
  long long v51 = *(_OWORD *)&a28;
  long long v52 = *(_OWORD *)&a30;
  long long v53 = *(_OWORD *)&a32;
  int64_t v54 = a34;
  int64_t v55 = a35;
  id v38 = v37;
  uint64_t v39 = [(AFModesConfiguration *)self initWithBuilder:v46];

  return v39;
}

void __612__AFModesConfiguration_initWithIsEyesFree_isUIFree_isForCarDND_isInAmbient_isMapsNavigationActive_isVoiceTriggerRequest_isConnectedToCarPlay_isRequestMadeWithPhysicalDeviceInteraction_isAudioAccessoryButtonActivation_isSiriAutoPrompt_isFlexibleFollowup_isMediaPlaying_userTypedInSiri_modeOverrideValue_isDeviceUnlocked_isDeviceScreenON_isInPocket_liftToWakeDetected_userInitiatedWakeDetected_deviceMotion_deviceRaised_faceDetected_touchScreenDetected_buttonPressDetected_flatDevicePosture_deviceOrientation_isInWorkout_isBacklightOn_isInWaterLock_isInSleepLock_isInTheaterMode_isOnWrist_isUserEngagedWithDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 152);
  id v4 = a2;
  [v4 setIsEyesFree:v3];
  [v4 setIsUIFree:*(unsigned __int8 *)(a1 + 153)];
  [v4 setIsForCarDND:*(unsigned __int8 *)(a1 + 154)];
  [v4 setIsInAmbient:*(unsigned __int8 *)(a1 + 155)];
  [v4 setIsMapsNavigationActive:*(unsigned __int8 *)(a1 + 156)];
  [v4 setIsVoiceTriggerRequest:*(unsigned __int8 *)(a1 + 157)];
  [v4 setIsConnectedToCarPlay:*(unsigned __int8 *)(a1 + 158)];
  [v4 setIsRequestMadeWithPhysicalDeviceInteraction:*(unsigned __int8 *)(a1 + 159)];
  [v4 setIsAudioAccessoryButtonActivation:*(unsigned __int8 *)(a1 + 160)];
  [v4 setIsSiriAutoPrompt:*(unsigned __int8 *)(a1 + 161)];
  [v4 setIsFlexibleFollowup:*(unsigned __int8 *)(a1 + 162)];
  [v4 setIsMediaPlaying:*(unsigned __int8 *)(a1 + 163)];
  [v4 setUserTypedInSiri:*(unsigned __int8 *)(a1 + 164)];
  [v4 setModeOverrideValue:*(void *)(a1 + 32)];
  [v4 setIsDeviceUnlocked:*(unsigned __int8 *)(a1 + 165)];
  [v4 setIsDeviceScreenON:*(unsigned __int8 *)(a1 + 166)];
  [v4 setIsInPocket:*(unsigned __int8 *)(a1 + 167)];
  [v4 setLiftToWakeDetected:*(unsigned __int8 *)(a1 + 168)];
  [v4 setUserInitiatedWakeDetected:*(unsigned __int8 *)(a1 + 169)];
  [v4 setDeviceMotion:*(void *)(a1 + 40)];
  [v4 setDeviceRaised:*(void *)(a1 + 48)];
  [v4 setFaceDetected:*(void *)(a1 + 56)];
  [v4 setTouchScreenDetected:*(void *)(a1 + 64)];
  [v4 setButtonPressDetected:*(void *)(a1 + 72)];
  [v4 setFlatDevicePosture:*(void *)(a1 + 80)];
  [v4 setDeviceOrientation:*(void *)(a1 + 88)];
  [v4 setIsInWorkout:*(void *)(a1 + 96)];
  [v4 setIsBacklightOn:*(void *)(a1 + 104)];
  [v4 setIsInWaterLock:*(void *)(a1 + 112)];
  [v4 setIsInSleepLock:*(void *)(a1 + 120)];
  [v4 setIsInTheaterMode:*(void *)(a1 + 128)];
  [v4 setIsOnWrist:*(void *)(a1 + 136)];
  [v4 setIsUserEngagedWithDevice:*(void *)(a1 + 144)];
}

- (AFModesConfiguration)init
{
  return [(AFModesConfiguration *)self initWithBuilder:0];
}

- (AFModesConfiguration)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFModesConfigurationMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFModesConfiguration;
  uint64_t v5 = [(AFModesConfiguration *)&v12 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFModesConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFModesConfigurationMutation *)v7 isDirty])
    {
      v6->_BOOL isEyesFree = [(_AFModesConfigurationMutation *)v7 getIsEyesFree];
      v6->_BOOL isUIFree = [(_AFModesConfigurationMutation *)v7 getIsUIFree];
      v6->_BOOL isForCarDND = [(_AFModesConfigurationMutation *)v7 getIsForCarDND];
      v6->_BOOL isInAmbient = [(_AFModesConfigurationMutation *)v7 getIsInAmbient];
      v6->_BOOL isMapsNavigationActive = [(_AFModesConfigurationMutation *)v7 getIsMapsNavigationActive];
      v6->_BOOL isVoiceTriggerRequest = [(_AFModesConfigurationMutation *)v7 getIsVoiceTriggerRequest];
      v6->_BOOL isConnectedToCarPlay = [(_AFModesConfigurationMutation *)v7 getIsConnectedToCarPlay];
      v6->_BOOL isRequestMadeWithPhysicalDeviceInteraction = [(_AFModesConfigurationMutation *)v7 getIsRequestMadeWithPhysicalDeviceInteraction];
      v6->_BOOL isAudioAccessoryButtonActivation = [(_AFModesConfigurationMutation *)v7 getIsAudioAccessoryButtonActivation];
      v6->_BOOL isSiriAutoPrompt = [(_AFModesConfigurationMutation *)v7 getIsSiriAutoPrompt];
      v6->_BOOL isFlexibleFollowup = [(_AFModesConfigurationMutation *)v7 getIsFlexibleFollowup];
      v6->_BOOL isMediaPlaying = [(_AFModesConfigurationMutation *)v7 getIsMediaPlaying];
      v6->_BOOL userTypedInSiri = [(_AFModesConfigurationMutation *)v7 getUserTypedInSiri];
      uint64_t v8 = [(_AFModesConfigurationMutation *)v7 getModeOverrideValue];
      uint64_t v9 = [v8 copy];
      modeOverrideValue = v6->_modeOverrideValue;
      v6->_modeOverrideValue = (NSString *)v9;

      v6->_BOOL isDeviceUnlocked = [(_AFModesConfigurationMutation *)v7 getIsDeviceUnlocked];
      v6->_BOOL isDeviceScreenON = [(_AFModesConfigurationMutation *)v7 getIsDeviceScreenON];
      v6->_BOOL isInPocket = [(_AFModesConfigurationMutation *)v7 getIsInPocket];
      v6->_BOOL liftToWakeDetected = [(_AFModesConfigurationMutation *)v7 getLiftToWakeDetected];
      v6->_BOOL userInitiatedWakeDetected = [(_AFModesConfigurationMutation *)v7 getUserInitiatedWakeDetected];
      v6->_unint64_t deviceMotion = [(_AFModesConfigurationMutation *)v7 getDeviceMotion];
      v6->_unint64_t deviceRaised = [(_AFModesConfigurationMutation *)v7 getDeviceRaised];
      v6->_unint64_t faceDetected = [(_AFModesConfigurationMutation *)v7 getFaceDetected];
      v6->_unint64_t touchScreenDetected = [(_AFModesConfigurationMutation *)v7 getTouchScreenDetected];
      v6->_unint64_t buttonPressDetected = [(_AFModesConfigurationMutation *)v7 getButtonPressDetected];
      v6->_unint64_t flatDevicePosture = [(_AFModesConfigurationMutation *)v7 getFlatDevicePosture];
      v6->_unint64_t deviceOrientation = [(_AFModesConfigurationMutation *)v7 getDeviceOrientation];
      v6->_unint64_t isInWorkout = [(_AFModesConfigurationMutation *)v7 getIsInWorkout];
      v6->_unint64_t isBacklightOn = [(_AFModesConfigurationMutation *)v7 getIsBacklightOn];
      v6->_unint64_t isInWaterLock = [(_AFModesConfigurationMutation *)v7 getIsInWaterLock];
      v6->_unint64_t isInSleepLock = [(_AFModesConfigurationMutation *)v7 getIsInSleepLock];
      v6->_unint64_t isInTheaterMode = [(_AFModesConfigurationMutation *)v7 getIsInTheaterMode];
      v6->_unint64_t isOnWrist = [(_AFModesConfigurationMutation *)v7 getIsOnWrist];
      v6->_unint64_t isUserEngagedWithDevice = [(_AFModesConfigurationMutation *)v7 getIsUserEngagedWithDevice];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFModesConfigurationMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFModesConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFModesConfigurationMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFModesConfiguration);
      v6->_BOOL isEyesFree = [(_AFModesConfigurationMutation *)v5 getIsEyesFree];
      v6->_BOOL isUIFree = [(_AFModesConfigurationMutation *)v5 getIsUIFree];
      v6->_BOOL isForCarDND = [(_AFModesConfigurationMutation *)v5 getIsForCarDND];
      v6->_BOOL isInAmbient = [(_AFModesConfigurationMutation *)v5 getIsInAmbient];
      v6->_BOOL isMapsNavigationActive = [(_AFModesConfigurationMutation *)v5 getIsMapsNavigationActive];
      v6->_BOOL isVoiceTriggerRequest = [(_AFModesConfigurationMutation *)v5 getIsVoiceTriggerRequest];
      v6->_BOOL isConnectedToCarPlay = [(_AFModesConfigurationMutation *)v5 getIsConnectedToCarPlay];
      v6->_BOOL isRequestMadeWithPhysicalDeviceInteraction = [(_AFModesConfigurationMutation *)v5 getIsRequestMadeWithPhysicalDeviceInteraction];
      v6->_BOOL isAudioAccessoryButtonActivation = [(_AFModesConfigurationMutation *)v5 getIsAudioAccessoryButtonActivation];
      v6->_BOOL isSiriAutoPrompt = [(_AFModesConfigurationMutation *)v5 getIsSiriAutoPrompt];
      v6->_BOOL isFlexibleFollowup = [(_AFModesConfigurationMutation *)v5 getIsFlexibleFollowup];
      v6->_BOOL isMediaPlaying = [(_AFModesConfigurationMutation *)v5 getIsMediaPlaying];
      v6->_BOOL userTypedInSiri = [(_AFModesConfigurationMutation *)v5 getUserTypedInSiri];
      uint64_t v7 = [(_AFModesConfigurationMutation *)v5 getModeOverrideValue];
      uint64_t v8 = [v7 copy];
      modeOverrideValue = v6->_modeOverrideValue;
      v6->_modeOverrideValue = (NSString *)v8;

      v6->_BOOL isDeviceUnlocked = [(_AFModesConfigurationMutation *)v5 getIsDeviceUnlocked];
      v6->_BOOL isDeviceScreenON = [(_AFModesConfigurationMutation *)v5 getIsDeviceScreenON];
      v6->_BOOL isInPocket = [(_AFModesConfigurationMutation *)v5 getIsInPocket];
      v6->_BOOL liftToWakeDetected = [(_AFModesConfigurationMutation *)v5 getLiftToWakeDetected];
      v6->_BOOL userInitiatedWakeDetected = [(_AFModesConfigurationMutation *)v5 getUserInitiatedWakeDetected];
      v6->_unint64_t deviceMotion = [(_AFModesConfigurationMutation *)v5 getDeviceMotion];
      v6->_unint64_t deviceRaised = [(_AFModesConfigurationMutation *)v5 getDeviceRaised];
      v6->_unint64_t faceDetected = [(_AFModesConfigurationMutation *)v5 getFaceDetected];
      v6->_unint64_t touchScreenDetected = [(_AFModesConfigurationMutation *)v5 getTouchScreenDetected];
      v6->_unint64_t buttonPressDetected = [(_AFModesConfigurationMutation *)v5 getButtonPressDetected];
      v6->_unint64_t flatDevicePosture = [(_AFModesConfigurationMutation *)v5 getFlatDevicePosture];
      v6->_unint64_t deviceOrientation = [(_AFModesConfigurationMutation *)v5 getDeviceOrientation];
      v6->_unint64_t isInWorkout = [(_AFModesConfigurationMutation *)v5 getIsInWorkout];
      v6->_unint64_t isBacklightOn = [(_AFModesConfigurationMutation *)v5 getIsBacklightOn];
      v6->_unint64_t isInWaterLock = [(_AFModesConfigurationMutation *)v5 getIsInWaterLock];
      v6->_unint64_t isInSleepLock = [(_AFModesConfigurationMutation *)v5 getIsInSleepLock];
      v6->_unint64_t isInTheaterMode = [(_AFModesConfigurationMutation *)v5 getIsInTheaterMode];
      v6->_unint64_t isOnWrist = [(_AFModesConfigurationMutation *)v5 getIsOnWrist];
      v6->_unint64_t isUserEngagedWithDevice = [(_AFModesConfigurationMutation *)v5 getIsUserEngagedWithDevice];
    }
    else
    {
      uint64_t v6 = (AFModesConfiguration *)[(AFModesConfiguration *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFModesConfiguration *)[(AFModesConfiguration *)self copy];
  }

  return v6;
}

@end