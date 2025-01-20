@interface NSData
- (int64_t)compare:(id)a3;
@end

@implementation NSData

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[NSData(PDDatabaseValue) compare:]", "PDDatabaseValue.m", 23, "[other isKindOfClass:[NSData class]]");
  }
  id v5 = v4;
  v6 = self;
  id v7 = [(NSData *)v6 bytes];
  id v8 = v5;
  id v9 = [v8 bytes];
  id v10 = [(NSData *)v6 length];
  id v11 = [v8 length];
  if (v10 >= v11) {
    size_t v12 = (size_t)v11;
  }
  else {
    size_t v12 = (size_t)v10;
  }
  int v13 = memcmp(v7, v9, v12);
  if ((v13 & 0x80000000) == 0)
  {
    if (v13)
    {
      int64_t v14 = 1;
      goto LABEL_11;
    }
    id v15 = [(NSData *)v6 length];
    if (v15 >= [v8 length])
    {
      id v16 = [(NSData *)v6 length];
      int64_t v14 = v16 > [v8 length];
      goto LABEL_11;
    }
  }
  int64_t v14 = -1;
LABEL_11:

  return v14;
}

@end