@interface EDAMTag
+ (id)structFields;
+ (id)structName;
- (NSNumber)updateSequenceNum;
- (NSString)guid;
- (NSString)name;
- (NSString)parentGuid;
- (void)setGuid:(id)a3;
- (void)setName:(id)a3;
- (void)setParentGuid:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
@end

@implementation EDAMTag

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1280_13074;
  if (!structFields_structFields_1280_13074)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"name"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"parentGuid"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"updateSequenceNum"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1280_13074;
    structFields_structFields_1280_13074 = v7;

    v2 = (void *)structFields_structFields_1280_13074;
  }
  return v2;
}

+ (id)structName
{
  return @"Tag";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_parentGuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setParentGuid:(id)a3
{
}

- (NSString)parentGuid
{
  return self->_parentGuid;
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