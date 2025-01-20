@interface NSFoundationBundle
@end

@implementation NSFoundationBundle

NSBundle *___NSFoundationBundle_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = +[NSBundle bundleForClass:self];
  qword_1EB1ED640 = (uint64_t)v0;
  result = +[NSBundle mainBundle];
  if (v0 == result)
  {
    v2 = +[NSBundle bundleWithPath:@"/System/Frameworks/Foundation.framework"];
    qword_1EB1ED640 = (uint64_t)v2;
    if (!v2 || (v3 = v2, result = +[NSBundle mainBundle], v3 == result))
    {
      v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      result = (NSBundle *)[(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
      if (result)
      {
        v5 = result;
        uint64_t v6 = *(void *)v10;
LABEL_7:
        uint64_t v7 = 0;
        while (1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          result = +[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", [*(id *)(*((void *)&v9 + 1) + 8 * v7) stringByAppendingPathComponent:@"Frameworks/Foundation.framework"]);
          qword_1EB1ED640 = (uint64_t)result;
          if (result) {
            break;
          }
          if (v5 == (NSBundle *)++v7)
          {
            result = (NSBundle *)[(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
            v5 = result;
            if (result) {
              goto LABEL_7;
            }
            return result;
          }
        }
      }
    }
  }
  return result;
}

@end