@interface NSMutableData(NSDataUtils)
- (char)mf_convertNetworkLineEndingsToUnixInRange:()NSDataUtils;
- (uint64_t)mf_appendCString:()NSDataUtils;
- (uint64_t)mf_convertNetworkLineEndingsToUnix;
@end

@implementation NSMutableData(NSDataUtils)

- (uint64_t)mf_appendCString:()NSDataUtils
{
  size_t v5 = strlen(__s);
  return [a1 appendBytes:__s length:v5];
}

- (char)mf_convertNetworkLineEndingsToUnixInRange:()NSDataUtils
{
  result = (char *)[a1 length];
  if ((unint64_t)a4 < 2) {
    return result;
  }
  v8 = result;
  id v9 = a1;
  uint64_t v10 = [v9 mutableBytes];
  v11 = (char *)(v10 + a3);
  v12 = (char *)(v10 + a3 + a4);
  v22 = v9;
  if (a4 < 1)
  {
    result = (char *)(v10 + a3);
    goto LABEL_22;
  }
  v13 = (char *)(v10 + a3);
  v14 = (char *)(v10 + a3);
  while (1)
  {
    v15 = (char *)memchr(v13, 13, v12 - v13 - 1);
    v16 = v15;
    BOOL v17 = v15 != 0;
    if (v15) {
      BOOL v18 = v15 >= v12;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      while (v16[1] != 10)
      {
        v20 = (char *)memchr(v16 + 1, 13, v12 - 2 - v16);
        v16 = v20;
        BOOL v17 = v20 != 0;
        if (!v20 || v20 >= v12) {
          goto LABEL_9;
        }
      }
      goto LABEL_10;
    }
LABEL_9:
    if (!v17) {
      break;
    }
LABEL_10:
    v19 = v16;
    if (v13 != v14)
    {
      memmove(v14, v13, v16 - v13);
      v19 = &v14[v16 - v13];
    }
    char *v19 = 10;
    result = v19 + 1;
    v13 = v16 + 2;
    v14 = result;
    if (v16 + 2 >= v12) {
      goto LABEL_22;
    }
  }
  if (v14 != v11) {
    memmove(v14, v13, v12 - v13);
  }
  result = &v14[v12 - v13];
LABEL_22:
  v21 = (char *)(result - v11);
  if (result - v11 != a4 && v8 != (char *)a4) {
    result = (char *)memmove(result, v12, (size_t)&v8[-a3 - a4]);
  }
  if (v21 != (char *)a4)
  {
    return (char *)[v22 setLength:&v8[(void)v21 - a4]];
  }
  return result;
}

- (uint64_t)mf_convertNetworkLineEndingsToUnix
{
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "mf_convertNetworkLineEndingsToUnixInRange:", 0, v2);
}

@end