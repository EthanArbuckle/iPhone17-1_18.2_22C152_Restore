@interface _UIDataSourceSnapshot
- (_NSRange)rangeForSection:(int64_t)a3;
- (_UIDataSourceSnapshot)initWithDataSourceSnapshotter:(id)a3;
- (id)indexPathForGlobalIndex:(int64_t)a3;
- (int64_t)globalIndexForIndexPath:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionForGlobalIndex:(int64_t)a3;
@end

@implementation _UIDataSourceSnapshot

- (_UIDataSourceSnapshot)initWithDataSourceSnapshotter:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDataSourceSnapshot;
  v5 = [(_UIDataSourceSnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    snapshotter = v5->_snapshotter;
    v5->_snapshotter = (_UIDataSourceSnapshotter *)v6;
  }
  return v5;
}

- (int64_t)numberOfSections
{
  return [(_UIDataSourceSnapshotter *)self->_snapshotter numberOfSections];
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(_UIDataSourceSnapshotter *)self->_snapshotter numberOfItemsInSection:a3];
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  return [(_UIDataSourceSnapshotter *)self->_snapshotter globalIndexForIndexPath:a3];
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  return [(_UIDataSourceSnapshotter *)self->_snapshotter indexPathForGlobalIndex:a3];
}

- (int64_t)numberOfItems
{
  return [(_UIDataSourceSnapshotter *)self->_snapshotter numberOfItems];
}

- (_NSRange)rangeForSection:(int64_t)a3
{
  NSUInteger v3 = [(_UIDataSourceSnapshotter *)self->_snapshotter rangeForSection:a3];
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)sectionForGlobalIndex:(int64_t)a3
{
  return [(_UIDataSourceSnapshotter *)self->_snapshotter sectionForGlobalIndex:a3];
}

- (void).cxx_destruct
{
}

@end