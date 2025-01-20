@interface HMFMessage(InternalMessages)
+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:;
+ (id)internalMessageWithName:()InternalMessages messagePayload:;
+ (id)internalMessageWithName:()InternalMessages messagePayload:responseHandler:;
- (uint64_t)isInternal;
@end

@implementation HMFMessage(InternalMessages)

- (uint64_t)isInternal
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"internal"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:
{
  v0 = objc_msgSend(MEMORY[0x263F42590], "internalMessageWithName:destination:messagePayload:");
  v1 = (void *)[v0 copy];

  return v1;
}

+ (id)internalMessageWithName:()InternalMessages messagePayload:responseHandler:
{
  v0 = objc_msgSend(MEMORY[0x263F42590], "internalMessageWithName:messagePayload:responseHandler:");
  v1 = (void *)[v0 copy];

  return v1;
}

+ (id)internalMessageWithName:()InternalMessages messagePayload:
{
  v0 = objc_msgSend(MEMORY[0x263F42590], "internalMessageWithName:messagePayload:");
  v1 = (void *)[v0 copy];

  return v1;
}

@end