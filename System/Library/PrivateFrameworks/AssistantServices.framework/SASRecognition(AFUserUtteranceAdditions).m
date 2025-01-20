@interface SASRecognition(AFUserUtteranceAdditions)
- (AFUserUtterance)af_userUtteranceValueWithRefId:()AFUserUtteranceAdditions sessionId:;
- (id)af_bestTextInterpretationWithRefId:()AFUserUtteranceAdditions sessionId:;
@end

@implementation SASRecognition(AFUserUtteranceAdditions)

- (id)af_bestTextInterpretationWithRefId:()AFUserUtteranceAdditions sessionId:
{
  v1 = objc_msgSend(a1, "af_userUtteranceValueWithRefId:sessionId:");
  v2 = [v1 bestTextInterpretation];

  return v2;
}

- (AFUserUtterance)af_userUtteranceValueWithRefId:()AFUserUtteranceAdditions sessionId:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [AFUserUtterance alloc];
  v9 = objc_msgSend(a1, "af_speechPhrases");
  uint64_t v10 = [a1 sentenceConfidence];
  v11 = objc_msgSend(a1, "af_speechUtterances");
  v12 = objc_msgSend(a1, "af_correctionContextWithRefId:sessionId:", v7, v6);

  v13 = [(AFUserUtterance *)v8 initWithPhrases:v9 sentenceConfidence:v10 utterances:v11 correctionIdentifier:v12];
  return v13;
}

@end