@interface SASSpeechRecognized(AFUserUtteranceAdditions)
- (AFUserUtterance)af_userUtteranceValue;
- (id)af_bestTextInterpretation;
@end

@implementation SASSpeechRecognized(AFUserUtteranceAdditions)

- (id)af_bestTextInterpretation
{
  v1 = objc_msgSend(a1, "af_userUtteranceValue");
  v2 = [v1 bestTextInterpretation];

  return v2;
}

- (AFUserUtterance)af_userUtteranceValue
{
  v2 = [a1 recognition];
  v3 = [AFUserUtterance alloc];
  v4 = objc_msgSend(v2, "af_speechPhrases");
  uint64_t v5 = [v2 sentenceConfidence];
  v6 = objc_msgSend(v2, "af_speechUtterances");
  v7 = objc_msgSend(a1, "af_correctionContext");
  v8 = [(AFUserUtterance *)v3 initWithPhrases:v4 sentenceConfidence:v5 utterances:v6 correctionIdentifier:v7];

  return v8;
}

@end