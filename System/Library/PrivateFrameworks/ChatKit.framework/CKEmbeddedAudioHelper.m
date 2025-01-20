@interface CKEmbeddedAudioHelper
+ (BOOL)isEasyToRecognizeWord:(id)a3;
@end

@implementation CKEmbeddedAudioHelper

+ (BOOL)isEasyToRecognizeWord:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F61020];
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 currentLocale];
  LOBYTE(v3) = [v3 isEasyToRecognizeWord:v5 forLocale:v6];

  return (char)v3;
}

@end