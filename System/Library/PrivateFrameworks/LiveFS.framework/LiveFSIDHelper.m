@interface LiveFSIDHelper
+ (id)identifierForItem:(unint64_t)a3 name:(id)a4 parentID:(unint64_t)a5;
+ (unint64_t)rootItemID;
@end

@implementation LiveFSIDHelper

+ (unint64_t)rootItemID
{
  return 2;
}

+ (id)identifierForItem:(unint64_t)a3 name:(id)a4 parentID:(unint64_t)a5
{
  unint64_t v12 = a5;
  if (a3 == 2)
  {
    v5 = @"NSFileProviderRootContainerItemIdentifier";
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFF8F8];
    id v7 = a4;
    v8 = [v6 dataWithBytes:&v12 length:8];
    v9 = NSString;
    v10 = [v8 base64EncodedStringWithOptions:1];
    v5 = [v9 stringWithFormat:@"%@%@", v10, v7];
  }

  return v5;
}

@end