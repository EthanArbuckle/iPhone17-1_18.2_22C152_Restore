@interface HDRespiratoryDaemonPlugin
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
- (void)handleDatabaseObliteration;
@end

@implementation HDRespiratoryDaemonPlugin

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F64230]) initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)taskServerClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F641F0];
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (void)handleDatabaseObliteration
{
  v4[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA40];
  v4[0] = *MEMORY[0x263F09F70];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  objc_msgSend(v2, "hk_deleteDomainsNamed:", v3);
}

@end