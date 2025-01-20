@interface IDSPeerAccessoryMessage
- (NSData)accessToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setAccessToken:(id)a3;
@end

@implementation IDSPeerAccessoryMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IDSPeerAccessoryMessage;
  id v4 = [(IDSPeerMessage *)&v7 copyWithZone:a3];
  v5 = [(IDSPeerAccessoryMessage *)self accessToken];
  [v4 setAccessToken:v5];

  return v4;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"sP"];
  [v2 addObject:@"hT"];

  return v2;
}

- (id)messageBody
{
  v7.receiver = self;
  v7.super_class = (Class)IDSPeerAccessoryMessage;
  v3 = [(IDSPeerMessage *)&v7 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSPeerAccessoryMessage *)self accessToken];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"hT", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E000();
  }

  return Mutable;
}

- (NSData)accessToken
{
  return (NSData *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAccessToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end