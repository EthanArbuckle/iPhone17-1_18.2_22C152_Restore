@interface IDSHandle
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandle:(id)a3;
- (BOOL)isUserVisible;
- (IDSHandle)initWithURI:(id)a3 isUserVisible:(BOOL)a4 validationStatus:(int64_t)a5;
- (IDSURI)URI;
- (id)description;
- (int64_t)validationStatus;
- (unint64_t)hash;
@end

@implementation IDSHandle

- (IDSHandle)initWithURI:(id)a3 isUserVisible:(BOOL)a4 validationStatus:(int64_t)a5
{
  id v9 = a3;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSHandle;
    v10 = [(IDSHandle *)&v14 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_URI, a3);
      v11->_isUserVisible = a4;
      v11->_validationStatus = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v8 = (void *)v5;
  id v9 = @"YES";
  if (!self->_isUserVisible) {
    id v9 = @"NO";
  }
  v10 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p URI:%@, visible:%@, valStatus: %ld>", v7, v5, self, self->_URI, v9, self->_validationStatus);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToHandle = objc_msgSend_isEqualToHandle_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToHandle = 0;
  }

  return isEqualToHandle;
}

- (BOOL)isEqualToHandle:(id)a3
{
  double v6 = (IDSHandle *)a3;
  if (self == v6)
  {
    char isEqual = 1;
  }
  else
  {
    int isUserVisible = objc_msgSend_isUserVisible(self, v4, v5, v7);
    if (isUserVisible == objc_msgSend_isUserVisible(v6, v9, v10, v11)
      && (uint64_t v15 = objc_msgSend_validationStatus(self, v12, v13, v14),
          v15 == objc_msgSend_validationStatus(v6, v16, v17, v18)))
    {
      v22 = objc_msgSend_URI(self, v19, v20, v21);
      v26 = objc_msgSend_URI(v6, v23, v24, v25);
      char isEqual = objc_msgSend_isEqual_(v22, v27, (uint64_t)v26, v28);
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_URI(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_validationStatus(self, v10, v11, v12) - v9 + 32 * v9;
  int isUserVisible = objc_msgSend_isUserVisible(self, v14, v15, v16);
  uint64_t v18 = 1237;
  if (isUserVisible) {
    uint64_t v18 = 1231;
  }
  return v18 - v13 + 32 * v13 + 29791;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (int64_t)validationStatus
{
  return self->_validationStatus;
}

- (void).cxx_destruct
{
}

@end