@interface GKSearchBar
- (GKCollectionViewDataSource)dataSource;
- (int64_t)sectionIndex;
- (void)setDataSource:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation GKSearchBar

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
}

@end