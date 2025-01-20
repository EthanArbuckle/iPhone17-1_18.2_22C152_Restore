@interface GEOPhoneNumberResolutionResultSet
- (GEOPhoneNumberResolutionResultSet)initWithPNRResultSet:(id)a3;
- (id)description;
- (void)enumerateResolutionsUsingBlock:(id)a3;
@end

@implementation GEOPhoneNumberResolutionResultSet

- (GEOPhoneNumberResolutionResultSet)initWithPNRResultSet:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPhoneNumberResolutionResultSet;
  v6 = [(GEOPhoneNumberResolutionResultSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pnrResultSet, a3);
  }

  return v7;
}

- (id)description
{
  return (id)[(PNRPhoneNumberResolutionResultSet *)self->_pnrResultSet description];
}

- (void)enumerateResolutionsUsingBlock:(id)a3
{
  id v4 = a3;
  pnrResultSet = self->_pnrResultSet;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__GEOPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke;
  v7[3] = &unk_1E53F8E78;
  id v8 = v4;
  id v6 = v4;
  [(PNRPhoneNumberResolutionResultSet *)pnrResultSet enumerateResolutionsUsingBlock:v7];
}

void __68__GEOPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 locationName];

  if (v9)
  {
    v10 = [GEOPhoneNumberResolutionResult alloc];
    v11 = [v7 locationName];
    objc_super v9 = [(GEOPhoneNumberResolutionResult *)v10 initWithLocationName:v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end