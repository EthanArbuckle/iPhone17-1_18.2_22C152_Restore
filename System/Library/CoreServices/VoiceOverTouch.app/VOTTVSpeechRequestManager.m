@interface VOTTVSpeechRequestManager
- (BOOL)updateHeadersAndElementsWithTarget:(id)a3 ignoreLastUpdate:(BOOL)a4;
- (NSArray)requestElements;
- (NSArray)requestHeaders;
- (id)description;
- (id)generateOutputRequest:(BOOL *)a3;
- (void)reset;
- (void)resetElements;
- (void)resetHeaders;
- (void)setRequestElements:(id)a3;
- (void)setRequestHeaders:(id)a3;
- (void)transferAllFrom:(id)a3;
- (void)transferElementsFrom:(id)a3;
- (void)transferHeadersFrom:(id)a3;
@end

@implementation VOTTVSpeechRequestManager

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"VOTTVSpeechRequestManager<%p>. Headers:", self];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(VOTTVSpeechRequestManager *)self requestHeaders];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"Elements:\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = [(VOTTVSpeechRequestManager *)self requestElements];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v15 + 1) + 8 * (void)j)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  return v3;
}

- (BOOL)updateHeadersAndElementsWithTarget:(id)a3 ignoreLastUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSMutableOrderedSet orderedSet];
  v69 = +[NSMutableOrderedSet orderedSet];
  if (([v6 isAccessibleElement] & 1) == 0)
  {
    v8 = [v6 accessibleDescendants];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v87;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v87 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          [v69 addTVElement:v13];
          v14 = [v13 headerElements];
          [v7 addTVElements:v14];

          long long v15 = [v13 touchContainer];
          [v7 addTVElement:v15];
        }
        id v10 = [v8 countByEnumeratingWithState:&v86 objects:v94 count:16];
      }
      while (v10);
    }
  }
  if (![v69 count])
  {
    [v69 addTVElement:v6];
    long long v16 = [v6 headerElements];
    [v7 addTVElements:v16];

    long long v17 = [v6 touchContainer];
    [v7 addTVElement:v17];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  if (v18 - self->_lastFocusRequestTime < 1.0)
  {
    long long v19 = [v69 array];
    long long v20 = [(VOTTVSpeechRequestManager *)self requestElements];
    if ([v19 isEqualToArray:v20])
    {
      long long v21 = [v7 array];
      long long v22 = [(VOTTVSpeechRequestManager *)self requestHeaders];
      unsigned __int8 v23 = [v21 isEqualToArray:v22];

      if (v23)
      {
        BOOL v24 = 0;
        goto LABEL_62;
      }
    }
    else
    {
    }
  }
  if (v4)
  {
    v25 = [v69 array];
    [(VOTTVSpeechRequestManager *)self setRequestElements:v25];

    v26 = [v7 array];
    [(VOTTVSpeechRequestManager *)self setRequestHeaders:v26];
  }
  else
  {
    id v64 = v6;
    v65 = v7;
    v27 = +[NSMutableArray array];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v28 = v69;
    id v29 = [v28 countByEnumeratingWithState:&v82 objects:v93 count:16];
    v68 = v27;
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v83;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v83 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v82 + 1) + 8 * (void)j);
          v34 = [(VOTTVSpeechRequestManager *)self requestElements];
          unsigned int v35 = [v34 containsObject:v33];

          if (v35)
          {
            v36 = [(VOTTVSpeechRequestManager *)self requestElements];
            v37 = [v36 originalElementforElement:v33];

            v38 = [v37 snapshot];
            [v37 updateCache];
            objc_msgSend(v37, "setAspectMask:", objc_msgSend(v37, "differenceAspectMask:", v38));
            [v27 addObject:v37];
          }
          else
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v39 = [(VOTTVSpeechRequestManager *)self requestElements];
            id v40 = [v39 countByEnumeratingWithState:&v78 objects:v92 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v79;
              while (2)
              {
                for (k = 0; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v79 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  if (![*(id *)(*((void *)&v78 + 1) + 8 * (void)k) differenceAspectMask:v33])
                  {
                    [v33 setAspectMask:0];
                    goto LABEL_36;
                  }
                }
                id v41 = [v39 countByEnumeratingWithState:&v78 objects:v92 count:16];
                if (v41) {
                  continue;
                }
                break;
              }
            }
LABEL_36:

            v27 = v68;
            [v68 addObject:v33];
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v82 objects:v93 count:16];
      }
      while (v30);
    }

    v44 = +[NSMutableArray array];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v45 = v65;
    id v46 = [v45 countByEnumeratingWithState:&v74 objects:v91 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v75;
      uint64_t v66 = *(void *)v75;
      id v67 = v45;
      do
      {
        for (m = 0; m != v47; m = (char *)m + 1)
        {
          if (*(void *)v75 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v74 + 1) + 8 * (void)m);
          if (([v28 containsObject:v50] & 1) == 0)
          {
            v51 = [(VOTTVSpeechRequestManager *)self requestHeaders];
            unsigned int v52 = [v51 containsObject:v50];

            if (v52)
            {
              v53 = [(VOTTVSpeechRequestManager *)self requestHeaders];
              v54 = [v53 originalElementforElement:v50];

              v55 = [v54 snapshot];
              [v54 updateCache];
              objc_msgSend(v54, "setAspectMask:", objc_msgSend(v54, "differenceAspectMask:", v55));
              [v44 addObject:v54];
            }
            else
            {
              id v56 = v28;
              v57 = v44;
              long long v72 = 0u;
              long long v73 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              v58 = [(VOTTVSpeechRequestManager *)self requestHeaders];
              id v59 = [v58 countByEnumeratingWithState:&v70 objects:v90 count:16];
              if (v59)
              {
                id v60 = v59;
                uint64_t v61 = *(void *)v71;
                while (2)
                {
                  for (n = 0; n != v60; n = (char *)n + 1)
                  {
                    if (*(void *)v71 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    if (![*(id *)(*((void *)&v70 + 1) + 8 * (void)n) differenceAspectMask:v50])
                    {
                      [v50 setAspectMask:0];
                      goto LABEL_57;
                    }
                  }
                  id v60 = [v58 countByEnumeratingWithState:&v70 objects:v90 count:16];
                  if (v60) {
                    continue;
                  }
                  break;
                }
              }
LABEL_57:

              v44 = v57;
              [v57 addObject:v50];
              id v28 = v56;
              uint64_t v48 = v66;
              id v45 = v67;
            }
          }
        }
        id v47 = [v45 countByEnumeratingWithState:&v74 objects:v91 count:16];
      }
      while (v47);
    }

    v26 = v68;
    [(VOTTVSpeechRequestManager *)self setRequestElements:v68];
    [(VOTTVSpeechRequestManager *)self setRequestHeaders:v44];

    id v6 = v64;
    uint64_t v7 = v65;
  }

  BOOL v24 = 1;
LABEL_62:

  return v24;
}

- (id)generateOutputRequest:(BOOL *)a3
{
  id v5 = objc_alloc_init(VOTOutputRequest);
  [(VOTOutputRequest *)v5 setGeneratesBraille:1];
  [(VOTOutputRequest *)v5 setBrailleType:1];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [(VOTTVSpeechRequestManager *)self requestHeaders];
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [(VOTOutputRequest *)v5 addTVElement:*(void *)(*((void *)&v25 + 1) + 8 * i) servesAsHeader:1 filterWithAspectMask:1];
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(VOTOutputRequest *)v5 outputActions];
  id v12 = [v11 count];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = [(VOTTVSpeechRequestManager *)self requestElements];
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        [(VOTOutputRequest *)v5 addTVElement:*(void *)(*((void *)&v21 + 1) + 8 * (void)j) servesAsHeader:0 filterWithAspectMask:1];
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  double v18 = [(VOTOutputRequest *)v5 outputActions];
  id v19 = [v18 count];

  if (a3) {
    *a3 = v19 != v12;
  }

  return v5;
}

- (void)reset
{
  [(VOTTVSpeechRequestManager *)self resetElements];

  [(VOTTVSpeechRequestManager *)self resetHeaders];
}

- (void)resetElements
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(VOTTVSpeechRequestManager *)self requestElements];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resetAspectMask];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(VOTTVSpeechRequestManager *)self setRequestElements:0];
}

- (void)resetHeaders
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(VOTTVSpeechRequestManager *)self requestHeaders];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resetAspectMask];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(VOTTVSpeechRequestManager *)self setRequestHeaders:0];
}

- (void)transferHeadersFrom:(id)a3
{
  id v4 = [a3 requestHeaders];
  [(VOTTVSpeechRequestManager *)self setRequestHeaders:v4];
}

- (void)transferElementsFrom:(id)a3
{
  id v4 = [a3 requestElements];
  [(VOTTVSpeechRequestManager *)self setRequestElements:v4];
}

- (void)transferAllFrom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestHeaders];
  [(VOTTVSpeechRequestManager *)self setRequestHeaders:v5];

  id v6 = [v4 requestElements];

  [(VOTTVSpeechRequestManager *)self setRequestElements:v6];
}

- (NSArray)requestElements
{
  return self->_requestElements;
}

- (void)setRequestElements:(id)a3
{
}

- (NSArray)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeaders, 0);

  objc_storeStrong((id *)&self->_requestElements, 0);
}

@end