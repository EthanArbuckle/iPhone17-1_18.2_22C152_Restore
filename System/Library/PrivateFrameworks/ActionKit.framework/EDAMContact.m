@interface EDAMContact
+ (id)structFields;
+ (id)structName;
- (NSData)messagingPermit;
- (NSNumber)messagingPermitExpires;
- (NSNumber)photoLastUpdated;
- (NSNumber)type;
- (NSString)id;
- (NSString)name;
- (NSString)photoUrl;
- (void)setId:(id)a3;
- (void)setMessagingPermit:(id)a3;
- (void)setMessagingPermitExpires:(id)a3;
- (void)setName:(id)a3;
- (void)setPhotoLastUpdated:(id)a3;
- (void)setPhotoUrl:(id)a3;
- (void)setType:(id)a3;
@end

@implementation EDAMContact

+ (id)structFields
{
  v13[7] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1144;
  if (!structFields_structFields_1144)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"name"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"id", v3 type optional name];
    v13[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"type"];
    v13[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"photoUrl"];
    v13[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"photoLastUpdated"];
    v13[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:16 optional:1 name:@"messagingPermit"];
    v13[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"messagingPermitExpires"];
    v13[6] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
    v11 = (void *)structFields_structFields_1144;
    structFields_structFields_1144 = v10;

    v2 = (void *)structFields_structFields_1144;
  }
  return v2;
}

+ (id)structName
{
  return @"Contact";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingPermitExpires, 0);
  objc_storeStrong((id *)&self->_messagingPermit, 0);
  objc_storeStrong((id *)&self->_photoLastUpdated, 0);
  objc_storeStrong((id *)&self->_photoUrl, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setMessagingPermitExpires:(id)a3
{
}

- (NSNumber)messagingPermitExpires
{
  return self->_messagingPermitExpires;
}

- (void)setMessagingPermit:(id)a3
{
}

- (NSData)messagingPermit
{
  return self->_messagingPermit;
}

- (void)setPhotoLastUpdated:(id)a3
{
}

- (NSNumber)photoLastUpdated
{
  return self->_photoLastUpdated;
}

- (void)setPhotoUrl:(id)a3
{
}

- (NSString)photoUrl
{
  return self->_photoUrl;
}

- (void)setType:(id)a3
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setId:(id)a3
{
}

- (NSString)id
{
  return self->_id;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end