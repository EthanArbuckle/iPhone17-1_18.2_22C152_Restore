@interface INUICKPCardInterfaceSection
- (BOOL)isEqual:(id)a3;
- (BOOL)isWildCardSection;
- (CRCardSection)cardSection;
- (INUICKPCardInterfaceSection)initWithInteractiveBehavior:(unint64_t)a3 parameters:(id)a4;
- (NSSet)parameters;
- (unint64_t)hash;
- (void)setCardSection:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation INUICKPCardInterfaceSection

- (INUICKPCardInterfaceSection)initWithInteractiveBehavior:(unint64_t)a3 parameters:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INUICKPCardInterfaceSection;
  v8 = [(INUIInterfaceSection *)&v11 initWithInteractiveBehavior:a3 parameters:v7];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_cardSectionParameters, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INUICKPCardInterfaceSection *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)INUICKPCardInterfaceSection;
    if ([(INUIInterfaceSection *)&v12 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(INUICKPCardInterfaceSection *)self cardSection];
      id v7 = [v6 cardSectionIdentifier];
      v8 = [(INUICKPCardInterfaceSection *)v5 cardSection];

      v9 = [v8 cardSectionIdentifier];
      char v10 = [v7 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)INUICKPCardInterfaceSection;
  unint64_t v3 = [(INUIInterfaceSection *)&v5 hash];
  return [(CRCardSection *)self->_cardSection hash] ^ v3;
}

- (BOOL)isWildCardSection
{
  unint64_t v3 = [(INUICKPCardInterfaceSection *)self parameters];
  if (v3)
  {
    v4 = [(INUICKPCardInterfaceSection *)self parameters];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSSet)parameters
{
  return self->_cardSectionParameters;
}

- (void)setParameters:(id)a3
{
}

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_cardSectionParameters, 0);
}

@end