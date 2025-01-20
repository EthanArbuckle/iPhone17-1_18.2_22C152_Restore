@interface EDAMSavedSearch
+ (id)structFields;
+ (id)structName;
- (EDAMSavedSearchScope)scope;
- (NSNumber)format;
- (NSNumber)updateSequenceNum;
- (NSString)guid;
- (NSString)name;
- (NSString)query;
- (void)setFormat:(id)a3;
- (void)setGuid:(id)a3;
- (void)setName:(id)a3;
- (void)setQuery:(id)a3;
- (void)setScope:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
@end

@implementation EDAMSavedSearch

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1981;
  if (!structFields_structFields_1981)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"name"];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"query"];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"format"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"updateSequenceNum"];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:12 optional:1 name:@"scope" structClass:objc_opt_class()];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_1981;
    structFields_structFields_1981 = v9;

    v2 = (void *)structFields_structFields_1981;
  }
  return v2;
}

+ (id)structName
{
  return @"SavedSearch";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setScope:(id)a3
{
}

- (EDAMSavedSearchScope)scope
{
  return self->_scope;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setFormat:(id)a3
{
}

- (NSNumber)format
{
  return self->_format;
}

- (void)setQuery:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

@end