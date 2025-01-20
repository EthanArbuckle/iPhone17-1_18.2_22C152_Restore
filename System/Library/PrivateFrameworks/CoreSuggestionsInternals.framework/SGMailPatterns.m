@interface SGMailPatterns
+ (id)headerPattern;
+ (id)headerPattern:(id)a3;
+ (id)headersPattern;
+ (id)messageSeparatorPattern;
+ (id)quotedRegionStartPattern;
+ (id)replyAttributionPattern;
@end

@implementation SGMailPatterns

+ (id)messageSeparatorPattern
{
  v2 = patterns_25310();
  v3 = [v2 regex2ForKey:@"Separator"];

  return v3;
}

+ (id)quotedRegionStartPattern
{
  v2 = patterns_25310();
  v3 = [v2 regex2ForKey:@"QuotedRegionStart"];

  return v3;
}

+ (id)headersPattern
{
  v2 = patterns_25310();
  v3 = [v2 regex2ForKey:@"Headers"];

  return v3;
}

+ (id)headerPattern
{
  v2 = patterns_25310();
  v3 = [v2 regex2ForKey:@"Header"];

  return v3;
}

+ (id)headerPattern:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1CB79B230]();
  v5 = patterns_25310();
  v6 = [@"Header" stringByAppendingString:v3];
  v7 = [v5 regex2ForKey:v6];

  return v7;
}

+ (id)replyAttributionPattern
{
  v2 = patterns_25310();
  id v3 = [v2 regex2ForKey:@"ReplyAttribution/F"];

  return v3;
}

@end