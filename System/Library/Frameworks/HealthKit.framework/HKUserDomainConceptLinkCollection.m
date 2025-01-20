@interface HKUserDomainConceptLinkCollection
+ (BOOL)supportsSecureCoding;
+ (id)_wrappedUDCLinks:(id)a3;
+ (id)collectionByMergingCollection:(id)a3 otherCollection:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptLinkCollection)init;
- (HKUserDomainConceptLinkCollection)initWithCoder:(id)a3;
- (HKUserDomainConceptLinkCollection)initWithLinkSetWrapper:(id)a3 epoch:(int64_t)a4;
- (NSArray)links;
- (id)_copyWithLinkSetWrapper:(id)a3;
- (id)_initWithLinks:(id)a3;
- (id)_orderedSetWithDecoder:(id)a3 error:(id *)a4;
- (id)collectionByAppendingLink:(id)a3;
- (id)collectionByAppendingLinks:(id)a3;
- (id)collectionByInsertingLink:(id)a3 atIndex:(unint64_t)a4;
- (id)collectionByMergingCollection:(id)a3;
- (id)collectionByMergingInLegacyArrayOfLinks:(id)a3;
- (id)collectionByMovingLinkFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (id)collectionByRemovingAllLinks;
- (id)collectionByRemovingLinkAtIndex:(unint64_t)a3;
- (id)collectionByRemovingLinksWithTargetUUID:(id)a3;
- (id)collectionByReplacingLinkAtIndex:(unint64_t)a3 withLink:(id)a4;
- (id)collectionByRetargetingLinksWithUUID:(id)a3 withNewUUID:(id)a4;
- (id)collectionBySwappingLinksAtIndex:(unint64_t)a3 otherIndex:(unint64_t)a4;
- (id)description;
- (int64_t)count;
- (int64_t)epoch;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)unitTesting_setEpoch:(int64_t)a3;
@end

@implementation HKUserDomainConceptLinkCollection

- (HKUserDomainConceptLinkCollection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptLinkCollection)initWithLinkSetWrapper:(id)a3 epoch:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLinkCollection;
  v8 = [(HKUserDomainConceptLinkCollection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_orderedSet, a3);
    v9->_epoch = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)_initWithLinks:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _wrappedUDCLinks:v4];

  v6 = [[HKLinkSetWrapper alloc] initWithLinks:v5];
  id v7 = [(HKUserDomainConceptLinkCollection *)self initWithLinkSetWrapper:v6 epoch:0];

  return v7;
}

- (id)_copyWithLinkSetWrapper:(id)a3
{
  id v4 = a3;
  v5 = [[HKUserDomainConceptLinkCollection alloc] initWithLinkSetWrapper:v4 epoch:self->_epoch];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t epoch = self->_epoch;
  v6 = [(HKUserDomainConceptLinkCollection *)self links];
  id v7 = [v3 stringWithFormat:@"<%@ %ld %@>", v4, epoch, v6];

  return v7;
}

- (NSArray)links
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_arrayRepresentation = self->_lock_arrayRepresentation;
  if (!lock_arrayRepresentation)
  {
    v5 = [(HKLinkSetWrapper *)self->_orderedSet elements];
    objc_msgSend(v5, "hk_map:", &__block_literal_global_52);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_lock_arrayRepresentation;
    self->_lock_arrayRepresentation = v6;

    lock_arrayRepresentation = self->_lock_arrayRepresentation;
  }
  v8 = lock_arrayRepresentation;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

HKUserDomainConceptLink *__42__HKUserDomainConceptLinkCollection_links__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HKUserDomainConceptLink alloc] initWithLinkStructWrapper:v2];

  return v3;
}

- (int64_t)count
{
  return [(HKLinkSetWrapper *)self->_orderedSet count];
}

- (id)collectionByAppendingLink:(id)a3
{
  orderedSet = self->_orderedSet;
  id v5 = a3;
  v6 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithLink:v5];

  id v7 = [(HKLinkSetWrapper *)orderedSet appendingElement:v6];

  id v8 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v7];

  return v8;
}

- (id)collectionByAppendingLinks:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "hk_map:", &__block_literal_global_291);
  id v5 = [(HKLinkSetWrapper *)self->_orderedSet appendingElements:v4];
  id v6 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v5];

  return v6;
}

HKUserDomainConceptLinkStructWrapper *__64__HKUserDomainConceptLinkCollection_collectionByAppendingLinks___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithLink:v2];

  return v3;
}

- (id)collectionByInsertingLink:(id)a3 atIndex:(unint64_t)a4
{
  orderedSet = self->_orderedSet;
  id v8 = a3;
  if ([(HKLinkSetWrapper *)orderedSet count] < a4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 133, @"Invalid parameter not satisfying: %@", @"index <= _orderedSet.count" object file lineNumber description];
  }
  v9 = self->_orderedSet;
  v10 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithLink:v8];

  objc_super v11 = [(HKLinkSetWrapper *)v9 insertingElement:v10 index:a4];

  id v12 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v11];

  return v12;
}

- (id)collectionByMovingLinkFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  if ([(HKLinkSetWrapper *)self->_orderedSet count] <= a3)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 143, @"Invalid parameter not satisfying: %@", @"index < _orderedSet.count" object file lineNumber description];
  }
  if ([(HKLinkSetWrapper *)self->_orderedSet count] <= a4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 144, @"Invalid parameter not satisfying: %@", @"destination < _orderedSet.count" object file lineNumber description];
  }
  if (a3 == a4)
  {
    id v8 = self;
  }
  else
  {
    v9 = [(HKLinkSetWrapper *)self->_orderedSet movingElementFrom:a3 to:a4];
    id v8 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v9];
  }

  return v8;
}

- (id)collectionByRemovingLinkAtIndex:(unint64_t)a3
{
  if ([(HKLinkSetWrapper *)self->_orderedSet count] <= a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 156, @"Invalid parameter not satisfying: %@", @"index < _orderedSet.count" object file lineNumber description];
  }
  id v6 = [(HKLinkSetWrapper *)self->_orderedSet removingAtIndex:a3];
  id v7 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v6];

  return v7;
}

- (id)collectionByRemovingLinksWithTargetUUID:(id)a3
{
  uint64_t v4 = [(HKLinkSetWrapper *)self->_orderedSet removingLinksWithUUID:a3];
  id v5 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v4];

  return v5;
}

- (id)collectionByRemovingAllLinks
{
  v3 = [(HKLinkSetWrapper *)self->_orderedSet removingAll];
  id v4 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v3];

  return v4;
}

- (id)collectionByReplacingLinkAtIndex:(unint64_t)a3 withLink:(id)a4
{
  orderedSet = self->_orderedSet;
  id v8 = a4;
  if ([(HKLinkSetWrapper *)orderedSet count] <= a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 179, @"Invalid parameter not satisfying: %@", @"index < _orderedSet.count" object file lineNumber description];
  }
  v9 = self->_orderedSet;
  v10 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithLink:v8];

  objc_super v11 = [(HKLinkSetWrapper *)v9 replacingElementAt:a3 withElement:v10];

  id v12 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v11];

  return v12;
}

- (id)collectionByRetargetingLinksWithUUID:(id)a3 withNewUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqual:v6])
  {
    id v8 = self;
  }
  else
  {
    v9 = [(HKLinkSetWrapper *)self->_orderedSet retargetingLinksWithUUID:v6 newUUID:v7];
    id v8 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v9];
  }

  return v8;
}

- (id)collectionBySwappingLinksAtIndex:(unint64_t)a3 otherIndex:(unint64_t)a4
{
  if ([(HKLinkSetWrapper *)self->_orderedSet count] <= a3)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 201, @"Invalid parameter not satisfying: %@", @"idx1 < _orderedSet.count" object file lineNumber description];
  }
  if ([(HKLinkSetWrapper *)self->_orderedSet count] <= a4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKUserDomainConceptLinkCollection.m", 202, @"Invalid parameter not satisfying: %@", @"idx2 < _orderedSet.count" object file lineNumber description];
  }
  id v8 = [(HKLinkSetWrapper *)self->_orderedSet swappingElementsAt:a3 andAt:a4];
  id v9 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v8];

  return v9;
}

+ (id)collectionByMergingCollection:(id)a3 otherCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      id v8 = [v5 collectionByMergingCollection:v6];
    }
    else
    {
      id v8 = v6;
    }
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

- (id)collectionByMergingCollection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t epoch = self->_epoch;
  int64_t v6 = v4[4];
  if (epoch <= v6)
  {
    if (epoch >= v6)
    {
      v14 = [(HKLinkSetWrapper *)self->_orderedSet mergingLinkSet:v4[1]];
      v15 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v14];

      goto LABEL_11;
    }
    _HKInitializeLogging();
    objc_super v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v12 = v4[4];
      int64_t v13 = self->_epoch;
      int v17 = 138543874;
      v18 = self;
      __int16 v19 = 2048;
      int64_t v20 = v12;
      __int16 v21 = 2048;
      int64_t v22 = v13;
      _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: returning other because epoch %ld is higher than self epoch %ld", (uint8_t *)&v17, 0x20u);
    }

    v10 = v4;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogHealthOntology();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = self->_epoch;
      int64_t v9 = v4[4];
      int v17 = 138543874;
      v18 = self;
      __int16 v19 = 2048;
      int64_t v20 = v8;
      __int16 v21 = 2048;
      int64_t v22 = v9;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: returning self because epoch %ld is higher than other epoch %ld", (uint8_t *)&v17, 0x20u);
    }

    v10 = self;
  }
  v15 = v10;
LABEL_11:

  return v15;
}

- (id)collectionByMergingInLegacyArrayOfLinks:(id)a3
{
  id v4 = objc_msgSend(a3, "hk_map:", &__block_literal_global_315);
  id v5 = [(HKLinkSetWrapper *)self->_orderedSet mergingLegacyElementsArray:v4];
  if ([v5 isEqual:self->_orderedSet]) {
    int64_t v6 = self;
  }
  else {
    int64_t v6 = [(HKUserDomainConceptLinkCollection *)self _copyWithLinkSetWrapper:v5];
  }
  id v7 = v6;

  return v7;
}

HKUserDomainConceptLinkStructWrapper *__77__HKUserDomainConceptLinkCollection_collectionByMergingInLegacyArrayOfLinks___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithLink:v2];

  return v3;
}

- (unint64_t)hash
{
  id v2 = [(HKUserDomainConceptLinkCollection *)self links];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKUserDomainConceptLinkCollection *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKLinkSetWrapper *)self->_orderedSet isEqual:v4->_orderedSet];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x19F395970]();
  orderedSet = self->_orderedSet;
  id v17 = 0;
  id v7 = [(HKLinkSetWrapper *)orderedSet serializedDataWithError:&v17];
  id v8 = v17;
  if (v7)
  {
    if ((unint64_t)[v7 length] < 0x32000)
    {
      [v4 encodeObject:v7 forKey:@"links"];
      [v4 encodeInteger:self->_epoch forKey:@"epoch"];
      goto LABEL_10;
    }
    _HKInitializeLogging();
    int64_t v9 = HKLogHealthOntology();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = objc_opt_class();
      int64_t v15 = [(HKLinkSetWrapper *)self->_orderedSet count];
      uint64_t v16 = [v7 length];
      *(_DWORD *)buf = 138544386;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2048;
      int64_t v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = 204800;
      _os_log_fault_impl(&dword_19C023000, v9, OS_LOG_TYPE_FAULT, "<%{public}@:%p %ld>: Dropping history because serialized data length %ld > %ld", buf, 0x34u);
    }

    v10 = [HKLinkSetWrapper alloc];
    objc_super v11 = [(HKLinkSetWrapper *)self->_orderedSet elements];
    int64_t v12 = [(HKLinkSetWrapper *)v10 initWithLinks:v11];

    int64_t v13 = [[HKUserDomainConceptLinkCollection alloc] initWithLinkSetWrapper:v12 epoch:self->_epoch + 1];
    [(HKUserDomainConceptLinkCollection *)v13 encodeWithCoder:v4];
  }
  else
  {
    _HKInitializeLogging();
    int64_t v12 = HKLogHealthOntology();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HKUserDomainConceptLinkCollection encodeWithCoder:]();
    }
  }

LABEL_10:
}

- (HKUserDomainConceptLinkCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  BOOL v5 = [(HKUserDomainConceptLinkCollection *)self _orderedSetWithDecoder:v4 error:&v14];
  id v6 = v14;
  if (v5)
  {
    uint64_t v7 = [v4 decodeIntegerForKey:@"epoch"];
    v13.receiver = self;
    v13.super_class = (Class)HKUserDomainConceptLinkCollection;
    id v8 = [(HKUserDomainConceptLinkCollection *)&v13 init];
    int64_t v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_orderedSet, v5);
      v9->_int64_t epoch = v7;
      v9->_lock._os_unfair_lock_opaque = 0;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    _HKInitializeLogging();
    objc_super v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HKUserDomainConceptLinkCollection initWithCoder:]();
    }

    v10 = 0;
  }

  return v10;
}

- (id)_orderedSetWithDecoder:(id)a3 error:(id *)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v8 = a3;
  id v9 = [v7 alloc];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  objc_super v11 = (void *)[v9 initWithArray:v10];

  int64_t v12 = [v8 decodeObjectOfClasses:v11 forKey:@"links"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v13 = [[HKLinkSetWrapper alloc] initWithSerializedData:v12 error:a4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [HKLinkSetWrapper alloc];
      int64_t v15 = [(id)objc_opt_class() _wrappedUDCLinks:v12];
      objc_super v13 = [(HKLinkSetWrapper *)v14 initWithLinks:v15];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v12 array];
        id v17 = [HKLinkSetWrapper alloc];
        v18 = [(id)objc_opt_class() _wrappedUDCLinks:v16];
        objc_super v13 = [(HKLinkSetWrapper *)v17 initWithLinks:v18];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2 object:self file:@"HKUserDomainConceptLinkCollection.m" lineNumber:356 description:@"Unreachable code has been executed"];

        objc_super v13 = 0;
      }
    }
  }

  return v13;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(HKUserDomainConceptLinkCollection *)self links];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

+ (id)_wrappedUDCLinks:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_330);
}

HKUserDomainConceptLinkStructWrapper *__54__HKUserDomainConceptLinkCollection__wrappedUDCLinks___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[HKUserDomainConceptLinkStructWrapper alloc] initWithLink:v2];

  return v3;
}

- (void)unitTesting_setEpoch:(int64_t)a3
{
  self->_int64_t epoch = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_arrayRepresentation, 0);

  objc_storeStrong((id *)&self->_orderedSet, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v0, v1, "%{public}@: unable to encode %{public}@: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_12(&dword_19C023000, v0, v1, "%{public}@: unable to decode %{public}@: %{public}@", v2, v3, v4, v5, v6);
}

@end