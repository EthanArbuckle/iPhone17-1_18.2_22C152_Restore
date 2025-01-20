@interface HDHealthRecordsExtractionRule
+ (id)extractionRuleWithDefinition:(id)a3 error:(id *)a4;
- (HDHealthRecordsExtractionRule)init;
- (HDHealthRecordsExtractionRule)initWithKeyPath:(id)a3 transforms:(id)a4;
- (NSArray)transforms;
- (NSString)keyPath;
- (id)definitionBySubstitutingKeyPathWith:(id)a3;
@end

@implementation HDHealthRecordsExtractionRule

+ (id)extractionRuleWithDefinition:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 length])
  {
    v6 = [v5 componentsSeparatedByString:@"|"];
    v7 = objc_msgSend(v6, "hk_map:", &__block_literal_global_3);

    if ([v7 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            if (!objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "length", (void)v17))
            {
              objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"invalid extraction rule");

              goto LABEL_15;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      v13 = [v8 firstObject];
      v14 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      v15 = [[HDHealthRecordsExtractionRule alloc] initWithKeyPath:v13 transforms:v14];
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"no key path specified");
LABEL_15:
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"empty extraction rule definition");
    v15 = 0;
  }

  return v15;
}

id __68__HDHealthRecordsExtractionRule_extractionRuleWithDefinition_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  v4 = [v2 whitespaceCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (id)definitionBySubstitutingKeyPathWith:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDHealthRecordsExtractionRule.m", 60, @"Invalid parameter not satisfying: %@", @"newKeyPath" object file lineNumber description];
  }
  if ([(NSArray *)self->_transforms count])
  {
    v6 = [(NSArray *)self->_transforms componentsJoinedByString:@" | "];
    id v7 = [v5 stringByAppendingFormat:@" | %@", v6];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (HDHealthRecordsExtractionRule)init
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordsExtractionRule)initWithKeyPath:(id)a3 transforms:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDHealthRecordsExtractionRule.m", 73, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  long long v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HDHealthRecordsExtractionRule.m", 74, @"Invalid parameter not satisfying: %@", @"transforms" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HDHealthRecordsExtractionRule;
  uint64_t v10 = [(HDHealthRecordsExtractionRule *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    transforms = v10->_transforms;
    v10->_transforms = (NSArray *)v13;
  }
  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end