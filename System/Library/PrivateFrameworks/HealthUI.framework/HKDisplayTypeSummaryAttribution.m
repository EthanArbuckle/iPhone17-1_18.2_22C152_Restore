@interface HKDisplayTypeSummaryAttribution
- (BOOL)hasLink;
- (BOOL)isEqual:(id)a3;
- (BOOL)primaryProfileOnly;
- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 hasLink:(BOOL)a4 primaryProfileOnly:(BOOL)a5;
- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 urlAttribute:(id)a4 iPadUrlAttribute:(id)a5 primaryProfileOnly:(BOOL)a6;
- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 urlAttribute:(id)a4 primaryProfileOnly:(BOOL)a5;
- (NSAttributedString)attribution;
- (unint64_t)hash;
@end

@implementation HKDisplayTypeSummaryAttribution

- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 urlAttribute:(id)a4 primaryProfileOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E4F28E48];
  id v10 = a3;
  v11 = (void *)[[v9 alloc] initWithString:v10];

  if (v8 && [v11 length])
  {
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v8, 0, objc_msgSend(v11, "length"));
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = [(HKDisplayTypeSummaryAttribution *)self initWithAttribution:v11 hasLink:v12 primaryProfileOnly:v5];

  return v13;
}

- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 hasLink:(BOOL)a4 primaryProfileOnly:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKDisplayTypeSummaryAttribution;
  v9 = [(HKDisplayTypeSummaryAttribution *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    attribution = v9->_attribution;
    v9->_attribution = (NSAttributedString *)v10;

    v9->_hasLink = a4;
    v9->_primaryProfileOnly = a5;
  }

  return v9;
}

- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 urlAttribute:(id)a4 iPadUrlAttribute:(id)a5 primaryProfileOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F2B860];
  id v13 = a3;
  v14 = [v12 sharedBehavior];
  int v15 = [v14 isiPad];

  v16 = [HKDisplayTypeSummaryAttribution alloc];
  if (v15) {
    id v17 = v11;
  }
  else {
    id v17 = v10;
  }
  v18 = [(HKDisplayTypeSummaryAttribution *)v16 initWithAttribution:v13 urlAttribute:v17 primaryProfileOnly:v6];

  return v18;
}

- (unint64_t)hash
{
  return [(NSAttributedString *)self->_attribution hash] ^ self->_hasLink ^ (2 * self->_primaryProfileOnly);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0
    && [(NSAttributedString *)self->_attribution isEqualToAttributedString:v4[2]]
    && self->_hasLink == *((unsigned __int8 *)v4 + 8)
    && self->_primaryProfileOnly == *((unsigned __int8 *)v4 + 9);

  return v5;
}

- (NSAttributedString)attribution
{
  return self->_attribution;
}

- (BOOL)hasLink
{
  return self->_hasLink;
}

- (BOOL)primaryProfileOnly
{
  return self->_primaryProfileOnly;
}

- (void).cxx_destruct
{
}

@end