@interface SFSpeechRecognitionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinal;
- (NSArray)rawTranscriptions;
- (NSArray)transcriptions;
- (NSString)description;
- (SFSpeechRecognitionMetadata)speechRecognitionMetadata;
- (SFSpeechRecognitionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SFSpeechRecognitionResult)initWithCoder:(id)a3;
- (SFTranscription)bestTranscription;
- (SFTranscription)rawTranscription;
- (id)_initWithBestTranscription:(id)a3 rawTranscription:(id)a4 final:(BOOL)a5 speechRecognitionMetadata:(id)a6;
- (id)binarySampleRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFSpeechRecognitionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTranscription, 0);
  objc_storeStrong((id *)&self->_speechRecognitionMetadata, 0);
  objc_storeStrong((id *)&self->_bestTranscription, 0);
  objc_storeStrong((id *)&self->_rawTranscriptions, 0);

  objc_storeStrong((id *)&self->_transcriptions, 0);
}

- (SFTranscription)rawTranscription
{
  return self->_rawTranscription;
}

- (SFSpeechRecognitionMetadata)speechRecognitionMetadata
{
  return self->_speechRecognitionMetadata;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (SFTranscription)bestTranscription
{
  return self->_bestTranscription;
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (SFSpeechRecognitionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6 = a3;
  if ([v6 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)SFSpeechRecognitionResult;
    v7 = [(SFSpeechRecognitionResult *)&v13 init];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
      v9 = v8;
      if (v8)
      {
        v10 = v8;

        v7 = v10;
      }
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)rawTranscriptions
{
  v2 = self;
  objc_sync_enter(v2);
  rawTranscriptions = v2->_rawTranscriptions;
  if (!rawTranscriptions)
  {
    v4 = ExpandTranscription(v2->_rawTranscription);
    uint64_t v5 = [v4 copy];
    id v6 = v2->_rawTranscriptions;
    v2->_rawTranscriptions = (NSArray *)v5;

    rawTranscriptions = v2->_rawTranscriptions;
  }
  v7 = rawTranscriptions;
  objc_sync_exit(v2);

  return v7;
}

- (NSArray)transcriptions
{
  v2 = self;
  objc_sync_enter(v2);
  transcriptions = v2->_transcriptions;
  if (!transcriptions)
  {
    v4 = ExpandTranscription(v2->_bestTranscription);
    uint64_t v5 = [v4 copy];
    id v6 = v2->_transcriptions;
    v2->_transcriptions = (NSArray *)v5;

    transcriptions = v2->_transcriptions;
  }
  v7 = transcriptions;
  objc_sync_exit(v2);

  return v7;
}

- (id)_initWithBestTranscription:(id)a3 rawTranscription:(id)a4 final:(BOOL)a5 speechRecognitionMetadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SFSpeechRecognitionResult;
  objc_super v13 = [(SFSpeechRecognitionResult *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    bestTranscription = v13->_bestTranscription;
    v13->_bestTranscription = (SFTranscription *)v14;

    uint64_t v16 = [v11 copy];
    rawTranscription = v13->_rawTranscription;
    v13->_rawTranscription = (SFTranscription *)v16;

    v13->_final = a5;
    uint64_t v18 = [v12 copy];
    speechRecognitionMetadata = v13->_speechRecognitionMetadata;
    v13->_speechRecognitionMetadata = (SFSpeechRecognitionMetadata *)v18;
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  bestTranscription = self->_bestTranscription;
  id v5 = a3;
  [v5 encodeObject:bestTranscription forKey:@"_bestTranscription"];
  [v5 encodeObject:self->_rawTranscription forKey:@"_rawTranscription"];
  [v5 encodeBool:self->_final forKey:@"_final"];
  [v5 encodeObject:self->_speechRecognitionMetadata forKey:@"_speechRecognitionMetadata"];
}

- (SFSpeechRecognitionResult)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFSpeechRecognitionResult;
  id v5 = [(SFSpeechRecognitionResult *)&v19 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_bestTranscription"];
    bestTranscription = v5->_bestTranscription;
    v5->_bestTranscription = (SFTranscription *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    objc_super v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_rawTranscription"];
    rawTranscription = v5->_rawTranscription;
    v5->_rawTranscription = (SFTranscription *)v14;

    v5->_final = [v4 decodeBoolForKey:@"_final"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechRecognitionMetadata"];
    speechRecognitionMetadata = v5->_speechRecognitionMetadata;
    v5->_speechRecognitionMetadata = (SFSpeechRecognitionMetadata *)v16;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)SFSpeechRecognitionResult;
  v3 = [(SFSpeechRecognitionResult *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" final=%d, bestTranscription=%@, speechRecognitionMetadata=%@", self->_final, self->_bestTranscription, self->_speechRecognitionMetadata];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFSpeechRecognitionMetadata **)a3;
  objc_opt_class();
  BOOL v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_final == *((unsigned __int8 *)v4 + 24))
  {
    bestTranscription = self->_bestTranscription;
    if (bestTranscription == (SFTranscription *)v4[4] || -[SFTranscription isEqual:](bestTranscription, "isEqual:"))
    {
      speechRecognitionMetadata = self->_speechRecognitionMetadata;
      if (speechRecognitionMetadata == v4[5]
        || -[SFSpeechRecognitionMetadata isEqual:](speechRecognitionMetadata, "isEqual:"))
      {
        BOOL v7 = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(SFTranscription *)self->_bestTranscription hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end