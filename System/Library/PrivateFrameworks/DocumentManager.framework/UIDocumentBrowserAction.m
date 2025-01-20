@interface UIDocumentBrowserAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performActionExitsEditMode;
- (BOOL)requiresAuthentication;
- (BOOL)requiresFullyFormedItems;
- (BOOL)requiresResolvedItems;
- (BOOL)requiresVersioning;
- (BOOL)supportsMultipleItems;
- (FPProviderDomain)uiActionProviderDomain;
- (NSArray)supportedContentTypes;
- (NSPredicate)filteringPredicate;
- (NSString)identifier;
- (NSString)localizedCompactTitle;
- (NSString)localizedTitle;
- (NSString)uiActionProviderIdentifier;
- (UIDocumentBrowserAction)initWithCoder:(id)a3;
- (UIDocumentBrowserAction)initWithIdentifier:(NSString *)identifier localizedTitle:(NSString *)localizedTitle availability:(UIDocumentBrowserActionAvailability)availability handler:(void *)handler;
- (UIDocumentBrowserAction)initWithIdentifier:(id)a3 localizedTitle:(id)a4 resolvedHandler:(id)a5;
- (UIDocumentBrowserAction)initWithIdentifier:(id)a3 localizedTitle:(id)a4 unresolvedHandler:(id)a5;
- (UIDocumentBrowserAction)initWithUIActionDescriptor:(id)a3 providerDomain:(id)a4;
- (UIDocumentBrowserActionAvailability)availability;
- (UIDocumentBrowserActionDescriptor)uiActionDescriptor;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)handler;
- (id)resolvedHandler;
- (id)unresolvedHandler;
- (int64_t)actionStyle;
- (int64_t)navigationSide;
- (int64_t)style;
- (unint64_t)menuSortOrder;
- (void)commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setActionStyle:(int64_t)a3;
- (void)setAvailability:(int64_t)a3;
- (void)setFilteringPredicate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setLocalizedCompactTitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMenuSortOrder:(unint64_t)a3;
- (void)setNavigationSide:(int64_t)a3;
- (void)setPerformActionExitsEditMode:(BOOL)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresFullyFormedItems:(BOOL)a3;
- (void)setRequiresResolvedItems:(BOOL)a3;
- (void)setRequiresVersioning:(BOOL)a3;
- (void)setResolvedHandler:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupportedContentTypes:(NSArray *)supportedContentTypes;
- (void)setSupportsMultipleItems:(BOOL)supportsMultipleItems;
- (void)setUiActionDescriptor:(id)a3;
- (void)setUiActionProviderDomain:(id)a3;
- (void)setUiActionProviderIdentifier:(id)a3;
- (void)setUnresolvedHandler:(id)a3;
@end

@implementation UIDocumentBrowserAction

- (void)setSupportsMultipleItems:(BOOL)supportsMultipleItems
{
  self->_supportsMultipleItems = supportsMultipleItems;
}

- (void)setMenuSortOrder:(unint64_t)a3
{
  self->_menuSortOrder = a3;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (void)setImage:(UIImage *)image
{
}

- (void)setFilteringPredicate:(id)a3
{
}

- (void)setRequiresFullyFormedItems:(BOOL)a3
{
  self->_requiresFullyFormedItems = a3;
}

- (void)setNavigationSide:(int64_t)a3
{
  self->_navigationSide = a3;
}

- (UIDocumentBrowserAction)initWithIdentifier:(id)a3 localizedTitle:(id)a4 unresolvedHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UIDocumentBrowserAction;
  v12 = [(UIDocumentBrowserAction *)&v18 init];
  v13 = v12;
  if (v12)
  {
    [(UIDocumentBrowserAction *)v12 commonInit];
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v13->_localizedTitle, a4);
    v13->_requiresResolvedItems = 0;
    uint64_t v14 = MEMORY[0x21668E400](v11);
    id unresolvedHandler = v13->_unresolvedHandler;
    v13->_id unresolvedHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (void)commonInit
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [(id)*MEMORY[0x263F1DB30] identifier];
  v12[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  supportedContentTypes = self->_supportedContentTypes;
  self->_supportedContentTypes = v4;

  self->_supportsMultipleItems = 1;
  self->_availability = 1;
  *(_WORD *)&self->_requiresFullyFormedItems = 1;
  *(_OWORD *)&self->_navigationSide = xmmword_2136532B0;
  uiActionDescriptor = self->_uiActionDescriptor;
  self->_uiActionDescriptor = 0;

  image = self->_image;
  self->_image = 0;

  id resolvedHandler = self->_resolvedHandler;
  self->_id resolvedHandler = 0;

  id unresolvedHandler = self->_unresolvedHandler;
  self->_id unresolvedHandler = 0;

  id v10 = [MEMORY[0x263F08A98] predicateWithValue:1];
  filteringPredicate = self->_filteringPredicate;
  self->_filteringPredicate = v10;

  self->_style = 0;
  *(_WORD *)&self->_performActionExitsEditMode = 257;
  self->_actionStyle = 0;
}

- (UIDocumentBrowserAction)initWithIdentifier:(NSString *)identifier localizedTitle:(NSString *)localizedTitle availability:(UIDocumentBrowserActionAvailability)availability handler:(void *)handler
{
  id v11 = identifier;
  v12 = localizedTitle;
  v13 = handler;
  v24.receiver = self;
  v24.super_class = (Class)UIDocumentBrowserAction;
  uint64_t v14 = [(UIDocumentBrowserAction *)&v24 init];
  v15 = v14;
  if (v14)
  {
    [(UIDocumentBrowserAction *)v14 commonInit];
    objc_storeStrong((id *)&v15->_identifier, identifier);
    objc_storeStrong((id *)&v15->_localizedTitle, localizedTitle);
    v15->_availability = availability;
    v15->_requiresResolvedItems = 1;
    uint64_t v16 = MEMORY[0x21668E400](v13);
    id v17 = v15->_handler;
    v15->_handler = (id)v16;

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__UIDocumentBrowserAction_initWithIdentifier_localizedTitle_availability_handler___block_invoke;
    v22[3] = &unk_2641B1E90;
    id v23 = v13;
    uint64_t v18 = MEMORY[0x21668E400](v22);
    id resolvedHandler = v15->_resolvedHandler;
    v15->_id resolvedHandler = (id)v18;

    v20 = v15;
  }

  return v15;
}

void __82__UIDocumentBrowserAction_initWithIdentifier_localizedTitle_availability_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[DOCItemBookmark documentsURLsForItemBookmarks:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (UIDocumentBrowserAction)initWithIdentifier:(id)a3 localizedTitle:(id)a4 resolvedHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UIDocumentBrowserAction;
  v12 = [(UIDocumentBrowserAction *)&v18 init];
  v13 = v12;
  if (v12)
  {
    [(UIDocumentBrowserAction *)v12 commonInit];
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v13->_localizedTitle, a4);
    v13->_requiresResolvedItems = 1;
    uint64_t v14 = MEMORY[0x21668E400](v11);
    id resolvedHandler = v13->_resolvedHandler;
    v13->_id resolvedHandler = (id)v14;

    uint64_t v16 = v13;
  }

  return v13;
}

- (UIDocumentBrowserAction)initWithUIActionDescriptor:(id)a3 providerDomain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIDocumentBrowserAction;
  id v9 = [(UIDocumentBrowserAction *)&v19 init];
  id v10 = v9;
  if (v9)
  {
    [(UIDocumentBrowserAction *)v9 commonInit];
    uint64_t v11 = [v7 identifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v7 displayName];
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v13;

    v10->_requiresResolvedItems = 0;
    objc_storeStrong((id *)&v10->_uiActionDescriptor, a3);
    uint64_t v15 = [v7 uiActionProviderIdentifier];
    uiActionProviderIdentifier = v10->_uiActionProviderIdentifier;
    v10->_uiActionProviderIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v10->_uiActionProviderDomain, a4);
    id v17 = v10;
  }

  return v10;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UIDocumentBrowserAction;
  v4 = [(UIDocumentBrowserAction *)&v8 description];
  v5 = [(UIDocumentBrowserAction *)self localizedTitle];
  v6 = [v3 stringWithFormat:@"%@ \"%@\"", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UIDocumentBrowserAction *)self identifier];
    v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDocumentBrowserAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentBrowserAction;
  v5 = [(UIDocumentBrowserAction *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(UIDocumentBrowserAction *)v5 setIdentifier:v6];

    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    [(UIDocumentBrowserAction *)v5 setLocalizedTitle:v7];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedCompactTitle"];
    [(UIDocumentBrowserAction *)v5 setLocalizedCompactTitle:v8];

    id v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"supportedContentTypes"];
    [(UIDocumentBrowserAction *)v5 setSupportedContentTypes:v12];

    -[UIDocumentBrowserAction setSupportsMultipleItems:](v5, "setSupportsMultipleItems:", [v4 decodeBoolForKey:@"supportsMultipleItems"]);
    -[UIDocumentBrowserAction setAvailability:](v5, "setAvailability:", [v4 decodeIntegerForKey:@"availability"]);
    -[UIDocumentBrowserAction setNavigationSide:](v5, "setNavigationSide:", [v4 decodeIntegerForKey:@"navigationSide"]);
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    [(UIDocumentBrowserAction *)v5 setImage:v13];

    -[UIDocumentBrowserAction setMenuSortOrder:](v5, "setMenuSortOrder:", [v4 decodeIntegerForKey:@"menuSortOrder"]);
    -[UIDocumentBrowserAction setRequiresResolvedItems:](v5, "setRequiresResolvedItems:", [v4 decodeBoolForKey:@"requiresResolvedItems"]);
    -[UIDocumentBrowserAction setRequiresVersioning:](v5, "setRequiresVersioning:", [v4 decodeBoolForKey:@"requiresVersioning"]);
    -[UIDocumentBrowserAction setRequiresFullyFormedItems:](v5, "setRequiresFullyFormedItems:", [v4 decodeBoolForKey:@"requiresFullyFormedItems"]);
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filteringPredicate"];
    [(UIDocumentBrowserAction *)v5 setFilteringPredicate:v14];

    -[UIDocumentBrowserAction setPerformActionExitsEditMode:](v5, "setPerformActionExitsEditMode:", [v4 decodeBoolForKey:@"performActionExitsEditMode"]);
    -[UIDocumentBrowserAction setActionStyle:](v5, "setActionStyle:", [v4 decodeIntegerForKey:@"actionStyle"]);
    -[UIDocumentBrowserAction setRequiresAuthentication:](v5, "setRequiresAuthentication:", [v4 decodeBoolForKey:@"requiresAuthentication"]);
    uint64_t v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(UIDocumentBrowserAction *)self identifier];

  if (v4)
  {
    v5 = [(UIDocumentBrowserAction *)self identifier];
    [v16 encodeObject:v5 forKey:@"identifier"];
  }
  v6 = [(UIDocumentBrowserAction *)self localizedTitle];

  if (v6)
  {
    char v7 = [(UIDocumentBrowserAction *)self localizedTitle];
    [v16 encodeObject:v7 forKey:@"localizedTitle"];
  }
  objc_super v8 = [(UIDocumentBrowserAction *)self localizedCompactTitle];

  if (v8)
  {
    id v9 = [(UIDocumentBrowserAction *)self localizedCompactTitle];
    [v16 encodeObject:v9 forKey:@"localizedCompactTitle"];
  }
  uint64_t v10 = [(UIDocumentBrowserAction *)self supportedContentTypes];

  if (v10)
  {
    uint64_t v11 = [(UIDocumentBrowserAction *)self supportedContentTypes];
    [v16 encodeObject:v11 forKey:@"supportedContentTypes"];
  }
  v12 = [(UIDocumentBrowserAction *)self filteringPredicate];

  if (v12)
  {
    uint64_t v13 = [(UIDocumentBrowserAction *)self filteringPredicate];
    [v16 encodeObject:v13 forKey:@"filteringPredicate"];
  }
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction supportsMultipleItems](self, "supportsMultipleItems"), @"supportsMultipleItems");
  if ([(UIDocumentBrowserAction *)self availability]) {
    objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction availability](self, "availability"), @"availability");
  }
  objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction navigationSide](self, "navigationSide"), @"navigationSide");
  uint64_t v14 = [(UIDocumentBrowserAction *)self image];

  if (v14)
  {
    uint64_t v15 = [(UIDocumentBrowserAction *)self image];
    [v16 encodeObject:v15 forKey:@"image"];
  }
  objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction menuSortOrder](self, "menuSortOrder"), @"menuSortOrder");
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresResolvedItems](self, "requiresResolvedItems"), @"requiresResolvedItems");
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresVersioning](self, "requiresVersioning"), @"requiresVersioning");
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresFullyFormedItems](self, "requiresFullyFormedItems"), @"requiresFullyFormedItems");
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction performActionExitsEditMode](self, "performActionExitsEditMode"), @"performActionExitsEditMode");
  objc_msgSend(v16, "encodeInteger:forKey:", -[UIDocumentBrowserAction actionStyle](self, "actionStyle"), @"actionStyle");
  objc_msgSend(v16, "encodeBool:forKey:", -[UIDocumentBrowserAction requiresAuthentication](self, "requiresAuthentication"), @"requiresAuthentication");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[UIDocumentBrowserAction allocWithZone:a3];
  v5 = [(UIDocumentBrowserAction *)self identifier];
  v6 = (void *)[v5 copy];
  char v7 = [(UIDocumentBrowserAction *)self localizedTitle];
  objc_super v8 = (void *)[v7 copy];
  id v9 = [(UIDocumentBrowserAction *)self resolvedHandler];
  uint64_t v10 = (void *)[v9 copy];
  uint64_t v11 = [(UIDocumentBrowserAction *)v4 initWithIdentifier:v6 localizedTitle:v8 resolvedHandler:v10];

  if (v11)
  {
    v12 = [(UIDocumentBrowserAction *)self image];
    uint64_t v13 = (void *)[v12 copy];
    [(UIDocumentBrowserAction *)v11 setImage:v13];

    uint64_t v14 = [(UIDocumentBrowserAction *)self localizedCompactTitle];
    uint64_t v15 = (void *)[v14 copy];
    [(UIDocumentBrowserAction *)v11 setLocalizedCompactTitle:v15];

    id v16 = objc_alloc(MEMORY[0x263EFF8C0]);
    objc_super v17 = [(UIDocumentBrowserAction *)self supportedContentTypes];
    objc_super v18 = (void *)[v16 initWithArray:v17 copyItems:1];
    [(UIDocumentBrowserAction *)v11 setSupportedContentTypes:v18];

    [(UIDocumentBrowserAction *)v11 setSupportsMultipleItems:[(UIDocumentBrowserAction *)self supportsMultipleItems]];
    [(UIDocumentBrowserAction *)v11 setAvailability:[(UIDocumentBrowserAction *)self availability]];
    [(UIDocumentBrowserAction *)v11 setRequiresResolvedItems:[(UIDocumentBrowserAction *)self requiresResolvedItems]];
    objc_super v19 = [(UIDocumentBrowserAction *)self unresolvedHandler];
    v20 = (void *)[v19 copy];
    [(UIDocumentBrowserAction *)v11 setUnresolvedHandler:v20];

    [(UIDocumentBrowserAction *)v11 setNavigationSide:[(UIDocumentBrowserAction *)self navigationSide]];
    [(UIDocumentBrowserAction *)v11 setRequiresVersioning:[(UIDocumentBrowserAction *)self requiresVersioning]];
    [(UIDocumentBrowserAction *)v11 setRequiresFullyFormedItems:[(UIDocumentBrowserAction *)self requiresFullyFormedItems]];
    [(UIDocumentBrowserAction *)v11 setMenuSortOrder:[(UIDocumentBrowserAction *)self menuSortOrder]];
    v21 = [(UIDocumentBrowserAction *)self filteringPredicate];
    [(UIDocumentBrowserAction *)v11 setFilteringPredicate:v21];

    [(UIDocumentBrowserAction *)v11 setPerformActionExitsEditMode:[(UIDocumentBrowserAction *)self performActionExitsEditMode]];
    [(UIDocumentBrowserAction *)v11 setActionStyle:[(UIDocumentBrowserAction *)self actionStyle]];
    [(UIDocumentBrowserAction *)v11 setRequiresAuthentication:[(UIDocumentBrowserAction *)self requiresAuthentication]];
  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (UIDocumentBrowserActionAvailability)availability
{
  return self->_availability;
}

- (UIImage)image
{
  return self->_image;
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void)setSupportedContentTypes:(NSArray *)supportedContentTypes
{
}

- (BOOL)supportsMultipleItems
{
  return self->_supportsMultipleItems;
}

- (BOOL)requiresResolvedItems
{
  return self->_requiresResolvedItems;
}

- (void)setRequiresResolvedItems:(BOOL)a3
{
  self->_requiresResolvedItems = a3;
}

- (BOOL)requiresFullyFormedItems
{
  return self->_requiresFullyFormedItems;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)resolvedHandler
{
  return self->_resolvedHandler;
}

- (void)setResolvedHandler:(id)a3
{
}

- (id)unresolvedHandler
{
  return self->_unresolvedHandler;
}

- (void)setUnresolvedHandler:(id)a3
{
}

- (NSString)uiActionProviderIdentifier
{
  return self->_uiActionProviderIdentifier;
}

- (void)setUiActionProviderIdentifier:(id)a3
{
}

- (FPProviderDomain)uiActionProviderDomain
{
  return self->_uiActionProviderDomain;
}

- (void)setUiActionProviderDomain:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)navigationSide
{
  return self->_navigationSide;
}

- (BOOL)requiresVersioning
{
  return self->_requiresVersioning;
}

- (void)setRequiresVersioning:(BOOL)a3
{
  self->_requiresVersioning = a3;
}

- (unint64_t)menuSortOrder
{
  return self->_menuSortOrder;
}

- (NSPredicate)filteringPredicate
{
  return self->_filteringPredicate;
}

- (BOOL)performActionExitsEditMode
{
  return self->_performActionExitsEditMode;
}

- (void)setPerformActionExitsEditMode:(BOOL)a3
{
  self->_performActionExitsEditMode = a3;
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(int64_t)a3
{
  self->_actionStyle = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (NSString)localizedCompactTitle
{
  return self->_localizedCompactTitle;
}

- (void)setLocalizedCompactTitle:(id)a3
{
}

- (UIDocumentBrowserActionDescriptor)uiActionDescriptor
{
  return self->_uiActionDescriptor;
}

- (void)setUiActionDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiActionDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedCompactTitle, 0);
  objc_storeStrong((id *)&self->_filteringPredicate, 0);
  objc_storeStrong((id *)&self->_uiActionProviderDomain, 0);
  objc_storeStrong((id *)&self->_uiActionProviderIdentifier, 0);
  objc_storeStrong(&self->_unresolvedHandler, 0);
  objc_storeStrong(&self->_resolvedHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end