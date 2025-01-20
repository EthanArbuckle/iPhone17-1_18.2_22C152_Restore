@interface ABSDynamicLoader
+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5;
@end

@implementation ABSDynamicLoader

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5
{
  id v6 = a3;
  char v7 = [v6 isEqual:@"System/Library/Assistant/Plugins/AddressBook.assistantBundle/AddressBook"];
  if (v7)
  {
    if (a5) {
      *a5 = objc_alloc_init(ABSBundle);
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Path %@ isn't something AddressBook.framework can load at the moment", v6 format];
  }

  return v7;
}

@end