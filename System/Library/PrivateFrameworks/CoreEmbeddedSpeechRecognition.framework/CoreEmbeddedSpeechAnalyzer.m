@interface CoreEmbeddedSpeechAnalyzer
+ (void)forceCooldownIfIdle;
+ (void)resetCache;
+ (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (CoreEmbeddedSpeechAnalyzer)init;
- (CoreEmbeddedSpeechAnalyzer)initWithDelegate:(id)a3 instanceUUID:(char *)a4;
- (CoreEmbeddedSpeechRecognizerDelegate)delegate;
- (void)addAudioPacket:(id)a3;
- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5;
- (void)dealloc;
- (void)finishAudio;
- (void)invalidate;
- (void)pauseRecognition;
- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5;
- (void)requestEagerResult;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startMissingAssetDownload;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4;
- (void)stopAudioDecoding;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation CoreEmbeddedSpeechAnalyzer

- (void).cxx_destruct
{
}

- (CoreEmbeddedSpeechRecognizerDelegate)delegate
{
  swift_getObjectType();
  v3 = self;
  id v6 = (id)CoreEmbeddedSpeechAnalyzer.delegate.getter();

  return (CoreEmbeddedSpeechRecognizerDelegate *)v6;
}

- (void)setDelegate:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B8D10F50();
}

- (CoreEmbeddedSpeechAnalyzer)initWithDelegate:(id)a3 instanceUUID:(char *)a4
{
  return (CoreEmbeddedSpeechAnalyzer *)CoreEmbeddedSpeechAnalyzer.init(delegate:instanceUUID:)((uint64_t)a3, a4);
}

- (void)dealloc
{
  swift_getObjectType();
  v3 = self;
  sub_1B8D13A68();
}

- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5
{
  v31 = self;
  id v27 = a3;
  id v32 = a4;
  id v30 = a5;
  swift_getObjectType();
  uint64_t v22 = sub_1B8E10988();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = v22 - 8;
  unint64_t v25 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v22);
  v26 = (char *)&v11 - v25;
  unint64_t v28 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB693B80) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = (void *)MEMORY[0x1F4188790](v27);
  v29 = (char *)&v11 - v28;
  id v6 = v5;
  id v7 = v32;
  id v8 = v30;
  v9 = v31;
  if (v32)
  {
    id v21 = v32;
    id v16 = v32;
    uint64_t v17 = sub_1B8E11718();
    uint64_t v18 = v10;

    uint64_t v19 = v17;
    uint64_t v20 = v18;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  uint64_t v14 = v20;
  uint64_t v15 = v19;
  if (v30)
  {
    id v13 = v30;
    id v12 = v30;
    sub_1B8E10958();
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v29, v26, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v29, 0, 1, v22);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v29, 1, 1, v22);
  }
  CoreEmbeddedSpeechAnalyzer.preheatSpeechRecognition(with:preheatSource:modelOverrideURL:)(v27, v15, v14, v29);
  sub_1B8D9481C((uint64_t)v29);
  swift_bridgeObjectRelease();
}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4
{
  swift_getObjectType();
  id v5 = a3;
  id v8 = _Block_copy(a4);
  id v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  CoreEmbeddedSpeechAnalyzer.startSpeechRecognition(with:didStartHandlerWithInfo:)(a3, (uint64_t)sub_1B8D97CC0, v9);
  swift_release();
}

- (void)addAudioPacket:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = self;
  uint64_t v7 = sub_1B8E109B8();
  unint64_t v8 = v6;
  CoreEmbeddedSpeechAnalyzer.addAudioPacket(_:)(v7, v6);
  sub_1B8D0B1A8(v7, v8);
}

- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5
{
  swift_getObjectType();
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = self;
  uint64_t v11 = sub_1B8E109B8();
  unint64_t v12 = v10;
  CoreEmbeddedSpeechAnalyzer.addAudioPacket(_:packetRecordedTime:packetReadyUpstreamTime:)(v11, v10, a4, a5);
  sub_1B8D0B1A8(v11, v12);
}

- (void)pauseRecognition
{
  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.pauseRecognition()();
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  swift_getObjectType();
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = self;
  uint64_t v18 = sub_1B8E11718();
  uint64_t v22 = v10;
  uint64_t v17 = sub_1B8E11718();
  postfixText = v11;
  uint64_t v12 = sub_1B8E11718();
  v13._countAndFlagsBits = v17;
  v13._object = postfixText;
  v14._countAndFlagsBits = v12;
  v15._countAndFlagsBits = v18;
  v14._object = v16;
  v15._object = v22;
  CoreEmbeddedSpeechAnalyzer.resumeRecognition(withPrefixText:postfixText:selectedText:)(v15, v13, v14);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  *(void *)&long long v33 = a6;
  *((void *)&v33 + 1) = a7;
  swift_getObjectType();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id)v33;
  id v14 = *((id *)&v33 + 1);
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  uint64_t v18 = self;
  if (a3)
  {
    v29.value._countAndFlagsBits = sub_1B8E11718();
    v29.value._object = v19;

    Swift::String_optional v30 = v29;
  }
  else
  {
    Swift::String_optional v30 = (Swift::String_optional)0;
  }
  if (a4)
  {
    v27.value._countAndFlagsBits = sub_1B8E11718();
    v27.value._object = v20;

    Swift::String_optional v28 = v27;
  }
  else
  {
    Swift::String_optional v28 = (Swift::String_optional)0;
  }
  if (a5)
  {
    abortCommandSuppression.is_nil = (char)a5;
    undoEvent.value._countAndFlagsBits = sub_1B8E11718();
    undoEvent.value._object = v21;

    Swift::String_optional selectedText = undoEvent;
  }
  else
  {
    Swift::String_optional selectedText = (Swift::String_optional)0;
  }
  abortCommandSuppression.value.super.super.isa = (Class)selectedText.value._object;
  cursorInVisibleText.value.super.super.isa = (Class)a8;
  cursorInVisibleText.is_nil = (char)a9;
  favorCommandSuppression.value.super.super.isa = (Class)a10;
  CoreEmbeddedSpeechAnalyzer.updateVoiceCommandContext(withPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:)(v30, v28, selectedText, (NSNumber_optional)v33, cursorInVisibleText, favorCommandSuppression, abortCommandSuppression, *(NSNumber_optional *)&undoEvent.value._countAndFlagsBits);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)finishAudio
{
  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.finishAudio()();
}

- (void)stopAudioDecoding
{
  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.stopAudioDecoding()();
}

- (void)requestEagerResult
{
  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.requestEagerResult()();
}

- (void)startMissingAssetDownload
{
  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.startMissingAssetDownload()();
}

+ (void)forceCooldownIfIdle
{
}

+ (void)resetCache
{
}

- (void)invalidate
{
  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.invalidate()();
}

+ (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = a4;
  uint64_t v7 = sub_1B8E11718();
  uint64_t v8 = v6;
  swift_getObjCClassMetadata();
  static CoreEmbeddedSpeechAnalyzer.send(speechCorrectionInfo:interactionIdentifier:)(a3, v7, v8);
  swift_bridgeObjectRelease();
}

- (CoreEmbeddedSpeechAnalyzer)init
{
  return (CoreEmbeddedSpeechAnalyzer *)CoreEmbeddedSpeechAnalyzer.init()();
}

@end