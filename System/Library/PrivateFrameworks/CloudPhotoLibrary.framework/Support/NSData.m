@interface NSData
- (id)cplSummaryDescription;
@end

@implementation NSData

- (id)cplSummaryDescription
{
  v2 = [(NSData *)self base64EncodedStringWithOptions:0];
  v3 = (char *)[v2 length];
  if ((unint64_t)v3 < 0x33)
  {
    v7 = +[NSString stringWithFormat:@"%@", v2];
  }
  else
  {
    v4 = v3;
    uint64_t v5 = [v2 substringToIndex:25];
    v6 = [v2 substringFromIndex:v4 - 25];
    v7 = +[NSString stringWithFormat:@"%@...%@", v5, v6];

    v2 = (void *)v5;
  }

  return v7;
}

@end