@interface __NSURLSessionTaskDependencyResourceIdentifier
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWitURLPath:(void *)a3 mimeType:;
@end

@implementation __NSURLSessionTaskDependencyResourceIdentifier

- (id)description
{
  if (!self) {
    return 0;
  }
  URLPath = self->_URLPath;
  if (URLPath) {
    return (id)[NSString stringWithFormat:@"URLPath: %@", URLPath];
  }
  mimeType = self->_mimeType;
  if (mimeType) {
    return (id)[NSString stringWithFormat:@"MimeType: %@", mimeType];
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSURLSessionTaskDependencyResourceIdentifier;
  [(__NSURLSessionTaskDependencyResourceIdentifier *)&v4 dealloc];
}

- (unint64_t)hash
{
  if (self)
  {
    uint64_t v3 = [(NSString *)self->_URLPath hash];
    mimeType = self->_mimeType;
  }
  else
  {
    uint64_t v3 = [0 hash];
    mimeType = 0;
  }
  return [(NSString *)mimeType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self)
    {
      URLPath = self->_URLPath;
      if (!((unint64_t)URLPath | *((void *)a3 + 1)) || (-[NSString isEqual:](URLPath, "isEqual:") & 1) != 0)
      {
        mimeType = self->_mimeType;
        uint64_t v7 = *((void *)a3 + 2);
        if (mimeType) {
          return ([(NSString *)mimeType isEqual:v7] & 1) != 0;
        }
        if (v7)
        {
LABEL_9:
          mimeType = 0;
          return ([(NSString *)mimeType isEqual:v7] & 1) != 0;
        }
        return 1;
      }
    }
    else if (!*((void *)a3 + 1) || (objc_msgSend(0, "isEqual:") & 1) != 0)
    {
      uint64_t v7 = *((void *)a3 + 2);
      if (!v7) {
        return 1;
      }
      goto LABEL_9;
    }
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[__NSURLSessionTaskDependencyResourceIdentifier allocWithZone:a3] init];
  v6 = v4;
  if (self)
  {
    URLPath = self->_URLPath;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  URLPath = 0;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_nonatomic(v4, v5, URLPath, 8);
LABEL_4:
  if (!self)
  {
    mimeType = 0;
    if (!v6) {
      return v6;
    }
    goto LABEL_6;
  }
  mimeType = self->_mimeType;
  if (v6) {
LABEL_6:
  }
    objc_setProperty_nonatomic(v6, v5, mimeType, 16);
  return v6;
}

- (void)initWitURLPath:(void *)a3 mimeType:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)__NSURLSessionTaskDependencyResourceIdentifier;
  id v5 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t v7 = v5;
  if (v5)
  {
    objc_setProperty_nonatomic(v5, v6, a2, 8);
    objc_setProperty_nonatomic(v7, v8, a3, 16);
  }
  return v7;
}

@end