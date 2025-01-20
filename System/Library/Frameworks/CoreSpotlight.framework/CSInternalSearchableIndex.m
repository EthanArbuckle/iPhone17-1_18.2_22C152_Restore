@interface CSInternalSearchableIndex
- (CSInternalSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6;
@end

@implementation CSInternalSearchableIndex

- (CSInternalSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CSInternalSearchableIndex;
  return [(CSSearchableIndex *)&v7 initWithName:a3 protectionClass:a4 bundleIdentifier:a5 options:a6];
}

@end