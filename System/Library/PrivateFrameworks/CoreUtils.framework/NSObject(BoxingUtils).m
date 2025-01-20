@interface NSObject(BoxingUtils)
- (BOOL)BOOLValueSafe;
- (BOOL)BOOLValueSafe:()BoxingUtils;
- (__CFString)stringValueSafe:()BoxingUtils;
- (const)utf8ValueSafe:()BoxingUtils;
- (double)doubleValueSafe;
- (double)doubleValueSafe:()BoxingUtils;
- (uint64_t)stringValueSafe;
- (uint64_t)utf8ValueSafe;
- (unint64_t)int64ValueSafe;
- (unint64_t)int64ValueSafe:()BoxingUtils;
@end

@implementation NSObject(BoxingUtils)

- (const)utf8ValueSafe:()BoxingUtils
{
  int v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = CFCopyCString(a1, &v9);
    if (v5)
    {
      v6 = [NSString stringWithUTF8String:v5];
      free(v5);
      if (!v6)
      {
        v5 = 0;
        goto LABEL_16;
      }
      id v7 = v6;
      v5 = (char *)[v7 UTF8String];
      if (v5) {
        int v9 = 0;
      }
      else {
        int v9 = -6700;
      }
    }
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v5 = (char *)[(__CFString *)a1 UTF8String];
  if (v5)
  {
    int v9 = 0;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = v9;
    goto LABEL_12;
  }
LABEL_16:
  int v9 = -6700;
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:
  if (v5) {
    return v5;
  }
  else {
    return "";
  }
}

- (uint64_t)utf8ValueSafe
{
  return [a1 utf8ValueSafe:0];
}

- (__CFString)stringValueSafe:()BoxingUtils
{
  int v11 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = a1;
    if (v5)
    {
LABEL_3:
      int v11 = 0;
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  int v9 = CFCopyCString(a1, &v11);
  if (v9)
  {
    v10 = v9;
    v5 = [NSString stringWithUTF8String:v9];
    free(v10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    int v11 = -6700;
    goto LABEL_4;
  }
  v5 = 0;
LABEL_4:
  if (a3) {
    *a3 = v11;
  }
  v6 = &stru_1EDD2ACE8;
  if (v5) {
    v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (uint64_t)stringValueSafe
{
  return [a1 stringValueSafe:0];
}

- (double)doubleValueSafe:()BoxingUtils
{
  return CFGetDouble(a1, a3);
}

- (double)doubleValueSafe
{
  return CFGetDouble(a1, 0);
}

- (unint64_t)int64ValueSafe:()BoxingUtils
{
  return CFGetInt64(a1, a3);
}

- (unint64_t)int64ValueSafe
{
  return CFGetInt64(a1, 0);
}

- (BOOL)BOOLValueSafe:()BoxingUtils
{
  return CFGetInt64(a1, a3) != 0;
}

- (BOOL)BOOLValueSafe
{
  return CFGetInt64(a1, 0) != 0;
}

@end