@interface _CPCardForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)cardSections;
- (NSString)fbr;
- (_CPCardForFeedback)initWithFacade:(id)a3;
- (id)cardSectionsAtIndex:(unint64_t)a3;
- (unint64_t)cardSectionsCount;
- (unint64_t)hash;
- (void)addCardSections:(id)a3;
- (void)clearCardSections;
- (void)setCardSections:(id)a3;
- (void)setFbr:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCardForFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbr, 0);

  objc_storeStrong((id *)&self->_cardSections, 0);
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_cardSections hash];
  return [(NSString *)self->_fbr hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_CPCardForFeedback *)self cardSections];
  v6 = [v4 cardSections];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_CPCardForFeedback *)self cardSections];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_CPCardForFeedback *)self cardSections];
    v10 = [v4 cardSections];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_CPCardForFeedback *)self fbr];
  v6 = [v4 fbr];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_CPCardForFeedback *)self fbr];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_CPCardForFeedback *)self fbr];
    v15 = [v4 fbr];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_cardSections;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10 = [(_CPCardForFeedback *)self fbr];

  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardForFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)cardSectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_cardSections objectAtIndexedSubscript:a3];
}

- (unint64_t)cardSectionsCount
{
  return [(NSArray *)self->_cardSections count];
}

- (void)addCardSections:(id)a3
{
  id v4 = a3;
  cardSections = self->_cardSections;
  id v8 = v4;
  if (!cardSections)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_cardSections;
    self->_cardSections = v6;

    id v4 = v8;
    cardSections = self->_cardSections;
  }
  [(NSArray *)cardSections addObject:v4];
}

- (void)clearCardSections
{
}

- (void)setCardSections:(id)a3
{
  self->_cardSections = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPCardForFeedback)initWithFacade:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_CPCardForFeedback;
  v5 = [(_CPCardForFeedback *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 cardSections];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = objc_msgSend(v4, "cardSections", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [[_CPCardSectionForFeedback alloc] initWithFacade:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    [(_CPCardForFeedback *)v5 setCardSections:v7];
    long long v14 = [v4 fbr];

    if (v14)
    {
      v15 = [v4 fbr];
      [(_CPCardForFeedback *)v5 setFbr:v15];
    }
    uint64_t v16 = v5;
  }
  return v5;
}

@end