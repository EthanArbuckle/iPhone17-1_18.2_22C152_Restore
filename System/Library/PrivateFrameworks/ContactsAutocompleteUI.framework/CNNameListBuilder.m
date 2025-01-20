@interface CNNameListBuilder
- (BOOL)shouldStripEllipses;
- (CNNameListBuilder)initWithDelegate:(id)a3;
- (id)build;
- (void)setShouldStripEllipses:(BOOL)a3;
@end

@implementation CNNameListBuilder

- (CNNameListBuilder)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNNameListBuilder;
  v5 = [(CNNameListBuilder *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)build
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [WeakRetained countOfNamesForBuilder:self];

  v5 = +[_CNComposeAddressConcatenator defaultRecipientListConcatenator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26__CNNameListBuilder_build__block_invoke;
  v11[3] = &unk_1E61288F0;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __26__CNNameListBuilder_build__block_invoke_2;
  v10[3] = &unk_1E6128660;
  v10[4] = self;
  v6 = [v5 commaSeparatedAddressListWithAddressCount:v4 prefixForAddressAtIndex:0 stringForAddressAtIndex:v11 lengthValidationBlock:v10];
  if ([(CNNameListBuilder *)self shouldStripEllipses])
  {
    if (build_cn_once_token_1 != -1) {
      dispatch_once(&build_cn_once_token_1, &__block_literal_global_5);
    }
    id v7 = [v6 stringByTrimmingCharactersInSet:build_cn_once_object_1];
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return v8;
}

id __26__CNNameListBuilder_build__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v5 = [WeakRetained builder:*(void *)(a1 + 32) nameAtIndex:a2];

  return v5;
}

uint64_t __26__CNNameListBuilder_build__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained builder:*(void *)(a1 + 32) isValidLengthOfString:v4];

  return v6;
}

uint64_t __26__CNNameListBuilder_build__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"…"];
  uint64_t v1 = build_cn_once_object_1;
  build_cn_once_object_1 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)shouldStripEllipses
{
  return self->_shouldStripEllipses;
}

- (void)setShouldStripEllipses:(BOOL)a3
{
  self->_shouldStripEllipses = a3;
}

- (void).cxx_destruct
{
}

@end