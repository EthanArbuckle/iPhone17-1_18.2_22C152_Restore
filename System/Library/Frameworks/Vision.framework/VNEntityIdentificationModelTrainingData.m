@interface VNEntityIdentificationModelTrainingData
- (BOOL)addObservations:(id)a3 toEntityWithUniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeAllObservationsFromEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeObservations:(id)a3 fromEntityWithUniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4;
- (NSDate)lastModificationDate;
- (VNEntityIdentificationModelTrainingData)initWithModelConfiguration:(id)a3;
- (VNEntityIdentificationModelTrainingDataDelegate)delegate;
- (VNRequestSpecifier)entityPrintOriginatingRequestSpecifier;
- (id)_serialNumberForEntityWithUniqueIdentifier:(id *)a1 error:(void *)a2;
- (id)_uniqueObservationsForObservations:(void *)a3 forEntityWithUniqueIdentifier:(int)a4 inRegisteredState:(void *)a5 compatibleWithOriginatingRequestSpecifier:(uint64_t)a6 error:;
- (id)entityIdentificationModel:(id)a3 observationAtIndex:(unint64_t)a4 forEntityAtIndex:(unint64_t)a5;
- (id)entityIdentificationModel:(id)a3 uniqueIdentifierOfEntityAtIndex:(unint64_t)a4;
- (id)lastModificationDateForEntityIdentificationModel:(id)a3;
- (id)observationAtIndex:(unint64_t)a3 forEntityAtIndex:(unint64_t)a4;
- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3;
- (unint64_t)entityCount;
- (unint64_t)entityIdentificationModel:(id)a3 indexOfEntityWithUniqueIdentifier:(id)a4;
- (unint64_t)entityIdentificationModel:(id)a3 numberOfObservationsForEntityAtIndex:(unint64_t)a4;
- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3;
- (unint64_t)lastDataChangeSequenceNumberForEntityIdentificationModel:(id)a3;
- (unint64_t)observationCountForEntityAtIndex:(unint64_t)a3;
- (void)_handleDataModification;
- (void)setDelegate:(id)a3;
@end

@implementation VNEntityIdentificationModelTrainingData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_availableSerialNumbers, 0);
  objc_storeStrong((id *)&self->_observationsForSerialNumber, 0);
  objc_storeStrong((id *)&self->_serialNumberForEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_entityPrintOriginatingRequestSpecifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSDate)lastModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDelegate:(id)a3
{
}

- (VNEntityIdentificationModelTrainingDataDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VNEntityIdentificationModelTrainingDataDelegate *)WeakRetained;
}

- (VNRequestSpecifier)entityPrintOriginatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (id)lastModificationDateForEntityIdentificationModel:(id)a3
{
  return self->_lastModificationDate;
}

- (unint64_t)lastDataChangeSequenceNumberForEntityIdentificationModel:(id)a3
{
  return self->_lastDataChangeSequenceNumber;
}

- (id)entityIdentificationModel:(id)a3 observationAtIndex:(unint64_t)a4 forEntityAtIndex:(unint64_t)a5
{
  return [(VNEntityIdentificationModelTrainingData *)self observationAtIndex:a4 forEntityAtIndex:a5];
}

- (unint64_t)entityIdentificationModel:(id)a3 numberOfObservationsForEntityAtIndex:(unint64_t)a4
{
  return [(VNEntityIdentificationModelTrainingData *)self observationCountForEntityAtIndex:a4];
}

- (unint64_t)entityIdentificationModel:(id)a3 indexOfEntityWithUniqueIdentifier:(id)a4
{
  return [(VNEntityIdentificationModelTrainingData *)self indexOfEntityWithUniqueIdentifier:a4];
}

- (id)entityIdentificationModel:(id)a3 uniqueIdentifierOfEntityAtIndex:(unint64_t)a4
{
  return [(VNEntityIdentificationModelTrainingData *)self uniqueIdentifierOfEntityAtIndex:a4];
}

- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(NSMutableArray *)self->_entityUniqueIdentifiers count];
  if (v6 == [(NSMutableDictionary *)self->_serialNumberForEntityUniqueIdentifier count]
    && v6 == [(NSMutableDictionary *)self->_observationsForSerialNumber count])
  {
    return 1;
  }
  if (!a4) {
    return 0;
  }
  VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, @"entity and observation data counts are out-of-sync", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a4 = v8;
  return result;
}

- (BOOL)removeEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, v5);
  if (v6)
  {
    [(NSMutableDictionary *)self->_observationsForSerialNumber removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_serialNumberForEntityUniqueIdentifier removeObjectForKey:v5];
    [(NSMutableArray *)self->_entityUniqueIdentifiers removeObject:v5];
    -[NSMutableIndexSet addIndex:](self->_availableSerialNumbers, "addIndex:", [v6 unsignedIntegerValue]);
    -[VNEntityIdentificationModelTrainingData _handleDataModification](self);
  }

  return 1;
}

- (id)_serialNumberForEntityWithUniqueIdentifier:(id *)a1 error:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1[5] objectForKeyedSubscript:v3];
    a1 = v4;
    if (v4) {
      id v5 = v4;
    }
  }

  return a1;
}

- (void)_handleDataModification
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    id v3 = (void *)a1[8];
    a1[8] = v2;

    ++a1[9];
    id v4 = [a1 delegate];
    [v4 entityIdentificationModelTrainingDataWasModified:a1];
  }
}

- (BOOL)removeAllObservationsFromEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v5 = -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, a3);
  if (v5 && self)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_observationsForSerialNumber objectForKeyedSubscript:v5];
    v7 = v6;
    if (v6 && [v6 count])
    {
      [v7 removeAllObjects];
      -[VNEntityIdentificationModelTrainingData _handleDataModification](self);
    }
  }
  return 1;
}

- (BOOL)removeObservations:(id)a3 fromEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, v9);
  if (v10)
  {
    v11 = [(VNEntityIdentificationModelTrainingData *)self entityPrintOriginatingRequestSpecifier];
    v12 = -[VNEntityIdentificationModelTrainingData _uniqueObservationsForObservations:forEntityWithUniqueIdentifier:inRegisteredState:compatibleWithOriginatingRequestSpecifier:error:]((id *)&self->super.isa, v8, v9, 1, v11, (uint64_t)a5);

    BOOL v13 = v12 != 0;
    if (v12)
    {
      id v14 = v12;
      id v15 = v10;
      if (self && [v14 count])
      {
        v16 = [(NSMutableDictionary *)self->_observationsForSerialNumber objectForKeyedSubscript:v15];
        v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 count];
          [v17 removeObjectsInArray:v14];
          if ([v17 count] != v18) {
            -[VNEntityIdentificationModelTrainingData _handleDataModification](self);
          }
        }
      }
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)_uniqueObservationsForObservations:(void *)a3 forEntityWithUniqueIdentifier:(int)a4 inRegisteredState:(void *)a5 compatibleWithOriginatingRequestSpecifier:(uint64_t)a6 error:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a1)
  {
    uint64_t v14 = [v11 count];
    if (v14)
    {
      id v34 = v13;
      v35 = v12;
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v14];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v33 = v11;
      id v16 = v11;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v42;
        obuint64_t j = v16;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(id *)(*((void *)&v41 + 1) + 8 * i);
            v22 = [a1 entityPrintOriginatingRequestSpecifier];
            BOOL v23 = +[VNEntityIdentificationModel validateAceptableObservation:v21 forEntityPrintOriginatingRequestSpecifier:v22 error:a6];

            if (!v23)
            {
              id v26 = 0;
              id v11 = v33;
              id v13 = v34;
              id v12 = v35;
              goto LABEL_26;
            }
            [v15 addObject:v21];
          }
          id v16 = obj;
          uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      id v12 = v35;
      uint64_t v24 = -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:](a1, v35);
      obuint64_t j = (id)v24;
      if (v24)
      {
        v25 = [a1[6] objectForKeyedSubscript:v24];
      }
      else
      {
        v25 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v11 = v33;
      id v13 = v34;
      if (a4)
      {
        id v27 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v25];
        [v15 intersectSet:v27];
      }
      else
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v27 = v25;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v38 != v30) {
                objc_enumerationMutation(v27);
              }
              [v15 removeObject:*(void *)(*((void *)&v37 + 1) + 8 * j)];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v29);
        }
      }

      id v26 = [v15 array];

LABEL_26:
    }
    else
    {
      id v26 = v11;
    }
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (BOOL)addObservations:(id)a3 toEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(VNEntityIdentificationModelTrainingData *)self entityPrintOriginatingRequestSpecifier];
  id v11 = -[VNEntityIdentificationModelTrainingData _uniqueObservationsForObservations:forEntityWithUniqueIdentifier:inRegisteredState:compatibleWithOriginatingRequestSpecifier:error:]((id *)&self->super.isa, v9, v8, 0, v10, (uint64_t)a5);

  if (!v11)
  {
    LOBYTE(self) = 0;
    goto LABEL_11;
  }
  id v12 = v11;
  id v13 = v8;
  if (self)
  {
    uint64_t v14 = [v12 count];
    if (!v14)
    {
LABEL_8:
      LOBYTE(self) = 1;
      goto LABEL_9;
    }
    uint64_t v15 = v14;
    id v16 = -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, v13);
    if (v16)
    {
LABEL_5:
      uint64_t v17 = [(NSMutableDictionary *)self->_observationsForSerialNumber objectForKeyedSubscript:v16];
      if (!v17)
      {
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
        [(NSMutableDictionary *)self->_observationsForSerialNumber setObject:v17 forKeyedSubscript:v16];
      }
      [v17 addObjectsFromArray:v12];
      -[VNEntityIdentificationModelTrainingData _handleDataModification](self);

      goto LABEL_8;
    }
    if ([(NSMutableDictionary *)self->_serialNumberForEntityUniqueIdentifier count] >= self->_maximumEntities)
    {
      if (a5)
      {
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"The model has reached the maximum entity limit of %lu", self->_maximumEntities);
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(9, v20, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v19 = [(NSMutableIndexSet *)self->_availableSerialNumbers firstIndex];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a5)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(9, @"entity serial numbers have been exhausted", 0);
          LOBYTE(self) = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v21 = v19;
        [(NSMutableIndexSet *)self->_availableSerialNumbers removeIndex:v19];
        uint64_t v22 = [NSNumber numberWithUnsignedInteger:v21];
        if (v22)
        {
          id v16 = (void *)v22;
          [(NSMutableDictionary *)self->_serialNumberForEntityUniqueIdentifier setObject:v22 forKeyedSubscript:v13];
          [(NSMutableArray *)self->_entityUniqueIdentifiers addObject:v13];
          goto LABEL_5;
        }
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_9:

LABEL_11:
  return (char)self;
}

- (id)observationAtIndex:(unint64_t)a3 forEntityAtIndex:(unint64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)self->_entityUniqueIdentifiers objectAtIndex:a4];
  v7 = [(NSMutableDictionary *)self->_serialNumberForEntityUniqueIdentifier objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_observationsForSerialNumber objectForKeyedSubscript:v7];
    id v9 = [v8 objectAtIndex:a3];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)observationCountForEntityAtIndex:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_entityUniqueIdentifiers objectAtIndex:a3];
  id v5 = [(NSMutableDictionary *)self->_serialNumberForEntityUniqueIdentifier objectForKeyedSubscript:v4];
  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_observationsForSerialNumber objectForKeyedSubscript:v5];
    unint64_t v7 = [v6 count];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3
{
  return [(NSMutableArray *)self->_entityUniqueIdentifiers indexOfObject:a3];
}

- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_entityUniqueIdentifiers objectAtIndex:a3];
}

- (unint64_t)entityCount
{
  return [(NSMutableArray *)self->_entityUniqueIdentifiers count];
}

- (VNEntityIdentificationModelTrainingData)initWithModelConfiguration:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNEntityIdentificationModelTrainingData;
  id v5 = [(VNEntityIdentificationModelTrainingData *)&v20 init];
  if (v5)
  {
    v5->_maximumEntities = [v4 maximumEntities];
    uint64_t v6 = [v4 entityPrintOriginatingRequestSpecifier];
    uint64_t v7 = [v6 copy];
    entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
    v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entityUniqueIdentifiers = v5->_entityUniqueIdentifiers;
    v5->_entityUniqueIdentifiers = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serialNumberForEntityUniqueIdentifier = v5->_serialNumberForEntityUniqueIdentifier;
    v5->_serialNumberForEntityUniqueIdentifier = v11;

    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observationsForSerialNumber = v5->_observationsForSerialNumber;
    v5->_observationsForSerialNumber = v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 1, v5->_maximumEntities);
    availableSerialNumbers = v5->_availableSerialNumbers;
    v5->_availableSerialNumbers = (NSMutableIndexSet *)v15;

    uint64_t v17 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    lastModificationDate = v5->_lastModificationDate;
    v5->_lastModificationDate = v17;
  }
  return v5;
}

@end