@interface PatternVisualInfo
- (NSArray)sectionIds;
- (unint64_t)visualLocation;
- (void)setSectionIds:(id)a3;
- (void)setVisualLocation:(unint64_t)a3;
@end

@implementation PatternVisualInfo

- (void).cxx_destruct
{
}

- (void)setSectionIds:(id)a3
{
}

- (NSArray)sectionIds
{
  return self->_sectionIds;
}

- (void)setVisualLocation:(unint64_t)a3
{
  self->_visualLocation = a3;
}

- (unint64_t)visualLocation
{
  return self->_visualLocation;
}

@end