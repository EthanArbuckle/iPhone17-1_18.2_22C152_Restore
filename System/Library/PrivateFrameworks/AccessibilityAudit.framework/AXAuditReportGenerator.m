@interface AXAuditReportGenerator
- (AXAuditReportGenerator)init;
- (NSMutableArray)_issues;
- (NSMutableDictionary)_auditScreenToIssuesMapping;
- (NSString)deviceName;
- (id)_anyAuditIssueFromResults:(id)a3;
- (id)_fileExtensionForReportType:(int64_t)a3;
- (id)_fullOutputPathForReportType:(int64_t)a3 outputPath:(id)a4 outputFilename:(id)a5;
- (id)_generateHTMLSourceFromTemplates;
- (id)_htmlTemplate;
- (id)_htmlTemplatePath;
- (id)_jsonArrayForIssues:(id)a3 screenName:(id)a4;
- (id)_jsonData;
- (id)_jsonDictionary;
- (id)_jsonDictionaryForAuditIssueImage:(id)a3 thumbnailOnly:(BOOL)a4;
- (id)_jsonDictionaryForIssue:(id)a3 screenName:(id)a4;
- (id)_jsonDictionaryForScreen:(id)a3 issuesOnScreen:(id)a4;
- (id)_jsonString;
- (id)_locStringForKey:(id)a3;
- (id)generateReportType:(int64_t)a3 outputPath:(id)a4 outputFilename:(id)a5 error:(id *)a6;
- (id)imageDataForIssue:(id)a3 thumbnailOnly:(BOOL)a4;
- (id)reportHeaderForIssues:(id)a3;
- (id)textDescriptionForIssues:(id)a3;
- (void)_generateMapOfScreensToIssues:(id)a3;
- (void)_processScreenshotsForAXAuditResult:(id)a3 completion:(id)a4;
- (void)appendIssues:(id)a3;
- (void)generateXCTestReportType:(int64_t)a3 forAuditResult:(id)a4 completion:(id)a5;
- (void)setDeviceName:(id)a3;
- (void)set_auditScreenToIssuesMapping:(id)a3;
- (void)set_issues:(id)a3;
@end

@implementation AXAuditReportGenerator

- (AXAuditReportGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXAuditReportGenerator;
  v2 = [(AXAuditReportGenerator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    issues = v2->__issues;
    v2->__issues = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    auditScreenToIssuesMapping = v2->__auditScreenToIssuesMapping;
    v2->__auditScreenToIssuesMapping = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)appendIssues:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v4 = [(AXAuditReportGenerator *)self _issues];
    [v4 addObjectsFromArray:v5];
  }
  [(AXAuditReportGenerator *)self _generateMapOfScreensToIssues:v5];
}

- (void)_generateMapOfScreensToIssues:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__AXAuditReportGenerator__generateMapOfScreensToIssues___block_invoke;
  v3[3] = &unk_26520D658;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __56__AXAuditReportGenerator__generateMapOfScreensToIssues___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 timeStamp];
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) _auditScreenToIssuesMapping];
    id v5 = [v4 objectForKey:v3];

    if (!v5)
    {
      id v5 = objc_opt_new();
      v6 = [*(id *)(a1 + 32) _auditScreenToIssuesMapping];
      [v6 setObject:v5 forKey:v3];
    }
    [v5 addObject:v7];
  }
}

- (id)_fileExtensionForReportType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"txt";
  }
  else {
    return off_26520D6F0[a3];
  }
}

- (id)_fullOutputPathForReportType:(int64_t)a3 outputPath:(id)a4 outputFilename:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = [(AXAuditReportGenerator *)self _defaultSavePath];
  }
  if (![v9 length])
  {
    v10 = [(AXAuditReportGenerator *)self _issues];
    v11 = [v10 firstObject];

    v12 = [v11 timeStamp];
    if (v12)
    {
      v13 = v12;
      v14 = [v12 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

      v15 = [v14 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    }
    else
    {
      v14 = objc_opt_new();
      v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
      v17 = [MEMORY[0x263EFFA18] systemTimeZone];
      [v14 setTimeZone:v17];

      [v14 setDateFormat:@"yyyy-MM-dd_HH-mm:ss"];
      v15 = [v14 stringFromDate:v16];
    }
    v18 = [NSString stringWithFormat:@"AuditReport_%@", v15];

    v19 = [(AXAuditReportGenerator *)self _fileExtensionForReportType:a3];
    id v9 = [v18 stringByAppendingPathExtension:v19];
  }
  v20 = [v8 stringByAppendingPathComponent:v9];

  return v20;
}

- (void)generateXCTestReportType:(int64_t)a3 forAuditResult:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  id v18 = 0;
  v10 = +[AXAuditScreenshotManager sharedManager];
  [v10 clear];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__AXAuditReportGenerator_generateXCTestReportType_forAuditResult_completion___block_invoke;
  v12[3] = &unk_26520D680;
  int64_t v16 = a3;
  v14 = v19;
  v12[4] = self;
  id v11 = v9;
  id v13 = v11;
  v15 = v17;
  [(AXAuditReportGenerator *)self _processScreenshotsForAXAuditResult:v8 completion:v12];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

uint64_t __77__AXAuditReportGenerator_generateXCTestReportType_forAuditResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2 == 3)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _jsonString];
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    uint64_t v3 = [*(id *)(a1 + 32) _generateHTMLSourceFromTemplates];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

LABEL_6:
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)_processScreenshotsForAXAuditResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [v6 auditIssues];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [v6 auditIssues];
    id v11 = (void *)[v10 mutableCopy];
    [(AXAuditReportGenerator *)self set_issues:v11];

    v12 = +[AXAuditScreenshotManager sharedManager];
    id v13 = [v6 auditIssues];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        int64_t v16 = [v6 auditIssues];
        v17 = [v16 objectAtIndexedSubscript:i];

        id v18 = [v6 screenshotInfoDictionaryForAuditIssue:v17];
        v19 = [v17 timeStamp];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __73__AXAuditReportGenerator__processScreenshotsForAXAuditResult_completion___block_invoke;
        v20[3] = &unk_26520D6A8;
        int v23 = i;
        uint64_t v22 = v14;
        v21 = v7;
        [v12 addScreenshotWithInfo:v18 timestamp:v19 completion:v20];
      }
    }
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __73__AXAuditReportGenerator__processScreenshotsForAXAuditResult_completion___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) - 1 == *(_DWORD *)(result + 48)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)generateReportType:(int64_t)a3 outputPath:(id)a4 outputFilename:(id)a5 error:(id *)a6
{
  uint64_t v9 = [(AXAuditReportGenerator *)self _fullOutputPathForReportType:a3 outputPath:a4 outputFilename:a5];
  if (a3 == 3)
  {
    v10 = [(AXAuditReportGenerator *)self _jsonString];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v10 = [(AXAuditReportGenerator *)self _generateHTMLSourceFromTemplates];
  }
  id v11 = v10;
  [v10 writeToFile:v9 atomically:1 encoding:4 error:a6];

LABEL_6:
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = &stru_26FB6E0B0;
  }
  id v13 = v12;

  return v13;
}

- (id)_locStringForKey:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__AXAuditReportGenerator__locStringForKey___block_invoke;
  block[3] = &unk_26520D308;
  block[4] = self;
  uint64_t v3 = _locStringForKey__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_locStringForKey__onceToken, block);
  }
  id v5 = [(id)_locStringForKey__myBundle localizedStringForKey:v4 value:v4 table:@"Localizable"];

  return v5;
}

uint64_t __43__AXAuditReportGenerator__locStringForKey___block_invoke()
{
  _locStringForKey__myBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

- (id)reportHeaderForIssues:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(AXAuditReportGenerator *)self _locStringForKey:@"axAuditReport"];
  id v8 = [(AXAuditReportGenerator *)self _locStringForKey:@"timeStamp"];
  uint64_t v9 = [v5 firstObject];
  v10 = [v9 timeStamp];
  id v11 = [(AXAuditReportGenerator *)self _locStringForKey:@"device"];
  v12 = [(AXAuditReportGenerator *)self deviceName];
  id v13 = [(AXAuditReportGenerator *)self _locStringForKey:@"numOfIssuesFound"];
  uint64_t v14 = [v5 count];

  v15 = (void *)[v6 initWithFormat:@"%@\n%@: %@\n%@: %@\n%@: %ld\n\n", v7, v8, v10, v11, v12, v13, v14];

  return v15;
}

- (id)textDescriptionForIssues:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = &stru_26FB6E0B0;
  if ([v4 count])
  {
    id v6 = objc_opt_new();
    id v7 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
    id v8 = [(AXAuditReportGenerator *)self reportHeaderForIssues:v4];
    [(__CFString *)v7 appendString:v8];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v4;
    id obj = v4;
    uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v26;
      uint64_t v24 = 1;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = [v10 issueClassification];
          v12 = [v6 shortTitleForAuditIssue:v10];
          id v13 = [v6 longDescriptionForAuditIssue:v10];
          id v14 = [NSString alloc];
          v15 = [(AXAuditReportGenerator *)self _locStringForKey:@"issue"];
          int64_t v16 = [(AXAuditReportGenerator *)self _locStringForKey:@"errorCode"];
          v17 = (void *)[v14 initWithFormat:@"\n%@ %ld: %@\n%@: %ld\n%@\n", v15, v24 + i, v12, v16, v11, v13];

          [(__CFString *)v7 appendString:v17];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        v24 += i;
      }
      while (v23);
    }

    id v18 = &stru_26FB6E0B0;
    if (v7) {
      id v18 = v7;
    }
    id v5 = v18;

    id v4 = v20;
  }

  return v5;
}

- (id)imageDataForIssue:(id)a3 thumbnailOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[AXAuditScreenshotManager sharedManager];
  id v7 = [v5 timeStamp];
  [v6 screenshotScaleFactorForTimestamp:v7];
  double v9 = v8;

  if (v4) {
    [v6 thumbnailImageOfIssue:v5];
  }
  else {
  v10 = [v6 screenshotForIssue:v5 elementRect:0];
  }

  [v10 size];
  int v12 = (int)(v11 / v9);
  int v14 = (int)(v13 / v9);
  if (v12 < 1 || v14 < 1)
  {
    v21 = 0;
  }
  else
  {
    CGFloat v16 = (double)v14;
    CGFloat v17 = (double)v12;
    v24.width = (double)v12;
    v24.height = (double)v14;
    UIGraphicsBeginImageContext(v24);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v16);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v19 = (CGImage *)[v10 CGImage];
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = v17;
    v25.size.height = v16;
    CGContextDrawImage(CurrentContext, v25, v19);
    UIGraphicsGetImageFromCurrentImageContext();
    id v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v21 = UIImageJPEGRepresentation(v20, 0.75);
  }

  return v21;
}

- (id)_htmlTemplatePath
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"AuditReport" ofType:@"html"];

  return v3;
}

- (id)_htmlTemplate
{
  uint64_t v2 = [(AXAuditReportGenerator *)self _htmlTemplatePath];
  if ([v2 length])
  {
    uint64_t v3 = [NSString stringWithContentsOfFile:v2 encoding:4 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_generateHTMLSourceFromTemplates
{
  uint64_t v3 = [(AXAuditReportGenerator *)self _htmlTemplate];
  BOOL v4 = (void *)[v3 mutableCopy];

  id v5 = [(AXAuditReportGenerator *)self _jsonString];
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"[[JSON_OBJ_REPLACE]]", v5, 2, 0, objc_msgSend(v4, "length"));

  return v4;
}

- (id)_jsonDictionaryForIssue:(id)a3 screenName:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  double v8 = objc_opt_new();
  uint64_t v9 = [v5 issueClassification];
  v10 = [v8 longDescriptionForAuditIssue:v5];
  v35 = [v8 longDescExtraInfoForAuditIssue:v5];
  double v11 = [v8 shortTitleForAuditIssue:v5];
  v34 = [v5 screenGroupId];
  uint64_t v12 = [v5 isDuplicate];
  v33 = [v8 humanReadableDescriptionForAuditIssueTestType:v5];
  double v13 = [NSNumber numberWithLong:v9];
  [v7 setObject:v13 forKey:@"_axKeyErrorCode"];

  int v14 = [v8 suggestionDescriptionForAuditIssue:v5];
  if ([v11 length]) {
    [v7 setObject:v11 forKey:@"_axKeyShortDesc"];
  }
  uint64_t v30 = v11;
  if ([v10 length]) {
    [v7 setObject:v10 forKey:@"_axKeyLongDesc"];
  }
  if ([v35 length]) {
    [v7 setObject:v35 forKey:@"_axKeyLongDescExtraInfo"];
  }
  v15 = [v5 elementText];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    CGFloat v17 = [v5 elementText];
    [v7 setObject:v17 forKey:@"_axKeyElementText"];
  }
  if (v34)
  {
    [v7 setObject:v34 forKey:@"_axKeyScreenGroupName"];
    id v18 = v33;
    if (!v6) {
      goto LABEL_15;
    }
    v19 = @"_axKeyScreenName";
  }
  else
  {
    id v18 = v33;
    if (!v6) {
      goto LABEL_15;
    }
    [v7 setObject:v6 forKey:@"_axKeyScreenName"];
    v19 = @"_axKeyScreenGroupName";
  }
  [v7 setObject:v6 forKey:v19];
LABEL_15:
  v31 = v10;
  if (v18) {
    [v7 setObject:v18 forKey:@"_axKeyIssueTestType"];
  }
  v32 = v6;
  if (v14) {
    [v7 setObject:v14 forKey:@"_axKeyIssueSuggestion"];
  }
  id v20 = [NSNumber numberWithBool:v12];
  [v7 setObject:v20 forKey:@"_axKeyIssueIsDuplicate"];

  v21 = [(AXAuditReportGenerator *)self _jsonDictionaryForAuditIssueImage:v5 thumbnailOnly:1];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        long long v27 = [v21 objectForKeyedSubscript:v26];
        if (v27) {
          [v7 setObject:v27 forKey:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v23);
  }

  return v7;
}

- (id)_anyAuditIssueFromResults:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = objc_msgSend(v8, "caseResults", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              int v14 = [*(id *)(*((void *)&v17 + 1) + 8 * j) auditIssues];
              v15 = [v14 firstObject];

              if (v15)
              {

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)_jsonDictionaryForAuditIssueImage:(id)a3 thumbnailOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = +[AXAuditScreenshotManager sharedManager];
  id v7 = objc_opt_new();
  double v8 = [v5 timeStamp];
  [v6 screenshotScaleFactorForTimestamp:v8];
  uint64_t v58 = v9;

  uint64_t v10 = [v5 timeStamp];
  [v6 screenshotRotationForTimestamp:v10];
  double v12 = v11;

  double v13 = [v5 timeStamp];
  [v6 screenshotDisplayBoundsForTimestamp:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  long long v22 = (void *)MEMORY[0x24C54EC00]();
  if (v4) {
    [v6 thumbnailImageOfIssue:v5];
  }
  else {
  long long v23 = [v6 screenshotForIssue:v5 elementRect:0];
  }
  long long v24 = v23;
  if (v23)
  {
    [v23 size];
    double v26 = (double)(int)(v25 / *(double *)&v58);
    double v28 = (double)(int)(v27 / *(double *)&v58);
    v61.width = v26;
    v61.height = v28;
    UIGraphicsBeginImageContext(v61);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v28);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    uint64_t v30 = (CGImage *)[v24 CGImage];
    v62.origin.x = 0.0;
    v62.origin.y = 0.0;
    v62.size.width = v26;
    v62.size.height = v28;
    CGContextDrawImage(CurrentContext, v62, v30);
    UIGraphicsGetImageFromCurrentImageContext();
    v31 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v32 = UIImageJPEGRepresentation(v31, 0.75);
    v33 = [v32 base64EncodedStringWithOptions:0];
    if ([v33 length])
    {
      v55 = v32;
      v56 = v31;
      v57 = v22;
      v34 = [@"data:image/jpeg;base64," stringByAppendingString:v33];
      v35 = @"_axKeyImageFull";
      if (v4) {
        v35 = @"_axKeyImageThumbnail";
      }
      long long v36 = v35;
      long long v37 = objc_opt_new();
      [v37 setObject:v34 forKey:@"_axKeyImageData"];
      long long v38 = [NSNumber numberWithDouble:v26];
      [v37 setObject:v38 forKey:@"_axKeyImageWidth"];

      long long v39 = [NSNumber numberWithDouble:v28];
      [v37 setObject:v39 forKey:@"_axKeyImageHeight"];

      [v7 setObject:v37 forKey:v36];
      if (v4)
      {
        long long v40 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
        *(_OWORD *)v59 = *MEMORY[0x263F001A8];
        *(_OWORD *)&v59[16] = v40;
        uint64_t v41 = [v6 screenshotForIssue:v5 elementRect:v59];
        *(double *)v59 = *(double *)v59 / *(double *)&v58;
        *(float64x2_t *)&v59[8] = vdivq_f64(*(float64x2_t *)&v59[8], (float64x2_t)vdupq_lane_s64(v58, 0));
        *(double *)&v59[24] = *(double *)&v59[24] / *(double *)&v58;
        [v41 size];
        long long v43 = *(_OWORD *)v59;
        *(double *)&v59[8] = v42 / *(double *)&v58 - *(double *)&v59[24] - *(double *)&v59[8];
        v44 = [NSNumber numberWithDouble:*(double *)&v43];
        [v7 setObject:v44 forKey:@"_axKeyElementRectInScreenshotX"];

        v45 = [NSNumber numberWithDouble:*(double *)&v59[8]];
        [v7 setObject:v45 forKey:@"_axKeyElementRectInScreenshotY"];

        v46 = [NSNumber numberWithDouble:*(double *)&v59[16]];
        [v7 setObject:v46 forKey:@"_axKeyElementRectInScreenshotWidth"];

        v47 = [NSNumber numberWithDouble:*(double *)&v59[24]];
        [v7 setObject:v47 forKey:@"_axKeyElementRectInScreenshotHeight"];
      }
      else
      {
        v48 = [NSNumber numberWithDouble:v15];
        [v7 setObject:v48 forKey:@"_axKeyDisplayBoundsXPx"];

        v49 = [NSNumber numberWithDouble:v17];
        [v7 setObject:v49 forKey:@"_axKeyDisplayBoundsYPx"];

        v50 = [NSNumber numberWithDouble:v19];
        [v7 setObject:v50 forKey:@"_axKeyDisplayBoundsWidthPx"];

        v51 = [NSNumber numberWithDouble:v21];
        [v7 setObject:v51 forKey:@"_axKeyDisplayBoundsHeightPx"];

        v52 = [NSNumber numberWithDouble:*(double *)&v58];
        [v7 setObject:v52 forKey:@"_axKeyScreenshotScale"];

        v53 = [NSNumber numberWithDouble:v12];
        [v7 setObject:v53 forKey:@"_axKeyScreenshotRotation"];
      }
      v31 = v56;
      long long v22 = v57;
      v32 = v55;
    }
  }

  return v7;
}

- (id)_jsonArrayForIssues:(id)a3 screenName:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = -[AXAuditReportGenerator _jsonDictionaryForIssue:screenName:](self, "_jsonDictionaryForIssue:screenName:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_jsonDictionaryForScreen:(id)a3 issuesOnScreen:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_opt_new();
  id v9 = [(AXAuditReportGenerator *)self _jsonArrayForIssues:v7 screenName:v6];
  [v8 setObject:v6 forKeyedSubscript:@"_axKeyScreenName"];
  if (v9 && [v9 count])
  {
    [v8 setObject:v9 forKeyedSubscript:@"_axKeyAllIssues"];
    uint64_t v21 = [v9 objectAtIndexedSubscript:0];
    id v10 = [v21 objectForKeyedSubscript:@"_axKeyScreenGroupName"];
    if (!v10) {
      id v10 = v6;
    }
    double v20 = v10;
    [v8 setObject:v10 forKeyedSubscript:@"_axKeyScreenGroupName"];
    long long v19 = [v7 firstObject];
    uint64_t v11 = -[AXAuditReportGenerator _jsonDictionaryForAuditIssueImage:thumbnailOnly:](self, "_jsonDictionaryForAuditIssueImage:thumbnailOnly:");
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          long long v17 = [v11 objectForKeyedSubscript:v16];
          if (v17) {
            [v8 setObject:v17 forKey:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }

  return v8;
}

- (id)_jsonDictionary
{
  id v3 = objc_opt_new();
  BOOL v4 = objc_opt_new();
  [v3 setObject:v4 forKeyedSubscript:@"_axKeyAllScreens"];

  id v5 = [(AXAuditReportGenerator *)self _auditScreenToIssuesMapping];
  id v6 = [v5 allKeys];

  if ([v6 count])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __41__AXAuditReportGenerator__jsonDictionary__block_invoke;
    v14[3] = &unk_26520D6D0;
    v14[4] = self;
    id v7 = v3;
    id v15 = v7;
    [v6 enumerateObjectsUsingBlock:v14];
    id v8 = v7;
  }
  else
  {
    id v9 = [(AXAuditReportGenerator *)self _issues];
    id v10 = [(AXAuditReportGenerator *)self _jsonDictionaryForScreen:@"Screen1" issuesOnScreen:v9];

    uint64_t v11 = [v3 objectForKeyedSubscript:@"_axKeyAllScreens"];
    [v11 addObject:v10];
    id v12 = v3;
  }

  return v3;
}

void __41__AXAuditReportGenerator__jsonDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"%lu", a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [*(id *)(a1 + 32) _auditScreenToIssuesMapping];
  id v8 = [v7 objectForKey:v6];

  id v9 = [*(id *)(a1 + 32) _jsonDictionaryForScreen:v11 issuesOnScreen:v8];
  id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_axKeyAllScreens"];
  [v10 addObject:v9];
}

- (id)_jsonData
{
  uint64_t v2 = [(AXAuditReportGenerator *)self _jsonDictionary];
  if ([v2 count])
  {
    id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_jsonString
{
  uint64_t v2 = [(AXAuditReportGenerator *)self _jsonData];
  id v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];

  return v3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSMutableArray)_issues
{
  return self->__issues;
}

- (void)set_issues:(id)a3
{
}

- (NSMutableDictionary)_auditScreenToIssuesMapping
{
  return self->__auditScreenToIssuesMapping;
}

- (void)set_auditScreenToIssuesMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__auditScreenToIssuesMapping, 0);
  objc_storeStrong((id *)&self->__issues, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end