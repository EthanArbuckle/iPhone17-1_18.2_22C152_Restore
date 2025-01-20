@interface CAMVideoCorruptor
+ (BOOL)corruptVideoFileAtURLWhenEnabled:(id)a3;
+ (int)_corruptMethodFytpForFile:(__sFILE *)a3 ofSize:(int64_t)a4;
+ (int)_corruptMethodMdatForFile:(__sFILE *)a3 ofSize:(int64_t)a4;
+ (int)_corruptMethodMoovForFile:(__sFILE *)a3 ofSize:(int64_t)a4;
+ (int)_findBox:(unsigned int)a3 inFile:(__sFILE *)a4 ofSize:(int64_t)a5 boxSize:(int64_t *)a6;
+ (int)_getBoxInfoFromFile:(__sFILE *)a3 ofSize:(int64_t)a4 boxType:(unsigned int *)a5 boxSize:(int64_t *)a6;
@end

@implementation CAMVideoCorruptor

+ (int)_getBoxInfoFromFile:(__sFILE *)a3 ofSize:(int64_t)a4 boxType:(unsigned int *)a5 boxSize:(int64_t *)a6
{
  off_t v10 = ftello(a3);
  if (ftello(a3) + 4 > a4) {
    return -1;
  }
  unsigned int __ptr = 0;
  if (fread(&__ptr, 4uLL, 1uLL, a3) != 1) {
    return -1;
  }
  unint64_t v11 = bswap32(__ptr);
  unint64_t v15 = v11;
  if (!__ptr)
  {
    unint64_t v11 = a4 - ftello(a3) - 4;
    unint64_t v15 = v11;
  }
  if (v11 > a4 - v10) {
    return -1;
  }
  if (ftello(a3) + 4 > a4) {
    return -1;
  }
  unsigned int v14 = 0;
  if (fread(&v14, 4uLL, 1uLL, a3) != 1) {
    return -1;
  }
  unsigned int v12 = v14;
  if (v11 == 1)
  {
    if (ftello(a3) + 8 > a4 || fread(&v15, 8uLL, 1uLL, a3) != 1) {
      return -1;
    }
    unint64_t v11 = bswap64(v15);
  }
  int result = fseeko(a3, v10, 0);
  if (result) {
    return -1;
  }
  *a5 = bswap32(v12);
  *a6 = v11;
  return result;
}

+ (int)_findBox:(unsigned int)a3 inFile:(__sFILE *)a4 ofSize:(int64_t)a5 boxSize:(int64_t *)a6
{
  id v10 = a1;
  int v14 = 0;
  off_t __offseta = 0;
  for (i = a4; ; i = a4)
  {
    int result = objc_msgSend(a1, "_getBoxInfoFromFile:ofSize:boxType:boxSize:", i, a5, &v14, &__offseta, __offseta);
    if (result) {
      break;
    }
    if (v14 == a3)
    {
      int result = 0;
      *a6 = __offseta;
      return result;
    }
    if (fseeko(a4, __offseta, 1)) {
      return -1;
    }
    int v14 = 0;
    off_t __offseta = 0;
    a1 = v10;
  }
  return result;
}

+ (int)_corruptMethodFytpForFile:(__sFILE *)a3 ofSize:(int64_t)a4
{
  uint64_t v10 = 0;
  int __ptr = 1701147238;
  int result = [a1 _findBox:1718909296 inFile:a3 ofSize:a4 boxSize:&v10];
  if (!result)
  {
    if (v10 < 16 || fseeko(a3, 4, 1) || fwrite(&__ptr, 4uLL, 1uLL, a3) != 1) {
      return -1;
    }
    uint64_t v6 = v10;
    v10 -= 8;
    if (v6 >= 9)
    {
      while (1)
      {
        char v8 = 0;
        if (fwrite(&v8, 1uLL, 1uLL, a3) != 1) {
          break;
        }
        uint64_t v7 = v10--;
        if (v7 < 2) {
          return 0;
        }
      }
      return -1;
    }
    return 0;
  }
  return result;
}

+ (int)_corruptMethodMdatForFile:(__sFILE *)a3 ofSize:(int64_t)a4
{
  uint64_t v9 = 0;
  int __ptr = 0;
  int result = [a1 _findBox:1835295092 inFile:a3 ofSize:a4 boxSize:&v9];
  if (!result)
  {
    if (v9 < 16 || fwrite(&__ptr, 4uLL, 1uLL, a3) != 1 || fseeko(a3, v9 - 4, 1))
    {
      return -1;
    }
    else
    {
      int v6 = fileno(a3);
      off_t v7 = ftello(a3);
      if (ftruncate(v6, v7)) {
        return -1;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

+ (int)_corruptMethodMoovForFile:(__sFILE *)a3 ofSize:(int64_t)a4
{
  uint64_t v7 = 0;
  int __ptr = 1445998669;
  int result = [a1 _findBox:1836019574 inFile:a3 ofSize:a4 boxSize:&v7];
  if (!result)
  {
    if (v7 < 16 || fseeko(a3, 4, 1))
    {
      return -1;
    }
    else if (fwrite(&__ptr, 4uLL, 1uLL, a3) == 1)
    {
      return 0;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

+ (BOOL)corruptVideoFileAtURLWhenEnabled:(id)a3
{
  id v4 = a3;
  if (corruptVideoFileAtURLWhenEnabled__onceToken != -1) {
    dispatch_once(&corruptVideoFileAtURLWhenEnabled__onceToken, &__block_literal_global_54);
  }
  if (corruptVideoFileAtURLWhenEnabled__enabled != 1
    || corruptVideoFileAtURLWhenEnabled__atRandom == 1 && (rand() & 1) == 0
    || (v5 = fopen((const char *)[v4 fileSystemRepresentation], "r+b")) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_19;
  }
  int v6 = v5;
  if (!fseeko(v5, 0, 2))
  {
    off_t v7 = ftello(v6);
    if (v7 >= 1)
    {
      off_t v8 = v7;
      if (!fseeko(v6, 0, 0))
      {
        unint64_t v9 = corruptVideoFileAtURLWhenEnabled__corruptionMethod++;
        unint64_t v10 = v9 % 3;
        if (v9 % 3 == 2)
        {
          int v11 = [a1 _corruptMethodMoovForFile:v6 ofSize:v8];
          goto LABEL_17;
        }
        if (v10 == 1)
        {
          int v11 = [a1 _corruptMethodMdatForFile:v6 ofSize:v8];
          goto LABEL_17;
        }
        if (!v10)
        {
          int v11 = [a1 _corruptMethodFytpForFile:v6 ofSize:v8];
LABEL_17:
          BOOL v12 = v11 == 0;
          goto LABEL_18;
        }
      }
    }
  }
  BOOL v12 = 0;
LABEL_18:
  fclose(v6);
LABEL_19:

  return v12;
}

CFIndex __54__CAMVideoCorruptor_corruptVideoFileAtURLWhenEnabled___block_invoke()
{
  CFIndex result = CFPreferencesGetAppIntegerValue(@"CAMVideoCorruptorMode", @"com.apple.camera", 0);
  if (result == 1)
  {
    corruptVideoFileAtURLWhenEnabled__enabled = 1;
    corruptVideoFileAtURLWhenEnabled__atRandom = 0;
  }
  else if (result == 2)
  {
    corruptVideoFileAtURLWhenEnabled__enabled = 1;
    corruptVideoFileAtURLWhenEnabled__atRandom = 1;
  }
  else
  {
    corruptVideoFileAtURLWhenEnabled__enabled = 0;
  }
  return result;
}

@end