@interface _HKGraphViewAxisAnnotationHandler
- (BOOL)clearedPreviousAnnotations;
- (NSMapTable)seriesToAnnotations;
- (_HKGraphViewAxisAnnotationHandler)init;
- (int64_t)applyAnnotationForSeries:(id)a3;
- (void)_forceClearAxisAnnotations;
- (void)addAxisAnnotation:(id)a3 forSeries:(id)a4 modelCoordinate:(id)a5;
- (void)setClearedPreviousAnnotations:(BOOL)a3;
- (void)setSeriesToAnnotations:(id)a3;
- (void)startAnnotationSequence;
@end

@implementation _HKGraphViewAxisAnnotationHandler

- (_HKGraphViewAxisAnnotationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKGraphViewAxisAnnotationHandler;
  v2 = [(_HKGraphViewAxisAnnotationHandler *)&v6 init];
  v3 = v2;
  if (v2)
  {
    seriesToAnnotations = v2->_seriesToAnnotations;
    v2->_seriesToAnnotations = 0;

    v3->_clearedPreviousAnnotations = 0;
  }
  return v3;
}

- (void)startAnnotationSequence
{
  seriesToAnnotations = self->_seriesToAnnotations;
  if (seriesToAnnotations)
  {
    [(_HKGraphViewAxisAnnotationHandler *)self clearAxisAnnotations];
    v4 = self->_seriesToAnnotations;
    LOBYTE(seriesToAnnotations) = 1;
  }
  else
  {
    v4 = 0;
  }
  self->_clearedPreviousAnnotations = (char)seriesToAnnotations;
  self->_seriesToAnnotations = 0;
}

- (void)addAxisAnnotation:(id)a3 forSeries:(id)a4 modelCoordinate:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  seriesToAnnotations = self->_seriesToAnnotations;
  if (!seriesToAnnotations)
  {
    v11 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:5];
    v12 = self->_seriesToAnnotations;
    self->_seriesToAnnotations = v11;

    seriesToAnnotations = self->_seriesToAnnotations;
  }
  id v13 = [(NSMapTable *)seriesToAnnotations objectForKey:v8];
  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMapTable *)self->_seriesToAnnotations setObject:v13 forKey:v8];
  }
  v14 = objc_alloc_init(_HKGraphViewAnnotationEntry);
  [(_HKGraphViewAnnotationEntry *)v14 setAnnotation:v15];
  [(_HKGraphViewAnnotationEntry *)v14 setModelCoordinate:v9];
  [v13 addObject:v14];
}

- (int64_t)applyAnnotationForSeries:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_seriesToAnnotations)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v32 = v4;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v50 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = [*(id *)(*((void *)&v49 + 1) + 8 * i) yAxis];
          if (([v5 containsObject:v10] & 1) == 0) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v7);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v33 = v5;
    uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v33);
          }
          v12 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v14 = obj;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v42;
            do
            {
              for (uint64_t k = 0; k != v16; ++k)
              {
                if (*(void *)v42 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v41 + 1) + 8 * k);
                v20 = [v19 yAxis];

                if (v20 == v12)
                {
                  v21 = [(NSMapTable *)self->_seriesToAnnotations objectForKey:v19];
                  [v13 addObjectsFromArray:v21];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v16);
          }

          [v12 clearAnnotations];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v22 = v13;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v53 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v38;
            do
            {
              for (uint64_t m = 0; m != v24; ++m)
              {
                if (*(void *)v38 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = *(void **)(*((void *)&v37 + 1) + 8 * m);
                v28 = [v27 annotation];
                v29 = [v27 modelCoordinate];
                [v12 addAxisAnnotation:v28 modelCoordinate:v29];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v53 count:16];
            }
            while (v24);
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v35);
    }

    int64_t v30 = 1;
    id v4 = v32;
  }
  else
  {
    int64_t v30 = 2 * self->_clearedPreviousAnnotations;
  }

  return v30;
}

- (void)_forceClearAxisAnnotations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  seriesToAnnotations = self->_seriesToAnnotations;
  if (seriesToAnnotations)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = seriesToAnnotations;
    uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "yAxis", (void)v9);
          [v8 clearAnnotations];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (NSMapTable)seriesToAnnotations
{
  return self->_seriesToAnnotations;
}

- (void)setSeriesToAnnotations:(id)a3
{
}

- (BOOL)clearedPreviousAnnotations
{
  return self->_clearedPreviousAnnotations;
}

- (void)setClearedPreviousAnnotations:(BOOL)a3
{
  self->_clearedPreviousAnnotations = a3;
}

- (void).cxx_destruct
{
}

@end