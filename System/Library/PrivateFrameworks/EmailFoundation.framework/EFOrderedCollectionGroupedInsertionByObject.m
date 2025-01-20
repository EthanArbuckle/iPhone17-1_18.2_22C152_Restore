@interface EFOrderedCollectionGroupedInsertionByObject
- (BOOL)isMove;
- (EFOrderedCollectionGroupedInsertionByObject)initWithObjects:(id)a3 previousObject:(id)a4 nextObject:(id)a5 isMove:(BOOL)a6;
- (NSArray)objects;
- (id)nextObject;
- (id)previousObject;
@end

@implementation EFOrderedCollectionGroupedInsertionByObject

- (EFOrderedCollectionGroupedInsertionByObject)initWithObjects:(id)a3 previousObject:(id)a4 nextObject:(id)a5 isMove:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EFOrderedCollectionGroupedInsertionByObject;
  v14 = [(EFOrderedCollectionGroupedInsertionByObject *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_objects, a3);
    objc_storeStrong(&v15->_previousObject, a4);
    objc_storeStrong(&v15->_nextObject, a5);
    v15->_isMove = a6;
  }

  return v15;
}

- (NSArray)objects
{
  return self->_objects;
}

- (id)previousObject
{
  return self->_previousObject;
}

- (id)nextObject
{
  return self->_nextObject;
}

- (BOOL)isMove
{
  return self->_isMove;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextObject, 0);
  objc_storeStrong(&self->_previousObject, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end