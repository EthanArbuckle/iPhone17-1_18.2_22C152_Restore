@interface BKDescribeEventDescriptors
@end

@implementation BKDescribeEventDescriptors

void ___BKDescribeEventDescriptors_block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___BKDescribeEventDescriptors_block_invoke_2;
  v3[3] = &unk_1E6871060;
  id v4 = v1;
  [v4 appendCollection:v2 withName:@"desc" itemBlock:v3];
}

void ___BKDescribeEventDescriptors_block_invoke_2(uint64_t a1, void *a2)
{
  [a2 integerValue];
  IOHIDEventTypeGetName();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) appendString:v3 withName:0];
}

@end