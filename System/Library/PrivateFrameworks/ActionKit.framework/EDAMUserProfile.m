@interface EDAMUserProfile
+ (id)structFields;
+ (id)structName;
- (EDAMBusinessUserAttributes)attributes;
- (NSNumber)id;
- (NSNumber)joined;
- (NSNumber)photoLastUpdated;
- (NSNumber)role;
- (NSString)email;
- (NSString)name;
- (NSString)photoUrl;
- (NSString)username;
- (void)setAttributes:(id)a3;
- (void)setEmail:(id)a3;
- (void)setId:(id)a3;
- (void)setJoined:(id)a3;
- (void)setName:(id)a3;
- (void)setPhotoLastUpdated:(id)a3;
- (void)setPhotoUrl:(id)a3;
- (void)setRole:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation EDAMUserProfile

+ (id)structFields
{
  v15[9] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2560;
  if (!structFields_structFields_2560)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"id"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"name", v3 type optional name];
    v15[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"email"];
    v15[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"username"];
    v15[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:12 optional:1 name:@"attributes" structClass:objc_opt_class()];
    v15[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"joined"];
    v15[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"photoLastUpdated"];
    v15[6] = v9;
    v10 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"photoUrl"];
    v15[7] = v10;
    v11 = +[FATField fieldWithIndex:9 type:8 optional:1 name:@"role"];
    v15[8] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:9];
    v13 = (void *)structFields_structFields_2560;
    structFields_structFields_2560 = v12;

    v2 = (void *)structFields_structFields_2560;
  }
  return v2;
}

+ (id)structName
{
  return @"UserProfile";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_photoUrl, 0);
  objc_storeStrong((id *)&self->_photoLastUpdated, 0);
  objc_storeStrong((id *)&self->_joined, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setRole:(id)a3
{
}

- (NSNumber)role
{
  return self->_role;
}

- (void)setPhotoUrl:(id)a3
{
}

- (NSString)photoUrl
{
  return self->_photoUrl;
}

- (void)setPhotoLastUpdated:(id)a3
{
}

- (NSNumber)photoLastUpdated
{
  return self->_photoLastUpdated;
}

- (void)setJoined:(id)a3
{
}

- (NSNumber)joined
{
  return self->_joined;
}

- (void)setAttributes:(id)a3
{
}

- (EDAMBusinessUserAttributes)attributes
{
  return self->_attributes;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setId:(id)a3
{
}

- (NSNumber)id
{
  return self->_id;
}

@end