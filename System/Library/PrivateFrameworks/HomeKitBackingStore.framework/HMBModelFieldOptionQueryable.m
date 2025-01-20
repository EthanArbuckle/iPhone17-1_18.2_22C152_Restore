@interface HMBModelFieldOptionQueryable
- (HMBModelFieldOptionQueryable)initWithEncodingBlock:(id)a3 decodingBlock:(id)a4 descriptionBlock:(id)a5;
- (id)decodingBlock;
- (id)descriptionBlock;
- (id)encodingBlock;
- (void)applyTo:(id)a3;
- (void)setDecodingBlock:(id)a3;
- (void)setDescriptionBlock:(id)a3;
- (void)setEncodingBlock:(id)a3;
@end

@implementation HMBModelFieldOptionQueryable

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong(&self->_decodingBlock, 0);
  objc_storeStrong(&self->_encodingBlock, 0);
}

- (void)setDescriptionBlock:(id)a3
{
}

- (id)descriptionBlock
{
  return self->_descriptionBlock;
}

- (void)setDecodingBlock:(id)a3
{
}

- (id)decodingBlock
{
  return self->_decodingBlock;
}

- (void)setEncodingBlock:(id)a3
{
}

- (id)encodingBlock
{
  return self->_encodingBlock;
}

- (void)applyTo:(id)a3
{
  id v4 = a3;
  v5 = [(HMBModelFieldOptionQueryable *)self encodingBlock];

  if (v5)
  {
    v6 = [(HMBModelFieldOptionQueryable *)self encodingBlock];
    [v4 setEncodeBlock:v6];

    v7 = [(HMBModelFieldOptionQueryable *)self decodingBlock];
    [v4 setDecodeBlock:v7];

    v8 = [(HMBModelFieldOptionQueryable *)self descriptionBlock];
    [v4 setDescriptionBlock:v8];
  }
  else
  {
    uint64_t v9 = [v4 classObj];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__HMBModelFieldOptionQueryable_applyTo___block_invoke;
    v13[3] = &__block_descriptor_40_e16___NSData_16__0_8lu32l8;
    v13[4] = v9;
    [v4 setEncodeBlock:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_2;
    v12[3] = &__block_descriptor_40_e16__16__0__NSData_8lu32l8;
    v12[4] = v9;
    [v4 setDecodeBlock:v12];
    [v4 classObj];
    if (objc_opt_respondsToSelector())
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_3;
      v11[3] = &__block_descriptor_40_e26___NSString_16__0__NSData_8lu32l8;
      v11[4] = v9;
      v10 = v11;
    }
    else
    {
      v10 = &__block_literal_global_8143;
    }
    [v4 setDescriptionBlock:v10];
  }
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hmbEncodeQueryableParameter:a2];
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hmbDecodeQueryableParameter:a2];
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hmbDescriptionForEncodedQueryableVariable:a2];
}

uint64_t __40__HMBModelFieldOptionQueryable_applyTo___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 hmbDescription];
}

- (HMBModelFieldOptionQueryable)initWithEncodingBlock:(id)a3 decodingBlock:(id)a4 descriptionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMBModelFieldOptionQueryable;
  v11 = [(HMBModelFieldOptionQueryable *)&v19 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x1D944CD20](v8);
    id encodingBlock = v11->_encodingBlock;
    v11->_id encodingBlock = (id)v12;

    uint64_t v14 = MEMORY[0x1D944CD20](v9);
    id decodingBlock = v11->_decodingBlock;
    v11->_id decodingBlock = (id)v14;

    uint64_t v16 = MEMORY[0x1D944CD20](v10);
    id descriptionBlock = v11->_descriptionBlock;
    v11->_id descriptionBlock = (id)v16;
  }
  return v11;
}

@end