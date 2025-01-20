@interface NSMutableData
+ (NSMutableData)dataWithSpace:(unint64_t)a3 DEREncode:(id)a4;
@end

@implementation NSMutableData

+ (NSMutableData)dataWithSpace:(unint64_t)a3 DEREncode:(id)a4
{
  v5 = (uint64_t (**)(id, unint64_t, id))a4;
  id v6 = +[NSMutableData dataWithLength:a3];
  id v7 = [v6 mutableBytes];
  unint64_t v8 = v5[2](v5, a3, v7);

  if ((a3 & 0x8000000000000000) != 0 || (unint64_t)v7 > v8)
  {

    id v6 = 0;
  }
  else
  {
    objc_msgSend(v6, "replaceBytesInRange:withBytes:length:", 0, v8 - (void)v7, 0, 0);
  }

  return (NSMutableData *)v6;
}

@end