@interface CRKYoIDSMessage
+ (id)instanceWithDictionary:(id)a3;
- (CRKYoIDSMessage)initWithMessage:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSString)message;
- (int64_t)messageType;
@end

@implementation CRKYoIDSMessage

- (CRKYoIDSMessage)initWithMessage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKYoIDSMessage;
  v5 = [(CRKYoIDSMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    message = v5->_message;
    v5->_message = (NSString *)v6;
  }
  return v5;
}

- (int64_t)messageType
{
  return 0;
}

- (NSDictionary)dictionaryValue
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"Yo";
  v2 = [(CRKYoIDSMessage *)self message];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"Yo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    v7 = (void *)[objc_alloc((Class)a1) initWithMessage:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end