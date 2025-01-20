@interface HIDConnection(HIDFramework)
- (uint64_t)getAuditToken:()HIDFramework;
- (uint64_t)uuid;
@end

@implementation HIDConnection(HIDFramework)

- (uint64_t)uuid
{
  return MEMORY[0x1F40E8BB8]();
}

- (uint64_t)getAuditToken:()HIDFramework
{
  return MEMORY[0x1F40E8BA8](a1, a3);
}

@end