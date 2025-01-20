@interface _HFItemUpdateRequestContext
- (HFCharacteristicReadPolicy)readPolicy;
- (HFUpdateLogger)logger;
- (NSDictionary)updateOptions;
- (SEL)senderSelector;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLogger:(id)a3;
- (void)setReadPolicy:(id)a3;
- (void)setSenderSelector:(SEL)a3;
- (void)setUpdateOptions:(id)a3;
@end

@implementation _HFItemUpdateRequestContext

- (HFUpdateLogger)logger
{
  return self->_logger;
}

- (NSDictionary)updateOptions
{
  if (self->_updateOptions) {
    return self->_updateOptions;
  }
  else {
    return (NSDictionary *)MEMORY[0x263EFFA78];
  }
}

- (SEL)senderSelector
{
  return self->_senderSelector;
}

- (HFCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (void)setLogger:(id)a3
{
}

- (void)setSenderSelector:(SEL)a3
{
  self->_senderSelector = a3;
}

- (void)setReadPolicy:(id)a3
{
}

- (void)setUpdateOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readPolicy, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_updateOptions, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSenderSelector:", -[_HFItemUpdateRequestContext senderSelector](self, "senderSelector"));
  v5 = [(_HFItemUpdateRequestContext *)self updateOptions];
  [v4 setUpdateOptions:v5];

  v6 = [(_HFItemUpdateRequestContext *)self logger];
  [v4 setLogger:v6];

  v7 = [(_HFItemUpdateRequestContext *)self readPolicy];
  [v4 setReadPolicy:v7];

  return v4;
}

@end