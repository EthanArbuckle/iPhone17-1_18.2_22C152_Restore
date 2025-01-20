@interface NSURL(HealthRecordServices)
- (id)hrs_URLByExpandingReference:()HealthRecordServices;
@end

@implementation NSURL(HealthRecordServices)

- (id)hrs_URLByExpandingReference:()HealthRecordServices
{
  id v4 = a3;
  id v5 = a1;
  v6 = [v5 absoluteString];
  char v7 = [v6 hasSuffix:@"/"];

  if ((v7 & 1) == 0)
  {
    v8 = NSURL;
    v9 = [v5 absoluteString];
    v10 = [v9 stringByAppendingString:@"/"];
    uint64_t v11 = [v8 URLWithString:v10];

    id v5 = (id)v11;
  }
  v12 = [NSURL URLWithString:v4 relativeToURL:v5];

  return v12;
}

@end