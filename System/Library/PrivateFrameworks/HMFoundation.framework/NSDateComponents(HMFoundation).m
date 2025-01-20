@interface NSDateComponents(HMFoundation)
+ (id)hmf_unarchiveFromData:()HMFoundation error:;
- (id)hmf_localTimeDescription;
@end

@implementation NSDateComponents(HMFoundation)

+ (id)hmf_unarchiveFromData:()HMFoundation error:
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

- (id)hmf_localTimeDescription
{
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<"];
  if ([a1 second] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = NSString;
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "second"));
    v5 = [v3 stringWithFormat:@"%@ s, ", v4];
    [v2 appendString:v5];
  }
  if ([a1 minute] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = NSString;
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "minute"));
    v8 = [v6 stringWithFormat:@"%@ m, ", v7];
    [v2 appendString:v8];
  }
  if ([a1 hour] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = NSString;
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "hour"));
    v11 = [v9 stringWithFormat:@"%@ h, ", v10];
    [v2 appendString:v11];
  }
  if ([a1 day] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = NSString;
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "day"));
    v14 = [v12 stringWithFormat:@"%@ d, ", v13];
    [v2 appendString:v14];
  }
  if ([a1 month] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = NSString;
    v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "month"));
    v17 = [v15 stringWithFormat:@"%@ mo, ", v16];
    [v2 appendString:v17];
  }
  [v2 appendString:@">"];
  v18 = (void *)[v2 copy];

  return v18;
}

@end