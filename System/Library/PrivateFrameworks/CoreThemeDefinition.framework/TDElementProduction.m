@interface TDElementProduction
- (id)associatedFileModificationDateWithDocument:(id)a3;
- (id)associatedFileURLWithDocument:(id)a3;
- (id)relativePath;
@end

@implementation TDElementProduction

- (id)relativePath
{
  return 0;
}

- (id)associatedFileURLWithDocument:(id)a3
{
  return 0;
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v3 = objc_msgSend(-[TDElementProduction associatedFileURLWithDocument:](self, "associatedFileURLWithDocument:", a3), "path");
  v4 = (void *)[MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];
  if (v5) {
    v6 = (void *)[v4 attributesOfItemAtPath:v3 error:0];
  }
  else {
    v6 = 0;
  }
  id result = (id)[v6 objectForKey:*MEMORY[0x263F08048]];
  if (result) {
    int v8 = 0;
  }
  else {
    int v8 = v5;
  }
  if (v8 == 1)
  {
    NSLog(&cfstr_Tdelementprodu_1.isa, v3);
    v9 = (void *)MEMORY[0x263EFF910];
    return (id)[v9 distantFuture];
  }
  return result;
}

@end