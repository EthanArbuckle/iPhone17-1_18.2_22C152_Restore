@interface MTVoiceUtils
+ (id)loadVoiceBundle:(__CFBundle *)a3;
@end

@implementation MTVoiceUtils

+ (id)loadVoiceBundle:(__CFBundle *)a3
{
  v4 = objc_alloc_init(MTFVoice);
  [(MTFVoice *)v4 setPitchCoeff:SpeechChannelManager::ReadVoicePitchCoefficients(a3, v5)];
  uint64_t v13 = 0;
  SpeechChannelManager::ReadVoiceDescription(a3, (__CFBundle *)&v13, v6);
  [(MTFVoice *)v4 setVoiceData:v13];
  v7 = (__CFBundle *)[(MTFVoice *)v4 description][4];
  unint64_t v10 = 0;
  v11.var0 = 0;
  SpeechChannelManager::ReadPCMVoiceData(a3, v7, &v12, &v11, &v10, v8);
  [(MTFVoice *)v4 set_pcmData:v10];
  operator new();
}

@end