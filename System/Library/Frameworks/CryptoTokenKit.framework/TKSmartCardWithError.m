@interface TKSmartCardWithError
- (TKSmartCardWithError)initWithCard:(id)a3 error:(id)a4;
- (void)beginSessionWithReply:(id)a3;
- (void)sendIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 le:(id)a7 reply:(id)a8;
- (void)transmitRequest:(id)a3 reply:(id)a4;
@end

@implementation TKSmartCardWithError

- (TKSmartCardWithError)initWithCard:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 slot];
  v12.receiver = self;
  v12.super_class = (Class)TKSmartCardWithError;
  v10 = [(TKSmartCard *)&v12 initWithSlot:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentCard, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (void)beginSessionWithReply:(id)a3
{
}

- (void)transmitRequest:(id)a3 reply:(id)a4
{
}

- (void)sendIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 le:(id)a7 reply:(id)a8
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_parentCard, 0);
}

@end