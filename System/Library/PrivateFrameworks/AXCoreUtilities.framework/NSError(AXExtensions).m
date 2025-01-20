@interface NSError(AXExtensions)
+ (id)ax_errorWithDomain:()AXExtensions code:description:;
+ (id)ax_errorWithDomain:()AXExtensions code:description:arguments:;
+ (id)ax_errorWithDomain:()AXExtensions description:;
- (id)ax_nonRedundantDescription;
@end

@implementation NSError(AXExtensions)

+ (id)ax_errorWithDomain:()AXExtensions description:
{
  v9 = objc_msgSend(a1, "ax_errorWithDomain:code:description:arguments:", a3, 0, a4, &a9);
  return v9;
}

+ (id)ax_errorWithDomain:()AXExtensions code:description:arguments:
{
  id v10 = a3;
  if (a5)
  {
    v11 = (objc_class *)NSString;
    id v12 = a5;
    v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:a6];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      a5 = objc_msgSend(v14, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E4F28568], 0);
    }
    else
    {
      a5 = 0;
    }
  }
  v15 = [a1 errorWithDomain:v10 code:a4 userInfo:a5];

  return v15;
}

+ (id)ax_errorWithDomain:()AXExtensions code:description:
{
  v9 = objc_msgSend(a1, "ax_errorWithDomain:code:description:arguments:", a3, a4, a5, &a9);
  return v9;
}

- (id)ax_nonRedundantDescription
{
  v2 = NSString;
  v3 = [a1 domain];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  v5 = [a1 localizedDescription];
  v6 = [v2 stringWithFormat:@"Domain:%@ Code:%@ Reason:%@", v3, v4, v5];

  return v6;
}

@end