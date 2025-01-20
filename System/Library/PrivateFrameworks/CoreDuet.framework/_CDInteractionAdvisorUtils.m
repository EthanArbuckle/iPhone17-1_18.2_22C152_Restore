@interface _CDInteractionAdvisorUtils
+ (BOOL)adjustRanker:(id)a3 forModel:(unint64_t)a4;
+ (BOOL)contact:(id)a3 mayRepresentTheSamePersonAsOneOf:(id)a4;
+ (id)adviceBasedOnInteractions:(id)a3 forContacts:(id)a4 andRanker:(id)a5 ignoringContacts:(id)a6 withLimit:(unint64_t)a7 aggregateByIdentifier:(BOOL)a8 requireOneOutgoingInteraction:(BOOL)a9;
+ (id)contactsForIdentifiers:(id)a3;
+ (id)contactsInInteraction:(id)a3;
+ (id)createTimePredicateForReferenceDate:(id)a3 recentLookBackDays:(int)a4 windowHours:(int)a5 lookBackWeeks:(int)a6 lookAheadWeeks:(int)a7;
+ (id)hashForAdviceWithContact:(id)a3 account:(id)a4 bundleId:(id)a5 mechanism:(int64_t)a6;
+ (id)inferConsumerIdentifierFromSettings:(id)a3;
+ (id)nameFromModelID:(unint64_t)a3;
+ (id)rankContacts:(id)a3 basedOnInteractions:(id)a4 andRanker:(id)a5;
+ (id)stringKeyForAdvice:(id)a3;
+ (id)unionSet:(id)a3 withSet:(id)a4;
+ (unint64_t)modelTypeForConsumerIdentifier:(id)a3 modelSettings:(id)a4;
+ (void)adjustForConsumerSettings:(id)a3 modelSettings:(id)a4 andRanker:(id)a5;
+ (void)updateConsumerModelSettings:(id)a3;
@end

@implementation _CDInteractionAdvisorUtils

+ (id)stringKeyForAdvice:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 contact];
  v6 = [v5 identifier];
  v7 = [v4 account];
  v8 = [v4 bundleId];
  uint64_t v9 = [v4 mechanism];

  v10 = [v3 stringWithFormat:@"%@,%@,%@,%ld", v6, v7, v8, v9];

  return v10;
}

+ (id)hashForAdviceWithContact:(id)a3 account:(id)a4 bundleId:(id)a5 mechanism:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  v11 = [a3 identifier];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [v10 hash];

  uint64_t v14 = [v9 hash];
  v15 = NSNumber;
  return (id)[v15 numberWithUnsignedInteger:v12 ^ a6 ^ v13 ^ v14];
}

+ (id)unionSet:(id)a3 withSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    if (v6 && [v6 count])
    {
      v7 = (void *)[v5 mutableCopy];
      [v7 unionSet:v6];
      goto LABEL_9;
    }
    id v8 = v5;
  }
  else
  {
    id v8 = v6;
  }
  v7 = v8;
LABEL_9:

  return v7;
}

+ (BOOL)contact:(id)a3 mayRepresentTheSamePersonAsOneOf:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "mayRepresentSamePersonAs:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)contactsForIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = [[_CDContact alloc] initWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i) type:0 customIdentifier:0 displayName:0 displayType:0 personId:0 personIdType:0];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)contactsInInteraction:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [v3 recipients];
  id v6 = [v4 arrayWithArray:v5];

  uint64_t v7 = [v3 sender];

  if (v7)
  {
    uint64_t v8 = [v3 sender];
    [v6 addObject:v8];
  }
  return v6;
}

+ (id)adviceBasedOnInteractions:(id)a3 forContacts:(id)a4 andRanker:(id)a5 ignoringContacts:(id)a6 withLimit:(unint64_t)a7 aggregateByIdentifier:(BOOL)a8 requireOneOutgoingInteraction:(BOOL)a9
{
  BOOL v84 = a8;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v89 = a5;
  id v14 = a6;
  v78 = v13;
  if (v13)
  {
    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    long long v16 = [v13 valueForKey:@"identifier"];
    v17 = [v15 setWithArray:v16];
  }
  else
  {
    v17 = 0;
  }
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v19 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    +[_CDInteractionAdvisorUtils adviceBasedOnInteractions:forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:](v12);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v12;
  v87 = v18;
  v85 = v14;
  uint64_t v81 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
  if (v81)
  {
    uint64_t v80 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v103 != v80) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        v22 = [v89 rankInteraction:v21];
        if (v22)
        {
          v88 = v22;
          uint64_t v82 = i;
          v23 = [a1 contactsInInteraction:v21];
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v98 objects:v109 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v99;
            v86 = v23;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v99 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v98 + 1) + 8 * j);
                if (v17)
                {
                  v29 = [*(id *)(*((void *)&v98 + 1) + 8 * j) identifier];
                  int v30 = [v17 containsObject:v29];

                  if (!v30) {
                    continue;
                  }
                }
                if (!v14
                  || ![v14 count]
                  || !+[_CDInteractionAdvisorUtils contact:v28 mayRepresentTheSamePersonAsOneOf:v14])
                {
                  if (v28)
                  {
                    if ([v28 personIdType]
                      || ([v28 identifier],
                          v31 = objc_claimAutoreleasedReturnValue(),
                          v31,
                          v31))
                    {
                      if ([v89 contactIsAllowed:v28])
                      {
                        if (v84)
                        {
                          v32 = NSNumber;
                          v33 = [v28 identifier];
                          v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "hash"));
                        }
                        else
                        {
                          v33 = [v21 account];
                          v35 = [v21 bundleId];
                          v34 = objc_msgSend(a1, "hashForAdviceWithContact:account:bundleId:mechanism:", v28, v33, v35, objc_msgSend(v21, "mechanism"));
                        }
                        v36 = [v87 objectForKeyedSubscript:v34];
                        if (v36)
                        {
                          v37 = v36;
                          v38 = [(_CDAdvisedInteraction *)v36 contact];
                          [v38 mergeWithContact:v28];
                        }
                        else
                        {
                          v37 = objc_alloc_init(_CDAdvisedInteraction);
                          -[_CDAdvisedInteraction setMechanism:](v37, "setMechanism:", [v21 mechanism]);
                          v39 = [v21 bundleId];
                          [(_CDAdvisedInteraction *)v37 setBundleId:v39];

                          v40 = [v21 account];
                          [(_CDAdvisedInteraction *)v37 setAccount:v40];

                          v41 = [MEMORY[0x1E4F1CAD0] set];
                          [(_CDAdvisedInteraction *)v37 setReasons:v41];

                          [(_CDAdvisedInteraction *)v37 setScore:0.0];
                          [(_CDAdvisedInteraction *)v37 setContact:v28];
                          [v87 setObject:v37 forKeyedSubscript:v34];
                        }
                        id v14 = v85;
                        if ([v21 direction] == 1)
                        {
                          [(_CDAdvisedInteraction *)v37 setSimilarOutgoingInteractionsCount:[(_CDAdvisedInteraction *)v37 similarOutgoingInteractionsCount]+ 1];
                        }
                        else if ([v21 direction])
                        {
                          if ([v21 direction] == 2) {
                            [(_CDAdvisedInteraction *)v37 setSimilarBidirectionalInteractionsCount:[(_CDAdvisedInteraction *)v37 similarBidirectionalInteractionsCount]+ 1];
                          }
                          else {
                            [v21 direction];
                          }
                        }
                        else
                        {
                          [(_CDAdvisedInteraction *)v37 setSimilarIncomingInteractionsCount:[(_CDAdvisedInteraction *)v37 similarIncomingInteractionsCount]+ 1];
                        }
                        if ([v89 rankAggregationMethod] == 1)
                        {
                          [(_CDAdvisedInteraction *)v37 score];
                          double v43 = v42;
                          [v88 score];
                          if (v43 >= v44) {
                            double v44 = v43;
                          }
                        }
                        else
                        {
                          [v88 score];
                          double v46 = v45;
                          [(_CDAdvisedInteraction *)v37 score];
                          double v44 = v46 + v47;
                        }
                        [(_CDAdvisedInteraction *)v37 setScore:v44];
                        v48 = [v88 reasons];
                        [(_CDAdvisedInteraction *)v37 addReasons:v48];

                        v23 = v86;
                      }
                    }
                  }
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v98 objects:v109 count:16];
            }
            while (v25);
          }

          uint64_t v18 = v87;
          v22 = v88;
          uint64_t i = v82;
        }
      }
      uint64_t v81 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
    }
    while (v81);
  }

  [v18 allValues];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = [v49 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v95;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v95 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = *(void **)(*((void *)&v94 + 1) + 8 * k);
        v55 = [v54 reasons];
        uint64_t v56 = [v55 count];

        if (!v56)
        {
          v57 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EDE1DBC8];
          [v54 setReasons:v57];
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v51);
  }

  if ([v89 canRankContacts])
  {
    v58 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v49, "count"));
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v59 = v49;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v90 objects:v107 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v91;
      do
      {
        for (uint64_t m = 0; m != v61; ++m)
        {
          if (*(void *)v91 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v90 + 1) + 8 * m);
          v65 = [v64 contact];
          [v89 rankContact:v65];
          double v67 = v66;

          if (v67 > 0.0)
          {
            [v64 score];
            [v64 setScore:v67 * v68];
            [v58 addObject:v64];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v90 objects:v107 count:16];
      }
      while (v61);
    }
  }
  else
  {
    v58 = v49;
  }
  if (a9)
  {
    v69 = [v58 indexesOfObjectsPassingTest:&__block_literal_global_267];
    uint64_t v70 = [v58 objectsAtIndexes:v69];

    v58 = (void *)v70;
  }
  v71 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v106 = v71;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];

  v73 = [v58 sortedArrayUsingDescriptors:v72];
  if ([v73 count] > a7)
  {
    uint64_t v74 = [v73 subarrayWithRange:0];

    v73 = (void *)v74;
  }
  v75 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
    +[_CDInteractionAdvisorUtils adviceBasedOnInteractions:forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:](v73, v75);
  }

  return v73;
}

+ (id)rankContacts:(id)a3 basedOnInteractions:(id)a4 andRanker:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v48 = a5;
  double v43 = v8;
  double v42 = [v8 valueForKey:@"identifier"];
  uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v11 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[_CDInteractionAdvisorUtils rankContacts:basedOnInteractions:andRanker:](v9);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    uint64_t v44 = *(void *)v60;
    id v45 = a1;
    do
    {
      uint64_t v15 = 0;
      uint64_t v46 = v13;
      do
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * v15);
        v17 = [a1 contactsInInteraction:v16];
        uint64_t v18 = [v17 valueForKey:@"identifier"];

        v19 = (void *)v18;
        v20 = [MEMORY[0x1E4F1CA80] setWithArray:v18];
        [v20 intersectSet:v51];
        if ([v20 count])
        {
          uint64_t v52 = v15;
          v21 = [v48 rankInteraction:v16];
          if (v21)
          {
            id v49 = v20;
            uint64_t v50 = v19;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v22 = v20;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v63 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v56;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v56 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                  uint64_t v28 = [v10 objectForKeyedSubscript:v27];
                  if (v28) {
                    v29 = (void *)v28;
                  }
                  else {
                    v29 = &unk_1EDE1DBE0;
                  }
                  int v30 = NSNumber;
                  [v29 doubleValue];
                  double v32 = v31;
                  [v21 score];
                  v34 = [v30 numberWithDouble:v32 + v33];
                  [v10 setObject:v34 forKeyedSubscript:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v63 count:16];
              }
              while (v24);
            }

            uint64_t v14 = v44;
            a1 = v45;
            uint64_t v13 = v46;
            v20 = v49;
            v19 = v50;
          }

          uint64_t v15 = v52;
        }

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v13);
  }

  if ([v42 count])
  {
    unint64_t v35 = 0;
    do
    {
      v36 = [v42 objectAtIndexedSubscript:v35];
      v37 = [v10 objectForKeyedSubscript:v36];

      if (!v37)
      {
        v38 = [NSNumber numberWithDouble:(double)v35 * -100.0];
        [v10 setObject:v38 forKeyedSubscript:v36];
      }
      ++v35;
    }
    while (v35 < [v42 count]);
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __73___CDInteractionAdvisorUtils_rankContacts_basedOnInteractions_andRanker___block_invoke;
  v53[3] = &unk_1E560E428;
  id v54 = v10;
  id v39 = v10;
  v40 = [v43 sortedArrayUsingComparator:v53];

  return v40;
}

+ (id)createTimePredicateForReferenceDate:(id)a3 recentLookBackDays:(int)a4 windowHours:(int)a5 lookBackWeeks:(int)a6 lookAheadWeeks:(int)a7
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = [v11 dateByAddingTimeInterval:(double)a4 * -86400.0];
  int v30 = [v11 dateByAddingTimeInterval:(double)(604800 * a7)];
  v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate > %@ AND startDate <= %@", v12, v30];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = v11;
  if (a6 >= 1)
  {
    int v15 = -604800 - 1800 * a5;
    int v16 = 1800 * a5 - 604800;
    do
    {
      v17 = [v14 dateByAddingTimeInterval:(double)v15];
      uint64_t v18 = [v14 dateByAddingTimeInterval:(double)v16];
      [v17 timeIntervalSinceReferenceDate];
      double v20 = v19;
      [v12 timeIntervalSinceReferenceDate];
      if (v20 <= v21)
      {
        id v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate > %@ AND startDate <= %@", v17, v18];
        [v13 addObject:v22];
      }
      v15 -= 604800;
      v16 -= 604800;
      --a6;
    }
    while (a6);
  }
  if ([v13 count])
  {
    uint64_t v23 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v13];
    uint64_t v24 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v25 = v29;
    v31[0] = v29;
    v31[1] = v23;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    id v27 = [v24 orPredicateWithSubpredicates:v26];
  }
  else
  {
    uint64_t v25 = v29;
    id v27 = v29;
  }

  return v27;
}

+ (id)inferConsumerIdentifierFromSettings:(id)a3
{
  id v3 = a3;
  id v4 = [v3 consumerIdentifier];

  if (v4)
  {
    id v5 = [v3 consumerIdentifier];
    goto LABEL_22;
  }
  id v6 = [v3 callerBundleId];
  uint64_t v7 = [v6 lowercaseString];
  if (![v7 isEqualToString:@"com.apple.mobilesms"]) {
    goto LABEL_10;
  }
  id v8 = [v3 contactPrefix];
  if ([v8 length])
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  id v9 = [v3 constrainMechanisms];
  if (![v9 containsObject:&unk_1EDE1DBF8])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v10 = [v3 constrainPersonIds];
  if ([v10 count])
  {

    goto LABEL_8;
  }
  uint64_t v18 = [v3 constrainIdentifiers];
  uint64_t v19 = [v18 count];

  if (!v19)
  {
    double v20 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_INFO, "Inferred consumer mqa", buf, 2u);
    }

    id v5 = @"com.apple.mobilesms.quickaction";
    goto LABEL_22;
  }
LABEL_11:
  id v11 = [v3 callerBundleId];
  uint64_t v12 = [v11 lowercaseString];
  if (([v12 isEqualToString:@"com.apple.duetexpertd"] & 1) == 0)
  {
LABEL_20:

LABEL_21:
    id v5 = 0;
    goto LABEL_22;
  }
  uint64_t v13 = [v3 contactPrefix];
  if ([v13 length])
  {
LABEL_19:

    goto LABEL_20;
  }
  id v14 = [v3 constrainMechanisms];
  if (![v14 containsObject:&unk_1EDE1DC10])
  {
LABEL_18:

    goto LABEL_19;
  }
  int v15 = [v3 constrainMechanisms];
  if ([v15 containsObject:&unk_1EDE1DBF8])
  {
LABEL_17:

    goto LABEL_18;
  }
  int v16 = [v3 constrainPersonIds];
  if ([v16 count])
  {

    goto LABEL_17;
  }
  double v21 = [v3 constrainIdentifiers];
  uint64_t v22 = [v21 count];

  if (v22) {
    goto LABEL_21;
  }
  uint64_t v23 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_18ECEB000, v23, OS_LOG_TYPE_INFO, "Inferred consumer pqa", v24, 2u);
  }

  id v5 = @"com.apple.mobilephone.quickaction";
LABEL_22:

  return v5;
}

+ (void)updateConsumerModelSettings:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  id v5 = [v4 valueForKey:@"com.apple.coreduet.peoplePrediction.quickAction.Messages"];
  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:&unk_1EDE1DC28];
    [v6 setObject:v5 forKeyedSubscript:&unk_1EDE1DC28];
  }
  uint64_t v7 = [v4 valueForKey:@"com.apple.coreduet.peoplePrediction.quickAction.Phone"];
  if (v7)
  {
    id v8 = [v3 objectForKeyedSubscript:&unk_1EDE1DC40];
    [v8 setObject:v7 forKeyedSubscript:&unk_1EDE1DC28];
  }
  id v9 = [v4 valueForKey:@"com.apple.coreduet.peoplePrediction.shareSheet"];
  if (v9)
  {
    id v10 = [v3 objectForKeyedSubscript:&unk_1EDE1DC58];
    [v10 setObject:v9 forKeyedSubscript:&unk_1EDE1DC28];
  }
  id v11 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[_CDInteractionAdvisorUtils updateConsumerModelSettings:]();
  }
}

+ (unint64_t)modelTypeForConsumerIdentifier:(id)a3 modelSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"com.apple.mobilesms.quickaction"])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:&unk_1EDE1DC28];
    id v8 = v7;
  }
  else
  {
    if (![v5 isEqualToString:@"com.apple.mobilephone.quickaction"])
    {
      if (![v5 isEqualToString:@"com.apple.peoplesuggester.consumer.sharesheet"])
      {
        unint64_t v10 = 0;
        goto LABEL_10;
      }
      uint64_t v12 = [v6 objectForKeyedSubscript:&unk_1EDE1DC58];
      id v9 = [v12 objectForKeyedSubscript:&unk_1EDE1DC28];

      unint64_t v10 = v9 == 0;
      if (!v9) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v7 = [v6 objectForKeyedSubscript:&unk_1EDE1DC40];
    id v8 = v7;
  }
  id v9 = [v7 objectForKeyedSubscript:&unk_1EDE1DC28];

  if (v9) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = 3;
  }
  if (v9)
  {
LABEL_9:
    unint64_t v10 = [v9 integerValue];
  }
LABEL_10:

  return v10;
}

+ (void)adjustForConsumerSettings:(id)a3 modelSettings:(id)a4 andRanker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 inferConsumerIdentifierFromSettings:v8];
  [v8 setConsumerIdentifier:v11];

  uint64_t v12 = [v8 consumerIdentifier];
  uint64_t v13 = [v12 lowercaseString];

  if ([v13 isEqualToString:@"com.apple.mobilesms.quickaction"])
  {
    [v8 setConstrainMaxRecipientCount:1];
    unint64_t v14 = [v8 resultLimit];
    if (v14 <= 0x14) {
      uint64_t v15 = 20;
    }
    else {
      uint64_t v15 = v14;
    }
    [v8 setResultLimit:v15];
    uint64_t v16 = [a1 modelTypeForConsumerIdentifier:v13 modelSettings:v9];
    v17 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:]();
    }
  }
  else if ([v13 isEqualToString:@"frequency"])
  {
    v17 = +[_CDLogging interactionChannel];
    uint64_t v16 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.4();
      uint64_t v16 = 2;
    }
  }
  else if ([v13 isEqualToString:@"frecency"])
  {
    v17 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.5();
    }
    uint64_t v16 = 5;
  }
  else if ([v13 isEqualToString:@"recency"])
  {
    v17 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.6();
    }
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = [a1 modelTypeForConsumerIdentifier:v13 modelSettings:v9];
    v17 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.7();
    }
  }

  int v18 = [a1 adjustRanker:v10 forModel:v16];
  if (v18)
  {
    uint64_t v19 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:]();
    }
  }
  double v20 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:](a1, v16);
  }
}

+ (BOOL)adjustRanker:(id)a3 forModel:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  BOOL v7 = 0;
  switch(a4)
  {
    case 1uLL:
      [v5 setTimeWeight:1.0];
      double v8 = 0.0;
      [v6 setTimeOfDayWeight:0.0];
      [v6 setTimeOfWeekWeight:0.0];
      uint64_t v9 = 1;
      goto LABEL_7;
    case 2uLL:
      [v5 setTimeWeight:0.0];
      [v6 setTimeOfDayWeight:0.0];
      [v6 setTimeOfWeekWeight:0.0];
      uint64_t v9 = 0;
      double v8 = 1.0;
      goto LABEL_7;
    case 3uLL:
      [v5 setTimeWeight:0.0];
      [v6 setTimeOfDayWeight:0.0];
      [v6 setTimeOfWeekWeight:0.0];
      [v6 setOutgoingWeight:4.0];
      double v8 = 1.0;
      [v6 setSameWeekPeriodWeight:1.0];
      [v6 setDiffWeekPeriodWeight:0.01];
      goto LABEL_6;
    case 5uLL:
      [v5 setTimeWeight:1.0];
      [v6 setTimeHalfLife:345600.0];
      double v8 = 0.0;
      [v6 setTimeOfDayWeight:0.0];
      [v6 setTimeOfWeekWeight:0.0];
LABEL_6:
      uint64_t v9 = 0;
LABEL_7:
      [v6 setC:v8];
      [v6 setRankAggregationMethod:v9];
      BOOL v7 = 1;
      break;
    default:
      break;
  }

  return v7;
}

+ (id)nameFromModelID:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"CDIModelPredictive";
  }
  else {
    return off_1E560EF08[a3 - 1];
  }
}

+ (void)adviceBasedOnInteractions:(void *)a1 forContacts:(NSObject *)a2 andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v5 = 2112;
  id v6 = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Returned %lu advised interactions. Advice=%@", v4, 0x16u);
}

+ (void)adviceBasedOnInteractions:(void *)a1 forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "Advising based on %lu interactions", v3, v4, v5, v6, v7);
}

+ (void)rankContacts:(void *)a1 basedOnInteractions:andRanker:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "Ranking contact identifiers based on %lu interactions", v3, v4, v5, v6, v7);
}

+ (void)updateConsumerModelSettings:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Updating model parameters: %@", v2, v3, v4, v5, v6);
}

+ (void)adjustForConsumerSettings:(void *)a1 modelSettings:(uint64_t)a2 andRanker:.cold.1(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 nameFromModelID:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v3, v4, "Using model type: %@", v5, v6, v7, v8, v9);
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Adjusted ranker parameters", v2, v3, v4, v5, v6);
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Adjusted ranker for mqa consumer. Advisor Settings = %@", v2, v3, v4, v5, v6);
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Adjusted ranker for pure frequency consumer", v2, v3, v4, v5, v6);
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Adjusted ranker for simple frequency consumer", v2, v3, v4, v5, v6);
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Adjusted ranker for recency consumer", v2, v3, v4, v5, v6);
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Adjusted ranker for consumer %@", v2, v3, v4, v5, v6);
}

@end