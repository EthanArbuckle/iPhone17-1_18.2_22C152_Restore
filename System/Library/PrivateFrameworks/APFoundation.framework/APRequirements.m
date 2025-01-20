@interface APRequirements
+ (BOOL)_buildErrorWithCode:(int64_t)a3 message:(id)a4 returningError:(id *)a5;
+ (BOOL)_testForFileSystemReturningError:(id *)a3;
+ (BOOL)hasRequirements:(unint64_t)a3 error:(id *)a4;
+ (unint64_t)failForRequirements;
+ (void)setFailForRequirements:(unint64_t)a3;
@end

@implementation APRequirements

+ (BOOL)hasRequirements:(unint64_t)a3 error:(id *)a4
{
  char v5 = a3;
  if (+[APSystemInternal isAppleInternalInstall]) {
    BOOL v6 = qword_1EA81B900 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v8 = [v7 valueForKey:@"FailForTheseRequirements"];

    if (v8) {
      BOOL v9 = qword_1EA81B900 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9) {
      qword_1EA81B900 = [v8 unsignedIntegerValue];
    }
  }
  if ((v5 & 1) == 0
    || (BOOL v10 = +[APRequirements _testForFileSystemReturningError:a4]))
  {
    LOBYTE(v10) = v5 & 1;
  }
  return v10;
}

+ (unint64_t)failForRequirements
{
  return qword_1EA81B900;
}

+ (void)setFailForRequirements:(unint64_t)a3
{
  qword_1EA81B900 = a3;
}

+ (BOOL)_testForFileSystemReturningError:(id *)a3
{
  if (!+[APSystemInternal isAppleInternalInstall]
    || (qword_1EA81B900 & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    BOOL v6 = [v5 firstObject];

    if (!v6)
    {
      +[APRequirements _buildErrorWithCode:16001 message:@"No access to ~/Library" returningError:a3];
      BOOL v15 = 0;
LABEL_21:

      return v15;
    }
    v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    if (v7)
    {
      char v19 = 0;
      if ([v4 fileExistsAtPath:v6 isDirectory:&v19])
      {
        uint64_t v8 = *MEMORY[0x1E4F1C668];
        BOOL v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C628], *MEMORY[0x1E4F1C668], 0);
        BOOL v10 = [v4 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:1 error:a3];
        v11 = [v10 firstObject];

        if (v11)
        {
          id v18 = 0;
          int v12 = [v11 getResourceValue:&v18 forKey:v8 error:a3];
          id v13 = v18;
          v14 = v13;
          if (!v12 || v13 && ([v13 BOOLValue] & 1) != 0)
          {
            BOOL v15 = 1;
          }
          else
          {
            +[APRequirements _buildErrorWithCode:16001 message:@"Directory isn't readable at ~/Library." returningError:a3];
            BOOL v15 = 0;
          }
        }
        else
        {
          +[APRequirements _buildErrorWithCode:16001 message:@"Directory doesn't exist at ~/Library." returningError:a3];
          BOOL v15 = 0;
        }

        goto LABEL_20;
      }
      v16 = @"Directory doesn't exist at ~/Library.";
    }
    else
    {
      v16 = @"No access to ~/Library";
    }
    +[APRequirements _buildErrorWithCode:16001 message:v16 returningError:a3];
    BOOL v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
  +[APRequirements _buildErrorWithCode:16001 message:@"Mocking No Access to UserLibraryFileSystem." returningError:a3];
  return 0;
}

+ (BOOL)_buildErrorWithCode:(int64_t)a3 message:(id)a4 returningError:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = a4;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a4;
    BOOL v10 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v7 errorWithDomain:@"com.apple.ap.requirementsErrorDomain" code:a3 userInfo:v10];

    *a5 = v11;
  }
  return 0;
}

@end