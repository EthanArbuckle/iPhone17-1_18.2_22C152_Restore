@interface SiriTTSSynthesisVoice
- (id)SAVoiceGender;
- (id)SAVoiceQuality;
- (id)SAVoiceType;
- (int64_t)AFVoiceFootprint;
- (int64_t)AFVoiceGender;
- (void)updateWithTargetVoice:(id)a3;
@end

@implementation SiriTTSSynthesisVoice

- (id)SAVoiceType
{
  v2 = (char *)[(SiriTTSSynthesisVoice *)self type];
  if ((unint64_t)(v2 - 1) > 3) {
    v3 = (void **)&SAVoiceVoiceTypeUndefinedValue;
  }
  else {
    v3 = (void **)*(&off_100504678 + (void)(v2 - 1));
  }
  v4 = *v3;
  return v4;
}

- (id)SAVoiceQuality
{
  id v2 = [(SiriTTSSynthesisVoice *)self footprint];
  if ((unint64_t)v2 > 3) {
    v3 = (void **)&SAVoiceQualityUnknownValue;
  }
  else {
    v3 = (void **)*(&off_100504658 + (void)v2);
  }
  v4 = *v3;
  return v4;
}

- (id)SAVoiceGender
{
  id v2 = (char *)[(SiriTTSSynthesisVoice *)self gender];
  if ((unint64_t)(v2 - 1) > 2) {
    v3 = (void **)&SAVoiceGenderUnknownValue;
  }
  else {
    v3 = (void **)*(&off_100504640 + (void)(v2 - 1));
  }
  v4 = *v3;
  return v4;
}

- (int64_t)AFVoiceFootprint
{
  unint64_t v2 = (unint64_t)[(SiriTTSSynthesisVoice *)self footprint];
  if (v2 > 3) {
    return 0;
  }
  else {
    return qword_1003E2B28[v2];
  }
}

- (int64_t)AFVoiceGender
{
  int64_t result = (int64_t)[(SiriTTSSynthesisVoice *)self gender];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (void)updateWithTargetVoice:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  id v13 = [v5 lowercaseString];

  v6 = [v4 language];

  v7 = [(SiriTTSSynthesisVoice *)self language];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(SiriTTSSynthesisVoice *)self setLanguage:v6];
  }
  id v9 = v13;
  if (!v13) {
    goto LABEL_5;
  }
  v10 = [(SiriTTSSynthesisVoice *)self name];
  v11 = [v10 lowercaseString];
  unsigned __int8 v12 = [v13 isEqualToString:v11];

  id v9 = v13;
  if ((v12 & 1) == 0)
  {
    [(SiriTTSSynthesisVoice *)self setName:v13];
  }
  else
  {
LABEL_5:
    if (v8)
    {
      [(SiriTTSSynthesisVoice *)self setName:v9];
      goto LABEL_9;
    }
  }
  [(SiriTTSSynthesisVoice *)self setFootprint:1];
  [(SiriTTSSynthesisVoice *)self setType:1];
  [(SiriTTSSynthesisVoice *)self setVersion:0];
LABEL_9:
}

@end