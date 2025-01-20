@interface _NSCoreDataOptimisticLockingException
- (_NSCoreDataOptimisticLockingException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5;
- (id)errorObjectWithUserInfo:(id)a3;
@end

@implementation _NSCoreDataOptimisticLockingException

- (_NSCoreDataOptimisticLockingException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  if ([a5 count])
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a5];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"NSExceptionOmitCallstacks"];
    v10 = (void *)[v9 copy];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v10 = objc_msgSend(v11, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"NSExceptionOmitCallstacks", 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)_NSCoreDataOptimisticLockingException;
  v12 = [(_NSCoreDataOptimisticLockingException *)&v14 initWithName:a3 reason:a4 userInfo:v10];

  return v12;
}

- (id)errorObjectWithUserInfo:(id)a3
{
  v4 = (void *)[(_NSCoreDataOptimisticLockingException *)self userInfo];
  if (a3)
  {
    v5 = (void *)[v4 mutableCopy];
    [v5 addEntriesFromDictionary:a3];
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = v4;
  }
  v7 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134050 userInfo:v6];

  return v7;
}

@end