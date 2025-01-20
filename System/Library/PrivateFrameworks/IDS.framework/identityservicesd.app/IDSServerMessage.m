@interface IDSServerMessage
- (BOOL)wantsBinaryPush;
- (IDSServerMessage)initWithPayload:(id)a3 command:(id)a4;
- (NSDictionary)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (int64_t)command;
- (void)setCommand:(int64_t)a3;
- (void)setPayload:(id)a3;
@end

@implementation IDSServerMessage

- (IDSServerMessage)initWithPayload:(id)a3 command:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSServerMessage;
  v8 = [(IDSServerMessage *)&v12 init];
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    payload = v8->_payload;
    v8->_payload = v9;

    v8->_command = (int64_t)[v7 integerValue];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IDSServerMessage;
  id v4 = [(IDSServerMessage *)&v6 copyWithZone:a3];
  [v4 setPayload:self->_payload];
  [v4 setCommand:self->_command];
  return v4;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)IDSServerMessage;
  v3 = [(IDSServerMessage *)&v10 messageBody];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v3 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  payload = self->_payload;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002983C8;
  v8[3] = &unk_100980928;
  objc_super v6 = Mutable;
  v9 = v6;
  [(NSDictionary *)payload enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_command = a3;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end