@interface EKAlarmSemanticIdentifierGenerator
+ (id)_stringForAlarmProximity:(int64_t)a3;
+ (id)semanticIdentifierForAlarm:(id)a3;
+ (id)semanticIdentifierForAlarmIsDefault:(BOOL)a3 absoluteDate:(id)a4 relativeOffset:(id)a5 emailAddress:(id)a6 url:(id)a7;
@end

@implementation EKAlarmSemanticIdentifierGenerator

+ (id)semanticIdentifierForAlarm:(id)a3
{
  id v3 = a3;
  if ([v3 isDefaultAlarm])
  {
    v4 = @"kDefaultAlarmSemanticIdentifier";
  }
  else
  {
    v5 = [v3 absoluteDate];
    v6 = NSNumber;
    [v3 relativeOffset];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    v4 = +[EKAlarmSemanticIdentifierGenerator semanticIdentifierForAlarmIsDefault:0 absoluteDate:v5 relativeOffset:v7 emailAddress:0 url:0];
  }

  return v4;
}

+ (id)semanticIdentifierForAlarmIsDefault:(BOOL)a3 absoluteDate:(id)a4 relativeOffset:(id)a5 emailAddress:(id)a6 url:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a3)
  {
    v15 = @"kDefaultAlarmSemanticIdentifier";
  }
  else
  {
    v16 = [MEMORY[0x1E4F28E78] string];
    if (v11)
    {
      [v11 timeIntervalSinceReferenceDate];
      objc_msgSend(v16, "appendFormat:", @"ABSOLUTE=%f;", v17);
    }
    else
    {
      [v12 doubleValue];
      objc_msgSend(v16, "appendFormat:", @"RELATIVE=%f;", v18);
    }
    if (v13) {
      [v16 appendFormat:@"EMAIL=%@;", v13];
    }
    v19 = [v14 absoluteString];

    if (v19)
    {
      v20 = [v14 absoluteString];
      [v16 appendFormat:@"URL=%@;", v20];
    }
    v15 = (__CFString *)[v16 copy];
  }

  return v15;
}

+ (id)_stringForAlarmProximity:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"None";
  }
  else {
    return off_1E5B97BC8[a3 - 1];
  }
}

@end