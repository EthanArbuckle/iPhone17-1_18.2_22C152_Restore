@interface CPSBannerItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBannerItem:(id)a3;
- (BOOL)isManeuverItem;
- (CPImageSet)imageSet;
- (CPSBannerItem)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 textVariants:(id)a5 detailTextVariants:(id)a6 attributedDetailTextVariants:(id)a7 imageSet:(id)a8 isManeuverItem:(BOOL)a9;
- (NSArray)attributedDetailTextVariants;
- (NSArray)detailTextVariants;
- (NSArray)textVariants;
- (NSString)bundleIdentifier;
- (NSUUID)identifier;
- (id)description;
- (void)setBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CPSBannerItem

- (CPSBannerItem)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 textVariants:(id)a5 detailTextVariants:(id)a6 attributedDetailTextVariants:(id)a7 imageSet:(id)a8 isManeuverItem:(BOOL)a9
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = 0;
  objc_storeStrong(&v29, a6);
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = 0;
  objc_storeStrong(&v27, a8);
  BOOL v26 = a9;
  v9 = v33;
  v33 = 0;
  v25.receiver = v9;
  v25.super_class = (Class)CPSBannerItem;
  v33 = [(CPSBannerItem *)&v25 init];
  objc_storeStrong((id *)&v33, v33);
  if (v33)
  {
    objc_storeStrong((id *)&v33->_identifier, location[0]);
    uint64_t v10 = [v31 copy];
    bundleIdentifier = v33->_bundleIdentifier;
    v33->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v30 copy];
    textVariants = v33->_textVariants;
    v33->_textVariants = (NSArray *)v12;

    uint64_t v14 = [v29 copy];
    detailTextVariants = v33->_detailTextVariants;
    v33->_detailTextVariants = (NSArray *)v14;

    uint64_t v16 = [v28 copy];
    attributedDetailTextVariants = v33->_attributedDetailTextVariants;
    v33->_attributedDetailTextVariants = (NSArray *)v16;

    objc_storeStrong((id *)&v33->_imageSet, v27);
    v33->_isManeuverItem = v26;
  }
  v19 = v33;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v33, 0);
  return v19;
}

- (BOOL)isEqualToBannerItem:(id)a3
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = [(CPSBannerItem *)v49 textVariants];
  char v46 = 0;
  char v44 = 0;
  char v42 = 0;
  char v40 = 0;
  char v38 = 0;
  if (v13
    || (v47 = (id)[location[0] textVariants], v46 = 1, char v12 = 1, v47))
  {
    v45 = [(CPSBannerItem *)v49 textVariants];
    char v44 = 1;
    char v11 = 0;
    if (v45)
    {
      id v43 = (id)[location[0] textVariants];
      char v42 = 1;
      char v11 = 0;
      if (v43)
      {
        v41 = [(CPSBannerItem *)v49 textVariants];
        char v40 = 1;
        id v39 = (id)[location[0] textVariants];
        char v38 = 1;
        char v11 = -[NSArray isEqualToArray:](v41, "isEqualToArray:");
      }
    }
    char v12 = v11;
  }
  if (v38) {

  }
  if (v40) {
  if (v42)
  }

  if (v44) {
  if (v46)
  }

  uint64_t v10 = [(CPSBannerItem *)v49 detailTextVariants];
  char v36 = 0;
  char v34 = 0;
  char v32 = 0;
  char v30 = 0;
  char v28 = 0;
  if (v10
    || (id v37 = (id)[location[0] detailTextVariants],
        char v36 = 1,
        char v9 = 1,
        v37))
  {
    v35 = [(CPSBannerItem *)v49 detailTextVariants];
    char v34 = 1;
    char v8 = 0;
    if (v35)
    {
      id v33 = (id)[location[0] detailTextVariants];
      char v32 = 1;
      char v8 = 0;
      if (v33)
      {
        id v31 = [(CPSBannerItem *)v49 detailTextVariants];
        char v30 = 1;
        id v29 = (id)[location[0] detailTextVariants];
        char v28 = 1;
        char v8 = -[NSArray isEqualToArray:](v31, "isEqualToArray:");
      }
    }
    char v9 = v8;
  }
  if (v28) {

  }
  if (v30) {
  if (v32)
  }

  if (v34) {
  if (v36)
  }

  v7 = [(CPSBannerItem *)v49 attributedDetailTextVariants];
  char v26 = 0;
  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  if (v7
    || (id v27 = (id)[location[0] attributedDetailTextVariants],
        char v26 = 1,
        char v6 = 1,
        v27))
  {
    objc_super v25 = [(CPSBannerItem *)v49 attributedDetailTextVariants];
    char v24 = 1;
    char v5 = 0;
    if (v25)
    {
      id v23 = (id)[location[0] attributedDetailTextVariants];
      char v22 = 1;
      char v5 = 0;
      if (v23)
      {
        v21 = [(CPSBannerItem *)v49 attributedDetailTextVariants];
        char v20 = 1;
        id v19 = (id)[location[0] attributedDetailTextVariants];
        char v18 = 1;
        char v5 = -[NSArray isEqualToArray:](v21, "isEqualToArray:");
      }
    }
    char v6 = v5;
  }
  if (v18) {

  }
  if (v20) {
  if (v22)
  }

  if (v24) {
  if (v26)
  }

  char v16 = 0;
  char v14 = 0;
  char v4 = 0;
  if (v12)
  {
    char v4 = 0;
    if (v9)
    {
      char v4 = 0;
      if (v6)
      {
        v17 = [(CPSBannerItem *)v49 identifier];
        char v16 = 1;
        id v15 = (id)[location[0] identifier];
        char v14 = 1;
        char v4 = -[NSUUID isEqual:](v17, "isEqual:");
      }
    }
  }
  char v50 = v4 & 1;
  if (v14) {

  }
  if (v16) {
  objc_storeStrong(location, 0);
  }
  return v50 & 1;
}

- (BOOL)isEqual:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = 0;
  if (v6 == location[0])
  {
    char v4 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v4 = [(CPSBannerItem *)v6 isEqualToBannerItem:location[0]];
    }
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)description
{
  v13 = self;
  SEL v12 = a2;
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CPSBannerItem;
  id v9 = [(CPSBannerItem *)&v11 description];
  char v8 = [(CPSBannerItem *)v13 textVariants];
  v7 = [(CPSBannerItem *)v13 detailTextVariants];
  char v6 = [(CPSBannerItem *)v13 imageSet];
  char v5 = [(CPSBannerItem *)v13 identifier];
  char v4 = [(CPSBannerItem *)v13 bundleIdentifier];
  id v10 = (id)[v3 stringWithFormat:@"%@<textVariants: %@, detailTextVariants: %@, imageSet: %@, identifier: %@, bundleID: %@>", v9, v8, v7, v6, v5, v4];

  return v10;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSArray)textVariants
{
  return self->_textVariants;
}

- (NSArray)detailTextVariants
{
  return self->_detailTextVariants;
}

- (NSArray)attributedDetailTextVariants
{
  return self->_attributedDetailTextVariants;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (BOOL)isManeuverItem
{
  return self->_isManeuverItem;
}

- (void).cxx_destruct
{
}

@end