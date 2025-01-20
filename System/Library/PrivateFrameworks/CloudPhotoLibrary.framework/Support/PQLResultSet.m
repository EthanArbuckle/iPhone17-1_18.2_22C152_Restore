@interface PQLResultSet
- (id)cplChangeAtIndex:(int)a3;
@end

@implementation PQLResultSet

- (id)cplChangeAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6 = [(PQLResultSet *)self dataAtIndex:v3];
  if (v6)
  {
    v7 = +[CPLArchiver unarchiveObjectWithData:v6 ofClass:objc_opt_class()];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end