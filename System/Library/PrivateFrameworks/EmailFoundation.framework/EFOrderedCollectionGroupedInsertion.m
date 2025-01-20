@interface EFOrderedCollectionGroupedInsertion
- (EFOrderedCollectionGroupedInsertion)initWithObjects:(id)a3 index:(unint64_t)a4;
- (NSArray)objects;
- (unint64_t)index;
@end

@implementation EFOrderedCollectionGroupedInsertion

- (EFOrderedCollectionGroupedInsertion)initWithObjects:(id)a3 index:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFOrderedCollectionGroupedInsertion;
  v8 = [(EFOrderedCollectionGroupedInsertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_objects, a3);
    v9->_index = a4;
  }

  return v9;
}

- (NSArray)objects
{
  return self->_objects;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
}

@end