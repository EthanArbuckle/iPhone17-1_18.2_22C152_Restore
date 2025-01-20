@interface NSMigrationStage
- (NSMigrationStage)init;
- (NSString)label;
- (void)dealloc;
- (void)setLabel:(NSString *)label;
@end

@implementation NSMigrationStage

- (NSMigrationStage)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSMigrationStage;
  v2 = [(NSMigrationStage *)&v4 init];
  if (v2) {
    v2->_label = (NSString *)objc_alloc_init(NSString);
  }
  return v2;
}

- (void)setLabel:(NSString *)label
{
  v3 = self->_label;
  if (v3 != label)
  {

    if (label) {
      v6 = (NSString *)[(NSString *)label copy];
    }
    else {
      v6 = (NSString *)objc_alloc_init(NSString);
    }
    self->_label = v6;
  }
}

- (void)dealloc
{
  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMigrationStage;
  [(NSMigrationStage *)&v3 dealloc];
}

- (NSString)label
{
  return self->_label;
}

@end