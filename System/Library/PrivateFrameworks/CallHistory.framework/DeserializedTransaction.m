@interface DeserializedTransaction
- (CHRecentCall)call;
- (DeserializedTransaction)initWithCall:(id)a3 andType:(unint64_t)a4;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation DeserializedTransaction

- (DeserializedTransaction)initWithCall:(id)a3 andType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DeserializedTransaction;
  v8 = [(DeserializedTransaction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_call, a3);
    v9->_type = a4;
  }

  return v9;
}

- (CHRecentCall)call
{
  return self->_call;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end