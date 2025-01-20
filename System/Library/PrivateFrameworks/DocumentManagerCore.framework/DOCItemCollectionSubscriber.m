@interface DOCItemCollectionSubscriber
- (DOCItemCollectionSubscriber)initWithUpdateBlock:(id)a3;
- (NSUUID)UUID;
- (id)updateBlock;
- (void)setUUID:(id)a3;
- (void)setUpdateBlock:(id)a3;
@end

@implementation DOCItemCollectionSubscriber

- (id)updateBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (DOCItemCollectionSubscriber)initWithUpdateBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCItemCollectionSubscriber;
  v5 = [(DOCItemCollectionSubscriber *)&v8 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    [(DOCItemCollectionSubscriber *)v5 setUUID:v6];

    [(DOCItemCollectionSubscriber *)v5 setUpdateBlock:v4];
  }

  return v5;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end