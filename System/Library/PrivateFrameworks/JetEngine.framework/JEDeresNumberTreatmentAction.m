@interface JEDeresNumberTreatmentAction
- (JEDeresNumberTreatmentAction)initWithField:(id)a3 configuration:(id)a4;
- (id)performAction:(id)a3 context:(id)a4;
@end

@implementation JEDeresNumberTreatmentAction

- (void).cxx_destruct
{
}

- (JEDeresNumberTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)JEDeresNumberTreatmentAction;
  v7 = [(JETreatmentAction *)&v28 initWithField:a3 configuration:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"precision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    [v9 doubleValue];
    v7->_precision = v10;
    v11 = [v6 objectForKeyedSubscript:@"buckets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    v15 = v13;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = objc_msgSend(v19, "objectForKeyedSubscript:", @"start", (void)v24);

            if (v20) {
              continue;
            }
          }

          v15 = 0;
          goto LABEL_19;
        }
        uint64_t v16 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      v15 = v13;
    }
LABEL_19:

    uint64_t v21 = [v15 sortedArrayUsingComparator:&__block_literal_global_1];
    buckets = v7->_buckets;
    v7->_buckets = (NSArray *)v21;
  }
  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)JEDeresNumberTreatmentAction;
  v5 = [(JETreatmentAction *)&v22 performAction:a3 context:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
LABEL_21:
    uint64_t v14 = 0;
    goto LABEL_24;
  }
  if (self) {
    buckets = self->_buckets;
  }
  else {
    buckets = 0;
  }
  if (![(NSArray *)buckets count])
  {
    if (self && self->_precision > 0.0)
    {
      [v6 doubleValue];
      uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_precision * floor(v20 / self->_precision)];
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (self) {
    v8 = self->_buckets;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  v23 = @"start";
  v24[0] = v6;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  if (self) {
    v11 = self->_buckets;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, [(NSArray *)v12 count], 1536, &__block_literal_global_1);

  uint64_t v14 = 0;
  if (v13 && v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self) {
      v15 = self->_buckets;
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = [(NSArray *)v15 objectAtIndexedSubscript:v13 - 1];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"value"];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [v16 objectForKeyedSubscript:@"start"];
    }
    uint64_t v14 = v19;
  }
LABEL_24:

  return v14;
}

@end