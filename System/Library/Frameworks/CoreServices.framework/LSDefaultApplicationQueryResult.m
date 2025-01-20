@interface LSDefaultApplicationQueryResult
+ (BOOL)supportsSecureCoding;
+ (id)queryResultForCategory:(unint64_t)a3 error:(id *)a4;
- (BOOL)didRefresh;
- (BOOL)isDefaultForCategory;
- (LSDefaultApplicationQueryResult)initWithCoder:(id)a3;
- (LSDefaultApplicationQueryResult)initWithReferenceDate:(id)a3 didRefresh:(BOOL)a4 refreshAfter:(id)a5 defaultForCategory:(BOOL)a6;
- (NSDate)referenceDate;
- (NSDate)refreshAfter;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSDefaultApplicationQueryResult

- (LSDefaultApplicationQueryResult)initWithReferenceDate:(id)a3 didRefresh:(BOOL)a4 refreshAfter:(id)a5 defaultForCategory:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LSDefaultApplicationQueryResult;
  v13 = [(LSDefaultApplicationQueryResult *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_referenceDate, a3);
    v14->_didRefresh = a4;
    objc_storeStrong((id *)&v14->_refreshAfter, a5);
    v14->_defaultForCategory = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSDefaultApplicationQueryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceDate"];
  uint64_t v6 = [v4 decodeBoolForKey:@"didRefresh"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshAfter"];
  uint64_t v8 = [v4 decodeBoolForKey:@"defaultForCategory"];

  if (v5) {
    self = [(LSDefaultApplicationQueryResult *)self initWithReferenceDate:v5 didRefresh:v6 refreshAfter:v7 defaultForCategory:v8];
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  referenceDate = self->_referenceDate;
  id v5 = a3;
  [v5 encodeObject:referenceDate forKey:@"referenceDate"];
  [v5 encodeBool:self->_didRefresh forKey:@"didRefresh"];
  [v5 encodeObject:self->_refreshAfter forKey:@"refreshAfter"];
  [v5 encodeBool:self->_defaultForCategory forKey:@"defaultForCategory"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@@%p: referenceDate %@ didRefresh %d refreshAfter %@ defaultForCategory %d>", objc_opt_class(), self, self->_referenceDate, self->_didRefresh, self->_refreshAfter, self->_defaultForCategory];
}

+ (id)queryResultForCategory:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__27;
  v22 = __Block_byref_object_dispose__27;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__27;
  objc_super v16 = __Block_byref_object_dispose__27;
  id v17 = 0;
  v11[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v11[1] = (void (*)(void, void))3221225472;
  v11[2] = (void (*)(void, void))__64__LSDefaultApplicationQueryResult_queryResultForCategory_error___block_invoke;
  v11[3] = (void (*)(void, void))&unk_1E522C550;
  v11[4] = (void (*)(void, void))&v18;
  uint64_t v6 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__LSDefaultApplicationQueryResult_queryResultForCategory_error___block_invoke_2;
  v10[3] = &unk_1E522F748;
  v10[4] = &v12;
  v10[5] = &v18;
  [v6 getCurrentApplicationDefaultInfoForCategory:a3 completion:v10];

  v7 = (void *)v13[5];
  if (a4 && !v7)
  {
    *a4 = (id) v19[5];
    v7 = (void *)v13[5];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

void __64__LSDefaultApplicationQueryResult_queryResultForCategory_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__LSDefaultApplicationQueryResult_queryResultForCategory_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (BOOL)didRefresh
{
  return self->_didRefresh;
}

- (NSDate)refreshAfter
{
  return self->_refreshAfter;
}

- (BOOL)isDefaultForCategory
{
  return self->_defaultForCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshAfter, 0);

  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end