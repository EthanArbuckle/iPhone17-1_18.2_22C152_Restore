@interface EDAMAccounting
+ (id)structFields;
+ (id)structName;
- (EDAMBackupPaymentInfo)backupPaymentInfo;
- (NSNumber)availablePoints;
- (NSNumber)businessId;
- (NSNumber)businessRole;
- (NSNumber)lastFailedCharge;
- (NSNumber)lastRequestedCharge;
- (NSNumber)lastSuccessfulCharge;
- (NSNumber)nextChargeDate;
- (NSNumber)nextPaymentDue;
- (NSNumber)premiumLockUntil;
- (NSNumber)premiumServiceStart;
- (NSNumber)premiumServiceStatus;
- (NSNumber)unitDiscount;
- (NSNumber)unitPrice;
- (NSNumber)updated;
- (NSNumber)uploadLimit;
- (NSNumber)uploadLimitEnd;
- (NSNumber)uploadLimitNextMonth;
- (NSString)businessName;
- (NSString)currency;
- (NSString)lastFailedChargeReason;
- (NSString)premiumCommerceService;
- (NSString)premiumOrderNumber;
- (NSString)premiumServiceSKU;
- (NSString)premiumSubscriptionNumber;
- (void)setAvailablePoints:(id)a3;
- (void)setBackupPaymentInfo:(id)a3;
- (void)setBusinessId:(id)a3;
- (void)setBusinessName:(id)a3;
- (void)setBusinessRole:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setLastFailedCharge:(id)a3;
- (void)setLastFailedChargeReason:(id)a3;
- (void)setLastRequestedCharge:(id)a3;
- (void)setLastSuccessfulCharge:(id)a3;
- (void)setNextChargeDate:(id)a3;
- (void)setNextPaymentDue:(id)a3;
- (void)setPremiumCommerceService:(id)a3;
- (void)setPremiumLockUntil:(id)a3;
- (void)setPremiumOrderNumber:(id)a3;
- (void)setPremiumServiceSKU:(id)a3;
- (void)setPremiumServiceStart:(id)a3;
- (void)setPremiumServiceStatus:(id)a3;
- (void)setPremiumSubscriptionNumber:(id)a3;
- (void)setUnitDiscount:(id)a3;
- (void)setUnitPrice:(id)a3;
- (void)setUpdated:(id)a3;
- (void)setUploadLimit:(id)a3;
- (void)setUploadLimitEnd:(id)a3;
- (void)setUploadLimitNextMonth:(id)a3;
@end

@implementation EDAMAccounting

+ (id)structFields
{
  v31[25] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_448;
  if (!structFields_structFields_448)
  {
    v30 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"uploadLimit"];
    v31[0] = v30;
    v29 = +[FATField fieldWithIndex:2 type:10 optional:1 name:@"uploadLimitEnd"];
    v31[1] = v29;
    v28 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"uploadLimitNextMonth"];
    v31[2] = v28;
    v27 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"premiumServiceStatus"];
    v31[3] = v27;
    v26 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"premiumOrderNumber"];
    v31[4] = v26;
    v25 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"premiumCommerceService"];
    v31[5] = v25;
    v24 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"premiumServiceStart"];
    v31[6] = v24;
    v23 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"premiumServiceSKU"];
    v31[7] = v23;
    v22 = +[FATField fieldWithIndex:9 type:10 optional:1 name:@"lastSuccessfulCharge"];
    v31[8] = v22;
    v21 = +[FATField fieldWithIndex:10 type:10 optional:1 name:@"lastFailedCharge"];
    v31[9] = v21;
    v20 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"lastFailedChargeReason"];
    v31[10] = v20;
    v19 = +[FATField fieldWithIndex:12 type:10 optional:1 name:@"nextPaymentDue"];
    v31[11] = v19;
    v18 = +[FATField fieldWithIndex:13 type:10 optional:1 name:@"premiumLockUntil"];
    v31[12] = v18;
    v17 = +[FATField fieldWithIndex:14 type:10 optional:1 name:@"updated"];
    v31[13] = v17;
    v16 = +[FATField fieldWithIndex:16 type:11 optional:1 name:@"premiumSubscriptionNumber"];
    v31[14] = v16;
    v3 = +[FATField fieldWithIndex:17 type:10 optional:1 name:@"lastRequestedCharge"];
    v31[15] = v3;
    v4 = +[FATField fieldWithIndex:18 type:11 optional:1 name:@"currency"];
    v31[16] = v4;
    v5 = +[FATField fieldWithIndex:19 type:8 optional:1 name:@"unitPrice"];
    v31[17] = v5;
    v6 = +[FATField fieldWithIndex:20 type:8 optional:1 name:@"businessId"];
    v31[18] = v6;
    v7 = +[FATField fieldWithIndex:21 type:11 optional:1 name:@"businessName"];
    v31[19] = v7;
    v8 = +[FATField fieldWithIndex:22 type:8 optional:1 name:@"businessRole"];
    v31[20] = v8;
    v9 = +[FATField fieldWithIndex:23 type:8 optional:1 name:@"unitDiscount"];
    v31[21] = v9;
    v10 = +[FATField fieldWithIndex:24 type:10 optional:1 name:@"nextChargeDate"];
    v31[22] = v10;
    v11 = +[FATField fieldWithIndex:25 type:8 optional:1 name:@"availablePoints"];
    v31[23] = v11;
    v12 = +[FATField fieldWithIndex:26 type:12 optional:1 name:@"backupPaymentInfo" structClass:objc_opt_class()];
    v31[24] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:25];
    v14 = (void *)structFields_structFields_448;
    structFields_structFields_448 = v13;

    v2 = (void *)structFields_structFields_448;
  }
  return v2;
}

+ (id)structName
{
  return @"Accounting";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupPaymentInfo, 0);
  objc_storeStrong((id *)&self->_availablePoints, 0);
  objc_storeStrong((id *)&self->_nextChargeDate, 0);
  objc_storeStrong((id *)&self->_unitDiscount, 0);
  objc_storeStrong((id *)&self->_businessRole, 0);
  objc_storeStrong((id *)&self->_businessName, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
  objc_storeStrong((id *)&self->_unitPrice, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_lastRequestedCharge, 0);
  objc_storeStrong((id *)&self->_premiumSubscriptionNumber, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_premiumLockUntil, 0);
  objc_storeStrong((id *)&self->_nextPaymentDue, 0);
  objc_storeStrong((id *)&self->_lastFailedChargeReason, 0);
  objc_storeStrong((id *)&self->_lastFailedCharge, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulCharge, 0);
  objc_storeStrong((id *)&self->_premiumServiceSKU, 0);
  objc_storeStrong((id *)&self->_premiumServiceStart, 0);
  objc_storeStrong((id *)&self->_premiumCommerceService, 0);
  objc_storeStrong((id *)&self->_premiumOrderNumber, 0);
  objc_storeStrong((id *)&self->_premiumServiceStatus, 0);
  objc_storeStrong((id *)&self->_uploadLimitNextMonth, 0);
  objc_storeStrong((id *)&self->_uploadLimitEnd, 0);
  objc_storeStrong((id *)&self->_uploadLimit, 0);
}

- (void)setBackupPaymentInfo:(id)a3
{
}

- (EDAMBackupPaymentInfo)backupPaymentInfo
{
  return self->_backupPaymentInfo;
}

- (void)setAvailablePoints:(id)a3
{
}

- (NSNumber)availablePoints
{
  return self->_availablePoints;
}

- (void)setNextChargeDate:(id)a3
{
}

- (NSNumber)nextChargeDate
{
  return self->_nextChargeDate;
}

- (void)setUnitDiscount:(id)a3
{
}

- (NSNumber)unitDiscount
{
  return self->_unitDiscount;
}

- (void)setBusinessRole:(id)a3
{
}

- (NSNumber)businessRole
{
  return self->_businessRole;
}

- (void)setBusinessName:(id)a3
{
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessId:(id)a3
{
}

- (NSNumber)businessId
{
  return self->_businessId;
}

- (void)setUnitPrice:(id)a3
{
}

- (NSNumber)unitPrice
{
  return self->_unitPrice;
}

- (void)setCurrency:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setLastRequestedCharge:(id)a3
{
}

- (NSNumber)lastRequestedCharge
{
  return self->_lastRequestedCharge;
}

- (void)setPremiumSubscriptionNumber:(id)a3
{
}

- (NSString)premiumSubscriptionNumber
{
  return self->_premiumSubscriptionNumber;
}

- (void)setUpdated:(id)a3
{
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setPremiumLockUntil:(id)a3
{
}

- (NSNumber)premiumLockUntil
{
  return self->_premiumLockUntil;
}

- (void)setNextPaymentDue:(id)a3
{
}

- (NSNumber)nextPaymentDue
{
  return self->_nextPaymentDue;
}

- (void)setLastFailedChargeReason:(id)a3
{
}

- (NSString)lastFailedChargeReason
{
  return self->_lastFailedChargeReason;
}

- (void)setLastFailedCharge:(id)a3
{
}

- (NSNumber)lastFailedCharge
{
  return self->_lastFailedCharge;
}

- (void)setLastSuccessfulCharge:(id)a3
{
}

- (NSNumber)lastSuccessfulCharge
{
  return self->_lastSuccessfulCharge;
}

- (void)setPremiumServiceSKU:(id)a3
{
}

- (NSString)premiumServiceSKU
{
  return self->_premiumServiceSKU;
}

- (void)setPremiumServiceStart:(id)a3
{
}

- (NSNumber)premiumServiceStart
{
  return self->_premiumServiceStart;
}

- (void)setPremiumCommerceService:(id)a3
{
}

- (NSString)premiumCommerceService
{
  return self->_premiumCommerceService;
}

- (void)setPremiumOrderNumber:(id)a3
{
}

- (NSString)premiumOrderNumber
{
  return self->_premiumOrderNumber;
}

- (void)setPremiumServiceStatus:(id)a3
{
}

- (NSNumber)premiumServiceStatus
{
  return self->_premiumServiceStatus;
}

- (void)setUploadLimitNextMonth:(id)a3
{
}

- (NSNumber)uploadLimitNextMonth
{
  return self->_uploadLimitNextMonth;
}

- (void)setUploadLimitEnd:(id)a3
{
}

- (NSNumber)uploadLimitEnd
{
  return self->_uploadLimitEnd;
}

- (void)setUploadLimit:(id)a3
{
}

- (NSNumber)uploadLimit
{
  return self->_uploadLimit;
}

@end