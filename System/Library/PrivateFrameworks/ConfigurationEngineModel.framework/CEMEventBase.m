@interface CEMEventBase
+ (id)eventForPayload:(id)a3 error:(id *)a4;
- (NSString)payloadType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation CEMEventBase

+ (id)eventForPayload:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Type"];
  v7 = (void *)v6;
  v8 = @"(nil)";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  if (+[CEMRegisteredTypeResolver registeredClassWithIdentifier:v9])
  {
    id v10 = (id)objc_opt_new();
    id v17 = 0;
    [v10 loadPayload:v5 error:&v17];
    id v11 = v17;
    v12 = v11;
    if (!v11)
    {
      id v10 = v10;
      v15 = v10;
      goto LABEL_12;
    }
    if (!a4)
    {
      v15 = 0;
      goto LABEL_12;
    }
    id v13 = v11;
    v12 = v13;
LABEL_9:
    v15 = 0;
    *a4 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v12 = [NSString stringWithFormat:@"Could not match event type: %@", v9];
    v19[0] = v12;
    id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v13 = [v14 errorWithDomain:@"error" code:1 userInfo:v10];
    goto LABEL_9;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMEventBase;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadType copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end