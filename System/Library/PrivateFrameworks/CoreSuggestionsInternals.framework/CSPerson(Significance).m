@interface CSPerson(Significance)
- (BOOL)sg_isSignificantWithStore:()Significance;
@end

@implementation CSPerson(Significance)

- (BOOL)sg_isSignificantWithStore:()Significance
{
  id v4 = a3;
  if (v4
    && ([a1 handles],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    v7 = [a1 handles];
    if ([v4 anyHandleIsSignificant:v7])
    {
      BOOL v8 = 1;
    }
    else
    {
      v9 = [a1 handles];
      v10 = [v9 objectAtIndexedSubscript:0];
      v11 = [a1 handleIdentifier];
      BOOL v8 = +[SGContactsInterface handleExistsInContactStoreForHandle:v10 withHandleType:v11];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end