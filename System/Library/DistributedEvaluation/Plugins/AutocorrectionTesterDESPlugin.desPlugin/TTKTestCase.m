@interface TTKTestCase
+ (id)convertToIsolatedWordMode:(id)a3;
- (NSArray)records;
- (NSDictionary)metadata;
- (NSMutableDictionary)annotations;
- (NSString)intendedText;
- (TTKTestCase)initWithDictionary:(id)a3;
- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4;
- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5;
- (id)toJsonDictionary;
@end

@implementation TTKTestCase

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TTKTestCase;
  v12 = [(TTKTestCase *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metadata, a3);
    objc_storeStrong((id *)&v13->_records, a4);
    objc_storeStrong((id *)&v13->_intendedText, a5);
  }

  return v13;
}

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4
{
  return [(TTKTestCase *)self initWithMetadata:a3 records:a4 intendedText:0];
}

- (TTKTestCase)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TTKTestCase;
  v5 = [(TTKTestCase *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v6;

    v8 = [v4 objectForKey:@"records"];
    id v9 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v13);
          objc_super v15 = [TTKTestCaseRecord alloc];
          v16 = -[TTKTestCaseRecord initWithDictionary:](v15, "initWithDictionary:", v14, (void)v22);
          [v9 addObject:v16];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }

    objc_storeStrong((id *)&v5->_records, v9);
    uint64_t v17 = [v4 objectForKey:@"annotations"];
    annotations = v5->_annotations;
    v5->_annotations = (NSMutableDictionary *)v17;

    uint64_t v19 = [v4 objectForKey:@"intended_text"];
    intendedText = v5->_intendedText;
    v5->_intendedText = (NSString *)v19;
  }
  return v5;
}

- (id)toJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:self->_metadata forKeyedSubscript:@"metadata"];
  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_records;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "toJsonDictionary", (void)v13);
        [v4 addObject:v9];
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 setObject:v4 forKeyedSubscript:@"records"];
  annotations = self->_annotations;
  if (annotations) {
    [v3 setObject:annotations forKeyedSubscript:@"annotations"];
  }
  intendedText = self->_intendedText;
  if (intendedText) {
    [v3 setObject:intendedText forKeyedSubscript:@"intended_text"];
  }

  return v3;
}

+ (id)convertToIsolatedWordMode:(id)a3
{
  id v3 = a3;
  v46 = v3;
  id v4 = [v3 intendedText];

  if (v4)
  {
    v49 = +[NSMutableArray array];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v5 = [v3 records];
    id v6 = [v5 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v54 = *(void *)v63;
      id obj = v5;
      while (2)
      {
        v8 = 0;
        id v52 = v6;
        do
        {
          int v9 = v7;
          if (*(void *)v63 != v54) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v8);
          id v11 = [v3 intendedText];
          int v50 = v9;
          uint64_t v12 = v9;
          long long v13 = [v11 substringFromIndex:v9];

          v56 = [v10 primaryIntendedText];
          if (![v56 length]) {
            goto LABEL_31;
          }
          long long v14 = [v13 lowercaseString];
          long long v15 = [v56 lowercaseString];
          int v16 = [v14 rangeOfString:v15];
          int v18 = v17;

          if (v16 >= 1)
          {
            uint64_t v19 = 0;
            while (1)
            {
              v20 = +[NSCharacterSet whitespaceCharacterSet];
              unsigned __int8 v21 = objc_msgSend(v20, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v19));

              if ((v21 & 1) == 0
                && [v13 characterAtIndex:v19] != 46
                && [v13 characterAtIndex:v19] != 42)
              {
                break;
              }
              if (v16 == ++v19) {
                goto LABEL_14;
              }
            }
LABEL_31:
            id v4 = 0;
            goto LABEL_32;
          }
LABEL_14:
          long long v22 = [v46 intendedText];
          long long v23 = objc_msgSend(v22, "substringWithRange:", 0, v12);

          [v49 addObject:v23];
          uint64_t v24 = v16 + v18;
          while (1)
          {
            uint64_t v25 = v24;
            objc_super v26 = [v46 intendedText];
            if ((unint64_t)[v26 length] <= v12 + v25) {
              break;
            }
            BOOL v27 = [v13 characterAtIndex:v25] == 32;

            uint64_t v24 = v25 + 1;
            if (!v27) {
              goto LABEL_19;
            }
          }

LABEL_19:
          v8 = (char *)v8 + 1;
          int v7 = v12 + v25;
          id v3 = v46;
        }
        while (v8 != v52);
        id v6 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        int v7 = v25 + v50;
        v5 = obj;
        if (v6) {
          continue;
        }
        break;
      }
    }

    +[NSMutableArray array];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v47 = [v46 records];
    id v28 = [v47 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v28)
    {
      int v29 = 0;
      uint64_t v53 = *(void *)v59;
      do
      {
        v30 = 0;
        uint64_t v51 = v29;
        id v55 = v28;
        do
        {
          if (*(void *)v59 != v53) {
            objc_enumerationMutation(v47);
          }
          v31 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v30);
          v32 = [v31 touchData];
          BOOL v33 = v32 == 0;

          if (!v33)
          {
            v34 = [TTKTestCaseRecord alloc];
            v57 = [v31 primaryIntendedText];
            v35 = [v31 additionalIntendedTexts];
            v36 = [v31 touchDataCollection];
            v37 = [v31 recordID];
            v38 = [v31 layoutName];
            v39 = [v31 inputText];
            v40 = [v31 transliteration];
            v41 = [v49 objectAtIndex:(char *)v30 + v51];
            v42 = [v31 annotations];
            v43 = [(TTKTestCaseRecord *)v34 initWithIntendedText:v57 additionalIntendedTexts:v35 touchDataCollection:v36 recordID:v37 layoutName:v38 inputText:v39 transliteration:v40 context:v41 annotations:v42];
            [obj addObject:v43];
          }
          v30 = (char *)v30 + 1;
        }
        while (v55 != v30);
        id v28 = [v47 countByEnumeratingWithState:&v58 objects:v66 count:16];
        int v29 = v51 + v30;
      }
      while (v28);
    }

    v44 = [TTKTestCase alloc];
    long long v13 = [v46 metadata];
    v56 = [v46 intendedText];
    id v4 = -[TTKTestCase initWithMetadata:records:intendedText:](v44, "initWithMetadata:records:intendedText:", v13, obj);
LABEL_32:

    id v3 = v46;
  }

  return v4;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSArray)records
{
  return self->_records;
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end