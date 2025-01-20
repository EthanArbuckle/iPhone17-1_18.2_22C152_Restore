@interface CPPointOfInterest
+ (BOOL)supportsSecureCoding;
+ (CGSize)pinImageSize;
+ (CGSize)selectedPinImageSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPointOfInterest:(id)a3;
- (CPImageSet)pinImageSet;
- (CPImageSet)selectedPinImageSet;
- (CPPointOfInterest)initWithCoder:(id)a3;
- (CPPointOfInterest)initWithLocation:(MKMapItem *)location title:(NSString *)title subtitle:(NSString *)subtitle summary:(NSString *)summary detailTitle:(NSString *)detailTitle detailSubtitle:(NSString *)detailSubtitle detailSummary:(NSString *)detailSummary pinImage:(UIImage *)pinImage;
- (CPPointOfInterest)initWithLocation:(MKMapItem *)location title:(NSString *)title subtitle:(NSString *)subtitle summary:(NSString *)summary detailTitle:(NSString *)detailTitle detailSubtitle:(NSString *)detailSubtitle detailSummary:(NSString *)detailSummary pinImage:(UIImage *)pinImage selectedPinImage:(UIImage *)selectedPinImage;
- (CPTextButton)primaryButton;
- (CPTextButton)secondaryButton;
- (MKMapItem)location;
- (NSString)detailSubtitle;
- (NSString)detailSummary;
- (NSString)detailTitle;
- (NSString)subtitle;
- (NSString)summary;
- (NSString)title;
- (NSUUID)identifier;
- (UIImage)pinImage;
- (UIImage)selectedPinImage;
- (id)userInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailSubtitle:(NSString *)detailSubtitle;
- (void)setDetailSummary:(NSString *)detailSummary;
- (void)setDetailTitle:(NSString *)detailTitle;
- (void)setLocation:(MKMapItem *)location;
- (void)setPinImage:(UIImage *)pinImage;
- (void)setPinImageSet:(id)a3;
- (void)setPrimaryButton:(CPTextButton *)primaryButton;
- (void)setSecondaryButton:(CPTextButton *)secondaryButton;
- (void)setSelectedPinImage:(UIImage *)selectedPinImage;
- (void)setSelectedPinImageSet:(id)a3;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setSummary:(NSString *)summary;
- (void)setTitle:(NSString *)title;
- (void)setUserInfo:(id)userInfo;
@end

@implementation CPPointOfInterest

+ (CGSize)pinImageSize
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)selectedPinImageSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CPPointOfInterest)initWithLocation:(MKMapItem *)location title:(NSString *)title subtitle:(NSString *)subtitle summary:(NSString *)summary detailTitle:(NSString *)detailTitle detailSubtitle:(NSString *)detailSubtitle detailSummary:(NSString *)detailSummary pinImage:(UIImage *)pinImage selectedPinImage:(UIImage *)selectedPinImage
{
  v42 = location;
  v18 = title;
  v19 = subtitle;
  v20 = summary;
  v21 = detailTitle;
  v22 = detailSubtitle;
  v23 = detailSummary;
  v24 = pinImage;
  v25 = selectedPinImage;
  v43.receiver = self;
  v43.super_class = (Class)CPPointOfInterest;
  v26 = [(CPPointOfInterest *)&v43 init];
  if (v26)
  {
    uint64_t v27 = [MEMORY[0x263F08C38] UUID];
    identifier = v26->_identifier;
    v26->_identifier = (NSUUID *)v27;

    objc_storeStrong((id *)&v26->_location, location);
    uint64_t v29 = [(NSString *)v18 copy];
    v30 = v26->_title;
    v26->_title = (NSString *)v29;

    uint64_t v31 = [(NSString *)v19 copy];
    v32 = v26->_subtitle;
    v26->_subtitle = (NSString *)v31;

    uint64_t v33 = [(NSString *)v20 copy];
    v34 = v26->_summary;
    v26->_summary = (NSString *)v33;

    uint64_t v35 = [(NSString *)v21 copy];
    v36 = v26->_detailTitle;
    v26->_detailTitle = (NSString *)v35;

    uint64_t v37 = [(NSString *)v22 copy];
    v38 = v26->_detailSubtitle;
    v26->_detailSubtitle = (NSString *)v37;

    uint64_t v39 = [(NSString *)v23 copy];
    v40 = v26->_detailSummary;
    v26->_detailSummary = (NSString *)v39;

    [(CPPointOfInterest *)v26 setPinImage:v24];
    [(CPPointOfInterest *)v26 setSelectedPinImage:v25];
  }

  return v26;
}

- (CPPointOfInterest)initWithLocation:(MKMapItem *)location title:(NSString *)title subtitle:(NSString *)subtitle summary:(NSString *)summary detailTitle:(NSString *)detailTitle detailSubtitle:(NSString *)detailSubtitle detailSummary:(NSString *)detailSummary pinImage:(UIImage *)pinImage
{
  return [(CPPointOfInterest *)self initWithLocation:location title:title subtitle:subtitle summary:summary detailTitle:detailTitle detailSubtitle:detailSubtitle detailSummary:detailSummary pinImage:pinImage selectedPinImage:pinImage];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPointOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPPointOfInterest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestLocation"];
    location = v5->_location;
    v5->_location = (MKMapItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestSubtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestSummaryKey"];
    summary = v5->_summary;
    v5->_summary = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestMapMarkerKey"];
    pinImageSet = v5->_pinImageSet;
    v5->_pinImageSet = (CPImageSet *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestSelectedMapMarkerKey"];
    selectedPinImageSet = v5->_selectedPinImageSet;
    v5->_selectedPinImageSet = (CPImageSet *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestDetailTitleKey"];
    detailTitle = v5->_detailTitle;
    v5->_detailTitle = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestDetailSubtitleKey"];
    detailSubtitle = v5->_detailSubtitle;
    v5->_detailSubtitle = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestDetailSummaryKey"];
    detailSummary = v5->_detailSummary;
    v5->_detailSummary = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestDetailPrimaryButtonKey"];
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (CPTextButton *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPPointOfInterestDetailSecondayButtonKey"];
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (CPTextButton *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPPointOfInterestIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPPointOfInterest *)self location];
  [v4 encodeObject:v5 forKey:@"CPPointOfInterestLocation"];

  uint64_t v6 = [(CPPointOfInterest *)self title];
  [v4 encodeObject:v6 forKey:@"CPPointOfInterestTitle"];

  v7 = [(CPPointOfInterest *)self subtitle];
  [v4 encodeObject:v7 forKey:@"CPPointOfInterestSubtitle"];

  uint64_t v8 = [(CPPointOfInterest *)self summary];
  [v4 encodeObject:v8 forKey:@"CPPointOfInterestSummaryKey"];

  v9 = [(CPPointOfInterest *)self pinImageSet];
  [v4 encodeObject:v9 forKey:@"CPPointOfInterestMapMarkerKey"];

  uint64_t v10 = [(CPPointOfInterest *)self selectedPinImageSet];
  [v4 encodeObject:v10 forKey:@"CPPointOfInterestSelectedMapMarkerKey"];

  v11 = [(CPPointOfInterest *)self detailTitle];
  [v4 encodeObject:v11 forKey:@"CPPointOfInterestDetailTitleKey"];

  uint64_t v12 = [(CPPointOfInterest *)self detailSubtitle];
  [v4 encodeObject:v12 forKey:@"CPPointOfInterestDetailSubtitleKey"];

  v13 = [(CPPointOfInterest *)self detailSummary];
  [v4 encodeObject:v13 forKey:@"CPPointOfInterestDetailSummaryKey"];

  uint64_t v14 = [(CPPointOfInterest *)self primaryButton];
  [v4 encodeObject:v14 forKey:@"CPPointOfInterestDetailPrimaryButtonKey"];

  v15 = [(CPPointOfInterest *)self secondaryButton];
  [v4 encodeObject:v15 forKey:@"CPPointOfInterestDetailSecondayButtonKey"];

  id v16 = [(CPPointOfInterest *)self identifier];
  [v4 encodeObject:v16 forKey:@"kCPPointOfInterestIdentifierKey"];
}

- (void)setPinImage:(UIImage *)pinImage
{
  id v4 = pinImage;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__CPPointOfInterest_setPinImage___block_invoke;
    v8[3] = &unk_26430A8C0;
    v8[4] = self;
    uint64_t v6 = [(CPImageSet *)v5 initWithImage:v4 treatmentBlock:v8];
    pinImageSet = self->_pinImageSet;
    self->_pinImageSet = v6;
  }
  else
  {
    pinImageSet = self->_pinImageSet;
    self->_pinImageSet = 0;
  }
}

id __33__CPPointOfInterest_setPinImage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() pinImageSize];
  v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (UIImage)pinImage
{
  id v2 = [(CPPointOfInterest *)self pinImageSet];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setSelectedPinImage:(UIImage *)selectedPinImage
{
  double v4 = selectedPinImage;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__CPPointOfInterest_setSelectedPinImage___block_invoke;
    v8[3] = &unk_26430A8C0;
    v8[4] = self;
    uint64_t v6 = [(CPImageSet *)v5 initWithImage:v4 treatmentBlock:v8];
    selectedPinImageSet = self->_selectedPinImageSet;
    self->_selectedPinImageSet = v6;
  }
  else
  {
    selectedPinImageSet = self->_selectedPinImageSet;
    self->_selectedPinImageSet = 0;
  }
}

id __41__CPPointOfInterest_setSelectedPinImage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() selectedPinImageSize];
  v5 = CPImageByScalingImageToSize(v2, v3, v4);

  return v5;
}

- (UIImage)selectedPinImage
{
  id v2 = [(CPPointOfInterest *)self selectedPinImageSet];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CPPointOfInterest *)self isEqualToPointOfInterest:v4];

  return v5;
}

- (BOOL)isEqualToPointOfInterest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPPointOfInterest *)self identifier];
  uint64_t v6 = [v4 identifier];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [(CPPointOfInterest *)self title];
  v9 = [v4 title];
  int v10 = [v8 isEqual:v9];

  if (!v10) {
    goto LABEL_10;
  }
  v11 = [(CPPointOfInterest *)self subtitle];
  uint64_t v12 = [v4 subtitle];
  int v13 = [v11 isEqual:v12];

  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = [(CPPointOfInterest *)self summary];
  v15 = [v4 summary];
  int v16 = [v14 isEqual:v15];

  if (!v16) {
    goto LABEL_10;
  }
  v17 = [(CPPointOfInterest *)self detailTitle];
  uint64_t v18 = [v4 detailTitle];
  int v19 = [v17 isEqual:v18];

  if (!v19) {
    goto LABEL_10;
  }
  uint64_t v20 = [(CPPointOfInterest *)self detailSubtitle];
  v21 = [v4 detailSubtitle];
  int v22 = [v20 isEqual:v21];

  if (!v22) {
    goto LABEL_10;
  }
  v23 = [(CPPointOfInterest *)self detailSummary];
  uint64_t v24 = [v4 detailSummary];
  int v25 = [v23 isEqual:v24];

  if (!v25) {
    goto LABEL_10;
  }
  uint64_t v26 = [(CPPointOfInterest *)self pinImageSet];
  uint64_t v27 = [v4 pinImageSet];
  int v28 = [v26 isEqual:v27];

  if (v28)
  {
    uint64_t v29 = [(CPPointOfInterest *)self location];
    v30 = [v4 location];
    char v31 = [v29 isEqual:v30];
  }
  else
  {
LABEL_10:
    char v31 = 0;
  }

  return v31;
}

- (MKMapItem)location
{
  return self->_location;
}

- (void)setLocation:(MKMapItem *)location
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(NSString *)detailTitle
{
}

- (NSString)detailSubtitle
{
  return self->_detailSubtitle;
}

- (void)setDetailSubtitle:(NSString *)detailSubtitle
{
}

- (NSString)detailSummary
{
  return self->_detailSummary;
}

- (void)setDetailSummary:(NSString *)detailSummary
{
}

- (CPTextButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(CPTextButton *)primaryButton
{
}

- (CPTextButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(CPTextButton *)secondaryButton
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPImageSet)pinImageSet
{
  return self->_pinImageSet;
}

- (void)setPinImageSet:(id)a3
{
}

- (CPImageSet)selectedPinImageSet
{
  return self->_selectedPinImageSet;
}

- (void)setSelectedPinImageSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPinImageSet, 0);
  objc_storeStrong((id *)&self->_pinImageSet, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailSummary, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end