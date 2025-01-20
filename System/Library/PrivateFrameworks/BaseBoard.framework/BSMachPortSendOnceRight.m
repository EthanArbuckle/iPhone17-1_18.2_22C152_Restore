@interface BSMachPortSendOnceRight
+ (char)_type;
- (BSMachPortSendOnceRight)initWithPort:(unsigned int)a3;
- (id)initFromReceiveRight:(id)a3;
@end

@implementation BSMachPortSendOnceRight

+ (char)_type
{
  return 2;
}

- (BSMachPortSendOnceRight)initWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 - 1 <= 0xFFFFFFFD && !BSMachPortIsType(a3, 1310720))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"BSMachPortRight.m" lineNumber:444 description:@"you must pass in a send-once (or dead) right or NULL"];
  }
  v6 = _BSMachPortRightDescription(2u, 0, @"take", v3, 0);
  v7 = (BSMachPortSendOnceRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 2, 0, v6);

  return v7;
}

- (id)initFromReceiveRight:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__BSMachPortSendOnceRight_initFromReceiveRight___block_invoke;
  v10[3] = &unk_1E5446108;
  v10[4] = &v11;
  [a3 accessPort:v10];
  uint64_t v5 = *((unsigned int *)v12 + 6);
  v6 = [a3 trace];
  v7 = _BSMachPortRightDescription(2u, 0, @"make", v5, v6);

  v8 = -[BSMachPortRight _initWithPort:type:owner:trace:](self, *((unsigned int *)v12 + 6), 2, 0, v7);
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __48__BSMachPortSendOnceRight_initFromReceiveRight___block_invoke(uint64_t result, uint64_t a2)
{
  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    uint64_t v2 = result;
    result = BSMachCreateSendOnceRight(a2);
    *(_DWORD *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

@end