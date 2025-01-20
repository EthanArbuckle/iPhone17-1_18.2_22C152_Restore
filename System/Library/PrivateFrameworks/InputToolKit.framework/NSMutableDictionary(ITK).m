@interface NSMutableDictionary(ITK)
- (uint64_t)itk_addKey:()ITK forNonNilObject:;
- (void)itk_addEntriesFromNonNilDictionary:()ITK;
- (void)itk_removeObjectForNonNilKey:()ITK;
- (void)itk_setNonNilObject:()ITK forKey:;
- (void)itk_setNonNilObject:()ITK forNonNilKey:;
@end

@implementation NSMutableDictionary(ITK)

- (void)itk_removeObjectForNonNilKey:()ITK
{
  if (a3) {
    return objc_msgSend(a1, "removeObjectForKey:");
  }
  return a1;
}

- (void)itk_addEntriesFromNonNilDictionary:()ITK
{
  if (a3) {
    return objc_msgSend(a1, "addEntriesFromDictionary:");
  }
  return a1;
}

- (void)itk_setNonNilObject:()ITK forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

- (void)itk_setNonNilObject:()ITK forNonNilKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKeyedSubscript:");
    }
  }
  return a1;
}

- (uint64_t)itk_addKey:()ITK forNonNilObject:
{
  return objc_msgSend(a1, "itk_setNonNilObject:forKey:", a4, a3);
}

@end