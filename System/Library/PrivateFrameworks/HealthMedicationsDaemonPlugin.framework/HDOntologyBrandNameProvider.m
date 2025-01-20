@interface HDOntologyBrandNameProvider
+ (id)brandNamesForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
@end

@implementation HDOntologyBrandNameProvider

+ (id)brandNamesForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  uint64_t v5 = *MEMORY[0x1E4F659F8];
  id v12 = 0;
  uint64_t v13 = v5;
  int v6 = [MEMORY[0x1E4F65B90] followRelationshipsWithTypes:&unk_1F17FC708 startingIdentifier:a3 options:12 ontologyTransaction:a4 conceptOut:&v12 deletedRelationshipVersionOut:&v13 error:a5];
  id v7 = v12;
  id v8 = 0;
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F65BA0] localizedOntologyPreferredNamesForConcept:v7 withUserDomainConceptPropertyType:160007];
    }
    else
    {
      if (v13 == v5) {
        goto LABEL_7;
      }
      uint64_t v9 = [MEMORY[0x1E4F65BA0] nullLocalizedOntologyPreferredNamesWithVersion:v13 withUserDomainConceptPropertyType:160007];
    }
    v10 = (void *)v9;
    [v8 addObjectsFromArray:v9];
  }
LABEL_7:

  return v8;
}

@end