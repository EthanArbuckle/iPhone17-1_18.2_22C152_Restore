@interface CPSTableViewHeaderFooterView
- (NSUUID)identifier;
- (int64_t)sectionIndex;
- (void)setIdentifier:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation CPSTableViewHeaderFooterView

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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