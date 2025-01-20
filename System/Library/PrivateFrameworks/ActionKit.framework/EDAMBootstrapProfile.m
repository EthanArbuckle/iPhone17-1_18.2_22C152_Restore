@interface EDAMBootstrapProfile
+ (id)structFields;
+ (id)structName;
- (EDAMBootstrapSettings)settings;
- (NSString)name;
- (void)setName:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation EDAMBootstrapProfile

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_332;
  if (!structFields_structFields_332)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"name"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"settings" structClass:objc_opt_class()];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_332;
    structFields_structFields_332 = v5;

    v2 = (void *)structFields_structFields_332;
  }
  return v2;
}

+ (id)structName
{
  return @"BootstrapProfile";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSettings:(id)a3
{
}

- (EDAMBootstrapSettings)settings
{
  return self->_settings;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end