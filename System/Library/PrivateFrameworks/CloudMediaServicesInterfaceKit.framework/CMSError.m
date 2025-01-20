@interface CMSError
+ (id)_descriptionForErrorCode:(int64_t)a3;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
@end

@implementation CMSError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  v6 = +[CMSError _descriptionForErrorCode:a4];
  v7 = +[CMSError errorWithDomain:v5 code:a4 description:v6];

  return v7;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F08320];
  v15[0] = a5;
  v8 = NSDictionary;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = [v7 errorWithDomain:v10 code:a4 userInfo:v11];

  return v12;
}

+ (id)_descriptionForErrorCode:(int64_t)a3
{
  if (a3 <= 999)
  {
    switch(a3)
    {
      case 1:
        return @"Invalid XPC connection";
      case 2:
        return @"Unsupported parameter value passed";
      case 3:
        return @"ImageURL is Nil";
      default:
        return @"Unknown error occurred";
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        id result = @"Playback queue unavailable";
        break;
      case 1001:
        id result = @"Remote destination not found";
        break;
      case 1002:
        id result = @"Send Playback Queue failed";
        break;
      case 1003:
        id result = @"Multi stream limit reached";
        break;
      case 1004:
        id result = @"Maximum number of content items allowed in a single queue segment exceeded";
        break;
      default:
        return @"Unknown error occurred";
    }
  }
  return result;
}

@end