@interface SWCollaborationOption
+ (BOOL)supportsSecureCoding;
+ (SWCollaborationOption)allocWithZone:(_NSZone *)a3;
+ (SWCollaborationOption)optionWithTitle:(NSString *)title identifier:(NSString *)identifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollaborationOption:(id)a3;
- (BOOL)isSelected;
- (NSArray)requiredOptionsIdentifiers;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (SWCollaborationOption)init;
- (SWCollaborationOption)initWithCoder:(id)a3;
- (SWCollaborationOption)initWithTitle:(NSString *)title identifier:(NSString *)identifier;
- (SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 requiredOptionsIdentifiers:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiredOptionsIdentifiers:(NSArray *)requiredOptionsIdentifiers;
- (void)setSelected:(BOOL)selected;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTitle:(NSString *)title;
@end

@implementation SWCollaborationOption

+ (SWCollaborationOption)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWCollaborationOption *)+[SWCollaborationOption allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationOption;
    return (SWCollaborationOption *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (SWCollaborationOption)initWithTitle:(NSString *)title identifier:(NSString *)identifier
{
  objc_super v6 = title;
  v7 = identifier;
  v15.receiver = self;
  v15.super_class = (Class)SWCollaborationOption;
  v8 = [(SWCollaborationOption *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    v10 = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_identifier;
    v8->_identifier = (NSString *)v11;

    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)&stru_1ED99C438;
  }
  return v8;
}

- (SWCollaborationOption)init
{
  return 0;
}

+ (SWCollaborationOption)optionWithTitle:(NSString *)title identifier:(NSString *)identifier
{
  objc_super v6 = identifier;
  v7 = title;
  v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 identifier:v6];

  return (SWCollaborationOption *)v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SWCollaborationOption *)self title];
  v5 = [(SWCollaborationOption *)self identifier];
  if ([(SWCollaborationOption *)self isSelected]) {
    objc_super v6 = @" ✓";
  }
  else {
    objc_super v6 = &stru_1ED99C438;
  }
  v7 = [(SWCollaborationOption *)self requiredOptionsIdentifiers];
  v8 = [v3 stringWithFormat:@"title: %@ identifier: %@ isSelected: %@ requiredOptions: %@", v4, v5, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  v5 = [(SWCollaborationOption *)v4 title];
  objc_super v6 = (void *)[v5 copyWithZone:a3];
  v7 = [(SWCollaborationOption *)v4 identifier];
  v8 = (void *)[v7 copyWithZone:a3];
  uint64_t v9 = [(SWCollaborationOption *)v4 initWithTitle:v6 identifier:v8];

  if (v9)
  {
    v10 = [(SWCollaborationOption *)v4 subtitle];
    uint64_t v11 = (void *)[v10 copyWithZone:a3];
    [(SWCollaborationOption *)v9 setSubtitle:v11];

    [(SWCollaborationOption *)v9 setSelected:[(SWCollaborationOption *)v4 isSelected]];
    v12 = [(SWCollaborationOption *)v4 requiredOptionsIdentifiers];
    [(SWCollaborationOption *)v9 setRequiredOptionsIdentifiers:v12];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SWCollaborationOption *)self isEqualToCollaborationOption:v4];

  return v5;
}

- (BOOL)isEqualToCollaborationOption:(id)a3
{
  v8 = (SWCollaborationOption *)a3;
  if (v8 == self)
  {
    char v10 = 1;
    goto LABEL_45;
  }
  BOOL v9 = [(SWCollaborationOption *)self isSelected];
  if (v9 != [(SWCollaborationOption *)v8 isSelected])
  {
    char v10 = 0;
    goto LABEL_45;
  }
  uint64_t v11 = [(SWCollaborationOption *)self title];
  if (!v11)
  {
    objc_super v6 = [(SWCollaborationOption *)v8 title];
    if (!v6)
    {
      int v31 = 0;
      goto LABEL_11;
    }
  }
  id v4 = [(SWCollaborationOption *)self title];
  BOOL v5 = [(SWCollaborationOption *)v8 title];
  if ([v4 isEqual:v5])
  {
    int v31 = 1;
LABEL_11:
    v12 = [(SWCollaborationOption *)self identifier];
    if (v12
      || ([(SWCollaborationOption *)v8 identifier],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(SWCollaborationOption *)self identifier];
      v30 = [(SWCollaborationOption *)v8 identifier];
      if (!objc_msgSend(v13, "isEqual:"))
      {
        char v10 = 0;
        goto LABEL_37;
      }
      v26 = v13;
      int v29 = 1;
    }
    else
    {
      int v29 = 0;
    }
    v14 = [(SWCollaborationOption *)self subtitle];
    if (v14
      || ([(SWCollaborationOption *)v8 subtitle], (v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v15 = [(SWCollaborationOption *)self subtitle];
      v27 = [(SWCollaborationOption *)v8 subtitle];
      v28 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        char v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v25 = v3;
      int v24 = 1;
    }
    else
    {
      v25 = v3;
      v22 = 0;
      int v24 = 0;
    }
    v16 = [(SWCollaborationOption *)self requiredOptionsIdentifiers];
    if (v16
      || ([(SWCollaborationOption *)v8 requiredOptionsIdentifiers],
          (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v23 = v6;
      v17 = [(SWCollaborationOption *)self requiredOptionsIdentifiers];
      v18 = [(SWCollaborationOption *)v8 requiredOptionsIdentifiers];
      char v10 = [v17 isEqual:v18];

      if (v16)
      {

        if (v24)
        {
          objc_super v6 = v23;
          v3 = v25;
          goto LABEL_32;
        }
        objc_super v6 = v23;
        v3 = v25;
LABEL_33:
        if (!v14) {

        }
        if (!v29) {
          goto LABEL_38;
        }
        v13 = v26;
LABEL_37:

LABEL_38:
        if (!v12) {

        }
        if (v31)
        {
        }
        goto LABEL_42;
      }
      objc_super v6 = v23;
      v19 = (void *)v21;
    }
    else
    {
      v19 = 0;
      char v10 = 1;
    }

    v3 = v25;
    if (v24) {
      goto LABEL_32;
    }
    goto LABEL_33;
  }

  char v10 = 0;
LABEL_42:
  if (!v11) {

  }
LABEL_45:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationOption)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  objc_super v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1ED99C438;
  }
  v8 = v7;

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  char v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = &stru_1ED99C438;
  }
  v12 = v11;

  v13 = [(SWCollaborationOption *)self initWithTitle:v8 identifier:v12];
  if (v13)
  {
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v14;

    v13->_selected = [v4 decodeBoolForKey:@"selected"];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"requiredOptionsIdentifiers"];
    requiredOptionsIdentifiers = v13->_requiredOptionsIdentifiers;
    v13->_requiredOptionsIdentifiers = (NSArray *)v19;
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SWCollaborationOption *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  objc_super v6 = [(SWCollaborationOption *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(SWCollaborationOption *)self subtitle];
  [v4 encodeObject:v7 forKey:@"subtitle"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SWCollaborationOption isSelected](self, "isSelected"), @"selected");
  id v8 = [(SWCollaborationOption *)self requiredOptionsIdentifiers];
  [v4 encodeObject:v8 forKey:@"requiredOptionsIdentifiers"];
}

- (SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 requiredOptionsIdentifiers:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  objc_super v15 = [(SWCollaborationOption *)self initWithTitle:a3 identifier:a4];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_subtitle, a5);
    v16->_selected = a6;
    objc_storeStrong((id *)&v16->_requiredOptionsIdentifiers, a7);
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)selected
{
  self->_selected = selected;
}

- (NSArray)requiredOptionsIdentifiers
{
  return self->_requiredOptionsIdentifiers;
}

- (void)setRequiredOptionsIdentifiers:(NSArray *)requiredOptionsIdentifiers
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredOptionsIdentifiers, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end