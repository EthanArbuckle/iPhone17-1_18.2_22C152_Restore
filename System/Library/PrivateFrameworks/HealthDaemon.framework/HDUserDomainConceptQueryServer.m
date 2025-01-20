@interface HDUserDomainConceptQueryServer
+ (Class)queryClass;
- (HDUserDomainConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDUserDomainConceptQueryServer

- (HDUserDomainConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDUserDomainConceptQueryServer;
  v11 = [(HDQueryServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v11->_limit = [v10 limit];
    uint64_t v12 = [v10 sortDescriptors];
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

    uint64_t v14 = [v10 anchor];
    anchor = v11->_anchor;
    v11->_anchor = (HKQueryAnchor *)v14;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)HDUserDomainConceptQueryServer;
  [(HDQueryServer *)&v30 _queue_start];
  v3 = [(HDQueryServer *)self queryUUID];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [(HDQueryServer *)self profile];
  v6 = [v5 userDomainConceptManager];

  v7 = [(HDQueryServer *)self filter];
  v8 = [(HDQueryServer *)self profile];
  v9 = [v7 predicateWithProfile:v8];

  anchor = self->_anchor;
  if (anchor)
  {
    v11 = (void *)MEMORY[0x1E4F65D58];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HKQueryAnchor _rowid](anchor, "_rowid"));
    v13 = HDUserDomainConceptEntityPredicateForConceptsWithAnchorAfter((uint64_t)v12);
    uint64_t v14 = [v11 compoundPredicateWithPredicate:v9 otherPredicate:v13];

    v9 = (void *)v14;
  }
  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors)
  {
    id v29 = 0;
    uint64_t v16 = [v6 orderingTermsForSortDescriptors:sortDescriptors error:&v29];
    id v17 = v29;
    v18 = v17;
    if (!v16)
    {
      objc_msgSend(v4, "client_deliverError:forQuery:", v17, v3);
      goto LABEL_14;
    }

    v18 = (void *)v16;
  }
  else
  {
    v18 = 0;
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t limit = self->_limit;
  id v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__HDUserDomainConceptQueryServer__queue_start__block_invoke;
  v26[3] = &unk_1E62F63B8;
  id v21 = v19;
  id v27 = v21;
  int v22 = [v6 enumerateUserDomainConceptsWithPredicate:v9 limit:limit orderingTerms:v18 error:&v28 enumerationHandler:v26];
  id v23 = v28;
  if (v22)
  {
    objc_msgSend(v4, "client_deliverResults:queryUUID:", v21, v3);
  }
  else
  {
    _HKInitializeLogging();
    v24 = HKLogHealthOntology();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      __int16 v33 = 2114;
      v34 = self;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Error while fetching concepts: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v4, "client_deliverError:forQuery:", v23, v3);
  }

LABEL_14:
}

uint64_t __46__HDUserDomainConceptQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E4F2B678];
  id v6 = a2;
  v7 = (void *)[[v5 alloc] initWithUserConcept:v6 rawAnchor:a3];

  [v4 addObject:v7];
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end