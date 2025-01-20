@interface HMFMutableMessage(InternalMessages)
+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:;
+ (id)internalMessageWithName:()InternalMessages messagePayload:responseHandler:;
+ (uint64_t)internalMessageWithName:()InternalMessages messagePayload:;
- (void)setInternal:()InternalMessages;
@end

@implementation HMFMutableMessage(InternalMessages)

- (void)setInternal:()InternalMessages
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"internal"];
}

+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:
{
  v0 = objc_msgSend(MEMORY[0x263F42590], "messageWithName:destination:payload:");
  [v0 setUserInfoValue:MEMORY[0x263EFFA88] forKey:@"internal"];
  return v0;
}

+ (id)internalMessageWithName:()InternalMessages messagePayload:responseHandler:
{
  v0 = objc_msgSend(MEMORY[0x263F42590], "messageWithName:messagePayload:responseHandler:");
  [v0 setUserInfoValue:MEMORY[0x263EFFA88] forKey:@"internal"];
  return v0;
}

+ (uint64_t)internalMessageWithName:()InternalMessages messagePayload:
{
  return [a1 internalMessageWithName:a3 messagePayload:a4 responseHandler:0];
}

@end