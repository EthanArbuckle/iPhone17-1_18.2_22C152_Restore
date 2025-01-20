@interface _ADDeviceSyncSnapshotMutation
- (BOOL)isDirty;
- (_ADDeviceSyncSnapshotMutation)initWithBase:(id)a3;
- (id)getDate;
- (id)getItems;
- (unint64_t)getGeneration;
- (void)setDate:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setItems:(id)a3;
@end

@implementation _ADDeviceSyncSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setItems:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getItems
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_items;
  }
  else
  {
    v2 = [(ADDeviceSyncSnapshot *)self->_base items];
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
    v2 = [(ADDeviceSyncSnapshot *)self->_base date];
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
    return [(ADDeviceSyncSnapshot *)self->_base generation];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceSyncSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceSyncSnapshotMutation;
  v6 = [(_ADDeviceSyncSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end