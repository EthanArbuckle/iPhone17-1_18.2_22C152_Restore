@interface DEIO
+ (id)readDataOfLength:(unint64_t)a3 offset:(unint64_t)a4 from:(id)a5;
+ (void)copyTo:(id)a3 from:(id)a4;
@end

@implementation DEIO

+ (id)readDataOfLength:(unint64_t)a3 offset:(unint64_t)a4 from:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [v7 length];
  if (v8 - a4 >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v8 - a4;
  }
  v10 = objc_msgSend(v7, "subdataWithRange:", a4, v9);

  return v10;
}

+ (void)copyTo:(id)a3 from:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (v9 && v5)
  {
    uint64_t v6 = getpagesize();
    id v7 = [v5 readDataOfLength:v6];
    if (v7)
    {
      do
      {
        if (![v7 length]) {
          break;
        }
        [v9 writeData:v7];
        uint64_t v8 = [v5 readDataOfLength:v6];

        id v7 = (void *)v8;
      }
      while (v8);
    }
    [v9 close];
  }
}

@end