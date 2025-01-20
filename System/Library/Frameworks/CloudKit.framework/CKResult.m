@interface CKResult
- (BOOL)isEqual:(id)a3;
- (CKResult)initWithFailure:(id)a3;
- (CKResult)initWithSuccess:(id)a3;
- (NSError)error;
- (id)successValue;
- (unint64_t)hash;
@end

@implementation CKResult

- (CKResult)initWithSuccess:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKResult;
  v6 = [(CKResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_successValue, a3);
  }

  return v7;
}

- (CKResult)initWithFailure:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKResult;
  v6 = [(CKResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_successValue(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_error(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKResult *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v9 = objc_msgSend_successValue(self, v6, v7, v8);
      v13 = objc_msgSend_successValue(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14)
      {
        v18 = objc_msgSend_error(self, v15, v16, v17);
        v22 = objc_msgSend_error(v5, v19, v20, v21);
        char v23 = CKObjectsAreBothNilOrEqual(v18, v22);
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }

  return v23;
}

- (id)successValue
{
  return self->_successValue;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_successValue, 0);
}

@end