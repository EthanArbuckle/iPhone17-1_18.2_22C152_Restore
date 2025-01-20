@interface CNNameListBuilderBlockDelegate
- (BOOL)builder:(id)a3 isValidLengthOfString:(id)a4;
- (id)builder:(id)a3 nameAtIndex:(int64_t)a4;
- (id)lengthValidationBlock;
- (id)nameProviderBlock;
- (int64_t)countOfNames;
- (void)setCountOfNames:(int64_t)a3;
- (void)setLengthValidationBlock:(id)a3;
- (void)setNameProviderBlock:(id)a3;
@end

@implementation CNNameListBuilderBlockDelegate

- (BOOL)builder:(id)a3 isValidLengthOfString:(id)a4
{
  id v5 = a4;
  v6 = [(CNNameListBuilderBlockDelegate *)self lengthValidationBlock];
  char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v5);

  return v7;
}

- (id)builder:(id)a3 nameAtIndex:(int64_t)a4
{
  id v5 = [(CNNameListBuilderBlockDelegate *)self nameProviderBlock];
  v6 = v5[2](v5, a4);

  return v6;
}

- (int64_t)countOfNames
{
  return self->_countOfNames;
}

- (void)setCountOfNames:(int64_t)a3
{
  self->_countOfNames = a3;
}

- (id)nameProviderBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setNameProviderBlock:(id)a3
{
}

- (id)lengthValidationBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLengthValidationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lengthValidationBlock, 0);

  objc_storeStrong(&self->_nameProviderBlock, 0);
}

@end