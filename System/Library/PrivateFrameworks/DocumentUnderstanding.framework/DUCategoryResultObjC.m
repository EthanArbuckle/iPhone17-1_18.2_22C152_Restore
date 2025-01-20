@interface DUCategoryResultObjC
- (DUCategoryResultObjC)init;
- (NSString)categoryIdentifier;
- (double)categoryConfidence;
- (void)setCategoryConfidence:(double)a3;
- (void)setCategoryIdentifier:(id)a3;
@end

@implementation DUCategoryResultObjC

- (void).cxx_destruct
{
}

- (void)setCategoryConfidence:(double)a3
{
  objc_msgSend_setCategoryConfidence_(self->_underlying, a2, v3, v4, v5, a3);
}

- (double)categoryConfidence
{
  objc_msgSend_categoryConfidence(self->_underlying, a2, v2, v3, v4);
  return result;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_msgSend_setCategoryIdentifier_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_msgSend_categoryIdentifier(self->_underlying, a2, v2, v3, v4);
}

- (DUCategoryResultObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUCategoryResultObjC;
  uint64_t v2 = [(DUCategoryResultObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding16DUCategoryResult);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end