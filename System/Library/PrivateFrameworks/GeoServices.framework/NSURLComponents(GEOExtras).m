@interface NSURLComponents(GEOExtras)
- (void)geo_updateQueryItemsWithBlock:()GEOExtras;
@end

@implementation NSURLComponents(GEOExtras)

- (void)geo_updateQueryItemsWithBlock:()GEOExtras
{
  v4 = a3;
  v5 = [GEOMutableURLQueryItems alloc];
  v6 = [a1 queryItems];
  v9 = [(GEOMutableURLQueryItems *)v5 initWithItems:v6];

  v4[2](v4, v9);
  v7 = [(GEOMutableURLQueryItems *)v9 items];
  if ([v7 count])
  {
    v8 = [(GEOMutableURLQueryItems *)v9 items];
    [a1 setQueryItems:v8];
  }
  else
  {
    [a1 setQueryItems:0];
  }
}

@end