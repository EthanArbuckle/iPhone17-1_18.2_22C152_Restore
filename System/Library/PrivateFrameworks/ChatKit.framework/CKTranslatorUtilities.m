@interface CKTranslatorUtilities
+ (BOOL)chatItemIsFromSomeoneElse:(id)a3;
+ (BOOL)shouldShowTranslateMenuOption:(id)a3;
@end

@implementation CKTranslatorUtilities

+ (BOOL)shouldShowTranslateMenuOption:(id)a3
{
  id v3 = a3;
  if ([v3 isAudioMessage]
    && ([v3 audioTranscriptionText],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5)
    || ([v3 transcriptText], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    LOBYTE(v6) = [MEMORY[0x1E4FAFFF0] isAvailable];
  }

  return (char)v6;
}

+ (BOOL)chatItemIsFromSomeoneElse:(id)a3
{
  id v3 = a3;
  if CKIsRunningInMacCatalyst() || ([v3 isFromMe])
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end