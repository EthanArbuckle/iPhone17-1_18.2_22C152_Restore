@interface CRBasicCardSection
+ (BOOL)supportsSecureCoding;
+ (id)basicCardSectionWithBackingCardSection:(id)a3;
- (CRBasicCardSection)init;
- (CRBasicCardSection)initWithCoder:(id)a3;
- (NSString)cardSectionIdentifier;
- (SFCardSection)backingCardSection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackingCardSection:(id)a3;
@end

@implementation CRBasicCardSection

- (CRBasicCardSection)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBasicCardSection;
  v2 = [(CRBasicCardSection *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    cardSectionIdentifier = v2->_cardSectionIdentifier;
    v2->_cardSectionIdentifier = (NSString *)v4;
  }
  return v2;
}

- (CRBasicCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRBasicCardSection;
  v5 = [(CRBasicCardSection *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_backingCardSection);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    backingCardSection = v5->_backingCardSection;
    v5->_backingCardSection = (SFCardSection *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_cardSectionIdentifier);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    cardSectionIdentifier = v5->_cardSectionIdentifier;
    v5->_cardSectionIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  backingCardSection = self->_backingCardSection;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_backingCardSection);
  [v5 encodeObject:backingCardSection forKey:v6];

  cardSectionIdentifier = self->_cardSectionIdentifier;
  NSStringFromSelector(sel_cardSectionIdentifier);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:cardSectionIdentifier forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CRBasicCardSection);
  [(CRBasicCardSection *)v4 setBackingCardSection:self->_backingCardSection];
  return v4;
}

+ (id)basicCardSectionWithBackingCardSection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CRBasicCardSection);
  [(CRBasicCardSection *)v4 setBackingCardSection:v3];

  return v4;
}

- (NSString)cardSectionIdentifier
{
  return self->_cardSectionIdentifier;
}

- (SFCardSection)backingCardSection
{
  return self->_backingCardSection;
}

- (void)setBackingCardSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCardSection, 0);
  objc_storeStrong((id *)&self->_cardSectionIdentifier, 0);
}

@end