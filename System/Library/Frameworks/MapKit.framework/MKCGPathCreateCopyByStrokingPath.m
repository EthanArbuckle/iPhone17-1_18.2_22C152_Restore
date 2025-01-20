@interface MKCGPathCreateCopyByStrokingPath
@end

@implementation MKCGPathCreateCopyByStrokingPath

void ___MKCGPathCreateCopyByStrokingPath_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 1)
  {
    v8 = *(CGFloat **)(a2 + 8);
    CGFloat v4 = *v8;
    CGFloat v5 = v8[1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void *)(v9 + 24);
    if (!v10)
    {
      v15.x = v4;
      v15.y = v5;
      _MKCGPathAddLineCap(*(CGMutablePathRef *)(a1 + 56), *(CGPoint *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v15, *(double *)(a1 + 64), *(CGLineCap *)(a1 + 76), 1);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v10 = *(void *)(v9 + 24);
    }
    *(void *)(v9 + 24) = v10 + 1;
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v7 = a1 + 40;
    *(_OWORD *)(*(void *)(v12 + 8) + 48) = *(_OWORD *)(*(void *)(v11 + 8) + 48);
  }
  else
  {
    if (*(_DWORD *)a2) {
      return;
    }
    v3 = *(CGFloat **)(a2 + 8);
    CGFloat v4 = *v3;
    CGFloat v5 = v3[1];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v6 + 24))
    {
      v14.x = v4;
      v14.y = v5;
      _MKCGPathAddLineCap(*(CGMutablePathRef *)(a1 + 56), *(CGPoint *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v14, *(double *)(a1 + 64), *(CGLineCap *)(a1 + 72), 0);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    *(void *)(v6 + 24) = 0;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) = *MEMORY[0x1E4F1DAD8];
    uint64_t v7 = a1 + 40;
  }
  uint64_t v13 = *(void *)(*(void *)v7 + 8);
  *(CGFloat *)(v13 + 48) = v4;
  *(CGFloat *)(v13 + 56) = v5;
}

@end