@interface VisionCoreNamedObjects
@end

@implementation VisionCoreNamedObjects

uint64_t __83__VisionCoreNamedObjects_VNInternalAdditions__VNGetConfidenceValue_asTensor_error___block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 1;
}

BOOL __105__VisionCoreNamedObjects_VNInternalAdditions__VNEnumerateFloatValuesAtIndexes_asTensor_usingBlock_error___block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v5 = [a2 bytes];
  unint64_t v6 = *(void *)(a1 + 56);
  src.data = 0;
  std::vector<unsigned long>::vector(__p, v6, &src);
  char v17 = 0;
  uint64_t v7 = [*(id *)(a1 + 32) firstIndex];
  int64x2_t v15 = vdupq_n_s64(1uLL);
  while (1)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v12 = 2;
      goto LABEL_20;
    }
    *((void *)__p[0] + *(void *)(a1 + 64)) = v7;
    uint64_t v16 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "getByteOffset:forPosition:rank:error:", &v16) & 1) == 0) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void *)(a1 + 72);
    if (v9 != 65552) {
      break;
    }
    src.data = (void *)(v5 + v16);
    *(int64x2_t *)&src.height = v15;
    src.rowBytes = 2;
    int v20 = 2143289344;
    dest.data = &v20;
    *(int64x2_t *)&dest.height = v15;
    dest.rowBytes = 4;
    vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
    v8.n128_u32[0] = v20;
LABEL_8:
    char v10 = (*(uint64_t (**)(__n128))(*(void *)(a1 + 48) + 16))(v8);
    id v11 = 0;
    if ((v10 & 1) == 0)
    {
      if (a3)
      {
        id v11 = v11;
        *a3 = v11;
      }
      int v12 = 1;
      goto LABEL_16;
    }
    if (v17)
    {
      int v12 = 2;
LABEL_16:

      goto LABEL_20;
    }

    uint64_t v7 = [*(id *)(a1 + 32) indexGreaterThanIndex:v7];
  }
  if (v9 == 65568)
  {
    v8.n128_u32[0] = *(_DWORD *)(v5 + v16);
    goto LABEL_8;
  }
  if (a3)
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"Cannot interpret %@ as float values", *(void *)(a1 + 40)];
    *a3 = +[VNError errorForDataUnavailableWithLocalizedDescription:v13];
  }
LABEL_19:
  int v12 = 1;
LABEL_20:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v12 == 2;
}

@end