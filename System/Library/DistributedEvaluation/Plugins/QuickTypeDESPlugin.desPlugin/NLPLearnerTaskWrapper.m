@interface NLPLearnerTaskWrapper
+ (id)privacyIdentifierForTask:(int64_t)a3;
+ (int64_t)taskFromRecipe:(id)a3;
+ (void)initialize;
@end

@implementation NLPLearnerTaskWrapper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLP", "NLPLearnerTaskWrapper");
    v3 = (void *)qword_1F0F0;
    qword_1F0F0 = (uint64_t)v2;
  }
}

+ (int64_t)taskFromRecipe:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 isEqualToString:@"emoji"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"lm"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"char_lm"])
    {
      int64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"fragment_lm"])
    {
      int64_t v5 = 5;
    }
    else if ([v4 isEqualToString:@"act"])
    {
      int64_t v5 = 7;
    }
    else
    {
      v7 = qword_1F0F0;
      if (os_log_type_enabled((os_log_t)qword_1F0F0, OS_LOG_TYPE_ERROR)) {
        sub_10010((uint64_t)v4, v7);
      }
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

+ (id)privacyIdentifierForTask:(int64_t)a3
{
  v4 = qword_1F0F0;
  if (os_log_type_enabled((os_log_t)qword_1F0F0, OS_LOG_TYPE_ERROR)) {
    sub_10088(a3, v4);
  }
  return &stru_18AF0;
}

@end