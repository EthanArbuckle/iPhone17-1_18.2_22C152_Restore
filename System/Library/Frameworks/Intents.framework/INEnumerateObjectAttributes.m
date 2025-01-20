@interface INEnumerateObjectAttributes
@end

@implementation INEnumerateObjectAttributes

uint64_t ___INEnumerateObjectAttributes_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t isKindOfClass = INEnumerateObjectsInCodable(v6, *(void *)(a1 + 32));
    id v4 = v6;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_7;
  }
  id v4 = v6;
  if (v6)
  {
    uint64_t isKindOfClass = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = v6;
    if (isKindOfClass) {
      goto LABEL_6;
    }
  }
LABEL_7:

  return MEMORY[0x1F41817F8](isKindOfClass, v4);
}

@end