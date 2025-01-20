@interface EDAMIdentity
+ (id)structFields;
+ (id)structName;
- (EDAMContact)contact;
- (NSNumber)blocked;
- (NSNumber)deactivated;
- (NSNumber)eventId;
- (NSNumber)id;
- (NSNumber)sameBusiness;
- (NSNumber)userConnected;
- (NSNumber)userId;
- (void)setBlocked:(id)a3;
- (void)setContact:(id)a3;
- (void)setDeactivated:(id)a3;
- (void)setEventId:(id)a3;
- (void)setId:(id)a3;
- (void)setSameBusiness:(id)a3;
- (void)setUserConnected:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation EDAMIdentity

+ (id)structFields
{
  v14[8] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1178;
  if (!structFields_structFields_1178)
  {
    v3 = +[FATField fieldWithIndex:1 type:10 optional:0 name:@"id"];
    v14[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"contact" structClass:objc_opt_class()];
    v14[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"userId"];
    v14[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"deactivated"];
    v14[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"sameBusiness"];
    v14[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"blocked"];
    v14[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"userConnected"];
    v14[6] = v9;
    v10 = +[FATField fieldWithIndex:8 type:10 optional:1 name:@"eventId"];
    v14[7] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:8];
    v12 = (void *)structFields_structFields_1178;
    structFields_structFields_1178 = v11;

    v2 = (void *)structFields_structFields_1178;
  }
  return v2;
}

+ (id)structName
{
  return @"Identity";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_userConnected, 0);
  objc_storeStrong((id *)&self->_blocked, 0);
  objc_storeStrong((id *)&self->_sameBusiness, 0);
  objc_storeStrong((id *)&self->_deactivated, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setEventId:(id)a3
{
}

- (NSNumber)eventId
{
  return self->_eventId;
}

- (void)setUserConnected:(id)a3
{
}

- (NSNumber)userConnected
{
  return self->_userConnected;
}

- (void)setBlocked:(id)a3
{
}

- (NSNumber)blocked
{
  return self->_blocked;
}

- (void)setSameBusiness:(id)a3
{
}

- (NSNumber)sameBusiness
{
  return self->_sameBusiness;
}

- (void)setDeactivated:(id)a3
{
}

- (NSNumber)deactivated
{
  return self->_deactivated;
}

- (void)setUserId:(id)a3
{
}

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setContact:(id)a3
{
}

- (EDAMContact)contact
{
  return self->_contact;
}

- (void)setId:(id)a3
{
}

- (NSNumber)id
{
  return self->_id;
}

@end