@interface EDAMBootstrapSettings
+ (id)structFields;
+ (id)structName;
- (NSNumber)enableFacebookSharing;
- (NSNumber)enableGiftSubscriptions;
- (NSNumber)enableGoogle;
- (NSNumber)enableLinkedInSharing;
- (NSNumber)enablePublicNotebooks;
- (NSNumber)enableSharedNotebooks;
- (NSNumber)enableSingleNoteSharing;
- (NSNumber)enableSponsoredAccounts;
- (NSNumber)enableSupportTickets;
- (NSNumber)enableTwitterSharing;
- (NSString)accountEmailDomain;
- (NSString)announcementsUrl;
- (NSString)cardscanUrl;
- (NSString)marketingUrl;
- (NSString)serviceHost;
- (NSString)supportUrl;
- (void)setAccountEmailDomain:(id)a3;
- (void)setAnnouncementsUrl:(id)a3;
- (void)setCardscanUrl:(id)a3;
- (void)setEnableFacebookSharing:(id)a3;
- (void)setEnableGiftSubscriptions:(id)a3;
- (void)setEnableGoogle:(id)a3;
- (void)setEnableLinkedInSharing:(id)a3;
- (void)setEnablePublicNotebooks:(id)a3;
- (void)setEnableSharedNotebooks:(id)a3;
- (void)setEnableSingleNoteSharing:(id)a3;
- (void)setEnableSponsoredAccounts:(id)a3;
- (void)setEnableSupportTickets:(id)a3;
- (void)setEnableTwitterSharing:(id)a3;
- (void)setMarketingUrl:(id)a3;
- (void)setServiceHost:(id)a3;
- (void)setSupportUrl:(id)a3;
@end

@implementation EDAMBootstrapSettings

+ (id)structFields
{
  v22[16] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_195;
  if (!structFields_structFields_195)
  {
    v21 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"serviceHost"];
    v22[0] = v21;
    v20 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"marketingUrl"];
    v22[1] = v20;
    v19 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"supportUrl"];
    v22[2] = v19;
    v18 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"accountEmailDomain"];
    v22[3] = v18;
    v17 = +[FATField fieldWithIndex:14 type:11 optional:1 name:@"cardscanUrl"];
    v22[4] = v17;
    v16 = +[FATField fieldWithIndex:15 type:11 optional:1 name:@"announcementsUrl"];
    v22[5] = v16;
    v3 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"enableFacebookSharing"];
    v22[6] = v3;
    v4 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"enableGiftSubscriptions"];
    v22[7] = v4;
    v5 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"enableSupportTickets"];
    v22[8] = v5;
    v6 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"enableSharedNotebooks"];
    v22[9] = v6;
    v7 = +[FATField fieldWithIndex:9 type:2 optional:1 name:@"enableSingleNoteSharing"];
    v22[10] = v7;
    v8 = +[FATField fieldWithIndex:10 type:2 optional:1 name:@"enableSponsoredAccounts"];
    v22[11] = v8;
    v9 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"enableTwitterSharing"];
    v22[12] = v9;
    v10 = +[FATField fieldWithIndex:12 type:2 optional:1 name:@"enableLinkedInSharing"];
    v22[13] = v10;
    v11 = +[FATField fieldWithIndex:13 type:2 optional:1 name:@"enablePublicNotebooks"];
    v22[14] = v11;
    v12 = +[FATField fieldWithIndex:16 type:2 optional:1 name:@"enableGoogle"];
    v22[15] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:16];
    v14 = (void *)structFields_structFields_195;
    structFields_structFields_195 = v13;

    v2 = (void *)structFields_structFields_195;
  }
  return v2;
}

+ (id)structName
{
  return @"BootstrapSettings";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableGoogle, 0);
  objc_storeStrong((id *)&self->_enablePublicNotebooks, 0);
  objc_storeStrong((id *)&self->_enableLinkedInSharing, 0);
  objc_storeStrong((id *)&self->_enableTwitterSharing, 0);
  objc_storeStrong((id *)&self->_enableSponsoredAccounts, 0);
  objc_storeStrong((id *)&self->_enableSingleNoteSharing, 0);
  objc_storeStrong((id *)&self->_enableSharedNotebooks, 0);
  objc_storeStrong((id *)&self->_enableSupportTickets, 0);
  objc_storeStrong((id *)&self->_enableGiftSubscriptions, 0);
  objc_storeStrong((id *)&self->_enableFacebookSharing, 0);
  objc_storeStrong((id *)&self->_announcementsUrl, 0);
  objc_storeStrong((id *)&self->_cardscanUrl, 0);
  objc_storeStrong((id *)&self->_accountEmailDomain, 0);
  objc_storeStrong((id *)&self->_supportUrl, 0);
  objc_storeStrong((id *)&self->_marketingUrl, 0);
  objc_storeStrong((id *)&self->_serviceHost, 0);
}

- (void)setEnableGoogle:(id)a3
{
}

- (NSNumber)enableGoogle
{
  return self->_enableGoogle;
}

- (void)setEnablePublicNotebooks:(id)a3
{
}

- (NSNumber)enablePublicNotebooks
{
  return self->_enablePublicNotebooks;
}

- (void)setEnableLinkedInSharing:(id)a3
{
}

- (NSNumber)enableLinkedInSharing
{
  return self->_enableLinkedInSharing;
}

- (void)setEnableTwitterSharing:(id)a3
{
}

- (NSNumber)enableTwitterSharing
{
  return self->_enableTwitterSharing;
}

- (void)setEnableSponsoredAccounts:(id)a3
{
}

- (NSNumber)enableSponsoredAccounts
{
  return self->_enableSponsoredAccounts;
}

- (void)setEnableSingleNoteSharing:(id)a3
{
}

- (NSNumber)enableSingleNoteSharing
{
  return self->_enableSingleNoteSharing;
}

- (void)setEnableSharedNotebooks:(id)a3
{
}

- (NSNumber)enableSharedNotebooks
{
  return self->_enableSharedNotebooks;
}

- (void)setEnableSupportTickets:(id)a3
{
}

- (NSNumber)enableSupportTickets
{
  return self->_enableSupportTickets;
}

- (void)setEnableGiftSubscriptions:(id)a3
{
}

- (NSNumber)enableGiftSubscriptions
{
  return self->_enableGiftSubscriptions;
}

- (void)setEnableFacebookSharing:(id)a3
{
}

- (NSNumber)enableFacebookSharing
{
  return self->_enableFacebookSharing;
}

- (void)setAnnouncementsUrl:(id)a3
{
}

- (NSString)announcementsUrl
{
  return self->_announcementsUrl;
}

- (void)setCardscanUrl:(id)a3
{
}

- (NSString)cardscanUrl
{
  return self->_cardscanUrl;
}

- (void)setAccountEmailDomain:(id)a3
{
}

- (NSString)accountEmailDomain
{
  return self->_accountEmailDomain;
}

- (void)setSupportUrl:(id)a3
{
}

- (NSString)supportUrl
{
  return self->_supportUrl;
}

- (void)setMarketingUrl:(id)a3
{
}

- (NSString)marketingUrl
{
  return self->_marketingUrl;
}

- (void)setServiceHost:(id)a3
{
}

- (NSString)serviceHost
{
  return self->_serviceHost;
}

@end