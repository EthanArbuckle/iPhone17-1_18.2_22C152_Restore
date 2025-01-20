@interface _DPRecordQueryPredicates
+ (id)entityForKey:(id)a3;
+ (id)predicateForAllRecords;
+ (id)predicateForKey:(id)a3;
+ (id)predicateForKey:(id)a3 beginsWith:(BOOL)a4 matchReportVersion:(BOOL)a5;
+ (id)predicateForKey:(id)a3 beginsWith:(BOOL)a4 submitted:(BOOL)a5 matchReportVersion:(BOOL)a6;
+ (id)predicateForKeyBeginsWith:(id)a3;
+ (id)predicateForRecordsInDateRangeStart:(id)a3 end:(id)a4;
+ (id)predicateForRecordsMatchingKey:(id)a3;
+ (id)predicateForRecordsNotSubmitted;
+ (id)predicateForRecordsNotSubmittedForKey:(id)a3;
+ (id)predicateForRecordsNotSubmittedForKeyBeginsWith:(id)a3;
+ (id)predicateForRecordsOlderThan:(id)a3;
+ (id)predicateForRecordsSubmitted;
+ (id)predicateForRecordsSubmittedForKey:(id)a3;
+ (id)predicateForRecordsWithVersionMismatch;
+ (void)initialize;
@end

@implementation _DPRecordQueryPredicates

+ (void)initialize
{
  kDPCurrentReportVersion = +[_DPJSONOutputHelper currentVersion];
}

+ (id)predicateForRecordsInDateRangeStart:(id)a3 end:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((creationDate >= %@) AND (creationDate <= %@))", a3, a4];
}

+ (id)predicateForRecordsOlderThan:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@", a3];
}

+ (id)predicateForRecordsWithVersionMismatch
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"reportVersion != %ld", kDPCurrentReportVersion);
}

+ (id)predicateForAllRecords
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

+ (id)predicateForRecordsNotSubmitted
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(submitted == NO)"];
}

+ (id)predicateForRecordsNotSubmittedForKey:(id)a3
{
  return (id)[a1 predicateForKey:a3 beginsWith:0 submitted:0 matchReportVersion:1];
}

+ (id)predicateForRecordsNotSubmittedForKeyBeginsWith:(id)a3
{
  return (id)[a1 predicateForKey:a3 beginsWith:1 submitted:0 matchReportVersion:1];
}

+ (id)predicateForRecordsSubmitted
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(submitted == YES)"];
}

+ (id)predicateForRecordsSubmittedForKey:(id)a3
{
  return (id)[a1 predicateForKey:a3 beginsWith:0 submitted:1 matchReportVersion:0];
}

+ (id)predicateForKey:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(key == %@)", a3];
}

+ (id)predicateForRecordsMatchingKey:(id)a3
{
  return (id)[a1 predicateForKey:a3 beginsWith:1 matchReportVersion:1];
}

+ (id)predicateForKeyBeginsWith:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(key BEGINSWITH %@)", a3];
}

+ (id)predicateForKey:(id)a3 beginsWith:(BOOL)a4 submitted:(BOOL)a5 matchReportVersion:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v17[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v7) {
    [a1 predicateForRecordsSubmitted];
  }
  else {
  v11 = [a1 predicateForRecordsNotSubmitted];
  }
  v12 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v11;
  v13 = [(id)objc_opt_class() predicateForKey:v10 beginsWith:v8 matchReportVersion:v6];

  v17[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v12 andPredicateWithSubpredicates:v14];

  return v15;
}

+ (id)predicateForKey:(id)a3 beginsWith:(BOOL)a4 matchReportVersion:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v6) {
    [a1 predicateForKeyBeginsWith:v8];
  }
  else {
  v9 = [a1 predicateForKey:v8];
  }
  id v10 = v9;
  if (v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"reportVersion == %ld", kDPCurrentReportVersion);
    v12 = (void *)MEMORY[0x1E4F28BA0];
    v16[0] = v10;
    v16[1] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v14 = [v12 andPredicateWithSubpredicates:v13];
  }
  else
  {
    id v14 = v9;
  }

  return v14;
}

+ (id)entityForKey:(id)a3
{
  v3 = +[_DPKeyNames keyPropertiesForKey:a3];
  v4 = v3;
  if (v3)
  {
    switch([v3 dataAlgorithm])
    {
      case 1:
        if ([v4 privatizationAlgorithm] != 3) {
          goto LABEL_13;
        }
        BOOL v5 = off_1E6C438B8;
        goto LABEL_17;
      case 2:
        unint64_t v6 = [v4 privatizationAlgorithm] - 1;
        if (v6 >= 0xA || ((0x28Bu >> v6) & 1) == 0) {
          goto LABEL_13;
        }
        BOOL v7 = off_1E6C44830;
        goto LABEL_16;
      case 3:
        uint64_t v8 = [v4 privatizationAlgorithm];
        if (v8 == 2)
        {
          BOOL v5 = off_1E6C43770;
        }
        else
        {
          if (v8 != 4) {
            goto LABEL_13;
          }
          BOOL v5 = off_1E6C43818;
        }
LABEL_17:
        v9 = [(__objc2_class *)*v5 entityName];
        break;
      case 4:
        unint64_t v6 = [v4 privatizationAlgorithm] - 5;
        if (v6 >= 0xF || ((0x7FD3u >> v6) & 1) == 0) {
          goto LABEL_13;
        }
        BOOL v7 = off_1E6C44880;
LABEL_16:
        BOOL v5 = v7[v6];
        goto LABEL_17;
      default:
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    v9 = 0;
  }

  return v9;
}

@end