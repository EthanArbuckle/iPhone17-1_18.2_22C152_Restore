@interface _DKEventStatsCounterInternal
- (id)initWithCollectionName:(void *)a3 eventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:(char)a6 hasResult:(int)a7 scalar:;
- (uint64_t)incrementCountByNumber:(void *)a3 typeValue:(unsigned int)a4 success:;
- (uint64_t)indexOfTypeValue:(unsigned int)a3 success:;
- (void)dealloc;
@end

@implementation _DKEventStatsCounterInternal

- (id)initWithCollectionName:(void *)a3 eventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:(char)a6 hasResult:(int)a7 scalar:
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (!a1) {
    goto LABEL_24;
  }
  v37.receiver = a1;
  v37.super_class = (Class)_DKEventStatsCounterInternal;
  v17 = (id *)objc_msgSendSuper2(&v37, sel_init);
  a1 = v17;
  if (!v17) {
    goto LABEL_23;
  }
  *((_DWORD *)v17 + 2) = 0;
  objc_storeStrong(v17 + 4, a3);
  objc_storeStrong(a1 + 5, a4);
  objc_storeStrong(a1 + 6, a5);
  BOOL v18 = 0;
  if (v15 && v16) {
    BOOL v18 = [v16 count] != 0;
  }
  *((unsigned char *)a1 + 12) = v18;
  *((unsigned char *)a1 + 13) = a6;
  uint64_t v19 = [NSString stringWithFormat:@"com.apple.coreduet.%@.%@", v13, v14];
  id v20 = a1[7];
  a1[7] = (id)v19;

  uint64_t v21 = *((unsigned char *)a1 + 12) ? [v16 count] : 1;
  size_t v22 = v21 << a6;
  a1[2] = (id)v22;
  v23 = malloc_type_calloc(v22, 8uLL, 0x100004000313F17uLL);
  a1[3] = v23;
  if (!v23)
  {
LABEL_24:
    v31 = 0;
    goto LABEL_25;
  }
  if (getPETEventPropertyClass() && getPETScalarEventTrackerClass() && getPETDistributionEventTrackerClass())
  {
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      v24 = objc_opt_new();
      if (*((unsigned char *)a1 + 12))
      {
        uint64_t v25 = [getPETEventPropertyClass() propertyWithName:v15 possibleValues:v16];
        if (!v25)
        {
          v35 = a1;
          goto LABEL_30;
        }
        v26 = (void *)v25;
        [v24 addObject:v25];
      }
      if (!*((unsigned char *)a1 + 13))
      {
LABEL_20:
        if (a7) {
          PETScalarEventTrackerClass = (objc_class *)getPETScalarEventTrackerClass();
        }
        else {
          PETScalarEventTrackerClass = (objc_class *)getPETDistributionEventTrackerClass();
        }
        uint64_t v33 = [[PETScalarEventTrackerClass alloc] initWithFeatureId:v13 event:v14 registerProperties:v24];
        id v34 = a1[8];
        a1[8] = (id)v33;

        goto LABEL_23;
      }
      v38[0] = @"true";
      v38[1] = @"false";
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      uint64_t v28 = [getPETEventPropertyClass() propertyWithName:@"success" possibleValues:v27];
      if (v28)
      {
        v29 = (void *)v28;
        [v24 addObject:v28];

        goto LABEL_20;
      }
      v36 = a1;

LABEL_30:
      v31 = a1;
      goto LABEL_25;
    }
  }
  else
  {
    _DKEventStatsLogExternally = 1;
  }
LABEL_23:
  a1 = a1;
  v31 = a1;
LABEL_25:

  return v31;
}

- (void)dealloc
{
  counters = self->_counters;
  if (counters)
  {
    free(counters);
    self->_counters = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKEventStatsCounterInternal;
  [(_DKEventStatsCounterInternal *)&v4 dealloc];
}

- (uint64_t)indexOfTypeValue:(unsigned int)a3 success:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 12) == (v5 != 0))
    {
      if (!v5)
      {
        if (*(unsigned char *)(a1 + 13)) {
          unint64_t v9 = a3;
        }
        else {
          unint64_t v9 = 0;
        }
        if (*(unsigned char *)(a1 + 13)) {
          unint64_t v8 = v9;
        }
        else {
          unint64_t v8 = -1;
        }
        goto LABEL_21;
      }
      uint64_t v7 = [*(id *)(a1 + 48) indexOfObject:v5];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v8 = v7;
        if (*(unsigned char *)(a1 + 13))
        {
          uint64_t v10 = [*(id *)(a1 + 48) count];
          if (a3) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v11 = 0;
          }
          v8 += v11;
        }
        goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[_DKEventStatsCounterInternal indexOfTypeValue:success:]((uint64_t)v6);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      -[_DKEventStatsCounterInternal indexOfTypeValue:success:]((unsigned char *)(a1 + 12));
    }
    unint64_t v8 = -1;
LABEL_21:
    if (v8 >= *(void *)(a1 + 16)) {
      a1 = -1;
    }
    else {
      a1 = v8;
    }
  }

  return a1;
}

- (uint64_t)incrementCountByNumber:(void *)a3 typeValue:(unsigned int)a4 success:
{
  uint64_t v7 = a3;
  uint64_t v8 = v7;
  if (a1)
  {
    uint64_t v11 = v7;
    uint64_t v7 = -[_DKEventStatsCounterInternal indexOfTypeValue:success:](a1, (void *)v7, a4);
    uint64_t v8 = v11;
    if (v7 >= 1)
    {
      uint64_t v9 = v7;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      *(void *)(*(void *)(a1 + 24) + 8 * v9) += a2;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      uint64_t v8 = v11;
    }
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_typeValues, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

- (void)indexOfTypeValue:(uint64_t)a1 success:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[_DKEventStatsCounterInternal indexOfTypeValue:success:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Skipping %s due to unrecognized type parameter: %@", (uint8_t *)&v1, 0x16u);
}

- (void)indexOfTypeValue:(unsigned char *)a1 success:.cold.2(unsigned char *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v1 = @"missing";
  if (!*a1) {
    int v1 = @"unexpected";
  }
  int v2 = 136315394;
  __int16 v3 = "-[_DKEventStatsCounterInternal indexOfTypeValue:success:]";
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Skipping %s due to %@ type parameter", (uint8_t *)&v2, 0x16u);
}

@end