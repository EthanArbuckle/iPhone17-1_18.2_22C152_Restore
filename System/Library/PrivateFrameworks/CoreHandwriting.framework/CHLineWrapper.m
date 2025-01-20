@interface CHLineWrapper
- (CHLineWrapper)init;
- (id)lineWrappingResultForGroups:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation CHLineWrapper

- (CHLineWrapper)init
{
  v12.receiver = self;
  v12.super_class = (Class)CHLineWrapper;
  v2 = [(CHLineWrapper *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FAF178]);
    id v4 = objc_alloc(MEMORY[0x1E4FAF170]);
    uint64_t v9 = objc_msgSend_initWithConfiguration_(v4, v5, (uint64_t)v3, v6, v7, v8);
    lineWrapper = v2->_lineWrapper;
    v2->_lineWrapper = (CRLineWrapper *)v9;
  }
  return v2;
}

- (id)lineWrappingResultForGroups:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = objc_msgSend_paragraphsByUpdatingLineWrappingTypesInGroups_useHandwritingConfig_(self->_lineWrapper, a2, (uint64_t)a3, 1, (uint64_t)a5, v5);
  uint64_t v7 = [CHLineWrappingResult alloc];
  objc_super v12 = objc_msgSend_initWithLineWrappableGroups_(v7, v8, (uint64_t)v6, v9, v10, v11);

  return v12;
}

- (void).cxx_destruct
{
}

@end