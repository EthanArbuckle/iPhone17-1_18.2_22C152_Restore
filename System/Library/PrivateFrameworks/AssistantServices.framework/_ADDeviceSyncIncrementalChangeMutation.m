@interface _ADDeviceSyncIncrementalChangeMutation
- (BOOL)isDirty;
- (_ADDeviceSyncIncrementalChangeMutation)initWithBase:(id)a3;
- (id)getDate;
- (id)getDeletedItemUUIDs;
- (id)getInsertedOrUpdatedItems;
- (unint64_t)getGeneration;
- (void)setDate:(id)a3;
- (void)setDeletedItemUUIDs:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setInsertedOrUpdatedItems:(id)a3;
@end

@implementation _ADDeviceSyncIncrementalChangeMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItemUUIDs, 0);
  objc_storeStrong((id *)&self->_insertedOrUpdatedItems, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeletedItemUUIDs:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getDeletedItemUUIDs
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_deletedItemUUIDs;
  }
  else
  {
    v2 = [(ADDeviceSyncIncrementalChange *)self->_base deletedItemUUIDs];
  }
  return v2;
}

- (void)setInsertedOrUpdatedItems:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getInsertedOrUpdatedItems
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_insertedOrUpdatedItems;
  }
  else
  {
    v2 = [(ADDeviceSyncIncrementalChange *)self->_base insertedOrUpdatedItems];
  }
  return v2;
}

- (void)setDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    v2 = [(ADDeviceSyncIncrementalChange *)self->_base date];
  }
  return v2;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getGeneration
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_generation;
  }
  else {
    return [(ADDeviceSyncIncrementalChange *)self->_base generation];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncIncrementalChangeMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncIncrementalChangeMutation;
  v6 = [(_ADDeviceSyncIncrementalChangeMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end