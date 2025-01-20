@interface _EFDefaultQueueingStrategy
- (NSString)descriptionType;
- (void)dequeueObject:(id)a3 buffer:(id)a4;
- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5;
@end

@implementation _EFDefaultQueueingStrategy

- (NSString)descriptionType
{
  return (NSString *)@"default";
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v7 = a5;
  v8 = v7;
  if (v6) {
    [v7 removeObject:v9];
  }
  [v8 addObject:v9];
}

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
}

@end