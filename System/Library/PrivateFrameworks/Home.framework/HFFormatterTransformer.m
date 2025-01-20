@interface HFFormatterTransformer
- (HFFormatterTransformer)init;
- (HFFormatterTransformer)initWithSourceFormatter:(id)a3 transformBlock:(id)a4;
- (NSFormatter)sourceFormatter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (id)transformBlock;
- (void)setSourceFormatter:(id)a3;
- (void)setTransformBlock:(id)a3;
@end

@implementation HFFormatterTransformer

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  v5 = [(HFFormatterTransformer *)self sourceFormatter];
  v6 = [v5 stringForObjectValue:v4];

  v7 = [(HFFormatterTransformer *)self transformBlock];

  if (v7)
  {
    v8 = [(HFFormatterTransformer *)self transformBlock];
    uint64_t v9 = ((void (**)(void, void *, id))v8)[2](v8, v6, v4);

    v6 = (void *)v9;
  }

  return v6;
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (NSFormatter)sourceFormatter
{
  return self->_sourceFormatter;
}

- (HFFormatterTransformer)initWithSourceFormatter:(id)a3 transformBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7 || !v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFFormatterTransformer.m", 19, @"Invalid parameter not satisfying: %@", @"sourceFormatter && transformBlock" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HFFormatterTransformer;
  v10 = [(HFFormatterTransformer *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(HFFormatterTransformer *)v10 setSourceFormatter:v7];
    [(HFFormatterTransformer *)v11 setTransformBlock:v9];
  }

  return v11;
}

- (void)setTransformBlock:(id)a3
{
}

- (void)setSourceFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transformBlock, 0);
  objc_storeStrong((id *)&self->_sourceFormatter, 0);
}

- (HFFormatterTransformer)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithSourceFormatter_transformBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFFormatterTransformer.m", 29, @"%s is unavailable; use %@ instead",
    "-[HFFormatterTransformer init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFFormatterTransformer *)self sourceFormatter];
  v6 = [(HFFormatterTransformer *)self transformBlock];
  id v7 = (void *)[v4 initWithSourceFormatter:v5 transformBlock:v6];

  return v7;
}

@end