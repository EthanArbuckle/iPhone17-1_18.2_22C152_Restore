@interface _INAggregator
+ (BOOL)_canReportDistributionOfVocabularyStringType:(int64_t)a3;
+ (double)roundCount:(unint64_t)a3 toSignificantFigure:(unint64_t)a4;
+ (id)_distributionKeyForVocabularyStringType:(int64_t)a3;
+ (unint64_t)_singificantFigureForVocabularyStringType:(int64_t)a3;
+ (void)logReceivedCount:(unint64_t)a3 ofVocabularyStringType:(int64_t)a4;
+ (void)resetSynapseVocabularyUpdate;
@end

@implementation _INAggregator

+ (void)logReceivedCount:(unint64_t)a3 ofVocabularyStringType:(int64_t)a4
{
  id v7 = [a1 _distributionKeyForVocabularyStringType:a4];
  if (v7)
  {
    objc_msgSend(a1, "roundCount:toSignificantFigure:", a3, objc_msgSend(a1, "_singificantFigureForVocabularyStringType:", a4));
    ADClientPushValueForDistributionKey();
  }
  ADClientAddValueForScalarKey();
}

+ (double)roundCount:(unint64_t)a3 toSignificantFigure:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  if (a3)
  {
    if (a4)
    {
      double v6 = (double)a3;
      double v7 = log10((double)a3);
      double v8 = __exp10((double)a4 - ceil(v7));
      return round(v8 * v6) / v8;
    }
    else
    {
      v9 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315138;
        v12 = "+[_INAggregator roundCount:toSignificantFigure:]";
        _os_log_error_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_ERROR, "%s WARNING: asking to round a value to 0 significant figures makes no sense — answer is 0.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  return v4;
}

+ (unint64_t)_singificantFigureForVocabularyStringType:(int64_t)a3
{
  unint64_t result = 2;
  if (a3 > 699)
  {
    if ((unint64_t)(a3 - 700) < 5 || a3 == 50003 || a3 == 50000) {
      return 1;
    }
  }
  else
  {
    if (a3 <= 399)
    {
      if ((unint64_t)(a3 - 300) >= 2 && a3 != 2 && a3 != 200) {
        return result;
      }
      return 1;
    }
    if ((unint64_t)(a3 - 400) < 2 || (unint64_t)(a3 - 500) < 2) {
      return 1;
    }
  }
  return result;
}

+ (id)_distributionKeyForVocabularyStringType:(int64_t)a3
{
  if (objc_msgSend(a1, "_canReportDistributionOfVocabularyStringType:"))
  {
    double v4 = _INStringFromVocabularyStringType(a3);
    v5 = [v4 stringByReplacingOccurrencesOfString:@"INVocabularyStringType" withString:@"com.apple.siri.UserVocabularyStringCount."];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_canReportDistributionOfVocabularyStringType:(int64_t)a3
{
  return 1;
}

+ (void)resetSynapseVocabularyUpdate
{
}

@end