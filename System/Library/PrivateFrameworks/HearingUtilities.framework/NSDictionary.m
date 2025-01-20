@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __97__NSDictionary__AX_HA_DEPENDENT_ENUMERATION___enumerateKeysAndObjectsInDependentOrderUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  if (!propertyIsDependentOnProperty([v4 unsignedLongLongValue], objc_msgSend(v5, "unsignedLongLongValue")))
  {
    if (propertyIsDependentOnProperty([v5 unsignedLongLongValue], objc_msgSend(v4, "unsignedLongLongValue")))
    {
      uint64_t v6 = -1;
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = 1;
LABEL_8:

  return v6;
}

@end