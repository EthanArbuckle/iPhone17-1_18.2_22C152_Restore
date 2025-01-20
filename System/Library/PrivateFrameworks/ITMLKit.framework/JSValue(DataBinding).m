@interface JSValue(DataBinding)
- (id)_ikdt_globalObject;
- (id)ikdt_prototype;
- (uint64_t)ikdt_isArray;
- (uint64_t)ikdt_isObject;
@end

@implementation JSValue(DataBinding)

- (id)ikdt_prototype
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isObject])
  {
    v2 = objc_msgSend(a1, "_ikdt_globalObject");
    v3 = [v2 objectForKeyedSubscript:@"getPrototypeOf"];
    v7[0] = a1;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    v5 = [v3 callWithArguments:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)ikdt_isArray
{
  v1 = objc_msgSend(a1, "ikdt_prototype");
  uint64_t v2 = [v1 isArray];

  return v2;
}

- (uint64_t)ikdt_isObject
{
  v1 = objc_msgSend(a1, "ikdt_prototype");
  uint64_t v2 = [v1 isObject];

  return v2;
}

- (id)_ikdt_globalObject
{
  v0 = +[IKAppContext currentAppContext];
  v1 = [v0 jsContext];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"Object"];

  return v2;
}

@end