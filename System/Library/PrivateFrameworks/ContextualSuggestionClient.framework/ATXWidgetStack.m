@interface ATXWidgetStack
+ (BOOL)supportsSecureCoding;
- (ATXWidgetStack)initWithCoder:(id)a3;
- (ATXWidgetStack)initWithIdentifier:(id)a3 widgets:(id)a4 family:(int64_t)a5 allowsNewWidget:(BOOL)a6 allowsSmartRotate:(BOOL)a7;
- (ATXWidgetStack)initWithIdentifier:(id)a3 widgets:(id)a4 topWidgetIdentifier:(id)a5 family:(int64_t)a6 allowsNewWidget:(BOOL)a7 allowsSmartRotate:(BOOL)a8;
- (BOOL)allowsNewWidget;
- (BOOL)allowsSmartRotate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXWidgetStack:(id)a3;
- (NSArray)widgets;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (NSString)topWidgetIdentifier;
- (id)description;
- (int64_t)family;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setTopWidgetIdentifier:(id)a3;
@end

@implementation ATXWidgetStack

- (ATXWidgetStack)initWithIdentifier:(id)a3 widgets:(id)a4 family:(int64_t)a5 allowsNewWidget:(BOOL)a6 allowsSmartRotate:(BOOL)a7
{
  return [(ATXWidgetStack *)self initWithIdentifier:a3 widgets:a4 topWidgetIdentifier:0 family:a5 allowsNewWidget:a6 allowsSmartRotate:a7];
}

- (ATXWidgetStack)initWithIdentifier:(id)a3 widgets:(id)a4 topWidgetIdentifier:(id)a5 family:(int64_t)a6 allowsNewWidget:(BOOL)a7 allowsSmartRotate:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ATXWidgetStack;
  v17 = [(ATXWidgetStack *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    widgets = v17->_widgets;
    v17->_widgets = (NSArray *)v20;

    uint64_t v22 = [v16 copy];
    topWidgetIdentifier = v17->_topWidgetIdentifier;
    v17->_topWidgetIdentifier = (NSString *)v22;

    v17->_family = a6;
    v17->_allowsNewWidget = a7;
    v17->_allowsSmartRotate = a8;
  }

  return v17;
}

- (ATXWidgetStack)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = (void *)MEMORY[0x24C5D0000]();
  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"widgets"];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topWidgetIdentifier"];
  v12 = -[ATXWidgetStack initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:](self, "initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:", v5, v10, v11, [v4 decodeIntegerForKey:@"family"], objc_msgSend(v4, "decodeBoolForKey:", @"allowsNewWidget"), objc_msgSend(v4, "decodeBoolForKey:", @"allowsSmartRotate"));

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ATXWidgetStack *)self identifier];
  [v7 encodeObject:v4 forKey:@"identifier"];

  v5 = [(ATXWidgetStack *)self widgets];
  [v7 encodeObject:v5 forKey:@"widgets"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXWidgetStack family](self, "family"), @"family");
  v6 = [(ATXWidgetStack *)self topWidgetIdentifier];
  [v7 encodeObject:v6 forKey:@"topWidgetIdentifier"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXWidgetStack allowsNewWidget](self, "allowsNewWidget"), @"allowsNewWidget");
  objc_msgSend(v7, "encodeBool:forKey:", -[ATXWidgetStack allowsSmartRotate](self, "allowsSmartRotate"), @"allowsSmartRotate");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXWidgetStack *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXWidgetStack *)self isEqualToATXWidgetStack:v5];

  return v6;
}

- (BOOL)isEqualToATXWidgetStack:(id)a3
{
  id v4 = (id *)a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = identifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_16:
      BOOL v20 = 0;
      goto LABEL_17;
    }
  }
  widgets = self->_widgets;
  v11 = (NSArray *)v4[3];
  if (widgets == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = widgets;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_16;
    }
  }
  topWidgetIdentifier = self->_topWidgetIdentifier;
  id v16 = (NSString *)v4[5];
  if (topWidgetIdentifier == v16)
  {
  }
  else
  {
    v17 = v16;
    uint64_t v18 = topWidgetIdentifier;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (self->_family != v4[4] || self->_allowsNewWidget != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_16;
  }
  BOOL v20 = self->_allowsSmartRotate == *((unsigned __int8 *)v4 + 9);
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  v3 = [(ATXWidgetStack *)self identifier];
  uint64_t v4 = [v3 hash];

  v5 = [(ATXWidgetStack *)self widgets];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  id v7 = [(ATXWidgetStack *)self topWidgetIdentifier];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  int64_t v9 = 31 * ([(ATXWidgetStack *)self family] - v8 + 32 * v8);
  int64_t v10 = 31 * (v9 + [(ATXWidgetStack *)self allowsNewWidget]);
  return v10 + [(ATXWidgetStack *)self allowsSmartRotate];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(ATXWidgetStack *)self identifier];
  v5 = [(ATXWidgetStack *)self widgets];
  uint64_t v6 = [(ATXWidgetStack *)self topWidgetIdentifier];
  [(ATXWidgetStack *)self family];
  id v7 = NSStringFromWidgetFamily();
  if ([(ATXWidgetStack *)self allowsNewWidget]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(ATXWidgetStack *)self allowsSmartRotate]) {
    int64_t v9 = @"YES";
  }
  else {
    int64_t v9 = @"NO";
  }
  int64_t v10 = (void *)[v3 initWithFormat:@"<ATXWidgetStack: (identifier: %@, widgets: %@, topWidgetIdentifier: %@, family: %@, allowsNewWidget: %@, allowsSmartRotate: %@)>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  v14[6] = *MEMORY[0x263EF8340];
  v13[0] = @"identifier";
  id v3 = [(ATXWidgetStack *)self identifier];
  v14[0] = v3;
  v13[1] = @"widgets";
  uint64_t v4 = [(ATXWidgetStack *)self widgets];
  v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global);
  v14[1] = v5;
  v13[2] = @"topWidgetIdentifier";
  uint64_t v6 = [(ATXWidgetStack *)self topWidgetIdentifier];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v14[2] = v7;
  v13[3] = @"family";
  [(ATXWidgetStack *)self family];
  uint64_t v8 = NSStringFromWidgetFamily();
  v14[3] = v8;
  v13[4] = @"allowsNewWidget";
  int64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXWidgetStack allowsNewWidget](self, "allowsNewWidget"));
  v14[4] = v9;
  v13[5] = @"allowsSmartRotate";
  int64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXWidgetStack allowsSmartRotate](self, "allowsSmartRotate"));
  v14[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  if (!v6) {
  return (NSDictionary *)v11;
  }
}

uint64_t __42__ATXWidgetStack_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (int64_t)family
{
  return self->_family;
}

- (BOOL)allowsNewWidget
{
  return self->_allowsNewWidget;
}

- (BOOL)allowsSmartRotate
{
  return self->_allowsSmartRotate;
}

- (NSString)topWidgetIdentifier
{
  return self->_topWidgetIdentifier;
}

- (void)setTopWidgetIdentifier:(id)a3
{
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_topWidgetIdentifier, 0);
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end