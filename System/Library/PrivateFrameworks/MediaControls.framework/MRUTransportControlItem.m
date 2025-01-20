@interface MRUTransportControlItem
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsHolding;
- (MRUAsset)asset;
- (MRUTransportControlItem)initWithIdentifier:(id)a3 asset:(id)a4 mainAction:(id)a5;
- (MRUTransportControlItem)initWithIdentifier:(id)a3 asset:(id)a4 mainAction:(id)a5 holdBeganAction:(id)a6 holdEndAction:(id)a7;
- (NSString)identifier;
- (id)description;
- (id)holdBeganAction;
- (id)holdEndAction;
- (id)mainAction;
@end

@implementation MRUTransportControlItem

- (MRUTransportControlItem)initWithIdentifier:(id)a3 asset:(id)a4 mainAction:(id)a5
{
  return [(MRUTransportControlItem *)self initWithIdentifier:a3 asset:a4 mainAction:a5 holdBeganAction:0 holdEndAction:0];
}

- (MRUTransportControlItem)initWithIdentifier:(id)a3 asset:(id)a4 mainAction:(id)a5 holdBeganAction:(id)a6 holdEndAction:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MRUTransportControlItem;
  v18 = [(MRUTransportControlItem *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_asset, a4);
    v20 = _Block_copy(v15);
    id mainAction = v19->_mainAction;
    v19->_id mainAction = v20;

    v22 = _Block_copy(v16);
    id holdBeganAction = v19->_holdBeganAction;
    v19->_id holdBeganAction = v22;

    v24 = _Block_copy(v17);
    id holdEndAction = v19->_holdEndAction;
    v19->_id holdEndAction = v24;
  }
  return v19;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  identifier = self->_identifier;
  asset = self->_asset;
  if ([(MRUTransportControlItem *)self isEnabled]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(MRUTransportControlItem *)self supportsHolding]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"%@ identifier: %@ | asset: %@ | enabled: %@ | holding: %@", v4, identifier, asset, v7, v8];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRUTransportControlItem *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MRUTransportControlItem *)v5 identifier];
      v7 = v6;
      if (v6 == self->_identifier) {
        int v8 = 1;
      }
      else {
        int v8 = -[NSString isEqual:](v6, "isEqual:");
      }

      uint64_t v10 = [(MRUTransportControlItem *)v5 asset];
      int v11 = v8 & [(id)v10 isEqual:self->_asset];

      BOOL v12 = [(MRUTransportControlItem *)v5 isEnabled];
      LODWORD(v10) = v12 ^ [(MRUTransportControlItem *)self isEnabled];
      BOOL v13 = [(MRUTransportControlItem *)v5 supportsHolding];

      int v9 = v11 & ((v10 | v13 ^ [(MRUTransportControlItem *)self supportsHolding]) ^ 1);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isEnabled
{
  return self->_mainAction != 0;
}

- (BOOL)supportsHolding
{
  return self->_holdBeganAction && self->_holdEndAction != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (id)mainAction
{
  return self->_mainAction;
}

- (id)holdBeganAction
{
  return self->_holdBeganAction;
}

- (id)holdEndAction
{
  return self->_holdEndAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_holdEndAction, 0);
  objc_storeStrong(&self->_holdBeganAction, 0);
  objc_storeStrong(&self->_mainAction, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end