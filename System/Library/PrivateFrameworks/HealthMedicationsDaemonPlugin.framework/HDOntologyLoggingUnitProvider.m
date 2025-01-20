@interface HDOntologyLoggingUnitProvider
+ (id)_localizedLoggingFormsForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
+ (id)loggingUnitsForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
@end

@implementation HDOntologyLoggingUnitProvider

+ (id)loggingUnitsForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x1E4F659F8];
  id v17 = 0;
  uint64_t v18 = v9;
  int v10 = [MEMORY[0x1E4F65B90] followRelationshipsWithTypes:&unk_1F17FC630 startingIdentifier:a3 options:12 ontologyTransaction:v8 conceptOut:&v17 deletedRelationshipVersionOut:&v18 error:a5];
  id v11 = v17;
  v12 = v11;
  v13 = 0;
  if (v10)
  {
    if (v11)
    {
      v14 = [v11 identifier];
      v13 = [a1 _localizedLoggingFormsForConceptWithIdentifier:v14 ontologyTransaction:v8 error:a5];
    }
    else
    {
      if (v18 == v9)
      {
        v13 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_8;
      }
      v14 = [MEMORY[0x1E4F65BA0] nullLocalizedOntologyLoggingUnitsWithVersion:v18 withUserDomainConceptPropertyType:160018];
      v15 = [MEMORY[0x1E4F65BA0] nullLocalizedOntologyLoggingUnitsWithVersion:v18 withUserDomainConceptPropertyType:160017];
      v13 = [v14 arrayByAddingObjectsFromArray:v15];
    }
  }
LABEL_8:

  return v13;
}

+ (id)_localizedLoggingFormsForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F65B90];
  id v8 = a4;
  uint64_t v9 = [v7 predicateMatchingRelationshipsWithSubjectId:a3 relationshipType:797];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = (void *)MEMORY[0x1E4F65B90];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__HDOntologyLoggingUnitProvider__localizedLoggingFormsForConceptWithIdentifier_ontologyTransaction_error___block_invoke;
  v16[3] = &unk_1E6337560;
  id v17 = v10;
  id v12 = v10;
  LODWORD(a5) = [v11 enumerateRelationshipsMatchingPredicate:v9 options:5 transaction:v8 error:a5 enumerationHandler:v16];

  if (a5) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

uint64_t __106__HDOntologyLoggingUnitProvider__localizedLoggingFormsForConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E4F65BA0];
  v4 = [a2 destination];
  v5 = [v3 localizedLoggingUnitsForConcept:v4];
  [v2 addObjectsFromArray:v5];

  return 1;
}

@end