@interface _GEOTrafficUpdateETARequestConfig
- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (BOOL)supportsOffline;
- (id)additionalURLQueryItems;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOTrafficUpdateETARequestConfig

- (unint64_t)urlType
{
  return 5;
}

- (id)additionalURLQueryItems
{
  v2 = GEOConfigGetString();
  if (v2)
  {
    v3 = +[NSCharacterSet characterSetWithCharactersInString:@"?"];
    v4 = [v2 stringByTrimmingCharactersInSet:v3];
    v5 = [v4 componentsSeparatedByString:@"="];

    if ([v5 count] == (id)2)
    {
      v6 = [v5 objectAtIndexedSubscript:0];
      v7 = [v5 objectAtIndexedSubscript:1];
      v8 = +[NSURLQueryItem queryItemWithName:v6 value:v7];

      v11 = v8;
      v9 = +[NSArray arrayWithObjects:&v11 count:1];
    }
    else
    {
      v9 = &__NSArray0__struct;
    }
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)serviceTypeNumber
{
  return &off_100077478;
}

- ($D10D8C5E6DF5C70B839224840994203A)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($D10D8C5E6DF5C70B839224840994203A)673;
}

- (BOOL)supportsOffline
{
  return 1;
}

@end