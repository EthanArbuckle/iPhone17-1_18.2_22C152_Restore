@interface LBLocalSpeechRecognitionSettings
+ (BOOL)supportsSecureCoding;
+ (id)getTaskStringFromSpeechRecognitionSettings:(id)a3;
+ (id)taskString:(unint64_t)a3;
- (AFPowerContextPolicy)powerContext;
- (BOOL)continuousListening;
- (BOOL)deliverEagerPackage;
- (BOOL)detectUtterances;
- (BOOL)enableAutoPunctuation;
- (BOOL)enableEmojiRecognition;
- (BOOL)enableVoiceCommands;
- (BOOL)secureOfflineOnly;
- (BOOL)shouldGenerateVoiceCommandCandidates;
- (BOOL)shouldHandleCapitalization;
- (BOOL)shouldStartAudioCapture;
- (BOOL)shouldStoreAudioOnDevice;
- (CLLocation)location;
- (LBLocalSpeechRecognitionSettings)initWithCoder:(id)a3;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26 powerContext:(id)a27;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32 shouldGenerateVoiceCommandCandidates:(BOOL)a33;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32 shouldGenerateVoiceCommandCandidates:(BOOL)a33 asrLocale:(id)a34;
- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26 powerContext:(id)a27 shouldStartAudioCapture:(BOOL)a28 audioCaptureStartHostTime:(unint64_t)a29 audioRecordType:(int64_t)a30 audioRecordDeviceId:(id)a31 shouldGenerateVoiceCommandCandidates:(BOOL)a32 asrLocale:(id)a33;
- (NSArray)jitGrammar;
- (NSArray)sharedUserInfos;
- (NSDictionary)recognitionOverrides;
- (NSString)UILanguage;
- (NSString)applicationName;
- (NSString)asrLocale;
- (NSString)audioRecordDeviceId;
- (NSString)dictationUIInteractionId;
- (NSString)inputOrigin;
- (NSString)overrideModelPath;
- (NSString)postfixText;
- (NSString)prefixText;
- (NSString)requestId;
- (NSString)selectedText;
- (double)maximumRecognitionDuration;
- (id)description;
- (int64_t)audioRecordType;
- (unint64_t)audioCaptureStartHostTime;
- (unint64_t)speechRecognitionMode;
- (unint64_t)speechRecognitionTask;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LBLocalSpeechRecognitionSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrLocale, 0);
  objc_storeStrong((id *)&self->_audioRecordDeviceId, 0);
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_sharedUserInfos, 0);
  objc_storeStrong((id *)&self->_dictationUIInteractionId, 0);
  objc_storeStrong((id *)&self->_UILanguage, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_overrideModelPath, 0);
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

- (NSString)asrLocale
{
  return self->_asrLocale;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (NSString)audioRecordDeviceId
{
  return self->_audioRecordDeviceId;
}

- (int64_t)audioRecordType
{
  return self->_audioRecordType;
}

- (unint64_t)audioCaptureStartHostTime
{
  return self->_audioCaptureStartHostTime;
}

- (BOOL)shouldStartAudioCapture
{
  return self->_shouldStartAudioCapture;
}

- (AFPowerContextPolicy)powerContext
{
  return self->_powerContext;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (NSArray)sharedUserInfos
{
  return self->_sharedUserInfos;
}

- (NSString)dictationUIInteractionId
{
  return self->_dictationUIInteractionId;
}

- (BOOL)enableVoiceCommands
{
  return self->_enableVoiceCommands;
}

- (NSString)UILanguage
{
  return self->_UILanguage;
}

- (BOOL)enableAutoPunctuation
{
  return self->_enableAutoPunctuation;
}

- (BOOL)enableEmojiRecognition
{
  return self->_enableEmojiRecognition;
}

- (BOOL)deliverEagerPackage
{
  return self->_deliverEagerPackage;
}

- (BOOL)shouldStoreAudioOnDevice
{
  return self->_shouldStoreAudioOnDevice;
}

- (NSDictionary)recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (BOOL)shouldHandleCapitalization
{
  return self->_shouldHandleCapitalization;
}

- (BOOL)continuousListening
{
  return self->_continuousListening;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSString)overrideModelPath
{
  return self->_overrideModelPath;
}

- (NSArray)jitGrammar
{
  return self->_jitGrammar;
}

- (CLLocation)location
{
  return self->_location;
}

- (unint64_t)speechRecognitionMode
{
  return self->_speechRecognitionMode;
}

- (unint64_t)speechRecognitionTask
{
  return self->_speechRecognitionTask;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)encodeWithCoder:(id)a3
{
  requestId = self->_requestId;
  id v21 = a3;
  [v21 encodeObject:requestId forKey:@"LBLocalSpeechRecognitionSettings:::requestId"];
  [v21 encodeObject:self->_inputOrigin forKey:@"LBLocalSpeechRecognitionSettings:::inputOrigin"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_speechRecognitionTask];
  [v21 encodeObject:v5 forKey:@"LBLocalSpeechRecognitionSettings:::task"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_speechRecognitionMode];
  [v21 encodeObject:v6 forKey:@"LBLocalSpeechRecognitionSettings:::mode"];

  [v21 encodeObject:self->_location forKey:@"LBLocalSpeechRecognitionSettings:::location"];
  [v21 encodeObject:self->_jitGrammar forKey:@"LBLocalSpeechRecognitionSettings:::jitGrammar"];
  [v21 encodeObject:self->_overrideModelPath forKey:@"LBLocalSpeechRecognitionSettings:::overrideModelPath"];
  [v21 encodeObject:self->_applicationName forKey:@"LBLocalSpeechRecognitionSettings:::applicationName"];
  v7 = [NSNumber numberWithBool:self->_detectUtterances];
  [v21 encodeObject:v7 forKey:@"LBLocalSpeechRecognitionSettings:::detectUtterances"];

  v8 = [NSNumber numberWithBool:self->_continuousListening];
  [v21 encodeObject:v8 forKey:@"LBLocalSpeechRecognitionSettings:::continuousListening"];

  v9 = [NSNumber numberWithBool:self->_shouldHandleCapitalization];
  [v21 encodeObject:v9 forKey:@"LBLocalSpeechRecognitionSettings:::shouldHandleCapitalization"];

  v10 = [NSNumber numberWithBool:self->_secureOfflineOnly];
  [v21 encodeObject:v10 forKey:@"LBLocalSpeechRecognitionSettings:::secureOfflineOnly"];

  v11 = [NSNumber numberWithDouble:self->_maximumRecognitionDuration];
  [v21 encodeObject:v11 forKey:@"LBLocalSpeechRecognitionSettings:::maxRecognitionDuration"];

  [v21 encodeObject:self->_recognitionOverrides forKey:@"LBLocalSpeechRecognitionSettings:::recognitionOverrides"];
  v12 = [NSNumber numberWithBool:self->_shouldStoreAudioOnDevice];
  [v21 encodeObject:v12 forKey:@"LBLocalSpeechRecognitionSettings:::shouldStoreAudioOnDevice"];

  v13 = [NSNumber numberWithBool:self->_deliverEagerPackage];
  [v21 encodeObject:v13 forKey:@"LBLocalSpeechRecognitionSettings:::deliverEagerPackage"];

  [v21 encodeObject:self->_UILanguage forKey:@"LBLocalSpeechRecognitionSettings:::UILanguage"];
  v14 = [NSNumber numberWithBool:self->_enableEmojiRecognition];
  [v21 encodeObject:v14 forKey:@"LBLocalSpeechRecognitionSettings:::enableEmojiRecognition"];

  v15 = [NSNumber numberWithBool:self->_enableAutoPunctuation];
  [v21 encodeObject:v15 forKey:@"LBLocalSpeechRecognitionSettings:::enableAutoPunctuation"];

  v16 = [NSNumber numberWithBool:self->_enableVoiceCommands];
  [v21 encodeObject:v16 forKey:@"LBLocalSpeechRecognitionSettings:::enableVoiceCommands"];

  [v21 encodeObject:self->_dictationUIInteractionId forKey:@"LBLocalSpeechRecognitionSettings:::dictationUIInteractionId"];
  [v21 encodeObject:self->_sharedUserInfos forKey:@"LBLocalSpeechRecognitionSettings:::sharedUserInfos"];
  [v21 encodeObject:self->_prefixText forKey:@"LBLocalSpeechRecognitionSettings:::prefixText"];
  [v21 encodeObject:self->_postfixText forKey:@"LBLocalSpeechRecognitionSettings:::postfixText"];
  [v21 encodeObject:self->_selectedText forKey:@"LBLocalSpeechRecognitionSettings:::selectedText"];
  [v21 encodeObject:self->_powerContext forKey:@"LBLocalSpeechRecognitionSettings:::powerContext"];
  v17 = [NSNumber numberWithBool:self->_shouldStartAudioCapture];
  [v21 encodeObject:v17 forKey:@"LBLocalSpeechRecognitionSettings:::shouldStartAudioCapture"];

  v18 = [NSNumber numberWithLongLong:self->_audioRecordType];
  [v21 encodeObject:v18 forKey:@"LBLocalSpeechRecognitionSettings:::audioRecordType"];

  v19 = [NSNumber numberWithUnsignedLongLong:self->_audioCaptureStartHostTime];
  [v21 encodeObject:v19 forKey:@"LBLocalSpeechRecognitionSettings:::audioCaptureStartHostTime"];

  [v21 encodeObject:self->_audioRecordDeviceId forKey:@"LBLocalSpeechRecognitionSettings:::audioRecordDeviceId"];
  v20 = [NSNumber numberWithBool:self->_shouldGenerateVoiceCommandCandidates];
  [v21 encodeObject:v20 forKey:@"LBLocalSpeechRecognitionSettings:::shouldGenerateVoiceCommandCandidates"];

  [v21 encodeObject:self->_asrLocale forKey:@"LBLocalSpeechRecognitionSettings:::asrLocale"];
}

- (LBLocalSpeechRecognitionSettings)initWithCoder:(id)a3
{
  id v3 = a3;
  v68 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::requestId"];
  v67 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::inputOrigin"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::task"];
  uint64_t v62 = [v4 unsignedIntegerValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::mode"];
  uint64_t v61 = [v5 unsignedIntegerValue];

  v66 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::location"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v60 = [v3 decodeObjectOfClasses:v8 forKey:@"LBLocalSpeechRecognitionSettings:::jitGrammar"];

  v65 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::overrideModelPath"];
  v55 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::applicationName"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::detectUtterances"];
  char v59 = [v9 BOOLValue];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::continuousListening"];
  char v58 = [v10 BOOLValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::shouldHandleCapitalization"];
  char v57 = [v11 BOOLValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::secureOfflineOnly"];
  char v56 = [v12 BOOLValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::maxRecognitionDuration"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v54 = [v3 decodeObjectOfClasses:v18 forKey:@"LBLocalSpeechRecognitionSettings:::recognitionOverrides"];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::shouldStoreAudioOnDevice"];
  char v53 = [v19 BOOLValue];

  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::deliverEagerPackage"];
  char v52 = [v20 BOOLValue];

  v49 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::UILanguage"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::enableEmojiRecognition"];
  char v51 = [v21 BOOLValue];

  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::enableAutoPunctuation"];
  char v50 = [v22 BOOLValue];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::enableVoiceCommands"];
  char v48 = [v23 BOOLValue];

  v47 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::dictationUIInteractionId"];
  v24 = (void *)MEMORY[0x263EFFA08];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v46 = [v3 decodeObjectOfClasses:v26 forKey:@"LBLocalSpeechRecognitionSettings:::sharedUserInfos"];

  v45 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::prefixText"];
  v43 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::postfixText"];
  v44 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::selectedText"];
  v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::powerContext"];
  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::shouldStartAudioCapture"];
  char v29 = [v28 BOOLValue];

  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::audioRecordType"];
  uint64_t v31 = [v30 longLongValue];

  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::audioCaptureStartHostTime"];
  uint64_t v33 = [v32 unsignedLongLongValue];

  v42 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::audioRecordDeviceId"];
  v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::shouldGenerateVoiceCommandCandidates"];
  LOBYTE(v25) = [v34 BOOLValue];

  v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LBLocalSpeechRecognitionSettings:::asrLocale"];

  LOBYTE(v41) = v25;
  LOBYTE(v40) = v29;
  LOBYTE(v39) = v48;
  BYTE3(v38) = v50;
  BYTE2(v38) = v51;
  BYTE1(v38) = v52;
  LOBYTE(v38) = v53;
  BYTE3(v37) = v56;
  BYTE2(v37) = v57;
  BYTE1(v37) = v58;
  LOBYTE(v37) = v59;
  v64 = -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:", v68, v67, v62, v61, v66, v60, v15, v65, v55, v37, v54, v38,
          v49,
          v39,
          v47,
          v46,
          v45,
          v43,
          v44,
          v27,
          v40,
          v33,
          v31,
          v42,
          v41,
          v35);

  return v64;
}

- (id)description
{
  id v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"[inputOrigin = %@]", self->_inputOrigin];
  objc_msgSend(v3, "appendFormat:", @"[speechRecognitionTask = %lu]", self->_speechRecognitionTask);
  objc_msgSend(v3, "appendFormat:", @"[speechRecognitionMode = %lu]", self->_speechRecognitionMode);
  [v3 appendFormat:@"[applicationName = %@]", self->_applicationName];
  if (self->_detectUtterances) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v3 appendFormat:@"[detectUtterances = %@]", v4];
  if (self->_continuousListening) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"[continuousListening = %@]", v5];
  if (self->_shouldHandleCapitalization) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"[shouldHandleCapitalization = %@]", v6];
  if (self->_secureOfflineOnly) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  [v3 appendFormat:@"[secureOfflineOnly = %@]", v7];
  objc_msgSend(v3, "appendFormat:", @"[maximumRecognitionDuration = %f]", *(void *)&self->_maximumRecognitionDuration);
  if (self->_location) {
    v8 = "present";
  }
  else {
    v8 = "nil";
  }
  objc_msgSend(v3, "appendFormat:", @"[location = %s]", v8);
  [v3 appendFormat:@"[overrides = %@]", self->_recognitionOverrides];
  [v3 appendFormat:@"[jitGrammar = %@]", self->_jitGrammar];
  [v3 appendFormat:@"[overrideModelPath = %@]", self->_overrideModelPath];
  if (self->_shouldStoreAudioOnDevice) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 appendFormat:@"[shouldStoreAudioOnDevice = %@]", v9];
  if (self->_deliverEagerPackage) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 appendFormat:@"[deliverEagerPackage = %@]", v10];
  [v3 appendFormat:@"[UILanguage = %@]", self->_UILanguage];
  if (self->_enableEmojiRecognition) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v3 appendFormat:@"[enableEmojiRecognition = %@]", v11];
  if (self->_enableAutoPunctuation) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 appendFormat:@"[enableAutoPunctuation = %@]", v12];
  if (self->_enableVoiceCommands) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 appendFormat:@"[enableVoiceCommands = %@]", v13];
  [v3 appendFormat:@"[sharedUserInfos = %@]", self->_sharedUserInfos];
  if (self->_prefixText) {
    double v14 = @"REDACTED";
  }
  else {
    double v14 = 0;
  }
  [v3 appendFormat:@"[prefixText = %@]", v14];
  if (self->_postfixText) {
    double v15 = @"REDACTED";
  }
  else {
    double v15 = 0;
  }
  [v3 appendFormat:@"[postfixText = %@]", v15];
  if (self->_selectedText) {
    v16 = @"REDACTED";
  }
  else {
    v16 = 0;
  }
  [v3 appendFormat:@"[selectedText = %@]", v16];
  [v3 appendFormat:@"[powerContext = %@]", self->_powerContext];
  if (self->_shouldStartAudioCapture) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  [v3 appendFormat:@"[shouldStartAudioCapture = %@]", v17];
  objc_msgSend(v3, "appendFormat:", @"[audioRecordType] = %lld]", self->_audioRecordType);
  objc_msgSend(v3, "appendFormat:", @"[audioStartHostTime = %llu", self->_audioCaptureStartHostTime);
  [v3 appendFormat:@"[deviceId = %@]", self->_audioRecordDeviceId];
  if (self->_shouldGenerateVoiceCommandCandidates) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  [v3 appendFormat:@"[shouldGenerateVoiceCommandCandidates = %@]", v18];
  [v3 appendFormat:@"[asrLocale = %@]", self->_asrLocale];
  return v3;
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32 shouldGenerateVoiceCommandCandidates:(BOOL)a33 asrLocale:(id)a34
{
  id v76 = a3;
  id v75 = a4;
  id v74 = a7;
  id v73 = a8;
  id v72 = a9;
  id v71 = a10;
  id v38 = a16;
  id v39 = a21;
  id v40 = a23;
  id v41 = a24;
  id v42 = a25;
  id v43 = a26;
  id v44 = a27;
  id v45 = a28;
  id v69 = a32;
  id v70 = a34;
  v77.receiver = self;
  v77.super_class = (Class)LBLocalSpeechRecognitionSettings;
  v46 = [(LBLocalSpeechRecognitionSettings *)&v77 init];
  if (v46)
  {
    uint64_t v47 = [v76 copy];
    requestId = v46->_requestId;
    v46->_requestId = (NSString *)v47;

    uint64_t v49 = [v75 copy];
    inputOrigin = v46->_inputOrigin;
    v46->_inputOrigin = (NSString *)v49;

    v46->_speechRecognitionTask = a5;
    v46->_speechRecognitionMode = a6;
    uint64_t v51 = [v74 copy];
    location = v46->_location;
    v46->_location = (CLLocation *)v51;

    uint64_t v53 = [v73 copy];
    jitGrammar = v46->_jitGrammar;
    v46->_jitGrammar = (NSArray *)v53;

    uint64_t v55 = [v72 copy];
    overrideModelPath = v46->_overrideModelPath;
    v46->_overrideModelPath = (NSString *)v55;

    uint64_t v57 = [v71 copy];
    applicationName = v46->_applicationName;
    v46->_applicationName = (NSString *)v57;

    v46->_detectUtterances = a11;
    v46->_continuousListening = a12;
    v46->_shouldHandleCapitalization = a13;
    v46->_secureOfflineOnly = a14;
    v46->_maximumRecognitionDuration = a15;
    uint64_t v59 = [v38 copy];
    recognitionOverrides = v46->_recognitionOverrides;
    v46->_recognitionOverrides = (NSDictionary *)v59;

    v46->_shouldStoreAudioOnDevice = a17;
    v46->_deliverEagerPackage = a18;
    objc_storeStrong((id *)&v46->_UILanguage, a21);
    v46->_enableEmojiRecognition = a19;
    v46->_enableAutoPunctuation = a20;
    v46->_enableVoiceCommands = a22;
    objc_storeStrong((id *)&v46->_dictationUIInteractionId, a23);
    uint64_t v61 = [v41 copy];
    sharedUserInfos = v46->_sharedUserInfos;
    v46->_sharedUserInfos = (NSArray *)v61;

    objc_storeStrong((id *)&v46->_prefixText, a25);
    objc_storeStrong((id *)&v46->_postfixText, a26);
    objc_storeStrong((id *)&v46->_selectedText, a27);
    objc_storeStrong((id *)&v46->_powerContext, a28);
    v46->_shouldStartAudioCapture = a29;
    v46->_audioCaptureStartHostTime = a30;
    v46->_audioRecordType = a31;
    objc_storeStrong((id *)&v46->_audioRecordDeviceId, a32);
    v46->_shouldGenerateVoiceCommandCandidates = a33;
    uint64_t v63 = [v70 copy];
    asrLocale = v46->_asrLocale;
    v46->_asrLocale = (NSString *)v63;
  }
  return v46;
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26 powerContext:(id)a27 shouldStartAudioCapture:(BOOL)a28 audioCaptureStartHostTime:(unint64_t)a29 audioRecordType:(int64_t)a30 audioRecordDeviceId:(id)a31 shouldGenerateVoiceCommandCandidates:(BOOL)a32 asrLocale:(id)a33
{
  LOBYTE(v38) = a32;
  LOBYTE(v37) = a28;
  LOBYTE(v36) = a21;
  WORD1(v35) = __PAIR16__(a20, a19);
  LOWORD(v35) = __PAIR16__(a18, a17);
  WORD1(v34) = __PAIR16__(a14, a13);
  LOWORD(v34) = __PAIR16__(a12, a11);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:", a3, a4, a5, a6, a7, a8, a15, a9, a10, v34, a16, v35,
           0,
           v36,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v37,
           a29,
           a30,
           a31,
           v38,
           a33);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32 shouldGenerateVoiceCommandCandidates:(BOOL)a33
{
  LOBYTE(v38) = a33;
  LOBYTE(v37) = a29;
  LOBYTE(v36) = a22;
  WORD1(v35) = __PAIR16__(a20, a19);
  LOWORD(v35) = __PAIR16__(a18, a17);
  WORD1(v34) = __PAIR16__(a14, a13);
  LOWORD(v34) = __PAIR16__(a12, a11);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:", a3, a4, a5, a6, a7, a8, a15, a9, a10, v34, a16, v35,
           a21,
           v36,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           v37,
           a30,
           a31,
           a32,
           v38,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32
{
  LOBYTE(v37) = 0;
  LOBYTE(v36) = a29;
  LOBYTE(v35) = a22;
  WORD1(v34) = __PAIR16__(a20, a19);
  LOWORD(v34) = __PAIR16__(a18, a17);
  WORD1(v33) = __PAIR16__(a14, a13);
  LOWORD(v33) = __PAIR16__(a12, a11);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:", a3, a4, a5, a6, a7, a8, a15, a9, a10, v33, a16, v34,
           a21,
           v35,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           v36,
           a30,
           a31,
           a32,
           v37);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26 powerContext:(id)a27
{
  LOBYTE(v31) = 0;
  LOBYTE(v30) = a21;
  WORD1(v29) = __PAIR16__(a19, a18);
  LOWORD(v29) = __PAIR16__(a17, a16);
  WORD1(v28) = __PAIR16__(a13, a12);
  LOWORD(v28) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:", a3, a4, a5, 0, a6, a7, a14, a8, a9, v28, a15, v29, a20,
           v30,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v31,
           0,
           0,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26
{
  LOBYTE(v29) = a21;
  WORD1(v28) = __PAIR16__(a19, a18);
  LOWORD(v28) = __PAIR16__(a17, a16);
  WORD1(v27) = __PAIR16__(a13, a12);
  LOWORD(v27) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a14, a9, v27, a15, v28, a20, v29, a22,
           a23,
           a24,
           a25,
           a26,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23
{
  LOBYTE(v26) = a21;
  WORD1(v25) = __PAIR16__(a19, a18);
  LOWORD(v25) = __PAIR16__(a17, a16);
  WORD1(v24) = __PAIR16__(a13, a12);
  LOWORD(v24) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:", a3, a4, a5, a6, a7, a8, a14, a9, v24, a15, v25, a20, v26, a22,
           a23,
           0,
           0,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23
{
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:", a3, a4, a5, a6, a7, a8, a14);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22
{
  LOBYTE(v26) = a22;
  LOWORD(v25) = __PAIR16__(a20, a19);
  LOWORD(v24) = __PAIR16__(a17, a16);
  WORD1(v23) = __PAIR16__(a13, a12);
  LOWORD(v23) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:", a3, a4, a5, a6, a7, a8, a14, a9, v23, a15, v24, a18, v25, a21,
           v26,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21
{
  LOBYTE(v25) = 0;
  LOWORD(v24) = __PAIR16__(a20, a19);
  LOWORD(v23) = __PAIR16__(a17, a16);
  WORD1(v22) = __PAIR16__(a13, a12);
  LOWORD(v22) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:", a3, a4, a5, a6, a7, a8, a14, a9, v22, a15, v23, a18, v24, a21,
           v25);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20
{
  LOWORD(v23) = __PAIR16__(a20, a19);
  LOWORD(v22) = __PAIR16__(a17, a16);
  WORD1(v21) = __PAIR16__(a13, a12);
  LOWORD(v21) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:", a3, a4, a5, a6, a7, a8, a14, a9, v21, a15, v22, a18, v23, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18
{
  LOWORD(v21) = 0;
  LOWORD(v20) = __PAIR16__(a17, a16);
  WORD1(v19) = __PAIR16__(a13, a12);
  LOWORD(v19) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:", a3, a4, a5, a6, a7, a8, a14, a9, v19, a15, v20, a18, v21);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17
{
  LOWORD(v19) = __PAIR16__(a17, a16);
  WORD1(v18) = __PAIR16__(a13, a12);
  LOWORD(v18) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:", a3, a4, a5, a6, a7, a8, a14, a9, v18, a15, v19, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16
{
  BYTE1(v18) = 1;
  LOBYTE(v18) = a16;
  WORD1(v17) = __PAIR16__(a13, a12);
  LOWORD(v17) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:", a3, a4, a5, a6, a7, a8, a14, a9, v17, a15, v18);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15
{
  LOBYTE(v17) = 1;
  WORD1(v16) = __PAIR16__(a13, a12);
  LOWORD(v16) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:", a3, a4, a5, a6, a7, a8, a14, a9, v16, a15, v17);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8
{
  LODWORD(v9) = 0;
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:", a3, a4, a5, a6, a7, a8, 60.0, 0, v9, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7
{
  return [(LBLocalSpeechRecognitionSettings *)self initWithRequestId:a3 inputOrigin:a4 speechRecognitionTaskName:a5 location:a6 jitGrammar:a7 overrideModelPath:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)getTaskStringFromSpeechRecognitionSettings:(id)a3
{
  if (a3) {
    uint64_t v3 = [a3 speechRecognitionTask];
  }
  else {
    uint64_t v3 = 1;
  }
  return +[LBLocalSpeechRecognitionSettings taskString:v3];
}

+ (id)taskString:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_264522170[a3];
  }
}

@end