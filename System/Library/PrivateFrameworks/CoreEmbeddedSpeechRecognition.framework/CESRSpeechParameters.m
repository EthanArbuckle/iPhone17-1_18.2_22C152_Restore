@interface CESRSpeechParameters
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFPowerContextPolicy)powerContext;
- (BOOL)censorSpeech;
- (BOOL)continuousListening;
- (BOOL)deliverEagerPackage;
- (BOOL)detectUtterances;
- (BOOL)disableDeliveringAsrFeatures;
- (BOOL)enableAutoPunctuation;
- (BOOL)enableEmojiRecognition;
- (BOOL)enableVoiceCommands;
- (BOOL)farField;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpeechAPIRequest;
- (BOOL)narrowband;
- (BOOL)secureOfflineOnly;
- (BOOL)shouldGenerateVoiceCommandCandidates;
- (BOOL)shouldHandleCapitalization;
- (BOOL)shouldStoreAudioOnDevice;
- (CESRSpeechParameters)initWithCoder:(id)a3;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38 shouldGenerateVoiceCommandCandidates:(BOOL)a39;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38 shouldGenerateVoiceCommandCandidates:(BOOL)a39 asrId:(id)a40;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 sharedUserIds:(id)a30 enableEmojiRecognition:(BOOL)a31 enableAutoPunctuation:(BOOL)a32;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 sharedUserIds:(id)a30 enableEmojiRecognition:(BOOL)a31 enableAutoPunctuation:(BOOL)a32 enableVoiceCommands:(BOOL)a33;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 interactionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29;
- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 interactionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 maximumRecognitionDuration:(double)a22 endpointStart:(double)a23 inputOrigin:(id)a24 location:(id)a25 jitGrammar:(id)a26 deliverEagerPackage:(BOOL)a27 disableDeliveringAsrFeatures:(BOOL)a28;
- (CLLocation)location;
- (NSArray)jitGrammar;
- (NSArray)loggingContext;
- (NSArray)sharedUserInfos;
- (NSData)profile;
- (NSDictionary)overrides;
- (NSString)applicationName;
- (NSString)codec;
- (NSString)dictationUIInteractionIdentifier;
- (NSString)inputOrigin;
- (NSString)language;
- (NSString)postfixText;
- (NSString)prefixText;
- (NSString)requestIdentifier;
- (NSString)selectedText;
- (NSString)task;
- (NSURL)modelOverrideURL;
- (NSURL)originalAudioFileURL;
- (NSUUID)asrId;
- (double)endpointStart;
- (double)maximumRecognitionDuration;
- (double)recognitionStart;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CESRSpeechParameters

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38 shouldGenerateVoiceCommandCandidates:(BOOL)a39
{
  LOBYTE(v42) = a39;
  *(_WORD *)((char *)&v41 + 3) = __PAIR16__(a32, a31);
  *(_WORD *)((char *)&v41 + 1) = __PAIR16__(a30, a29);
  LOBYTE(v41) = a28;
  *(_WORD *)((char *)&v40 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v40 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v40 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v40 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v40) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", a3, a4, a5, a6, a7, a8, a23, a24, a38, a9, a10, a11,
           a12,
           a13,
           v40,
           a25,
           a26,
           a27,
           v41,
           a33,
           a34,
           a35,
           a36,
           a37,
           v42,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38
{
  LOBYTE(v41) = 0;
  *(_WORD *)((char *)&v40 + 3) = __PAIR16__(a32, a31);
  *(_WORD *)((char *)&v40 + 1) = __PAIR16__(a30, a29);
  LOBYTE(v40) = a28;
  *(_WORD *)((char *)&v39 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v39 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v39 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v39 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v39) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:", a3, a4, a5, a6, a7, a8, a23, a24, a38, a9, a10, a11,
           a12,
           a13,
           v39,
           a25,
           a26,
           a27,
           v40,
           a33,
           a34,
           a35,
           a36,
           a37,
           v41);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37
{
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:", a3, a4, a5, a6, a7, a23, a24, 0.0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 sharedUserIds:(id)a30 enableEmojiRecognition:(BOOL)a31 enableAutoPunctuation:(BOOL)a32 enableVoiceCommands:(BOOL)a33
{
  *(_WORD *)((char *)&v35 + 3) = __PAIR16__(a33, a32);
  BYTE2(v35) = a31;
  LOWORD(v35) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v34 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v34 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v34 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v34 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v34) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v34,
           a25,
           a26,
           a27,
           v35,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32
{
  *(_WORD *)((char *)&v34 + 3) = __PAIR16__(a32, a31);
  *(_WORD *)((char *)&v34 + 1) = __PAIR16__(a30, a29);
  LOBYTE(v34) = a28;
  *(_WORD *)((char *)&v33 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v33 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v33 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v33 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v33) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v33,
           a25,
           a26,
           a27,
           v34,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 sharedUserIds:(id)a30 enableEmojiRecognition:(BOOL)a31 enableAutoPunctuation:(BOOL)a32
{
  BYTE4(v34) = 0;
  WORD1(v34) = __PAIR16__(a32, a31);
  LOWORD(v34) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v33 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v33 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v33 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v33 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v33) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v33,
           a25,
           a26,
           a27,
           v34,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 interactionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29
{
  BYTE4(v31) = 0;
  LODWORD(v31) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v30 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v30 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v30 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v30 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v30) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v30,
           a25,
           a26,
           a27,
           v31,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 interactionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 maximumRecognitionDuration:(double)a22 endpointStart:(double)a23 inputOrigin:(id)a24 location:(id)a25 jitGrammar:(id)a26 deliverEagerPackage:(BOOL)a27 disableDeliveringAsrFeatures:(BOOL)a28
{
  BYTE4(v31) = 0;
  LODWORD(v31) = __PAIR16__(a28, a27);
  LOBYTE(v30) = 0;
  HIWORD(v29) = __PAIR16__(a21, a20);
  WORD2(v29) = __PAIR16__(a19, a18);
  WORD1(v29) = __PAIR16__(a17, a16);
  LOWORD(v29) = __PAIR16__(a15, a14);
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a22, a23, a9, a10, a11, a12,
           a13,
           v29,
           v30,
           a24,
           a25,
           a26,
           v31,
           0,
           0,
           0,
           0,
           0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_sharedUserInfos, 0);
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_dictationUIInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

- (NSUUID)asrId
{
  return self->_asrId;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (double)recognitionStart
{
  return self->_recognitionStart;
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

- (BOOL)enableVoiceCommands
{
  return self->_enableVoiceCommands;
}

- (BOOL)enableAutoPunctuation
{
  return self->_enableAutoPunctuation;
}

- (BOOL)enableEmojiRecognition
{
  return self->_enableEmojiRecognition;
}

- (BOOL)disableDeliveringAsrFeatures
{
  return self->_disableDeliveringAsrFeatures;
}

- (BOOL)deliverEagerPackage
{
  return self->_deliverEagerPackage;
}

- (NSArray)jitGrammar
{
  return self->_jitGrammar;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (double)endpointStart
{
  return self->_endpointStart;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (BOOL)isSpeechAPIRequest
{
  return self->_isSpeechAPIRequest;
}

- (BOOL)shouldHandleCapitalization
{
  return self->_shouldHandleCapitalization;
}

- (BOOL)continuousListening
{
  return self->_continuousListening;
}

- (BOOL)shouldStoreAudioOnDevice
{
  return self->_shouldStoreAudioOnDevice;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (BOOL)farField
{
  return self->_farField;
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (BOOL)narrowband
{
  return self->_narrowband;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (NSData)profile
{
  return self->_profile;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSArray)loggingContext
{
  return self->_loggingContext;
}

- (NSString)task
{
  return self->_task;
}

- (NSString)dictationUIInteractionIdentifier
{
  return self->_dictationUIInteractionIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)language
{
  return self->_language;
}

- (void)encodeWithCoder:(id)a3
{
  language = self->_language;
  id v23 = a3;
  [v23 encodeObject:language forKey:@"CESRSpeechParameters::language"];
  [v23 encodeObject:self->_requestIdentifier forKey:@"CESRSpeechParameters::requestIdentifier"];
  [v23 encodeObject:self->_dictationUIInteractionIdentifier forKey:@"CESRSpeechParameters::dictationUIInteractionIdentifier"];
  [v23 encodeObject:self->_task forKey:@"CESRSpeechParameters::task"];
  [v23 encodeObject:self->_loggingContext forKey:@"CESRSpeechParameters::loggingContext"];
  [v23 encodeObject:self->_applicationName forKey:@"CESRSpeechParameters::applicationName"];
  [v23 encodeObject:self->_profile forKey:@"CESRSpeechParameters::profile"];
  [v23 encodeObject:self->_overrides forKey:@"CESRSpeechParameters::overrides"];
  [v23 encodeObject:self->_modelOverrideURL forKey:@"CESRSpeechParameters::modelOverrideURL"];
  [v23 encodeObject:self->_originalAudioFileURL forKey:@"CESRSpeechParameters::originalAudioFileURL"];
  [v23 encodeObject:self->_codec forKey:@"CESRSpeechParameters::codec"];
  v5 = [NSNumber numberWithBool:self->_narrowband];
  [v23 encodeObject:v5 forKey:@"CESRSpeechParameters::narrowband"];

  v6 = [NSNumber numberWithBool:self->_detectUtterances];
  [v23 encodeObject:v6 forKey:@"CESRSpeechParameters::detectUtterances"];

  v7 = [NSNumber numberWithBool:self->_censorSpeech];
  [v23 encodeObject:v7 forKey:@"CESRSpeechParameters::censorSpeech"];

  v8 = [NSNumber numberWithBool:self->_farField];
  [v23 encodeObject:v8 forKey:@"CESRSpeechParameters::farField"];

  v9 = [NSNumber numberWithBool:self->_secureOfflineOnly];
  [v23 encodeObject:v9 forKey:@"CESRSpeechParameters::secureOfflineOnly"];

  v10 = [NSNumber numberWithBool:self->_shouldStoreAudioOnDevice];
  [v23 encodeObject:v10 forKey:@"CESRSpeechParameters::shouldStoreAudioOnDevice"];

  v11 = [NSNumber numberWithBool:self->_continuousListening];
  [v23 encodeObject:v11 forKey:@"CESRSpeechParameters::continuousListening"];

  v12 = [NSNumber numberWithBool:self->_shouldHandleCapitalization];
  [v23 encodeObject:v12 forKey:@"CESRSpeechParameters::shouldHandleCapitalization"];

  v13 = [NSNumber numberWithBool:self->_isSpeechAPIRequest];
  [v23 encodeObject:v13 forKey:@"CESRSpeechParameters::isSpeechAPIRequest"];

  v14 = [NSNumber numberWithDouble:self->_maximumRecognitionDuration];
  [v23 encodeObject:v14 forKey:@"CESRSpeechParameters::maximumRecognitionDuration"];

  v15 = [NSNumber numberWithDouble:self->_endpointStart];
  [v23 encodeObject:v15 forKey:@"CESRSpeechParameters::endpointStart"];

  [v23 encodeObject:self->_inputOrigin forKey:@"CESRSpeechParameters::inputOrigin"];
  [v23 encodeObject:self->_location forKey:@"CESRSpeechParameters::location"];
  [v23 encodeObject:self->_jitGrammar forKey:@"CESRSpeechParameters::jitGrammar"];
  v16 = [NSNumber numberWithBool:self->_deliverEagerPackage];
  [v23 encodeObject:v16 forKey:@"CESRSpeechParameters::deliverEagerPackage"];

  v17 = [NSNumber numberWithBool:self->_disableDeliveringAsrFeatures];
  [v23 encodeObject:v17 forKey:@"CESRSpeechParameters::disableDeliveringAsrFeatures"];

  v18 = [NSNumber numberWithBool:self->_enableEmojiRecognition];
  [v23 encodeObject:v18 forKey:@"CESRSpeechParameters::enableEmojiRecognition"];

  v19 = [NSNumber numberWithBool:self->_enableAutoPunctuation];
  [v23 encodeObject:v19 forKey:@"CESRSpeechParameters::enableAutoPunctuation"];

  v20 = [NSNumber numberWithBool:self->_enableVoiceCommands];
  [v23 encodeObject:v20 forKey:@"CESRSpeechParameters::enableVoiceCommands"];

  [v23 encodeObject:self->_sharedUserInfos forKey:@"CESRSpeechParameters::sharedUserInfos"];
  [v23 encodeObject:self->_prefixText forKey:@"CESRSpeechParameters::prefixText"];
  [v23 encodeObject:self->_postfixText forKey:@"CESRSpeechParameters::postfixText"];
  [v23 encodeObject:self->_selectedText forKey:@"CESRSpeechParameters::selectedText"];
  [v23 encodeObject:self->_powerContext forKey:@"CESRSpeechParameters::powerContext"];
  v21 = [NSNumber numberWithDouble:self->_recognitionStart];
  [v23 encodeObject:v21 forKey:@"CESRSpeechParameters::recognitionStart"];

  v22 = [NSNumber numberWithBool:self->_shouldGenerateVoiceCommandCandidates];
  [v23 encodeObject:v22 forKey:@"CESRSpeechParameters::shouldGenerateVoiceCommandCandidates"];

  [v23 encodeObject:self->_asrId forKey:@"CESRSpeechParameters::asrId"];
}

- (CESRSpeechParameters)initWithCoder:(id)a3
{
  id v3 = a3;
  v81 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::language"];
  v78 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::requestIdentifier"];
  v80 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::dictationUIInteractionIdentifier"];
  v79 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::task"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v73 = [v3 decodeObjectOfClasses:v6 forKey:@"CESRSpeechParameters::loggingContext"];

  v72 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::applicationName"];
  v77 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::profile"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v76 = [v3 decodeObjectOfClasses:v10 forKey:@"CESRSpeechParameters::overrides"];

  v71 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::modelOverrideURL"];
  v70 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::originalAudioFileURL"];
  v60 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::codec"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::narrowband"];
  char v69 = [v11 BOOLValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::detectUtterances"];
  char v68 = [v12 BOOLValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::censorSpeech"];
  char v67 = [v13 BOOLValue];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::farField"];
  char v66 = [v14 BOOLValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::secureOfflineOnly"];
  char v65 = [v15 BOOLValue];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::shouldStoreAudioOnDevice"];
  char v64 = [v16 BOOLValue];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::continuousListening"];
  char v63 = [v17 BOOLValue];

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::shouldHandleCapitalization"];
  char v62 = [v18 BOOLValue];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::isSpeechAPIRequest"];
  char v61 = [v19 BOOLValue];

  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::maximumRecognitionDuration"];
  [v20 doubleValue];
  double v22 = v21;

  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::endpointStart"];
  [v23 doubleValue];
  double v25 = v24;

  v59 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::inputOrigin"];
  v55 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::location"];
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v54 = [v3 decodeObjectOfClasses:v28 forKey:@"CESRSpeechParameters::jitGrammar"];

  uint64_t v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::deliverEagerPackage"];
  char v58 = [v29 BOOLValue];

  uint64_t v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::disableDeliveringAsrFeatures"];
  char v57 = [v30 BOOLValue];

  uint64_t v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::enableEmojiRecognition"];
  char v56 = [v31 BOOLValue];

  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::enableAutoPunctuation"];
  LOBYTE(v27) = [v32 BOOLValue];

  long long v33 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::enableVoiceCommands"];
  char v34 = [v33 BOOLValue];

  uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  v53 = [v3 decodeObjectOfClasses:v37 forKey:@"CESRSpeechParameters::sharedUserInfos"];

  v52 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::prefixText"];
  v51 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::postfixText"];
  v50 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::selectedText"];
  uint64_t v38 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::powerContext"];
  long long v39 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::recognitionStart"];
  [v39 doubleValue];
  double v41 = v40;

  uint64_t v42 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::shouldGenerateVoiceCommandCandidates"];
  char v43 = [v42 BOOLValue];

  v44 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CESRSpeechParameters::asrId"];

  LOBYTE(v49) = v43;
  BYTE4(v48) = v34;
  BYTE3(v48) = v27;
  BYTE2(v48) = v56;
  BYTE1(v48) = v57;
  LOBYTE(v48) = v58;
  LOBYTE(v47) = v61;
  HIBYTE(v46) = v62;
  BYTE6(v46) = v63;
  BYTE5(v46) = v64;
  BYTE4(v46) = v65;
  BYTE3(v46) = v66;
  BYTE2(v46) = v67;
  BYTE1(v46) = v68;
  LOBYTE(v46) = v69;
  v75 = -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", v81, v78, v80, v79, v73, v72, v22, v25, v41, v77, v76, v71,
          v70,
          v60,
          v46,
          v47,
          v59,
          v55,
          v54,
          v48,
          v53,
          v52,
          v51,
          v50,
          v38,
          v49,
          v44);

  return v75;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CESRSpeechParameters *)a3;
  if (self == v4)
  {
    BOOL v55 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL narrowband = self->_narrowband;
      if (narrowband != [(CESRSpeechParameters *)v5 narrowband]) {
        goto LABEL_50;
      }
      BOOL detectUtterances = self->_detectUtterances;
      if (detectUtterances != [(CESRSpeechParameters *)v5 detectUtterances]) {
        goto LABEL_50;
      }
      BOOL censorSpeech = self->_censorSpeech;
      if (censorSpeech != [(CESRSpeechParameters *)v5 censorSpeech]) {
        goto LABEL_50;
      }
      BOOL farField = self->_farField;
      if (farField != [(CESRSpeechParameters *)v5 farField]) {
        goto LABEL_50;
      }
      BOOL secureOfflineOnly = self->_secureOfflineOnly;
      if (secureOfflineOnly != [(CESRSpeechParameters *)v5 secureOfflineOnly]) {
        goto LABEL_50;
      }
      BOOL shouldStoreAudioOnDevice = self->_shouldStoreAudioOnDevice;
      if (shouldStoreAudioOnDevice != [(CESRSpeechParameters *)v5 shouldStoreAudioOnDevice]) {
        goto LABEL_50;
      }
      BOOL continuousListening = self->_continuousListening;
      if (continuousListening != [(CESRSpeechParameters *)v5 continuousListening]) {
        goto LABEL_50;
      }
      BOOL shouldHandleCapitalization = self->_shouldHandleCapitalization;
      if (shouldHandleCapitalization != [(CESRSpeechParameters *)v5 shouldHandleCapitalization])goto LABEL_50; {
      BOOL isSpeechAPIRequest = self->_isSpeechAPIRequest;
      }
      if (isSpeechAPIRequest != [(CESRSpeechParameters *)v5 isSpeechAPIRequest]) {
        goto LABEL_50;
      }
      double maximumRecognitionDuration = self->_maximumRecognitionDuration;
      [(CESRSpeechParameters *)v5 maximumRecognitionDuration];
      if (maximumRecognitionDuration != v16) {
        goto LABEL_50;
      }
      double endpointStart = self->_endpointStart;
      [(CESRSpeechParameters *)v5 endpointStart];
      if (endpointStart != v18) {
        goto LABEL_50;
      }
      BOOL deliverEagerPackage = self->_deliverEagerPackage;
      if (deliverEagerPackage != [(CESRSpeechParameters *)v5 deliverEagerPackage]) {
        goto LABEL_50;
      }
      v20 = self;
      BOOL disableDeliveringAsrFeatures = self->_disableDeliveringAsrFeatures;
      if (disableDeliveringAsrFeatures != [(CESRSpeechParameters *)v5 disableDeliveringAsrFeatures])goto LABEL_50; {
      BOOL enableEmojiRecognition = v20->_enableEmojiRecognition;
      }
      if (enableEmojiRecognition == [(CESRSpeechParameters *)v5 enableEmojiRecognition]
        && (BOOL enableAutoPunctuation = v20->_enableAutoPunctuation,
            enableAutoPunctuation == [(CESRSpeechParameters *)v5 enableAutoPunctuation])
        && (BOOL enableVoiceCommands = v20->_enableVoiceCommands,
            enableVoiceCommands == [(CESRSpeechParameters *)v5 enableVoiceCommands])
        && (double recognitionStart = v20->_recognitionStart,
            [(CESRSpeechParameters *)v5 recognitionStart],
            recognitionStart == v26)
        && (BOOL shouldGenerateVoiceCommandCandidates = v20->_shouldGenerateVoiceCommandCandidates,
            shouldGenerateVoiceCommandCandidates == [(CESRSpeechParameters *)v5 shouldGenerateVoiceCommandCandidates]))
      {
        v28 = [(CESRSpeechParameters *)v5 language];
        language = v20->_language;
        if (language == v28 || [(NSString *)language isEqual:v28])
        {
          uint64_t v30 = [(CESRSpeechParameters *)v5 requestIdentifier];
          requestIdentifier = v20->_requestIdentifier;
          if (requestIdentifier == v30 || [(NSString *)requestIdentifier isEqual:v30])
          {
            v32 = [(CESRSpeechParameters *)v5 dictationUIInteractionIdentifier];
            dictationUIInteractionIdentifier = v20->_dictationUIInteractionIdentifier;
            if (dictationUIInteractionIdentifier == v32
              || [(NSString *)dictationUIInteractionIdentifier isEqual:v32])
            {
              char v34 = [(CESRSpeechParameters *)v5 task];
              task = v20->_task;
              if (task == v34 || [(NSString *)task isEqual:v34])
              {
                uint64_t v36 = [(CESRSpeechParameters *)v5 loggingContext];
                loggingContext = v20->_loggingContext;
                if (loggingContext == v36 || [(NSArray *)loggingContext isEqual:v36])
                {
                  uint64_t v38 = [(CESRSpeechParameters *)v5 applicationName];
                  applicationName = v20->_applicationName;
                  if (applicationName == v38 || [(NSString *)applicationName isEqual:v38])
                  {
                    double v40 = [(CESRSpeechParameters *)v5 profile];
                    profile = v20->_profile;
                    if (profile == v40 || [(NSData *)profile isEqual:v40])
                    {
                      uint64_t v42 = [(CESRSpeechParameters *)v5 overrides];
                      overrides = v20->_overrides;
                      v83 = (void *)v42;
                      if (overrides == (NSDictionary *)v42
                        || [(NSDictionary *)overrides isEqual:v42])
                      {
                        uint64_t v44 = [(CESRSpeechParameters *)v5 modelOverrideURL];
                        modelOverrideURL = v20->_modelOverrideURL;
                        v82 = (void *)v44;
                        if (modelOverrideURL == (NSURL *)v44
                          || [(NSURL *)modelOverrideURL isEqual:v44])
                        {
                          uint64_t v46 = [(CESRSpeechParameters *)v5 originalAudioFileURL];
                          originalAudioFileURL = v20->_originalAudioFileURL;
                          v81 = (void *)v46;
                          if (originalAudioFileURL == (NSURL *)v46
                            || [(NSURL *)originalAudioFileURL isEqual:v46])
                          {
                            uint64_t v48 = [(CESRSpeechParameters *)v5 codec];
                            codec = v20->_codec;
                            v80 = (void *)v48;
                            if (codec == (NSString *)v48 || [(NSString *)codec isEqual:v48])
                            {
                              uint64_t v50 = [(CESRSpeechParameters *)v5 inputOrigin];
                              inputOrigin = v20->_inputOrigin;
                              v79 = (void *)v50;
                              if (inputOrigin == (NSString *)v50
                                || [(NSString *)inputOrigin isEqual:v50])
                              {
                                uint64_t v52 = [(CESRSpeechParameters *)v5 location];
                                location = v20->_location;
                                v78 = (void *)v52;
                                if (location == (CLLocation *)v52
                                  || ([(CLLocation *)location distanceFromLocation:v52],
                                      v54 == 0.0))
                                {
                                  uint64_t v57 = [(CESRSpeechParameters *)v5 jitGrammar];
                                  jitGrammar = v20->_jitGrammar;
                                  v77 = (void *)v57;
                                  if (jitGrammar == (NSArray *)v57
                                    || [(NSArray *)jitGrammar isEqual:v57])
                                  {
                                    uint64_t v59 = [(CESRSpeechParameters *)v5 sharedUserInfos];
                                    sharedUserInfos = v20->_sharedUserInfos;
                                    v76 = (void *)v59;
                                    if (sharedUserInfos == (NSArray *)v59
                                      || [(NSArray *)sharedUserInfos isEqual:v59])
                                    {
                                      uint64_t v61 = [(CESRSpeechParameters *)v5 prefixText];
                                      prefixText = v20->_prefixText;
                                      v75 = (void *)v61;
                                      if (prefixText == (NSString *)v61
                                        || [(NSString *)prefixText isEqual:v61])
                                      {
                                        uint64_t v63 = [(CESRSpeechParameters *)v5 postfixText];
                                        postfixText = v20->_postfixText;
                                        v74 = (void *)v63;
                                        if (postfixText == (NSString *)v63
                                          || [(NSString *)postfixText isEqual:v63])
                                        {
                                          uint64_t v65 = [(CESRSpeechParameters *)v5 selectedText];
                                          selectedText = v20->_selectedText;
                                          v73 = (void *)v65;
                                          if (selectedText == (NSString *)v65
                                            || [(NSString *)selectedText isEqual:v65])
                                          {
                                            uint64_t v67 = [(CESRSpeechParameters *)v5 powerContext];
                                            powerContext = v20->_powerContext;
                                            v72 = (void *)v67;
                                            if (powerContext == (AFPowerContextPolicy *)v67
                                              || [(AFPowerContextPolicy *)powerContext isEqual:v67])
                                            {
                                              uint64_t v69 = [(CESRSpeechParameters *)v5 asrId];
                                              asrId = v20->_asrId;
                                              v71 = (void *)v69;
                                              BOOL v55 = asrId == (NSUUID *)v69
                                                 || [(NSUUID *)asrId isEqual:v69];
                                            }
                                            else
                                            {
                                              BOOL v55 = 0;
                                            }
                                          }
                                          else
                                          {
                                            BOOL v55 = 0;
                                          }
                                        }
                                        else
                                        {
                                          BOOL v55 = 0;
                                        }
                                      }
                                      else
                                      {
                                        BOOL v55 = 0;
                                      }
                                    }
                                    else
                                    {
                                      BOOL v55 = 0;
                                    }
                                  }
                                  else
                                  {
                                    BOOL v55 = 0;
                                  }
                                }
                                else
                                {
                                  BOOL v55 = 0;
                                }
                              }
                              else
                              {
                                BOOL v55 = 0;
                              }
                            }
                            else
                            {
                              BOOL v55 = 0;
                            }
                          }
                          else
                          {
                            BOOL v55 = 0;
                          }
                        }
                        else
                        {
                          BOOL v55 = 0;
                        }
                      }
                      else
                      {
                        BOOL v55 = 0;
                      }
                    }
                    else
                    {
                      BOOL v55 = 0;
                    }
                  }
                  else
                  {
                    BOOL v55 = 0;
                  }
                }
                else
                {
                  BOOL v55 = 0;
                }
              }
              else
              {
                BOOL v55 = 0;
              }
            }
            else
            {
              BOOL v55 = 0;
            }
          }
          else
          {
            BOOL v55 = 0;
          }
        }
        else
        {
          BOOL v55 = 0;
        }
      }
      else
      {
LABEL_50:
        BOOL v55 = 0;
      }
    }
    else
    {
      BOOL v55 = 0;
    }
  }

  return v55;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_requestIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_dictationUIInteractionIdentifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_task hash];
  uint64_t v7 = [(NSArray *)self->_loggingContext hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_applicationName hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSData *)self->_profile hash];
  uint64_t v10 = [(NSDictionary *)self->_overrides hash];
  uint64_t v11 = v10 ^ [(NSURL *)self->_modelOverrideURL hash];
  uint64_t v12 = v11 ^ [(NSURL *)self->_originalAudioFileURL hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_codec hash];
  uint64_t v59 = [NSNumber numberWithBool:self->_narrowband];
  uint64_t v14 = [v59 hash];
  char v58 = [NSNumber numberWithBool:self->_detectUtterances];
  uint64_t v15 = v14 ^ [v58 hash];
  uint64_t v57 = [NSNumber numberWithBool:self->_censorSpeech];
  uint64_t v16 = v13 ^ v15 ^ [v57 hash];
  char v56 = [NSNumber numberWithBool:self->_farField];
  uint64_t v17 = [v56 hash];
  BOOL v55 = [NSNumber numberWithBool:self->_secureOfflineOnly];
  uint64_t v18 = v17 ^ [v55 hash];
  double v54 = [NSNumber numberWithBool:self->_shouldStoreAudioOnDevice];
  uint64_t v19 = v18 ^ [v54 hash];
  v53 = [NSNumber numberWithBool:self->_continuousListening];
  uint64_t v20 = v16 ^ v19 ^ [v53 hash];
  uint64_t v52 = [NSNumber numberWithBool:self->_shouldHandleCapitalization];
  uint64_t v21 = [v52 hash];
  v51 = [NSNumber numberWithBool:self->_isSpeechAPIRequest];
  uint64_t v22 = v21 ^ [v51 hash];
  uint64_t v50 = [NSNumber numberWithDouble:self->_maximumRecognitionDuration];
  uint64_t v23 = v22 ^ [v50 hash];
  uint64_t v49 = [NSNumber numberWithDouble:self->_endpointStart];
  uint64_t v24 = v23 ^ [v49 hash];
  NSUInteger v25 = v20 ^ v24 ^ [(NSString *)self->_inputOrigin hash];
  uint64_t v26 = [(CLLocation *)self->_location hash];
  uint64_t v27 = v26 ^ [(NSArray *)self->_jitGrammar hash];
  v28 = [NSNumber numberWithBool:self->_deliverEagerPackage];
  uint64_t v29 = v27 ^ [v28 hash];
  uint64_t v30 = [NSNumber numberWithBool:self->_disableDeliveringAsrFeatures];
  uint64_t v31 = v29 ^ [v30 hash];
  v32 = [NSNumber numberWithBool:self->_enableEmojiRecognition];
  uint64_t v33 = v31 ^ [v32 hash];
  char v34 = [NSNumber numberWithBool:self->_enableAutoPunctuation];
  uint64_t v35 = v33 ^ [v34 hash];
  uint64_t v36 = [NSNumber numberWithBool:self->_enableVoiceCommands];
  uint64_t v37 = v25 ^ v35 ^ [v36 hash];
  uint64_t v38 = [(NSArray *)self->_sharedUserInfos hash];
  NSUInteger v39 = v38 ^ [(NSString *)self->_prefixText hash];
  NSUInteger v40 = v39 ^ [(NSString *)self->_postfixText hash];
  NSUInteger v41 = v40 ^ [(NSString *)self->_selectedText hash];
  uint64_t v42 = v41 ^ [(AFPowerContextPolicy *)self->_powerContext hash];
  char v43 = [NSNumber numberWithDouble:self->_recognitionStart];
  uint64_t v44 = v42 ^ [v43 hash];
  v45 = [NSNumber numberWithBool:self->_shouldGenerateVoiceCommandCandidates];
  uint64_t v46 = v44 ^ [v45 hash];
  unint64_t v47 = v37 ^ v46 ^ [(NSUUID *)self->_asrId hash];

  return v47;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v123[38] = *MEMORY[0x1E4F143B8];
  id v105 = [NSString alloc];
  v122.receiver = self;
  v122.super_class = (Class)CESRSpeechParameters;
  v121 = [(CESRSpeechParameters *)&v122 description];
  id v4 = [NSString alloc];
  v120 = [(NSString *)self->_language description];
  v119 = (void *)[v4 initWithFormat:@"language = %@", v120];
  v123[0] = v119;
  id v5 = [NSString alloc];
  v118 = [(NSString *)self->_requestIdentifier description];
  v117 = (void *)[v5 initWithFormat:@"requestIdentifier = %@", v118];
  v123[1] = v117;
  id v6 = [NSString alloc];
  v116 = [(NSString *)self->_dictationUIInteractionIdentifier description];
  v115 = (void *)[v6 initWithFormat:@"dictationUIInteractionIdentifier = %@", v116];
  v123[2] = v115;
  id v7 = [NSString alloc];
  v114 = [(NSString *)self->_task description];
  v113 = (void *)[v7 initWithFormat:@"task = %@", v114];
  v123[3] = v113;
  id v8 = [NSString alloc];
  v112 = [(NSArray *)self->_loggingContext description];
  v111 = (void *)[v8 initWithFormat:@"loggingContext = %@", v112];
  v123[4] = v111;
  id v9 = [NSString alloc];
  v110 = [(NSString *)self->_applicationName description];
  v109 = (void *)[v9 initWithFormat:@"applicationName = %@", v110];
  v123[5] = v109;
  v108 = objc_msgSend([NSString alloc], "initWithFormat:", @"profile = (%ld bytes)", -[NSData length](self->_profile, "length"));
  v123[6] = v108;
  id v10 = [NSString alloc];
  v107 = [(NSDictionary *)self->_overrides description];
  v104 = (void *)[v10 initWithFormat:@"overrides = %@", v107];
  v123[7] = v104;
  id v11 = [NSString alloc];
  v103 = [(NSURL *)self->_modelOverrideURL description];
  v102 = (void *)[v11 initWithFormat:@"modelOverrideURL = %@", v103];
  v123[8] = v102;
  id v12 = [NSString alloc];
  v101 = [(NSURL *)self->_originalAudioFileURL description];
  v100 = (void *)[v12 initWithFormat:@"originalAudioFileURL = %@", v101];
  v123[9] = v100;
  id v13 = [NSString alloc];
  v99 = [(NSString *)self->_codec description];
  v98 = (void *)[v13 initWithFormat:@"codec = %@", v99];
  v123[10] = v98;
  id v14 = [NSString alloc];
  if (self->_narrowband) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  v97 = (void *)[v14 initWithFormat:@"BOOL narrowband = %@", v15];
  v123[11] = v97;
  id v16 = [NSString alloc];
  if (self->_detectUtterances) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  v96 = (void *)[v16 initWithFormat:@"BOOL detectUtterances = %@", v17];
  v123[12] = v96;
  id v18 = [NSString alloc];
  if (self->_censorSpeech) {
    uint64_t v19 = @"YES";
  }
  else {
    uint64_t v19 = @"NO";
  }
  v95 = (void *)[v18 initWithFormat:@"BOOL censorSpeech = %@", v19];
  v123[13] = v95;
  id v20 = [NSString alloc];
  if (self->_farField) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  v94 = (void *)[v20 initWithFormat:@"BOOL farField = %@", v21];
  v123[14] = v94;
  id v22 = [NSString alloc];
  if (self->_secureOfflineOnly) {
    uint64_t v23 = @"YES";
  }
  else {
    uint64_t v23 = @"NO";
  }
  v93 = (void *)[v22 initWithFormat:@"BOOL secureOfflineOnly = %@", v23];
  v123[15] = v93;
  id v24 = [NSString alloc];
  if (self->_shouldStoreAudioOnDevice) {
    NSUInteger v25 = @"YES";
  }
  else {
    NSUInteger v25 = @"NO";
  }
  v92 = (void *)[v24 initWithFormat:@"BOOL shouldStoreAudioOnDevice = %@", v25];
  v123[16] = v92;
  id v26 = [NSString alloc];
  if (self->_continuousListening) {
    uint64_t v27 = @"YES";
  }
  else {
    uint64_t v27 = @"NO";
  }
  v91 = (void *)[v26 initWithFormat:@"BOOL continuousListening = %@", v27];
  v123[17] = v91;
  id v28 = [NSString alloc];
  if (self->_shouldHandleCapitalization) {
    uint64_t v29 = @"YES";
  }
  else {
    uint64_t v29 = @"NO";
  }
  v90 = (void *)[v28 initWithFormat:@"BOOL shouldHandleCapitalization = %@", v29];
  v123[18] = v90;
  id v30 = [NSString alloc];
  if (self->_isSpeechAPIRequest) {
    uint64_t v31 = @"YES";
  }
  else {
    uint64_t v31 = @"NO";
  }
  v89 = (void *)[v30 initWithFormat:@"BOOL isSpeechAPIRequest = %@", v31];
  v123[19] = v89;
  id v32 = [NSString alloc];
  v88 = [NSNumber numberWithDouble:self->_maximumRecognitionDuration];
  v87 = (void *)[v32 initWithFormat:@"double maximumRecognitionDuration = %@", v88];
  v123[20] = v87;
  id v33 = [NSString alloc];
  v86 = [NSNumber numberWithDouble:self->_endpointStart];
  v85 = (void *)[v33 initWithFormat:@"double endpointStart = %@", v86];
  v123[21] = v85;
  id v34 = [NSString alloc];
  v84 = [(NSString *)self->_inputOrigin description];
  v83 = (void *)[v34 initWithFormat:@"inputOrigin = %@", v84];
  v123[22] = v83;
  id v35 = [NSString alloc];
  v82 = [(CLLocation *)self->_location description];
  v81 = (void *)[v35 initWithFormat:@"location = %@", v82];
  v123[23] = v81;
  id v36 = [NSString alloc];
  v80 = [(NSArray *)self->_jitGrammar description];
  v79 = (void *)[v36 initWithFormat:@"jitGrammar = %@", v80];
  v123[24] = v79;
  id v37 = [NSString alloc];
  if (self->_deliverEagerPackage) {
    uint64_t v38 = @"YES";
  }
  else {
    uint64_t v38 = @"NO";
  }
  v78 = (void *)[v37 initWithFormat:@"BOOL deliverEagerPackage = %@", v38];
  v123[25] = v78;
  id v39 = [NSString alloc];
  if (self->_disableDeliveringAsrFeatures) {
    NSUInteger v40 = @"YES";
  }
  else {
    NSUInteger v40 = @"NO";
  }
  v77 = (void *)[v39 initWithFormat:@"BOOL disableDeliveringAsrFeatures = %@", v40];
  v123[26] = v77;
  id v41 = [NSString alloc];
  if (self->_enableEmojiRecognition) {
    uint64_t v42 = @"YES";
  }
  else {
    uint64_t v42 = @"NO";
  }
  v76 = (void *)[v41 initWithFormat:@"BOOL enableEmojiRecognition = %@", v42];
  v123[27] = v76;
  id v43 = [NSString alloc];
  if (self->_enableAutoPunctuation) {
    uint64_t v44 = @"YES";
  }
  else {
    uint64_t v44 = @"NO";
  }
  v75 = (void *)[v43 initWithFormat:@"BOOL enableAutoPunctuation = %@", v44];
  v123[28] = v75;
  id v45 = [NSString alloc];
  if (self->_enableVoiceCommands) {
    uint64_t v46 = @"YES";
  }
  else {
    uint64_t v46 = @"NO";
  }
  v74 = (void *)[v45 initWithFormat:@"BOOL enableVoiceCommands = %@", v46];
  v123[29] = v74;
  id v47 = [NSString alloc];
  v73 = [(NSArray *)self->_sharedUserInfos description];
  v72 = (void *)[v47 initWithFormat:@"sharedUserInfos = %@", v73];
  v123[30] = v72;
  id v48 = [NSString alloc];
  if (self->_prefixText) {
    uint64_t v49 = @"REDACTED";
  }
  else {
    uint64_t v49 = 0;
  }
  v71 = (void *)[v48 initWithFormat:@"prefixText = %@", v49];
  v123[31] = v71;
  id v50 = [NSString alloc];
  if (self->_postfixText) {
    v51 = @"REDACTED";
  }
  else {
    v51 = 0;
  }
  v70 = (void *)[v50 initWithFormat:@"postfixText = %@", v51];
  v123[32] = v70;
  id v52 = [NSString alloc];
  if (self->_selectedText) {
    v53 = @"REDACTED";
  }
  else {
    v53 = 0;
  }
  double v54 = (void *)[v52 initWithFormat:@"selectedText = %@", v53];
  v123[33] = v54;
  id v55 = [NSString alloc];
  char v56 = [(AFPowerContextPolicy *)self->_powerContext description];
  uint64_t v57 = (void *)[v55 initWithFormat:@"powerContext = %@", v56];
  v123[34] = v57;
  id v58 = [NSString alloc];
  uint64_t v59 = [NSNumber numberWithDouble:self->_recognitionStart];
  v60 = (void *)[v58 initWithFormat:@"double recognitionStart = %@", v59];
  v123[35] = v60;
  id v61 = [NSString alloc];
  if (self->_shouldGenerateVoiceCommandCandidates) {
    char v62 = @"YES";
  }
  else {
    char v62 = @"NO";
  }
  uint64_t v63 = (void *)[v61 initWithFormat:@"shouldGenerateVoiceCommandCandidates = %@", v62];
  v123[36] = v63;
  id v64 = [NSString alloc];
  uint64_t v65 = [(NSUUID *)self->_asrId description];
  char v66 = (void *)[v64 initWithFormat:@"asrId = %@", v65];
  v123[37] = v66;
  uint64_t v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:38];
  char v68 = [v67 componentsJoinedByString:@", "];
  id v106 = (id)[v105 initWithFormat:@"%@ {%@}", v121, v68];

  return v106;
}

- (id)description
{
  return [(CESRSpeechParameters *)self _descriptionWithIndent:0];
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38 shouldGenerateVoiceCommandCandidates:(BOOL)a39 asrId:(id)a40
{
  id v110 = a3;
  id v109 = a4;
  id v108 = a5;
  id v107 = a6;
  id v106 = a7;
  id v105 = a8;
  id v104 = a9;
  id v103 = a10;
  id v102 = a11;
  id v101 = a12;
  id v100 = a13;
  id v48 = a25;
  id v49 = a26;
  id v50 = a27;
  id v51 = a33;
  id v52 = a34;
  id v53 = a35;
  id v54 = a36;
  id v55 = a37;
  id v56 = a40;
  v111.receiver = self;
  v111.super_class = (Class)CESRSpeechParameters;
  uint64_t v57 = [(CESRSpeechParameters *)&v111 init];
  if (v57)
  {
    uint64_t v58 = [v110 copy];
    language = v57->_language;
    v57->_language = (NSString *)v58;

    uint64_t v60 = [v109 copy];
    requestIdentifier = v57->_requestIdentifier;
    v57->_requestIdentifier = (NSString *)v60;

    uint64_t v62 = [v108 copy];
    dictationUIInteractionIdentifier = v57->_dictationUIInteractionIdentifier;
    v57->_dictationUIInteractionIdentifier = (NSString *)v62;

    uint64_t v64 = [v107 copy];
    task = v57->_task;
    v57->_task = (NSString *)v64;

    uint64_t v66 = [v106 copy];
    loggingContext = v57->_loggingContext;
    v57->_loggingContext = (NSArray *)v66;

    uint64_t v68 = [v105 copy];
    applicationName = v57->_applicationName;
    v57->_applicationName = (NSString *)v68;

    uint64_t v70 = [v104 copy];
    profile = v57->_profile;
    v57->_profile = (NSData *)v70;

    uint64_t v72 = [v103 copy];
    overrides = v57->_overrides;
    v57->_overrides = (NSDictionary *)v72;

    uint64_t v74 = [v102 copy];
    modelOverrideURL = v57->_modelOverrideURL;
    v57->_modelOverrideURL = (NSURL *)v74;

    uint64_t v76 = [v101 copy];
    originalAudioFileURL = v57->_originalAudioFileURL;
    v57->_originalAudioFileURL = (NSURL *)v76;

    uint64_t v78 = [v100 copy];
    codec = v57->_codec;
    v57->_codec = (NSString *)v78;

    v57->_BOOL narrowband = a14;
    v57->_BOOL detectUtterances = a15;
    v57->_BOOL censorSpeech = a16;
    v57->_BOOL farField = a17;
    v57->_BOOL secureOfflineOnly = a18;
    v57->_BOOL shouldStoreAudioOnDevice = a19;
    v57->_BOOL continuousListening = a20;
    v57->_BOOL shouldHandleCapitalization = a21;
    v57->_BOOL isSpeechAPIRequest = a22;
    v57->_double maximumRecognitionDuration = a23;
    v57->_double endpointStart = a24;
    uint64_t v80 = [v48 copy];
    inputOrigin = v57->_inputOrigin;
    v57->_inputOrigin = (NSString *)v80;

    uint64_t v82 = [v49 copy];
    location = v57->_location;
    v57->_location = (CLLocation *)v82;

    uint64_t v84 = [v50 copy];
    jitGrammar = v57->_jitGrammar;
    v57->_jitGrammar = (NSArray *)v84;

    v57->_BOOL deliverEagerPackage = a28;
    v57->_BOOL disableDeliveringAsrFeatures = a29;
    v57->_BOOL enableEmojiRecognition = a30;
    v57->_BOOL enableAutoPunctuation = a31;
    v57->_BOOL enableVoiceCommands = a32;
    uint64_t v86 = [v51 copy];
    sharedUserInfos = v57->_sharedUserInfos;
    v57->_sharedUserInfos = (NSArray *)v86;

    uint64_t v88 = [v52 copy];
    prefixText = v57->_prefixText;
    v57->_prefixText = (NSString *)v88;

    uint64_t v90 = [v53 copy];
    postfixText = v57->_postfixText;
    v57->_postfixText = (NSString *)v90;

    uint64_t v92 = [v54 copy];
    selectedText = v57->_selectedText;
    v57->_selectedText = (NSString *)v92;

    uint64_t v94 = [v55 copy];
    powerContext = v57->_powerContext;
    v57->_powerContext = (AFPowerContextPolicy *)v94;

    v57->_double recognitionStart = a38;
    v57->_BOOL shouldGenerateVoiceCommandCandidates = a39;
    uint64_t v96 = [v56 copy];
    asrId = v57->_asrId;
    v57->_asrId = (NSUUID *)v96;
  }
  return v57;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _CESRSpeechParametersMutation *))a3;
  if (v4)
  {
    id v5 = [[_CESRSpeechParametersMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_CESRSpeechParametersMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(CESRSpeechParameters *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _CESRSpeechParametersMutation *))a3;
  id v4 = objc_alloc_init(_CESRSpeechParametersMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_CESRSpeechParametersMutation *)v4 generate];

  return v5;
}

@end