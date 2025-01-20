@interface DTActivityTraceTapMessageHandler
- (id)messageReceived:(id)a3;
@end

@implementation DTActivityTraceTapMessageHandler

- (id)messageReceived:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTActivityTraceTapMessageHandler;
  uint64_t v5 = [(DTTapMessageHandler *)&v15 messageReceived:v4];
  v6 = (DTActivityTraceTapMemo *)v5;
  if (v4 && !v5)
  {
    id v7 = v4;
    if ([v7 getBufferWithReturnedLength:0])
    {
      v6 = [[DTActivityTraceTapMemo alloc] initWithMessage:v7];
    }
    else
    {
      v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      v9 = [v7 objectWithAllowedClasses:v8];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ((int v10 = [v9 kind], v10 == 8) || v10 == 5))
      {
        v11 = [DTActivityTraceTapMemo alloc];
        v12 = objc_opt_new();
        v13 = [(DTActivityTraceTapMemo *)v11 initWithData:v12];

        [(DTTapDataMemo *)v13 setFinalMemo:1];
      }
      else
      {
        v13 = 0;
      }
      v6 = v13;
    }
  }

  return v6;
}

@end