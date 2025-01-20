@interface SKGPersonComponents
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersonComponents:(id)a3;
- (NSArray)displayNames;
- (NSArray)emailAddresses;
- (NSArray)nameComponents;
- (NSArray)names;
- (NSArray)phoneNumbers;
- (NSString)contactIdentifier;
- (NSString)entityIdentifier;
- (NSString)photosPersonIdentifier;
- (SKGPersonComponents)initWithEmailAddresses:(id)a3 phoneNumbers:(id)a4;
- (SKGPersonComponents)initWithName:(id)a3 nameComponents:(id)a4 displayName:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7;
- (void)addName:(id)a3 nameComponents:(id)a4 displayName:(id)a5;
- (void)setContactIdentifier:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setPhotosPersonIdentifier:(id)a3;
@end

@implementation SKGPersonComponents

- (SKGPersonComponents)initWithName:(id)a3 nameComponents:(id)a4 displayName:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)SKGPersonComponents;
  v17 = [(SKGPersonComponents *)&v33 init];
  if (v17)
  {
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    nameComponents = v17->_nameComponents;
    v17->_nameComponents = v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    names = v17->_names;
    v17->_names = v20;

    v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    displayNames = v17->_displayNames;
    v17->_displayNames = v22;

    if (v12 && v13)
    {
      [(NSMutableSet *)v17->_nameComponents addObject:v13];
      [(NSMutableSet *)v17->_names addObject:v12];
      if (v14) {
        id v24 = v14;
      }
      else {
        id v24 = v12;
      }
      [(NSMutableSet *)v17->_displayNames addObject:v24];
    }
    if (v15) {
      +[NSMutableSet setWithArray:v15];
    }
    else {
    uint64_t v25 = +[NSMutableSet set];
    }
    emailAddresses = v17->_emailAddresses;
    v17->_emailAddresses = (NSMutableSet *)v25;

    if (v16) {
      +[NSMutableSet setWithArray:v16];
    }
    else {
    uint64_t v27 = +[NSMutableSet set];
    }
    phoneNumbers = v17->_phoneNumbers;
    v17->_phoneNumbers = (NSMutableSet *)v27;

    entityIdentifier = v17->_entityIdentifier;
    v17->_entityIdentifier = 0;

    contactIdentifier = v17->_contactIdentifier;
    v17->_contactIdentifier = 0;

    photosPersonIdentifier = v17->_photosPersonIdentifier;
    v17->_photosPersonIdentifier = 0;
  }
  return v17;
}

- (SKGPersonComponents)initWithEmailAddresses:(id)a3 phoneNumbers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SKGPersonComponents;
  v8 = [(SKGPersonComponents *)&v23 init];
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    nameComponents = v8->_nameComponents;
    v8->_nameComponents = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    names = v8->_names;
    v8->_names = v11;

    id v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    displayNames = v8->_displayNames;
    v8->_displayNames = v13;

    if (v6) {
      +[NSMutableSet setWithArray:v6];
    }
    else {
    uint64_t v15 = +[NSMutableSet set];
    }
    emailAddresses = v8->_emailAddresses;
    v8->_emailAddresses = (NSMutableSet *)v15;

    if (v7) {
      +[NSMutableSet setWithArray:v7];
    }
    else {
    uint64_t v17 = +[NSMutableSet set];
    }
    phoneNumbers = v8->_phoneNumbers;
    v8->_phoneNumbers = (NSMutableSet *)v17;

    entityIdentifier = v8->_entityIdentifier;
    v8->_entityIdentifier = 0;

    contactIdentifier = v8->_contactIdentifier;
    v8->_contactIdentifier = 0;

    photosPersonIdentifier = v8->_photosPersonIdentifier;
    v8->_photosPersonIdentifier = 0;
  }
  return v8;
}

- (NSArray)nameComponents
{
  return (NSArray *)[(NSMutableSet *)self->_nameComponents allObjects];
}

- (NSArray)names
{
  return (NSArray *)[(NSMutableSet *)self->_names allObjects];
}

- (NSArray)displayNames
{
  return (NSArray *)[(NSMutableSet *)self->_displayNames allObjects];
}

- (NSArray)phoneNumbers
{
  return (NSArray *)[(NSMutableSet *)self->_phoneNumbers allObjects];
}

- (NSArray)emailAddresses
{
  return (NSArray *)[(NSMutableSet *)self->_emailAddresses allObjects];
}

- (void)addName:(id)a3 nameComponents:(id)a4 displayName:(id)a5
{
  if (a3 && a4)
  {
    names = self->_names;
    id v9 = a5;
    id v10 = a4;
    id v17 = a3;
    v11 = +[NSString stringWithString:v17];
    [(NSMutableSet *)names addObject:v11];

    nameComponents = self->_nameComponents;
    id v13 = [v10 copy];

    [(NSMutableSet *)nameComponents addObject:v13];
    if (v9) {
      id v14 = v9;
    }
    else {
      id v14 = v17;
    }
    displayNames = self->_displayNames;
    id v16 = +[NSString stringWithString:v14];
    [(NSMutableSet *)displayNames addObject:v16];
  }
}

- (void)setEntityIdentifier:(id)a3
{
}

- (void)setContactIdentifier:(id)a3
{
}

- (void)setPhotosPersonIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(SKGPersonComponents *)self isEqualToPersonComponents:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToPersonComponents:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKGPersonComponents *)self names];
  id v6 = [v4 names];
  unsigned int v7 = [v5 isEqualToArray:v6];

  if (!v7) {
    goto LABEL_28;
  }
  v8 = [(SKGPersonComponents *)self nameComponents];
  id v9 = [v4 nameComponents];
  unsigned int v10 = [v8 isEqualToArray:v9];

  if (!v10) {
    goto LABEL_28;
  }
  v11 = [(SKGPersonComponents *)self phoneNumbers];
  id v12 = [v4 phoneNumbers];
  unsigned int v13 = [v11 isEqualToArray:v12];

  if (!v13) {
    goto LABEL_28;
  }
  id v14 = [(SKGPersonComponents *)self emailAddresses];
  uint64_t v15 = [v4 emailAddresses];
  unsigned int v16 = [v14 isEqualToArray:v15];

  if (!v16) {
    goto LABEL_28;
  }
  id v17 = [(SKGPersonComponents *)self entityIdentifier];
  if (!v17 || ([v4 entityIdentifier], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = [(SKGPersonComponents *)self entityIdentifier];
    if (v18 || ([v4 entityIdentifier], (v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v19 = [(SKGPersonComponents *)self entityIdentifier];
      v20 = [v4 entityIdentifier];
      char v21 = [v19 isEqualToString:v20] ^ 1;

      if (v18) {
        goto LABEL_13;
      }
      v22 = 0;
    }
    else
    {
      char v21 = 1;
    }

LABEL_13:
    if (v17)
    {
    }
    if (v21) {
      goto LABEL_28;
    }
    id v17 = [(SKGPersonComponents *)self contactIdentifier];
    if (v17)
    {
      uint64_t v15 = [v4 contactIdentifier];
      if (!v15) {
        goto LABEL_18;
      }
    }
    objc_super v23 = [(SKGPersonComponents *)self contactIdentifier];
    if (v23 || ([v4 contactIdentifier], (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v24 = [(SKGPersonComponents *)self contactIdentifier];
      uint64_t v25 = [v4 contactIdentifier];
      char v26 = [v24 isEqualToString:v25] ^ 1;

      if (v23) {
        goto LABEL_25;
      }
      uint64_t v27 = 0;
    }
    else
    {
      char v26 = 1;
    }

LABEL_25:
    if (v17)
    {
    }
    if (v26) {
      goto LABEL_28;
    }
    v30 = [(SKGPersonComponents *)self photosPersonIdentifier];
    if (v30)
    {
      uint64_t v15 = [v4 photosPersonIdentifier];
      if (!v15)
      {
        LOBYTE(v31) = 1;
        goto LABEL_40;
      }
    }
    v32 = [(SKGPersonComponents *)self photosPersonIdentifier];
    if (v32 || ([v4 photosPersonIdentifier], (v35 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v33 = [(SKGPersonComponents *)self photosPersonIdentifier];
      v34 = [v4 photosPersonIdentifier];
      unsigned int v31 = [v33 isEqualToString:v34] ^ 1;

      if (v32) {
        goto LABEL_39;
      }
      v35 = 0;
    }
    else
    {
      LOBYTE(v31) = 1;
    }

LABEL_39:
    if (!v30)
    {
LABEL_41:

      char v28 = v31 ^ 1;
      goto LABEL_29;
    }
LABEL_40:

    goto LABEL_41;
  }
LABEL_18:

LABEL_28:
  char v28 = 0;
LABEL_29:

  return v28;
}

- (NSString)entityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)photosPersonIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_names, 0);

  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end