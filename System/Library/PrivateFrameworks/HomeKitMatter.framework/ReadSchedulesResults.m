@interface ReadSchedulesResults
- (NSArray)availableSlots;
- (NSDictionary)schedulesToSlots;
- (void)setAvailableSlots:(id)a3;
- (void)setSchedulesToSlots:(id)a3;
@end

@implementation ReadSchedulesResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableSlots, 0);
  objc_storeStrong((id *)&self->_schedulesToSlots, 0);
}

- (void)setAvailableSlots:(id)a3
{
}

- (NSArray)availableSlots
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSchedulesToSlots:(id)a3
{
}

- (NSDictionary)schedulesToSlots
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

@end