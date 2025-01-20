@interface PKDataDetectorQuery
- (PKDataDetectorQuery)initWithRecognitionSessionManager:(id)a3;
- (void)queryDidUpdateResult:(id)a3;
@end

@implementation PKDataDetectorQuery

- (PKDataDetectorQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDataDetectorQuery;
  v5 = [(PKQuery *)&v11 initWithRecognitionSessionManager:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F5C038]);
    v7 = -[PKRecognitionSessionManager session](v4);
    v8 = (void *)[v6 initWithRecognitionSession:v7];
    [(PKDetectionQuery *)v5 setQuery:v8];

    v9 = [(PKDetectionQuery *)v5 query];
    [v9 setDelegate:v5];
  }
  return v5;
}

- (void)queryDidUpdateResult:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 foundItems];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__12;
    v44 = __Block_byref_object_dispose__12;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __FilteredFoundItems_block_invoke;
    v39[3] = &unk_1E64C7D58;
    v39[4] = &v40;
    [v5 enumerateObjectsUsingBlock:v39];
    id DDDetectionControllerClass = getDDDetectionControllerClass();
    uint64_t v7 = v41[5];
    uint64_t v8 = [getDDDetectionControllerClass() allPublicTypes];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    objc_super v11 = [DDDetectionControllerClass filterResults:v7 forTypes:v8 referenceDate:v9 referenceTimeZone:v10];

    unint64_t v12 = [v11 count];
    if (v12 >= [(id)v41[5] count])
    {
      id v13 = v5;
    }
    else
    {
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__12;
      v37 = __Block_byref_object_dispose__12;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __FilteredFoundItems_block_invoke_2;
      v30[3] = &unk_1E64C7D80;
      id v31 = v11;
      v32 = &v33;
      [v5 enumerateObjectsUsingBlock:v30];
      id v13 = (id)v34[5];

      _Block_object_dispose(&v33, 8);
    }

    _Block_object_dispose(&v40, 8);
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v27;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * v18);
          v20 = [PKDataDetectorQueryItem alloc];
          v21 = -[PKDataDetectorQueryItem initWithCoreHandwritingDataDetectorQueryItem:](v20, "initWithCoreHandwritingDataDetectorQueryItem:", v19, (void)v26);
          [v14 addObject:v21];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v46 count:16];
      }
      while (v16);
    }

    v22 = [(PKQuery *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [(PKQuery *)self delegate];
      v25 = (void *)[v14 copy];
      [v24 dataDetectorQuery:self foundItems:v25];
    }
  }
}

@end