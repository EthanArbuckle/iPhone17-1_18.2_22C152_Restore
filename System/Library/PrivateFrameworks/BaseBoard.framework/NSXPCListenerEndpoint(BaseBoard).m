@interface NSXPCListenerEndpoint(BaseBoard)
+ (uint64_t)supportsBSXPCSecureCoding;
- (id)initWithBSXPCCoder:()BaseBoard;
- (uint64_t)initWithXPCDictionary:()BaseBoard;
- (void)encodeWithBSXPCCoder:()BaseBoard;
- (void)encodeWithXPCDictionary:()BaseBoard;
@end

@implementation NSXPCListenerEndpoint(BaseBoard)

- (uint64_t)initWithXPCDictionary:()BaseBoard
{
  v2 = +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:");
  uint64_t v3 = [a1 initWithBSXPCCoder:v2];

  return v3;
}

- (void)encodeWithXPCDictionary:()BaseBoard
{
  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeWithBSXPCCoder:");
}

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BaseBoard
{
  id v5 = a3;
  v4 = [a1 _endpoint];
  [v5 encodeXPCObject:v4 forKey:@"endpt"];
}

- (id)initWithBSXPCCoder:()BaseBoard
{
  v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"endpt"];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    [v5 _setEndpoint:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end