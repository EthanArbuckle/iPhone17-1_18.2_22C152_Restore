@interface NSUUID
+ (id)ad_createV5UUIDWithNamespace:(id)a3;
@end

@implementation NSUUID

+ (id)ad_createV5UUIDWithNamespace:(id)a3
{
  id v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  sub_100078E50(&c, v3);
  v8 = (void **)&v15;
  v4 = v14;
  if (v14)
  {
    do
    {
      sub_100078E50(&c, v4);
      v5 = v8++;
      v4 = *v5;
    }
    while (*v5);
  }
  CC_SHA1_Final(md, &c);
  char v11 = v11 & 0xF | 0x50;
  char v12 = v12 & 0x3F | 0x80;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:md];

  return v6;
}

@end