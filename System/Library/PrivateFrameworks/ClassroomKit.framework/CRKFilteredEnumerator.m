@interface CRKFilteredEnumerator
- (BOOL)shouldRejectItem:(id)a3;
- (CRKFilteredEnumerator)initWithEnumerator:(id)a3 filterBlock:(id)a4;
- (NSEnumerator)enumerator;
- (id)filterBlock;
- (id)nextObject;
@end

@implementation CRKFilteredEnumerator

- (CRKFilteredEnumerator)initWithEnumerator:(id)a3 filterBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKFilteredEnumerator;
  v9 = [(CRKFilteredEnumerator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id filterBlock = v10->_filterBlock;
    v10->_id filterBlock = (id)v11;
  }
  return v10;
}

- (id)nextObject
{
  v3 = 0;
  do
  {
    v4 = v3;
    v5 = [(CRKFilteredEnumerator *)self enumerator];
    v3 = [v5 nextObject];
  }
  while ([(CRKFilteredEnumerator *)self shouldRejectItem:v3]);

  return v3;
}

- (BOOL)shouldRejectItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(CRKFilteredEnumerator *)self filterBlock];
  LOBYTE(self) = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  char v6 = self ^ 1;
  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end