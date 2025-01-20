@interface HAP2EncodedEmptyRequestThread
- (BOOL)isEncrypted;
- (HAP2EncodedEmptyRequestThread)initWithRequestType:(unint64_t)a3;
- (id)body;
- (id)serialize;
- (unint64_t)requestType;
@end

@implementation HAP2EncodedEmptyRequestThread

- (unint64_t)requestType
{
  return self->_requestType;
}

- (id)serialize
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)body
{
  return 0;
}

- (HAP2EncodedEmptyRequestThread)initWithRequestType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAP2EncodedEmptyRequestThread;
  result = [(HAP2EncodedEmptyRequestThread *)&v5 init];
  if (result) {
    result->_requestType = a3;
  }
  return result;
}

@end