@interface LSRUtilities
+ (id)emptyResultWithIsFinal:(BOOL)a3;
+ (id)recognizedResultFromEARPackage:(id)a3;
+ (id)transcriptionsWithEARTokens:(id)a3;
@end

@implementation LSRUtilities

+ (id)emptyResultWithIsFinal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [objc_alloc((Class)_EARSpeechRecognitionToken) initWithTokenName:&stru_10005A2E0 start:0 end:0 silenceStart:&stru_10005A2E0 confidence:&stru_10005A2E0 hasSpaceAfter:0.0 hasSpaceBefore:0.0 phoneSequence:0.0 ipaPhoneSequence:0.0];
  id v9 = v4;
  v5 = +[NSArray arrayWithObjects:&v9 count:1];
  v6 = +[LSRUtilities transcriptionsWithEARTokens:v5];
  id v7 = [objc_alloc((Class)SFSpeechRecognitionResult) _initWithBestTranscription:v6 rawTranscription:v6 final:v3 speechRecognitionMetadata:0];

  return v7;
}

+ (id)recognizedResultFromEARPackage:(id)a3
{
  id v32 = a3;
  v30 = [v32 audioAnalytics];
  BOOL v3 = [v30 acousticFeatures];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v11 = [v5 objectForKey:v10];
        id v12 = objc_alloc((Class)AFSpeechAcousticFeature);
        v13 = [v11 acousticFeatureValuePerFrame];
        [v11 frameDuration];
        id v14 = objc_msgSend(v12, "initWithAcousticFeatureValue:frameDuration:", v13);

        [v4 setValue:v14 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  v15 = [v30 speechRecognitionFeatures];
  id v16 = objc_alloc((Class)AFSpeechAudioAnalytics);
  [v30 snr];
  id v17 = objc_msgSend(v16, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:", v15, v4);

  v31 = [v32 recognition];
  v18 = [v31 tokenSausage];
  v19 = [v31 interpretationIndices];
  v20 = sub_1000341E4(v18, (uint64_t)v19);

  [v32 utteranceStart];
  v21 = +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v20, v17);
  [v32 utteranceStart];
  v22 = +[SFUtilities recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v20, v17);
  v23 = [v32 preITNRecognition];
  v24 = [v23 tokenSausage];
  v25 = [v23 interpretationIndices];
  v26 = sub_1000341E4(v24, (uint64_t)v25);

  [v32 utteranceStart];
  v27 = +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v26, v17);
  id v28 = objc_msgSend(objc_alloc((Class)SFSpeechRecognitionResult), "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", v21, v27, objc_msgSend(v32, "isFinal"), v22);

  return v28;
}

+ (id)transcriptionsWithEARTokens:(id)a3
{
  BOOL v3 = sub_1000348F0(a3, 0);
  id v4 = +[SFUtilities transcriptionsWithTokens:v3];

  return v4;
}

@end