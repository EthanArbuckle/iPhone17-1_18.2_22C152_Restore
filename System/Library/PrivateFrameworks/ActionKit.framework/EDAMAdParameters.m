@interface EDAMAdParameters
+ (id)structFields;
+ (id)structName;
- (NSArray)impressions;
- (NSDictionary)clientProperties;
- (NSNumber)supportHtml;
- (NSString)clientLanguage;
- (void)setClientLanguage:(id)a3;
- (void)setClientProperties:(id)a3;
- (void)setImpressions:(id)a3;
- (void)setSupportHtml:(id)a3;
@end

@implementation EDAMAdParameters

+ (id)structFields
{
  v13[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_921;
  if (!structFields_structFields_921)
  {
    v3 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"clientLanguage"];
    v13[0] = v3;
    v4 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v5 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"impressions" valueField:v4];
    v13[1] = v5;
    v6 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"supportHtml"];
    v13[2] = v6;
    v7 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v9 = +[FATField fieldWithIndex:6 type:13 optional:1 name:@"clientProperties" keyField:v7 valueField:v8];
    v13[3] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
    v11 = (void *)structFields_structFields_921;
    structFields_structFields_921 = v10;

    v2 = (void *)structFields_structFields_921;
  }
  return v2;
}

+ (id)structName
{
  return @"AdParameters";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProperties, 0);
  objc_storeStrong((id *)&self->_supportHtml, 0);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_clientLanguage, 0);
}

- (void)setClientProperties:(id)a3
{
}

- (NSDictionary)clientProperties
{
  return self->_clientProperties;
}

- (void)setSupportHtml:(id)a3
{
}

- (NSNumber)supportHtml
{
  return self->_supportHtml;
}

- (void)setImpressions:(id)a3
{
}

- (NSArray)impressions
{
  return self->_impressions;
}

- (void)setClientLanguage:(id)a3
{
}

- (NSString)clientLanguage
{
  return self->_clientLanguage;
}

@end