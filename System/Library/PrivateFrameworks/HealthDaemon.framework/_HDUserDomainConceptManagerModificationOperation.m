@interface _HDUserDomainConceptManagerModificationOperation
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)syncVersion;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (NSArray)userDomainConcepts;
- (_HDUserDomainConceptManagerModificationOperation)init;
- (_HDUserDomainConceptManagerModificationOperation)initWithCoder:(id)a3;
- (_HDUserDomainConceptManagerModificationOperation)initWithUserDomainConcepts:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7;
- (int64_t)method;
- (int64_t)syncIdentity;
- (int64_t)syncProvenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDUserDomainConceptManagerModificationOperation

- (_HDUserDomainConceptManagerModificationOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HDUserDomainConceptManagerModificationOperation)initWithUserDomainConcepts:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HDUserDomainConceptManagerModificationOperation;
  v14 = [(_HDUserDomainConceptManagerModificationOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userDomainConcepts, a3);
    v15->_method = a4;
    v15->_syncProvenance = a5;
    v15->_syncIdentity = a6;
    v15->_syncVersion = ($E7BD3517D03D6A5513A4727339E3F206)a7;
  }

  return v15;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 syncIdentityManager];
  v11 = [v10 legacySyncIdentity];
  v12 = [v11 entity];
  uint64_t v13 = [v12 persistentID];

  if (self->_syncIdentity == -1) {
    int64_t syncIdentity = v13;
  }
  else {
    int64_t syncIdentity = self->_syncIdentity;
  }
  v15 = [v9 userDomainConceptManager];

  userDomainConcepts = self->_userDomainConcepts;
  int64_t method = self->_method;
  int64_t syncProvenance = self->_syncProvenance;
  $E7BD3517D03D6A5513A4727339E3F206 syncVersion = self->_syncVersion;
  v20 = userDomainConcepts;
  id v21 = v8;
  if (!v15) {
    goto LABEL_35;
  }
  if ((unint64_t)(method - 1) < 2)
  {
    v22 = v15;
    v23 = a5;
    v60 = v22;
    id WeakRetained = objc_loadWeakRetained(v22 + 8);
    v52 = v20;
    v25 = v20;
    id v26 = WeakRetained;
    id v54 = v21;
    id v27 = v21;
    long long v63 = 0u;
    long long v64 = 0u;
    if (method == 2) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = 2;
    }
    long long v65 = 0uLL;
    long long v66 = 0uLL;
    obuint64_t j = v25;
    uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v64;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v64 != v31) {
            objc_enumerationMutation(obj);
          }
          if (!+[HDUserDomainConceptEntity storeUserDomainConcept:*(void *)(*((void *)&v63 + 1) + 8 * i) method:v28 syncProvenance:syncProvenance syncIdentity:syncIdentity syncVersion:syncVersion profile:v26 transaction:v27 error:v23])
          {
            BOOL v33 = 0;
            goto LABEL_33;
          }
        }
        uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v63 objects:v69 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
    BOOL v33 = 1;
LABEL_33:
    v15 = v60;

    v20 = v52;
    id v21 = v54;
    goto LABEL_40;
  }
  if (method != 3)
  {
    v49 = (void *)MEMORY[0x1E4F28C58];
    v50 = HKStringFromUserDomainConceptStoreMethod();
    objc_msgSend(v49, "hk_assignError:code:format:", a5, 100, @"Unknown user domain concept modification method %@", v50);

LABEL_35:
    BOOL v33 = 0;
    goto LABEL_40;
  }
  v34 = v20;
  id v55 = v21;
  id v59 = v21;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v56 = v34;
  uint64_t v58 = [(NSArray *)v56 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v58)
  {
    v53 = v20;
    uint64_t v57 = *(void *)v64;
    while (2)
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v64 != v57) {
          objc_enumerationMutation(v56);
        }
        id v36 = *(id *)(*((void *)&v63 + 1) + 8 * j);
        id obja = v59;
        v37 = [v15 profile];
        v38 = [v37 daemon];
        v39 = [v38 userDomainConceptEntityRegistry];
        v40 = [v36 identifier];
        v41 = (void *)[v39 userDomainConceptEntityClassForTypeIdentifier:v40];

        if ([v41 supportsHidingSemanticDuplicates])
        {
          v42 = [v41 predicateMatchingSemanticDuplicatesOf:v36];
          v43 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"creation_date" entityClass:objc_opt_class() ascending:0];
          v70[0] = v43;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __129__HDUserDomainConceptManager__enumerateAndDeleteSemanticDuplicatesOfConceptIfSupportsHidingSemanticDuplicates_transaction_error___block_invoke;
          v67[3] = &unk_1E630A8B0;
          v67[4] = v15;
          id v45 = obja;
          id v68 = v45;
          int v46 = [v15 enumerateUserDomainConceptsWithPredicate:v42 enumerationOptions:2 limit:0 orderingTerms:v44 transaction:v45 error:a5 enumerationHandler:v67];

          if (!v46) {
            goto LABEL_36;
          }
        }
        else
        {
        }
        id v47 = objc_loadWeakRetained(v15 + 8);
        BOOL v48 = +[HDUserDomainConceptEntity deleteUserDomainConcept:v36 profile:v47 transaction:obja error:a5];

        if (!v48)
        {
LABEL_36:
          BOOL v33 = 0;
          goto LABEL_37;
        }
      }
      uint64_t v58 = [(NSArray *)v56 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (v58) {
        continue;
      }
      break;
    }
    BOOL v33 = 1;
LABEL_37:
    v20 = v53;
  }
  else
  {
    BOOL v33 = 1;
  }

  id v21 = v55;
LABEL_40:

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = self;
  int64_t method = self->_method;
  id v5 = a3;
  [v5 encodeInteger:method forKey:@"method"];
  [v5 encodeInt64:v3->_syncProvenance forKey:@"sync_provenance"];
  [v5 encodeObject:v3->_userDomainConcepts forKey:@"concepts"];
  [v5 encodeInt64:v3->_syncIdentity forKey:@"sync_identity"];
  v3 = (_HDUserDomainConceptManagerModificationOperation *)((char *)v3 + 32);
  [v5 encodeInt32:LODWORD(v3->super.super.super.isa) forKey:@"sync_version_minimum"];
  [v5 encodeInt32:HIDWORD(v3->super.super.super.isa) forKey:@"sync_version_current"];
}

- (_HDUserDomainConceptManagerModificationOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDUserDomainConceptManagerModificationOperation;
  id v5 = [(_HDUserDomainConceptManagerModificationOperation *)&v11 init];
  if (v5)
  {
    v5->_int64_t method = [v4 decodeIntegerForKey:@"method"];
    v5->_int64_t syncProvenance = [v4 decodeInt64ForKey:@"sync_provenance"];
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"concepts"];
    userDomainConcepts = v5->_userDomainConcepts;
    v5->_userDomainConcepts = (NSArray *)v7;

    v5->_int64_t syncIdentity = -1;
    if ([v4 containsValueForKey:@"sync_identity"]) {
      v5->_int64_t syncIdentity = [v4 decodeInt64ForKey:@"sync_identity"];
    }
    unsigned int v9 = [v4 decodeInt32ForKey:@"sync_version_minimum"];
    v5->_$E7BD3517D03D6A5513A4727339E3F206 syncVersion = ($E7BD3517D03D6A5513A4727339E3F206)(v9 | (unint64_t)([v4 decodeInt32ForKey:@"sync_version_current"] << 32));
  }

  return v5;
}

- (int64_t)method
{
  return self->_method;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- ($2825F4736939C4A6D3AD43837233062D)syncVersion
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_syncVersion;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (NSArray)userDomainConcepts
{
  return self->_userDomainConcepts;
}

- (void).cxx_destruct
{
}

@end