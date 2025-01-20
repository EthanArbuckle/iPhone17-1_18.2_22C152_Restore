@interface _HUUserAccessItem
- (HMUser)user;
- (_HUUserAccessItem)initWithUser:(id)a3 resultsBlock:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)resultsBlock;
@end

@implementation _HUUserAccessItem

- (_HUUserAccessItem)initWithUser:(id)a3 resultsBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HUUserAccessItem;
  v9 = [(_HUUserAccessItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    v11 = _Block_copy(v8);
    id resultsBlock = v10->_resultsBlock;
    v10->_id resultsBlock = v11;
  }
  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(_HUUserAccessItem *)self resultsBlock];
  v6 = v5[2]();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___HUUserAccessItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6386B98;
  id v11 = v4;
  v12 = self;
  id v7 = v4;
  id v8 = [v6 flatMap:v10];

  return v8;
}

- (HMUser)user
{
  return self->_user;
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end