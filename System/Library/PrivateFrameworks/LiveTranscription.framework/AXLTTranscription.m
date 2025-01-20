@interface AXLTTranscription
- (AXLTTranscription)initWithRecognitionTask:(id)a3 transcription:(id)a4 previousTranscription:(id)a5;
- (BOOL)_shouldUseNonUpdatingSegments;
- (NSArray)nonUpdatingSegments;
- (NSArray)segments;
- (NSString)formattedString;
- (NSString)taskIdentifier;
- (SFSpeechRecognitionTask)task;
- (SFTranscription)transcription;
- (void)setNonUpdatingSegments:(id)a3;
- (void)setTask:(id)a3;
- (void)setTranscription:(id)a3;
@end

@implementation AXLTTranscription

- (BOOL)_shouldUseNonUpdatingSegments
{
  if (_shouldUseNonUpdatingSegments_onceToken != -1) {
    dispatch_once(&_shouldUseNonUpdatingSegments_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_shouldUseNonUpdatingSegments_s_userDefaults;
  return [v2 BOOLForKey:@"DoNotUpdatePastCaptionsKey"];
}

uint64_t __50__AXLTTranscription__shouldUseNonUpdatingSegments__block_invoke()
{
  _shouldUseNonUpdatingSegments_s_userDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.accessibility.LiveCaptions"];
  return MEMORY[0x270F9A758]();
}

- (AXLTTranscription)initWithRecognitionTask:(id)a3 transcription:(id)a4 previousTranscription:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AXLTTranscription;
  v12 = [(AXLTTranscription *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_task, a3);
    objc_storeStrong((id *)&v13->_transcription, a4);
    if ([(AXLTTranscription *)v13 _shouldUseNonUpdatingSegments])
    {
      v14 = [v11 nonUpdatingSegments];
      v15 = [v10 segments];
      uint64_t v16 = +[AXLTSegmentUtilities mergeOldSegments:v14 withNewSegments:v15];
      nonUpdatingSegments = v13->_nonUpdatingSegments;
      v13->_nonUpdatingSegments = (NSArray *)v16;
    }
    else
    {
      uint64_t v18 = [v10 segments];
      v14 = v13->_nonUpdatingSegments;
      v13->_nonUpdatingSegments = (NSArray *)v18;
    }
  }
  return v13;
}

- (NSString)formattedString
{
  v2 = [(AXLTTranscription *)self transcription];
  v3 = [v2 formattedString];

  return (NSString *)v3;
}

- (NSArray)segments
{
  v2 = [(AXLTTranscription *)self transcription];
  v3 = [v2 segments];

  return (NSArray *)v3;
}

- (NSString)taskIdentifier
{
  v2 = [(AXLTTranscription *)self task];
  v3 = [v2 requestIdentifier];

  return (NSString *)v3;
}

- (SFSpeechRecognitionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (NSArray)nonUpdatingSegments
{
  return self->_nonUpdatingSegments;
}

- (void)setNonUpdatingSegments:(id)a3
{
}

- (SFTranscription)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_nonUpdatingSegments, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end