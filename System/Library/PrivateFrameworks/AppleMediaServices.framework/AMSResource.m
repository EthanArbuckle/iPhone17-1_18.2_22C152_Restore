@interface AMSResource
+ (id)loadHARFileWithName:(id)a3 bundle:(id)a4;
+ (id)loadHARFileWithName:(id)a3 bundle:(id)a4 inDirectory:(id)a5;
+ (id)loadPropertyListWithName:(id)a3 bundle:(id)a4 error:(id *)a5;
@end

@implementation AMSResource

+ (id)loadHARFileWithName:(id)a3 bundle:(id)a4
{
  v4 = [a4 pathForResource:a3 ofType:@"har"];
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:0];
    objc_opt_class();
    id v7 = 0;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)loadHARFileWithName:(id)a3 bundle:(id)a4 inDirectory:(id)a5
{
  v5 = [a4 pathForResource:a3 ofType:@"har" inDirectory:a5];
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
    objc_opt_class();
    id v8 = 0;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)loadPropertyListWithName:(id)a3 bundle:(id)a4 error:(id *)a5
{
  v6 = [a4 pathForResource:a3 ofType:@"plist"];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6 options:0 error:a5];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:a5];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;

          id v12 = v11;
        }
        else
        {

          if (a5)
          {
            AMSError(2, @"Invalid Property List", @"Expected the property list to be a dictionary", 0);
            id v12 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v12 = 0;
          }
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else if (a5)
  {
    AMSError(7, @"File not found", @"Could not find the file.", 0);
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end