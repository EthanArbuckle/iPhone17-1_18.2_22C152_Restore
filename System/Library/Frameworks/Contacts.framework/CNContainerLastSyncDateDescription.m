@interface CNContainerLastSyncDateDescription
- (BOOL)isWritable;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerLastSyncDateDescription

- (id)key
{
  return @"lastSyncDate";
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isWritable
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)[a3 lastSyncDate];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v9 = v5;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v9;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  [v6 setLastSyncDate:v8];
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E30];
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (id)CNValueFromABValue:(void *)a3
{
  v3 = a3;

  return v3;
}

@end