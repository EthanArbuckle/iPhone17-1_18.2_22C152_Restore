@interface HDHRSDataCollectionScrubber
+ (id)scrubberForResource:(id)a3 redactor:(id)a4 rules:(id)a5 error:(id *)a6;
- (id)_ruleNodeForKeyPath:(id)a3;
- (id)generateRedactedResource;
- (int64_t)visitor:(id)a3 didVisitArray:(id)a4;
- (int64_t)visitor:(id)a3 didVisitDictionary:(id)a4;
- (int64_t)visitor:(id)a3 visitPrimitive:(id)a4;
- (int64_t)visitor:(id)a3 willVisitArray:(id)a4;
- (int64_t)visitor:(id)a3 willVisitDictionary:(id)a4;
- (unint64_t)_redactorOptionsForRule:(id)a3;
- (void)_addObjectToTopObject:(id)a3 key:(id)a4;
@end

@implementation HDHRSDataCollectionScrubber

+ (id)scrubberForResource:(id)a3 redactor:(id)a4 rules:(id)a5 error:(id *)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = (id *)objc_alloc_init((Class)a1);
  v15 = [MEMORY[0x263F0A468] visitorWithJSONObject:v13 delegate:v14 error:a6];

  if (v15)
  {
    objc_storeStrong(v14 + 1, v15);
    objc_storeStrong(v14 + 2, a4);
    objc_storeStrong(v14 + 3, a5);
    v16 = v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)generateRedactedResource
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  objectStack = self->_objectStack;
  self->_objectStack = v3;

  [(HKJSONVisitor *)self->_visitor traverseJSONObject];
  id redactedResource = self->_redactedResource;
  return redactedResource;
}

- (void)_addObjectToTopObject:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  v8 = [(NSMutableArray *)self->_objectStack lastObject];
  if (!v8) {
    objc_storeStrong(&self->_redactedResource, a3);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setValue:v9 forKey:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 addObject:v9];
    }
  }
}

- (unint64_t)_redactorOptionsForRule:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"RedactionSkipNumbers"])
    {
      unint64_t v5 = 42;
    }
    else if ([v4 isEqualToString:@"RedactionSkipLinks"])
    {
      unint64_t v5 = 16;
    }
    else if ([v4 isEqualToString:@"RedactionPolicyCodingSystemURI"])
    {
      unint64_t v5 = 24;
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_ruleNodeForKeyPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSDictionary *)self->_rules valueForKeyPath:v4];

  return v5;
}

- (int64_t)visitor:(id)a3 visitPrimitive:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 currentKeyPath];
  id v9 = [(HDHRSDataCollectionScrubber *)self _ruleNodeForKeyPath:v8];

  if (v9)
  {
    rules = self->_rules;
    id v11 = [v6 currentKeyPath];
    id v22 = 0;
    id v12 = [(NSDictionary *)rules hk_safeStringForKeyPath:v11 error:&v22];
    id v13 = v22;

    if (v12)
    {
      if ([v12 isEqualToString:@"RedactionNone"])
      {
        id v14 = [v6 lastKeyPathComponent];
        [(HDHRSDataCollectionScrubber *)self _addObjectToTopObject:v7 key:v14];
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        -[HDHRSDataCollectionScrubber visitor:visitPrimitive:]((uint64_t)self, (uint64_t)v13, v15);
      }
    }
    id v14 = v7;
    unint64_t v16 = [(HDHRSDataCollectionScrubber *)self _redactorOptionsForRule:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [(HKPIIRedactor *)self->_redactor redactedStringWithString:v14 options:v16];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
        goto LABEL_13;
      }
      redactor = self->_redactor;
      v19 = [v14 stringValue];
      uint64_t v17 = [(HKPIIRedactor *)redactor redactedStringWithString:v19 options:v16];
    }
    id v14 = (id)v17;
LABEL_13:
    v20 = [v6 lastKeyPathComponent];
    [(HDHRSDataCollectionScrubber *)self _addObjectToTopObject:v14 key:v20];

    goto LABEL_14;
  }
LABEL_15:

  return 1;
}

- (int64_t)visitor:(id)a3 willVisitDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [v5 currentKeyPath];
  if (![v6 length])
  {

    goto LABEL_5;
  }
  id v7 = [v5 currentKeyPath];
  v8 = [(HDHRSDataCollectionScrubber *)self _ruleNodeForKeyPath:v7];

  if (v8)
  {
LABEL_5:
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v11 = [v5 lastKeyPathComponent];
    [(HDHRSDataCollectionScrubber *)self _addObjectToTopObject:v10 key:v11];

    [(NSMutableArray *)self->_objectStack addObject:v10];
    int64_t v9 = 1;
    goto LABEL_6;
  }
  int64_t v9 = 2;
LABEL_6:

  return v9;
}

- (int64_t)visitor:(id)a3 didVisitDictionary:(id)a4
{
  return 1;
}

- (int64_t)visitor:(id)a3 willVisitArray:(id)a4
{
  id v5 = a3;
  id v6 = [v5 currentKeyPath];
  if (![v6 length])
  {

    goto LABEL_5;
  }
  id v7 = [v5 currentKeyPath];
  v8 = [(HDHRSDataCollectionScrubber *)self _ruleNodeForKeyPath:v7];

  if (v8)
  {
LABEL_5:
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v11 = [v5 lastKeyPathComponent];
    [(HDHRSDataCollectionScrubber *)self _addObjectToTopObject:v10 key:v11];

    [(NSMutableArray *)self->_objectStack addObject:v10];
    int64_t v9 = 1;
    goto LABEL_6;
  }
  int64_t v9 = 2;
LABEL_6:

  return v9;
}

- (int64_t)visitor:(id)a3 didVisitArray:(id)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_redactedResource, 0);
  objc_storeStrong((id *)&self->_objectStack, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_redactor, 0);
  objc_storeStrong((id *)&self->_visitor, 0);
}

- (void)_ruleNodeForKeyPath:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_232E63000, a2, a3, "Exception caught when looking up redaction rule for key path %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)visitor:(NSObject *)a3 visitPrimitive:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_232E63000, a2, a3, "%{public}@: rule of unexpected type: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end