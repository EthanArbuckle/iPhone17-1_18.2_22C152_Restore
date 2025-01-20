@interface MUTransitLineItemHeaderViewModel
- (BOOL)hasEnclosingPlace;
- (BOOL)hasHeroImage;
- (BOOL)hasInitialData;
- (BOOL)hasVerifiedHeaderStyle;
- (BOOL)isClaimed;
- (BOOL)isVerified;
- (BOOL)supportsContactAddressDescription;
- (BOOL)supportsEnhancedBusinessHeader;
- (BOOL)supportsLogo;
- (MULabeledTokenViewModel)enclosingPlaceViewModel;
- (MUTransitLineItemHeaderViewModel)initWithTransitLineItem:(id)a3;
- (NSArray)transitLabelItems;
- (NSAttributedString)addressDescriptionForContact;
- (NSString)placeName;
- (NSString)placeSecondaryName;
- (UIColor)coverPhotoBackgroundColor;
- (UIColor)logoBackgroundColor;
- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5;
- (void)loadCoverPhotoWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
- (void)loadHeroImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
- (void)loadVerifiedLogoImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
@end

@implementation MUTransitLineItemHeaderViewModel

- (MUTransitLineItemHeaderViewModel)initWithTransitLineItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUTransitLineItemHeaderViewModel;
  v6 = [(MUTransitLineItemHeaderViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lineItem, a3);
  }

  return v7;
}

- (MULabeledTokenViewModel)enclosingPlaceViewModel
{
  return 0;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (BOOL)hasEnclosingPlace
{
  return 0;
}

- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5
{
  return 0;
}

- (NSString)placeName
{
  v2 = self->_lineItem;
  v3 = [(GEOTransitLineItem *)v2 name];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    uint64_t v5 = [(GEOTransitLineItem *)v2 system];

    v2 = (GEOTransitLineItem *)v5;
  }
  v6 = [(GEOTransitLineItem *)v2 name];

  return (NSString *)v6;
}

- (NSString)placeSecondaryName
{
  return (NSString *)_MULocalizedStringFromThisBundle(@"Line Card Secondary Name [Placecard]");
}

- (NSAttributedString)addressDescriptionForContact
{
  return 0;
}

- (NSArray)transitLabelItems
{
  return (NSArray *)[(GEOTransitLineItem *)self->_lineItem labelItems];
}

- (BOOL)hasHeroImage
{
  return 0;
}

- (void)loadHeroImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
}

- (BOOL)isVerified
{
  return 0;
}

- (BOOL)isClaimed
{
  return 0;
}

- (BOOL)hasVerifiedHeaderStyle
{
  return 0;
}

- (BOOL)supportsEnhancedBusinessHeader
{
  return 0;
}

- (void)loadCoverPhotoWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
}

- (void)loadVerifiedLogoImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
}

- (BOOL)supportsLogo
{
  return 0;
}

- (UIColor)coverPhotoBackgroundColor
{
  return 0;
}

- (UIColor)logoBackgroundColor
{
  return 0;
}

- (BOOL)supportsContactAddressDescription
{
  return 0;
}

- (void).cxx_destruct
{
}

@end