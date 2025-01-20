@interface SecOTRSProcessPacket
@end

@implementation SecOTRSProcessPacket

__n128 __SecOTRSProcessPacket_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = __SecOTRSProcessPacket_block_invoke_2;
  v3[3] = &unk_1E54819C8;
  long long v1 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v5 = v1;
  _os_activity_initiate(&dword_18B299000, "OTR Process Packet", OS_ACTIVITY_FLAG_DEFAULT, v3);
  return result;
}

@end