@interface AXAuditCategory
- (AXAuditCaseResult)currentCaseResult;
- (AXAuditCategory)init;
- (AXAuditCategoryDelegate)delegate;
- (AXAuditCategoryResult)_result;
- (BOOL)_isAppleInternalBuild;
- (BOOL)localIssueShouldRun:(id)a3;
- (BOOL)shouldRunAuditTestType:(id)a3;
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (BOOL)supportsAuditTestType:(id)a3;
- (NSArray)caseSelectorsForAuditing;
- (NSMutableArray)_currentTestingCaseSelectors;
- (NSSet)allSupportedAuditTypes;
- (NSSet)currentAuditTypesToTestFor;
- (NSString)lastCaseSelectorFinishedName;
- (NSString)title;
- (id)_availableCasesDescription;
- (id)caseStartedForSelectorName:(id)a3;
- (id)description;
- (id)result;
- (int)targetPid;
- (unint64_t)categoryType;
- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4;
- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6;
- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6 mlGeneratedDescription:(id)a7;
- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6 mlGeneratedDescription:(id)a7 longDescExtraInfo:(id)a8 elementText:(id)a9;
- (void)caseEndedForSelectorName:(id)a3 result:(id)a4;
- (void)run;
- (void)setCaseSelectorsForAuditing:(id)a3;
- (void)setCategoryType:(unint64_t)a3;
- (void)setCurrentAuditTypesToTestFor:(id)a3;
- (void)setCurrentCaseResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastCaseSelectorFinishedName:(id)a3;
- (void)setTargetPid:(int)a3;
- (void)setTitle:(id)a3;
- (void)set_currentTestingCaseSelectors:(id)a3;
- (void)set_result:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation AXAuditCategory

- (AXAuditCategory)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditCategory;
  v2 = [(AXAuditCategory *)&v7 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    title = v2->_title;
    v2->_title = (NSString *)v4;

    AXDevicePrimeDisplayManager();
  }
  return v2;
}

- (BOOL)localIssueShouldRun:(id)a3
{
  id v4 = a3;
  v5 = +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    objc_super v7 = [(AXAuditCategory *)self currentAuditTypesToTestFor];
    char v8 = [v7 containsObject:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSSet)allSupportedAuditTypes
{
  return 0;
}

- (NSArray)caseSelectorsForAuditing
{
  return 0;
}

- (BOOL)shouldRunAuditTestType:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditCategory *)self currentAuditTypesToTestFor];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)supportsAuditTestType:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditCategory *)self allSupportedAuditTypes];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_availableCasesDescription
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(AXAuditCategory *)self caseSelectorsForAuditing];
  objc_msgSend(v3, "appendFormat:", @"\nContains %i test cases {\n", objc_msgSend(v4, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(AXAuditCategory *)self caseSelectorsForAuditing];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 appendFormat:@"   %@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 appendString:@"}\n"];
  v10 = (void *)[v3 copy];

  return v10;
}

- (id)description
{
  v3 = objc_opt_new();
  v10.receiver = self;
  v10.super_class = (Class)AXAuditCategory;
  id v4 = [(AXAuditCategory *)&v10 description];
  [v3 appendString:v4];

  v5 = [(AXAuditCategory *)self title];
  if ([v5 length]) {
    [v3 appendFormat:@" %@", v5];
  }
  uint64_t v6 = [(AXAuditCategory *)self _availableCasesDescription];
  uint64_t v7 = (void *)[v6 mutableCopy];

  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\n   ", 1, 0, objc_msgSend(v7, "length"));
  [v3 appendString:v7];
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (void)setTitle:(id)a3
{
  id v4 = (NSString *)a3;
  v5 = [(AXAuditCategory *)self _result];
  [v5 setTitle:v4];

  title = self->_title;
  self->_title = v4;
}

- (id)result
{
  v3 = [(AXAuditCategory *)self _result];
  if (!v3)
  {
    v3 = objc_opt_new();
    id v4 = [(AXAuditCategory *)self title];
    [v3 setTitle:v4];

    [(AXAuditCategory *)self set_result:v3];
  }

  return v3;
}

- (unint64_t)categoryType
{
  if (self->_categoryType - 1 >= 3) {
    return 1;
  }
  else {
    return self->_categoryType;
  }
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return 0;
}

- (void)run
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(AXAuditCategory *)self start];
  v3 = [(AXAuditCategory *)self caseSelectorsForAuditing];
  id v4 = [(AXAuditCategory *)self _currentTestingCaseSelectors];
  [v4 removeAllObjects];

  v5 = [MEMORY[0x263EFF980] array];
  [(AXAuditCategory *)self set_currentTestingCaseSelectors:v5];

  uint64_t v6 = [(AXAuditCategory *)self currentAuditTypesToTestFor];
  if (![v6 count])
  {

    goto LABEL_14;
  }
  uint64_t v7 = [v3 count];

  if (!v7)
  {
LABEL_14:
    [(AXAuditCategory *)self stop];
    goto LABEL_15;
  }
  uint64_t v8 = [(AXAuditCategory *)self _currentTestingCaseSelectors];
  [v8 addObjectsFromArray:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = NSSelectorFromString(*(NSString **)(*((void *)&v15 + 1) + 8 * v13));
        if (v14) {
          objc_msgSend(self, v14, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

LABEL_15:
}

- (void)start
{
  id v6 = [(AXAuditCategory *)self result];
  [v6 appendLog:@"\n"];
  [v6 appendLog:@"===================================================================="];
  if ([(AXAuditCategory *)self targetPid])
  {
    objc_msgSend(NSString, "stringWithFormat:", @" (against pid: %i)", -[AXAuditCategory targetPid](self, "targetPid"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_26FB6E0B0;
  }
  id v4 = [(AXAuditCategory *)self title];
  [v6 appendLog:@"Test Starting: %@%@", v4, v3];

  v5 = [MEMORY[0x263EFF910] date];
  [v6 setStartTime:v5];
}

- (void)stop
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(AXAuditCategory *)self result];
  id v4 = [MEMORY[0x263EFF910] date];
  [v3 setEndTime:v4];

  [v3 appendLog:@"\n"];
  v5 = [(AXAuditCategory *)self title];
  id v6 = [v3 executionTimeString];
  [v3 appendLog:@"Test Complete: %@ -- Execution time:%@", v5, v6];

  uint64_t v7 = [v3 issueCount];
  if (v7)
  {
    if (v7 == 1) {
      objc_msgSend(NSString, "stringWithFormat:", @"Found %i issue", 1);
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"Found %i issues", v7);
    }
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = @"No issues";
  }
  [v3 appendLog:v8];
  [v3 appendLog:@"====================================================================\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [v3 issueSummaryStrings];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendLog:*(void *)(*((void *)&v15 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [v3 appendLog:@"\n"];
  [v3 appendLog:@"===================================================================="];
  long long v14 = [(AXAuditCategory *)self delegate];
  [v14 didCompleteCategory:self];
}

- (id)caseStartedForSelectorName:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditCategory *)self currentCaseResult];

  if (v5)
  {
    double v6 = 0.0;
    do
    {
      [MEMORY[0x263F08B88] sleepForTimeInterval:1.0];
      uint64_t v7 = [(AXAuditCategory *)self currentCaseResult];

      if (!v7) {
        break;
      }
      double v6 = v6 + 1.0;
    }
    while (v6 < 20.0);
  }
  uint64_t v8 = [(AXAuditCategory *)self result];
  id v9 = objc_opt_new();
  [v8 addCaseResult:v9];
  [(AXAuditCategory *)self setCurrentCaseResult:v9];
  [v8 appendLog:@"===================================================================="];
  [v8 appendLog:@"Case Starting %@", v4];
  [v9 setCaseTitle:v4];
  uint64_t v10 = [MEMORY[0x263EFF910] date];
  [v9 setStartTime:v10];

  return v9;
}

- (void)caseEndedForSelectorName:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [(AXAuditCategory *)self result];
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  [v6 setEndTime:v8];

  id v9 = [v6 executionTimeString];

  [v13 appendLog:@"Case Complete: %@ -- Execution time:%@", v7, v9];
  [v13 appendLog:@"====================================================================\n"];
  [(AXAuditCategory *)self setCurrentCaseResult:0];
  uint64_t v10 = [(AXAuditCategory *)self _currentTestingCaseSelectors];
  [v10 removeObject:v7];

  [(AXAuditCategory *)self setLastCaseSelectorFinishedName:v7];
  uint64_t v11 = [(AXAuditCategory *)self _currentTestingCaseSelectors];
  uint64_t v12 = [v11 count];

  if (!v12) {
    [(AXAuditCategory *)self stop];
  }
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4
{
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6
{
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6 mlGeneratedDescription:(id)a7
{
}

- (BOOL)_isAppleInternalBuild
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6 mlGeneratedDescription:(id)a7 longDescExtraInfo:(id)a8 elementText:(id)a9
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v24 = +[AXAuditIssue auditIssueForClassification:a3];
  v25 = [v19 axElement];
  v26 = v25;
  v32 = self;
  if (!v25)
  {
    if ([(AXAuditCategory *)self _isAppleInternalBuild]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  pid_t pid = 0;
  if (AXUIElementGetPid((AXUIElementRef)[v25 elementRef], &pid)
    || !AuditDoesAllowDeveloperAttributes(pid))
  {
LABEL_6:

    id v23 = 0;
  }
LABEL_7:
  v27 = +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping];
  v28 = [NSNumber numberWithLong:a3];
  v29 = [v27 objectForKey:v28];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v24 setAuditTestType:v29];
    [v24 setAuditElement:v19];
    [v24 setElementDescription:v20];
    objc_msgSend(v24, "setElementRect:", x, y, width, height);
    [v24 setLongDescExtraInfo:v22];
    [v24 setElementText:v23];
    [v24 setMlGeneratedDescription:v21];
    v30 = [(AXAuditCategory *)v32 currentCaseResult];
    [v30 addAuditIssue:v24];
    v31 = [(AXAuditCategory *)v32 delegate];
    [v31 auditCategory:v32 didEncounterIssue:v24];
  }
}

- (AXAuditCategoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXAuditCategoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (NSSet)currentAuditTypesToTestFor
{
  return self->_currentAuditTypesToTestFor;
}

- (void)setCurrentAuditTypesToTestFor:(id)a3
{
}

- (void)setCaseSelectorsForAuditing:(id)a3
{
}

- (NSString)lastCaseSelectorFinishedName
{
  return self->_lastCaseSelectorFinishedName;
}

- (void)setLastCaseSelectorFinishedName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (AXAuditCaseResult)currentCaseResult
{
  return self->_currentCaseResult;
}

- (void)setCurrentCaseResult:(id)a3
{
}

- (NSMutableArray)_currentTestingCaseSelectors
{
  return self->__currentTestingCaseSelectors;
}

- (void)set_currentTestingCaseSelectors:(id)a3
{
}

- (AXAuditCategoryResult)_result
{
  return self->__result;
}

- (void)set_result:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__result, 0);
  objc_storeStrong((id *)&self->__currentTestingCaseSelectors, 0);
  objc_storeStrong((id *)&self->_currentCaseResult, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastCaseSelectorFinishedName, 0);
  objc_storeStrong((id *)&self->_caseSelectorsForAuditing, 0);
  objc_storeStrong((id *)&self->_currentAuditTypesToTestFor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end