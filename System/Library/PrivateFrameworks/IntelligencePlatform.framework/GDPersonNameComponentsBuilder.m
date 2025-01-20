@interface GDPersonNameComponentsBuilder
- (GDPersonNameComponentsBuilder)init;
- (NSMutableArray)familyNames;
- (NSMutableArray)givenNames;
- (NSMutableArray)middleNames;
- (NSMutableArray)nicknames;
- (NSMutableArray)prefixes;
- (NSMutableArray)suffixes;
- (void)setFamilyNames:(id)a3;
- (void)setGivenNames:(id)a3;
- (void)setMiddleNames:(id)a3;
- (void)setNicknames:(id)a3;
- (void)setPrefixes:(id)a3;
- (void)setSuffixes:(id)a3;
@end

@implementation GDPersonNameComponentsBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknames, 0);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_familyNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);

  objc_storeStrong((id *)&self->_prefixes, 0);
}

- (void)setNicknames:(id)a3
{
}

- (NSMutableArray)nicknames
{
  return self->_nicknames;
}

- (void)setSuffixes:(id)a3
{
}

- (NSMutableArray)suffixes
{
  return self->_suffixes;
}

- (void)setFamilyNames:(id)a3
{
}

- (NSMutableArray)familyNames
{
  return self->_familyNames;
}

- (void)setMiddleNames:(id)a3
{
}

- (NSMutableArray)middleNames
{
  return self->_middleNames;
}

- (void)setGivenNames:(id)a3
{
}

- (NSMutableArray)givenNames
{
  return self->_givenNames;
}

- (void)setPrefixes:(id)a3
{
}

- (NSMutableArray)prefixes
{
  return self->_prefixes;
}

- (GDPersonNameComponentsBuilder)init
{
  v16.receiver = self;
  v16.super_class = (Class)GDPersonNameComponentsBuilder;
  v2 = [(GDPersonNameComponentsBuilder *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    prefixes = v2->_prefixes;
    v2->_prefixes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    givenNames = v2->_givenNames;
    v2->_givenNames = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    middleNames = v2->_middleNames;
    v2->_middleNames = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    familyNames = v2->_familyNames;
    v2->_familyNames = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    suffixes = v2->_suffixes;
    v2->_suffixes = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    nicknames = v2->_nicknames;
    v2->_nicknames = (NSMutableArray *)v13;
  }
  return v2;
}

@end