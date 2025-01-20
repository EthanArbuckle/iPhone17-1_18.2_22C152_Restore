@interface EARLanguageDetectorResultStream.XPCProxy
- (_TtCC6Speech31EARLanguageDetectorResultStream8XPCProxy)init;
- (void)languageDetectorDidFinishWithError:(id)a3;
- (void)languageDetectorDidRecognizeResult:(id)a3 processedAudioDuration:(double)a4;
@end

@implementation EARLanguageDetectorResultStream.XPCProxy

- (void)languageDetectorDidFinishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1B71E9338(a3);
}

- (void)languageDetectorDidRecognizeResult:(id)a3 processedAudioDuration:(double)a4
{
  id v6 = a3;
  v7 = self;
  sub_1B71E943C(v6, a4);
}

- (_TtCC6Speech31EARLanguageDetectorResultStream8XPCProxy)init
{
}

- (void).cxx_destruct
{
}

@end