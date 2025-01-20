@interface CRBasicCard
+ (BOOL)supportsSecureCoding;
- (BOOL)asynchronous;
- (CRBasicCard)init;
- (CRBasicCard)initWithCoder:(id)a3;
- (NSArray)cardSections;
- (NSArray)dismissalCommands;
- (NSSet)interactions;
- (NSString)cardIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cardFormat;
- (void)encodeWithCoder:(id)a3;
- (void)loadCardWithCompletion:(id)a3;
- (void)setCardSections:(id)a3;
- (void)setDismissalCommands:(id)a3;
- (void)setInteractions:(id)a3;
@end

@implementation CRBasicCard

- (void)loadCardWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, CRBasicCard *))a3 + 2))(a3, self);
  }
}

- (BOOL)asynchronous
{
  return 0;
}

- (CRBasicCard)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBasicCard;
  v2 = [(CRBasicCard *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    cardIdentifier = v2->_cardIdentifier;
    v2->_cardIdentifier = (NSString *)v4;
  }
  return v2;
}

- (CRBasicCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRBasicCard;
  v5 = [(CRBasicCard *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = NSStringFromSelector(sel_cardSections);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    cardSections = v5->_cardSections;
    v5->_cardSections = (NSArray *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = NSStringFromSelector(sel_interactions);
    uint64_t v16 = [v4 decodeObjectOfClasses:v14 forKey:v15];
    interactions = v5->_interactions;
    v5->_interactions = (NSSet *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cardSections = self->_cardSections;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_cardSections);
  [v5 encodeObject:cardSections forKey:v6];

  interactions = self->_interactions;
  NSStringFromSelector(sel_interactions);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:interactions forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CRBasicCard);
  id v5 = [(CRBasicCard *)self cardSections];
  v6 = [v5 _deepCopy];
  [(CRBasicCard *)v4 setCardSections:v6];

  uint64_t v7 = [(CRBasicCard *)self interactions];
  id v8 = [v7 _deepCopy];
  [(CRBasicCard *)v4 setInteractions:v8];

  return v4;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (unint64_t)cardFormat
{
  return self->cardFormat;
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (void)setCardSections:(id)a3
{
}

- (NSSet)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
}

- (NSArray)dismissalCommands
{
  return self->_dismissalCommands;
}

- (void)setDismissalCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalCommands, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

@end