@interface NSMutableAttributedString(UserAttributedQueryString)
- (id)_expandedDateFilter:()UserAttributedQueryString;
- (id)tokenizeAndAddFilter:()UserAttributedQueryString filterKey:;
- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:;
- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:;
- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:;
- (void)_tagRangeWithFilters:()UserAttributedQueryString key:filters:filterOp:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:filterOperator:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:filterOperator:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDate:endDate:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDates:endDates:filterOperator:;
- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:filterOperator:;
- (void)tagRangeWithSceneFilter:()UserAttributedQueryString withCSSceneType:sceneID:;
- (void)tagRangeWithSceneFilters:()UserAttributedQueryString withCSSceneTypes:sceneIDs:;
@end

@implementation NSMutableAttributedString(UserAttributedQueryString)

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = [a1 string];
  v10 = objc_msgSend(v9, "substringWithRange:", a3, a4);

  if ([v10 length])
  {
    if ([v8 isEqualToString:@"_kMDItemPhotosMemoriesExpandedLocation"])
    {
      v13[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", a3, a4, v8, v11);
    }
    else
    {
      v11 = [NSString stringWithFormat:@"%@=\"%@\"cd", v8, v10];
      objc_msgSend(a1, "addAttribute:value:range:", v8, v11, a3, a4);
    }
  }
  else
  {
    v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:]();
    }
  }
}

- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:
{
  return objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:", a3, a4, a5, a6, 0);
}

- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:
{
  return objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:numberValues:filterOperator:", a3, a4, a5, a6, 0);
}

- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:
{
  return objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:filterOperator:", a3, a4, a5, a6, 0);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDate:endDate:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v12 = (objc_class *)MEMORY[0x1E4F28D48];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = objc_alloc_init(v12);
  v17 = [v16 stringFromDate:v14];

  v18 = objc_msgSend(v16, "stringFromDate:", v13, v17);

  v21[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v22[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:", a3, a4, v15, v20);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDates:endDates:filterOperator:
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v15 count];
  if (v17 == [v16 count])
  {
    v27 = a1;
    uint64_t v28 = a3;
    uint64_t v29 = a4;
    unsigned int v30 = a8;
    id v31 = v14;
    uint64_t v18 = [v15 count];
    v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v32 = objc_opt_new();
    if (v18)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        v21 = [v15 objectAtIndexedSubscript:i];
        v22 = [v19 stringFromDate:v21];
        v33[0] = v22;
        v23 = [v16 objectAtIndexedSubscript:i];
        v24 = [v19 stringFromDate:v23];
        v33[1] = v24;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
        v26 = id v25 = v15;
        [v32 addObject:v26];

        id v15 = v25;
      }
    }
    id v14 = v31;
    objc_msgSend(v27, "tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:filterOperator:", v28, v29, v31, v32, v30);
  }
  else
  {
    v19 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDates:endDates:filterOperator:]();
    }
  }
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v13)
  {
    if (v14)
    {
      if ([v13 year] == 0x7FFFFFFFFFFFFFFFLL
        && [v15 year] == 0x7FFFFFFFFFFFFFFFLL
        && [v13 month] != 0x7FFFFFFFFFFFFFFFLL
        && [v15 month] != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        unsigned int v30 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v31 = [v16 component:4 fromDate:v30];

        [v13 setYear:v31];
        uint64_t v32 = [v13 month];
        if (v32 <= [v15 month]) {
          uint64_t v33 = v31;
        }
        else {
          uint64_t v33 = v31 + 1;
        }
        [v15 setYear:v33];
        uint64_t v34 = [v16 dateFromComponents:v13];
        if (v34)
        {
          uint64_t v17 = v34;
          uint64_t v35 = [v16 dateFromComponents:v15];
          if (v35)
          {
            v36 = v35;
            v63 = v17;
            uint64_t v37 = objc_opt_new();
            v60 = v36;
            v62 = (void *)v37;
            if ([v13 day] != 0x7FFFFFFFFFFFFFFFLL)
            {
              v57 = NSString;
              v38 = (void *)v37;
              v55 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "day"));
              v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "month"));
              v40 = [v57 stringWithFormat:@"(_kMDItemContentCreationDateDay>=%@ && _kMDItemContentCreationDateMonth=%@)", v55, v39];
              [v38 addObject:v40];

              v41 = [v16 dateByAddingUnit:8 value:1 toDate:v63 options:0];

              v42 = [v16 components:12 fromDate:v41];
              [v42 setDay:1];
              v63 = [v16 dateFromComponents:v42];
            }
            if ([v15 day] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v43 = v60;
            }
            else
            {
              v58 = NSString;
              uint64_t v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "day"));
              v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "month"));
              v46 = (void *)v44;
              v47 = [v58 stringWithFormat:@"(_kMDItemContentCreationDateDay<=%@ && _kMDItemContentCreationDateMonth=%@)", v44, v45];
              [v62 addObject:v47];

              v48 = [v16 dateByAddingUnit:8 value:-1 toDate:v60 options:0];

              v49 = [v16 components:12 fromDate:v48];
              [v16 rangeOfUnit:16 inUnit:8 forDate:v48];
              [v49 setDay:v50];
              v43 = [v16 dateFromComponents:v49];
            }
            uint64_t v17 = v63;
            if ((unint64_t)([v63 compare:v43] + 1) <= 1)
            {
              uint64_t v51 = [v16 component:8 fromDate:v63];
              v61 = v43;
              uint64_t v52 = [v16 component:8 fromDate:v43];
              v56 = NSString;
              v59 = [NSNumber numberWithInteger:v51];
              v53 = [NSNumber numberWithInteger:v52];
              v54 = [v56 stringWithFormat:@"(_kMDItemContentCreationDateMonth>=%@ && _kMDItemContentCreationDateMonth<=%@)", v59, v53];
              [v62 addObject:v54];

              v43 = v61;
              uint64_t v17 = v63;
            }
            objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", a3, a4, @"kMDItemContentCreationDate", v62, 0);
          }
          else
          {
            v43 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
              -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDateComponents:endDateComponents:].cold.5();
            }
          }
        }
        else
        {
          uint64_t v17 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDateComponents:endDateComponents:].cold.4();
          }
        }
      }
      else
      {
        id v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v17 = [v16 dateFromComponents:v13];
        if (v17)
        {
          uint64_t v18 = [v15 inclusiveDate];
          if (v18)
          {
            objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:startDate:endDate:", a3, a4, @"kMDItemContentCreationDate", v17, v18);
          }
          else
          {
            uint64_t v29 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDateComponents:endDateComponents:]();
            }
          }
        }
        else
        {
          uint64_t v18 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDateComponents:endDateComponents:]();
          }
        }
      }
    }
    else
    {
      id v16 = objc_opt_new();
      if ([v13 year] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = NSString;
        v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "year"));
        v22 = [v20 stringWithFormat:@"_kMDItemContentCreationDateYear=%@", v21];
        [v16 addObject:v22];
      }
      if ([v13 month] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = NSString;
        v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "month"));
        id v25 = [v23 stringWithFormat:@"_kMDItemContentCreationDateMonth=%@", v24];
        [v16 addObject:v25];
      }
      if ([v13 day] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = NSString;
        v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "day"));
        uint64_t v28 = [v26 stringWithFormat:@"_kMDItemContentCreationDateDay=%@", v27];
        [v16 addObject:v28];
      }
      objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", a3, a4, @"kMDItemContentCreationDate", v16, 1);
    }
  }
  else
  {
    v19 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDateComponents:endDateComponents:](v19);
    }
  }
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:filterOperator:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if ([v13 count])
  {
    uint64_t v30 = a4;
    id v14 = objc_opt_new();
    unsigned int v31 = a7;
    uint64_t v29 = a3;
    if ([v12 isEqualToString:@"_kMDItemPhotosMemoriesExpandedLocation"])
    {
      id v15 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v12;
        _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_INFO, "Received key: %@, tokening and adding word search filters", buf, 0xCu);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = v13;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v37;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [a1 tokenizeAndAddFilter:*(void *)(*((void *)&v36 + 1) + 8 * v20) filterKey:@"kMDItemPhotosLocationKeywords"];
            if ([v21 length]) {
              [v14 addObject:v21];
            }

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v18);
      }

      objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", v29, v30, @"kMDItemPhotosLocationKeywords", v14, v31);
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v28 = v13;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v33;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v33 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [NSString stringWithFormat:@"%@=\"%@\"cd", v12, *(void *)(*((void *)&v32 + 1) + 8 * v26)];
            [v14 addObject:v27];

            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v24);
      }

      objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", v29, v30, v12, v14, v31);
      id v13 = v28;
    }
  }
  else
  {
    id v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:]();
    }
  }
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:filterOperator:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if ([v13 count])
  {
    uint64_t v21 = a3;
    uint64_t v22 = a4;
    unsigned int v23 = a7;
    id v14 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [NSString stringWithFormat:@"%@=%@", v12, *(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", v21, v22, v12, v14, v23);
  }
  else
  {
    id v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:numberValues:filterOperator:]();
    }
  }
}

- (id)_expandedDateFilter:()UserAttributedQueryString
{
  v3 = [a3 componentsSeparatedByString:@" "];
  v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [v3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = v5 - 1;
    do
    {
      v9 = [v3 objectAtIndexedSubscript:v7];
      if ([v9 length])
      {
        if (v8 == v7) {
          v10 = @"(kMDItemPhotosSeasons=\"%@\"cd || kMDItemPhotosHolidays=\"%@*\"cdw || kMDItemPhotosContentCreationDateMonth=\"%@\"cd || kMDItemPhotosContentCreationDateMonths=\"%@\"cd || kMDItemPhotosContentCreationDateYear=\"%@\"cd || kMDItemPhotosContentCreationDateYears=\"%@\"cd || _kMDItemContentCreationDateDay=\"%@\"cd)";
        }
        else {
          v10 = @"(kMDItemPhotosSeasons=\"%@\"cd || kMDItemPhotosHolidays=\"%@\"cdw || kMDItemPhotosContentCreationDateMonth=\"%@\"cd || kMDItemPhotosContentCreationDateMonths=\"%@\"cd || kMDItemPhotosContentCreationDateYear=\"%@\"cd || kMDItemPhotosContentCreationDateYears=\"%@\"cd || _kMDItemContentCreationDateDay=\"%@\"cd)";
        }
        v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v9, v9, v9, v9, v9, v9, v9);
        [v4 addObject:v11];
      }
      ++v7;
    }
    while (v6 != v7);
  }
  id v12 = [v4 componentsJoinedByString:@" && "];

  return v12;
}

- (id)tokenizeAndAddFilter:()UserAttributedQueryString filterKey:
{
  id v5 = a3;
  v7 = id v6 = a4;
  uint64_t v8 = [v5 componentsSeparatedByCharactersInSet:v7];
  v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    unint64_t v10 = 0;
    do
    {
      v11 = [v8 objectAtIndexedSubscript:v10];
      if ([v11 length])
      {
        id v12 = [NSString stringWithFormat:@"%@=\"%@\"cdw", v6, v11];
        [v9 addObject:v12];
      }
      ++v10;
    }
    while (v10 < [v8 count]);
  }
  id v13 = NSString;
  id v14 = [v9 componentsJoinedByString:@" && "];
  id v15 = [v13 stringWithFormat:@"(%@)", v14];

  return v15;
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:filterOperator:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if ([v13 count])
  {
    id v14 = objc_opt_new();
    unsigned int v33 = a7;
    uint64_t v31 = a3;
    uint64_t v32 = a4;
    uint64_t v30 = a1;
    if ([(__CFString *)v12 isEqualToString:@"_kMDItemPhotosMemoriesExpandedDate"])
    {
      id v15 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_INFO, "Received expanded date key, will be adding expanded date search logic", buf, 2u);
      }

      uint64_t v16 = [a1 string];
      uint64_t v17 = objc_msgSend(v16, "substringWithRange:", a3, a4);

      uint64_t v18 = [a1 _expandedDateFilter:v17];
      if ([v18 length]) {
        [v14 addObject:v18];
      }
      uint64_t v19 = v14;

      uint64_t v20 = @"kMDItemContentCreationDate";
    }
    else
    {
      uint64_t v19 = v14;
      uint64_t v20 = v12;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v13;
    uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(obj);
          }
          long long v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v26 = NSString;
          long long v27 = [v25 objectAtIndexedSubscript:0];
          id v28 = [v25 objectAtIndexedSubscript:1];
          uint64_t v29 = objc_msgSend(v26, "stringWithFormat:", @"InRange(%@,$time.iso(%@),$time.iso(%@)"), v20, v27, v28;
          [v19 addObject:v29];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v22);
    }

    id v12 = v20;
    objc_msgSend(v30, "_tagRangeWithFilters:key:filters:filterOp:", v31, v32, v20, v19, v33);
  }
  else
  {
    uint64_t v19 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:filterOperator:]();
    }
  }
}

- (void)tagRangeWithSceneFilter:()UserAttributedQueryString withCSSceneType:sceneID:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unint64_t v10 = NSNumber;
  id v11 = a6;
  id v12 = [v10 numberWithInteger:a5];
  v16[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  objc_msgSend(a1, "tagRangeWithSceneFilters:withCSSceneTypes:sceneIDs:", a3, a4, v13, v14);
}

- (void)tagRangeWithSceneFilters:()UserAttributedQueryString withCSSceneTypes:sceneIDs:
{
  id v10 = a5;
  id v11 = a6;
  if ([v10 count] && (uint64_t v12 = objc_msgSend(v10, "count"), v12 == objc_msgSend(v11, "count")))
  {
    id v13 = objc_opt_new();
    uint64_t v14 = [v10 count];
    id v15 = @"kMDItemPhotosSceneClassificationLabels";
    if (v14)
    {
      long long v24 = a1;
      uint64_t v25 = a3;
      uint64_t v26 = a4;
      unint64_t v16 = 0;
      LOBYTE(a1) = 1;
      do
      {
        uint64_t v17 = [v10 objectAtIndexedSubscript:v16];
        int v18 = [v17 intValue];

        LODWORD(a1) = ((v18 & 0xFFFFFFFE) != 6) & a1;
        uint64_t v19 = NSString;
        uint64_t v20 = [v10 objectAtIndexedSubscript:v16];
        uint64_t v21 = [v11 objectAtIndexedSubscript:v16];
        uint64_t v22 = [v19 stringWithFormat:@"(kMDItemPhotosSceneClassificationTypedIdentifiers=%@-%@)", v20, v21];
        [v13 addObject:v22];

        ++v16;
      }
      while (v16 < [v10 count]);
      id v15 = @"kMDItemPhotosSceneClassificationLabels";
      if (!a1) {
        id v15 = @"kMDItemPhotosLocationKeywords";
      }
      a3 = v25;
      a4 = v26;
      a1 = v24;
    }
    objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", a3, a4, v15, v13, 0);
  }
  else
  {
    uint64_t v23 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithSceneFilters:withCSSceneTypes:sceneIDs:](v23);
    }
  }
}

- (void)_tagRangeWithFilters:()UserAttributedQueryString key:filters:filterOp:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if ([v13 count])
  {
    if ([v13 count] == 1)
    {
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    }
    else
    {
      if (a7) {
        unint64_t v16 = @" && ";
      }
      else {
        unint64_t v16 = @" || ";
      }
      uint64_t v14 = [v13 componentsJoinedByString:v16];
    }
    id v15 = v14;
    uint64_t v17 = objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", a3, 0, a3, a4);
    int v18 = [v17 valueForKey:v12];
    if (v18)
    {
      uint64_t v19 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        long long v24 = v15;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl(&dword_18D0E3000, v19, OS_LOG_TYPE_DEFAULT, "new filter %@ OR'd to existing filter %@ for key %@", buf, 0x20u);
      }

      v22[0] = v18;
      v22[1] = v15;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      uint64_t v21 = [v20 componentsJoinedByString:@" || "];
      objc_msgSend(a1, "addAttribute:value:range:", v12, v21, a3, a4);
    }
    else
    {
      objc_msgSend(a1, "addAttribute:value:range:", v12, v15, a3, a4);
    }
  }
  else
  {
    id v15 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NSMutableAttributedString(UserAttributedQueryString) _tagRangeWithFilters:key:filters:filterOp:]();
    }
  }
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "Empty implicit value for string key: %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDates:endDates:filterOperator:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "startdates don't match endDates: %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "no start date component provided", v1, 2u);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "invalid for date conversion start date components %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "invalid for date conversion end date components %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "invalid date conversion from nsdate components %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDateComponents:endDateComponents:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "invalid date converstion from nsdate components %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:filterOperator:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "No values provided for string key: %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:filterOperator:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "No values provided for number key: %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:filterOperator:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "No values provided for date key: %@", v2, v3, v4, v5, v6);
}

- (void)tagRangeWithSceneFilters:()UserAttributedQueryString withCSSceneTypes:sceneIDs:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "No values provided for scene filters or count of scene types and ids not same.", v1, 2u);
}

- (void)_tagRangeWithFilters:()UserAttributedQueryString key:filters:filterOp:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "Empty filters provided for key: %@", v2, v3, v4, v5, v6);
}

@end