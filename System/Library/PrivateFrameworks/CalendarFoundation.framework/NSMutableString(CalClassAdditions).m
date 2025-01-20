@interface NSMutableString(CalClassAdditions)
- (void)replaceOccurrencesOfString:()CalClassAdditions withString:;
- (void)searchAndReplaceInString:()CalClassAdditions withString:;
@end

@implementation NSMutableString(CalClassAdditions)

- (void)replaceOccurrencesOfString:()CalClassAdditions withString:
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(a1, "length"));
}

- (void)searchAndReplaceInString:()CalClassAdditions withString:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a1];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v8 setCharactersToBeSkipped:0];
  if ([v8 scanString:v6 intoString:0]) {
    [v9 appendString:v7];
  }
  id v15 = 0;
  int v10 = [v8 scanUpToString:v6 intoString:&v15];
  id v11 = v15;
  v12 = v11;
  if (v10)
  {
    do
    {
      [v9 appendString:v12];
      if ([v8 scanString:v6 intoString:0]) {
        [v9 appendString:v7];
      }
      id v15 = v12;
      char v13 = [v8 scanUpToString:v6 intoString:&v15];
      id v14 = v15;

      v12 = v14;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    id v14 = v11;
  }
  [a1 setString:v9];
}

@end