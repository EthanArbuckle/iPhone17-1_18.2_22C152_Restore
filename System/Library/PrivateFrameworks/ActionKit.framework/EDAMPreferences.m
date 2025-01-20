@interface EDAMPreferences
+ (id)structFields;
+ (id)structName;
- (NSDictionary)preferences;
- (NSNumber)updateSequenceNum;
- (void)setPreferences:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
@end

@implementation EDAMPreferences

+ (id)structFields
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_133;
  if (!structFields_structFields_133)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"updateSequenceNum"];
    v11[0] = v3;
    v4 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v5 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:0 type:15 optional:1 name:0 valueField:v5];
    v7 = +[FATField fieldWithIndex:2 type:13 optional:1 name:@"preferences" keyField:v4 valueField:v6];
    v11[1] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    v9 = (void *)structFields_structFields_133;
    structFields_structFields_133 = v8;

    v2 = (void *)structFields_structFields_133;
  }
  return v2;
}

+ (id)structName
{
  return @"Preferences";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
}

- (void)setPreferences:(id)a3
{
}

- (NSDictionary)preferences
{
  return self->_preferences;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

@end