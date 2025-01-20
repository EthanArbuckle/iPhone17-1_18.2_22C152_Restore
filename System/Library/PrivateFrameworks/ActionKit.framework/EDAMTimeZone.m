@interface EDAMTimeZone
+ (id)structFields;
+ (id)structName;
- (NSNumber)dstSavingsAdjustmentMillis;
- (NSNumber)nextEnterDaylightSavings;
- (NSNumber)nextLeaveDaylightSavings;
- (NSNumber)rawUTCOffsetMillis;
- (NSString)displayName;
- (NSString)id;
- (void)setDisplayName:(id)a3;
- (void)setDstSavingsAdjustmentMillis:(id)a3;
- (void)setId:(id)a3;
- (void)setNextEnterDaylightSavings:(id)a3;
- (void)setNextLeaveDaylightSavings:(id)a3;
- (void)setRawUTCOffsetMillis:(id)a3;
@end

@implementation EDAMTimeZone

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1332;
  if (!structFields_structFields_1332)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"id"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"displayName"];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"rawUTCOffsetMillis"];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"dstSavingsAdjustmentMillis"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"nextEnterDaylightSavings"];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"nextLeaveDaylightSavings"];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_1332;
    structFields_structFields_1332 = v9;

    v2 = (void *)structFields_structFields_1332;
  }
  return v2;
}

+ (id)structName
{
  return @"TimeZone";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextLeaveDaylightSavings, 0);
  objc_storeStrong((id *)&self->_nextEnterDaylightSavings, 0);
  objc_storeStrong((id *)&self->_dstSavingsAdjustmentMillis, 0);
  objc_storeStrong((id *)&self->_rawUTCOffsetMillis, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
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

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setId:(id)a3
{
}

- (NSString)id
{
  return self->_id;
}

@end