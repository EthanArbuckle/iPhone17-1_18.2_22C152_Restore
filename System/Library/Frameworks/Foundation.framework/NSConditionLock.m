@interface NSConditionLock
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)lockWhenCondition:(NSInteger)condition beforeDate:(NSDate *)limit;
- (BOOL)tryLock;
- (BOOL)tryLockWhenCondition:(NSInteger)condition;
- (NSConditionLock)init;
- (NSConditionLock)initWithCondition:(NSInteger)condition;
- (NSInteger)condition;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)lock;
- (void)lockWhenCondition:(NSInteger)condition;
- (void)setName:(NSString *)name;
- (void)unlock;
- (void)unlockWithCondition:(NSInteger)condition;
@end

@implementation NSConditionLock

- (NSInteger)condition
{
  return self->v;
}

- (void)lock
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];

  [(NSConditionLock *)self lockBeforeDate:v3];
}

- (void)unlock
{
  [(NSCondition *)self->cond lock];
  self->t = 0;
  [(NSCondition *)self->cond broadcast];
  cond = self->cond;

  [(NSCondition *)cond unlock];
}

- (void)unlockWithCondition:(NSInteger)condition
{
  [(NSCondition *)self->cond lock];
  self->t = 0;
  self->v = condition;
  [(NSCondition *)self->cond broadcast];
  cond = self->cond;

  [(NSCondition *)cond unlock];
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  [(NSCondition *)self->cond lock];
  while (1)
  {
    int v5 = pthread_equal(0, self->t);
    if (v5) {
      break;
    }
    if (![(NSCondition *)self->cond waitUntilDate:limit]) {
      goto LABEL_6;
    }
  }
  self->t = pthread_self();
LABEL_6:
  [(NSCondition *)self->cond unlock];
  return v5 != 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConditionLock;
  [(NSConditionLock *)&v3 dealloc];
}

- (NSConditionLock)initWithCondition:(NSInteger)condition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSConditionLock;
  uint64_t v4 = [(NSConditionLock *)&v6 init];
  v4->cond = [+[NSCondition allocWithZone:[(NSConditionLock *)v4 zone]] init];
  v4->t = 0;
  v4->v = condition;
  v4->n = 0;
  return v4;
}

- (BOOL)tryLockWhenCondition:(NSInteger)condition
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];

  return [(NSConditionLock *)self lockWhenCondition:condition beforeDate:v5];
}

- (void)setName:(NSString *)name
{
  n = self->n;
  if (n != name)
  {

    self->n = (NSString *)[(NSString *)name copy];
  }
}

- (BOOL)lockWhenCondition:(NSInteger)condition beforeDate:(NSDate *)limit
{
  [(NSCondition *)self->cond lock];
  while (!pthread_equal(0, self->t) || self->v != condition)
  {
    if (![(NSCondition *)self->cond waitUntilDate:limit])
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
  }
  self->t = pthread_self();
  BOOL v7 = 1;
LABEL_7:
  [(NSCondition *)self->cond unlock];
  return v7;
}

- (NSConditionLock)init
{
  return [(NSConditionLock *)self initWithCondition:0];
}

- (void)lockWhenCondition:(NSInteger)condition
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];

  [(NSConditionLock *)self lockWhenCondition:condition beforeDate:v5];
}

- (BOOL)tryLock
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];

  return [(NSConditionLock *)self lockBeforeDate:v3];
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSConditionLock;
  id v3 = [(NSConditionLock *)&v8 description];
  uint64_t v4 = "'";
  n = self->n;
  if (!n) {
    uint64_t v4 = "";
  }
  objc_super v6 = (NSString *)@"nil";
  if (n) {
    objc_super v6 = self->n;
  }
  return +[NSString stringWithFormat:@"%@{condition = %ld, name = %s%@%s}", v3, self->v, v4, v6, v4];
}

- (NSString)name
{
  return self->n;
}

@end