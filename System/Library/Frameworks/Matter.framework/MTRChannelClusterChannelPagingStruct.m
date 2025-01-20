@interface MTRChannelClusterChannelPagingStruct
- (MTRChannelClusterChannelPagingStruct)init;
- (MTRChannelClusterPageTokenStruct)nextToken;
- (MTRChannelClusterPageTokenStruct)previousToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNextToken:(id)a3;
- (void)setPreviousToken:(id)a3;
@end

@implementation MTRChannelClusterChannelPagingStruct

- (MTRChannelClusterChannelPagingStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterChannelPagingStruct;
  v2 = [(MTRChannelClusterChannelPagingStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    previousToken = v2->_previousToken;
    v2->_previousToken = 0;

    nextToken = v3->_nextToken;
    v3->_nextToken = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterChannelPagingStruct);
  objc_super v7 = objc_msgSend_previousToken(self, v5, v6);
  objc_msgSend_setPreviousToken_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_nextToken(self, v9, v10);
  objc_msgSend_setNextToken_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: previousToken:%@; nextToken:%@; >",
    v5,
    self->_previousToken,
  objc_super v7 = self->_nextToken);

  return v7;
}

- (MTRChannelClusterPageTokenStruct)previousToken
{
  return self->_previousToken;
}

- (void)setPreviousToken:(id)a3
{
}

- (MTRChannelClusterPageTokenStruct)nextToken
{
  return self->_nextToken;
}

- (void)setNextToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextToken, 0);

  objc_storeStrong((id *)&self->_previousToken, 0);
}

@end