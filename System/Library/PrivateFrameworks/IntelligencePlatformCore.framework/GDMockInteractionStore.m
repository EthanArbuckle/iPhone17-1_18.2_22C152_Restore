@interface GDMockInteractionStore
- (GDMockInteractionStore)initWithInteractions:(id)a3;
- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7;
@end

@implementation GDMockInteractionStore

- (void).cxx_destruct
{
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7
{
  uint64_t v13 = objc_msgSend_count(self->_interactions, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7);
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (a5 && v13 - 1 >= a6)
  {
    uint64_t v15 = objc_msgSend_count(self->_interactions, v10, v11, v12);
    if (v15 - a6 >= a5) {
      objc_msgSend_subarrayWithRange_(self->_interactions, v16, a6, a5);
    }
    else {
    v14 = objc_msgSend_subarrayWithRange_(self->_interactions, v16, a6, v15 - a6);
    }
  }
  return v14;
}

- (GDMockInteractionStore)initWithInteractions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GDMockInteractionStore;
  v8 = [(GDMockInteractionStore *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    interactions = v8->_interactions;
    v8->_interactions = (NSArray *)v9;
  }
  return v8;
}

@end