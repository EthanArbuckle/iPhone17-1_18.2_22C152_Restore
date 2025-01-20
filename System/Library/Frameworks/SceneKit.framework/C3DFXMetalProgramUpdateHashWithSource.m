@interface C3DFXMetalProgramUpdateHashWithSource
@end

@implementation C3DFXMetalProgramUpdateHashWithSource

CFHashCode ___C3DFXMetalProgramUpdateHashWithSource_block_invoke(uint64_t a1, CFTypeRef cf, const void *a3)
{
  CFHashCode v5 = CFHash(cf);
  CFHashCode result = CFHash(a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v8 = 0x9DDFEA08EB382D69
     * (*(void *)(v7 + 56) ^ ((0x9DDFEA08EB382D69 * (*(void *)(v7 + 56) ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                             * (*(void *)(v7 + 56) ^ v5)));
  *(void *)(v7 + 56) = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void *)(v9 + 56);
  *(void *)(v9 + 56) = 0x9DDFEA08EB382D69
                       * ((0x9DDFEA08EB382D69
                         * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ result)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                   * (v10 ^ result)))) ^ ((0x9DDFEA08EB382D69 * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ result)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ result)))) >> 47));
  return result;
}

@end