@interface EDAMPremiumInfo
+ (id)structFields;
+ (id)structName;
- (NSNumber)canPurchaseUploadAllowance;
- (NSNumber)currentTime;
- (NSNumber)premium;
- (NSNumber)premiumCancellationPending;
- (NSNumber)premiumExpirationDate;
- (NSNumber)premiumExtendable;
- (NSNumber)premiumPending;
- (NSNumber)premiumRecurring;
- (NSNumber)premiumUpgradable;
- (NSNumber)sponsoredGroupRole;
- (NSString)sponsoredGroupName;
- (void)setCanPurchaseUploadAllowance:(id)a3;
- (void)setCurrentTime:(id)a3;
- (void)setPremium:(id)a3;
- (void)setPremiumCancellationPending:(id)a3;
- (void)setPremiumExpirationDate:(id)a3;
- (void)setPremiumExtendable:(id)a3;
- (void)setPremiumPending:(id)a3;
- (void)setPremiumRecurring:(id)a3;
- (void)setPremiumUpgradable:(id)a3;
- (void)setSponsoredGroupName:(id)a3;
- (void)setSponsoredGroupRole:(id)a3;
@end

@implementation EDAMPremiumInfo

+ (id)structFields
{
  v17[11] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_790_12938;
  if (!structFields_structFields_790_12938)
  {
    v16 = +[FATField fieldWithIndex:1 type:10 optional:0 name:@"currentTime"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:2 type:2 optional:0 name:@"premium"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"premiumRecurring"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"premiumExpirationDate"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"premiumExtendable"];
    v17[4] = v5;
    v6 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"premiumPending"];
    v17[5] = v6;
    v7 = +[FATField fieldWithIndex:7 type:2 optional:0 name:@"premiumCancellationPending"];
    v17[6] = v7;
    v8 = +[FATField fieldWithIndex:8 type:2 optional:0 name:@"canPurchaseUploadAllowance"];
    v17[7] = v8;
    v9 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"sponsoredGroupName"];
    v17[8] = v9;
    v10 = +[FATField fieldWithIndex:10 type:8 optional:1 name:@"sponsoredGroupRole"];
    v17[9] = v10;
    v11 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"premiumUpgradable"];
    v17[10] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
    v13 = (void *)structFields_structFields_790_12938;
    structFields_structFields_790_12938 = v12;

    v2 = (void *)structFields_structFields_790_12938;
  }
  return v2;
}

+ (id)structName
{
  return @"PremiumInfo";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_premiumUpgradable, 0);
  objc_storeStrong((id *)&self->_sponsoredGroupRole, 0);
  objc_storeStrong((id *)&self->_sponsoredGroupName, 0);
  objc_storeStrong((id *)&self->_canPurchaseUploadAllowance, 0);
  objc_storeStrong((id *)&self->_premiumCancellationPending, 0);
  objc_storeStrong((id *)&self->_premiumPending, 0);
  objc_storeStrong((id *)&self->_premiumExtendable, 0);
  objc_storeStrong((id *)&self->_premiumExpirationDate, 0);
  objc_storeStrong((id *)&self->_premiumRecurring, 0);
  objc_storeStrong((id *)&self->_premium, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

- (void)setPremiumUpgradable:(id)a3
{
}

- (NSNumber)premiumUpgradable
{
  return self->_premiumUpgradable;
}

- (void)setSponsoredGroupRole:(id)a3
{
}

- (NSNumber)sponsoredGroupRole
{
  return self->_sponsoredGroupRole;
}

- (void)setSponsoredGroupName:(id)a3
{
}

- (NSString)sponsoredGroupName
{
  return self->_sponsoredGroupName;
}

- (void)setCanPurchaseUploadAllowance:(id)a3
{
}

- (NSNumber)canPurchaseUploadAllowance
{
  return self->_canPurchaseUploadAllowance;
}

- (void)setPremiumCancellationPending:(id)a3
{
}

- (NSNumber)premiumCancellationPending
{
  return self->_premiumCancellationPending;
}

- (void)setPremiumPending:(id)a3
{
}

- (NSNumber)premiumPending
{
  return self->_premiumPending;
}

- (void)setPremiumExtendable:(id)a3
{
}

- (NSNumber)premiumExtendable
{
  return self->_premiumExtendable;
}

- (void)setPremiumExpirationDate:(id)a3
{
}

- (NSNumber)premiumExpirationDate
{
  return self->_premiumExpirationDate;
}

- (void)setPremiumRecurring:(id)a3
{
}

- (NSNumber)premiumRecurring
{
  return self->_premiumRecurring;
}

- (void)setPremium:(id)a3
{
}

- (NSNumber)premium
{
  return self->_premium;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

@end