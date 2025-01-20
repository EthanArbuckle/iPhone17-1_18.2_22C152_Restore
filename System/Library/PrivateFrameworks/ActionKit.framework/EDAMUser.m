@interface EDAMUser
+ (id)structFields;
+ (id)structName;
- (EDAMAccountLimits)accountLimits;
- (EDAMAccounting)accounting;
- (EDAMBusinessUserInfo)businessUserInfo;
- (EDAMPremiumInfo)premiumInfo;
- (EDAMPricingModel)pricingModel;
- (EDAMSubscriptionInfo)subscriptionInfo;
- (EDAMUserAttributes)attributes;
- (NSNumber)active;
- (NSNumber)created;
- (NSNumber)deleted;
- (NSNumber)id;
- (NSNumber)photoLastUpdated;
- (NSNumber)privilege;
- (NSNumber)serviceLevel;
- (NSNumber)updated;
- (NSString)email;
- (NSString)name;
- (NSString)photoUrl;
- (NSString)shardId;
- (NSString)timezone;
- (NSString)username;
- (void)setAccountLimits:(id)a3;
- (void)setAccounting:(id)a3;
- (void)setActive:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setBusinessUserInfo:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDeleted:(id)a3;
- (void)setEmail:(id)a3;
- (void)setId:(id)a3;
- (void)setName:(id)a3;
- (void)setPhotoLastUpdated:(id)a3;
- (void)setPhotoUrl:(id)a3;
- (void)setPremiumInfo:(id)a3;
- (void)setPricingModel:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setServiceLevel:(id)a3;
- (void)setShardId:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
- (void)setTimezone:(id)a3;
- (void)setUpdated:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation EDAMUser

+ (id)structFields
{
  v27[21] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_969;
  if (!structFields_structFields_969)
  {
    v26 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"id"];
    v27[0] = v26;
    v25 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"username"];
    v27[1] = v25;
    v24 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"email"];
    v27[2] = v24;
    v23 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"name"];
    v27[3] = v23;
    v22 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"timezone"];
    v27[4] = v22;
    v21 = +[FATField fieldWithIndex:7 type:8 optional:1 name:@"privilege"];
    v27[5] = v21;
    v20 = +[FATField fieldWithIndex:21 type:8 optional:1 name:@"serviceLevel"];
    v27[6] = v20;
    v19 = +[FATField fieldWithIndex:9 type:10 optional:1 name:@"created"];
    v27[7] = v19;
    v18 = +[FATField fieldWithIndex:10 type:10 optional:1 name:@"updated"];
    v27[8] = v18;
    v17 = +[FATField fieldWithIndex:11 type:10 optional:1 name:@"deleted"];
    v27[9] = v17;
    v16 = +[FATField fieldWithIndex:13 type:2 optional:1 name:@"active"];
    v27[10] = v16;
    v3 = +[FATField fieldWithIndex:14 type:11 optional:1 name:@"shardId"];
    v27[11] = v3;
    v4 = +[FATField fieldWithIndex:15 type:12 optional:1 name:@"attributes" structClass:objc_opt_class()];
    v27[12] = v4;
    v5 = +[FATField fieldWithIndex:16 type:12 optional:1 name:@"accounting" structClass:objc_opt_class()];
    v27[13] = v5;
    v6 = +[FATField fieldWithIndex:17 type:12 optional:1 name:@"premiumInfo" structClass:objc_opt_class()];
    v27[14] = v6;
    v7 = +[FATField fieldWithIndex:18 type:12 optional:1 name:@"businessUserInfo" structClass:objc_opt_class()];
    v27[15] = v7;
    v8 = +[FATField fieldWithIndex:19 type:11 optional:1 name:@"photoUrl"];
    v27[16] = v8;
    v9 = +[FATField fieldWithIndex:20 type:10 optional:1 name:@"photoLastUpdated"];
    v27[17] = v9;
    v10 = +[FATField fieldWithIndex:22 type:12 optional:1 name:@"accountLimits" structClass:objc_opt_class()];
    v27[18] = v10;
    v11 = +[FATField fieldWithIndex:23 type:12 optional:1 name:@"subscriptionInfo" structClass:objc_opt_class()];
    v27[19] = v11;
    v12 = +[FATField fieldWithIndex:24 type:12 optional:1 name:@"pricingModel" structClass:objc_opt_class()];
    v27[20] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:21];
    v14 = (void *)structFields_structFields_969;
    structFields_structFields_969 = v13;

    v2 = (void *)structFields_structFields_969;
  }
  return v2;
}

+ (id)structName
{
  return @"User";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pricingModel, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_accountLimits, 0);
  objc_storeStrong((id *)&self->_photoLastUpdated, 0);
  objc_storeStrong((id *)&self->_photoUrl, 0);
  objc_storeStrong((id *)&self->_businessUserInfo, 0);
  objc_storeStrong((id *)&self->_premiumInfo, 0);
  objc_storeStrong((id *)&self->_accounting, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_serviceLevel, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setPricingModel:(id)a3
{
}

- (EDAMPricingModel)pricingModel
{
  return self->_pricingModel;
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (EDAMSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setAccountLimits:(id)a3
{
}

- (EDAMAccountLimits)accountLimits
{
  return self->_accountLimits;
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

- (void)setBusinessUserInfo:(id)a3
{
}

- (EDAMBusinessUserInfo)businessUserInfo
{
  return self->_businessUserInfo;
}

- (void)setPremiumInfo:(id)a3
{
}

- (EDAMPremiumInfo)premiumInfo
{
  return self->_premiumInfo;
}

- (void)setAccounting:(id)a3
{
}

- (EDAMAccounting)accounting
{
  return self->_accounting;
}

- (void)setAttributes:(id)a3
{
}

- (EDAMUserAttributes)attributes
{
  return self->_attributes;
}

- (void)setShardId:(id)a3
{
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setActive:(id)a3
{
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setDeleted:(id)a3
{
}

- (NSNumber)deleted
{
  return self->_deleted;
}

- (void)setUpdated:(id)a3
{
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setCreated:(id)a3
{
}

- (NSNumber)created
{
  return self->_created;
}

- (void)setServiceLevel:(id)a3
{
}

- (NSNumber)serviceLevel
{
  return self->_serviceLevel;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setTimezone:(id)a3
{
}

- (NSString)timezone
{
  return self->_timezone;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setId:(id)a3
{
}

- (NSNumber)id
{
  return self->_id;
}

@end