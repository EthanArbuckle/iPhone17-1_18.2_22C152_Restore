@interface CNDecision
+ (id)_copyDecisionFromInternal:(id)a3;
+ (id)_copyDecisionsFromInternal:(id)a3;
+ (id)_copyInternalFromDecisions:(id)a3;
+ (id)_takeDecisionsFromInternal:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupDecision;
- (BOOL)isStrongDecision;
- (BOOL)isUserDecision;
- (CMTime)time;
- (CNDecision)initWithTime:(CMTime *)time detectionGroupID:(CNDetectionGroupID)detectionGroupID strong:(BOOL)isStrong;
- (CNDecision)initWithTime:(CMTime *)time detectionID:(CNDetectionID)detectionID strong:(BOOL)isStrong;
- (CNDetectionGroupID)detectionGroupID;
- (CNDetectionID)detectionID;
- (PTCinematographyDecision)internalDecision;
- (id)_initCopyingInternalDecision:(id)a3;
- (id)_initTakingInternalDecision:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setInternalDecision:(id)a3;
@end

@implementation CNDecision

- (CNDecision)initWithTime:(CMTime *)time detectionID:(CNDetectionID)detectionID strong:(BOOL)isStrong
{
  BOOL v8 = isStrong;
  id v9 = objc_alloc(MEMORY[0x263F5F2A0]);
  CMTime v13 = *time;
  v10 = (void *)[v9 initWithTime:&v13 trackIdentifier:detectionID options:v8];
  v11 = [(CNDecision *)self _initTakingInternalDecision:v10];

  return v11;
}

- (CNDecision)initWithTime:(CMTime *)time detectionGroupID:(CNDetectionGroupID)detectionGroupID strong:(BOOL)isStrong
{
  uint64_t v8 = isStrong | 2;
  id v9 = objc_alloc(MEMORY[0x263F5F2A0]);
  CMTime v13 = *time;
  v10 = (void *)[v9 initWithTime:&v13 groupIdentifier:detectionGroupID options:v8];
  v11 = [(CNDecision *)self _initTakingInternalDecision:v10];

  return v11;
}

- (CMTime)time
{
  result = (CMTime *)self->_internalDecision;
  if (result) {
    return (CMTime *)[(CMTime *)result time];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CNDetectionID)detectionID
{
  return [(PTCinematographyDecision *)self->_internalDecision trackIdentifier];
}

- (CNDetectionGroupID)detectionGroupID
{
  return [(PTCinematographyDecision *)self->_internalDecision groupIdentifier];
}

- (BOOL)isUserDecision
{
  return [(PTCinematographyDecision *)self->_internalDecision isUserDecision];
}

- (BOOL)isStrongDecision
{
  return [(PTCinematographyDecision *)self->_internalDecision isStrongDecision];
}

- (BOOL)isGroupDecision
{
  return [(PTCinematographyDecision *)self->_internalDecision isGroupDecision];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CNDecision *)self internalDecision];
    v7 = [v5 internalDecision];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CNDecision *)self internalDecision];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(CNDecision *)self internalDecision];
  v6 = (void *)[v4 _initCopyingInternalDecision:v5];

  return v6;
}

- (id)_initTakingInternalDecision:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNDecision;
  v6 = [(CNDecision *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalDecision, a3);
  }

  return v7;
}

- (id)_initCopyingInternalDecision:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = [(CNDecision *)self _initTakingInternalDecision:v4];

  return v5;
}

- (PTCinematographyDecision)internalDecision
{
  return (PTCinematographyDecision *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalDecision:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_copyDecisionFromInternal:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initCopyingInternalDecision:v4];

  return v5;
}

+ (id)_takeDecisionsFromInternal:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_alloc((Class)a1);
        CMTime v13 = objc_msgSend(v12, "_initTakingInternalDecision:", v11, (void)v16);
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return v14;
}

+ (id)_copyDecisionsFromInternal:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v11 = objc_msgSend(a1, "_copyDecisionFromInternal:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
}

+ (id)_copyInternalFromDecisions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "internalDecision", (void)v14);
        uint64_t v11 = (void *)[v10 copy];
        [v4 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];
  return v12;
}

@end