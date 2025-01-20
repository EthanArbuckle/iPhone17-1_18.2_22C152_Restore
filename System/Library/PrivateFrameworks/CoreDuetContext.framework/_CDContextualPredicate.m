@interface _CDContextualPredicate
+ (BOOL)supportsSecureCoding;
+ (id)andPredicateWithSubpredicates:(id)a3;
+ (id)contextualPredicateForKeyPaths:(id)a3 withPredicate:(id)a4;
+ (id)notPredicateWithSubpredicate:(id)a3;
+ (id)orPredicateWithSubpredicates:(id)a3;
+ (id)predicateForChangeAtKeyPath:(id)a3;
+ (id)predicateForChangeAtKeyPath:(id)a3 withMinimumDurationInPreviousState:(double)a4;
+ (id)predicateForChangeAtKeyPaths:(id)a3;
+ (id)predicateForKeyPath:(id)a3 equalToValue:(id)a4;
+ (id)predicateForKeyPath:(id)a3 equalToValue:(id)a4 withMinimumDurationInPreviousState:(double)a5;
+ (id)predicateForKeyPath:(id)a3 withFormat:(id)a4;
+ (id)predicateForKeyPath:(id)a3 withPredicate:(id)a4;
+ (id)predicateForKeyPath:(id)a3 withPredicate:(id)a4 withPredicateForPreviousState:(id)a5 withMinimumDurationInPreviousState:(double)a6;
- (BOOL)evaluateOnEveryKeyPathUpdate;
- (BOOL)evaluateWithObject:(id)a3;
- (BOOL)evaluateWithState:(id)a3 previousValue:(id)a4;
- (BOOL)firesOnAnyChange;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)timeBasedPredicateEvaluationIntervals;
- (NSPredicate)predicate;
- (NSPredicate)predicateForPreviousState;
- (NSSet)circularLocationRegions;
- (NSSet)keyPaths;
- (_CDContextualPredicate)initWithCoder:(id)a3;
- (double)minimumDurationInPreviousState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForChangeAtKeyPath:(id)a3;
- (id)initForChangeAtKeyPath:(id)a3 equalToValue:(id)a4;
- (id)initForChangeAtKeyPaths:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCircularLocationRegions:(id)a3;
- (void)setEvaluateOnEveryKeyPathUpdate:(BOOL)a3;
- (void)setKeyPaths:(id)a3;
- (void)setMinimumDurationInPreviousState:(double)a3;
- (void)setPredicate:(id)a3;
- (void)setPredicateForPreviousState:(id)a3;
- (void)setTimeBasedPredicateEvaluationIntervals:(id)a3;
@end

@implementation _CDContextualPredicate

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (BOOL)firesOnAnyChange
{
  return self->_predicate == 0;
}

- (double)minimumDurationInPreviousState
{
  return self->_minimumDurationInPreviousState;
}

- (BOOL)evaluateWithState:(id)a3 previousValue:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v8 = [(_CDContextualPredicate *)self keyPaths];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        BOOL v13 = v12 == 0;

        if (v13)
        {

          goto LABEL_50;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v9);
  }

  if (!v7) {
    goto LABEL_20;
  }
  v14 = [(_CDContextualPredicate *)self predicateForPreviousState];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || ([(_CDContextualPredicate *)self predicateForPreviousState],
        v16 = objc_claimAutoreleasedReturnValue(),
        BOOL v17 = [v16 compoundPredicateType] == 0,
        v16,
        v17))
  {
LABEL_20:
    v26 = [(_CDContextualPredicate *)self predicate];
    char v27 = [v26 evaluateWithObject:v6];

    if (v27)
    {
      BOOL v28 = v7 != 0;
      v29 = [(_CDContextualPredicate *)self predicateForPreviousState];
      if (!v29) {
        BOOL v28 = 0;
      }

      if (v28)
      {
        v30 = [(_CDContextualPredicate *)self predicateForPreviousState];
        char v25 = [v30 evaluateWithObject:v7];
      }
      else
      {
        char v25 = 1;
      }
      goto LABEL_51;
    }
LABEL_50:
    char v25 = 0;
    goto LABEL_51;
  }
  v18 = [(_CDContextualPredicate *)self predicate];
  v19 = [(_CDContextualPredicate *)self predicateForPreviousState];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  uint64_t v20 = [v18 compoundPredicateType];
  if (v20 != [v19 compoundPredicateType]) {
    goto LABEL_26;
  }
  v21 = [v18 subpredicates];
  uint64_t v22 = [v21 count];
  v23 = [v19 subpredicates];
  LOBYTE(v22) = v22 == [v23 count];

  if ((v22 & 1) == 0)
  {
LABEL_26:
    v31 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[_CDContextualPredicate evaluateWithState:previousValue:]();
    }
    goto LABEL_28;
  }
  uint64_t v24 = [v18 compoundPredicateType];
  uint64_t v43 = v24;
  if (v24 == 2)
  {
    char v25 = 0;
    goto LABEL_32;
  }
  if (v24 != 1)
  {
    v31 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[_CDContextualPredicate evaluateWithState:previousValue:](v18);
    }
LABEL_28:
    char v25 = 0;
    goto LABEL_29;
  }
  char v25 = 1;
LABEL_32:
  v32 = [v18 subpredicates];
  BOOL v33 = [v32 count] == 0;

  if (v33) {
    goto LABEL_30;
  }
  uint64_t v34 = 0;
  while (1)
  {
    v35 = [v18 subpredicates];
    v31 = [v35 objectAtIndexedSubscript:v34];

    v36 = [v19 subpredicates];
    v37 = [v36 objectAtIndexedSubscript:v34];

    int v38 = [v31 evaluateWithObject:v6];
    if (v38) {
      LOBYTE(v38) = [v37 evaluateWithObject:v7];
    }
    if (v43 != 1) {
      break;
    }
    if ((v38 & 1) == 0) {
      goto LABEL_48;
    }
LABEL_41:

    v39 = [v18 subpredicates];
    unint64_t v40 = [v39 count];

    if (++v34 >= v40) {
      goto LABEL_30;
    }
  }
  if (v43 == 2)
  {
    if (v38)
    {
      char v25 = 1;
      goto LABEL_49;
    }
    goto LABEL_41;
  }
  v41 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
    -[_CDContextualPredicate evaluateWithState:previousValue:](v18);
  }

LABEL_48:
  char v25 = 0;
LABEL_49:

LABEL_29:
LABEL_30:

LABEL_51:
  return v25;
}

- (NSPredicate)predicateForPreviousState
{
  return self->_predicateForPreviousState;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_keyPaths forKey:@"keyPaths"];
  [v4 encodeObject:self->_predicate forKey:@"predicate"];
  [v4 encodeObject:self->_predicateForPreviousState forKey:@"predicateForPreviousState"];
  [v4 encodeObject:self->_timeBasedPredicateEvaluationIntervals forKey:@"timeBasedPredicateEvaluationIntervals"];
  [v4 encodeObject:self->_circularLocationRegions forKey:@"circularLocationRegions"];
  [v4 encodeBool:self->_evaluateOnEveryKeyPathUpdate forKey:@"evaluateOnEveryKeyPathUpdate"];
  if (self->_minimumDurationInPreviousState > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"duration");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularLocationRegions, 0);
  objc_storeStrong((id *)&self->_timeBasedPredicateEvaluationIntervals, 0);
  objc_storeStrong((id *)&self->_predicateForPreviousState, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
}

- (_CDContextualPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"keyPaths"];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"predicate"];
    if (v12)
    {
      if (!+[_CDPredicateValidator validatePredicate:v12 allowedKeys:0 error:0])
      {
        BOOL v13 = [MEMORY[0x1E4F5B418] contextChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[_CDContextualPredicate initWithCoder:]();
        }
        goto LABEL_15;
      }
      [v12 allowEvaluation];
    }
    BOOL v13 = [v4 decodeObjectOfClasses:v11 forKey:@"predicateForPreviousState"];
    if (!v13)
    {
LABEL_8:
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      uint64_t v24 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      [v4 decodeObjectOfClasses:v24 forKey:@"timeBasedPredicateEvaluationIntervals"];
      v16 = char v25 = self;
      BOOL v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = objc_opt_class();
      v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"circularLocationRegions"];
      v21 = objc_alloc_init(_CDContextualPredicate);
      [(_CDContextualPredicate *)v21 setKeyPaths:v8];
      [(_CDContextualPredicate *)v21 setPredicate:v12];
      [(_CDContextualPredicate *)v21 setPredicateForPreviousState:v13];
      [(_CDContextualPredicate *)v21 setTimeBasedPredicateEvaluationIntervals:v16];
      [(_CDContextualPredicate *)v21 setCircularLocationRegions:v20];
      -[_CDContextualPredicate setEvaluateOnEveryKeyPathUpdate:](v21, "setEvaluateOnEveryKeyPathUpdate:", [v4 decodeBoolForKey:@"evaluateOnEveryKeyPathUpdate"]);
      [v4 decodeDoubleForKey:@"duration"];
      -[_CDContextualPredicate setMinimumDurationInPreviousState:](v21, "setMinimumDurationInPreviousState:");

      self = v25;
LABEL_16:

      goto LABEL_17;
    }
    if (+[_CDPredicateValidator validatePredicate:v13 allowedKeys:0 error:0])
    {
      [v13 allowEvaluation];
      goto LABEL_8;
    }
    uint64_t v22 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[_CDContextualPredicate initWithCoder:]();
    }

LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (void)setTimeBasedPredicateEvaluationIntervals:(id)a3
{
}

- (void)setPredicateForPreviousState:(id)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (void)setMinimumDurationInPreviousState:(double)a3
{
  self->_minimumDurationInPreviousState = a3;
}

- (void)setKeyPaths:(id)a3
{
}

- (void)setEvaluateOnEveryKeyPathUpdate:(BOOL)a3
{
  self->_evaluateOnEveryKeyPathUpdate = a3;
}

- (void)setCircularLocationRegions:(id)a3
{
}

+ (id)predicateForChangeAtKeyPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForChangeAtKeyPath:v4];

  return v5;
}

- (id)initForChangeAtKeyPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDContextualPredicate;
  v5 = [(_CDContextualPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    keyPaths = v5->_keyPaths;
    v5->_keyPaths = (NSSet *)v6;
  }
  return v5;
}

+ (id)predicateForChangeAtKeyPaths:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForChangeAtKeyPaths:v4];

  return v5;
}

- (id)initForChangeAtKeyPaths:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDContextualPredicate;
  v5 = [(_CDContextualPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    keyPaths = v5->_keyPaths;
    v5->_keyPaths = (NSSet *)v6;
  }
  return v5;
}

+ (id)predicateForKeyPath:(id)a3 equalToValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initForChangeAtKeyPath:v7 equalToValue:v6];

  return v8;
}

- (id)initForChangeAtKeyPath:(id)a3 equalToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CDContextualPredicate;
  v8 = [(_CDContextualPredicate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    keyPaths = v8->_keyPaths;
    v8->_keyPaths = (NSSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.%@.value == %@", v6, v7];
    predicate = v8->_predicate;
    v8->_predicate = (NSPredicate *)v11;
  }
  return v8;
}

+ (id)predicateForKeyPath:(id)a3 withPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];

  [v8 setKeyPaths:v9];
  [v8 setPredicate:v6];

  return v8;
}

+ (id)contextualPredicateForKeyPaths:(id)a3 withPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setKeyPaths:v7];

  [v8 setPredicate:v6];
  return v8;
}

+ (id)predicateForKeyPath:(id)a3 withFormat:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  id v7 = [v5 predicateWithFormat:a4 arguments:&v11];
  id v8 = +[_CDContextualPredicate predicateForKeyPath:v6 withPredicate:v7];

  return v8;
}

+ (id)predicateForChangeAtKeyPath:(id)a3 withMinimumDurationInPreviousState:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];

  [v7 setKeyPaths:v8];
  [v7 setMinimumDurationInPreviousState:a4];
  return v7;
}

+ (id)predicateForKeyPath:(id)a3 equalToValue:(id)a4 withMinimumDurationInPreviousState:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  [v10 setKeyPaths:v11];

  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.%@.value == %@", v9, v8];

  [v10 setPredicate:v12];
  [v10 setMinimumDurationInPreviousState:a5];
  return v10;
}

+ (id)predicateForKeyPath:(id)a3 withPredicate:(id)a4 withPredicateForPreviousState:(id)a5 withMinimumDurationInPreviousState:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)a1);
  objc_super v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];

  [v13 setKeyPaths:v14];
  [v13 setPredicate:v11];

  [v13 setPredicateForPreviousState:v10];
  [v13 setMinimumDurationInPreviousState:a6];
  return v13;
}

+ (id)notPredicateWithSubpredicate:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 predicate];
  BOOL v33 = (void *)v5;
  if (v5) {
    [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v5];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  id v7 = [v4 keyPaths];
  uint64_t v8 = [v7 copy];

  v31 = (void *)v8;
  v32 = (void *)v6;
  id v9 = [a1 contextualPredicateForKeyPaths:v8 withPredicate:v6];
  id v10 = [v4 circularLocationRegions];
  [v9 setCircularLocationRegions:v10];

  uint64_t v34 = v4;
  id v11 = [v4 timeBasedPredicateEvaluationIntervals];
  id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      uint64_t v18 = 0;
      v19 = v12;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
        id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v22 = [v20 startDate];
        v23 = (void *)[v21 initWithStartDate:v19 endDate:v22];

        [v23 duration];
        if (v24 > 0.0) {
          [v13 addObject:v23];
        }
        id v12 = [v20 endDate];

        ++v18;
        v19 = v12;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v16);
  }

  id v25 = objc_alloc(MEMORY[0x1E4F28C18]);
  v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v27 = (void *)[v25 initWithStartDate:v12 endDate:v26];

  [v27 duration];
  if (v28 > 0.0) {
    [v13 addObject:v27];
  }
  v29 = (void *)[v13 copy];

  [v9 setTimeBasedPredicateEvaluationIntervals:v29];
  return v9;
}

+ (id)andPredicateWithSubpredicates:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v44 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __56___CDContextualPredicate_andPredicateWithSubpredicates___block_invoke;
  v49[3] = &unk_1E5609388;
  v49[4] = &v50;
  [v3 enumerateObjectsUsingBlock:v49];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (!v8) {
    goto LABEL_19;
  }
  uint64_t v9 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v46 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      id v12 = [v11 predicate];

      if (v12)
      {
        id v13 = [v11 predicate];
        [v44 addObject:v13];
      }
      id v14 = [v11 predicateForPreviousState];

      if (v14)
      {
        uint64_t v15 = [v11 predicateForPreviousState];
        [v4 addObject:v15];
      }
      else
      {
        if (!*((unsigned char *)v51 + 24)) {
          goto LABEL_13;
        }
        uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
        [v4 addObject:v15];
      }

LABEL_13:
      uint64_t v16 = [v11 keyPaths];
      [v5 unionSet:v16];

      uint64_t v17 = [v11 timeBasedPredicateEvaluationIntervals];
      uint64_t v18 = [v17 array];

      if (v18) {
        [v6 addObjectsFromArray:v18];
      }
      v19 = [v11 circularLocationRegions];
      BOOL v20 = v19 == 0;

      if (!v20)
      {
        id v21 = [v11 circularLocationRegions];
        uint64_t v22 = [v21 allObjects];
        [v7 addObjectsFromArray:v22];
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  }
  while (v8);
LABEL_19:

  v39 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v44];
  if ([v4 count])
  {
    [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v5, objc_claimAutoreleasedReturnValue());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v5, 0);
  v23 = };
  id v42 = [a1 contextualPredicateForKeyPaths:v23 withPredicate:v39];

  id v40 = (id)[v6 copy];
  if ([v40 count])
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v25 = [MEMORY[0x1E4F1C9C8] distantPast];
    v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
    char v27 = (void *)[v24 initWithStartDate:v25 endDate:v26];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v28 = v40;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v55;
      do
      {
        uint64_t v31 = 0;
        v32 = v27;
        do
        {
          if (*(void *)v55 != v30) {
            objc_enumerationMutation(v28);
          }
          char v27 = [v32 intersectionWithDateInterval:*(void *)(*((void *)&v54 + 1) + 8 * v31)];

          ++v31;
          v32 = v27;
        }
        while (v29 != v31);
        uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v29);
    }

    if (v27 && ([v27 duration], v33 > 0.0)) {
      id v34 = (id)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObject:v27];
    }
    else {
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    }
    id v35 = v34;
  }
  else
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  }

  [v42 setTimeBasedPredicateEvaluationIntervals:v35];
  long long v36 = (void *)[v7 copy];
  [v42 setCircularLocationRegions:v36];

  [v42 setPredicateForPreviousState:v38];
  _Block_object_dispose(&v50, 8);

  return v42;
}

+ (id)orPredicateWithSubpredicates:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v52 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = [MEMORY[0x1E4F1CA48] array];
  long long v55 = [MEMORY[0x1E4F1CA80] set];
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __55___CDContextualPredicate_orPredicateWithSubpredicates___block_invoke;
  v61[3] = &unk_1E5609388;
  v61[4] = &v62;
  [v4 enumerateObjectsUsingBlock:v61];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v9 = [v8 predicate];

        if (v9)
        {
          id v10 = [v8 predicate];
          [v52 addObject:v10];
        }
        id v11 = [v8 predicateForPreviousState];

        if (v11)
        {
          id v12 = [v8 predicateForPreviousState];
          [v54 addObject:v12];
        }
        else
        {
          if (!*((unsigned char *)v63 + 24)) {
            goto LABEL_13;
          }
          id v12 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
          [v54 addObject:v12];
        }

LABEL_13:
        id v13 = [v8 keyPaths];
        [v55 unionSet:v13];

        id v14 = [v8 timeBasedPredicateEvaluationIntervals];
        uint64_t v15 = [v14 array];

        if (v15) {
          [v51 addObjectsFromArray:v15];
        }
        uint64_t v16 = [v8 circularLocationRegions];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          uint64_t v18 = [v8 circularLocationRegions];
          v19 = [v18 allObjects];
          [v50 addObjectsFromArray:v19];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v5);
  }

  if ([v52 count])
  {
    long long v45 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v52];
  }
  else
  {
    long long v45 = 0;
  }
  if ([v54 count])
  {
    uint64_t v43 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v54];
  }
  else
  {
    uint64_t v43 = 0;
  }
  BOOL v20 = [MEMORY[0x1E4F1CAD0] setWithSet:v55];
  id v44 = [a1 contextualPredicateForKeyPaths:v20 withPredicate:v45];

  id v42 = (id)[v51 copy];
  id v21 = (void *)[v42 copy];
  do
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v46 = v21;
    uint64_t v48 = [v46 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v71 != v47) {
            objc_enumerationMutation(v46);
          }
          id v22 = *(id *)(*((void *)&v70 + 1) + 8 * j);
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v23 = (void *)[v56 copy];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v67;
            do
            {
              for (uint64_t k = 0; k != v24; ++k)
              {
                if (*(void *)v67 != v25) {
                  objc_enumerationMutation(v23);
                }
                char v27 = *(void **)(*((void *)&v66 + 1) + 8 * k);
                if ([v22 intersectsDateInterval:v27])
                {
                  id v28 = [v22 startDate];
                  uint64_t v29 = [v27 startDate];
                  uint64_t v30 = [v28 earlierDate:v29];

                  uint64_t v31 = [v22 endDate];
                  v32 = [v27 endDate];
                  double v33 = [v31 laterDate:v32];

                  uint64_t v34 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v30 endDate:v33];
                  [v56 removeObject:v27];

                  id v22 = (id)v34;
                }
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v75 count:16];
            }
            while (v24);
          }

          [v22 duration];
          if (v35 > 0.0) {
            [v56 addObject:v22];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v48);
    }

    uint64_t v36 = [v56 count];
    uint64_t v37 = [v46 count];
    id v21 = [v56 allObjects];
  }
  while (v36 != v37);
  long long v38 = [v21 sortedArrayUsingSelector:sel_compare_];
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v38];

  [v44 setTimeBasedPredicateEvaluationIntervals:v39];
  id v40 = (void *)[v50 copy];
  [v44 setCircularLocationRegions:v40];

  [v44 setPredicateForPreviousState:v43];
  _Block_object_dispose(&v62, 8);

  return v44;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(NSPredicate *)self->_predicate evaluateWithObject:v4];

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = (void *)[(NSSet *)self->_keyPaths copy];
  [v4 setKeyPaths:v5];

  [v4 setPredicate:self->_predicate];
  [v4 setPredicateForPreviousState:self->_predicateForPreviousState];
  [v4 setTimeBasedPredicateEvaluationIntervals:self->_timeBasedPredicateEvaluationIntervals];
  [v4 setCircularLocationRegions:self->_circularLocationRegions];
  [v4 setEvaluateOnEveryKeyPathUpdate:self->_evaluateOnEveryKeyPathUpdate];
  [v4 setMinimumDurationInPreviousState:self->_minimumDurationInPreviousState];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (_CDContextualPredicate *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      keyPaths = self->_keyPaths;
      uint64_t v8 = [(_CDContextualPredicate *)v6 keyPaths];
      if (![(NSSet *)keyPaths isEqual:v8])
      {
        char v13 = 0;
LABEL_22:

        goto LABEL_23;
      }
      predicate = self->_predicate;
      id v10 = predicate;
      if (!predicate)
      {
        uint64_t v11 = [(_CDContextualPredicate *)v6 predicate];
        if (!v11)
        {
          id v22 = 0;
          int v12 = 0;
          goto LABEL_14;
        }
        id v22 = (void *)v11;
        id v10 = self->_predicate;
      }
      id v3 = [(_CDContextualPredicate *)v6 predicate];
      if (([(NSPredicate *)v10 isEqual:v3] & 1) == 0)
      {

        char v13 = 0;
        goto LABEL_20;
      }
      int v12 = 1;
LABEL_14:
      predicateForPreviousState = self->_predicateForPreviousState;
      uint64_t v15 = predicateForPreviousState;
      if (!predicateForPreviousState)
      {
        uint64_t v16 = [(_CDContextualPredicate *)v6 predicateForPreviousState];
        if (!v16)
        {
          v19 = 0;
          char v13 = 1;
          goto LABEL_26;
        }
        uint64_t v20 = v16;
        uint64_t v15 = self->_predicateForPreviousState;
      }
      BOOL v17 = [(_CDContextualPredicate *)v6 predicateForPreviousState];
      char v13 = [(NSPredicate *)v15 isEqual:v17];

      if (predicateForPreviousState)
      {
        if (!v12) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      v19 = v21;
LABEL_26:

      if ((v12 & 1) == 0)
      {
LABEL_20:
        if (!predicate) {

        }
        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    char v13 = 0;
  }
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_keyPaths hash];
  uint64_t v4 = [(NSPredicate *)self->_predicate hash] ^ v3;
  return v4 ^ [(NSPredicate *)self->_predicateForPreviousState hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  predicate = self->_predicate;
  predicateForPreviousState = self->_predicateForPreviousState;
  uint64_t v8 = [(NSSet *)self->_keyPaths description];
  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1EDDD9B38];
  id v10 = [v3 stringWithFormat:@"%@: %@ / %@ | Keypaths: %@:", v5, predicate, predicateForPreviousState, v9];

  return v10;
}

- (BOOL)evaluateOnEveryKeyPathUpdate
{
  return self->_evaluateOnEveryKeyPathUpdate;
}

- (NSOrderedSet)timeBasedPredicateEvaluationIntervals
{
  return self->_timeBasedPredicateEvaluationIntervals;
}

- (NSSet)circularLocationRegions
{
  return self->_circularLocationRegions;
}

- (void)evaluateWithObject:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EC9B000, v0, v1, "Invalid predicate: %@", v2, v3, v4, v5, v6);
}

- (void)evaluateWithState:(void *)a1 previousValue:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "compoundPredicateType"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18EC9B000, v2, v3, "Unexpected NSCompoundPredicateType %@", v4, v5, v6, v7, v8);
}

- (void)evaluateWithState:(void *)a1 previousValue:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "compoundPredicateType"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18EC9B000, v2, v3, "Unexpected NSCompoundPredicateType after already checking (%@)", v4, v5, v6, v7, v8);
}

- (void)evaluateWithState:previousValue:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_18EC9B000, v1, OS_LOG_TYPE_FAULT, "Invalid compound predicate combination snuck through: %@ / %@.", v2, 0x16u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EC9B000, v0, v1, "Client provided invalid _CDContextualPredicate previousPredicate %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EC9B000, v0, v1, "Client provided invalid _CDContextualPredicate predicate %@", v2, v3, v4, v5, v6);
}

@end