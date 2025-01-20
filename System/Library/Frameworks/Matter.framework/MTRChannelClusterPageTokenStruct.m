@interface MTRChannelClusterPageTokenStruct
- (MTRChannelClusterPageTokenStruct)init;
- (NSNumber)limit;
- (NSString)after;
- (NSString)before;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAfter:(id)a3;
- (void)setBefore:(id)a3;
- (void)setLimit:(id)a3;
@end

@implementation MTRChannelClusterPageTokenStruct

- (MTRChannelClusterPageTokenStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRChannelClusterPageTokenStruct;
  v2 = [(MTRChannelClusterPageTokenStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    limit = v2->_limit;
    v2->_limit = 0;

    after = v3->_after;
    v3->_after = 0;

    before = v3->_before;
    v3->_before = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterPageTokenStruct);
  v7 = objc_msgSend_limit(self, v5, v6);
  objc_msgSend_setLimit_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_after(self, v9, v10);
  objc_msgSend_setAfter_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_before(self, v13, v14);
  objc_msgSend_setBefore_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: limit:%@; after:%@; before:%@; >",
    v5,
    self->_limit,
    self->_after,
  v7 = self->_before);

  return v7;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
}

- (NSString)after
{
  return self->_after;
}

- (void)setAfter:(id)a3
{
}

- (NSString)before
{
  return self->_before;
}

- (void)setBefore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_before, 0);
  objc_storeStrong((id *)&self->_after, 0);

  objc_storeStrong((id *)&self->_limit, 0);
}

@end