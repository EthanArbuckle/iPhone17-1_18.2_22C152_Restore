@interface IDSOffGridDeliveryQueryResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUsableSenderKey;
- (IDSOffGridDeliveryQueryResult)init;
- (IDSOffGridDeliveryQueryResult)initWithCoder:(id)a3;
- (IDSURI)uri;
- (NSString)shortHandle;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setHasUsableSenderKey:(BOOL)a3;
- (void)setShortHandle:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUri:(id)a3;
@end

@implementation IDSOffGridDeliveryQueryResult

- (IDSOffGridDeliveryQueryResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryQueryResult;
  return [(IDSOffGridDeliveryQueryResult *)&v3 init];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(IDSOffGridDeliveryQueryResult *)self uri];
  v5 = [(IDSOffGridDeliveryQueryResult *)self shortHandle];
  int64_t v6 = [(IDSOffGridDeliveryQueryResult *)self status];
  BOOL v7 = [(IDSOffGridDeliveryQueryResult *)self hasUsableSenderKey];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  v9 = [v3 stringWithFormat:@"<IDSOffGridDeliveryQueryResult %p>: uri %@ short handle %@ status %ld hasUsableSenderKey %@", self, v4, v5, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uri = self->_uri;
  id v6 = a3;
  [v6 encodeObject:uri forKey:@"uri"];
  v5 = [NSNumber numberWithInteger:self->_status];
  [v6 encodeObject:v5 forKey:@"status"];

  [v6 encodeObject:self->_shortHandle forKey:@"shortHandle"];
  [v6 encodeBool:self->_hasUsableSenderKey forKey:@"hasUsableSenderKey"];
}

- (IDSOffGridDeliveryQueryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(IDSOffGridDeliveryQueryResult);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
  [(IDSOffGridDeliveryQueryResult *)v5 setUri:v6];

  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
  -[IDSOffGridDeliveryQueryResult setStatus:](v5, "setStatus:", (int)[v7 intValue]);

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortHandle"];
  [(IDSOffGridDeliveryQueryResult *)v5 setShortHandle:v8];

  uint64_t v9 = [v4 decodeBoolForKey:@"hasUsableSenderKey"];
  [(IDSOffGridDeliveryQueryResult *)v5 setHasUsableSenderKey:v9];

  return v5;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (NSString)shortHandle
{
  return self->_shortHandle;
}

- (void)setShortHandle:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)hasUsableSenderKey
{
  return self->_hasUsableSenderKey;
}

- (void)setHasUsableSenderKey:(BOOL)a3
{
  self->_hasUsableSenderKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortHandle, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

@end