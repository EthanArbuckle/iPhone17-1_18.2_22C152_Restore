@interface SiriTTSSynthesisVoice(AFAddition)
- (uint64_t)AFVoiceFootprint;
@end

@implementation SiriTTSSynthesisVoice(AFAddition)

- (uint64_t)AFVoiceFootprint
{
  unint64_t v1 = [a1 footprint];
  if (v1 > 3) {
    return 0;
  }
  else {
    return qword_2230F5A98[v1];
  }
}

@end