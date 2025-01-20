@interface PerDocumentObjects
- (NSMutableArray)phrases;
- (NSMutableArray)secondary;
- (NSMutableArray)terms;
- (PerDocumentObjects)init;
- (unint64_t)primaryCount;
- (unint64_t)queryFingerprintWithPrimaryOut:(unint64_t *)a3;
- (void)seal;
- (void)setPhrases:(id)a3;
- (void)setSecondary:(id)a3;
- (void)setTerms:(id)a3;
@end

@implementation PerDocumentObjects

- (PerDocumentObjects)init
{
  v10.receiver = self;
  v10.super_class = (Class)PerDocumentObjects;
  v2 = [(PerDocumentObjects *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    phrases = v2->_phrases;
    v2->_phrases = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    terms = v2->_terms;
    v2->_terms = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    secondary = v2->_secondary;
    v2->_secondary = (NSMutableArray *)v7;
  }
  return v2;
}

- (unint64_t)primaryCount
{
  id v3 = [(NSMutableArray *)self->_terms count];
  return (unint64_t)v3 + (void)[(NSMutableArray *)self->_phrases count];
}

- (void)seal
{
  [(NSMutableArray *)self->_terms sortUsingComparator:&stru_10048B8F0];
  [(NSMutableArray *)self->_phrases sortUsingComparator:&stru_10048B8F0];
  secondary = self->_secondary;
  [(NSMutableArray *)secondary sortUsingComparator:&stru_10048B8F0];
}

- (unint64_t)queryFingerprintWithPrimaryOut:(unint64_t *)a3
{
  int64_t v5 = (int64_t)[(NSMutableArray *)self->_phrases count] + 1;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v6 = self->_phrases;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v5 = (int64_t)[*(id *)(*((void *)&v32 + 1) + 8 * (void)v10) hash] + 32 * v5 - v5;
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }

  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_terms count] + v5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v12 = self->_terms;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v11 = (unint64_t)[*(id *)(*((void *)&v28 + 1) + 8 * (void)v16) hash]
            + 32 * v11
            - v11;
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  *a3 = v11;
  unint64_t v17 = (unint64_t)[(NSMutableArray *)self->_secondary count] + v11;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v18 = self->_secondary;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        unint64_t v17 = (unint64_t)objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v22), "hash", (void)v24)
            + 32 * v17
            - v17;
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }

  return v17;
}

- (NSMutableArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
}

- (NSMutableArray)terms
{
  return self->_terms;
}

- (void)setTerms:(id)a3
{
}

- (NSMutableArray)secondary
{
  return self->_secondary;
}

- (void)setSecondary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end