@interface CKDateUtilities
+ (id)relativeDateFormatterFromDate:(id)a3 toDate:(id)a4;
+ (id)relativeDateOnlyFormatterFromDate:(id)a3 toDate:(id)a4;
+ (id)relativeFullDateOnlyFormatterFromDate:(id)a3 toDate:(id)a4;
+ (id)thePastDateFormatter;
+ (id)thePastDateFormatterNoTime;
+ (id)thePastFullDateFormatterNoTime;
+ (id)theRelativeStandaloneDateFormatter;
+ (id)theShortDateNoTimeInSentenceDateFormatter;
+ (id)thisWeekRelativeDateFormatter;
+ (id)thisWeekRelativeDateFormatterNoTime;
+ (id)thisYearDateFormatter;
+ (id)thisYearDateFormatterNoTime;
+ (id)thisYearFullDateFormatterNoTime;
+ (id)timestampDateFormatter;
@end

@implementation CKDateUtilities

+ (id)relativeDateOnlyFormatterFromDate:(id)a3 toDate:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "__ck_currentCalendar");
  uint64_t v10 = objc_msgSend(v9, "__ck_unitOfDisambiguityFromDate:toDate:", v8, v7);

  if (v10 == 8)
  {
    v11 = [a1 thisYearDateFormatterNoTime];
  }
  else
  {
    if (v10 == 4) {
      [a1 thePastDateFormatterNoTime];
    }
    else {
    v11 = [a1 thisWeekRelativeDateFormatterNoTime];
    }
  }

  return v11;
}

+ (id)relativeDateFormatterFromDate:(id)a3 toDate:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "__ck_currentCalendar");
  uint64_t v10 = objc_msgSend(v9, "__ck_unitOfDisambiguityFromDate:toDate:", v8, v7);

  if (v10 == 8)
  {
    v11 = [a1 thisYearDateFormatter];
  }
  else
  {
    if (v10 == 4) {
      [a1 thePastDateFormatter];
    }
    else {
    v11 = [a1 thisWeekRelativeDateFormatter];
    }
  }

  return v11;
}

+ (id)relativeFullDateOnlyFormatterFromDate:(id)a3 toDate:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "__ck_currentCalendar");
  uint64_t v10 = objc_msgSend(v9, "__ck_unitOfDisambiguityFromDate:toDate:", v8, v7);

  if (v10 == 8)
  {
    v11 = [a1 thisYearFullDateFormatterNoTime];
  }
  else
  {
    if (v10 == 4) {
      [a1 thePastFullDateFormatterNoTime];
    }
    else {
    v11 = [a1 thisWeekRelativeDateFormatterNoTime];
    }
  }

  return v11;
}

+ (id)thisWeekRelativeDateFormatter
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:7];

  return v3;
}

+ (id)thisWeekRelativeDateFormatterNoTime
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:6];

  return v3;
}

+ (id)thisYearDateFormatterNoTime
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:5];

  return v3;
}

+ (id)thisYearFullDateFormatterNoTime
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:4];

  return v3;
}

+ (id)thisYearDateFormatter
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:3];

  return v3;
}

+ (id)thePastFullDateFormatterNoTime
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:2];

  return v3;
}

+ (id)thePastDateFormatterNoTime
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:1];

  return v3;
}

+ (id)thePastDateFormatter
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:0];

  return v3;
}

+ (id)theShortDateNoTimeInSentenceDateFormatter
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:8];

  return v3;
}

+ (id)timestampDateFormatter
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:9];

  return v3;
}

+ (id)theRelativeStandaloneDateFormatter
{
  v2 = +[CKDateFormatterHelper sharedInstance];
  v3 = [v2 getDateFormatterFor:10];

  return v3;
}

@end