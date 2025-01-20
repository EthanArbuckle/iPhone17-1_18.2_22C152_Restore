@interface NSString
- (id)asc_sha246Hash;
- (id)asc_sha246HashData;
- (id)collapsingNewlines;
@end

@implementation NSString

- (id)asc_sha246HashData
{
  v2 = [(NSString *)self dataUsingEncoding:1];
  v3 = +[NSMutableData dataWithLength:32];
  id v4 = v2;
  id v5 = [v4 bytes];
  CC_LONG v6 = [v4 length];
  id v7 = v3;
  CC_SHA256(v5, v6, (unsigned __int8 *)[v7 mutableBytes]);

  return v7;
}

- (id)asc_sha246Hash
{
  v2 = [(NSString *)self asc_sha246HashData];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

- (id)collapsingNewlines
{
  v2 = +[NSMutableString stringWithString:self];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"([\\v]+)", @"\n", 1024, 0, objc_msgSend(v2, "length"));
  id v3 = [v2 copy];

  return v3;
}

@end