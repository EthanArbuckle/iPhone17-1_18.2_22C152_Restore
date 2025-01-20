@interface EDAMUserAttributes
+ (id)structFields;
+ (id)structName;
- (NSArray)recentMailedAddresses;
- (NSArray)viewedPromotions;
- (NSNumber)clipFullPage;
- (NSNumber)dailyEmailLimit;
- (NSNumber)dateAgreedToTermsOfService;
- (NSNumber)defaultLatitude;
- (NSNumber)defaultLongitude;
- (NSNumber)educationalDiscount;
- (NSNumber)emailAddressLastConfirmed;
- (NSNumber)emailOptOutDate;
- (NSNumber)hideSponsorBilling;
- (NSNumber)maxReferrals;
- (NSNumber)optOutMachineLearning;
- (NSNumber)partnerEmailOptInDate;
- (NSNumber)passwordUpdated;
- (NSNumber)preactivation;
- (NSNumber)referralCount;
- (NSNumber)reminderEmailConfig;
- (NSNumber)salesforcePushEnabled;
- (NSNumber)sentEmailCount;
- (NSNumber)sentEmailDate;
- (NSNumber)shouldLogClientEvent;
- (NSNumber)taxExempt;
- (NSNumber)useEmailAutoFiling;
- (NSString)businessAddress;
- (NSString)comments;
- (NSString)defaultLocationName;
- (NSString)groupName;
- (NSString)incomingEmailAddress;
- (NSString)preferredCountry;
- (NSString)preferredLanguage;
- (NSString)recognitionLanguage;
- (NSString)refererCode;
- (NSString)referralProof;
- (NSString)twitterId;
- (NSString)twitterUserName;
- (void)setBusinessAddress:(id)a3;
- (void)setClipFullPage:(id)a3;
- (void)setComments:(id)a3;
- (void)setDailyEmailLimit:(id)a3;
- (void)setDateAgreedToTermsOfService:(id)a3;
- (void)setDefaultLatitude:(id)a3;
- (void)setDefaultLocationName:(id)a3;
- (void)setDefaultLongitude:(id)a3;
- (void)setEducationalDiscount:(id)a3;
- (void)setEmailAddressLastConfirmed:(id)a3;
- (void)setEmailOptOutDate:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHideSponsorBilling:(id)a3;
- (void)setIncomingEmailAddress:(id)a3;
- (void)setMaxReferrals:(id)a3;
- (void)setOptOutMachineLearning:(id)a3;
- (void)setPartnerEmailOptInDate:(id)a3;
- (void)setPasswordUpdated:(id)a3;
- (void)setPreactivation:(id)a3;
- (void)setPreferredCountry:(id)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setRecentMailedAddresses:(id)a3;
- (void)setRecognitionLanguage:(id)a3;
- (void)setRefererCode:(id)a3;
- (void)setReferralCount:(id)a3;
- (void)setReferralProof:(id)a3;
- (void)setReminderEmailConfig:(id)a3;
- (void)setSalesforcePushEnabled:(id)a3;
- (void)setSentEmailCount:(id)a3;
- (void)setSentEmailDate:(id)a3;
- (void)setShouldLogClientEvent:(id)a3;
- (void)setTaxExempt:(id)a3;
- (void)setTwitterId:(id)a3;
- (void)setTwitterUserName:(id)a3;
- (void)setUseEmailAutoFiling:(id)a3;
- (void)setViewedPromotions:(id)a3;
@end

@implementation EDAMUserAttributes

+ (id)structFields
{
  v44[36] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_35;
  if (!structFields_structFields_35)
  {
    v43 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"defaultLocationName"];
    v44[0] = v43;
    v42 = +[FATField fieldWithIndex:2 type:4 optional:1 name:@"defaultLatitude"];
    v44[1] = v42;
    v41 = +[FATField fieldWithIndex:3 type:4 optional:1 name:@"defaultLongitude"];
    v44[2] = v41;
    v40 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"preactivation"];
    v44[3] = v40;
    v39 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v38 = +[FATField fieldWithIndex:5 type:15 optional:1 name:@"viewedPromotions" valueField:v39];
    v44[4] = v38;
    v37 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"incomingEmailAddress"];
    v44[5] = v37;
    v36 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v35 = +[FATField fieldWithIndex:7 type:15 optional:1 name:@"recentMailedAddresses" valueField:v36];
    v44[6] = v35;
    v34 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"comments"];
    v44[7] = v34;
    v33 = +[FATField fieldWithIndex:11 type:10 optional:1 name:@"dateAgreedToTermsOfService"];
    v44[8] = v33;
    v32 = +[FATField fieldWithIndex:12 type:8 optional:1 name:@"maxReferrals"];
    v44[9] = v32;
    v31 = +[FATField fieldWithIndex:13 type:8 optional:1 name:@"referralCount"];
    v44[10] = v31;
    v30 = +[FATField fieldWithIndex:14 type:11 optional:1 name:@"refererCode"];
    v44[11] = v30;
    v29 = +[FATField fieldWithIndex:15 type:10 optional:1 name:@"sentEmailDate"];
    v44[12] = v29;
    v28 = +[FATField fieldWithIndex:16 type:8 optional:1 name:@"sentEmailCount"];
    v44[13] = v28;
    v27 = +[FATField fieldWithIndex:17 type:8 optional:1 name:@"dailyEmailLimit"];
    v44[14] = v27;
    v26 = +[FATField fieldWithIndex:18 type:10 optional:1 name:@"emailOptOutDate"];
    v44[15] = v26;
    v25 = +[FATField fieldWithIndex:19 type:10 optional:1 name:@"partnerEmailOptInDate"];
    v44[16] = v25;
    v24 = +[FATField fieldWithIndex:20 type:11 optional:1 name:@"preferredLanguage"];
    v44[17] = v24;
    v23 = +[FATField fieldWithIndex:21 type:11 optional:1 name:@"preferredCountry"];
    v44[18] = v23;
    v22 = +[FATField fieldWithIndex:22 type:2 optional:1 name:@"clipFullPage"];
    v44[19] = v22;
    v21 = +[FATField fieldWithIndex:23 type:11 optional:1 name:@"twitterUserName"];
    v44[20] = v21;
    v20 = +[FATField fieldWithIndex:24 type:11 optional:1 name:@"twitterId"];
    v44[21] = v20;
    v19 = +[FATField fieldWithIndex:25 type:11 optional:1 name:@"groupName"];
    v44[22] = v19;
    v18 = +[FATField fieldWithIndex:26 type:11 optional:1 name:@"recognitionLanguage"];
    v44[23] = v18;
    v17 = +[FATField fieldWithIndex:28 type:11 optional:1 name:@"referralProof"];
    v44[24] = v17;
    v16 = +[FATField fieldWithIndex:29 type:2 optional:1 name:@"educationalDiscount"];
    v44[25] = v16;
    v3 = +[FATField fieldWithIndex:30 type:11 optional:1 name:@"businessAddress"];
    v44[26] = v3;
    v4 = +[FATField fieldWithIndex:31 type:2 optional:1 name:@"hideSponsorBilling"];
    v44[27] = v4;
    v5 = +[FATField fieldWithIndex:32 type:2 optional:1 name:@"taxExempt"];
    v44[28] = v5;
    v6 = +[FATField fieldWithIndex:33 type:2 optional:1 name:@"useEmailAutoFiling"];
    v44[29] = v6;
    v7 = +[FATField fieldWithIndex:34 type:8 optional:1 name:@"reminderEmailConfig"];
    v44[30] = v7;
    v8 = +[FATField fieldWithIndex:35 type:10 optional:1 name:@"emailAddressLastConfirmed"];
    v44[31] = v8;
    v9 = +[FATField fieldWithIndex:36 type:10 optional:1 name:@"passwordUpdated"];
    v44[32] = v9;
    v10 = +[FATField fieldWithIndex:37 type:2 optional:1 name:@"salesforcePushEnabled"];
    v44[33] = v10;
    v11 = +[FATField fieldWithIndex:38 type:2 optional:1 name:@"shouldLogClientEvent"];
    v44[34] = v11;
    v12 = +[FATField fieldWithIndex:39 type:2 optional:1 name:@"optOutMachineLearning"];
    v44[35] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:36];
    v14 = (void *)structFields_structFields_35;
    structFields_structFields_35 = v13;

    v2 = (void *)structFields_structFields_35;
  }
  return v2;
}

+ (id)structName
{
  return @"UserAttributes";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optOutMachineLearning, 0);
  objc_storeStrong((id *)&self->_shouldLogClientEvent, 0);
  objc_storeStrong((id *)&self->_salesforcePushEnabled, 0);
  objc_storeStrong((id *)&self->_passwordUpdated, 0);
  objc_storeStrong((id *)&self->_emailAddressLastConfirmed, 0);
  objc_storeStrong((id *)&self->_reminderEmailConfig, 0);
  objc_storeStrong((id *)&self->_useEmailAutoFiling, 0);
  objc_storeStrong((id *)&self->_taxExempt, 0);
  objc_storeStrong((id *)&self->_hideSponsorBilling, 0);
  objc_storeStrong((id *)&self->_businessAddress, 0);
  objc_storeStrong((id *)&self->_educationalDiscount, 0);
  objc_storeStrong((id *)&self->_referralProof, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_twitterId, 0);
  objc_storeStrong((id *)&self->_twitterUserName, 0);
  objc_storeStrong((id *)&self->_clipFullPage, 0);
  objc_storeStrong((id *)&self->_preferredCountry, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_partnerEmailOptInDate, 0);
  objc_storeStrong((id *)&self->_emailOptOutDate, 0);
  objc_storeStrong((id *)&self->_dailyEmailLimit, 0);
  objc_storeStrong((id *)&self->_sentEmailCount, 0);
  objc_storeStrong((id *)&self->_sentEmailDate, 0);
  objc_storeStrong((id *)&self->_refererCode, 0);
  objc_storeStrong((id *)&self->_referralCount, 0);
  objc_storeStrong((id *)&self->_maxReferrals, 0);
  objc_storeStrong((id *)&self->_dateAgreedToTermsOfService, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_recentMailedAddresses, 0);
  objc_storeStrong((id *)&self->_incomingEmailAddress, 0);
  objc_storeStrong((id *)&self->_viewedPromotions, 0);
  objc_storeStrong((id *)&self->_preactivation, 0);
  objc_storeStrong((id *)&self->_defaultLongitude, 0);
  objc_storeStrong((id *)&self->_defaultLatitude, 0);
  objc_storeStrong((id *)&self->_defaultLocationName, 0);
}

- (void)setOptOutMachineLearning:(id)a3
{
}

- (NSNumber)optOutMachineLearning
{
  return self->_optOutMachineLearning;
}

- (void)setShouldLogClientEvent:(id)a3
{
}

- (NSNumber)shouldLogClientEvent
{
  return self->_shouldLogClientEvent;
}

- (void)setSalesforcePushEnabled:(id)a3
{
}

- (NSNumber)salesforcePushEnabled
{
  return self->_salesforcePushEnabled;
}

- (void)setPasswordUpdated:(id)a3
{
}

- (NSNumber)passwordUpdated
{
  return self->_passwordUpdated;
}

- (void)setEmailAddressLastConfirmed:(id)a3
{
}

- (NSNumber)emailAddressLastConfirmed
{
  return self->_emailAddressLastConfirmed;
}

- (void)setReminderEmailConfig:(id)a3
{
}

- (NSNumber)reminderEmailConfig
{
  return self->_reminderEmailConfig;
}

- (void)setUseEmailAutoFiling:(id)a3
{
}

- (NSNumber)useEmailAutoFiling
{
  return self->_useEmailAutoFiling;
}

- (void)setTaxExempt:(id)a3
{
}

- (NSNumber)taxExempt
{
  return self->_taxExempt;
}

- (void)setHideSponsorBilling:(id)a3
{
}

- (NSNumber)hideSponsorBilling
{
  return self->_hideSponsorBilling;
}

- (void)setBusinessAddress:(id)a3
{
}

- (NSString)businessAddress
{
  return self->_businessAddress;
}

- (void)setEducationalDiscount:(id)a3
{
}

- (NSNumber)educationalDiscount
{
  return self->_educationalDiscount;
}

- (void)setReferralProof:(id)a3
{
}

- (NSString)referralProof
{
  return self->_referralProof;
}

- (void)setRecognitionLanguage:(id)a3
{
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setTwitterId:(id)a3
{
}

- (NSString)twitterId
{
  return self->_twitterId;
}

- (void)setTwitterUserName:(id)a3
{
}

- (NSString)twitterUserName
{
  return self->_twitterUserName;
}

- (void)setClipFullPage:(id)a3
{
}

- (NSNumber)clipFullPage
{
  return self->_clipFullPage;
}

- (void)setPreferredCountry:(id)a3
{
}

- (NSString)preferredCountry
{
  return self->_preferredCountry;
}

- (void)setPreferredLanguage:(id)a3
{
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPartnerEmailOptInDate:(id)a3
{
}

- (NSNumber)partnerEmailOptInDate
{
  return self->_partnerEmailOptInDate;
}

- (void)setEmailOptOutDate:(id)a3
{
}

- (NSNumber)emailOptOutDate
{
  return self->_emailOptOutDate;
}

- (void)setDailyEmailLimit:(id)a3
{
}

- (NSNumber)dailyEmailLimit
{
  return self->_dailyEmailLimit;
}

- (void)setSentEmailCount:(id)a3
{
}

- (NSNumber)sentEmailCount
{
  return self->_sentEmailCount;
}

- (void)setSentEmailDate:(id)a3
{
}

- (NSNumber)sentEmailDate
{
  return self->_sentEmailDate;
}

- (void)setRefererCode:(id)a3
{
}

- (NSString)refererCode
{
  return self->_refererCode;
}

- (void)setReferralCount:(id)a3
{
}

- (NSNumber)referralCount
{
  return self->_referralCount;
}

- (void)setMaxReferrals:(id)a3
{
}

- (NSNumber)maxReferrals
{
  return self->_maxReferrals;
}

- (void)setDateAgreedToTermsOfService:(id)a3
{
}

- (NSNumber)dateAgreedToTermsOfService
{
  return self->_dateAgreedToTermsOfService;
}

- (void)setComments:(id)a3
{
}

- (NSString)comments
{
  return self->_comments;
}

- (void)setRecentMailedAddresses:(id)a3
{
}

- (NSArray)recentMailedAddresses
{
  return self->_recentMailedAddresses;
}

- (void)setIncomingEmailAddress:(id)a3
{
}

- (NSString)incomingEmailAddress
{
  return self->_incomingEmailAddress;
}

- (void)setViewedPromotions:(id)a3
{
}

- (NSArray)viewedPromotions
{
  return self->_viewedPromotions;
}

- (void)setPreactivation:(id)a3
{
}

- (NSNumber)preactivation
{
  return self->_preactivation;
}

- (void)setDefaultLongitude:(id)a3
{
}

- (NSNumber)defaultLongitude
{
  return self->_defaultLongitude;
}

- (void)setDefaultLatitude:(id)a3
{
}

- (NSNumber)defaultLatitude
{
  return self->_defaultLatitude;
}

- (void)setDefaultLocationName:(id)a3
{
}

- (NSString)defaultLocationName
{
  return self->_defaultLocationName;
}

@end