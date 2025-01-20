@interface _HKUserDomainConceptComparisonFilter(HealthDaemon)
- (__CFString)propertyForKeyPath;
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKUserDomainConceptComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5 = a3;
  v6 = [a1 keyPath];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2A460]];

  if (v7)
  {
    id v8 = v5;
    if (a1)
    {
      v9 = (void *)MEMORY[0x1E4F2B680];
      v10 = [a1 value];
      v11 = [v9 semanticIdentifierFromSemanticIdentifierString:v10 profile:v8];

      if (v11)
      {
        v12 = [v8 daemon];
        v13 = [v12 userDomainConceptEntityRegistry];
        v14 = [v11 typeIdentifier];
        v15 = (void *)[v13 userDomainConceptEntityClassForTypeIdentifier:v14];

        [v15 predicateMatchingSemanticIdentifier:v11];
      }
      else
      {
        [MEMORY[0x1E4F65D58] falsePredicate];
      v23 = };
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v16 = [a1 keyPath];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F2A468]];

    if (v17)
    {
      if (a1)
      {
        uint64_t v18 = [a1 operatorType];
        v19 = [a1 value];
        v20 = v19;
        if (v18 == 10) {
          HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifiers(v19);
        }
        else {
        v23 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier(v19);
        }
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v21 = [a1 keyPath];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F2A470]];

      if (v22)
      {
        [a1 simplePredicate];
      }
      else
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:a1 file:@"_HKUserDomainConceptComparisonFilter+HealthDaemon.m" lineNumber:35 description:@"Unreachable code has been executed"];

        [MEMORY[0x1E4F65D58] falsePredicate];
      v23 = };
    }
  }

  return v23;
}

- (__CFString)propertyForKeyPath
{
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A470]];

  if (v5)
  {
    v6 = @"uuid";
  }
  else
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKUserDomainConceptComparisonFilter+HealthDaemon.m" lineNumber:44 description:@"Unreachable code has been executed"];

    v6 = &stru_1F1728D60;
  }

  return v6;
}

@end