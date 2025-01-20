@interface DTActivityTraceTapMemo
- (DTActivityTraceTapMemo)initWithData:(id)a3;
- (DTActivityTraceTapMemo)initWithMessage:(id)a3;
- (const)getBufferWithLength:(unint64_t *)a3;
- (unint64_t)lastMachContinuousTimeSeen;
- (void)setLastMachContinuousTimeSeen:(unint64_t)a3;
@end

@implementation DTActivityTraceTapMemo

- (DTActivityTraceTapMemo)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTActivityTraceTapMemo;
  v6 = [(DTActivityTraceTapMemo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v8 = *(void **)&v7->super._supportsPeek;
    *(void *)&v7->super._supportsPeek = 0;
  }
  return v7;
}

- (DTActivityTraceTapMemo)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTActivityTraceTapMemo;
  id v6 = [(DTActivityTraceTapMemo *)&v9 init];
  v7 = (DTActivityTraceTapMemo *)v6;
  if (v6) {
    objc_storeStrong((id *)v6 + 2, a3);
  }

  return v7;
}

- (const)getBufferWithLength:(unint64_t *)a3
{
  id v5 = *(void **)&self->super._supportsPeek;
  if (v5)
  {
    unint64_t v8 = 0;
    result = (const void *)[v5 getBufferWithReturnedLength:&v8];
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    message = self->_message;
    if (message)
    {
      if (a3)
      {
        *a3 = [(DTXMessage *)message length];
        message = self->_message;
      }
      return (const void *)[(DTXMessage *)message bytes];
    }
    else
    {
      result = 0;
      if (a3) {
        *a3 = 0;
      }
    }
  }
  return result;
}

- (unint64_t)lastMachContinuousTimeSeen
{
  return (unint64_t)self->_data;
}

- (void)setLastMachContinuousTimeSeen:(unint64_t)a3
{
  self->_data = (NSData *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->super._supportsPeek, 0);
}

@end