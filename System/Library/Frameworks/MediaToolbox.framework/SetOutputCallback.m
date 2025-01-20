@interface SetOutputCallback
@end

@implementation SetOutputCallback

void *__basicVideoCompositor_SetOutputCallback_block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[5];
  uint64_t v3 = result[6];
  uint64_t v4 = *(void *)(v2 + 296);
  if (v4 != v3 || *(void *)(v2 + 304) != result[7])
  {
    if (v4) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      *(void *)(v2 + 296) = v3;
      *(void *)(result[5] + 304) = result[7];
    }
    else
    {
      result = (void *)FigSignalErrorAt();
      *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = result;
    }
  }
  return result;
}

void *__openglVideoCompositor_SetOutputCallback_block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[5];
  uint64_t v3 = result[6];
  uint64_t v4 = *(void *)(v2 + 648);
  if (v4 != v3 || *(void *)(v2 + 656) != result[7])
  {
    if (v4) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      *(void *)(v2 + 648) = v3;
      *(void *)(result[5] + 656) = result[7];
    }
    else
    {
      result = (void *)FigSignalErrorAt();
      *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = result;
    }
  }
  return result;
}

void *__mvc_SetOutputCallback_block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[5];
  uint64_t v3 = result[6];
  uint64_t v4 = *(void *)(v2 + 24);
  if (v4 != v3 || *(void *)(v2 + 32) != result[7])
  {
    if (v4) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      *(void *)(v2 + 24) = v3;
      *(void *)(result[5] + 32) = result[7];
    }
    else
    {
      result = (void *)FigSignalErrorAt();
      *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = result;
    }
  }
  return result;
}

void *__customVideoCompositor_SetOutputCallback_block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[5];
  uint64_t v3 = result[6];
  uint64_t v4 = *(void *)(v2 + 176);
  if (v4 != v3 || *(void *)(v2 + 184) != result[7])
  {
    if (v4) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      *(void *)(v2 + 176) = v3;
      *(void *)(result[5] + 184) = result[7];
    }
    else
    {
      result = (void *)FigSignalErrorAt();
      *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = result;
    }
  }
  return result;
}

@end