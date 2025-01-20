@interface IPInstallableProgressData
+ (BOOL)supportsSecureCoding;
- (IPInstallableProgressData)init;
- (IPInstallableProgressData)initWithCoder:(id)a3;
- (double)fractionCompleted;
- (id)_findOrCreatePhaseState:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)completedUnitCountForPhase:(unint64_t)a3;
- (unint64_t)finalPhase;
- (unint64_t)installPhase;
- (unint64_t)totalUnitCountForPhase:(unint64_t)a3;
- (void)_recalculateCurrentFractionCompleted;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4;
- (void)setFinalPhase:(unint64_t)a3;
- (void)setInstallPhase:(unint64_t)a3;
- (void)setTotalUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4;
- (void)setTotalUnitCountsForPhases:(id)a3;
@end

@implementation IPInstallableProgressData

- (id)_findOrCreatePhaseState:(unint64_t)a3
{
  phaseStates = self->_phaseStates;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v7 = [(NSMutableDictionary *)phaseStates objectForKey:v6];

  if (!v7)
  {
    v7 = objc_alloc_init(IPPhaseState);
    v8 = self->_phaseStates;
    v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKey:v9];
  }

  return v7;
}

- (IPInstallableProgressData)init
{
  v8.receiver = self;
  v8.super_class = (Class)IPInstallableProgressData;
  v2 = [(IPInstallableProgressData *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    uint64_t v5 = 0;
    *(_OWORD *)(v2 + 24) = xmmword_252ABA250;
    *((void *)v2 + 2) = 0;
    do
      id v6 = (id)[v2 _findOrCreatePhaseState:orderedPhases[v5++]];
    while (v5 != 5);
  }
  return (IPInstallableProgressData *)v2;
}

- (void)_recalculateCurrentFractionCompleted
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = self->_phaseStates;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {

LABEL_18:
    double v16 = 0.0;
    goto LABEL_19;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v18;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
      v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_phaseStates, "objectForKeyedSubscript:", v10, (void)v17);
      if (v11) {
        uint64_t v12 = v11[1];
      }
      else {
        uint64_t v12 = 0;
      }

      v13 = [(NSMutableDictionary *)self->_phaseStates objectForKeyedSubscript:v10];
      if (v13) {
        uint64_t v14 = v13[2];
      }
      else {
        uint64_t v14 = 0;
      }
      v7 += v12;
      v6 += v14;

      ++v9;
    }
    while (v5 != v9);
    uint64_t v15 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    uint64_t v5 = v15;
  }
  while (v15);

  if (!v7) {
    goto LABEL_18;
  }
  double v16 = (double)v6 / (double)v7;
LABEL_19:
  self->_currentFractionCompleted = v16;
}

- (unint64_t)completedUnitCountForPhase:(unint64_t)a3
{
  id v3 = [(IPInstallableProgressData *)self _findOrCreatePhaseState:a3];
  if (v3) {
    unint64_t v4 = v3[2];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setCompletedUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  unint64_t v6 = [(IPInstallableProgressData *)self _findOrCreatePhaseState:a4];
  if (v6) {
    v6[2] = a3;
  }

  [(IPInstallableProgressData *)self _recalculateCurrentFractionCompleted];
}

- (unint64_t)totalUnitCountForPhase:(unint64_t)a3
{
  id v3 = [(IPInstallableProgressData *)self _findOrCreatePhaseState:a3];
  if (v3) {
    unint64_t v4 = v3[1];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setTotalUnitCount:(unint64_t)a3 forPhase:(unint64_t)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v9 = v6;
  unint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v10[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(IPInstallableProgressData *)self setTotalUnitCountsForPhases:v8];
}

- (void)setTotalUnitCountsForPhases:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        v11 = -[IPInstallableProgressData _findOrCreatePhaseState:](self, "_findOrCreatePhaseState:", [v9 unsignedIntegerValue]);
        uint64_t v12 = [v10 unsignedLongLongValue];
        if (v11) {
          v11[1] = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  [(IPInstallableProgressData *)self _recalculateCurrentFractionCompleted];
}

- (void)setInstallPhase:(unint64_t)a3
{
  uint64_t v4 = 0;
  self->_installPhase = a3;
  while (orderedPhases[v4] != a3)
  {
    if (++v4 == 5) {
      goto LABEL_10;
    }
  }
  if ((int)v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [(IPInstallableProgressData *)self _findOrCreatePhaseState:orderedPhases[i]];
      if (v6) {
        v6[2] = v6[1];
      }
    }
  }
LABEL_10:

  [(IPInstallableProgressData *)self _recalculateCurrentFractionCompleted];
}

- (double)fractionCompleted
{
  return self->_currentFractionCompleted;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@: %p {P %llu PTUC %llu PCUC %llu FC %f}>", objc_opt_class(), self, self->_installPhase, -[IPInstallableProgressData totalUnitCountForPhase:](self, "totalUnitCountForPhase:", self->_installPhase), -[IPInstallableProgressData completedUnitCountForPhase:](self, "completedUnitCountForPhase:", self->_installPhase), *(void *)&self->_currentFractionCompleted];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IPInstallableProgressData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPInstallableProgressData;
  uint64_t v5 = [(IPInstallableProgressData *)&v12 init];
  if (v5)
  {
    v5->_installPhase = [v4 decodeIntegerForKey:@"installPhase"];
    v5->_finalPhase = [v4 decodeIntegerForKey:@"finalPhase"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = IPDecodeDictionaryWithKeyClassAndValueClass(v4, @"phaseStates", v6, v7);
    uint64_t v9 = [v8 mutableCopy];
    phaseStates = v5->_phaseStates;
    v5->_phaseStates = (NSMutableDictionary *)v9;

    if (v5->_installPhase && v5->_finalPhase && v5->_phaseStates)
    {
      [(IPInstallableProgressData *)v5 _recalculateCurrentFractionCompleted];
    }
    else
    {

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t installPhase = self->_installPhase;
  id v5 = a3;
  [v5 encodeInteger:installPhase forKey:@"installPhase"];
  [v5 encodeInteger:self->_finalPhase forKey:@"finalPhase"];
  [v5 encodeObject:self->_phaseStates forKey:@"phaseStates"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(IPInstallableProgressData);
  v4->_unint64_t installPhase = self->_installPhase;
  v4->_finalPhase = self->_finalPhase;
  uint64_t v5 = [(NSMutableDictionary *)self->_phaseStates mutableCopy];
  phaseStates = v4->_phaseStates;
  v4->_phaseStates = (NSMutableDictionary *)v5;

  [(IPInstallableProgressData *)v4 _recalculateCurrentFractionCompleted];
  return v4;
}

- (unint64_t)installPhase
{
  return self->_installPhase;
}

- (unint64_t)finalPhase
{
  return self->_finalPhase;
}

- (void)setFinalPhase:(unint64_t)a3
{
  self->_finalPhase = a3;
}

- (void).cxx_destruct
{
}

@end