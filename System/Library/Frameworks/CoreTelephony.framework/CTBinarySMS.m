@interface CTBinarySMS
- (BOOL)isValid;
- (CTBinarySMS)init;
- (CTXPCServiceSubscriptionContext)context;
- (NSData)payload;
- (NSString)destinationAddress;
- (NSString)smscAddress;
- (int)dstPort;
- (int)portAddressingScheme;
- (int)smsType;
- (int)srcPort;
- (void)setContext:(id)a3;
- (void)setDestinationAddress:(id)a3;
- (void)setDstPort:(int)a3;
- (void)setPayload:(id)a3;
- (void)setPortAddressingScheme:(int)a3;
- (void)setSmsType:(int)a3;
- (void)setSmscAddress:(id)a3;
- (void)setSrcPort:(int)a3;
@end

@implementation CTBinarySMS

- (CTBinarySMS)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTBinarySMS;
  v2 = [(CTBinarySMS *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CTBinarySMS *)v2 setPortAddressingScheme:0];
    [(CTBinarySMS *)v3 setSrcPort:0];
    [(CTBinarySMS *)v3 setDstPort:0];
    [(CTBinarySMS *)v3 setPayload:0];
    [(CTBinarySMS *)v3 setDestinationAddress:0];
    [(CTBinarySMS *)v3 setSmscAddress:0];
    [(CTBinarySMS *)v3 setContext:0];
    [(CTBinarySMS *)v3 setSmsType:0];
  }
  return v3;
}

- (BOOL)isValid
{
  v3 = [(CTBinarySMS *)self payload];

  if (!v3) {
    return 0;
  }
  v4 = [(CTBinarySMS *)self destinationAddress];
  BOOL v5 = v4 != 0;

  return v5;
}

- (int)portAddressingScheme
{
  return self->_portAddressingScheme;
}

- (void)setPortAddressingScheme:(int)a3
{
  self->_portAddressingScheme = a3;
}

- (int)srcPort
{
  return self->_srcPort;
}

- (void)setSrcPort:(int)a3
{
  self->_srcPort = a3;
}

- (int)dstPort
{
  return self->_dstPort;
}

- (void)setDstPort:(int)a3
{
  self->_dstPort = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setDestinationAddress:(id)a3
{
}

- (NSString)smscAddress
{
  return self->_smscAddress;
}

- (void)setSmscAddress:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (int)smsType
{
  return self->_smsType;
}

- (void)setSmsType:(int)a3
{
  self->_smsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_smscAddress, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end