@interface NSFileHandle(BSXPCSecureCoding)
+ (uint64_t)supportsBSXPCSecureCoding;
- (id)initWithBSXPCCoder:()BSXPCSecureCoding;
- (void)encodeWithBSXPCCoder:()BSXPCSecureCoding;
@end

@implementation NSFileHandle(BSXPCSecureCoding)

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BSXPCSecureCoding
{
  id v5 = a3;
  xpc_object_t v4 = xpc_fd_create([a1 fileDescriptor]);
  [v5 encodeXPCObject:v4 forKey:@"fileDescriptor"];
}

- (id)initWithBSXPCCoder:()BSXPCSecureCoding
{
  xpc_object_t v4 = [a3 decodeXPCObjectOfType:MEMORY[0x1E4F145B0] forKey:@"fileDescriptor"];
  id v5 = v4;
  if (v4)
  {
    a1 = (id)[a1 initWithFileDescriptor:xpc_fd_dup(v4) closeOnDealloc:1];
    id v6 = a1;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end