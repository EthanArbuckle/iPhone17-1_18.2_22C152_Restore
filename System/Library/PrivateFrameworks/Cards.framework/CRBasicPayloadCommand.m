@interface CRBasicPayloadCommand
- (NSDictionary)userInfo;
- (NSSecureCoding)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)commandDirection;
- (void)setCommandDirection:(unint64_t)a3;
- (void)setPayload:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CRBasicPayloadCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(CRBasicPayloadCommand);
  v6 = [(CRBasicPayloadCommand *)self payload];
  v7 = (void *)[v6 copyWithZone:a3];
  [(CRBasicPayloadCommand *)v5 setPayload:v7];

  v8 = [(CRBasicPayloadCommand *)self userInfo];
  v9 = (void *)[v8 copyWithZone:a3];
  [(CRBasicPayloadCommand *)v5 setUserInfo:v9];

  [(CRBasicPayloadCommand *)v5 setCommandDirection:[(CRBasicPayloadCommand *)self commandDirection]];
  return v5;
}

- (NSSecureCoding)payload
{
  return self->payload;
}

- (void)setPayload:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)commandDirection
{
  return self->commandDirection;
}

- (void)setCommandDirection:(unint64_t)a3
{
  self->commandDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userInfo, 0);
  objc_storeStrong((id *)&self->payload, 0);
}

@end