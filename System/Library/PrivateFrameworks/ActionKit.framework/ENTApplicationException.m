@interface ENTApplicationException
+ (id)exceptionWithType:(int)a3 reason:(id)a4;
+ (id)read:(id)a3;
- (ENTApplicationException)initWithType:(int)a3 reason:(id)a4;
- (void)write:(id)a3;
@end

@implementation ENTApplicationException

- (void)write:(id)a3
{
  id v6 = a3;
  [v6 writeStructBeginWithName:@"TApplicationException"];
  v4 = [(ENTApplicationException *)self reason];

  if (v4)
  {
    [v6 writeFieldBeginWithName:@"message" type:11 fieldID:1];
    v5 = [(ENTApplicationException *)self reason];
    [v6 writeString:v5];

    [v6 writeFieldEnd];
  }
  [v6 writeFieldBeginWithName:@"type" type:8 fieldID:2];
  [v6 writeI32:self->_type];
  [v6 writeFieldEnd];
  [v6 writeFieldStop];
  [v6 writeStructEnd];
}

- (ENTApplicationException)initWithType:(int)a3 reason:(id)a4
{
  self->_type = a3;
  if ((a3 - 1) > 4) {
    v4 = @"Unknown";
  }
  else {
    v4 = *(&off_264E5A170 + (a3 - 1));
  }
  v6.receiver = self;
  v6.super_class = (Class)ENTApplicationException;
  return [(ENTApplicationException *)&v6 initWithName:v4 reason:a4 userInfo:0];
}

+ (id)exceptionWithType:(int)a3 reason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  objc_super v6 = [[ENTApplicationException alloc] initWithType:v4 reason:v5];

  return v6;
}

+ (id)read:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  [v3 readStructBeginReturningName:0];
  [v3 readFieldBeginReturningName:0 type:(char *)&v10 + 4 fieldID:&v10];
  int v4 = HIDWORD(v10);
  if (HIDWORD(v10))
  {
    uint64_t v5 = 0;
    objc_super v6 = 0;
    while (1)
    {
      if (v10 == 2)
      {
        if (v4 != 8) {
          goto LABEL_9;
        }
        uint64_t v5 = [v3 readI32];
      }
      else
      {
        if (v10 != 1 || v4 != 11)
        {
LABEL_9:
          +[ENTProtocolUtil skipType:onProtocol:](ENTProtocolUtil, "skipType:onProtocol:");
          goto LABEL_10;
        }
        uint64_t v7 = [v3 readString];

        objc_super v6 = (void *)v7;
      }
LABEL_10:
      [v3 readFieldEnd];
      [v3 readFieldBeginReturningName:0 type:(char *)&v10 + 4 fieldID:&v10];
      int v4 = HIDWORD(v10);
      if (!HIDWORD(v10)) {
        goto LABEL_13;
      }
    }
  }
  objc_super v6 = 0;
  uint64_t v5 = 0;
LABEL_13:
  [v3 readStructEnd];
  v8 = +[ENTApplicationException exceptionWithType:v5 reason:v6];

  return v8;
}

@end