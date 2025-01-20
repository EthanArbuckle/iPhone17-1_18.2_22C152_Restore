@interface CHResultWithContext
- (CHMutableTokenizedTextResult)result;
- (CHResultWithContext)initWithResult:(id)a3 leftContext:(id)a4 contentType:(int)a5;
- (NSString)leftContext;
- (int)contentType;
@end

@implementation CHResultWithContext

- (CHResultWithContext)initWithResult:(id)a3 leftContext:(id)a4 contentType:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CHResultWithContext;
  v15 = [(CHResultWithContext *)&v19 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_mutableCopy(v8, v10, v11, v12, v13, v14);
    v17 = v15->_result;
    v15->_result = (CHMutableTokenizedTextResult *)v16;

    objc_storeStrong((id *)&v15->_leftContext, a4);
    v15->_contentType = a5;
  }

  return v15;
}

- (NSString)leftContext
{
  return self->_leftContext;
}

- (int)contentType
{
  return self->_contentType;
}

- (CHMutableTokenizedTextResult)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
}

@end