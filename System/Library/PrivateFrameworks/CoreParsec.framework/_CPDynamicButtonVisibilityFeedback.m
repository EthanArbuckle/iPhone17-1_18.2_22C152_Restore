@interface _CPDynamicButtonVisibilityFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)visibleDynamicButton2s;
- (NSString)cardSectionIdentifier;
- (_CPDynamicButtonVisibilityFeedback)init;
- (_CPDynamicButtonVisibilityFeedback)initWithFacade:(id)a3;
- (id)visibleDynamicButton2sAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)visibleDynamicButton2sCount;
- (void)addVisibleDynamicButton2s:(id)a3;
- (void)clearVisibleDynamicButton2s;
- (void)setCardSectionIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVisibleDynamicButton2s:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPDynamicButtonVisibilityFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleDynamicButton2s, 0);

  objc_storeStrong((id *)&self->_cardSectionIdentifier, 0);
}

- (NSArray)visibleDynamicButton2s
{
  return self->_visibleDynamicButton2s;
}

- (void)setCardSectionIdentifier:(id)a3
{
}

- (NSString)cardSectionIdentifier
{
  return self->_cardSectionIdentifier;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = 2654435761u * self->_timestamp;
  NSUInteger v4 = [(NSString *)self->_cardSectionIdentifier hash];
  return v4 ^ [(NSArray *)self->_visibleDynamicButton2s hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_13;
  }
  v6 = [(_CPDynamicButtonVisibilityFeedback *)self cardSectionIdentifier];
  v7 = [v4 cardSectionIdentifier];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(_CPDynamicButtonVisibilityFeedback *)self cardSectionIdentifier];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPDynamicButtonVisibilityFeedback *)self cardSectionIdentifier];
    v11 = [v4 cardSectionIdentifier];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(_CPDynamicButtonVisibilityFeedback *)self visibleDynamicButton2s];
  v7 = [v4 visibleDynamicButton2s];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(_CPDynamicButtonVisibilityFeedback *)self visibleDynamicButton2s];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(_CPDynamicButtonVisibilityFeedback *)self visibleDynamicButton2s];
    v16 = [v4 visibleDynamicButton2s];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPDynamicButtonVisibilityFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  v5 = [(_CPDynamicButtonVisibilityFeedback *)self cardSectionIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_visibleDynamicButton2s;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPDynamicButtonVisibilityFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)visibleDynamicButton2sAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_visibleDynamicButton2s objectAtIndexedSubscript:a3];
}

- (unint64_t)visibleDynamicButton2sCount
{
  return [(NSArray *)self->_visibleDynamicButton2s count];
}

- (void)addVisibleDynamicButton2s:(id)a3
{
  id v4 = a3;
  visibleDynamicButton2s = self->_visibleDynamicButton2s;
  id v8 = v4;
  if (!visibleDynamicButton2s)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_visibleDynamicButton2s;
    self->_visibleDynamicButton2s = v6;

    id v4 = v8;
    visibleDynamicButton2s = self->_visibleDynamicButton2s;
  }
  [(NSArray *)visibleDynamicButton2s addObject:v4];
}

- (void)clearVisibleDynamicButton2s
{
}

- (void)setVisibleDynamicButton2s:(id)a3
{
  self->_visibleDynamicButton2s = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPDynamicButtonVisibilityFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPDynamicButtonVisibilityFeedback;
  v2 = [(_CPDynamicButtonVisibilityFeedback *)&v5 init];
  if (v2)
  {
    [(_CPDynamicButtonVisibilityFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPDynamicButtonVisibilityFeedback)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(_CPDynamicButtonVisibilityFeedback *)self init];
  if (v5)
  {
    -[_CPDynamicButtonVisibilityFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 buttons];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v9 = objc_msgSend(v4, "buttons", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = [[_CPButtonForFeedback alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
            [v8 addObject:v14];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }

      [(_CPDynamicButtonVisibilityFeedback *)v5 setVisibleDynamicButton2s:v8];
    }
    v15 = [v4 cardSection];

    if (v15)
    {
      uint64_t v16 = [v4 cardSection];
      char v17 = [v16 cardSectionId];
      [(_CPDynamicButtonVisibilityFeedback *)v5 setCardSectionIdentifier:v17];
    }
    BOOL v18 = v5;
  }

  return v5;
}

@end