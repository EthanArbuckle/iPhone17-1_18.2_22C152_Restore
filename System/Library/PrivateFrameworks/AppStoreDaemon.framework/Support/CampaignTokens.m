@interface CampaignTokens
@end

@implementation CampaignTokens

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerToken, 0);
  objc_storeStrong((id *)&self->_campaignToken, 0);
  objc_storeStrong((id *)&self->_campaign, 0);
  objc_storeStrong((id *)&self->_affiliateToken, 0);
}

@end