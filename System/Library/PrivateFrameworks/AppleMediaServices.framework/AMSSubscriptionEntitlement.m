@interface AMSSubscriptionEntitlement
- (BOOL)autoRenewEnabled;
- (BOOL)familySubscription;
- (BOOL)freeTrialEligible;
- (BOOL)inFreePeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)purchaser;
- (NSDate)expiration;
- (NSDate)renewDate;
- (NSDate)startDate;
- (NSDate)studentExpirationDate;
- (NSNumber)chargeStoreFrontID;
- (NSNumber)entitlementSourceAdamId;
- (NSNumber)familyRank;
- (NSNumber)featureAccessTypeId;
- (NSNumber)freeTrialPeriodId;
- (NSNumber)inAppAdamId;
- (NSNumber)promoScenarioId;
- (NSNumber)subscriptionBundleId;
- (NSString)carrierOperatorName;
- (NSString)carrierPhoneNumber;
- (NSString)carrierSessionId;
- (NSString)entitlementOriginType;
- (NSString)externalSubscriptionID;
- (NSString)inAppVersion;
- (NSString)offerId;
- (NSString)poolType;
- (NSString)vendorAdHocOfferId;
- (NSString)vendorId;
- (double)initialPurchaseTimestamp;
- (double)serviceBeginsTimestamp;
- (id)exportObject;
- (int64_t)carrierErrorCode;
- (unint64_t)period;
- (unsigned)carrierStatus;
- (unsigned)source;
- (unsigned)status;
- (void)setAutoRenewEnabled:(BOOL)a3;
- (void)setCarrierErrorCode:(int64_t)a3;
- (void)setCarrierOperatorName:(id)a3;
- (void)setCarrierPhoneNumber:(id)a3;
- (void)setCarrierSessionId:(id)a3;
- (void)setCarrierStatus:(unsigned int)a3;
- (void)setChargeStoreFrontID:(id)a3;
- (void)setEntitlementOriginType:(id)a3;
- (void)setEntitlementSourceAdamId:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setExternalSubscriptionID:(id)a3;
- (void)setFamilyRank:(id)a3;
- (void)setFamilySubscription:(BOOL)a3;
- (void)setFeatureAccessTypeId:(id)a3;
- (void)setFreeTrialEligible:(BOOL)a3;
- (void)setFreeTrialPeriodId:(id)a3;
- (void)setInAppAdamId:(id)a3;
- (void)setInAppVersion:(id)a3;
- (void)setInFreePeriod:(BOOL)a3;
- (void)setInitialPurchaseTimestamp:(double)a3;
- (void)setOfferId:(id)a3;
- (void)setPeriod:(unint64_t)a3;
- (void)setPoolType:(id)a3;
- (void)setPromoScenarioId:(id)a3;
- (void)setPurchaser:(BOOL)a3;
- (void)setRenewDate:(id)a3;
- (void)setServiceBeginsTimestamp:(double)a3;
- (void)setSource:(unsigned int)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setStudentExpirationDate:(id)a3;
- (void)setSubscriptionBundleId:(id)a3;
- (void)setVendorAdHocOfferId:(id)a3;
- (void)setVendorId:(id)a3;
@end

@implementation AMSSubscriptionEntitlement

- (id)exportObject
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSSubscriptionEntitlement autoRenewEnabled](self, "autoRenewEnabled"));
  [v3 setObject:v4 forKeyedSubscript:@"autoRenewEnabled"];

  v5 = [(AMSSubscriptionEntitlement *)self chargeStoreFrontID];
  [v3 setObject:v5 forKeyedSubscript:@"chargeStoreFrontID"];

  v6 = (void *)MEMORY[0x1E4F28ED0];
  v7 = [(AMSSubscriptionEntitlement *)self expiration];
  [v7 timeIntervalSince1970];
  v8 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"expiration"];

  v9 = [(AMSSubscriptionEntitlement *)self entitlementOriginType];
  [v3 setObject:v9 forKeyedSubscript:@"entitlementOriginType"];

  uint64_t v10 = [(AMSSubscriptionEntitlement *)self entitlementSourceAdamId];
  v11 = (void *)v10;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = &unk_1EDD01768;
  }
  [v3 setObject:v12 forKeyedSubscript:@"entitlementSourceAdamId"];

  v13 = [(AMSSubscriptionEntitlement *)self externalSubscriptionID];
  [v3 setObject:v13 forKeyedSubscript:@"externalSubscriptionID"];

  v14 = [(AMSSubscriptionEntitlement *)self familyRank];
  [v3 setObject:v14 forKeyedSubscript:@"familyRank"];

  v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSSubscriptionEntitlement familySubscription](self, "familySubscription"));
  [v3 setObject:v15 forKeyedSubscript:@"familySubscription"];

  uint64_t v16 = [(AMSSubscriptionEntitlement *)self featureAccessTypeId];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = &unk_1EDD01768;
  }
  [v3 setObject:v18 forKeyedSubscript:@"featureAccessTypeId"];

  v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSSubscriptionEntitlement freeTrialEligible](self, "freeTrialEligible"));
  [v3 setObject:v19 forKeyedSubscript:@"freeTrialEligible"];

  uint64_t v20 = [(AMSSubscriptionEntitlement *)self freeTrialPeriodId];
  v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = &unk_1EDD01768;
  }
  [v3 setObject:v22 forKeyedSubscript:@"freeTrialPeriodId"];

  uint64_t v23 = [(AMSSubscriptionEntitlement *)self inAppAdamId];
  v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = &unk_1EDD01768;
  }
  [v3 setObject:v25 forKeyedSubscript:@"inAppAdamId"];

  uint64_t v26 = [(AMSSubscriptionEntitlement *)self inAppVersion];
  v27 = (void *)v26;
  if (v26) {
    v28 = (void *)v26;
  }
  else {
    v28 = &unk_1EDD01768;
  }
  [v3 setObject:v28 forKeyedSubscript:@"inAppVersion"];

  v29 = (void *)MEMORY[0x1E4F28ED0];
  [(AMSSubscriptionEntitlement *)self initialPurchaseTimestamp];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  [v3 setObject:v30 forKeyedSubscript:@"initialPurchaseTimestamp"];

  uint64_t v31 = [(AMSSubscriptionEntitlement *)self offerId];
  v32 = (void *)v31;
  if (v31) {
    v33 = (__CFString *)v31;
  }
  else {
    v33 = &stru_1EDCA7308;
  }
  [v3 setObject:v33 forKeyedSubscript:@"offerId"];

  uint64_t v34 = [(AMSSubscriptionEntitlement *)self poolType];
  v35 = (void *)v34;
  if (v34) {
    v36 = (__CFString *)v34;
  }
  else {
    v36 = &stru_1EDCA7308;
  }
  [v3 setObject:v36 forKeyedSubscript:@"poolType"];

  uint64_t v37 = [(AMSSubscriptionEntitlement *)self promoScenarioId];
  v38 = (void *)v37;
  if (v37) {
    v39 = (void *)v37;
  }
  else {
    v39 = &unk_1EDD01768;
  }
  [v3 setObject:v39 forKeyedSubscript:@"promoScenarioId"];

  v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSSubscriptionEntitlement inFreePeriod](self, "inFreePeriod"));
  [v3 setObject:v40 forKeyedSubscript:@"inFreePeriod"];

  char v41 = [(AMSSubscriptionEntitlement *)self period];
  uint64_t v42 = MEMORY[0x1E4F1CC38];
  uint64_t v43 = MEMORY[0x1E4F1CC28];
  if (v41) {
    uint64_t v44 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v44 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v44 forKeyedSubscript:@"inTrialPeriod"];
  if (([(AMSSubscriptionEntitlement *)self period] & 2) != 0) {
    uint64_t v45 = v42;
  }
  else {
    uint64_t v45 = v43;
  }
  [v3 setObject:v45 forKeyedSubscript:@"inOfferPeriod"];
  if (([(AMSSubscriptionEntitlement *)self period] & 4) != 0) {
    uint64_t v46 = v42;
  }
  else {
    uint64_t v46 = v43;
  }
  [v3 setObject:v46 forKeyedSubscript:@"inGracePeriod"];
  v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSSubscriptionEntitlement purchaser](self, "purchaser"));
  [v3 setObject:v47 forKeyedSubscript:@"purchaser"];

  v48 = (void *)MEMORY[0x1E4F28ED0];
  v49 = [(AMSSubscriptionEntitlement *)self renewDate];
  [v49 timeIntervalSince1970];
  v50 = objc_msgSend(v48, "numberWithDouble:");
  [v3 setObject:v50 forKeyedSubscript:@"renewDate"];

  v51 = (void *)MEMORY[0x1E4F28ED0];
  [(AMSSubscriptionEntitlement *)self serviceBeginsTimestamp];
  v52 = objc_msgSend(v51, "numberWithDouble:");
  [v3 setObject:v52 forKeyedSubscript:@"serviceBeginsTimestamp"];

  v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[AMSSubscriptionEntitlement source](self, "source"));
  [v3 setObject:v53 forKeyedSubscript:@"source"];

  v54 = [(AMSSubscriptionEntitlement *)self startDate];
  [v3 setObject:v54 forKeyedSubscript:@"startDate"];

  v55 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[AMSSubscriptionEntitlement status](self, "status"));
  [v3 setObject:v55 forKeyedSubscript:@"status"];

  v56 = (void *)MEMORY[0x1E4F28ED0];
  v57 = [(AMSSubscriptionEntitlement *)self studentExpirationDate];
  [v57 timeIntervalSince1970];
  v58 = objc_msgSend(v56, "numberWithDouble:");
  [v3 setObject:v58 forKeyedSubscript:@"studentExpirationDate"];

  uint64_t v59 = [(AMSSubscriptionEntitlement *)self subscriptionBundleId];
  v60 = (void *)v59;
  if (v59) {
    v61 = (void *)v59;
  }
  else {
    v61 = &unk_1EDD01768;
  }
  [v3 setObject:v61 forKeyedSubscript:@"subscriptionBundleId"];

  uint64_t v62 = [(AMSSubscriptionEntitlement *)self vendorAdHocOfferId];
  v63 = (void *)v62;
  if (v62) {
    v64 = (__CFString *)v62;
  }
  else {
    v64 = &stru_1EDCA7308;
  }
  [v3 setObject:v64 forKeyedSubscript:@"vendorAdHocOfferId"];

  uint64_t v65 = [(AMSSubscriptionEntitlement *)self vendorId];
  v66 = (void *)v65;
  if (v65) {
    v67 = (__CFString *)v65;
  }
  else {
    v67 = &stru_1EDCA7308;
  }
  [v3 setObject:v67 forKeyedSubscript:@"vendorId"];

  v68 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSSubscriptionEntitlement carrierErrorCode](self, "carrierErrorCode"));
  [v3 setObject:v68 forKeyedSubscript:@"carrierErrorCode"];

  uint64_t v69 = [(AMSSubscriptionEntitlement *)self carrierOperatorName];
  v70 = (void *)v69;
  if (v69) {
    v71 = (__CFString *)v69;
  }
  else {
    v71 = &stru_1EDCA7308;
  }
  [v3 setObject:v71 forKeyedSubscript:@"carrierOperatorName"];

  uint64_t v72 = [(AMSSubscriptionEntitlement *)self carrierPhoneNumber];
  v73 = (void *)v72;
  if (v72) {
    v74 = (__CFString *)v72;
  }
  else {
    v74 = &stru_1EDCA7308;
  }
  [v3 setObject:v74 forKeyedSubscript:@"carrierPhoneNumber"];

  uint64_t v75 = [(AMSSubscriptionEntitlement *)self carrierSessionId];
  v76 = (void *)v75;
  if (v75) {
    v77 = (__CFString *)v75;
  }
  else {
    v77 = &stru_1EDCA7308;
  }
  [v3 setObject:v77 forKeyedSubscript:@"carrierSessionId"];

  v78 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[AMSSubscriptionEntitlement carrierStatus](self, "carrierStatus"));
  [v3 setObject:v78 forKeyedSubscript:@"carrierStatus"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AMSSubscriptionEntitlement *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v9 = v7;

    if (!v9)
    {
      char v8 = 0;
LABEL_140:

      goto LABEL_141;
    }
    BOOL v10 = [(AMSSubscriptionEntitlement *)self autoRenewEnabled];
    if (v10 != [(AMSSubscriptionEntitlement *)v9 autoRenewEnabled]) {
      goto LABEL_23;
    }
    int64_t v12 = [(AMSSubscriptionEntitlement *)self carrierErrorCode];
    if (v12 != [(AMSSubscriptionEntitlement *)v9 carrierErrorCode]) {
      goto LABEL_23;
    }
    unsigned int v13 = [(AMSSubscriptionEntitlement *)self carrierStatus];
    if (v13 != [(AMSSubscriptionEntitlement *)v9 carrierStatus]) {
      goto LABEL_23;
    }
    BOOL v14 = [(AMSSubscriptionEntitlement *)self familySubscription];
    if (v14 != [(AMSSubscriptionEntitlement *)v9 familySubscription]) {
      goto LABEL_23;
    }
    BOOL v15 = [(AMSSubscriptionEntitlement *)self freeTrialEligible];
    if (v15 != [(AMSSubscriptionEntitlement *)v9 freeTrialEligible]) {
      goto LABEL_23;
    }
    BOOL v16 = [(AMSSubscriptionEntitlement *)self inFreePeriod];
    if (v16 != [(AMSSubscriptionEntitlement *)v9 inFreePeriod]) {
      goto LABEL_23;
    }
    [(AMSSubscriptionEntitlement *)self initialPurchaseTimestamp];
    double v18 = v17;
    [(AMSSubscriptionEntitlement *)v9 initialPurchaseTimestamp];
    if (v18 != v19
      || (unint64_t v20 = [(AMSSubscriptionEntitlement *)self period],
          v20 != [(AMSSubscriptionEntitlement *)v9 period])
      || (BOOL v21 = [(AMSSubscriptionEntitlement *)self purchaser],
          v21 != [(AMSSubscriptionEntitlement *)v9 purchaser])
      || ([(AMSSubscriptionEntitlement *)self serviceBeginsTimestamp],
          double v23 = v22,
          [(AMSSubscriptionEntitlement *)v9 serviceBeginsTimestamp],
          v23 != v24)
      || (unsigned int v25 = [(AMSSubscriptionEntitlement *)self source],
          v25 != [(AMSSubscriptionEntitlement *)v9 source])
      || (unsigned int v26 = [(AMSSubscriptionEntitlement *)self status],
          v26 != [(AMSSubscriptionEntitlement *)v9 status]))
    {
LABEL_23:
      uint64_t v202 = 0;
      uint64_t v203 = 0;
      int v185 = 0;
      uint64_t v200 = 0;
      uint64_t v201 = 0;
      int v182 = 0;
      int v179 = 0;
      uint64_t v199 = 0;
      int v176 = 0;
      int v197 = 0;
      int v173 = 0;
      BOOL v198 = 0;
      int v195 = 0;
      int v171 = 0;
      BOOL v196 = 0;
      int v193 = 0;
      int v169 = 0;
      BOOL v194 = 0;
      uint64_t v191 = 0;
      uint64_t v192 = 0;
      int v29 = 0;
      int v30 = 0;
      uint64_t v189 = 0;
      uint64_t v190 = 0;
      int v31 = 0;
      int v32 = 0;
      int v187 = 0;
      int v168 = 0;
      BOOL v188 = 0;
      int v184 = 0;
      int v166 = 0;
      BOOL v186 = 0;
      int v181 = 0;
      int v165 = 0;
      BOOL v183 = 0;
      int v178 = 0;
      int v167 = 0;
      BOOL v180 = 0;
      int v175 = 0;
      int v33 = 0;
      BOOL v177 = 0;
      int v172 = 0;
      int v34 = 0;
      BOOL v174 = 0;
      int v170 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      char v8 = 0;
      goto LABEL_24;
    }
    uint64_t v27 = [(AMSSubscriptionEntitlement *)self carrierOperatorName];
    LODWORD(v203) = v27 == 0;
    v162 = (void *)v27;
    if (v27
      || ([(AMSSubscriptionEntitlement *)v9 carrierOperatorName],
          (v158 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = [(AMSSubscriptionEntitlement *)self carrierOperatorName];
      [(AMSSubscriptionEntitlement *)v9 carrierOperatorName];
      v160 = v161 = v28;
      HIDWORD(v203) = 1;
      if (!objc_msgSend(v28, "isEqual:"))
      {
        int v185 = 0;
        uint64_t v200 = 0;
        uint64_t v201 = 0;
        int v182 = 0;
        int v179 = 0;
        uint64_t v199 = 0;
        int v176 = 0;
        int v197 = 0;
        int v173 = 0;
        BOOL v198 = 0;
        int v195 = 0;
        int v171 = 0;
        BOOL v196 = 0;
        int v193 = 0;
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        uint64_t v202 = 1;
        goto LABEL_24;
      }
      LODWORD(v202) = 1;
    }
    else
    {
      v158 = 0;
      LODWORD(v202) = 0;
    }
    uint64_t v50 = [(AMSSubscriptionEntitlement *)self carrierPhoneNumber];
    HIDWORD(v202) = v50 == 0;
    v159 = (void *)v50;
    v87 = v9;
    if (v50
      || ([(AMSSubscriptionEntitlement *)v9 carrierPhoneNumber],
          (v154 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v51 = [(AMSSubscriptionEntitlement *)self carrierPhoneNumber];
      [(AMSSubscriptionEntitlement *)v9 carrierPhoneNumber];
      v156 = v157 = v51;
      HIDWORD(v203) = 1;
      if (!objc_msgSend(v51, "isEqual:"))
      {
        int v182 = 0;
        uint64_t v199 = 0;
        uint64_t v200 = 0;
        int v179 = 0;
        int v176 = 0;
        int v197 = 0;
        int v173 = 0;
        BOOL v198 = 0;
        int v195 = 0;
        int v171 = 0;
        BOOL v196 = 0;
        int v193 = 0;
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        uint64_t v201 = 1;
        goto LABEL_245;
      }
      LODWORD(v201) = 1;
    }
    else
    {
      v154 = 0;
      LODWORD(v201) = 0;
    }
    uint64_t v52 = [(AMSSubscriptionEntitlement *)self carrierSessionId];
    HIDWORD(v201) = v52 == 0;
    v155 = (void *)v52;
    if (v52
      || ([(AMSSubscriptionEntitlement *)v87 carrierSessionId],
          (v150 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v53 = [(AMSSubscriptionEntitlement *)self carrierSessionId];
      [(AMSSubscriptionEntitlement *)v87 carrierSessionId];
      v152 = v153 = v53;
      HIDWORD(v203) = 1;
      if (!objc_msgSend(v53, "isEqual:"))
      {
        int v179 = 0;
        uint64_t v199 = 0;
        int v176 = 0;
        int v197 = 0;
        int v173 = 0;
        BOOL v198 = 0;
        int v195 = 0;
        int v171 = 0;
        BOOL v196 = 0;
        int v193 = 0;
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        uint64_t v200 = 1;
        goto LABEL_245;
      }
      LODWORD(v200) = 1;
    }
    else
    {
      v150 = 0;
      LODWORD(v200) = 0;
    }
    uint64_t v54 = [(AMSSubscriptionEntitlement *)self chargeStoreFrontID];
    HIDWORD(v200) = v54 == 0;
    v151 = (void *)v54;
    if (v54
      || ([(AMSSubscriptionEntitlement *)v87 chargeStoreFrontID],
          (v146 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v55 = [(AMSSubscriptionEntitlement *)self chargeStoreFrontID];
      v148 = [(AMSSubscriptionEntitlement *)v87 chargeStoreFrontID];
      v149 = v55;
      HIDWORD(v203) = 1;
      if (![v55 isEqual:v148])
      {
        int v176 = 0;
        int v197 = 0;
        int v173 = 0;
        BOOL v198 = 0;
        int v195 = 0;
        int v171 = 0;
        BOOL v196 = 0;
        int v193 = 0;
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        uint64_t v199 = 1;
        goto LABEL_245;
      }
      LODWORD(v199) = 1;
    }
    else
    {
      v146 = 0;
      LODWORD(v199) = 0;
    }
    uint64_t v56 = [(AMSSubscriptionEntitlement *)self expiration];
    HIDWORD(v199) = v56 == 0;
    v147 = (void *)v56;
    if (v56
      || ([(AMSSubscriptionEntitlement *)v87 expiration],
          (v142 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v57 = [(AMSSubscriptionEntitlement *)self expiration];
      v144 = [(AMSSubscriptionEntitlement *)v87 expiration];
      v145 = v57;
      HIDWORD(v203) = 1;
      if (![v57 isEqual:v144])
      {
        int v173 = 0;
        BOOL v198 = 0;
        int v195 = 0;
        int v171 = 0;
        BOOL v196 = 0;
        int v193 = 0;
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v197 = 1;
        goto LABEL_245;
      }
      int v197 = 1;
    }
    else
    {
      v142 = 0;
      int v197 = 0;
    }
    uint64_t v58 = [(AMSSubscriptionEntitlement *)self entitlementOriginType];
    BOOL v198 = v58 == 0;
    v143 = (void *)v58;
    if (v58
      || ([(AMSSubscriptionEntitlement *)v87 entitlementOriginType],
          (v138 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v59 = [(AMSSubscriptionEntitlement *)self entitlementOriginType];
      v140 = [(AMSSubscriptionEntitlement *)v87 entitlementOriginType];
      v141 = v59;
      HIDWORD(v203) = 1;
      if (![v59 isEqual:v140])
      {
        int v171 = 0;
        BOOL v196 = 0;
        int v193 = 0;
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v195 = 1;
        goto LABEL_245;
      }
      int v195 = 1;
    }
    else
    {
      v138 = 0;
      int v195 = 0;
    }
    uint64_t v60 = [(AMSSubscriptionEntitlement *)self entitlementSourceAdamId];
    BOOL v196 = v60 == 0;
    v139 = (void *)v60;
    if (v60
      || ([(AMSSubscriptionEntitlement *)v87 entitlementSourceAdamId],
          (v134 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v61 = [(AMSSubscriptionEntitlement *)self entitlementSourceAdamId];
      v136 = [(AMSSubscriptionEntitlement *)v87 entitlementSourceAdamId];
      v137 = v61;
      HIDWORD(v203) = 1;
      if (![v61 isEqual:v136])
      {
        int v169 = 0;
        BOOL v194 = 0;
        uint64_t v191 = 0;
        uint64_t v192 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v193 = 1;
        goto LABEL_245;
      }
      int v193 = 1;
    }
    else
    {
      v134 = 0;
      int v193 = 0;
    }
    uint64_t v62 = [(AMSSubscriptionEntitlement *)self featureAccessTypeId];
    BOOL v194 = v62 == 0;
    v135 = (void *)v62;
    if (v62
      || ([(AMSSubscriptionEntitlement *)v87 featureAccessTypeId],
          (v130 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v63 = [(AMSSubscriptionEntitlement *)self featureAccessTypeId];
      v132 = [(AMSSubscriptionEntitlement *)v87 featureAccessTypeId];
      v133 = v63;
      HIDWORD(v203) = 1;
      if (![v63 isEqual:v132])
      {
        int v29 = 0;
        uint64_t v190 = 0;
        uint64_t v191 = 0;
        int v30 = 0;
        int v31 = 0;
        uint64_t v189 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        uint64_t v192 = 1;
        goto LABEL_245;
      }
      LODWORD(v192) = 1;
    }
    else
    {
      v130 = 0;
      LODWORD(v192) = 0;
    }
    uint64_t v64 = [(AMSSubscriptionEntitlement *)self freeTrialPeriodId];
    HIDWORD(v192) = v64 == 0;
    v131 = (void *)v64;
    if (v64
      || ([(AMSSubscriptionEntitlement *)v87 freeTrialPeriodId],
          (v126 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v65 = [(AMSSubscriptionEntitlement *)self freeTrialPeriodId];
      v128 = [(AMSSubscriptionEntitlement *)v87 freeTrialPeriodId];
      v129 = v65;
      HIDWORD(v203) = 1;
      if (![v65 isEqual:v128])
      {
        int v30 = 0;
        uint64_t v189 = 0;
        uint64_t v190 = 0;
        int v31 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        uint64_t v191 = 1;
        goto LABEL_245;
      }
      LODWORD(v191) = 1;
    }
    else
    {
      v126 = 0;
      LODWORD(v191) = 0;
    }
    uint64_t v66 = [(AMSSubscriptionEntitlement *)self inAppAdamId];
    HIDWORD(v191) = v66 == 0;
    v127 = (void *)v66;
    if (v66
      || ([(AMSSubscriptionEntitlement *)v87 inAppAdamId],
          (v122 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v67 = [(AMSSubscriptionEntitlement *)self inAppAdamId];
      v124 = [(AMSSubscriptionEntitlement *)v87 inAppAdamId];
      v125 = v67;
      HIDWORD(v203) = 1;
      if (![v67 isEqual:v124])
      {
        int v31 = 0;
        uint64_t v189 = 0;
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        uint64_t v190 = 1;
        goto LABEL_245;
      }
      LODWORD(v190) = 1;
    }
    else
    {
      v122 = 0;
      LODWORD(v190) = 0;
    }
    uint64_t v68 = [(AMSSubscriptionEntitlement *)self inAppVersion];
    HIDWORD(v190) = v68 == 0;
    v123 = (void *)v68;
    if (v68
      || ([(AMSSubscriptionEntitlement *)v87 inAppVersion],
          (v118 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v69 = [(AMSSubscriptionEntitlement *)self inAppVersion];
      v120 = [(AMSSubscriptionEntitlement *)v87 inAppVersion];
      v121 = v69;
      HIDWORD(v203) = 1;
      if (![v69 isEqual:v120])
      {
        int v32 = 0;
        int v187 = 0;
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        uint64_t v189 = 1;
        goto LABEL_245;
      }
      LODWORD(v189) = 1;
    }
    else
    {
      v118 = 0;
      LODWORD(v189) = 0;
    }
    uint64_t v70 = [(AMSSubscriptionEntitlement *)self offerId];
    HIDWORD(v189) = v70 == 0;
    v119 = (void *)v70;
    if (v70
      || ([(AMSSubscriptionEntitlement *)v87 offerId],
          (v114 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v71 = [(AMSSubscriptionEntitlement *)self offerId];
      v116 = [(AMSSubscriptionEntitlement *)v87 offerId];
      v117 = v71;
      HIDWORD(v203) = 1;
      if (![v71 isEqual:v116])
      {
        int v168 = 0;
        BOOL v188 = 0;
        int v184 = 0;
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v187 = 1;
        goto LABEL_245;
      }
      int v187 = 1;
    }
    else
    {
      v114 = 0;
      int v187 = 0;
    }
    uint64_t v72 = [(AMSSubscriptionEntitlement *)self poolType];
    BOOL v188 = v72 == 0;
    v115 = (void *)v72;
    if (v72
      || ([(AMSSubscriptionEntitlement *)v87 poolType],
          (v110 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v73 = [(AMSSubscriptionEntitlement *)self poolType];
      v112 = [(AMSSubscriptionEntitlement *)v87 poolType];
      v113 = v73;
      HIDWORD(v203) = 1;
      if (![v73 isEqual:v112])
      {
        int v166 = 0;
        BOOL v186 = 0;
        int v181 = 0;
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v168 = 1;
        int v184 = 1;
        goto LABEL_245;
      }
      int v184 = 1;
    }
    else
    {
      v110 = 0;
      int v184 = 0;
    }
    uint64_t v74 = [(AMSSubscriptionEntitlement *)self promoScenarioId];
    BOOL v186 = v74 == 0;
    v111 = (void *)v74;
    if (v74
      || ([(AMSSubscriptionEntitlement *)v87 promoScenarioId],
          (v106 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v75 = [(AMSSubscriptionEntitlement *)self promoScenarioId];
      v108 = [(AMSSubscriptionEntitlement *)v87 promoScenarioId];
      v109 = v75;
      HIDWORD(v203) = 1;
      if (![v75 isEqual:v108])
      {
        int v165 = 0;
        BOOL v183 = 0;
        int v178 = 0;
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v168 = 1;
        int v166 = 1;
        int v181 = 1;
        goto LABEL_245;
      }
      int v181 = 1;
    }
    else
    {
      v106 = 0;
      int v181 = 0;
    }
    uint64_t v76 = [(AMSSubscriptionEntitlement *)self renewDate];
    BOOL v183 = v76 == 0;
    v107 = (void *)v76;
    if (v76
      || ([(AMSSubscriptionEntitlement *)v87 renewDate],
          (v103 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v77 = [(AMSSubscriptionEntitlement *)self renewDate];
      v104 = [(AMSSubscriptionEntitlement *)v87 renewDate];
      v105 = v77;
      HIDWORD(v203) = 1;
      if (![v77 isEqual:v104])
      {
        int v167 = 0;
        BOOL v180 = 0;
        int v175 = 0;
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v168 = 1;
        int v166 = 1;
        int v165 = 1;
        int v178 = 1;
        goto LABEL_245;
      }
      int v178 = 1;
    }
    else
    {
      v103 = 0;
      int v178 = 0;
    }
    uint64_t v78 = [(AMSSubscriptionEntitlement *)self startDate];
    BOOL v180 = v78 == 0;
    v102 = (void *)v78;
    if (v78
      || ([(AMSSubscriptionEntitlement *)v87 startDate],
          (v99 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v79 = [(AMSSubscriptionEntitlement *)self startDate];
      v100 = [(AMSSubscriptionEntitlement *)v87 startDate];
      v101 = v79;
      HIDWORD(v203) = 1;
      if (![v79 isEqual:v100])
      {
        int v33 = 0;
        BOOL v177 = 0;
        int v172 = 0;
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v168 = 1;
        int v166 = 1;
        int v165 = 1;
        int v167 = 1;
        int v175 = 1;
        goto LABEL_245;
      }
      int v175 = 1;
    }
    else
    {
      v99 = 0;
      int v175 = 0;
    }
    uint64_t v80 = [(AMSSubscriptionEntitlement *)self subscriptionBundleId];
    BOOL v177 = v80 == 0;
    v98 = (void *)v80;
    if (v80
      || ([(AMSSubscriptionEntitlement *)v87 subscriptionBundleId],
          (v97 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v81 = [(AMSSubscriptionEntitlement *)self subscriptionBundleId];
      v95 = [(AMSSubscriptionEntitlement *)v87 subscriptionBundleId];
      v96 = v81;
      HIDWORD(v203) = 1;
      if (![v81 isEqual:v95])
      {
        int v34 = 0;
        BOOL v174 = 0;
        int v170 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v168 = 1;
        int v166 = 1;
        int v165 = 1;
        int v167 = 1;
        int v33 = 1;
        int v172 = 1;
        goto LABEL_245;
      }
      int v172 = 1;
    }
    else
    {
      v97 = 0;
      int v172 = 0;
    }
    uint64_t v82 = [(AMSSubscriptionEntitlement *)self vendorAdHocOfferId];
    BOOL v174 = v82 == 0;
    v94 = (void *)v82;
    if (v82
      || ([(AMSSubscriptionEntitlement *)v87 vendorAdHocOfferId],
          (v91 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v83 = [(AMSSubscriptionEntitlement *)self vendorAdHocOfferId];
      v92 = [(AMSSubscriptionEntitlement *)v87 vendorAdHocOfferId];
      v93 = v83;
      HIDWORD(v203) = 1;
      if (![v83 isEqual:v92])
      {
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        char v8 = 0;
        int v185 = 1;
        int v182 = 1;
        int v179 = 1;
        int v176 = 1;
        int v173 = 1;
        int v171 = 1;
        int v169 = 1;
        int v29 = 1;
        int v30 = 1;
        int v31 = 1;
        int v32 = 1;
        int v168 = 1;
        int v166 = 1;
        int v165 = 1;
        int v167 = 1;
        int v33 = 1;
        int v34 = 1;
        int v170 = 1;
        goto LABEL_245;
      }
      int v170 = 1;
    }
    else
    {
      v91 = 0;
      int v170 = 0;
    }
    uint64_t v84 = [(AMSSubscriptionEntitlement *)self vendorId];
    BOOL v164 = v84 == 0;
    v90 = (void *)v84;
    if (v84
      || ([(AMSSubscriptionEntitlement *)v87 vendorId],
          (v89 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v85 = [(AMSSubscriptionEntitlement *)self vendorId];
      v9 = v87;
      uint64_t v86 = [(AMSSubscriptionEntitlement *)v87 vendorId];
      v88 = v85;
      char v8 = [v85 isEqual:v86];
      v11 = (void *)v86;
      int v37 = 1;
      HIDWORD(v203) = 1;
      int v185 = 1;
      int v182 = 1;
      int v179 = 1;
      int v176 = 1;
      int v173 = 1;
      int v171 = 1;
      int v169 = 1;
      int v29 = 1;
      int v30 = 1;
      int v31 = 1;
      int v32 = 1;
      int v168 = 1;
      int v166 = 1;
      int v165 = 1;
      int v167 = 1;
      int v33 = 1;
      int v34 = 1;
      int v35 = 1;
      int v36 = v164;
LABEL_24:
      if (v37)
      {
        v163 = v5;
        v38 = v9;
        int v39 = v33;
        char v40 = v8;
        int v41 = v32;
        int v42 = v34;
        int v43 = v31;
        int v44 = v35;
        int v45 = v30;
        int v46 = v29;
        int v47 = v36;

        int v48 = v47;
        int v29 = v46;
        int v30 = v45;
        int v35 = v44;
        int v31 = v43;
        int v34 = v42;
        int v32 = v41;
        char v8 = v40;
        int v33 = v39;
        v9 = v38;
        v5 = v163;
        if (!v48) {
          goto LABEL_26;
        }
      }
      else if (!v36)
      {
LABEL_26:
        if (!v35)
        {
LABEL_28:
          if (v170)
          {
          }
          if (v174) {

          }
          if (v34) {
          if (v172)
          }
          {
          }
          if (v177) {

          }
          if (v33) {
          if (v175)
          }
          {
          }
          if (v180) {

          }
          if (v167) {
          if (v178)
          }
          {
          }
          if (v183) {

          }
          if (v165) {
          if (v181)
          }
          {
          }
          if (v186) {

          }
          if (v166) {
          if (v184)
          }
          {
          }
          if (v188) {

          }
          if (v168) {
          if (v187)
          }
          {
          }
          if (HIDWORD(v189)) {

          }
          if (v32) {
          if (v189)
          }
          {
          }
          if (HIDWORD(v190)) {

          }
          if (v31) {
          if (v190)
          }
          {
          }
          if (HIDWORD(v191)) {

          }
          if (v30) {
          if (v191)
          }
          {
          }
          if (HIDWORD(v192)) {

          }
          if (v29) {
          if (v192)
          }
          {
          }
          if (v194) {

          }
          if (v169) {
          if (v193)
          }
          {
          }
          if (v196) {

          }
          if (v171) {
          if (v195)
          }
          {
          }
          if (v198) {

          }
          if (v173) {
          if (v197)
          }
          {
          }
          if (HIDWORD(v199)) {

          }
          if (v176) {
          if (v199)
          }
          {
          }
          if (HIDWORD(v200)) {

          }
          if (v179) {
          if (v200)
          }
          {
          }
          if (HIDWORD(v201)) {

          }
          if (v182) {
          if (v201)
          }
          {
          }
          if (HIDWORD(v202)) {

          }
          if (v185) {
          if (v202)
          }
          {
          }
          if (v203) {

          }
          if (HIDWORD(v203)) {
          goto LABEL_140;
          }
        }
LABEL_27:

        goto LABEL_28;
      }

      if (!v35) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    v89 = 0;
    v90 = 0;
    int v37 = 0;
    HIDWORD(v203) = 1;
    int v185 = 1;
    int v182 = 1;
    int v179 = 1;
    int v176 = 1;
    int v173 = 1;
    int v171 = 1;
    int v169 = 1;
    int v29 = 1;
    int v30 = 1;
    int v31 = 1;
    int v32 = 1;
    int v168 = 1;
    int v166 = 1;
    int v165 = 1;
    int v167 = 1;
    int v33 = 1;
    int v34 = 1;
    int v35 = 1;
    int v36 = 1;
    char v8 = 1;
LABEL_245:
    v9 = v87;
    goto LABEL_24;
  }
  char v8 = 1;
LABEL_141:

  return v8;
}

- (BOOL)autoRenewEnabled
{
  return self->_autoRenewEnabled;
}

- (void)setAutoRenewEnabled:(BOOL)a3
{
  self->_autoRenewEnabled = a3;
}

- (NSNumber)chargeStoreFrontID
{
  return self->_chargeStoreFrontID;
}

- (void)setChargeStoreFrontID:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSString)entitlementOriginType
{
  return self->_entitlementOriginType;
}

- (void)setEntitlementOriginType:(id)a3
{
}

- (NSNumber)entitlementSourceAdamId
{
  return self->_entitlementSourceAdamId;
}

- (void)setEntitlementSourceAdamId:(id)a3
{
}

- (NSString)externalSubscriptionID
{
  return self->_externalSubscriptionID;
}

- (void)setExternalSubscriptionID:(id)a3
{
}

- (NSNumber)familyRank
{
  return self->_familyRank;
}

- (void)setFamilyRank:(id)a3
{
}

- (BOOL)familySubscription
{
  return self->_familySubscription;
}

- (void)setFamilySubscription:(BOOL)a3
{
  self->_familySubscription = a3;
}

- (NSNumber)featureAccessTypeId
{
  return self->_featureAccessTypeId;
}

- (void)setFeatureAccessTypeId:(id)a3
{
}

- (BOOL)freeTrialEligible
{
  return self->_freeTrialEligible;
}

- (void)setFreeTrialEligible:(BOOL)a3
{
  self->_freeTrialEligible = a3;
}

- (NSNumber)freeTrialPeriodId
{
  return self->_freeTrialPeriodId;
}

- (void)setFreeTrialPeriodId:(id)a3
{
}

- (NSNumber)inAppAdamId
{
  return self->_inAppAdamId;
}

- (void)setInAppAdamId:(id)a3
{
}

- (NSString)inAppVersion
{
  return self->_inAppVersion;
}

- (void)setInAppVersion:(id)a3
{
}

- (double)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (void)setInitialPurchaseTimestamp:(double)a3
{
  self->_initialPurchaseTimestamp = a3;
}

- (BOOL)inFreePeriod
{
  return self->_inFreePeriod;
}

- (void)setInFreePeriod:(BOOL)a3
{
  self->_inFreePeriod = a3;
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
}

- (unint64_t)period
{
  return self->_period;
}

- (void)setPeriod:(unint64_t)a3
{
  self->_period = a3;
}

- (NSString)poolType
{
  return self->_poolType;
}

- (void)setPoolType:(id)a3
{
}

- (NSNumber)promoScenarioId
{
  return self->_promoScenarioId;
}

- (void)setPromoScenarioId:(id)a3
{
}

- (BOOL)purchaser
{
  return self->_purchaser;
}

- (void)setPurchaser:(BOOL)a3
{
  self->_purchaser = a3;
}

- (NSDate)renewDate
{
  return self->_renewDate;
}

- (void)setRenewDate:(id)a3
{
}

- (double)serviceBeginsTimestamp
{
  return self->_serviceBeginsTimestamp;
}

- (void)setServiceBeginsTimestamp:(double)a3
{
  self->_serviceBeginsTimestamp = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned int)a3
{
  self->_source = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (NSDate)studentExpirationDate
{
  return self->_studentExpirationDate;
}

- (void)setStudentExpirationDate:(id)a3
{
}

- (NSNumber)subscriptionBundleId
{
  return self->_subscriptionBundleId;
}

- (void)setSubscriptionBundleId:(id)a3
{
}

- (NSString)vendorAdHocOfferId
{
  return self->_vendorAdHocOfferId;
}

- (void)setVendorAdHocOfferId:(id)a3
{
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
}

- (int64_t)carrierErrorCode
{
  return self->_carrierErrorCode;
}

- (void)setCarrierErrorCode:(int64_t)a3
{
  self->_carrierErrorCode = a3;
}

- (NSString)carrierOperatorName
{
  return self->_carrierOperatorName;
}

- (void)setCarrierOperatorName:(id)a3
{
}

- (NSString)carrierPhoneNumber
{
  return self->_carrierPhoneNumber;
}

- (void)setCarrierPhoneNumber:(id)a3
{
}

- (NSString)carrierSessionId
{
  return self->_carrierSessionId;
}

- (void)setCarrierSessionId:(id)a3
{
}

- (unsigned)carrierStatus
{
  return self->_carrierStatus;
}

- (void)setCarrierStatus:(unsigned int)a3
{
  self->_carrierStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSessionId, 0);
  objc_storeStrong((id *)&self->_carrierPhoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierOperatorName, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_vendorAdHocOfferId, 0);
  objc_storeStrong((id *)&self->_subscriptionBundleId, 0);
  objc_storeStrong((id *)&self->_studentExpirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_renewDate, 0);
  objc_storeStrong((id *)&self->_promoScenarioId, 0);
  objc_storeStrong((id *)&self->_poolType, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_inAppVersion, 0);
  objc_storeStrong((id *)&self->_inAppAdamId, 0);
  objc_storeStrong((id *)&self->_freeTrialPeriodId, 0);
  objc_storeStrong((id *)&self->_featureAccessTypeId, 0);
  objc_storeStrong((id *)&self->_familyRank, 0);
  objc_storeStrong((id *)&self->_externalSubscriptionID, 0);
  objc_storeStrong((id *)&self->_entitlementSourceAdamId, 0);
  objc_storeStrong((id *)&self->_entitlementOriginType, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_chargeStoreFrontID, 0);
}

@end