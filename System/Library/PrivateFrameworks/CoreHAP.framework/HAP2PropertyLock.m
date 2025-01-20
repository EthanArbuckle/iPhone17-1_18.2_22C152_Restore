@interface HAP2PropertyLock
+ (HAP2PropertyLock)lockWithName:(id)a3;
- (void)performReadingBlock:(id)a3;
- (void)performWritingBlock:(id)a3;
@end

@implementation HAP2PropertyLock

- (void)performWritingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2Lock *)self internalLock];
  [v5 lockForWriting];

  [(HAP2Lock *)self _performBlock:v4 allowRecursive:0];
  id v6 = [(HAP2Lock *)self internalLock];
  [v6 unlock];
}

- (void)performReadingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2Lock *)self internalLock];
  [v5 lockForReading];

  [(HAP2Lock *)self _performBlock:v4 allowRecursive:1];
  id v6 = [(HAP2Lock *)self internalLock];
  [v6 unlock];
}

+ (HAP2PropertyLock)lockWithName:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLock:v4 name:v3];

  return (HAP2PropertyLock *)v5;
}

@end