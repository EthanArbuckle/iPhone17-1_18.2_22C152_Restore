@interface NSDictionary
@end

@implementation NSDictionary

void __67__NSDictionary_TranslationAdditions__lt_ensureTypesForKeys_values___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  if (!a1[5])
  {
    if (!a1[6]) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a1[6]) {
    goto LABEL_7;
  }
  if (isKindOfClass)
  {
LABEL_6:
    char isKindOfClass = objc_opt_isKindOfClass();
LABEL_7:
    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
  *a4 = 1;
LABEL_9:
}

@end