@interface DECompressUtil
+ (BOOL)advanceZStream:(z_stream_s *)a3 function:(void *)a4 input:(id)a5 output:(id)a6 flush:(int)a7 streamEnded:(BOOL *)a8;
+ (void)initZStream:(z_stream_s *)a3;
@end

@implementation DECompressUtil

+ (BOOL)advanceZStream:(z_stream_s *)a3 function:(void *)a4 input:(id)a5 output:(id)a6 flush:(int)a7 streamEnded:(BOOL *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  BOOL v16 = 0;
  if (a3 && v13 && v14 && a8)
  {
    a3->avail_in = [v13 length];
    a3->next_in = (Bytef *)[v13 bytes];
    id v17 = v15;
    a3->next_out = (Bytef *)[v17 mutableBytes];
    a3->avail_out = [v17 length];
    uLong total_out = a3->total_out;
    for (int i = ((uint64_t (*)(z_stream_s *, uint64_t))a4)(a3, v9);
          ;
          int i = ((uint64_t (*)(z_stream_s *, uint64_t))a4)(a3, v9))
    {
      BOOL v16 = i == -5;
      if (i != -5)
      {
        if (i) {
          break;
        }
      }
      uLong v20 = a3->total_out - total_out;
      if (i == -5)
      {
        if (a3->avail_out) {
          goto LABEL_14;
        }
        objc_msgSend(v17, "setLength:", 2 * objc_msgSend(v17, "length"));
      }
      id v21 = v17;
      a3->next_out = (Bytef *)([v21 mutableBytes] + v20);
      a3->avail_out = [v21 length] - v20;
    }
    if (i == 1)
    {
      *a8 = 1;
      uLong v20 = a3->total_out - total_out;
LABEL_14:
      [v17 setLength:v20];
      BOOL v16 = 1;
      goto LABEL_16;
    }
    +[DELog error:@"Unexpected inflate status"];
  }
LABEL_16:

  return v16;
}

+ (void)initZStream:(z_stream_s *)a3
{
  if (a3)
  {
    a3->next_in = 0;
    a3->avail_in = 0;
    a3->next_out = 0;
    a3->avail_out = 0;
    a3->zfree = 0;
    a3->opaque = 0;
    a3->zalloc = 0;
  }
}

@end