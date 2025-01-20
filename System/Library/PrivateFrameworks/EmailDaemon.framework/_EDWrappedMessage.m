@interface _EDWrappedMessage
- (EMMessage)message;
- (_EDWrappedMessage)initWithMessage:(id)a3 databaseID:(int64_t)a4;
- (int64_t)databaseID;
@end

@implementation _EDWrappedMessage

- (_EDWrappedMessage)initWithMessage:(id)a3 databaseID:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EDWrappedMessage;
  v8 = [(_EDWrappedMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v9->_databaseID = a4;
  }

  return v9;
}

- (EMMessage)message
{
  return self->_message;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void).cxx_destruct
{
}

@end