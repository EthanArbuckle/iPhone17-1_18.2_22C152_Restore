@interface EFSortDescriptor
- (unint64_t)hash;
@end

@implementation EFSortDescriptor

- (unint64_t)hash
{
  v3 = [(EFSortDescriptor *)self key];
  uint64_t v4 = [v3 hash];

  unsigned int v5 = [(EFSortDescriptor *)self ascending];
  v6 = NSStringFromSelector((SEL)[(EFSortDescriptor *)self selector]);
  unint64_t v7 = 33 * (33 * v4 + v5) + [v6 hash] + 35937;

  return v7;
}

@end