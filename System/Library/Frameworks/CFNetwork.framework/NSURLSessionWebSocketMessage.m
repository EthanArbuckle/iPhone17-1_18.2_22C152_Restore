@interface NSURLSessionWebSocketMessage
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)string;
- (NSURLSessionWebSocketMessage)initWithData:(NSData *)data;
- (NSURLSessionWebSocketMessage)initWithString:(NSString *)string;
- (NSURLSessionWebSocketMessageType)type;
- (id)description;
- (unint64_t)hash;
@end

@implementation NSURLSessionWebSocketMessage

- (void).cxx_destruct
{
}

- (id)description
{
  return (id)[self->content description];
}

- (unint64_t)hash
{
  return [self->content hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [self->content isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSURLSessionWebSocketMessageType)type
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSString)string
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->content;
  }
  else {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSData)data
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->content;
  }
  else {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSURLSessionWebSocketMessage)initWithString:(NSString *)string
{
  v4 = string;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionWebSocketMessage;
  char v5 = [(NSURLSessionWebSocketMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    content = v5->content;
    v5->content = v6;
  }
  return v5;
}

- (NSURLSessionWebSocketMessage)initWithData:(NSData *)data
{
  v4 = data;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionWebSocketMessage;
  char v5 = [(NSURLSessionWebSocketMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSData *)v4 copy];
    content = v5->content;
    v5->content = v6;
  }
  return v5;
}

@end