@interface RedundancyCheck
+ (unsigned)crc16:(id)a3;
+ (unsigned)lrc:(id)a3;
@end

@implementation RedundancyCheck

+ (unsigned)crc16:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unint64_t v4 = 0;
    LOWORD(v5) = 0;
    do
    {
      id v6 = v3;
      int v5 = word_10001DF90[(*((unsigned char *)[v6 bytes] + v4++) ^ v5)] ^ ((unsigned __int16)(v5 & 0xFF00) >> 8);
    }
    while (v4 < (unint64_t)[v6 length]);
  }
  else
  {
    LOWORD(v5) = 0;
  }

  return v5;
}

+ (unsigned)lrc:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unint64_t v4 = 0;
    unsigned __int8 v5 = 0;
    do
    {
      id v6 = v3;
      v5 ^= *((unsigned char *)[v6 bytes] + v4++);
    }
    while (v4 < (unint64_t)[v6 length]);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end