@interface NSData
+ (id)sha1StringForNSData:(id)a3;
- (NSString)sha1String;
@end

@implementation NSData

+ (id)sha1StringForNSData:(id)a3
{
  id v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = &c;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9708;
  v8[3] = &unk_28A10;
  v8[4] = v9;
  [v3 enumerateByteRangesUsingBlock:v8];
  CC_SHA1_Final(md, &c);
  v4 = +[NSMutableString stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02X", md[i]);
  id v6 = [v4 copy];

  _Block_object_dispose(v9, 8);

  return v6;
}

- (NSString)sha1String
{
  id v3 = objc_opt_class();

  return (NSString *)[v3 sha1StringForNSData:self];
}

@end