@interface NSError(KCJoiningError)
+ (id)errorWithJoiningError:()KCJoiningError format:;
+ (id)errorWithJoiningError:()KCJoiningError format:arguments:;
- (uint64_t)initWithJoiningError:()KCJoiningError userInfo:;
@end

@implementation NSError(KCJoiningError)

- (uint64_t)initWithJoiningError:()KCJoiningError userInfo:
{
  return [a1 initWithDomain:KCErrorDomain code:a3 userInfo:a4];
}

+ (id)errorWithJoiningError:()KCJoiningError format:
{
  v9 = [MEMORY[0x263F087E8] errorWithJoiningError:a3 format:a4 arguments:&a9];
  return v9;
}

+ (id)errorWithJoiningError:()KCJoiningError format:arguments:
{
  v15[1] = *MEMORY[0x263EF8340];
  v7 = (objc_class *)MEMORY[0x263F087E8];
  id v8 = a4;
  id v9 = [v7 alloc];
  uint64_t v14 = *MEMORY[0x263F08320];
  v10 = (void *)[[NSString alloc] initWithFormat:v8 arguments:a5];

  v15[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = (void *)[v9 initWithJoiningError:a3 userInfo:v11];

  return v12;
}

@end