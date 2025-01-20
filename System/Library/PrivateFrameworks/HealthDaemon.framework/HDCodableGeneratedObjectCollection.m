@interface HDCodableGeneratedObjectCollection
+ (Class)medicationDoseEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unitTest_isEquivalentToGeneratedObjectCollection:(id)a3;
- (NSMutableArray)medicationDoseEvents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedObjects;
- (id)description;
- (id)dictionaryRepresentation;
- (id)medicationDoseEventAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)medicationDoseEventsCount;
- (void)addMedicationDoseEvent:(id)a3;
- (void)clearMedicationDoseEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMedicationDoseEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableGeneratedObjectCollection

- (void)clearMedicationDoseEvents
{
}

- (void)addMedicationDoseEvent:(id)a3
{
  id v4 = a3;
  medicationDoseEvents = self->_medicationDoseEvents;
  id v8 = v4;
  if (!medicationDoseEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_medicationDoseEvents;
    self->_medicationDoseEvents = v6;

    id v4 = v8;
    medicationDoseEvents = self->_medicationDoseEvents;
  }
  [(NSMutableArray *)medicationDoseEvents addObject:v4];
}

- (unint64_t)medicationDoseEventsCount
{
  return [(NSMutableArray *)self->_medicationDoseEvents count];
}

- (id)medicationDoseEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_medicationDoseEvents objectAtIndex:a3];
}

+ (Class)medicationDoseEventType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableGeneratedObjectCollection;
  id v4 = [(HDCodableGeneratedObjectCollection *)&v8 description];
  v5 = [(HDCodableGeneratedObjectCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_medicationDoseEvents count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_medicationDoseEvents, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_medicationDoseEvents;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"medicationDoseEvent"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableGeneratedObjectCollectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_medicationDoseEvents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HDCodableGeneratedObjectCollection *)self medicationDoseEventsCount])
  {
    [v8 clearMedicationDoseEvents];
    unint64_t v4 = [(HDCodableGeneratedObjectCollection *)self medicationDoseEventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableGeneratedObjectCollection *)self medicationDoseEventAtIndex:i];
        [v8 addMedicationDoseEvent:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_medicationDoseEvents;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addMedicationDoseEvent:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    medicationDoseEvents = self->_medicationDoseEvents;
    if ((unint64_t)medicationDoseEvents | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](medicationDoseEvents, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_medicationDoseEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[HDCodableGeneratedObjectCollection addMedicationDoseEvent:](self, "addMedicationDoseEvent:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)medicationDoseEvents
{
  return self->_medicationDoseEvents;
}

- (void)setMedicationDoseEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_medicationDoseEvents count];
}

- (id)decodedObjects
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__HDCodableGeneratedObjectCollection_HDCodingSupport__decodedObjects__block_invoke;
  aBlock[3] = &unk_1E62FF770;
  id v4 = v3;
  id v19 = v4;
  uint64_t v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_medicationDoseEvents;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(MEMORY[0x1E4F2B1F0], "createWithCodable:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
        v5[2](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }

  id v12 = v4;
  return v12;
}

uint64_t __69__HDCodableGeneratedObjectCollection_HDCodingSupport__decodedObjects__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (BOOL)unitTest_isEquivalentToGeneratedObjectCollection:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = self->_medicationDoseEvents;
  uint64_t v5 = [a3 medicationDoseEvents];
  uint64_t v6 = v4;
  uint64_t v7 = v6;
  if (v4 == v5)
  {
    char v12 = 1;
  }
  else
  {
    if (v5) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
    }
    if (v6) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
    long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
    char v12 = [v10 isEqualToSet:v11];
  }
  return v12;
}

@end