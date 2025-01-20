@interface ESBiomeAsrRecord
- (BOOL)hasRecognizedAnything;
- (BOOL)qualify;
- (ESBiomeAsrRecord)initWithAsrId:(id)a3 interactionId:(id)a4 language:(id)a5 taskName:(id)a6 samplingRate:(unint64_t)a7;
- (NSArray)recognizedNbest;
- (NSArray)recognizedTokens;
- (NSArray)selectedAlternatives;
- (NSString)asrId;
- (NSString)correctedText;
- (NSString)interactionId;
- (NSString)language;
- (NSString)recognizedText;
- (NSString)taskName;
- (unint64_t)samplingRate;
- (void)markRecognition;
- (void)sendEvent;
- (void)setCorrectedText:(id)a3;
- (void)setCorrectedText:(id)a3 interactionId:(id)a4;
- (void)setRecognizedNbest:(id)a3;
- (void)setRecognizedText:(id)a3;
- (void)setRecognizedTokens:(id)a3;
- (void)setSelectedAlternatives:(id)a3;
@end

@implementation ESBiomeAsrRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAlternatives, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_recognizedNbest, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);

  objc_storeStrong((id *)&self->_asrId, 0);
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (void)setSelectedAlternatives:(id)a3
{
}

- (NSArray)selectedAlternatives
{
  return self->_selectedAlternatives;
}

- (void)setCorrectedText:(id)a3
{
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setRecognizedText:(id)a3
{
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedNbest:(id)a3
{
}

- (NSArray)recognizedNbest
{
  return self->_recognizedNbest;
}

- (void)setRecognizedTokens:(id)a3
{
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (NSString)asrId
{
  return self->_asrId;
}

- (void)sendEvent
{
  if ([(ESBiomeAsrRecord *)self qualify])
  {
    v3 = BiomeLibrary();
    v4 = [v3 Dictation];
    v5 = [v4 UserEdit];

    if (v5)
    {
      v26 = v5;
      id v6 = objc_alloc((Class)BMDictationUserEditRequestMetadata);
      language = self->_language;
      taskName = self->_taskName;
      v9 = +[NSNumber numberWithUnsignedInteger:self->_samplingRate];
      id v25 = objc_msgSend(v6, "initWithTask:language:sampling_rate:", taskName, language, v9);

      id v27 = objc_alloc_init((Class)NSMutableArray);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v24 = self;
      obj = self->_selectedAlternatives;
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v15 = [v14 objectForKeyedSubscript:@"replacementText"];
            v16 = [v14 objectForKeyedSubscript:@"originalText"];
            if ([v15 length] && objc_msgSend(v16, "length"))
            {
              id v17 = objc_alloc((Class)BMDictationUserEditConfusionPair);
              v38 = v16;
              v18 = +[NSArray arrayWithObjects:&v38 count:1];
              v37 = v15;
              v19 = +[NSArray arrayWithObjects:&v37 count:1];
              id v20 = [v17 initWithIndex:0 recognizedTokens:v18 correctedTokens:v19];

              [v27 addObject:v20];
            }
          }
          id v11 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
        }
        while (v11);
      }

      id v21 = [objc_alloc((Class)BMDictationUserEdit) initWithAsrID:v24->_asrId interactionID:v24->_interactionId metadata:v25 startIndex:0 endIndex:0 correctedText:v24->_correctedText recognizedText:v24->_recognizedText recognizedTokens:v24->_recognizedTokens alternativeSelections:v27];
      v22 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[ESBiomeAsrRecord sendEvent]";
        __int16 v35 = 2112;
        id v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Donating edit record to Biome: %@", buf, 0x16u);
      }
      v5 = v26;
      v23 = [v26 source];
      [v23 sendEvent:v21];
    }
  }
}

- (BOOL)qualify
{
  if (self->_hasRecognizedAnything)
  {
    NSUInteger v3 = [(NSArray *)self->_recognizedTokens count];
    if (v3)
    {
      NSUInteger v3 = [(NSString *)self->_recognizedText length];
      if (v3)
      {
        NSUInteger v3 = [(NSString *)self->_correctedText length];
        if (v3) {
          LOBYTE(v3) = ![(NSString *)self->_recognizedText isEqualToString:self->_correctedText];
        }
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setCorrectedText:(id)a3 interactionId:(id)a4
{
  id v8 = a3;
  if ([a4 isEqualToString:self->_interactionId])
  {
    id v6 = (NSString *)[v8 copy];
    correctedText = self->_correctedText;
    self->_correctedText = v6;
  }
}

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (ESBiomeAsrRecord)initWithAsrId:(id)a3 interactionId:(id)a4 language:(id)a5 taskName:(id)a6 samplingRate:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v31.receiver = self;
  v31.super_class = (Class)ESBiomeAsrRecord;
  v16 = [(ESBiomeAsrRecord *)&v31 init];
  if (v16)
  {
    if (![v15 isEqualToString:@"Dictation"]) {
      goto LABEL_11;
    }
    if (![v12 length]) {
      goto LABEL_11;
    }
    if (![v13 length]) {
      goto LABEL_11;
    }
    if (![v14 length]) {
      goto LABEL_11;
    }
    if (!AFDeviceSupportsSiriUOD()) {
      goto LABEL_11;
    }
    id v17 = +[AFPreferences sharedPreferences];
    unsigned __int8 v18 = [v17 isDictationHIPAACompliant];

    if ((v18 & 1) != 0
      || (+[AFPreferences sharedPreferences],
          v19 = objc_claimAutoreleasedReturnValue(),
          id v20 = [v19 siriDataSharingOptInStatus],
          v19,
          v20 != (id)1))
    {
LABEL_11:
      long long v29 = 0;
      goto LABEL_12;
    }
    id v21 = (NSString *)[v12 copy];
    asrId = v16->_asrId;
    v16->_asrId = v21;

    v23 = (NSString *)[v13 copy];
    interactionId = v16->_interactionId;
    v16->_interactionId = v23;

    id v25 = (NSString *)[v14 copy];
    language = v16->_language;
    v16->_language = v25;

    id v27 = (NSString *)[v15 copy];
    taskName = v16->_taskName;
    v16->_taskName = v27;

    v16->_samplingRate = a7;
  }
  long long v29 = v16;
LABEL_12:

  return v29;
}

@end