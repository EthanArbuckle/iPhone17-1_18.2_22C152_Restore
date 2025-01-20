@interface _CPCardSectionForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)buttons;
- (NSArray)cardSections;
- (NSArray)leadingSwipeButtonItems;
- (NSArray)trailingSwipeButtonItems;
- (NSString)actionDestination;
- (NSString)actionTarget;
- (NSString)cardSectionDetail;
- (NSString)cardSectionId;
- (NSString)commandDetail;
- (NSString)resultId;
- (_CPCardSectionForFeedback)initWithFacade:(id)a3;
- (id)buttonsAtIndex:(unint64_t)a3;
- (id)cardSectionsAtIndex:(unint64_t)a3;
- (id)leadingSwipeButtonItemsAtIndex:(unint64_t)a3;
- (id)trailingSwipeButtonItemsAtIndex:(unint64_t)a3;
- (int)cardSectionType;
- (int)commandType;
- (unint64_t)buttonsCount;
- (unint64_t)cardSectionsCount;
- (unint64_t)hash;
- (unint64_t)leadingSwipeButtonItemsCount;
- (unint64_t)trailingSwipeButtonItemsCount;
- (void)addButtons:(id)a3;
- (void)addCardSections:(id)a3;
- (void)addLeadingSwipeButtonItems:(id)a3;
- (void)addTrailingSwipeButtonItems:(id)a3;
- (void)clearButtons;
- (void)clearCardSections;
- (void)clearLeadingSwipeButtonItems;
- (void)clearTrailingSwipeButtonItems;
- (void)setActionDestination:(id)a3;
- (void)setActionTarget:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCardSectionDetail:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setCardSectionType:(int)a3;
- (void)setCardSections:(id)a3;
- (void)setCommandDetail:(id)a3;
- (void)setCommandType:(int)a3;
- (void)setLeadingSwipeButtonItems:(id)a3;
- (void)setResultId:(id)a3;
- (void)setTrailingSwipeButtonItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCardSectionForFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_cardSectionDetail, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_actionDestination, 0);
  objc_storeStrong((id *)&self->_actionTarget, 0);

  objc_storeStrong((id *)&self->_cardSectionId, 0);
}

- (NSArray)trailingSwipeButtonItems
{
  return self->_trailingSwipeButtonItems;
}

- (NSArray)leadingSwipeButtonItems
{
  return self->_leadingSwipeButtonItems;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setCardSectionDetail:(id)a3
{
}

- (NSString)cardSectionDetail
{
  return self->_cardSectionDetail;
}

- (void)setCardSectionType:(int)a3
{
  self->_cardSectionType = a3;
}

- (int)cardSectionType
{
  return self->_cardSectionType;
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (void)setCommandDetail:(id)a3
{
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setResultId:(id)a3
{
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setActionDestination:(id)a3
{
}

- (NSString)actionDestination
{
  return self->_actionDestination;
}

- (void)setActionTarget:(id)a3
{
}

- (NSString)actionTarget
{
  return self->_actionTarget;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cardSectionId hash];
  NSUInteger v4 = [(NSString *)self->_actionTarget hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_actionDestination hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_resultId hash];
  uint64_t v7 = 2654435761 * self->_commandType;
  NSUInteger v8 = v6 ^ [(NSString *)self->_commandDetail hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_cardSections hash] ^ v7;
  uint64_t v10 = 2654435761 * self->_cardSectionType;
  NSUInteger v11 = v9 ^ v10 ^ [(NSString *)self->_cardSectionDetail hash];
  uint64_t v12 = [(NSArray *)self->_buttons hash];
  uint64_t v13 = v12 ^ [(NSArray *)self->_leadingSwipeButtonItems hash];
  return v11 ^ v13 ^ [(NSArray *)self->_trailingSwipeButtonItems hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self cardSectionId];
  NSUInteger v6 = [v4 cardSectionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v7 = [(_CPCardSectionForFeedback *)self cardSectionId];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_CPCardSectionForFeedback *)self cardSectionId];
    uint64_t v10 = [v4 cardSectionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self actionTarget];
  NSUInteger v6 = [v4 actionTarget];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v12 = [(_CPCardSectionForFeedback *)self actionTarget];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_CPCardSectionForFeedback *)self actionTarget];
    v15 = [v4 actionTarget];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self actionDestination];
  NSUInteger v6 = [v4 actionDestination];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v17 = [(_CPCardSectionForFeedback *)self actionDestination];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_CPCardSectionForFeedback *)self actionDestination];
    v20 = [v4 actionDestination];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self resultId];
  NSUInteger v6 = [v4 resultId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v22 = [(_CPCardSectionForFeedback *)self resultId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_CPCardSectionForFeedback *)self resultId];
    v25 = [v4 resultId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  int commandType = self->_commandType;
  if (commandType != [v4 commandType]) {
    goto LABEL_54;
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self commandDetail];
  NSUInteger v6 = [v4 commandDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v28 = [(_CPCardSectionForFeedback *)self commandDetail];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(_CPCardSectionForFeedback *)self commandDetail];
    v31 = [v4 commandDetail];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self cardSections];
  NSUInteger v6 = [v4 cardSections];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v33 = [(_CPCardSectionForFeedback *)self cardSections];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_CPCardSectionForFeedback *)self cardSections];
    v36 = [v4 cardSections];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  int cardSectionType = self->_cardSectionType;
  if (cardSectionType != [v4 cardSectionType]) {
    goto LABEL_54;
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self cardSectionDetail];
  NSUInteger v6 = [v4 cardSectionDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v39 = [(_CPCardSectionForFeedback *)self cardSectionDetail];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(_CPCardSectionForFeedback *)self cardSectionDetail];
    v42 = [v4 cardSectionDetail];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self buttons];
  NSUInteger v6 = [v4 buttons];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v44 = [(_CPCardSectionForFeedback *)self buttons];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(_CPCardSectionForFeedback *)self buttons];
    v47 = [v4 buttons];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self leadingSwipeButtonItems];
  NSUInteger v6 = [v4 leadingSwipeButtonItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_53;
  }
  uint64_t v49 = [(_CPCardSectionForFeedback *)self leadingSwipeButtonItems];
  if (v49)
  {
    v50 = (void *)v49;
    v51 = [(_CPCardSectionForFeedback *)self leadingSwipeButtonItems];
    v52 = [v4 leadingSwipeButtonItems];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_54;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self trailingSwipeButtonItems];
  NSUInteger v6 = [v4 trailingSwipeButtonItems];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v54 = [(_CPCardSectionForFeedback *)self trailingSwipeButtonItems];
  if (!v54)
  {

LABEL_57:
    BOOL v59 = 1;
    goto LABEL_55;
  }
  v55 = (void *)v54;
  v56 = [(_CPCardSectionForFeedback *)self trailingSwipeButtonItems];
  v57 = [v4 trailingSwipeButtonItems];
  char v58 = [v56 isEqual:v57];

  if (v58) {
    goto LABEL_57;
  }
LABEL_54:
  BOOL v59 = 0;
LABEL_55:

  return v59;
}

- (void)writeTo:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self cardSectionId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(_CPCardSectionForFeedback *)self actionTarget];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_CPCardSectionForFeedback *)self actionDestination];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(_CPCardSectionForFeedback *)self resultId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPCardSectionForFeedback *)self commandType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v9 = [(_CPCardSectionForFeedback *)self commandDetail];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v10 = self->_cardSections;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v12);
  }

  if ([(_CPCardSectionForFeedback *)self cardSectionType]) {
    PBDataWriterWriteInt32Field();
  }
  v15 = [(_CPCardSectionForFeedback *)self cardSectionDetail];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v16 = self->_buttons;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v18);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v21 = self->_leadingSwipeButtonItems;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v23);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v26 = self->_trailingSwipeButtonItems;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v28);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardSectionForFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)trailingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_trailingSwipeButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)trailingSwipeButtonItemsCount
{
  return [(NSArray *)self->_trailingSwipeButtonItems count];
}

- (void)addTrailingSwipeButtonItems:(id)a3
{
  id v4 = a3;
  trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  id v8 = v4;
  if (!trailingSwipeButtonItems)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_trailingSwipeButtonItems;
    self->_trailingSwipeButtonItems = v6;

    id v4 = v8;
    trailingSwipeButtonItems = self->_trailingSwipeButtonItems;
  }
  [(NSArray *)trailingSwipeButtonItems addObject:v4];
}

- (void)clearTrailingSwipeButtonItems
{
}

- (void)setTrailingSwipeButtonItems:(id)a3
{
  self->_trailingSwipeButtonItems = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)leadingSwipeButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_leadingSwipeButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)leadingSwipeButtonItemsCount
{
  return [(NSArray *)self->_leadingSwipeButtonItems count];
}

- (void)addLeadingSwipeButtonItems:(id)a3
{
  id v4 = a3;
  leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  id v8 = v4;
  if (!leadingSwipeButtonItems)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_leadingSwipeButtonItems;
    self->_leadingSwipeButtonItems = v6;

    id v4 = v8;
    leadingSwipeButtonItems = self->_leadingSwipeButtonItems;
  }
  [(NSArray *)leadingSwipeButtonItems addObject:v4];
}

- (void)clearLeadingSwipeButtonItems
{
}

- (void)setLeadingSwipeButtonItems:(id)a3
{
  self->_leadingSwipeButtonItems = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)buttonsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_buttons objectAtIndexedSubscript:a3];
}

- (unint64_t)buttonsCount
{
  return [(NSArray *)self->_buttons count];
}

- (void)addButtons:(id)a3
{
  id v4 = a3;
  buttons = self->_buttons;
  id v8 = v4;
  if (!buttons)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_buttons;
    self->_buttons = v6;

    id v4 = v8;
    buttons = self->_buttons;
  }
  [(NSArray *)buttons addObject:v4];
}

- (void)clearButtons
{
}

- (void)setButtons:(id)a3
{
  self->_buttons = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
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

- (_CPCardSectionForFeedback)initWithFacade:(id)a3
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_CPCardSectionForFeedback *)self init];
  if (v5)
  {
    NSUInteger v6 = [v4 cardSectionId];
    [(_CPCardSectionForFeedback *)v5 setCardSectionId:v6];

    uint64_t v7 = [v4 resultIdentifier];
    [(_CPCardSectionForFeedback *)v5 setResultId:v7];

    id v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v9 preferredOpenableURL];
    uint64_t v11 = [v10 absoluteString];
    [(_CPCardSectionForFeedback *)v5 setActionDestination:v11];

    if ([v4 isMemberOfClass:objc_opt_class()]
      || [v4 isMemberOfClass:objc_opt_class()])
    {
      goto LABEL_4;
    }
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v12 = [v4 buttons];
      goto LABEL_5;
    }
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      v55 = [v4 buttonItem];

      if (v55)
      {
        v56 = [v4 buttonItem];
        v91[0] = v56;
        uint64_t v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
LABEL_149:
        uint64_t v13 = (void *)v57;

LABEL_6:
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v15 = v14;
        if (v13)
        {
          [v14 addObjectsFromArray:v13];
        }
LABEL_8:
        int v16 = [v4 leadingSwipeButtonItems];

        if (v16)
        {
          uint64_t v17 = [v4 leadingSwipeButtonItems];
          [v15 addObjectsFromArray:v17];
        }
        uint64_t v18 = [v4 trailingSwipeButtonItems];

        if (v18)
        {
          uint64_t v19 = [v4 trailingSwipeButtonItems];
          [v15 addObjectsFromArray:v19];
        }
        id v66 = v15;
        if ([v15 count])
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v21 = v15;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v83 objects:v90 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v84;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v84 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v83 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v27 = [[_CPButtonForFeedback alloc] initWithFacade:v26];
                  [v20 addObject:v27];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v83 objects:v90 count:16];
            }
            while (v23);
          }

          [(_CPCardSectionForFeedback *)v5 setButtons:v20];
          id v15 = v66;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_24;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v28 = [v4 buttonCardSections];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
LABEL_24:
            uint64_t v28 = [v4 cardSections];
            goto LABEL_27;
          }
          uint64_t v28 = 0;
        }
LABEL_27:
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v79 objects:v89 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v80;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v80 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = [[_CPCardSectionForFeedback alloc] initWithFacade:*(void *)(*((void *)&v79 + 1) + 8 * j)];
              [(_CPCardSectionForFeedback *)v5 addCardSections:v34];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v79 objects:v89 count:16];
          }
          while (v31);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v64 = v29;
          id v65 = v4;
          id v35 = v4;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          obuint64_t j = [v35 infoTuples];
          uint64_t v69 = [obj countByEnumeratingWithState:&v75 objects:v88 count:16];
          if (v69)
          {
            uint64_t v68 = *(void *)v76;
            do
            {
              uint64_t v36 = 0;
              do
              {
                if (*(void *)v76 != v68) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v70 = v36;
                long long v37 = *(void **)(*((void *)&v75 + 1) + 8 * v36);
                long long v71 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v38 = [v37 values];
                uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v87 count:16];
                if (v39)
                {
                  uint64_t v40 = v39;
                  uint64_t v41 = *(void *)v72;
                  do
                  {
                    for (uint64_t k = 0; k != v40; ++k)
                    {
                      if (*(void *)v72 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      long long v43 = *(void **)(*((void *)&v71 + 1) + 8 * k);
                      long long v44 = objc_opt_new();
                      long long v45 = [v35 cardSectionId];
                      [v44 setCardSectionId:v45];

                      long long v46 = [v43 command];
                      objc_msgSend(v44, "setCommandType:", objc_msgSend(v46, "_cpCommandType"));

                      v47 = [v43 command];
                      int v48 = [v47 commandDetail];
                      [v44 setCommandDetail:v48];

                      [(_CPCardSectionForFeedback *)v5 addCardSections:v44];
                    }
                    uint64_t v40 = [v38 countByEnumeratingWithState:&v71 objects:v87 count:16];
                  }
                  while (v40);
                }

                uint64_t v36 = v70 + 1;
              }
              while (v70 + 1 != v69);
              uint64_t v69 = [obj countByEnumeratingWithState:&v75 objects:v88 count:16];
            }
            while (v69);
          }

          id v4 = v65;
          id v15 = v66;
          id v29 = v64;
        }
        uint64_t v49 = [v4 command];
        -[_CPCardSectionForFeedback setCommandType:](v5, "setCommandType:", [v49 _cpCommandType]);

        v50 = [v4 commandDetail];
        [(_CPCardSectionForFeedback *)v5 setCommandDetail:v50];

        uint64_t v51 = [v4 type];

        if (v51)
        {
          id v52 = [v4 type];
          if ([v52 compare:@"none" options:3])
          {
            if ([v52 compare:@"app_link" options:3])
            {
              if ([v52 compare:@"description" options:3])
              {
                uint64_t v53 = 3;
                if ([v52 compare:@"key_value_data" options:3])
                {
                  if ([v52 compare:@"map" options:3])
                  {
                    if ([v52 compare:@"media_info" options:3])
                    {
                      if ([v52 compare:@"media_player" options:3])
                      {
                        if ([v52 compare:@"now_playing" options:3])
                        {
                          if ([v52 compare:@"rich_title" options:3])
                          {
                            if ([v52 compare:@"row" options:3])
                            {
                              if ([v52 compare:@"scoreboard" options:3])
                              {
                                if ([v52 compare:@"social_media_post" options:3])
                                {
                                  if ([v52 compare:@"stock_chart" options:3])
                                  {
                                    if ([v52 compare:@"table_header_row" options:3])
                                    {
                                      if ([v52 compare:@"table_row" options:3])
                                      {
                                        if ([v52 compare:@"text_columns" options:3])
                                        {
                                          if ([v52 compare:@"title" options:3])
                                          {
                                            if ([v52 compare:@"track_list" options:3])
                                            {
                                              if ([v52 compare:@"audio_playback" options:3])
                                              {
                                                if ([v52 compare:@"flight" options:3])
                                                {
                                                  if ([v52 compare:@"activity_indicator" options:3])
                                                  {
                                                    if ([v52 compare:@"web" options:3])
                                                    {
                                                      if ([v52 compare:@"message" options:3])
                                                      {
                                                        if ([v52 compare:@"detailed_row" options:3])
                                                        {
                                                          if ([v52 compare:@"images" options:3])
                                                          {
                                                            if ([v52 compare:@"suggestion" options:3])
                                                            {
                                                              if ([v52 compare:@"selectable_grid" options:3])
                                                              {
                                                                if ([v52 compare:@"section_header" options:3])
                                                                {
                                                                  if ([v52 compare:@"meta_info" options:3])
                                                                  {
                                                                    if ([v52 compare:@"watch_list" options:3])
                                                                    {
                                                                      if ([v52 compare:@"maps_detailed_row" options:3])
                                                                      {
                                                                        if ([v52 compare:@"button" options:3])
                                                                        {
                                                                          if ([v52 compare:@"horizontal_button" options:3])
                                                                          {
                                                                            if ([v52 compare:@"vertical_layout" options:3])
                                                                            {
                                                                              if ([v52 compare:@"product" options:3])
                                                                              {
                                                                                if ([v52 compare:@"horizontal_scroll" options:3])
                                                                                {
                                                                                  if ([v52 compare:@"media_remote_control" options:3])
                                                                                  {
                                                                                    if ([v52 compare:@"map_place" options:3])
                                                                                    {
                                                                                      if ([v52 compare:@"compact_row" options:3])
                                                                                      {
                                                                                        if ([v52 compare:@"world_map" options:3])
                                                                                        {
                                                                                          if ([v52 compare:@"attribution_footer" options:3])
                                                                                          {
                                                                                            if ([v52 compare:@"grid" options:3])
                                                                                            {
                                                                                              if ([v52 compare:@"person_header" options:3])
                                                                                              {
                                                                                                if ([v52 compare:@"color_bar" options:3])
                                                                                                {
                                                                                                  if ([v52 compare:@"split" options:3])
                                                                                                  {
                                                                                                    if ([v52 compare:@"link_presentation" options:3])
                                                                                                    {
                                                                                                      if ([v52 compare:@"find_my" options:3])
                                                                                                      {
                                                                                                        if ([v52 compare:@"hero" options:3])
                                                                                                        {
                                                                                                          if ([v52 compare:@"news" options:3])
                                                                                                          {
                                                                                                            if ([v52 compare:@"mini" options:3])
                                                                                                            {
                                                                                                              if ([v52 compare:@"info" options:3])
                                                                                                              {
                                                                                                                if ([v52 compare:@"collection" options:3])
                                                                                                                {
                                                                                                                  if ([v52 compare:@"combined" options:3])
                                                                                                                  {
                                                                                                                    if ([v52 compare:@"response_wrapper" options:3])
                                                                                                                    {
                                                                                                                      if ([v52 compare:@"listen_to" options:3])
                                                                                                                      {
                                                                                                                        if ([v52 compare:@"watch_now" options:3])
                                                                                                                        {
                                                                                                                          if ([v52 compare:@"stroke_animation" options:3])
                                                                                                                          {
                                                                                                                            if ([v52 compare:@"button_list" options:3])
                                                                                                                            {
                                                                                                                              if ([v52 compare:@"command_row" options:3])
                                                                                                                              {
                                                                                                                                if ([v52 compare:@"leading_trailing" options:3])
                                                                                                                                {
                                                                                                                                  if ([v52 compare:@"hero_title" options:3])
                                                                                                                                  {
                                                                                                                                    if ([v52 compare:@"archive_view" options:3])
                                                                                                                                    {
                                                                                                                                      if ([v52 compare:@"app_icon" options:3])
                                                                                                                                      {
                                                                                                                                        if ([v52 compare:@"large_title_detailed_row" options:3])
                                                                                                                                        {
                                                                                                                                          if ([v52 compare:@"rf_summary_item_short_number" options:3])
                                                                                                                                          {
                                                                                                                                            if ([v52 compare:@"rf_summary_item_text" options:3])
                                                                                                                                            {
                                                                                                                                              if ([v52 compare:@"rf_summary_item_standard" options:3])
                                                                                                                                              {
                                                                                                                                                if ([v52 compare:@"rf_fact_item_short_number" options:3])
                                                                                                                                                {
                                                                                                                                                  if ([v52 compare:@"rf_fact_item_standard" options:3])
                                                                                                                                                  {
                                                                                                                                                    if ([v52 compare:@"rf_long_item_standard" options:3])
                                                                                                                                                    {
                                                                                                                                                      if ([v52 compare:@"rf_primary_header_rich" options:3])
                                                                                                                                                      {
                                                                                                                                                        if ([v52 compare:@"rf_primary_header_standard" options:3])
                                                                                                                                                        {
                                                                                                                                                          if ([v52 compare:@"rf_reference_footnote" options:3])
                                                                                                                                                          {
                                                                                                                                                            if ([v52 compare:@"rf_reference_rich" options:3])
                                                                                                                                                            {
                                                                                                                                                              if ([v52 compare:@"rf_simple_item_rich" options:3])
                                                                                                                                                              {
                                                                                                                                                                if ([v52 compare:@"rf_simple_item_standard" options:3])
                                                                                                                                                                {
                                                                                                                                                                  if ([v52 compare:@"rf_summary_item_aligned_text" options:3])
                                                                                                                                                                  {
                                                                                                                                                                    if ([v52 compare:@"rf_expandable_standard" options:3])
                                                                                                                                                                    {
                                                                                                                                                                      if ([v52 compare:@"rf_fact_item_button" options:3]) {
                                                                                                                                                                        uint64_t v53 = 0;
                                                                                                                                                                      }
                                                                                                                                                                      else {
                                                                                                                                                                        uint64_t v53 = 214;
                                                                                                                                                                      }
                                                                                                                                                                      goto LABEL_306;
                                                                                                                                                                    }
                                                                                                                                                                    goto LABEL_302;
                                                                                                                                                                  }
LABEL_300:
                                                                                                                                                                  uint64_t v53 = 212;
                                                                                                                                                                  goto LABEL_306;
                                                                                                                                                                }
LABEL_298:
                                                                                                                                                                uint64_t v53 = 211;
                                                                                                                                                                goto LABEL_306;
                                                                                                                                                              }
LABEL_296:
                                                                                                                                                              uint64_t v53 = 210;
                                                                                                                                                              goto LABEL_306;
                                                                                                                                                            }
LABEL_294:
                                                                                                                                                            uint64_t v53 = 209;
                                                                                                                                                            goto LABEL_306;
                                                                                                                                                          }
LABEL_292:
                                                                                                                                                          uint64_t v53 = 208;
                                                                                                                                                          goto LABEL_306;
                                                                                                                                                        }
LABEL_290:
                                                                                                                                                        uint64_t v53 = 207;
                                                                                                                                                        goto LABEL_306;
                                                                                                                                                      }
LABEL_288:
                                                                                                                                                      uint64_t v53 = 206;
                                                                                                                                                      goto LABEL_306;
                                                                                                                                                    }
LABEL_286:
                                                                                                                                                    uint64_t v53 = 205;
                                                                                                                                                    goto LABEL_306;
                                                                                                                                                  }
LABEL_284:
                                                                                                                                                  uint64_t v53 = 204;
                                                                                                                                                  goto LABEL_306;
                                                                                                                                                }
LABEL_282:
                                                                                                                                                uint64_t v53 = 203;
                                                                                                                                                goto LABEL_306;
                                                                                                                                              }
LABEL_280:
                                                                                                                                              uint64_t v53 = 202;
                                                                                                                                              goto LABEL_306;
                                                                                                                                            }
LABEL_278:
                                                                                                                                            uint64_t v53 = 201;
                                                                                                                                            goto LABEL_306;
                                                                                                                                          }
LABEL_276:
                                                                                                                                          uint64_t v53 = 200;
                                                                                                                                          goto LABEL_306;
                                                                                                                                        }
LABEL_274:
                                                                                                                                        uint64_t v53 = 64;
                                                                                                                                        goto LABEL_306;
                                                                                                                                      }
LABEL_272:
                                                                                                                                      uint64_t v53 = 63;
                                                                                                                                      goto LABEL_306;
                                                                                                                                    }
LABEL_270:
                                                                                                                                    uint64_t v53 = 61;
                                                                                                                                    goto LABEL_306;
                                                                                                                                  }
LABEL_268:
                                                                                                                                  uint64_t v53 = 60;
                                                                                                                                  goto LABEL_306;
                                                                                                                                }
LABEL_266:
                                                                                                                                uint64_t v53 = 59;
                                                                                                                                goto LABEL_306;
                                                                                                                              }
LABEL_264:
                                                                                                                              uint64_t v53 = 58;
                                                                                                                              goto LABEL_306;
                                                                                                                            }
LABEL_262:
                                                                                                                            uint64_t v53 = 57;
                                                                                                                            goto LABEL_306;
                                                                                                                          }
LABEL_260:
                                                                                                                          uint64_t v53 = 56;
                                                                                                                          goto LABEL_306;
                                                                                                                        }
LABEL_258:
                                                                                                                        uint64_t v53 = 55;
                                                                                                                        goto LABEL_306;
                                                                                                                      }
LABEL_256:
                                                                                                                      uint64_t v53 = 54;
                                                                                                                      goto LABEL_306;
                                                                                                                    }
LABEL_254:
                                                                                                                    uint64_t v53 = 53;
                                                                                                                    goto LABEL_306;
                                                                                                                  }
LABEL_252:
                                                                                                                  uint64_t v53 = 52;
                                                                                                                  goto LABEL_306;
                                                                                                                }
LABEL_250:
                                                                                                                uint64_t v53 = 51;
                                                                                                                goto LABEL_306;
                                                                                                              }
LABEL_248:
                                                                                                              uint64_t v53 = 50;
                                                                                                              goto LABEL_306;
                                                                                                            }
LABEL_246:
                                                                                                            uint64_t v53 = 49;
                                                                                                            goto LABEL_306;
                                                                                                          }
LABEL_244:
                                                                                                          uint64_t v53 = 48;
                                                                                                          goto LABEL_306;
                                                                                                        }
LABEL_242:
                                                                                                        uint64_t v53 = 47;
                                                                                                        goto LABEL_306;
                                                                                                      }
LABEL_240:
                                                                                                      uint64_t v53 = 46;
                                                                                                      goto LABEL_306;
                                                                                                    }
LABEL_238:
                                                                                                    uint64_t v53 = 45;
                                                                                                    goto LABEL_306;
                                                                                                  }
LABEL_236:
                                                                                                  uint64_t v53 = 44;
                                                                                                  goto LABEL_306;
                                                                                                }
LABEL_234:
                                                                                                uint64_t v53 = 43;
                                                                                                goto LABEL_306;
                                                                                              }
LABEL_232:
                                                                                              uint64_t v53 = 42;
                                                                                              goto LABEL_306;
                                                                                            }
LABEL_230:
                                                                                            uint64_t v53 = 41;
                                                                                            goto LABEL_306;
                                                                                          }
LABEL_228:
                                                                                          uint64_t v53 = 40;
                                                                                          goto LABEL_306;
                                                                                        }
LABEL_226:
                                                                                        uint64_t v53 = 39;
                                                                                        goto LABEL_306;
                                                                                      }
LABEL_224:
                                                                                      uint64_t v53 = 38;
                                                                                      goto LABEL_306;
                                                                                    }
LABEL_222:
                                                                                    uint64_t v53 = 37;
                                                                                    goto LABEL_306;
                                                                                  }
LABEL_220:
                                                                                  uint64_t v53 = 36;
                                                                                  goto LABEL_306;
                                                                                }
LABEL_218:
                                                                                uint64_t v53 = 35;
                                                                                goto LABEL_306;
                                                                              }
LABEL_216:
                                                                              uint64_t v53 = 34;
                                                                              goto LABEL_306;
                                                                            }
LABEL_214:
                                                                            uint64_t v53 = 33;
                                                                            goto LABEL_306;
                                                                          }
LABEL_212:
                                                                          uint64_t v53 = 32;
                                                                          goto LABEL_306;
                                                                        }
LABEL_210:
                                                                        uint64_t v53 = 31;
                                                                        goto LABEL_306;
                                                                      }
LABEL_208:
                                                                      uint64_t v53 = 30;
                                                                      goto LABEL_306;
                                                                    }
LABEL_206:
                                                                    uint64_t v53 = 29;
                                                                    goto LABEL_306;
                                                                  }
LABEL_204:
                                                                  uint64_t v53 = 28;
                                                                  goto LABEL_306;
                                                                }
LABEL_202:
                                                                uint64_t v53 = 27;
                                                                goto LABEL_306;
                                                              }
LABEL_200:
                                                              uint64_t v53 = 26;
                                                              goto LABEL_306;
                                                            }
LABEL_198:
                                                            uint64_t v53 = 25;
                                                            goto LABEL_306;
                                                          }
LABEL_196:
                                                          uint64_t v53 = 24;
                                                          goto LABEL_306;
                                                        }
LABEL_194:
                                                        uint64_t v53 = 23;
                                                        goto LABEL_306;
                                                      }
LABEL_192:
                                                      uint64_t v53 = 22;
                                                      goto LABEL_306;
                                                    }
LABEL_190:
                                                    uint64_t v53 = 21;
                                                    goto LABEL_306;
                                                  }
LABEL_188:
                                                  uint64_t v53 = 20;
                                                  goto LABEL_306;
                                                }
LABEL_186:
                                                uint64_t v53 = 19;
                                                goto LABEL_306;
                                              }
LABEL_184:
                                              uint64_t v53 = 18;
                                              goto LABEL_306;
                                            }
LABEL_182:
                                            uint64_t v53 = 17;
                                            goto LABEL_306;
                                          }
LABEL_180:
                                          uint64_t v53 = 16;
                                          goto LABEL_306;
                                        }
LABEL_178:
                                        uint64_t v53 = 15;
                                        goto LABEL_306;
                                      }
LABEL_176:
                                      uint64_t v53 = 14;
                                      goto LABEL_306;
                                    }
LABEL_174:
                                    uint64_t v53 = 13;
                                    goto LABEL_306;
                                  }
LABEL_172:
                                  uint64_t v53 = 12;
                                  goto LABEL_306;
                                }
LABEL_170:
                                uint64_t v53 = 11;
                                goto LABEL_306;
                              }
LABEL_168:
                              uint64_t v53 = 10;
                              goto LABEL_306;
                            }
LABEL_166:
                            uint64_t v53 = 9;
                            goto LABEL_306;
                          }
LABEL_164:
                          uint64_t v53 = 8;
                          goto LABEL_306;
                        }
LABEL_162:
                        uint64_t v53 = 7;
                        goto LABEL_306;
                      }
LABEL_160:
                      uint64_t v53 = 6;
                      goto LABEL_306;
                    }
LABEL_158:
                    uint64_t v53 = 5;
                    goto LABEL_306;
                  }
LABEL_156:
                  uint64_t v53 = 4;
                  goto LABEL_306;
                }
                goto LABEL_306;
              }
              goto LABEL_145;
            }
            goto LABEL_140;
          }
        }
        else
        {
          uint64_t v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          id v52 = (id)objc_claimAutoreleasedReturnValue();
          if (([v52 isEqualToString:@"SFNoneCardSection"] & 1) == 0)
          {
            if (([v52 isEqualToString:@"SFAppLinkCardSection"] & 1) == 0)
            {
              if (([v52 isEqualToString:@"SFDescriptionCardSection"] & 1) == 0)
              {
                if (([v52 isEqualToString:@"SFKeyValueDataCardSection"] & 1) == 0)
                {
                  if (([v52 isEqualToString:@"SFMapCardSection"] & 1) == 0)
                  {
                    if (([v52 isEqualToString:@"SFMediaInfoCardSection"] & 1) == 0)
                    {
                      if (([v52 isEqualToString:@"SFMediaPlayerCardSection"] & 1) == 0)
                      {
                        if (([v52 isEqualToString:@"SFNowPlayingCardSection"] & 1) == 0)
                        {
                          if (([v52 isEqualToString:@"SFRichTitleCardSection"] & 1) == 0)
                          {
                            if (([v52 isEqualToString:@"SFRowCardSection"] & 1) == 0)
                            {
                              if (([v52 isEqualToString:@"SFScoreboardCardSection"] & 1) == 0)
                              {
                                if (([v52 isEqualToString:@"SFSocialMediaPostCardSection"] & 1) == 0)
                                {
                                  if (([v52 isEqualToString:@"SFStockChartCardSection"] & 1) == 0)
                                  {
                                    if (([v52 isEqualToString:@"SFTableHeaderRowCardSection"] & 1) == 0)
                                    {
                                      if (([v52 isEqualToString:@"SFTableRowCardSection"] & 1) == 0)
                                      {
                                        if (([v52 isEqualToString:@"SFTextColumnsCardSection"] & 1) == 0)
                                        {
                                          if (([v52 isEqualToString:@"SFTitleCardSection"] & 1) == 0)
                                          {
                                            if (([v52 isEqualToString:@"SFTrackListCardSection"] & 1) == 0)
                                            {
                                              if (([v52 isEqualToString:@"SFAudioPlaybackCardSection"] & 1) == 0)
                                              {
                                                if (([v52 isEqualToString:@"SFFlightCardSection"] & 1) == 0)
                                                {
                                                  if (([v52 isEqualToString:@"SFActivityIndicatorCardSection"] & 1) == 0)
                                                  {
                                                    if (([v52 isEqualToString:@"SFWebCardSection"] & 1) == 0)
                                                    {
                                                      if (([v52 isEqualToString:@"SFMessageCardSection"] & 1) == 0)
                                                      {
                                                        if (([v52 isEqualToString:@"SFDetailedRowCardSection"] & 1) == 0)
                                                        {
                                                          if (([v52 isEqualToString:@"SFImagesCardSection"] & 1) == 0)
                                                          {
                                                            if (([v52 isEqualToString:@"SFSuggestionCardSection"] & 1) == 0)
                                                            {
                                                              if (([v52 isEqualToString:@"SFSelectableGridCardSection"] & 1) == 0)
                                                              {
                                                                if (([v52 isEqualToString:@"SFSectionHeaderCardSection"] & 1) == 0)
                                                                {
                                                                  if (([v52 isEqualToString:@"SFMetaInfoCardSection"] & 1) == 0)
                                                                  {
                                                                    if (([v52 isEqualToString:@"SFWatchListCardSection"] & 1) == 0)
                                                                    {
                                                                      if (([v52 isEqualToString:@"SFMapsDetailedRowCardSection"] & 1) == 0)
                                                                      {
                                                                        if (([v52 isEqualToString:@"SFButtonCardSection"] & 1) == 0)
                                                                        {
                                                                          if (([v52 isEqualToString:@"SFHorizontalButtonCardSection"] & 1) == 0)
                                                                          {
                                                                            if (([v52 isEqualToString:@"SFVerticalLayoutCardSection"] & 1) == 0)
                                                                            {
                                                                              if (([v52 isEqualToString:@"SFProductCardSection"] & 1) == 0)
                                                                              {
                                                                                if (([v52 isEqualToString:@"SFHorizontalScrollCardSection"] & 1) == 0)
                                                                                {
                                                                                  if (([v52 isEqualToString:@"SFMediaRemoteControlCardSection"] & 1) == 0)
                                                                                  {
                                                                                    if (([v52 isEqualToString:@"SFMapPlaceCardSection"] & 1) == 0)
                                                                                    {
                                                                                      if (([v52 isEqualToString:@"SFCompactRowCardSection"] & 1) == 0)
                                                                                      {
                                                                                        if (([v52 isEqualToString:@"SFWorldMapCardSection"] & 1) == 0)
                                                                                        {
                                                                                          if (([v52 isEqualToString:@"SFAttributionFooterCardSection"] & 1) == 0)
                                                                                          {
                                                                                            if (([v52 isEqualToString:@"SFGridCardSection"] & 1) == 0)
                                                                                            {
                                                                                              if (([v52 isEqualToString:@"SFPersonHeaderCardSection"] & 1) == 0)
                                                                                              {
                                                                                                if (([v52 isEqualToString:@"SFColorBarCardSection"] & 1) == 0)
                                                                                                {
                                                                                                  if (([v52 isEqualToString:@"SFSplitCardSection"] & 1) == 0)
                                                                                                  {
                                                                                                    if (([v52 isEqualToString:@"SFLinkPresentationCardSection"] & 1) == 0)
                                                                                                    {
                                                                                                      if (([v52 isEqualToString:@"SFFindMyCardSection"] & 1) == 0)
                                                                                                      {
                                                                                                        if (([v52 isEqualToString:@"SFHeroCardSection"] & 1) == 0)
                                                                                                        {
                                                                                                          if (([v52 isEqualToString:@"SFNewsCardSection"] & 1) == 0)
                                                                                                          {
                                                                                                            if (([v52 isEqualToString:@"SFMiniCardSection"] & 1) == 0)
                                                                                                            {
                                                                                                              if (([v52 isEqualToString:@"SFInfoCardSection"] & 1) == 0)
                                                                                                              {
                                                                                                                if (([v52 isEqualToString:@"SFCollectionCardSection"] & 1) == 0)
                                                                                                                {
                                                                                                                  if (([v52 isEqualToString:@"SFCombinedCardSection"] & 1) == 0)
                                                                                                                  {
                                                                                                                    if (([v52 isEqualToString:@"SFResponseWrapperCardSection"] & 1) == 0)
                                                                                                                    {
                                                                                                                      if (([v52 isEqualToString:@"SFListenToCardSection"] & 1) == 0)
                                                                                                                      {
                                                                                                                        if (([v52 isEqualToString:@"SFWatchNowCardSection"] & 1) == 0)
                                                                                                                        {
                                                                                                                          if (([v52 isEqualToString:@"SFStrokeAnimationCardSection"] & 1) == 0)
                                                                                                                          {
                                                                                                                            if (([v52 isEqualToString:@"SFButtonListCardSection"] & 1) == 0)
                                                                                                                            {
                                                                                                                              if (([v52 isEqualToString:@"SFCommandRowCardSection"] & 1) == 0)
                                                                                                                              {
                                                                                                                                if (([v52 isEqualToString:@"SFLeadingTrailingCardSection"] & 1) == 0)
                                                                                                                                {
                                                                                                                                  if (([v52 isEqualToString:@"SFHeroTitleCardSection"] & 1) == 0)
                                                                                                                                  {
                                                                                                                                    if (([v52 isEqualToString:@"SFArchiveViewCardSection"] & 1) == 0)
                                                                                                                                    {
                                                                                                                                      if (([v52 isEqualToString:@"SFAppIconCardSection"] & 1) == 0)
                                                                                                                                      {
                                                                                                                                        if (([v52 isEqualToString:@"SFLargeTitleDetailedRowCardSection"] & 1) == 0)
                                                                                                                                        {
                                                                                                                                          if (([v52 isEqualToString:@"RFSummaryItemShortNumberCardSection"] & 1) == 0)
                                                                                                                                          {
                                                                                                                                            if (([v52 isEqualToString:@"RFSummaryItemTextCardSection"] & 1) == 0)
                                                                                                                                            {
                                                                                                                                              if (([v52 isEqualToString:@"RFSummaryItemStandardCardSection"] & 1) == 0)
                                                                                                                                              {
                                                                                                                                                if (([v52 isEqualToString:@"RFFactItemShortNumberCardSection"] & 1) == 0)
                                                                                                                                                {
                                                                                                                                                  if (([v52 isEqualToString:@"RFFactItemStandardCardSection"] & 1) == 0)
                                                                                                                                                  {
                                                                                                                                                    if (([v52 isEqualToString:@"RFLongItemStandardCardSection"] & 1) == 0)
                                                                                                                                                    {
                                                                                                                                                      if (([v52 isEqualToString:@"RFPrimaryHeaderRichCardSection"] & 1) == 0)
                                                                                                                                                      {
                                                                                                                                                        if (([v52 isEqualToString:@"RFPrimaryHeaderStandardCardSection"] & 1) == 0)
                                                                                                                                                        {
                                                                                                                                                          if (([v52 isEqualToString:@"RFReferenceFootnoteCardSection"] & 1) == 0)
                                                                                                                                                          {
                                                                                                                                                            if (([v52 isEqualToString:@"RFReferenceRichCardSection"] & 1) == 0)
                                                                                                                                                            {
                                                                                                                                                              if (([v52 isEqualToString:@"RFSimpleItemRichCardSection"] & 1) == 0)
                                                                                                                                                              {
                                                                                                                                                                if (([v52 isEqualToString:@"RFSimpleItemStandardCardSection"] & 1) == 0)
                                                                                                                                                                {
                                                                                                                                                                  if (([v52 isEqualToString:@"RFSummaryItemAlignedTextCardSection"] & 1) == 0)
                                                                                                                                                                  {
                                                                                                                                                                    if (([v52 isEqualToString:@"RFExpandableStandardCardSection"] & 1) == 0)
                                                                                                                                                                    {
                                                                                                                                                                      if ([v52 isEqualToString:@"RFFactItemButtonCardSection"]) {
                                                                                                                                                                        uint64_t v53 = 214;
                                                                                                                                                                      }
                                                                                                                                                                      else {
                                                                                                                                                                        uint64_t v53 = 0;
                                                                                                                                                                      }
                                                                                                                                                                      goto LABEL_306;
                                                                                                                                                                    }
LABEL_302:
                                                                                                                                                                    uint64_t v53 = 213;
                                                                                                                                                                    goto LABEL_306;
                                                                                                                                                                  }
                                                                                                                                                                  goto LABEL_300;
                                                                                                                                                                }
                                                                                                                                                                goto LABEL_298;
                                                                                                                                                              }
                                                                                                                                                              goto LABEL_296;
                                                                                                                                                            }
                                                                                                                                                            goto LABEL_294;
                                                                                                                                                          }
                                                                                                                                                          goto LABEL_292;
                                                                                                                                                        }
                                                                                                                                                        goto LABEL_290;
                                                                                                                                                      }
                                                                                                                                                      goto LABEL_288;
                                                                                                                                                    }
                                                                                                                                                    goto LABEL_286;
                                                                                                                                                  }
                                                                                                                                                  goto LABEL_284;
                                                                                                                                                }
                                                                                                                                                goto LABEL_282;
                                                                                                                                              }
                                                                                                                                              goto LABEL_280;
                                                                                                                                            }
                                                                                                                                            goto LABEL_278;
                                                                                                                                          }
                                                                                                                                          goto LABEL_276;
                                                                                                                                        }
                                                                                                                                        goto LABEL_274;
                                                                                                                                      }
                                                                                                                                      goto LABEL_272;
                                                                                                                                    }
                                                                                                                                    goto LABEL_270;
                                                                                                                                  }
                                                                                                                                  goto LABEL_268;
                                                                                                                                }
                                                                                                                                goto LABEL_266;
                                                                                                                              }
                                                                                                                              goto LABEL_264;
                                                                                                                            }
                                                                                                                            goto LABEL_262;
                                                                                                                          }
                                                                                                                          goto LABEL_260;
                                                                                                                        }
                                                                                                                        goto LABEL_258;
                                                                                                                      }
                                                                                                                      goto LABEL_256;
                                                                                                                    }
                                                                                                                    goto LABEL_254;
                                                                                                                  }
                                                                                                                  goto LABEL_252;
                                                                                                                }
                                                                                                                goto LABEL_250;
                                                                                                              }
                                                                                                              goto LABEL_248;
                                                                                                            }
                                                                                                            goto LABEL_246;
                                                                                                          }
                                                                                                          goto LABEL_244;
                                                                                                        }
                                                                                                        goto LABEL_242;
                                                                                                      }
                                                                                                      goto LABEL_240;
                                                                                                    }
                                                                                                    goto LABEL_238;
                                                                                                  }
                                                                                                  goto LABEL_236;
                                                                                                }
                                                                                                goto LABEL_234;
                                                                                              }
                                                                                              goto LABEL_232;
                                                                                            }
                                                                                            goto LABEL_230;
                                                                                          }
                                                                                          goto LABEL_228;
                                                                                        }
                                                                                        goto LABEL_226;
                                                                                      }
                                                                                      goto LABEL_224;
                                                                                    }
                                                                                    goto LABEL_222;
                                                                                  }
                                                                                  goto LABEL_220;
                                                                                }
                                                                                goto LABEL_218;
                                                                              }
                                                                              goto LABEL_216;
                                                                            }
                                                                            goto LABEL_214;
                                                                          }
                                                                          goto LABEL_212;
                                                                        }
                                                                        goto LABEL_210;
                                                                      }
                                                                      goto LABEL_208;
                                                                    }
                                                                    goto LABEL_206;
                                                                  }
                                                                  goto LABEL_204;
                                                                }
                                                                goto LABEL_202;
                                                              }
                                                              goto LABEL_200;
                                                            }
                                                            goto LABEL_198;
                                                          }
                                                          goto LABEL_196;
                                                        }
                                                        goto LABEL_194;
                                                      }
                                                      goto LABEL_192;
                                                    }
                                                    goto LABEL_190;
                                                  }
                                                  goto LABEL_188;
                                                }
                                                goto LABEL_186;
                                              }
                                              goto LABEL_184;
                                            }
                                            goto LABEL_182;
                                          }
                                          goto LABEL_180;
                                        }
                                        goto LABEL_178;
                                      }
                                      goto LABEL_176;
                                    }
                                    goto LABEL_174;
                                  }
                                  goto LABEL_172;
                                }
                                goto LABEL_170;
                              }
                              goto LABEL_168;
                            }
                            goto LABEL_166;
                          }
                          goto LABEL_164;
                        }
                        goto LABEL_162;
                      }
                      goto LABEL_160;
                    }
                    goto LABEL_158;
                  }
                  goto LABEL_156;
                }
                uint64_t v53 = 3;
LABEL_306:

                [(_CPCardSectionForFeedback *)v5 setCardSectionType:v53];
                v61 = [v4 cardSectionDetail];
                [(_CPCardSectionForFeedback *)v5 setCardSectionDetail:v61];

                v62 = v5;
                goto LABEL_307;
              }
LABEL_145:
              uint64_t v53 = 2;
              goto LABEL_306;
            }
LABEL_140:
            uint64_t v53 = 1;
            goto LABEL_306;
          }
        }
        uint64_t v53 = 0;
        goto LABEL_306;
      }
    }
    else if ([v4 isMemberOfClass:objc_opt_class()])
    {
      char v58 = [v4 internalDetailedRowCardSection];
      BOOL v59 = [v58 buttonItems];

      if (v59)
      {
        v56 = [v4 internalDetailedRowCardSection];
        uint64_t v57 = [v56 buttonItems];
        goto LABEL_149;
      }
    }
    else if ([v4 isMemberOfClass:objc_opt_class()])
    {
      v60 = [v4 buttonItems];

      if (v60)
      {
LABEL_4:
        uint64_t v12 = [v4 buttonItems];
LABEL_5:
        uint64_t v13 = (void *)v12;
        goto LABEL_6;
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_8;
  }
LABEL_307:

  return v5;
}

@end