@interface MKPlaceActionItemAppearanceProvider
- (BOOL)_isDestructiveForMenu;
- (BOOL)_isDestructiveForTableCell;
- (BOOL)isDestructiveForDisplayStyle:(unint64_t)a3;
- (MKPlaceActionItemAppearanceProvider)initWithActionType:(unint64_t)a3 dataProvider:(id)a4;
- (id)_compactTitle;
- (id)_longTitle;
- (id)_menuSymbol;
- (id)_tableCellSymbol;
- (id)bestSymbolNameForDisplayStyle:(unint64_t)a3;
- (id)bestTitleForDisplayStyle:(unint64_t)a3;
@end

@implementation MKPlaceActionItemAppearanceProvider

- (MKPlaceActionItemAppearanceProvider)initWithActionType:(unint64_t)a3 dataProvider:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKPlaceActionItemAppearanceProvider;
  v7 = [(MKPlaceActionItemAppearanceProvider *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_actionType = a3;
    objc_storeWeak((id *)&v7->_dataProvider, v6);
    v8->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
  }

  return v8;
}

- (id)bestTitleForDisplayStyle:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = [(MKPlaceActionItemAppearanceProvider *)self _compactTitle];
      if ([v4 length])
      {
        id v5 = v4;
      }
      else
      {
        id v5 = [(MKPlaceActionItemAppearanceProvider *)self _longTitle];
      }
      id v6 = v5;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(MKPlaceActionItemAppearanceProvider *)self _longTitle];
  }

  return v6;
}

- (id)_longTitle
{
  v2 = 0;
  switch(self->_actionType)
  {
    case 1uLL:
      v4 = @"Report an Issue [Button Title]";
      goto LABEL_41;
    case 2uLL:
      if (GEOConfigGetBOOL()) {
        v4 = @"[Report an Issue] Report Something Missing";
      }
      else {
        v4 = @"[Report an Issue] Add to Maps";
      }
      goto LABEL_41;
    case 4uLL:
      v4 = @"Create New Contact";
      goto LABEL_41;
    case 5uLL:
      v4 = @"Save to [Footer action]";
      goto LABEL_41;
    case 6uLL:
      v4 = @"Remove from Guide [Footer action]";
      goto LABEL_41;
    case 9uLL:
      v4 = @"Add Photos";
      goto LABEL_41;
    case 0xAuLL:
      v4 = @"Call";
      goto LABEL_41;
    case 0xBuLL:
      v4 = @"Message";
      goto LABEL_41;
    case 0xDuLL:
      v4 = @"Website";
      goto LABEL_41;
    case 0x10uLL:
      v4 = @"Share_Action_Row";
      goto LABEL_41;
    case 0x11uLL:
      v4 = @"Flyover [Placecard]";
      goto LABEL_41;
    case 0x12uLL:
      v4 = @"Add to Existing Contact";
      goto LABEL_41;
    case 0x13uLL:
      v4 = @"Remove";
      goto LABEL_41;
    case 0x14uLL:
      v4 = @"Stores_Action_Row";
      goto LABEL_41;
    case 0x15uLL:
      v4 = @"Add to Guides [Footer action]";
      goto LABEL_41;
    case 0x16uLL:
      if (self->_myPlacesEnabled) {
        v4 = @"Pin_Actions_Row";
      }
      else {
        v4 = @"Add_Shortcut_Actions_Row";
      }
      goto LABEL_41;
    case 0x17uLL:
      if (self->_myPlacesEnabled) {
        v4 = @"UnPin_Actions_Row";
      }
      else {
        v4 = @"Remove_Shortcut_Actions_Row";
      }
      goto LABEL_41;
    case 0x18uLL:
      v4 = @"Refine Location";
      goto LABEL_41;
    case 0x19uLL:
      v4 = @"Change Address";
      goto LABEL_41;
    case 0x1BuLL:
      v4 = @"Copy Coordinates";
      goto LABEL_41;
    case 0x1CuLL:
      v4 = @"Mark_Location_Action_Row";
      goto LABEL_41;
    case 0x1DuLL:
      v4 = @"Copy Link";
      goto LABEL_41;
    case 0x1FuLL:
      v4 = @"Claim This Place [Placecard]";
      goto LABEL_41;
    case 0x22uLL:
      uint64_t v5 = _MKLocalizedStringFromThisBundleFromTable(@"Download_Map_Action_Row_Long", @"Offline");
      goto LABEL_42;
    case 0x25uLL:
      v4 = @"Add to Library [Placecard]";
      goto LABEL_41;
    case 0x26uLL:
      v4 = @"Delete from Library [Placecard]";
      goto LABEL_41;
    case 0x27uLL:
      v4 = @"Add a Note [Placecard]";
      goto LABEL_41;
    case 0x28uLL:
      v4 = @"Edit Note [Placecard]";
      goto LABEL_41;
    case 0x29uLL:
      v4 = @"Create a Custom Route [Placecard]";
LABEL_41:
      uint64_t v5 = _MKLocalizedStringFromThisBundle(v4);
LABEL_42:
      v2 = (__CFString *)v5;
      break;
    case 0x2AuLL:
      v2 = @"Simulate Location";
      break;
    case 0x2BuLL:
      id v6 = NSString;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
      objc_msgSend(v6, "stringWithFormat:", @"Identifier: %llu", objc_msgSend(WeakRetained, "placeMUIDForAppearance:", self));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 0x2CuLL:
      v2 = @"Save MapItem";
      break;
    case 0x2DuLL:
      v2 = @"Clear MapItem";
      break;
    default:
      break;
  }

  return v2;
}

- (id)bestSymbolNameForDisplayStyle:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v3 = [(MKPlaceActionItemAppearanceProvider *)self _menuSymbol];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [(MKPlaceActionItemAppearanceProvider *)self _tableCellSymbol];
  }

  return v3;
}

- (id)_tableCellSymbol
{
  BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 0;
  switch(self->_actionType)
  {
    case 1uLL:
      uint64_t v5 = @"exclamationmark.bubble.fill";
      id v6 = @"exclamationmark.bubble";
      goto LABEL_29;
    case 2uLL:
      v4 = @"pin.point.of.interest.badge.plus.fill";
      goto LABEL_32;
    case 4uLL:
      v4 = @"person.crop.circle";
      goto LABEL_32;
    case 5uLL:
      goto LABEL_23;
    case 6uLL:
      uint64_t v5 = @"star.slash.fill";
      id v6 = @"star.slash";
      goto LABEL_29;
    case 9uLL:
      v4 = @"camera.fill";
      goto LABEL_32;
    case 0xAuLL:
      uint64_t v5 = @"phone.fill";
      id v6 = @"phone";
      goto LABEL_29;
    case 0xBuLL:
      uint64_t v5 = @"message.fill";
      id v6 = @"message";
      goto LABEL_29;
    case 0xDuLL:
      uint64_t v5 = @"safari.fill";
      id v6 = @"safari";
      goto LABEL_29;
    case 0x10uLL:
      v4 = @"square.and.arrow.up";
      goto LABEL_32;
    case 0x11uLL:
      v4 = @"buildings.3d";
      goto LABEL_32;
    case 0x12uLL:
      v4 = @"person.crop.circle.badge.plus";
      goto LABEL_32;
    case 0x13uLL:
      uint64_t v5 = @"trash.fill";
      id v6 = @"trash";
      goto LABEL_29;
    case 0x14uLL:
    case 0x1CuLL:
      v4 = @"mappin";
      goto LABEL_32;
    case 0x15uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
      int v8 = [WeakRetained placeInCollectionsForAppearance:self];

      if (v8)
      {
        uint64_t v5 = @"checkmark.square.fill";
        id v6 = @"checkmark.square";
      }
      else
      {
        uint64_t v5 = @"plus.square.fill";
        id v6 = @"plus.square";
      }
      goto LABEL_29;
    case 0x16uLL:
      if (self->_myPlacesEnabled)
      {
        v4 = @"pin";
      }
      else
      {
LABEL_23:
        uint64_t v5 = @"star.fill";
        id v6 = @"star";
LABEL_29:
        if (IsMacCatalyst) {
          uint64_t v5 = v6;
        }
LABEL_31:
        v4 = v5;
      }
LABEL_32:
      return v4;
    case 0x17uLL:
      if (self->_myPlacesEnabled) {
        uint64_t v5 = @"pin.slash";
      }
      else {
        uint64_t v5 = @"star.slash";
      }
      goto LABEL_31;
    case 0x18uLL:
      v4 = @"mappin.and.ellipse";
      goto LABEL_32;
    case 0x19uLL:
      v4 = @"pencil";
      goto LABEL_32;
    case 0x1FuLL:
      uint64_t v5 = @"checkmark.seal.fill";
      id v6 = @"checkmark.seal";
      goto LABEL_29;
    case 0x22uLL:
      v4 = @"arrow.down.circle";
      goto LABEL_32;
    case 0x2AuLL:
      uint64_t v5 = @"location.fill";
      id v6 = @"location";
      goto LABEL_29;
    default:
      goto LABEL_32;
  }
}

- (id)_menuSymbol
{
  BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 0;
  switch(self->_actionType)
  {
    case 1uLL:
      v4 = @"exclamationmark.bubble";
      break;
    case 2uLL:
      v4 = @"pin.point.of.interest.badge.plus";
      break;
    case 4uLL:
      v4 = @"person.crop.circle";
      break;
    case 5uLL:
      v4 = @"star";
      break;
    case 6uLL:
      v4 = @"star.slash";
      break;
    case 9uLL:
      v4 = @"camera";
      break;
    case 0xAuLL:
      v4 = @"phone";
      break;
    case 0xBuLL:
      v4 = @"message";
      break;
    case 0xDuLL:
      v4 = @"safari";
      break;
    case 0x10uLL:
      v4 = @"square.and.arrow.up";
      break;
    case 0x11uLL:
      v4 = @"buildings.3d";
      break;
    case 0x12uLL:
      v4 = @"person.crop.circle.badge.plus";
      break;
    case 0x13uLL:
    case 0x26uLL:
      v4 = @"trash";
      break;
    case 0x14uLL:
    case 0x1CuLL:
      v4 = @"mappin";
      break;
    case 0x15uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
      int v6 = [WeakRetained placeInCollectionsForAppearance:self];

      v4 = @"plus.square";
      if (v6)
      {
        v7 = @"checkmark.square";
        if (!IsMacCatalyst) {
          v7 = @"plus.square";
        }
        goto LABEL_26;
      }
      break;
    case 0x16uLL:
      BOOL myPlacesEnabled = self->_myPlacesEnabled;
      v9 = @"pin";
      objc_super v10 = @"star";
      goto LABEL_23;
    case 0x17uLL:
      BOOL myPlacesEnabled = self->_myPlacesEnabled;
      v9 = @"pin.slash";
      objc_super v10 = @"star.slash";
LABEL_23:
      if (myPlacesEnabled) {
        v7 = v9;
      }
      else {
        v7 = v10;
      }
LABEL_26:
      v4 = v7;
      break;
    case 0x18uLL:
      v4 = @"mappin.and.ellipse";
      break;
    case 0x19uLL:
    case 0x28uLL:
      v4 = @"pencil";
      break;
    case 0x1FuLL:
      v4 = @"checkmark.seal";
      break;
    case 0x22uLL:
      v4 = @"arrow.down.circle";
      break;
    case 0x25uLL:
      v4 = @"plus";
      break;
    case 0x27uLL:
      v4 = @"note.text.badge.plus";
      break;
    case 0x29uLL:
      v4 = @"location.bottomleft.forward.to.point.topright.scurvepath.dashed";
      break;
    case 0x2AuLL:
      v4 = @"location";
      break;
    default:
      break;
  }

  return v4;
}

- (id)_compactTitle
{
  v3 = 0;
  switch(self->_actionType)
  {
    case 0xAuLL:
      v4 = @"Call";
      goto LABEL_11;
    case 0xBuLL:
      v4 = @"Message";
      goto LABEL_11;
    case 0xDuLL:
      v4 = @"Website";
      goto LABEL_11;
    case 0x10uLL:
      v4 = @"Share_Action_Row";
      goto LABEL_11;
    case 0x11uLL:
      v4 = @"Flyover [Placecard]";
      goto LABEL_11;
    case 0x14uLL:
      v4 = @"Stores_Action_Row";
      goto LABEL_11;
    case 0x15uLL:
      v4 = @"Save_Collection_Actions_Row";
      goto LABEL_11;
    case 0x1CuLL:
      v4 = @"Mark_Location_Action_Row";
      goto LABEL_11;
    case 0x1FuLL:
      v4 = @"Claim [Placecard Action Row]";
LABEL_11:
      v3 = _MKLocalizedStringFromThisBundle(v4);
      break;
    case 0x22uLL:
      v3 = _MKLocalizedStringFromThisBundleFromTable(@"Download_Map_Action_Row_Short", @"Offline");
      break;
    default:
      break;
  }

  return v3;
}

- (BOOL)isDestructiveForDisplayStyle:(unint64_t)a3
{
  if (a3 == 1) {
    return [(MKPlaceActionItemAppearanceProvider *)self _isDestructiveForMenu];
  }
  if (a3) {
    return 0;
  }
  return [(MKPlaceActionItemAppearanceProvider *)self _isDestructiveForTableCell];
}

- (BOOL)_isDestructiveForTableCell
{
  return (self->_actionType < 0x27) & (0x4000880000uLL >> self->_actionType);
}

- (BOOL)_isDestructiveForMenu
{
  unint64_t actionType = self->_actionType;
  return actionType == 19 || actionType == 38;
}

- (void).cxx_destruct
{
}

@end