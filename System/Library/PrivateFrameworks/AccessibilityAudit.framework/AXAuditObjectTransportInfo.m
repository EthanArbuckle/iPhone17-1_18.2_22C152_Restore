@interface AXAuditObjectTransportInfo
- (AXAuditObjectTransportInfo)initWithTransportKey:(id)a3;
- (BOOL)requiresRawTransportDictionary;
- (NSString)transportKey;
- (id)canEncodeObjectBlock;
- (id)createLocalObjectBlock;
- (id)createTransportObjectBlock;
- (void)setCanEncodeObjectBlock:(id)a3;
- (void)setCreateLocalObjectBlock:(id)a3;
- (void)setCreateTransportObjectBlock:(id)a3;
- (void)setRequiresRawTransportDictionary:(BOOL)a3;
- (void)setTransportKey:(id)a3;
@end

@implementation AXAuditObjectTransportInfo

- (AXAuditObjectTransportInfo)initWithTransportKey:(id)a3
{
  id v5 = a3;
  v6 = [(AXAuditObjectTransportInfo *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transportKey, a3);
  }

  return v7;
}

- (NSString)transportKey
{
  return self->_transportKey;
}

- (void)setTransportKey:(id)a3
{
}

- (id)canEncodeObjectBlock
{
  return self->_canEncodeObjectBlock;
}

- (void)setCanEncodeObjectBlock:(id)a3
{
}

- (id)createTransportObjectBlock
{
  return self->_createTransportObjectBlock;
}

- (void)setCreateTransportObjectBlock:(id)a3
{
}

- (id)createLocalObjectBlock
{
  return self->_createLocalObjectBlock;
}

- (void)setCreateLocalObjectBlock:(id)a3
{
}

- (BOOL)requiresRawTransportDictionary
{
  return self->_requiresRawTransportDictionary;
}

- (void)setRequiresRawTransportDictionary:(BOOL)a3
{
  self->_requiresRawTransportDictionary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createLocalObjectBlock, 0);
  objc_storeStrong(&self->_createTransportObjectBlock, 0);
  objc_storeStrong(&self->_canEncodeObjectBlock, 0);

  objc_storeStrong((id *)&self->_transportKey, 0);
}

@end