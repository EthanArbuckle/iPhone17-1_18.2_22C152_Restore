@interface NSArray
- (id)_tcr_associatedReader;
@end

@implementation NSArray

- (id)_tcr_associatedReader
{
  v8.receiver = self;
  v8.super_class = (Class)NSArray;
  v3 = [(NSArray *)&v8 _tcr_associatedReader];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [TypeCheckedArrayReader alloc];
    v5 = self;
    if (v4)
    {
      v9.receiver = v4;
      v9.super_class = (Class)TypeCheckedArrayReader;
      v6 = [(NSArray *)&v9 init];
      v4 = (TypeCheckedArrayReader *)v6;
      if (v6) {
        objc_storeWeak((id *)&v6[1].super.isa, v5);
      }
    }

    [(NSArray *)v5 _tcr_associateWithReader:v4];
    v3 = v4;
  }
  return v3;
}

@end