@interface DMCFieldCollection
- (BOOL)currentFieldIsFinalField;
- (BOOL)currentFieldIsLastInPayload;
- (BOOL)currentFieldIsSinglePasswordField;
- (DMCFieldCollection)initWithUserInput:(id)a3;
- (id)currentField;
- (id)responseDictionariesForCurrentPayload;
- (id)userInputResponses;
- (int64_t)currentPayloadIndex;
- (void)_setCurrentFieldToCurrentIndices;
- (void)_setIsFinalField;
- (void)moveToNextField;
- (void)restartCurrentPayload;
@end

@implementation DMCFieldCollection

- (DMCFieldCollection)initWithUserInput:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DMCFieldCollection;
  v5 = [(DMCFieldCollection *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    payloadFieldArrays = v5->_payloadFieldArrays;
    v5->_payloadFieldArrays = (NSMutableArray *)v6;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v12, "count"));
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = [[DMCPayloadUserInputField alloc] initWithFieldDictionary:*(void *)(*((void *)&v23 + 1) + 8 * j)];
                [v13 addObject:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }
            while (v16);
            char v10 = 1;
          }

          [(NSMutableArray *)v5->_payloadFieldArrays addObject:v13];
          if ((v10 & 1) == 0) {
            ++v5->_currentPayloadIndex;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v9);
    }

    [(DMCFieldCollection *)v5 _setCurrentFieldToCurrentIndices];
  }

  return v5;
}

- (id)userInputResponses
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_payloadFieldArrays, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_payloadFieldArrays;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) responseDictionary];
              [v9 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }

        [v3 addObject:v9];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)currentField
{
  return self->_currentField;
}

- (void)_setIsFinalField
{
  if ([(DMCFieldCollection *)self currentFieldIsLastInPayload])
  {
    self->_isFinalField = 1;
    unint64_t v3 = self->_currentPayloadIndex + 1;
    while (v3 < [(NSMutableArray *)self->_payloadFieldArrays count])
    {
      uint64_t v4 = [(NSMutableArray *)self->_payloadFieldArrays objectAtIndex:v3];
      uint64_t v5 = [v4 count];

      ++v3;
      if (v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    self->_isFinalField = 0;
  }
}

- (void)_setCurrentFieldToCurrentIndices
{
  currentField = self->_currentField;
  self->_currentField = 0;

  unint64_t currentPayloadIndex = self->_currentPayloadIndex;
  if (currentPayloadIndex < [(NSMutableArray *)self->_payloadFieldArrays count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_payloadFieldArrays objectAtIndex:self->_currentPayloadIndex];
    unint64_t currentFieldIndex = self->_currentFieldIndex;
    if (currentFieldIndex < [v5 count])
    {
      v7 = [v5 objectAtIndex:self->_currentFieldIndex];
      uint64_t v8 = self->_currentField;
      self->_currentField = v7;
    }
  }
  [(DMCFieldCollection *)self _setIsFinalField];
}

- (void)moveToNextField
{
  if ([(DMCFieldCollection *)self currentFieldIsLastInPayload])
  {
    do
    {
      payloadFieldArrays = self->_payloadFieldArrays;
      unint64_t v4 = self->_currentPayloadIndex + 1;
      self->_unint64_t currentPayloadIndex = v4;
      if (v4 >= [(NSMutableArray *)payloadFieldArrays count]) {
        break;
      }
      uint64_t v5 = [(NSMutableArray *)self->_payloadFieldArrays objectAtIndex:self->_currentPayloadIndex];
      uint64_t v6 = [v5 count];
    }
    while (!v6);
    self->_unint64_t currentFieldIndex = 0;
  }
  else
  {
    ++self->_currentFieldIndex;
  }
  [(DMCFieldCollection *)self _setCurrentFieldToCurrentIndices];
}

- (void)restartCurrentPayload
{
  self->_unint64_t currentFieldIndex = 0;
  [(DMCFieldCollection *)self _setCurrentFieldToCurrentIndices];
}

- (BOOL)currentFieldIsLastInPayload
{
  unint64_t currentPayloadIndex = self->_currentPayloadIndex;
  if (currentPayloadIndex >= [(NSMutableArray *)self->_payloadFieldArrays count]) {
    return 0;
  }
  int64_t currentFieldIndex = self->_currentFieldIndex;
  uint64_t v5 = [(NSMutableArray *)self->_payloadFieldArrays objectAtIndex:self->_currentPayloadIndex];
  BOOL v6 = currentFieldIndex == [v5 count] - 1;

  return v6;
}

- (BOOL)currentFieldIsFinalField
{
  return self->_isFinalField;
}

- (BOOL)currentFieldIsSinglePasswordField
{
  if (![(DMCPayloadUserInputField *)self->_currentField isPassword]) {
    return 0;
  }
  unint64_t v3 = [(NSMutableArray *)self->_payloadFieldArrays objectAtIndex:self->_currentPayloadIndex];
  BOOL v4 = [v3 count] == 1;

  return v4;
}

- (id)responseDictionariesForCurrentPayload
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t currentPayloadIndex = self->_currentPayloadIndex;
  if (currentPayloadIndex >= [(NSMutableArray *)self->_payloadFieldArrays count])
  {
    uint64_t v5 = 0;
  }
  else
  {
    BOOL v4 = [(NSMutableArray *)self->_payloadFieldArrays objectAtIndex:self->_currentPayloadIndex];
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "responseDictionary", (void)v15);
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  if (v5) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }
  id v13 = v12;

  return v13;
}

- (int64_t)currentPayloadIndex
{
  return self->_currentPayloadIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentField, 0);
  objc_storeStrong((id *)&self->_payloadFieldArrays, 0);
}

@end