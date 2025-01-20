@interface WCMessageRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)expectsResponse;
- (BOOL)isEqual:(id)a3;
- (WCMessageRequest)initWithCoder:(id)a3;
- (WCMessageRequest)initWithPairingID:(id)a3 identifier:(id)a4 data:(id)a5 dictionaryMessage:(BOOL)a6 expectsResponse:(BOOL)a7;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectsResponse:(BOOL)a3;
@end

@implementation WCMessageRequest

- (WCMessageRequest)initWithPairingID:(id)a3 identifier:(id)a4 data:(id)a5 dictionaryMessage:(BOOL)a6 expectsResponse:(BOOL)a7
{
  v9.receiver = self;
  v9.super_class = (Class)WCMessageRequest;
  result = [(WCMessage *)&v9 initWithPairingID:a3 identifier:a4 data:a5 dictionaryMessage:a6];
  if (result) {
    result->_expectsResponse = a7;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WCMessageRequest;
  id v4 = a3;
  [(WCMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_expectsResponse, @"expectsResponse", v5.receiver, v5.super_class);
}

- (WCMessageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WCMessageRequest;
  objc_super v5 = [(WCMessage *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_expectsResponse = [v4 decodeBoolForKey:@"expectsResponse"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(WCMessage *)self pairingID];
  objc_super v7 = [(WCMessage *)self identifier];
  v8 = [(WCMessage *)self data];
  uint64_t v9 = [v8 length];
  if ([(WCMessage *)self isDictionaryMessage]) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  if ([(WCMessageRequest *)self expectsResponse]) {
    v11 = "YES";
  }
  else {
    v11 = "NO";
  }
  v12 = [v3 stringWithFormat:@"<%@: %p, pairingID: %@, identifier: %@, dataLength: %lu, isDictionary:%s, expectsResponse: %s>", v5, self, v6, v7, v9, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WCMessageRequest;
  return [(WCMessage *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)WCMessageRequest;
  return [(WCMessage *)&v3 hash];
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

@end