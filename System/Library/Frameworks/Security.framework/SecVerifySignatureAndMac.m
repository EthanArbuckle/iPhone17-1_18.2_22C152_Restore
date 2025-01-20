@interface SecVerifySignatureAndMac
@end

@implementation SecVerifySignatureAndMac

__n128 __SecVerifySignatureAndMac_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  v6[2] = __SecVerifySignatureAndMac_block_invoke_2;
  v6[3] = &unk_1E5481B28;
  char v11 = *(unsigned char *)(a1 + 64);
  uint64_t v8 = a2;
  uint64_t v9 = a3;
  long long v10 = v3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = __PerformWithBufferAndClear_block_invoke;
  v12[3] = &unk_1E5484FC8;
  v12[4] = v6;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v4;
  v13[1] = v4;
  __PerformWithBufferAndClear_block_invoke((uint64_t)v12, 0x20uLL, v13);
  return result;
}

@end