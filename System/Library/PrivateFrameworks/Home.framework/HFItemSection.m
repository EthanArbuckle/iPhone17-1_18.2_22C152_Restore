@interface HFItemSection
+ (NAIdentity)na_identity;
+ (id)defaultItemComparator;
+ (id)filterSections:(id)a3 toDisplayedItems:(id)a4;
+ (id)itemResultManualSortComparator;
- (BOOL)forceShowHeaderTitle;
- (BOOL)hideAccessoryButton;
- (BOOL)hideHeaderText;
- (BOOL)isEqual:(id)a3;
- (HFItemSection)init;
- (HFItemSection)initWithIdentifier:(id)a3;
- (HFItemSectionAccessoryButtonHeaderDelegate)headerAccessoryButtonDelegate;
- (NSArray)items;
- (NSAttributedString)attributedFooterTitle;
- (NSAttributedString)attributedHeaderTitle;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)footerTitle;
- (NSString)headerAccessoryButtonTitle;
- (NSString)headerSecondaryText;
- (NSString)headerTitle;
- (NSString)identifier;
- (id)_createCopyMutable:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAttributedFooterTitle:(id)a3;
- (void)setAttributedHeaderTitle:(id)a3;
- (void)setFooterTitle:(id)a3;
- (void)setForceShowHeaderTitle:(BOOL)a3;
- (void)setHeaderAccessoryButtonDelegate:(id)a3;
- (void)setHeaderAccessoryButtonTitle:(id)a3;
- (void)setHeaderSecondaryText:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHideAccessoryButton:(BOOL)a3;
- (void)setHideHeaderText:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HFItemSection

uint64_t __28__HFItemSection_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __28__HFItemSection_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 attributedFooterTitle];
}

uint64_t __28__HFItemSection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 footerTitle];
}

uint64_t __28__HFItemSection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 attributedHeaderTitle];
}

uint64_t __28__HFItemSection_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 headerTitle];
}

- (void)setItems:(id)a3
{
}

uint64_t __49__HFItemSection_filterSections_toDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

id __49__HFItemSection_filterSections_toDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 items];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__HFItemSection_filterSections_toDisplayedItems___block_invoke_2;
  v14[3] = &unk_26408EC60;
  id v15 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "na_filter:", v14);

  uint64_t v6 = [v5 count];
  v7 = [v3 items];
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
    v9 = (void *)[v3 mutableCopy];
    [v9 setItems:v5];

    id v3 = v9;
  }
  v10 = [v3 items];
  if ([v10 count]) {
    v11 = v3;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (NSArray)items
{
  if (self->_items) {
    return self->_items;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2EEE8 != -1) {
    dispatch_once(&qword_26AB2EEE8, &__block_literal_global_60_0);
  }
  v2 = (void *)_MergedGlobals_236;
  return (NAIdentity *)v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createCopyMutable:(BOOL)a3
{
  unint64_t v4 = off_26408B478;
  if (!a3) {
    unint64_t v4 = off_26408B2F0;
  }
  id v5 = objc_alloc(*v4);
  uint64_t v6 = [(HFItemSection *)self identifier];
  v7 = (void *)[v5 initWithIdentifier:v6];

  uint64_t v8 = [(HFItemSection *)self headerTitle];
  [v7 setHeaderTitle:v8];

  v9 = [(HFItemSection *)self headerSecondaryText];
  [v7 setHeaderSecondaryText:v9];

  v10 = [(HFItemSection *)self attributedHeaderTitle];
  [v7 setAttributedHeaderTitle:v10];

  v11 = [(HFItemSection *)self headerAccessoryButtonTitle];
  [v7 setHeaderAccessoryButtonTitle:v11];

  id v12 = [(HFItemSection *)self headerAccessoryButtonDelegate];
  [v7 setHeaderAccessoryButtonDelegate:v12];

  objc_msgSend(v7, "setHideAccessoryButton:", -[HFItemSection hideAccessoryButton](self, "hideAccessoryButton"));
  objc_msgSend(v7, "setHideHeaderText:", -[HFItemSection hideHeaderText](self, "hideHeaderText"));
  objc_msgSend(v7, "setForceShowHeaderTitle:", -[HFItemSection forceShowHeaderTitle](self, "forceShowHeaderTitle"));
  v13 = [(HFItemSection *)self footerTitle];
  [v7 setFooterTitle:v13];

  v14 = [(HFItemSection *)self attributedFooterTitle];
  [v7 setAttributedFooterTitle:v14];

  id v15 = [(HFItemSection *)self items];
  [v7 setItems:v15];

  v16 = [(HFItemSection *)self userInfo];
  [v7 setUserInfo:v16];

  return v7;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (NSAttributedString)attributedHeaderTitle
{
  return self->_attributedHeaderTitle;
}

- (NSAttributedString)attributedFooterTitle
{
  return self->_attributedFooterTitle;
}

- (HFItemSection)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFItemSection.m", 37, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFItemSection;
  uint64_t v6 = [(HFItemSection *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;
  }
  return v6;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setFooterTitle:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setHideHeaderText:(BOOL)a3
{
  self->_hideHeaderText = a3;
}

- (void)setHideAccessoryButton:(BOOL)a3
{
  self->_hideAccessoryButton = a3;
}

- (void)setHeaderSecondaryText:(id)a3
{
}

- (void)setHeaderAccessoryButtonTitle:(id)a3
{
}

- (void)setHeaderAccessoryButtonDelegate:(id)a3
{
}

- (void)setForceShowHeaderTitle:(BOOL)a3
{
  self->_forceShowHeaderTitle = a3;
}

- (void)setAttributedHeaderTitle:(id)a3
{
}

- (void)setAttributedFooterTitle:(id)a3
{
}

- (BOOL)hideHeaderText
{
  return self->_hideHeaderText;
}

- (BOOL)hideAccessoryButton
{
  return self->_hideAccessoryButton;
}

- (NSString)headerSecondaryText
{
  return self->_headerSecondaryText;
}

- (NSString)headerAccessoryButtonTitle
{
  return self->_headerAccessoryButtonTitle;
}

- (HFItemSectionAccessoryButtonHeaderDelegate)headerAccessoryButtonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerAccessoryButtonDelegate);
  return (HFItemSectionAccessoryButtonHeaderDelegate *)WeakRetained;
}

- (BOOL)forceShowHeaderTitle
{
  return self->_forceShowHeaderTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_attributedFooterTitle, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_destroyWeak((id *)&self->_headerAccessoryButtonDelegate);
  objc_storeStrong((id *)&self->_headerAccessoryButtonTitle, 0);
  objc_storeStrong((id *)&self->_attributedHeaderTitle, 0);
  objc_storeStrong((id *)&self->_headerSecondaryText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)filterSections:(id)a3 toDisplayedItems:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HFItemSection_filterSections_toDisplayedItems___block_invoke;
  v9[3] = &unk_264091498;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a3, "na_map:", v9);

  return v7;
}

void __28__HFItemSection_na_identity__block_invoke()
{
  id v7 = [MEMORY[0x263F58198] builder];
  id v0 = (id)[v7 appendCharacteristic:&__block_literal_global_64_0];
  id v1 = (id)[v7 appendCharacteristic:&__block_literal_global_66_1 withRole:2];
  id v2 = (id)[v7 appendCharacteristic:&__block_literal_global_68_0 withRole:2];
  id v3 = (id)[v7 appendCharacteristic:&__block_literal_global_70_3 withRole:2];
  id v4 = (id)[v7 appendCharacteristic:&__block_literal_global_72 withRole:2];
  uint64_t v5 = [v7 build];
  id v6 = (void *)_MergedGlobals_236;
  _MergedGlobals_236 = v5;
}

- (HFItemSection)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithIdentifier_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFItemSection.m", 32, @"%s is unavailable; use %@ instead",
    "-[HFItemSection init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFItemSection *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  id v6 = [(HFItemSection *)self headerTitle];
  id v7 = (id)[v3 appendObject:v6 withName:@"headerTitle"];

  uint64_t v8 = [(HFItemSection *)self headerSecondaryText];
  id v9 = (id)[v3 appendObject:v8 withName:@"headerSecondaryText"];

  id v10 = [(HFItemSection *)self attributedHeaderTitle];
  id v11 = (id)[v3 appendObject:v10 withName:@"attributedHeaderTitle"];

  id v12 = [(HFItemSection *)self headerAccessoryButtonTitle];
  id v13 = (id)[v3 appendObject:v12 withName:@"headerAccessoryButtonTitle"];

  v14 = [(HFItemSection *)self headerAccessoryButtonDelegate];
  id v15 = (id)[v3 appendObject:v14 withName:@"headerAccessoryButtonDelegate"];

  id v16 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFItemSection hideAccessoryButton](self, "hideAccessoryButton"), @"hideAccessoryButton");
  id v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFItemSection hideHeaderText](self, "hideHeaderText"), @"hideHeaderText");
  id v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFItemSection forceShowHeaderTitle](self, "forceShowHeaderTitle"), @"forceShowHeaderTitle");
  v19 = [(HFItemSection *)self footerTitle];
  id v20 = (id)[v3 appendObject:v19 withName:@"footerTitle"];

  v21 = [(HFItemSection *)self attributedFooterTitle];
  id v22 = (id)[v3 appendObject:v21 withName:@"attributedFooterTitle"];

  v23 = [(HFItemSection *)self items];
  id v24 = (id)[v3 appendObject:v23 withName:@"items"];

  v25 = [(HFItemSection *)self userInfo];
  id v26 = (id)[v3 appendObject:v25 withName:@"userInfo"];

  v27 = [v3 build];

  return (NSString *)v27;
}

+ (id)defaultItemComparator
{
  return &__block_literal_global_51;
}

uint64_t __38__HFItemSection_defaultItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"title"];

  id v7 = [v4 latestResults];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"title"];

  uint64_t v16 = MEMORY[0x263EF8330];
  id v9 = v6;
  id v17 = v9;
  id v10 = v8;
  id v11 = v10;
  id v18 = v10;
  if (v9) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = v10 != 0;
  }
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = v10;
  }
  else
  {
    uint64_t v12 = objc_msgSend(v9, "localizedStandardCompare:", v10, v16, 3221225472, __38__HFItemSection_defaultItemComparator__block_invoke_2, &unk_264091450, v9);
    v14 = v18;
  }

  return v12;
}

uint64_t __38__HFItemSection_defaultItemComparator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedStandardCompare:*(void *)(a1 + 40)];
}

+ (id)itemResultManualSortComparator
{
  return &__block_literal_global_57;
}

uint64_t __47__HFItemSection_itemResultManualSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"manualSortKey"];

  id v7 = [v4 latestResults];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"manualSortKey"];

  uint64_t v16 = MEMORY[0x263EF8330];
  id v9 = v6;
  id v17 = v9;
  id v10 = v8;
  id v11 = v10;
  id v18 = v10;
  if (v9) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = v10 != 0;
  }
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = v10;
  }
  else
  {
    uint64_t v12 = objc_msgSend(v9, "compare:", v10, v16, 3221225472, __47__HFItemSection_itemResultManualSortComparator__block_invoke_2, &unk_264091450, v9);
    v14 = v18;
  }

  return v12;
}

uint64_t __47__HFItemSection_itemResultManualSortComparator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) compare:*(void *)(a1 + 40)];
}

@end