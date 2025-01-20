@interface CRKClassKitClassPropertyApplicator
- (BOOL)additionsAndRemovalsIntersect:(id)a3;
- (CRKClassKitClassPropertyApplicator)initWithRequirements:(id)a3;
- (CRKClassKitRosterRequirements)requirements;
- (id)applyProperties:(id)a3 toClass:(id)a4 error:(id *)a5;
- (id)identifiersOfUsers:(id)a3;
- (void)addTrustedUser:(id)a3 toClass:(id)a4;
- (void)addUser:(id)a3 toClass:(id)a4;
- (void)removeTrustedUser:(id)a3 fromClass:(id)a4;
- (void)removeUser:(id)a3 fromClass:(id)a4;
@end

@implementation CRKClassKitClassPropertyApplicator

- (CRKClassKitClassPropertyApplicator)initWithRequirements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitClassPropertyApplicator;
  v6 = [(CRKClassKitClassPropertyApplicator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requirements, a3);
  }

  return v7;
}

- (id)applyProperties:(id)a3 toClass:(id)a4 error:(id *)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v67 = self;
  if ([(CRKClassKitClassPropertyApplicator *)self additionsAndRemovalsIntersect:v9])
  {
    if (a5)
    {
      CRKErrorWithCodeAndUserInfo(153, 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  v12 = [v9 name];

  if (!v12) {
    goto LABEL_9;
  }
  v13 = [v10 displayName];
  if (!v13)
  {
    id v5 = [v9 name];
    if (!v5) {
      goto LABEL_9;
    }
  }
  v14 = [v10 displayName];
  v15 = [v9 name];
  char v16 = [v14 isEqual:v15];

  if (!v13)
  {

    if (v16) {
      goto LABEL_9;
    }
LABEL_11:
    v18 = [v9 name];
    [v10 setDisplayName:v18];

    char v17 = 1;
    goto LABEL_12;
  }

  if ((v16 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  char v17 = 0;
LABEL_12:
  v19 = [v9 mascot];

  if (v19)
  {
    unint64_t v20 = +[CRKClassKitColorAndMascotUtility mascotForClass:v10];
    v21 = [v9 mascot];
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (v20 != v22)
    {
      if (!+[CRKClassKitColorAndMascotUtility setMascot:v22 forClass:v10 error:a5])goto LABEL_57; {
      char v17 = 1;
      }
    }
  }
  v23 = [v9 color];

  if (!v23) {
    goto LABEL_20;
  }
  unint64_t v24 = +[CRKClassKitColorAndMascotUtility colorForClass:v10];
  v25 = [v9 color];
  uint64_t v26 = [v25 unsignedIntegerValue];

  if (v24 == v26) {
    goto LABEL_20;
  }
  if (!+[CRKClassKitColorAndMascotUtility setColor:v26 forClass:v10 error:a5])
  {
LABEL_57:
    v11 = 0;
    goto LABEL_58;
  }
  char v17 = 1;
LABEL_20:
  char v27 = v17;
  v28 = [(CRKClassKitClassPropertyApplicator *)v67 requirements];
  v66 = [v28 objectIDsOfPersonsInClass:v10];

  v29 = [(CRKClassKitClassPropertyApplicator *)v67 requirements];
  id v30 = v10;
  v31 = [v29 objectIDsOfTrustedPersonsInClass:v10];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v65 = v9;
  v32 = [v9 usersToAdd];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v81 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v38 = [v37 identifier];
        char v39 = [v66 containsObject:v38];

        if ((v39 & 1) == 0)
        {
          [(CRKClassKitClassPropertyApplicator *)v67 addUser:v37 toClass:v30];
          char v27 = 1;
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v34);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v40 = [v65 usersToRemove];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v77 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        v46 = [v45 identifier];
        int v47 = [v66 containsObject:v46];

        if (v47)
        {
          [(CRKClassKitClassPropertyApplicator *)v67 removeUser:v45 fromClass:v30];
          char v27 = 1;
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v42);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v48 = [v65 trustedUsersToAdd];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v72 objects:v85 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v73 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v72 + 1) + 8 * k);
        v54 = [v53 identifier];
        char v55 = [v31 containsObject:v54];

        if ((v55 & 1) == 0)
        {
          [(CRKClassKitClassPropertyApplicator *)v67 addTrustedUser:v53 toClass:v30];
          char v27 = 1;
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v72 objects:v85 count:16];
    }
    while (v50);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v56 = [v65 trustedUsersToRemove];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v58; ++m)
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v68 + 1) + 8 * m);
        v62 = [v61 identifier];
        int v63 = [v31 containsObject:v62];

        if (v63)
        {
          [(CRKClassKitClassPropertyApplicator *)v67 removeTrustedUser:v61 fromClass:v30];
          char v27 = 1;
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v68 objects:v84 count:16];
    }
    while (v58);
  }

  v11 = [[CRKClassKitClassPropertyApplicatorResult alloc] initWithClassWasModified:v27 & 1];
  id v9 = v65;
  id v10 = v30;
LABEL_58:

  return v11;
}

- (void)addUser:(id)a3 toClass:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[CRKClassKitClassPropertyApplicator addUser:toClass:]"];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v9 handleFailureInFunction:v10, @"CRKClassKitClassPropertyApplicator.m", 125, @"expected %@, got %@", v12, v14 file lineNumber description];
  }
  v7 = [v15 backingPerson];
  v8 = [(CRKClassKitClassPropertyApplicator *)self requirements];
  [v8 addPerson:v7 toClass:v6];
}

- (void)removeUser:(id)a3 fromClass:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[CRKClassKitClassPropertyApplicator removeUser:fromClass:]"];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v9 handleFailureInFunction:v10, @"CRKClassKitClassPropertyApplicator.m", 131, @"expected %@, got %@", v12, v14 file lineNumber description];
  }
  v7 = [v15 backingPerson];
  v8 = [(CRKClassKitClassPropertyApplicator *)self requirements];
  [v8 removePerson:v7 fromClass:v6];
}

- (void)addTrustedUser:(id)a3 toClass:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[CRKClassKitClassPropertyApplicator addTrustedUser:toClass:]"];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v9 handleFailureInFunction:v10, @"CRKClassKitClassPropertyApplicator.m", 137, @"expected %@, got %@", v12, v14 file lineNumber description];
  }
  v7 = [v15 backingPerson];
  v8 = [(CRKClassKitClassPropertyApplicator *)self requirements];
  [v8 addTrustedPerson:v7 toClass:v6];
}

- (void)removeTrustedUser:(id)a3 fromClass:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[CRKClassKitClassPropertyApplicator removeTrustedUser:fromClass:]"];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v9 handleFailureInFunction:v10, @"CRKClassKitClassPropertyApplicator.m", 143, @"expected %@, got %@", v12, v14 file lineNumber description];
  }
  v7 = [v15 backingPerson];
  v8 = [(CRKClassKitClassPropertyApplicator *)self requirements];
  [v8 removeTrustedPerson:v7 fromClass:v6];
}

- (BOOL)additionsAndRemovalsIntersect:(id)a3
{
  id v4 = a3;
  id v5 = [v4 usersToAdd];
  id v6 = [(CRKClassKitClassPropertyApplicator *)self identifiersOfUsers:v5];

  v7 = [v4 usersToRemove];
  v8 = [(CRKClassKitClassPropertyApplicator *)self identifiersOfUsers:v7];

  id v9 = [v4 trustedUsersToAdd];
  id v10 = [(CRKClassKitClassPropertyApplicator *)self identifiersOfUsers:v9];

  v11 = [v4 trustedUsersToRemove];

  v12 = [(CRKClassKitClassPropertyApplicator *)self identifiersOfUsers:v11];

  if ([v6 intersectsSet:v8]) {
    char v13 = 1;
  }
  else {
    char v13 = [v10 intersectsSet:v12];
  }

  return v13;
}

- (id)identifiersOfUsers:(id)a3
{
  return (id)objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_41);
}

uint64_t __57__CRKClassKitClassPropertyApplicator_identifiersOfUsers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
}

@end