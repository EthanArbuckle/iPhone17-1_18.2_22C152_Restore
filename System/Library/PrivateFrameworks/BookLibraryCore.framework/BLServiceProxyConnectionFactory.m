@interface BLServiceProxyConnectionFactory
+ (id)connectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
@end

@implementation BLServiceProxyConnectionFactory

+ (id)connectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  v5 = (objc_class *)MEMORY[0x263F08D68];
  id v6 = a3;
  id v7 = [v5 alloc];
  v9 = objc_msgSend_initWithMachServiceName_options_(v7, v8, (uint64_t)v6, a4);

  return v9;
}

@end