@interface MergeMeshSources
@end

@implementation MergeMeshSources

uint64_t ____MergeMeshSources_block_invoke(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if ((a3 & 0xFD) == 0)
  {
    uint64_t v3 = result;
    unsigned int v4 = a3;
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8 * a3 + 72);
    result = C3DMeshSourceGetComponentsCountPerValue(a2);
    if (v5 <= result) {
      uint64_t v6 = result;
    }
    else {
      uint64_t v6 = v5;
    }
    *(void *)(*(void *)(v3 + 32) + 8 * v4 + 72) = v6;
  }
  return result;
}

@end