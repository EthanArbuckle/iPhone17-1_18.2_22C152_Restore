@interface MUPlaceHeaderSectionControllerConfiguration
- (BOOL)alwaysShowExpandedVerifiedBusinessHeader;
- (BOOL)drawDynamicPlacecardDebugBackground;
- (BOOL)isDeveloperPlaceCard;
- (BOOL)shouldInsetRoundCoverPhoto;
- (BOOL)showShareButton;
- (BOOL)suppressContainmentPunchout;
- (GEOApplicationAuditToken)developerPlaceCardAuditToken;
- (void)setAlwaysShowExpandedVerifiedBusinessHeader:(BOOL)a3;
- (void)setDeveloperPlaceCardAuditToken:(id)a3;
- (void)setDrawDynamicPlacecardDebugBackground:(BOOL)a3;
- (void)setIsDeveloperPlaceCard:(BOOL)a3;
- (void)setShouldInsetRoundCoverPhoto:(BOOL)a3;
- (void)setShowShareButton:(BOOL)a3;
- (void)setSuppressContainmentPunchout:(BOOL)a3;
@end

@implementation MUPlaceHeaderSectionControllerConfiguration

- (BOOL)suppressContainmentPunchout
{
  return self->_suppressContainmentPunchout;
}

- (void)setSuppressContainmentPunchout:(BOOL)a3
{
  self->_suppressContainmentPunchout = a3;
}

- (BOOL)alwaysShowExpandedVerifiedBusinessHeader
{
  return self->_alwaysShowExpandedVerifiedBusinessHeader;
}

- (void)setAlwaysShowExpandedVerifiedBusinessHeader:(BOOL)a3
{
  self->_alwaysShowExpandedVerifiedBusinessHeader = a3;
}

- (BOOL)shouldInsetRoundCoverPhoto
{
  return self->_shouldInsetRoundCoverPhoto;
}

- (void)setShouldInsetRoundCoverPhoto:(BOOL)a3
{
  self->_shouldInsetRoundCoverPhoto = a3;
}

- (BOOL)showShareButton
{
  return self->_showShareButton;
}

- (void)setShowShareButton:(BOOL)a3
{
  self->_showShareButton = a3;
}

- (BOOL)isDeveloperPlaceCard
{
  return self->_isDeveloperPlaceCard;
}

- (void)setIsDeveloperPlaceCard:(BOOL)a3
{
  self->_isDeveloperPlaceCard = a3;
}

- (GEOApplicationAuditToken)developerPlaceCardAuditToken
{
  return self->_developerPlaceCardAuditToken;
}

- (void)setDeveloperPlaceCardAuditToken:(id)a3
{
}

- (BOOL)drawDynamicPlacecardDebugBackground
{
  return self->_drawDynamicPlacecardDebugBackground;
}

- (void)setDrawDynamicPlacecardDebugBackground:(BOOL)a3
{
  self->_drawDynamicPlacecardDebugBackground = a3;
}

- (void).cxx_destruct
{
}

@end