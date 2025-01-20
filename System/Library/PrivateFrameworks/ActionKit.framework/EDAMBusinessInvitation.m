@interface EDAMBusinessInvitation
+ (id)structFields;
+ (id)structName;
- (NSNumber)businessId;
- (NSNumber)created;
- (NSNumber)fromWorkChat;
- (NSNumber)requesterId;
- (NSNumber)role;
- (NSNumber)status;
- (NSString)email;
- (void)setBusinessId:(id)a3;
- (void)setCreated:(id)a3;
- (void)setEmail:(id)a3;
- (void)setFromWorkChat:(id)a3;
- (void)setRequesterId:(id)a3;
- (void)setRole:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation EDAMBusinessInvitation

+ (id)structFields
{
  v13[7] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2727;
  if (!structFields_structFields_2727)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"businessId"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"email", v3 type optional name];
    v13[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"role"];
    v13[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"status"];
    v13[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"requesterId"];
    v13[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"fromWorkChat"];
    v13[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"created"];
    v13[6] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
    v11 = (void *)structFields_structFields_2727;
    structFields_structFields_2727 = v10;

    v2 = (void *)structFields_structFields_2727;
  }
  return v2;
}

+ (id)structName
{
  return @"BusinessInvitation";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_fromWorkChat, 0);
  objc_storeStrong((id *)&self->_requesterId, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

- (void)setCreated:(id)a3
{
}

- (NSNumber)created
{
  return self->_created;
}

- (void)setFromWorkChat:(id)a3
{
}

- (NSNumber)fromWorkChat
{
  return self->_fromWorkChat;
}

- (void)setRequesterId:(id)a3
{
}

- (NSNumber)requesterId
{
  return self->_requesterId;
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setRole:(id)a3
{
}

- (NSNumber)role
{
  return self->_role;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setBusinessId:(id)a3
{
}

- (NSNumber)businessId
{
  return self->_businessId;
}

@end