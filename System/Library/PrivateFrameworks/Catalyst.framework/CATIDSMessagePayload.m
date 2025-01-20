@interface CATIDSMessagePayload
+ (id)instanceWithDictionary:(id)a3;
- (CATIDSMessage)message;
- (CATIDSMessageMetadata)metadata;
- (CATIDSMessagePayload)initWithMessage:(id)a3;
- (CATIDSMessagePayload)initWithMetadata:(id)a3 message:(id)a4;
- (NSDictionary)dictionaryValue;
- (id)messageContent;
@end

@implementation CATIDSMessagePayload

- (CATIDSMessagePayload)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = -[CATIDSMessageMetadata initWithMessageType:]([CATIDSMessageMetadata alloc], "initWithMessageType:", [v4 messageType]);
  v6 = [(CATIDSMessagePayload *)self initWithMetadata:v5 message:v4];

  return v6;
}

- (CATIDSMessagePayload)initWithMetadata:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATIDSMessagePayload;
  v9 = [(CATIDSMessagePayload *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v10;
}

- (NSDictionary)dictionaryValue
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"MessageMetadata";
  v3 = [(CATIDSMessagePayload *)self metadata];
  id v4 = [v3 dictionaryValue];
  v8[1] = @"MessageContent";
  v9[0] = v4;
  v5 = [(CATIDSMessagePayload *)self messageContent];
  v9[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"MessageMetadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [v3 objectForKeyedSubscript:@"MessageContent"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = 0;
  if (v6) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    objc_super v12 = +[CATIDSMessageMetadata instanceWithDictionary:v6];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 messageType];
      if (v14 == 101)
      {
        v15 = off_2641DB940;
      }
      else
      {
        if (v14 != 102) {
          goto LABEL_18;
        }
        v15 = off_2641DB8F0;
      }
      uint64_t v16 = [(__objc2_class *)*v15 instanceWithDictionary:v9];
      if (v16)
      {
        v17 = (void *)v16;
        v10 = [[CATIDSMessagePayload alloc] initWithMetadata:v13 message:v16];

LABEL_19:
        goto LABEL_20;
      }
    }
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

- (id)messageContent
{
  v2 = [(CATIDSMessagePayload *)self message];
  id v3 = [v2 dictionaryValue];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:@"Catalyst" forKeyedSubscript:@"Yo"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (CATIDSMessageMetadata)metadata
{
  return self->_metadata;
}

- (CATIDSMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end