@interface SWCollaborationOptionsGroup
+ (BOOL)supportsSecureCoding;
+ (SWCollaborationOptionsGroup)allocWithZone:(_NSZone *)a3;
+ (SWCollaborationOptionsGroup)optionsGroupWithIdentifier:(NSString *)identifier options:(NSArray *)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollaborationOptionsGroup:(id)a3;
- (NSArray)options;
- (NSString)footer;
- (NSString)identifier;
- (NSString)title;
- (SWCollaborationOptionsGroup)initWithCoder:(id)a3;
- (SWCollaborationOptionsGroup)initWithIdentifier:(NSString *)identifier options:(NSArray *)options;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFooter:(NSString *)footer;
- (void)setOptions:(NSArray *)options;
- (void)setTitle:(NSString *)title;
@end

@implementation SWCollaborationOptionsGroup

+ (SWCollaborationOptionsGroup)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWCollaborationOptionsGroup *)+[SWCollaborationOptionsGroup allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationOptionsGroup;
    return (SWCollaborationOptionsGroup *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (SWCollaborationOptionsGroup)initWithIdentifier:(NSString *)identifier options:(NSArray *)options
{
  objc_super v6 = identifier;
  v7 = options;
  v17.receiver = self;
  v17.super_class = (Class)SWCollaborationOptionsGroup;
  v8 = [(SWCollaborationOptionsGroup *)&v17 init];
  v9 = v8;
  if (v8)
  {
    title = v8->_title;
    v8->_title = (NSString *)&stru_1ED99C438;

    uint64_t v11 = [(NSString *)v6 copy];
    v12 = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    footer = v9->_footer;
    v9->_footer = (NSString *)&stru_1ED99C438;

    uint64_t v14 = [(NSArray *)v7 copy];
    v15 = v9->_options;
    v9->_options = (NSArray *)v14;
  }
  return v9;
}

+ (SWCollaborationOptionsGroup)optionsGroupWithIdentifier:(NSString *)identifier options:(NSArray *)options
{
  objc_super v6 = options;
  v7 = identifier;
  v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 options:v6];

  return (SWCollaborationOptionsGroup *)v8;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(SWCollaborationOptionsGroup *)self title];
  if (v3)
  {
    v4 = [(SWCollaborationOptionsGroup *)self title];
    v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    v5 = objc_opt_new();
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v6 = [(SWCollaborationOptionsGroup *)self options];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v5 length]) {
          [v5 appendString:@"\n"];
        }
        v12 = [v11 title];
        if ([v11 isSelected]) {
          v13 = @"YES";
        }
        else {
          v13 = @"NO";
        }
        [v5 appendFormat:@"- %@: %@", v12, v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [(SWCollaborationOptionsGroup *)self footer];

  if (v14)
  {
    v15 = [(SWCollaborationOptionsGroup *)self footer];
    [v5 appendString:v15];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SWCollaborationOptionsGroup *)self isEqualToCollaborationOptionsGroup:v4];

  return v5;
}

- (BOOL)isEqualToCollaborationOptionsGroup:(id)a3
{
  uint64_t v9 = (SWCollaborationOptionsGroup *)a3;
  if (v9 == self)
  {
    char v11 = 1;
    goto LABEL_46;
  }
  v10 = [(SWCollaborationOptionsGroup *)self title];
  if (v10
    || ([(SWCollaborationOptionsGroup *)v9 title], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(SWCollaborationOptionsGroup *)self title];
    BOOL v5 = [(SWCollaborationOptionsGroup *)v9 title];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      char v11 = 0;
      goto LABEL_43;
    }
    int v32 = 1;
  }
  else
  {
    int v32 = 0;
  }
  v12 = [(SWCollaborationOptionsGroup *)self identifier];
  if (!v12)
  {
    objc_super v6 = [(SWCollaborationOptionsGroup *)v9 identifier];
    if (!v6)
    {
      int v31 = 0;
      goto LABEL_19;
    }
  }
  uint64_t v7 = v3;
  v13 = [(SWCollaborationOptionsGroup *)self identifier];
  uint64_t v14 = [(SWCollaborationOptionsGroup *)v9 identifier];
  if ([v13 isEqual:v14])
  {
    v28 = v14;
    v29 = v13;
    int v31 = 1;
    v3 = v7;
LABEL_19:
    v15 = [(SWCollaborationOptionsGroup *)self footer];
    if (v15
      || ([(SWCollaborationOptionsGroup *)v9 footer], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v7 = [(SWCollaborationOptionsGroup *)self footer];
      v30 = [(SWCollaborationOptionsGroup *)v9 footer];
      if (!objc_msgSend(v7, "isEqual:"))
      {
        char v11 = 0;
LABEL_34:

LABEL_35:
        if (!v15) {

        }
        if (v31)
        {
        }
        if (!v12) {

        }
        if (!v32) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }
      v27 = v6;
      int v26 = 1;
    }
    else
    {
      v27 = v6;
      v23 = 0;
      int v26 = 0;
    }
    v16 = [(SWCollaborationOptionsGroup *)self options];
    if (v16
      || ([(SWCollaborationOptionsGroup *)v9 options], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = v7;
      v25 = v3;
      long long v17 = [(SWCollaborationOptionsGroup *)self options];
      long long v18 = [(SWCollaborationOptionsGroup *)v9 options];
      char v11 = [v17 isEqual:v18];

      if (v16)
      {

        uint64_t v7 = v24;
        if (!v26)
        {
          v3 = v25;
          objc_super v6 = v27;
          goto LABEL_35;
        }
        v3 = v25;
        objc_super v6 = v27;
        goto LABEL_34;
      }
      uint64_t v7 = v24;
      v3 = v25;
      long long v19 = v22;
    }
    else
    {
      long long v19 = 0;
      char v11 = 1;
    }

    objc_super v6 = v27;
    if ((v26 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  if (v12) {
  else
  }

  char v11 = 0;
  v3 = v7;
  if (v32)
  {
LABEL_42:
  }
LABEL_43:
  if (!v10) {

  }
LABEL_46:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  objc_super v6 = [(SWCollaborationOptionsGroup *)self identifier];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = [(SWCollaborationOptionsGroup *)self options];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  v10 = (void *)[v5 initWithIdentifier:v7 options:v9];

  if (v10)
  {
    char v11 = [(SWCollaborationOptionsGroup *)self title];
    v12 = (void *)[v11 copyWithZone:a3];
    [v10 setTitle:v12];

    v13 = [(SWCollaborationOptionsGroup *)self footer];
    uint64_t v14 = (void *)[v13 copyWithZone:a3];
    [v10 setFooter:v14];
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationOptionsGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SWCollaborationOptionsGroup *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footer"];
    footer = v5->_footer;
    v5->_footer = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"options"];
    options = v5->_options;
    v5->_options = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SWCollaborationOptionsGroup *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(SWCollaborationOptionsGroup *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  uint64_t v7 = [(SWCollaborationOptionsGroup *)self footer];
  [v4 encodeObject:v7 forKey:@"footer"];

  id v8 = [(SWCollaborationOptionsGroup *)self options];
  [v4 encodeObject:v8 forKey:@"options"];
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

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(NSString *)footer
{
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(NSArray *)options
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end