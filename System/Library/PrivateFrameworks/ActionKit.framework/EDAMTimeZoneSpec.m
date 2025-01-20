@interface EDAMTimeZoneSpec
+ (id)structFields;
+ (id)structName;
- (NSNumber)dstSavingsAdjustmentMillis;
- (NSNumber)nextEnterDaylightSavings;
- (NSNumber)nextLeaveDaylightSavings;
- (NSNumber)rawUTCOffsetMillis;
- (NSString)id;
- (void)setDstSavingsAdjustmentMillis:(id)a3;
- (void)setId:(id)a3;
- (void)setNextEnterDaylightSavings:(id)a3;
- (void)setNextLeaveDaylightSavings:(id)a3;
- (void)setRawUTCOffsetMillis:(id)a3;
@end

@implementation EDAMTimeZoneSpec

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1389;
  if (!structFields_structFields_1389)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"id"];
    v4 = +[FATField fieldWithIndex:2, 8, 1, @"rawUTCOffsetMillis", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"dstSavingsAdjustmentMillis"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"nextEnterDaylightSavings"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"nextLeaveDaylightSavings"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_1389;
    structFields_structFields_1389 = v8;

    v2 = (void *)structFields_structFields_1389;
  }
  return v2;
}

+ (id)structName
{
  return @"TimeZoneSpec";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextLeaveDaylightSavings, 0);
  objc_storeStrong((id *)&self->_nextEnterDaylightSavings, 0);
  objc_storeStrong((id *)&self->_dstSavingsAdjustmentMillis, 0);
  objc_storeStrong((id *)&self->_rawUTCOffsetMillis, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setNextLeaveDaylightSavings:(id)a3
{
}

- (NSNumber)nextLeaveDaylightSavings
{
  return self->_nextLeaveDaylightSavings;
}

- (void)setNextEnterDaylightSavings:(id)a3
{
}

- (NSNumber)nextEnterDaylightSavings
{
  return self->_nextEnterDaylightSavings;
}

- (void)setDstSavingsAdjustmentMillis:(id)a3
{
}

- (NSNumber)dstSavingsAdjustmentMillis
{
  return self->_dstSavingsAdjustmentMillis;
}

- (void)setRawUTCOffsetMillis:(id)a3
{
}

- (NSNumber)rawUTCOffsetMillis
{
  return self->_rawUTCOffsetMillis;
}

- (void)setId:(id)a3
{
}

- (NSString)id
{
  return self->_id;
}

@end