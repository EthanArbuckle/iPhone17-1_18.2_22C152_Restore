@interface HDDataEntityInsertionContext
- (BOOL)resolveAssociations;
- (BOOL)skipInsertionFilter;
- (HDDataEntityInsertionContext)initWithProvenance:(id)a3 creationDate:(double)a4 skipInsertionFilter:(BOOL)a5 resolveAssociations:(BOOL)a6 profile:(id)a7;
- (HDDataOriginProvenance)provenance;
- (double)creationDate;
- (void)prepareObjectForInsertion:(id)a3;
@end

@implementation HDDataEntityInsertionContext

- (HDDataEntityInsertionContext)initWithProvenance:(id)a3 creationDate:(double)a4 skipInsertionFilter:(BOOL)a5 resolveAssociations:(BOOL)a6 profile:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDDataEntityInsertionContext;
  v15 = [(HDDataEntityInsertionContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_provenance, a3);
    v16->_creationDate = a4;
    v16->_skipInsertionFilter = a5;
    v16->_resolveAssociations = a6;
    objc_storeStrong((id *)&v16->_profile, a7);
    v16->_defaultCreationDate = CFAbsoluteTimeGetCurrent();
  }

  return v16;
}

- (void)prepareObjectForInsertion:(id)a3
{
  id v10 = a3;
  v4 = [(HDDataOriginProvenance *)self->_provenance sourceID];
  v5 = [v10 sourceRevision];
  v6 = [v5 source];
  [v6 _setSourceID:v4];

  double creationDate = self->_creationDate;
  if (creationDate == 2.22507386e-308)
  {
    [v10 _creationTimestamp];
    v8 = v10;
    if (v9 != 2.22507386e-308) {
      goto LABEL_5;
    }
    double creationDate = self->_defaultCreationDate;
  }
  [v10 _setCreationTimestamp:creationDate];
  v8 = v10;
LABEL_5:
}

- (HDDataOriginProvenance)provenance
{
  return self->_provenance;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (BOOL)skipInsertionFilter
{
  return self->_skipInsertionFilter;
}

- (BOOL)resolveAssociations
{
  return self->_resolveAssociations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end