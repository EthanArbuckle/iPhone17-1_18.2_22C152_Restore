@interface MUISearchResult
- (MUISearchRequestID)requestID;
- (NSArray)categories;
- (NSArray)suggestions;
- (id)initWithSuggestions:(void *)a3 categories:(void *)a4 requestID:(char)a5 phraseKind:;
- (unsigned)phraseKind;
@end

@implementation MUISearchResult

- (id)initWithSuggestions:(void *)a3 categories:(void *)a4 requestID:(char)a5 phraseKind:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)MUISearchResult;
    a1 = (id *)objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      uint64_t v12 = [v9 copy];
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x1E4F1CBF0];
      if (v12) {
        v15 = (void *)v12;
      }
      else {
        v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong(a1 + 2, v15);

      uint64_t v16 = [v10 copy];
      v17 = (void *)v16;
      if (v16) {
        v18 = (void *)v16;
      }
      else {
        v18 = v14;
      }
      objc_storeStrong(a1 + 3, v18);

      objc_storeStrong(a1 + 4, a4);
      *((unsigned char *)a1 + 8) = a5;
    }
  }

  return a1;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)categories
{
  return self->_categories;
}

- (MUISearchRequestID)requestID
{
  return self->_requestID;
}

- (unsigned)phraseKind
{
  return self->_phraseKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end