@interface HFSimpleFormatter
- (HFSimpleFormatter)init;
- (HFSimpleFormatter)initWithAttributedFormatterBlock:(id)a3;
- (HFSimpleFormatter)initWithFormatterBlock:(id)a3;
- (id)attributedFormatterBlock;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatterBlock;
- (id)stringForObjectValue:(id)a3;
@end

@implementation HFSimpleFormatter

- (HFSimpleFormatter)initWithFormatterBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFSimpleFormatter.m", 20, @"Invalid parameter not satisfying: %@", @"formatterBlock" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFSimpleFormatter;
  v6 = [(HFSimpleFormatter *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    id formatterBlock = v6->_formatterBlock;
    v6->_id formatterBlock = (id)v7;
  }
  return v6;
}

- (HFSimpleFormatter)initWithAttributedFormatterBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFSimpleFormatter.m", 31, @"Invalid parameter not satisfying: %@", @"formatterBlock" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFSimpleFormatter;
  v6 = [(HFSimpleFormatter *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    id attributedFormatterBlock = v6->_attributedFormatterBlock;
    v6->_id attributedFormatterBlock = (id)v7;
  }
  return v6;
}

- (HFSimpleFormatter)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithFormatterBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSimpleFormatter.m", 42, @"%s is unavailable; use %@ instead",
    "-[HFSimpleFormatter init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HFSimpleFormatter allocWithZone:a3];
  id v5 = [(HFSimpleFormatter *)self formatterBlock];
  v6 = [(HFSimpleFormatter *)v4 initWithFormatterBlock:v5];

  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSimpleFormatter *)self formatterBlock];

  if (v5)
  {
    v6 = [(HFSimpleFormatter *)self formatterBlock];
    uint64_t v7 = ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    uint64_t v7 = [(HFSimpleFormatter *)self attributedFormatterBlock];

    if (!v7) {
      goto LABEL_6;
    }
    v6 = [(HFSimpleFormatter *)self attributedFormatterBlock];
    v8 = ((void (*)(void (**)(void, void), id, void))v6[2])(v6, v4, MEMORY[0x263EFFA78]);
    uint64_t v7 = [v8 string];
  }
LABEL_6:

  return v7;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFSimpleFormatter *)self attributedFormatterBlock];

  if (v8)
  {
    uint64_t v9 = [(HFSimpleFormatter *)self attributedFormatterBlock];
    v10 = (void *)v9;
    if (v7) {
      id v11 = v7;
    }
    else {
      id v11 = (id)MEMORY[0x263EFFA78];
    }
    v12 = (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)formatterBlock
{
  return self->_formatterBlock;
}

- (id)attributedFormatterBlock
{
  return self->_attributedFormatterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attributedFormatterBlock, 0);
  objc_storeStrong(&self->_formatterBlock, 0);
}

@end