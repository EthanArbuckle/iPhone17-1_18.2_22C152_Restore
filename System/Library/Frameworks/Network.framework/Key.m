@interface Key
@end

@implementation Key

uint64_t __nw_quic_connection_set_client_identity_is_raw_public_Key_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int16 *)(a2 + 215);
  uint64_t v2 = a2 + 215;
  unsigned int v4 = v3 & 0xFFFFDFFF | (*(unsigned __int8 *)(v2 + 2) << 16) | (*(unsigned __int8 *)(a1 + 32) << 13);
  *(_WORD *)uint64_t v2 = v3 & 0xDFFF | (*(unsigned __int8 *)(a1 + 32) << 13);
  *(unsigned char *)(v2 + 2) = BYTE2(v4);
  return 1;
}

@end