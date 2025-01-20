@interface _CDInteractionFeedbackLogger
+ (id)aggdKeyForAdviceSource:(unint64_t)a3;
+ (id)aggdKeyForPresentationStyle:(unint64_t)a3;
+ (void)logFeedbackItemSelected:(id)a3 adviceSource:(unint64_t)a4 presentationStyle:(unint64_t)a5 itemsShown:(id)a6 bundleID:(id)a7;
@end

@implementation _CDInteractionFeedbackLogger

+ (void)logFeedbackItemSelected:(id)a3 adviceSource:(unint64_t)a4 presentationStyle:(unint64_t)a5 itemsShown:(id)a6 bundleID:(id)a7
{
  id v17 = a7;
  v11 = [a3 personId];

  if (v11)
  {
    v12 = NSString;
    v13 = [a1 aggdKeyForAdviceSource:a4];
    v14 = [a1 aggdKeyForPresentationStyle:a5];
    v15 = [v12 stringWithFormat:@"%@.source.%@.%@", @"com.apple.coreduet.interactionAdvisor.feedback", v13, v14];

    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:v15];
    v16 = [NSString stringWithFormat:@"%@.%@", v15, v17];

    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:v16];
  }
}

+ (id)aggdKeyForAdviceSource:(unint64_t)a3
{
  if (a3 > 2) {
    return @"other";
  }
  else {
    return off_1E56103C0[a3];
  }
}

+ (id)aggdKeyForPresentationStyle:(unint64_t)a3
{
  if (a3 > 3) {
    return @"autoComplete";
  }
  else {
    return off_1E56103D8[a3];
  }
}

@end