@interface NSString
+ (NSString)stringWithFileSystemRepresentation:(const char *)a3;
+ (NSString)stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4;
- (BOOL)containsDotDotPathComponents;
@end

@implementation NSString

+ (NSString)stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4
{
  v6 = +[NSFileManager defaultManager];
  v7 = [v6 stringWithFileSystemRepresentation:a3 length:a4];

  return (NSString *)v7;
}

+ (NSString)stringWithFileSystemRepresentation:(const char *)a3
{
  size_t v4 = strlen(a3);

  return +[NSString stringWithFileSystemRepresentation:a3 length:v4];
}

- (BOOL)containsDotDotPathComponents
{
  [(NSString *)self pathComponents];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqualToString:", @"..", (void)v9))
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

@end