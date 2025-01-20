@interface SFSpeechRecognitionResult
- (id)sr_dictionaryRepresentation;
@end

@implementation SFSpeechRecognitionResult

- (id)sr_dictionaryRepresentation
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(SFSpeechRecognitionResult *)self transcriptions];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "sr_dictionaryRepresentation"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v6);
  }
  v14[0] = @"redactedBestTranscription";
  v15[0] = [(SFTranscription *)[(SFSpeechRecognitionResult *)self bestTranscription] sr_dictionaryRepresentation];
  v15[1] = v3;
  v14[1] = @"redactedTranscriptions";
  v14[2] = @"final";
  v15[2] = +[NSNumber numberWithBool:[(SFSpeechRecognitionResult *)self isFinal]];
  v14[3] = @"speechRecognitionMetadata";
  v15[3] = [(SFSpeechRecognitionMetadata *)[(SFSpeechRecognitionResult *)self speechRecognitionMetadata] sr_dictionaryRepresentation];
  return +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
}

@end