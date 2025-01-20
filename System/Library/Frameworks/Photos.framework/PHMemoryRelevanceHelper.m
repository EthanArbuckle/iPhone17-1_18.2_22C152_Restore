@interface PHMemoryRelevanceHelper
+ (BOOL)_isDate:(id)a3 inSameDayAndMonthAsDate:(id)a4;
+ (BOOL)_isMemoryCategoryTemporal:(unint64_t)a3;
+ (BOOL)_isMemorySubcategoryTemporal:(unint64_t)a3;
+ (BOOL)_isMemoryTemporal:(id)a3;
+ (BOOL)isMemory:(id)a3 proactiveWorthyAtDate:(id)a4;
+ (BOOL)isMemory:(id)a3 relevantAtDate:(id)a4;
+ (double)_categoryScoreComponentForMemory:(id)a3;
+ (double)_categoryWeightForMemory:(id)a3;
+ (double)_memoryTriggerTierScoreByTriggerType:(unint64_t)a3;
+ (double)_notificationLevelWeightForMemory:(id)a3;
+ (double)_notificationScoreComponentForMemory:(id)a3;
+ (double)_subcategoryWeightForMemory:(id)a3;
+ (double)_triggerScoreComponentForMemory:(id)a3;
+ (double)_triggerScoreForMemory:(id)a3;
+ (double)relevanceScoreForMemory:(id)a3 atDate:(id)a4;
@end

@implementation PHMemoryRelevanceHelper

+ (double)_memoryTriggerTierScoreByTriggerType:(unint64_t)a3
{
  double result = 0.0;
  if (a3 <= 0x1B) {
    return dbl_19B2CCA08[a3];
  }
  return result;
}

+ (double)_subcategoryWeightForMemory:(id)a3
{
  uint64_t v3 = [a3 subcategory];
  double result = 1.0;
  if (v3 > 300)
  {
    if (v3 > 403)
    {
      if ((unint64_t)(v3 - 1000) < 4) {
        return 0.2;
      }
      if (v3 != 404)
      {
        if (v3 != 1100) {
          return result;
        }
        return 0.2;
      }
    }
    else
    {
      if ((unint64_t)(v3 - 301) < 3 || (unint64_t)(v3 - 402) < 2) {
        return 0.2;
      }
      if (v3 != 401) {
        return result;
      }
    }
    return 0.6;
  }
  if (v3 > 200)
  {
    switch(v3)
    {
      case 201:
      case 202:
      case 203:
      case 204:
      case 208:
      case 209:
      case 213:
      case 215:
      case 216:
      case 218:
        return 0.6;
      case 205:
      case 206:
      case 212:
      case 214:
      case 217:
        return 0.8;
      case 207:
        return 0.2;
      case 211:
        return 0.4;
      default:
        return result;
    }
    return result;
  }
  if ((unint64_t)(v3 - 101) < 2) {
    return 0.8;
  }
  if (!v3) {
    return 0.2;
  }
  if (v3 == 103) {
    return 0.4;
  }
  return result;
}

+ (double)_categoryWeightForMemory:(id)a3
{
  uint64_t v3 = [a3 category];
  double result = 1.0;
  if (v3 <= 200)
  {
    if (v3 > 100)
    {
      if (v3 == 101) {
        return 0.8;
      }
      if (v3 != 102) {
        return result;
      }
    }
    else if (v3 && v3 != 100)
    {
      return result;
    }
    return 0.2;
  }
  if (v3 > 300)
  {
    if (v3 != 401 && v3 != 302)
    {
      if (v3 != 301) {
        return result;
      }
      return 0.8;
    }
    return 0.2;
  }
  switch(v3)
  {
    case 201:
      return 0.8;
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 211:
    case 216:
      return 0.2;
    case 209:
    case 210:
    case 215:
    case 218:
      double result = 0.6;
      break;
    case 214:
    case 217:
    case 219:
    case 220:
    case 221:
      double result = 0.4;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_triggerScoreForMemory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 triggerTypes];
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    double v11 = 0.0;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      +[PHMemoryRelevanceHelper _memoryTriggerTierScoreByTriggerType:](PHMemoryRelevanceHelper, "_memoryTriggerTierScoreByTriggerType:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "unsignedIntValue", (void)v16));
      if (v11 < v13) {
        double v11 = v13;
      }
      double v14 = 1.0;
      if (v11 == 1.0) {
        break;
      }
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        double v14 = v11;
        if (v9) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
}

+ (double)_notificationLevelWeightForMemory:(id)a3
{
  id v3 = a3;
  double v4 = 1.0;
  if (([v3 isMustSee] & 1) == 0)
  {
    if ([v3 isStellar])
    {
      double v4 = 0.8;
    }
    else if ([v3 isGreat])
    {
      double v4 = 0.6;
    }
    else
    {
      double v4 = 0.4;
    }
  }

  return v4;
}

+ (double)_triggerScoreComponentForMemory:(id)a3
{
  +[PHMemoryRelevanceHelper _triggerScoreForMemory:a3];
  return v3 * 0.25;
}

+ (double)_categoryScoreComponentForMemory:(id)a3
{
  id v3 = a3;
  if ([v3 subcategory]) {
    +[PHMemoryRelevanceHelper _subcategoryWeightForMemory:v3];
  }
  else {
    +[PHMemoryRelevanceHelper _categoryWeightForMemory:v3];
  }
  double v5 = v4;

  return v5 * 0.5;
}

+ (double)_notificationScoreComponentForMemory:(id)a3
{
  +[PHMemoryRelevanceHelper _notificationLevelWeightForMemory:a3];
  return v3 * 0.25;
}

+ (BOOL)_isDate:(id)a3 inSameDayAndMonthAsDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([v7 isDate:v5 inSameDayAsDate:v6])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [v7 components:24 fromDate:v5];
    uint64_t v10 = [v7 components:24 fromDate:v6];
    uint64_t v11 = [v9 month];
    if (v11 == [v10 month])
    {
      uint64_t v12 = [v9 day];
      BOOL v8 = v12 == [v10 day];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (BOOL)_isMemorySubcategoryTemporal:(unint64_t)a3
{
  return a3 == 210;
}

+ (BOOL)_isMemoryCategoryTemporal:(unint64_t)a3
{
  return (a3 - 202 < 0xC) & (0xC01u >> (a3 + 54));
}

+ (BOOL)_isMemoryTemporal:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PHMemoryRelevanceHelper _isMemoryCategoryTemporal:](PHMemoryRelevanceHelper, "_isMemoryCategoryTemporal:", [v3 category])|| +[PHMemoryRelevanceHelper _isMemorySubcategoryTemporal:](PHMemoryRelevanceHelper, "_isMemorySubcategoryTemporal:", objc_msgSend(v3, "subcategory"));

  return v4;
}

+ (BOOL)isMemory:(id)a3 proactiveWorthyAtDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 featuredState] == 1
    && ([v6 creationDate],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceDate:v8],
        double v10 = v9,
        v8,
        v10 <= 86400.0))
  {
    char v11 = [a1 isMemory:v6 relevantAtDate:v7];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)isMemory:(id)a3 relevantAtDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[PHMemoryRelevanceHelper _isMemoryTemporal:v5])
  {
    id v7 = [v5 creationDate];
    BOOL v8 = +[PHMemoryRelevanceHelper _isDate:v7 inSameDayAndMonthAsDate:v6];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (double)relevanceScoreForMemory:(id)a3 atDate:(id)a4
{
  id v5 = a3;
  double v6 = 0.0;
  if (+[PHMemoryRelevanceHelper isMemory:v5 relevantAtDate:a4])
  {
    +[PHMemoryRelevanceHelper _notificationScoreComponentForMemory:v5];
    double v8 = v7;
    +[PHMemoryRelevanceHelper _categoryScoreComponentForMemory:v5];
    double v10 = v9;
    +[PHMemoryRelevanceHelper _triggerScoreComponentForMemory:v5];
    double v6 = v8 + v10 + v11;
  }

  return v6;
}

@end