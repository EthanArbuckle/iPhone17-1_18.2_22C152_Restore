@interface CCDatabaseOnConflict
+ (CCDatabaseOnConflict)onConflictWithType:(int64_t)a3;
- (CCDatabaseOnConflict)initWithType:(int64_t)a3;
- (int64_t)type;
@end

@implementation CCDatabaseOnConflict

- (int64_t)type
{
  return self->_type;
}

+ (CCDatabaseOnConflict)onConflictWithType:(int64_t)a3
{
  v3 = [[CCDatabaseOnConflict alloc] initWithType:a3];

  return v3;
}

- (CCDatabaseOnConflict)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCDatabaseOnConflict;
  result = [(CCDatabaseOnConflict *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

@end