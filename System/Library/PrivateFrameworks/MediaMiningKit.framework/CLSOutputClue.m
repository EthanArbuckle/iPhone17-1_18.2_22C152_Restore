@interface CLSOutputClue
- (CLSOutputClue)init;
- (CLSPersonIdentity)relatedPerson;
- (id)description;
- (id)relatedInputLocationClues;
- (void)addRelatedInputLocationClues:(id)a3;
- (void)setRelatedPerson:(id)a3;
@end

@implementation CLSOutputClue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPerson, 0);
  objc_storeStrong((id *)&self->_relatedInputLocationClues, 0);
}

- (void)setRelatedPerson:(id)a3
{
}

- (CLSPersonIdentity)relatedPerson
{
  return (CLSPersonIdentity *)objc_getProperty(self, a2, 104, 1);
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)CLSOutputClue;
  v4 = [(CLSClue *)&v9 description];
  v5 = [v3 stringWithString:v4];

  if ([(NSMutableArray *)self->_relatedInputLocationClues count])
  {
    v6 = [(NSMutableArray *)self->_relatedInputLocationClues valueForKeyPath:@"address"];
    v7 = [v6 flattenWithSeparator:@", "];
    [v5 appendFormat:@"\n\trelatedLocation:[%@]", v7];
  }
  if (self->_relatedPerson) {
    [v5 appendFormat:@"\n\trelatedPerson:[%@]", self->_relatedPerson];
  }
  return v5;
}

- (id)relatedInputLocationClues
{
  v2 = (void *)[(NSMutableArray *)self->_relatedInputLocationClues copy];
  return v2;
}

- (void)addRelatedInputLocationClues:(id)a3
{
}

- (CLSOutputClue)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSOutputClue;
  v2 = [(CLSClue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    relatedInputLocationClues = v2->_relatedInputLocationClues;
    v2->_relatedInputLocationClues = (NSMutableArray *)v3;
  }
  return v2;
}

@end