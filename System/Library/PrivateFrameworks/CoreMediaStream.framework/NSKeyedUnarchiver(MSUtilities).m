@interface NSKeyedUnarchiver(MSUtilities)
+ (id)MSSafeUnarchiveAllowedClasses;
+ (id)MSSafeUnarchiveObjectWithData:()MSUtilities outError:;
+ (id)MSSafeUnarchiveObjectWithFile:()MSUtilities outError:;
@end

@implementation NSKeyedUnarchiver(MSUtilities)

+ (id)MSSafeUnarchiveObjectWithFile:()MSUtilities outError:
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  v7 = [(id)objc_opt_class() MSSafeUnarchiveObjectWithData:v6 outError:a4];

  return v7;
}

+ (id)MSSafeUnarchiveObjectWithData:()MSUtilities outError:
{
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F28DC0];
    v8 = [a1 MSSafeUnarchiveAllowedClasses];
    v9 = [v7 unarchivedObjectOfClasses:v8 fromData:v6 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] MSErrorWithDomain:@"MSArchiverUtilitiesErrorDomain" code:0 description:@"Empty data"];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)MSSafeUnarchiveAllowedClasses
{
  if (MSSafeUnarchiveAllowedClasses_onceToken != -1) {
    dispatch_once(&MSSafeUnarchiveAllowedClasses_onceToken, &__block_literal_global_6590);
  }
  v0 = (void *)MSSafeUnarchiveAllowedClasses_allowedClasses;
  return v0;
}

@end