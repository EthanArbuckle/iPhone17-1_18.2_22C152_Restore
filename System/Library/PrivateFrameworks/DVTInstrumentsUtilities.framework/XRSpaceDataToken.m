@interface XRSpaceDataToken
- (BOOL)isEqual:(id)a3;
- (XRSpaceDataToken)initWithSpaceTag:(id)a3 sequenceID:(unint64_t)a4;
- (unint64_t)hash;
@end

@implementation XRSpaceDataToken

- (unint64_t)hash
{
  return self->_seq;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (XRSpaceDataToken *)a3;
  BOOL v5 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (self->_tag != v4->_tag || self->_seq != v4->_seq)) {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (XRSpaceDataToken)initWithSpaceTag:(id)a3 sequenceID:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)XRSpaceDataToken;
  v8 = [(XRSpaceDataToken *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_tag, a3);
    v9->_seq = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end