@interface NSURL
- (id)urlByAppendingPathComponents:(id)a3 lastIsDirectory:(BOOL)a4;
@end

@implementation NSURL

- (id)urlByAppendingPathComponents:(id)a3 lastIsDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8 = self;
  v9 = (char *)[v6 count];
  if (v9)
  {
    v10 = v9 - 1;
    if (v9 == (char *)1)
    {
      v13 = v8;
    }
    else
    {
      v11 = 0;
      do
      {
        v12 = [v6 objectAtIndexedSubscript:v11];
        v13 = [(NSURL *)v8 URLByAppendingPathComponent:v12 isDirectory:1];

        ++v11;
        v8 = v13;
      }
      while (v10 != v11);
    }
    v14 = [v6 objectAtIndexedSubscript:v10];
    v8 = [(NSURL *)v13 URLByAppendingPathComponent:v14 isDirectory:v4];
  }
  v15 = v8;

  return v15;
}

@end