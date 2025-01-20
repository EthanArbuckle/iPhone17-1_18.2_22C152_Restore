@interface NSArray
- (id)arrayInterspersingSpaceStringsBetweenObjects;
@end

@implementation NSArray

- (id)arrayInterspersingSpaceStringsBetweenObjects
{
  if ([(NSArray *)self count])
  {
    v3 = +[NSMutableArray arrayWithCapacity:2 * [(NSArray *)self count] - 1];
    if ([(NSArray *)self count])
    {
      v4 = 0;
      do
      {
        v5 = [(NSArray *)self objectAtIndexedSubscript:v4];
        [v3 addObject:v5];

        if (v4 < (char *)[(NSArray *)self count] - 1) {
          [v3 addObject:@" "];
        }
        ++v4;
      }
      while (v4 < (char *)[(NSArray *)self count]);
    }
    v6 = +[NSArray arrayWithArray:v3];
  }
  else
  {
    v6 = self;
  }

  return v6;
}

@end