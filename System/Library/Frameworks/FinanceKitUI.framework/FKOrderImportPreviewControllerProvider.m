@interface FKOrderImportPreviewControllerProvider
+ (BOOL)canProvidePreviewControllerForMessages;
+ (id)makeViewControllerWithOrderData:(id)a3 completion:(id)a4 error:(id *)a5;
+ (id)makeViewControllerWithOrderURL:(id)a3 completion:(id)a4 error:(id *)a5;
@end

@implementation FKOrderImportPreviewControllerProvider

+ (id)makeViewControllerWithOrderURL:(id)a3 completion:(id)a4 error:(id *)a5
{
  return +[OrderImportControllerProvider makeViewControllerWithBundleURL:a3 competion:a4 error:a5];
}

+ (id)makeViewControllerWithOrderData:(id)a3 completion:(id)a4 error:(id *)a5
{
  return +[OrderImportControllerProvider makeViewControllerWithOrderData:a3 competion:a4 error:a5];
}

+ (BOOL)canProvidePreviewControllerForMessages
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return v3 != 1 && v3 != 6;
}

@end