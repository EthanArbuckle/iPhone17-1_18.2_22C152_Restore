@interface NSArray
- (BOOL)rpccui_isEqualToActionArray:(id)a3;
@end

@implementation NSArray

- (BOOL)rpccui_isEqualToActionArray:(id)a3
{
  v4 = (NSArray *)a3;
  v5 = v4;
  unsigned __int8 v6 = self == v4;
  if (v4 && self != v4)
  {
    id v7 = [(NSArray *)self count];
    if (v7 == (id)[(NSArray *)v5 count] && [(NSArray *)self count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(NSArray *)self objectAtIndexedSubscript:v8];
        v10 = [(NSArray *)v5 objectAtIndexedSubscript:v8];
        unsigned __int8 v6 = objc_msgSend(v9, "rpccui_isEqualToAction:", v10);

        if ((v6 & 1) == 0) {
          break;
        }
        ++v8;
      }
      while (v8 < [(NSArray *)self count]);
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

@end