@interface BLSHEnsureFlipbookCurrentOperation
+ (id)operation;
- (BOOL)isCompleted;
- (BOOL)isStarted;
- (NSString)description;
- (int64_t)type;
- (void)setCompleted:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation BLSHEnsureFlipbookCurrentOperation

+ (id)operation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (int64_t)type
{
  return 5;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHEnsureFlipbookCurrentOperation isStarted](self, "isStarted"), @"started");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHEnsureFlipbookCurrentOperation isCompleted](self, "isCompleted"), @"completed");
  v6 = [v3 build];

  return (NSString *)v6;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

@end