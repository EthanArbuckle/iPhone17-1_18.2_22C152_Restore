@interface ASRelationshipBeganPlaceholder
- (ASRelationshipBeganPlaceholder)initWithToken:(id)a3;
- (NSSet)blocksWaitingOnSuccess;
- (id)token;
- (void)registerBlockWaitingOnSuccess:(id)a3;
@end

@implementation ASRelationshipBeganPlaceholder

- (ASRelationshipBeganPlaceholder)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASRelationshipBeganPlaceholder;
  v6 = [(ASRelationshipBeganPlaceholder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_token, a3);
  }

  return v7;
}

- (void)registerBlockWaitingOnSuccess:(id)a3
{
  blocksWaitingOnSuccess = self->_blocksWaitingOnSuccess;
  if (blocksWaitingOnSuccess)
  {
    v6 = blocksWaitingOnSuccess;
    v7 = self->_blocksWaitingOnSuccess;
    self->_blocksWaitingOnSuccess = v6;
    id v8 = a3;
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = a3;
    v11 = [v9 set];
    v7 = self->_blocksWaitingOnSuccess;
    self->_blocksWaitingOnSuccess = v11;
  }

  v12 = self->_blocksWaitingOnSuccess;
  id v16 = (id)[a3 copy];

  v13 = (void *)MEMORY[0x24C557E50](v16);
  v14 = [(NSSet *)v12 setByAddingObject:v13];
  v15 = self->_blocksWaitingOnSuccess;
  self->_blocksWaitingOnSuccess = v14;
}

- (id)token
{
  return self->_token;
}

- (NSSet)blocksWaitingOnSuccess
{
  return self->_blocksWaitingOnSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksWaitingOnSuccess, 0);
  objc_storeStrong(&self->_token, 0);
}

@end