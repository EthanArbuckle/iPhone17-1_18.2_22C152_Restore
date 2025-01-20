@interface MUPlaceItemHeaderViewModel
- (BOOL)hasEnclosingPlace;
- (BOOL)hasInitialData;
- (BOOL)isUserSpecificPlaceItem;
- (BOOL)showNearbyStringForContactPlaceItem;
- (BOOL)supportsContactAddressDescription;
- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3;
- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 imageManager:(id)a4;
- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 imageManager:(id)a4 isDeveloperPlaceCard:(BOOL)a5 developerPlaceCardAuditToken:(id)a6;
- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 isDeveloperPlaceCard:(BOOL)a4 developerPlaceCardAuditToken:(id)a5;
- (id)_formattedDistanceString;
- (id)_userSpecificPlaceSecondaryName;
- (id)addressDescriptionForContact;
- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5;
- (id)placeName;
- (id)placeSecondaryName;
- (id)transitLabelItems;
@end

@implementation MUPlaceItemHeaderViewModel

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 imageManager:(id)a4 isDeveloperPlaceCard:(BOOL)a5 developerPlaceCardAuditToken:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a6;
  id v13 = a4;
  v14 = [v11 mapItem];
  v17.receiver = self;
  v17.super_class = (Class)MUPlaceItemHeaderViewModel;
  v15 = [(MUPlaceHeaderViewModel *)&v17 initWithMapItem:v14 imageManager:v13 isDeveloperPlaceCard:v7 developerPlaceCardAuditToken:v12];

  if (v15) {
    objc_storeStrong((id *)&v15->_placeItem, a3);
  }

  return v15;
}

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F30E38];
  id v5 = a3;
  v6 = [v4 sharedImageManager];
  BOOL v7 = [(MUPlaceItemHeaderViewModel *)self initWithPlaceItem:v5 imageManager:v6 isDeveloperPlaceCard:0 developerPlaceCardAuditToken:0];

  return v7;
}

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 imageManager:(id)a4
{
  return [(MUPlaceItemHeaderViewModel *)self initWithPlaceItem:a3 imageManager:a4 isDeveloperPlaceCard:0 developerPlaceCardAuditToken:0];
}

- (MUPlaceItemHeaderViewModel)initWithPlaceItem:(id)a3 isDeveloperPlaceCard:(BOOL)a4 developerPlaceCardAuditToken:(id)a5
{
  BOOL v5 = a4;
  v8 = (void *)MEMORY[0x1E4F30E38];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 sharedImageManagerWithAuditToken:v9];
  id v12 = [(MUPlaceItemHeaderViewModel *)self initWithPlaceItem:v10 imageManager:v11 isDeveloperPlaceCard:v5 developerPlaceCardAuditToken:v9];

  return v12;
}

- (BOOL)hasInitialData
{
  if ([(MUPlaceItemHeaderViewModel *)self isUserSpecificPlaceItem]) {
    return 1;
  }
  if ([(MUPlaceItemHeaderViewModel *)self showNearbyStringForContactPlaceItem]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceItemHeaderViewModel;
  return [(MUPlaceHeaderViewModel *)&v4 hasInitialData];
}

- (id)placeName
{
  return (id)[(_MKPlaceItem *)self->_placeItem name];
}

- (id)placeSecondaryName
{
  if (![(MUPlaceItemHeaderViewModel *)self isUserSpecificPlaceItem])
  {
    if (![(MUPlaceItemHeaderViewModel *)self showNearbyStringForContactPlaceItem])
    {
      v15.receiver = self;
      v15.super_class = (Class)MUPlaceItemHeaderViewModel;
      uint64_t v3 = [(MUPlaceHeaderViewModel *)&v15 placeSecondaryName];
      goto LABEL_16;
    }
    if (!MapsFeature_IsEnabled_MapsWally()
      || ![(_MKPlaceItem *)self->_placeItem representsPerson])
    {
LABEL_15:
      uint64_t v3 = [(MUPlaceItemHeaderViewModel *)self _formattedDistanceString];
      goto LABEL_16;
    }
    objc_super v4 = [(_MKPlaceItem *)self->_placeItem contact];
    BOOL v5 = [v4 postalAddresses];
    v6 = [v5 firstObject];

    int v7 = objc_msgSend(v4, "_mapkit_isSharedLocationContact");
    v8 = [(MUPlaceItemHeaderViewModel *)self _formattedDistanceString];
    id v9 = [v6 value];
    id v10 = [v9 street];

    if (v7)
    {
      id v11 = _MULocalizedStringFromThisBundle(@"Contact Shared Address [Placecard]");
      if (![v10 length])
      {
        id v12 = v8;
LABEL_12:
        id v9 = v12;
        int v13 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      id v11 = _MULocalizedStringFromThisBundle(@"Contact Address [Placecard]");
      if (![v10 length])
      {
        int v13 = 1;
LABEL_14:

        if (!v13) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", v11, v10, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  uint64_t v3 = [(MUPlaceItemHeaderViewModel *)self _userSpecificPlaceSecondaryName];
LABEL_16:
  id v9 = (void *)v3;
LABEL_17:
  return v9;
}

- (id)addressDescriptionForContact
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (MapsFeature_IsEnabled_MapsWally()
    && [(_MKPlaceItem *)self->_placeItem representsPerson])
  {
    uint64_t v3 = self->_placeItem;
    objc_super v4 = [(_MKPlaceItem *)v3 contact];
    BOOL v5 = [v4 postalAddresses];
    v6 = [v5 firstObject];

    if (objc_msgSend(v4, "_mapkit_isSharedLocationContact"))
    {
      int v7 = 0;
LABEL_14:

      goto LABEL_17;
    }
    v8 = [v6 label];
    char v9 = [v8 isEqual:*MEMORY[0x1E4F1B6F8]];

    if (v9)
    {
      id v10 = @"Contact Home Address [Placecard]";
    }
    else
    {
      id v11 = [v6 label];
      char v12 = [v11 isEqual:*MEMORY[0x1E4F1B770]];

      if (v12)
      {
        id v10 = @"Contact Work Address [Placecard]";
      }
      else
      {
        int v13 = [v6 label];
        int v14 = [v13 isEqual:*MEMORY[0x1E4F1B760]];

        if (v14) {
          id v10 = @"Contact School Address [Placecard]";
        }
        else {
          id v10 = @"Contact Other Address [Placecard]";
        }
      }
    }
    uint64_t v15 = _MULocalizedStringFromThisBundle(v10);
    if (v15)
    {
      v16 = (void *)v15;
      objc_super v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15];
      v22[0] = *MEMORY[0x1E4FB06F8];
      v18 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] weight:*MEMORY[0x1E4FB09E0]];
      v23[0] = v18;
      v22[1] = *MEMORY[0x1E4FB0700];
      v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v23[1] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      objc_msgSend(v17, "addAttributes:range:", v20, 0, objc_msgSend(v17, "length"));

      int v7 = (void *)[v17 copy];
      goto LABEL_14;
    }
  }
  int v7 = 0;
LABEL_17:
  return v7;
}

- (id)_userSpecificPlaceSecondaryName
{
  if ([(_MKPlaceItem *)self->_placeItem options])
  {
    BOOL v5 = _MULocalizedStringFromThisBundle(@"NEAR_BY_PLACE_HEADER_STRING");
    char v12 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
    int v13 = [v12 isAuthorizedForPreciseLocation];

    int v14 = [(_MKPlaceItem *)self->_placeItem mapItem];
    uint64_t v15 = [v14 _geoAddress];
    v16 = [v15 structuredAddress];
    objc_super v17 = v16;
    if (v13)
    {
      v18 = [v16 fullThoroughfare];

      if ([v18 length])
      {
        objc_msgSend(NSString, "stringWithFormat:", v5, v18);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v18 = [v16 locality];

      if ([v18 length])
      {
        objc_msgSend(NSString, "stringWithFormat:", v5, v18);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v19 = [(_MKPlaceItem *)self->_placeItem mapItem];
        v20 = [v19 _geoAddress];
        v21 = [v20 structuredAddress];
        v22 = [v21 administrativeAreaCode];

        if ([v22 length])
        {
          uint64_t v23 = [(__CFString *)v11 stringByAppendingFormat:@", %@", v22];

          id v11 = (__CFString *)v23;
        }

        goto LABEL_16;
      }
    }
    id v11 = &stru_1EE3BF360;
    goto LABEL_16;
  }
  if (([(_MKPlaceItem *)self->_placeItem options] & 2) == 0
    || ([(_MKPlaceItem *)self->_placeItem secondaryName],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        !v4))
  {
    id v11 = [(MUPlaceItemHeaderViewModel *)self _formattedDistanceString];
    goto LABEL_18;
  }
  BOOL v5 = [(MUPlaceItemHeaderViewModel *)self _formattedDistanceString];
  if ([v5 length])
  {
    v6 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    uint64_t v7 = [v6 layoutDirection];

    v8 = NSString;
    if (v7 == 1)
    {
      char v9 = _MULocalizedStringFromThisBundle(@"Delimiter");
      id v10 = [(_MKPlaceItem *)self->_placeItem secondaryName];
      id v11 = [v8 localizedStringWithFormat:@"%@%@%@", v5, v9, v10];
    }
    else
    {
      v25 = [(_MKPlaceItem *)self->_placeItem secondaryName];
      v26 = _MULocalizedStringFromThisBundle(@"Delimiter");
      id v11 = [v8 localizedStringWithFormat:@"%@%@%@", v25, v26, v5];
    }
  }
  else
  {
    id v11 = v5;
  }
LABEL_17:

LABEL_18:
  return v11;
}

- (BOOL)hasEnclosingPlace
{
  if ([(MUPlaceItemHeaderViewModel *)self isUserSpecificPlaceItem]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceItemHeaderViewModel;
  return [(MUPlaceHeaderViewModel *)&v4 hasEnclosingPlace];
}

- (BOOL)isUserSpecificPlaceItem
{
  return [(_MKPlaceItem *)self->_placeItem options] != 0;
}

- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MUPlaceItemHeaderViewModel *)self isUserSpecificPlaceItem])
  {
    id v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceItemHeaderViewModel;
    id v11 = [(MUPlaceHeaderViewModel *)&v13 enclosingPlaceAttributedStringWithFont:v8 labelColor:v9 tokenColor:v10];
  }

  return v11;
}

- (id)_formattedDistanceString
{
  uint64_t v3 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
  objc_super v4 = [v3 lastLocation];

  if (!v4) {
    goto LABEL_10;
  }
  [v4 coordinate];
  uint64_t v7 = 0;
  if (v6 < -180.0 || v6 > 180.0 || v5 < -90.0 || v5 > 90.0) {
    goto LABEL_11;
  }
  id v8 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
  int v9 = [v8 isAuthorizedForPreciseLocation];

  if (!v9)
  {
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  [v4 coordinate];
  id v10 = [(_MKPlaceItem *)self->_placeItem mapItem];
  [v10 _coordinate];
  GEOCalculateDistance();
  double v12 = v11;

  if (!self->_distanceFormatter)
  {
    objc_super v13 = (MKDistanceFormatter *)objc_alloc_init(MEMORY[0x1E4F30E88]);
    distanceFormatter = self->_distanceFormatter;
    self->_distanceFormatter = v13;

    [(MKDistanceFormatter *)self->_distanceFormatter setUnitStyle:1];
  }
  uint64_t v15 = _MULocalizedStringFromThisBundle(@"[distance] away");
  v16 = [(MKDistanceFormatter *)self->_distanceFormatter stringFromDistance:v12];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", v15, v16);

LABEL_11:
  return v7;
}

- (id)transitLabelItems
{
  if ([(MUPlaceItemHeaderViewModel *)self isUserSpecificPlaceItem])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MUPlaceItemHeaderViewModel;
    uint64_t v3 = [(MUPlaceHeaderViewModel *)&v5 transitLabelItems];
  }
  return v3;
}

- (BOOL)showNearbyStringForContactPlaceItem
{
  return [(_MKPlaceItem *)self->_placeItem representsPerson];
}

- (BOOL)supportsContactAddressDescription
{
  int IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally();
  if (IsEnabled_MapsWally)
  {
    placeItem = self->_placeItem;
    LOBYTE(IsEnabled_MapsWally) = [(_MKPlaceItem *)placeItem representsPerson];
  }
  return IsEnabled_MapsWally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceFormatter, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end