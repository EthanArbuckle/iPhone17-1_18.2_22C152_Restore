@interface FTFaceTimeMessage
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)isValidMessage;
- (FTFaceTimeMessage)init;
- (NSData)sessionToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)dealloc;
- (void)setSessionToken:(id)a3;
@end

@implementation FTFaceTimeMessage

- (FTFaceTimeMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)FTFaceTimeMessage;
  v2 = [(FTIDSMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSBaseMessage *)v2 setTimeout:40.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FTFaceTimeMessage;
  id v4 = [(FTIDSMessage *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setSessionToken:", -[FTFaceTimeMessage sessionToken](self, "sessionToken"));
  return v4;
}

- (void)dealloc
{
  [(FTFaceTimeMessage *)self setSessionToken:0];
  v3.receiver = self;
  v3.super_class = (Class)FTFaceTimeMessage;
  [(FTIDSMessage *)&v3 dealloc];
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  NSUInteger v4 = [(NSString *)[(FTIDSMessage *)self selfURI] length];
  if (!v4)
  {
    _IMWarn();
    if (a3) {
      *a3 = (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"self URI"];
    }
  }
  return v4 != 0;
}

- (BOOL)isValidMessage
{
  objc_super v3 = [(FTFaceTimeMessage *)self sessionToken];
  if (!qword_268936AF8) {
    qword_268936AF8 = (uint64_t)(id)[@"0c0c0e0ececece" _FTDataFromHexString];
  }
  unint64_t v4 = [(NSData *)v3 length];
  if (v4 > [(id)qword_268936AF8 length] && qword_268936AF8 != 0)
  {
    objc_super v6 = -[NSData subdataWithRange:](v3, "subdataWithRange:", 0, [(id)qword_268936AF8 length]);
    if ([(NSData *)v6 isEqualToData:qword_268936AF8]) {
      return 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)FTFaceTimeMessage;
  return [(IDSBaseMessage *)&v8 isValidMessage];
}

- (id)requiredKeys
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"session-token"];
}

- (id)messageBody
{
  v6.receiver = self;
  v6.super_class = (Class)FTFaceTimeMessage;
  objc_super v3 = (__CFDictionary *)[(NSDictionary *)[(IDSBaseMessage *)&v6 messageBody] mutableCopy];
  if (!v3) {
    objc_super v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  unint64_t v4 = [(FTFaceTimeMessage *)self sessionToken];
  if (v4)
  {
    CFDictionarySetValue(v3, @"session-token", v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_2378FDE7C();
  }
  return v3;
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSessionToken:(id)a3
{
}

@end