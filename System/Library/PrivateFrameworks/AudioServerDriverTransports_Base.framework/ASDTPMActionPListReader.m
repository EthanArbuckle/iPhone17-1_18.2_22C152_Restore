@interface ASDTPMActionPListReader
- (ASDTPMActionPListReader)initWithConfig:(id)a3 forSequencer:(id)a4;
- (id)convert:(id)a3;
- (id)narrowPList:(id)a3;
@end

@implementation ASDTPMActionPListReader

- (ASDTPMActionPListReader)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  [v7 setObject:MEMORY[0x263EFFA88] forKey:@"IsPList"];
  v8 = [v7 objectForKey:@"BundleExt"];

  if (!v8) {
    [v7 setObject:@"plist" forKey:@"BundleExt"];
  }
  v11.receiver = self;
  v11.super_class = (Class)ASDTPMActionPListReader;
  v9 = [(ASDTPMActionFileReader *)&v11 initWithConfig:v7 forSequencer:v6];

  return v9;
}

- (id)narrowPList:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)convert:(id)a3
{
  id v9 = 0;
  v4 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = [(ASDTPMActionPListReader *)self narrowPList:v4];
  }
  else
  {
    v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(ASDTPMActionPListReader *)self convert:v7];
    }

    id v6 = 0;
  }

  return v6;
}

- (void)convert:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [a1 name];
  id v6 = [a2 description];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_2489BC000, a3, OS_LOG_TYPE_ERROR, "%@: Error converting plist data: %@", (uint8_t *)&v7, 0x16u);
}

@end