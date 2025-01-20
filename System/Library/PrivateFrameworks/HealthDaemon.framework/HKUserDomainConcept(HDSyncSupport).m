@interface HKUserDomainConcept(HDSyncSupport)
+ (id)createWithCodableConcept:()HDSyncSupport profile:;
- (HDCodableUserDomainConcept)codableRepresentationForSyncWithProfile:()HDSyncSupport;
- (uint64_t)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:;
- (uint64_t)codableSubclassData;
@end

@implementation HKUserDomainConcept(HDSyncSupport)

+ (id)createWithCodableConcept:()HDSyncSupport profile:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 isMemberOfClass:objc_opt_class()])
  {
    v14 = 0;
    goto LABEL_35;
  }
  v8 = (void *)MEMORY[0x1E4F2B690];
  v9 = [v6 identifier];
  v10 = [v8 createWithCodable:v9];

  v11 = [v7 daemon];
  v12 = [v11 userDomainConceptEntityRegistry];
  v13 = (void *)[v12 userDomainConceptEntityClassForTypeIdentifier:v10];

  if (!v13)
  {
    _HKInitializeLogging();
    v25 = HKLogHealthOntology();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%@: No UDC entity class for typeIdentifier '%@', ingoring sync codable", buf, 0x16u);
    }
    v14 = 0;
    goto LABEL_34;
  }
  v14 = objc_msgSend(objc_alloc((Class)objc_msgSend(v13, "userDomainConceptClass")), "_initBareObject");
  v15 = (void *)MEMORY[0x1E4F29128];
  v16 = [v6 uuid];
  v17 = objc_msgSend(v15, "hk_UUIDWithData:", v16);
  [v14 _setUUID:v17];

  [v14 _setIdentifier:v10];
  objc_msgSend(v14, "_setDeleted:", objc_msgSend(v6, "deleted"));
  [v6 creationDate];
  objc_msgSend(v14, "_setCreationTimestamp:");
  [v6 modificationDate];
  objc_msgSend(v14, "_setModificationTimestamp:");
  *(void *)buf = (int)[v6 majorVersion];
  *(void *)&buf[8] = (int)[v6 minorVersion];
  *(void *)&buf[16] = (int)[v6 patchVersion];
  [v14 _setOperatingSystemVersion:buf];
  v18 = [v6 build];
  [v14 _setBuild:v18];

  v19 = [v6 linksData];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v21 = objc_opt_class();
    v22 = [v6 linksData];
    id v55 = 0;
    v23 = [v20 unarchivedObjectOfClass:v21 fromData:v22 error:&v55];
    id v24 = v55;

    if (v23)
    {
      [v14 _setLinkCollection:v23];
    }
    else
    {
      _HKInitializeLogging();
      v26 = HKLogHealthOntology();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_fault_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_FAULT, "%{public}@: Unable to unarchive link collection data: %{public}@", buf, 0x16u);
      }
    }
  }
  v27 = [v14 linkCollection];
  if (v27) {
    goto LABEL_19;
  }
  v28 = [v6 links];

  if (v28)
  {
    _HKInitializeLogging();
    v29 = HKLogHealthOntology();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v6 linksData];
      v31 = HKStringFromBool();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v31;
      _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "XXX received link collection data is nil %@", buf, 0xCu);
    }
    v32 = [v6 links];
    v27 = objc_msgSend(v32, "hk_map:", &__block_literal_global_168);

    v33 = (void *)[objc_alloc(MEMORY[0x1E4F2B648]) _initWithLinks:v27];
    [v14 _setLinkCollection:v33];

LABEL_19:
  }
  v34 = [v6 codings];

  if (v34)
  {
    v35 = [v6 codings];
    v36 = objc_msgSend(v35, "hk_map:", &__block_literal_global_285);

    v37 = (void *)[objc_alloc(MEMORY[0x1E4F2B178]) initWithCodings:v36];
    [v14 _setCodingCollection:v37];
  }
  v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38 = [v6 properties];

  if (v38)
  {
    v39 = [v6 properties];
    v40 = objc_msgSend(v39, "hk_map:", &__block_literal_global_291_2);

    [v25 addObjectsFromArray:v40];
  }
  v41 = [v6 localizedStringProperties];

  if (v41)
  {
    v42 = [v6 localizedStringProperties];
    v43 = objc_msgSend(v42, "hk_map:", &__block_literal_global_295_0);

    [v25 addObjectsFromArray:v43];
  }
  v44 = [v6 ontologyLocalizedEducationContent];

  if (v44)
  {
    v45 = (void *)MEMORY[0x1E4F2B2E8];
    v46 = [v6 ontologyLocalizedEducationContent];
    v47 = [v45 createWithCodable:v46];

    [v25 addObject:v47];
  }
  v48 = [v6 namedQuantities];

  if (v48)
  {
    v49 = [v6 namedQuantities];
    v50 = objc_msgSend(v49, "hk_map:", &__block_literal_global_300);

    [v25 addObjectsFromArray:v50];
  }
  v51 = [v6 typeData];

  if (v51)
  {
    v52 = [v6 typeData];
    [v14 applyCodableSubclassData:v52 mutableUserDomainConceptProperties:v25];
  }
  if ([v25 count])
  {
    v53 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v25];
    [v14 _setPropertyCollection:v53];
  }
LABEL_34:

LABEL_35:

  return v14;
}

- (HDCodableUserDomainConcept)codableRepresentationForSyncWithProfile:()HDSyncSupport
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  v4 = objc_alloc_init(HDCodableUserDomainConcept);
  v5 = [a1 UUID];
  id v6 = objc_msgSend(v5, "hk_dataForUUIDBytes");
  [(HDCodableUserDomainConcept *)v4 setUuid:v6];

  id v7 = [a1 identifier];
  v8 = [v7 codableRepresentationForSync];
  [(HDCodableUserDomainConcept *)v4 setIdentifier:v8];

  -[HDCodableUserDomainConcept setDeleted:](v4, "setDeleted:", [a1 isDeleted]);
  [a1 creationTimestamp];
  -[HDCodableUserDomainConcept setCreationDate:](v4, "setCreationDate:");
  [a1 modificationTimestamp];
  -[HDCodableUserDomainConcept setModificationDate:](v4, "setModificationDate:");
  [a1 operatingSystemVersion];
  [(HDCodableUserDomainConcept *)v4 setMajorVersion:v55];
  [a1 operatingSystemVersion];
  [(HDCodableUserDomainConcept *)v4 setMinorVersion:v54];
  [a1 operatingSystemVersion];
  [(HDCodableUserDomainConcept *)v4 setPatchVersion:v53];
  v9 = [a1 build];
  [(HDCodableUserDomainConcept *)v4 setBuild:v9];

  v10 = [a1 linkCollection];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F28DB0];
    v12 = [a1 linkCollection];
    v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    [(HDCodableUserDomainConcept *)v4 setLinksData:v13];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v14 = [a1 linkCollection];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v49 + 1) + 8 * i) codableRepresentationForSync];
        [(HDCodableUserDomainConcept *)v4 addLinks:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v16);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v20 = [a1 codingCollection];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [*(id *)(*((void *)&v45 + 1) + 8 * j) codableRepresentationForSync];
        [(HDCodableUserDomainConcept *)v4 addCodings:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v22);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v39 = a1;
  v26 = [a1 propertyCollection];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v41 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v32 = [v31 codableRepresentationForSync];
          [(HDCodableUserDomainConcept *)v4 addProperties:v32];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = [v31 codableRepresentationForSync];
            [(HDCodableUserDomainConcept *)v4 addLocalizedStringProperties:v32];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v32 = [v31 codableRepresentationForSync];
              [(HDCodableUserDomainConcept *)v4 setOntologyLocalizedEducationContent:v32];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              v32 = [v31 codableRepresentationForSync];
              [(HDCodableUserDomainConcept *)v4 addNamedQuantities:v32];
            }
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v56 count:16];
    }
    while (v28);
  }

  v33 = [v40 syncIdentityManager];
  v34 = [v33 currentSyncIdentity];

  v35 = [v34 identity];
  v36 = [v35 codableSyncIdentity];
  [(HDCodableUserDomainConcept *)v4 setSyncIdentity:v36];

  if (([v39 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    v37 = [v39 codableSubclassData];
    [(HDCodableUserDomainConcept *)v4 setTypeData:v37];
  }

  return v4;
}

- (uint64_t)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:
{
  objc_opt_class();

  return NSRequestConcreteImplementation();
}

- (uint64_t)codableSubclassData
{
  return 0;
}

@end