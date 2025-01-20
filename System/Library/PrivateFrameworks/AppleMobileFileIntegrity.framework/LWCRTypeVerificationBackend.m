@interface LWCRTypeVerificationBackend
@end

@implementation LWCRTypeVerificationBackend

BOOL __LWCRTypeVerificationBackend_verifyLWCR_block_invoke(void *a1, const char *a2, uint64_t a3)
{
  (*(void (**)(void))(a1[7] + 56))();
  if (!strcmp(a2, "vers") || !strcmp(a2, "comp") || !strcmp(a2, "ccat"))
  {
    if (((*(uint64_t (**)(uint64_t))(a1[7] + 16))(a3) & 2) == 0)
    {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
      v6 = *(void (**)(void))(a1[7] + 72);
      goto LABEL_8;
    }
    int v8 = strcmp(a2, "ccat");
    v9 = (int *)a1[7];
    if (v8) {
      goto LABEL_10;
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = (*((uint64_t (**)(uint64_t))v9 + 3))(a3);
    v9 = (int *)a1[7];
    int v10 = *v9;
    if (*v9 == 8 || v10 == 4)
    {
      if (!*(void *)(*(void *)(a1[5] + 8) + 24)) {
        goto LABEL_10;
      }
    }
    else
    {
      if (v10 != 2) {
        goto LABEL_10;
      }
      uint64_t v12 = *(void *)(*(void *)(a1[5] + 8) + 24);
      BOOL v13 = !v12 || v12 == 17;
      if (v13 || v12 == 127) {
        goto LABEL_10;
      }
    }
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    v6 = (void (*)(void))*((void *)v9 + 9);
    goto LABEL_8;
  }
  if (strcmp(a2, "reqs"))
  {
    v6 = *(void (**)(void))(a1[7] + 72);
LABEL_8:
    v6();
    return 0;
  }
  BOOL result = verifyAndOrDictionary(a1[7], a3, &v14);
  if (!result)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    return result;
  }
  v9 = (int *)a1[7];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
LABEL_10:
  (*((void (**)(void))v9 + 8))();
  return 1;
}

@end