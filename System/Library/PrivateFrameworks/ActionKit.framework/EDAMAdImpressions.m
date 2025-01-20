@interface EDAMAdImpressions
+ (id)structFields;
+ (id)structName;
- (NSNumber)adId;
- (NSNumber)impressionCount;
- (NSNumber)impressionTime;
- (void)setAdId:(id)a3;
- (void)setImpressionCount:(id)a3;
- (void)setImpressionTime:(id)a3;
@end

@implementation EDAMAdImpressions

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_888;
  if (!structFields_structFields_888)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"adId"];
    v4 = +[FATField fieldWithIndex:2, 8, 0, @"impressionCount", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"impressionTime"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_888;
    structFields_structFields_888 = v6;

    v2 = (void *)structFields_structFields_888;
  }
  return v2;
}

+ (id)structName
{
  return @"AdImpressions";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionTime, 0);
  objc_storeStrong((id *)&self->_impressionCount, 0);
  objc_storeStrong((id *)&self->_adId, 0);
}

- (void)setImpressionTime:(id)a3
{
}

- (NSNumber)impressionTime
{
  return self->_impressionTime;
}

- (void)setImpressionCount:(id)a3
{
}

- (NSNumber)impressionCount
{
  return self->_impressionCount;
}

- (void)setAdId:(id)a3
{
}

- (NSNumber)adId
{
  return self->_adId;
}

@end