@interface AXPXSimpleIndexPathHolder
- (AXPXSimpleIndexPathHolder)initWithIndexPath:(PXSimpleIndexPath *)a3;
- (PXSimpleIndexPath)indexPath;
- (void)setIndexPath:(PXSimpleIndexPath *)a3;
@end

@implementation AXPXSimpleIndexPathHolder

- (AXPXSimpleIndexPathHolder)initWithIndexPath:(PXSimpleIndexPath *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXPXSimpleIndexPathHolder;
  v4 = [(AXPXSimpleIndexPathHolder *)&v9 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->item;
    v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v8[1] = v6;
    [(AXPXSimpleIndexPathHolder *)v4 setIndexPath:v8];
  }
  return v5;
}

- (PXSimpleIndexPath)indexPath
{
  long long v3 = *(_OWORD *)&self->subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self->section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_indexPath.item = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_indexPath.dataSourceIdentifier = v3;
}

@end