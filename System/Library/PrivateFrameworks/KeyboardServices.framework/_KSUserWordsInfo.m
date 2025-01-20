@interface _KSUserWordsInfo
+ (id)filesForLanguage:(id)a3;
+ (id)infoWithFiles:(id)a3;
+ (id)infoWithRecord:(id)a3;
+ (id)keyForData;
+ (id)keyNamesExcludingData;
+ (id)keyboardDirectory;
- (BOOL)isBetterThan:(id)a3;
- (_KSUserWordsInfo)initWithFiles:(id)a3;
- (_KSUserWordsInfo)initWithRecord:(id)a3;
- (id)description;
- (void)saveToRecord:(id)a3;
@end

@implementation _KSUserWordsInfo

+ (id)keyNamesExcludingData
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"DynSize";
  v4[1] = @"DynDate";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)keyForData
{
  return @"Data";
}

+ (id)keyboardDirectory
{
  return +[_KSUtilities keyboardDirectory];
}

+ (id)filesForLanguage:(id)a3
{
  id v4 = a3;
  v5 = [[_KSFileDirectory alloc] initWithName:&stru_26DE8B7B0];
  v6 = [a1 keyboardDirectory];
  if ([v4 isEqualToString:@"SharedAcrossLanguagesNegativeLearning"])
  {
    v7 = NSURL;
    v8 = [v6 stringByAppendingPathComponent:@"AutocorrectionRejections.db"];
    v9 = [v7 fileURLWithPath:v8];

    if ([v9 checkResourceIsReachableAndReturnError:0])
    {
LABEL_3:
      v10 = [[_KSFileFile alloc] initWithURL:v9];
      [(_KSFileDirectory *)v5 addEntry:v10];
LABEL_20:
    }
LABEL_21:

    goto LABEL_22;
  }
  if ([v4 isEqualToString:@"SharedAcrossLanguagesVulgarWordUsage"])
  {
    v11 = NSURL;
    v12 = [v6 stringByAppendingPathComponent:@"VulgarWordUsage.db"];
    v9 = [v11 fileURLWithPath:v12];

    if ([v9 checkResourceIsReachableAndReturnError:0]) {
      goto LABEL_3;
    }
    goto LABEL_21;
  }
  v13 = _KSGetSetting(ksDefaultSaveDynamicData, MEMORY[0x263EFFA88]);
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    v15 = NSURL;
    id v16 = v4;
    if ([v16 isEqualToString:@"en_US"])
    {
      v17 = @"dynamic-text.dat";
    }
    else
    {
      v17 = [v16 stringByAppendingString:@"-dynamic-text.dat"];
    }

    v18 = [v6 stringByAppendingPathComponent:v17];
    v19 = [v15 fileURLWithPath:v18];

    if ([v19 checkResourceIsReachableAndReturnError:0])
    {
      v20 = [[_KSFileFile alloc] initWithURL:v19];
      [(_KSFileDirectory *)v5 addEntry:v20];
    }
  }
  v21 = _KSGetSetting(ksDefaultSaveLanguageModel, MEMORY[0x263EFFA88]);
  int v22 = [v21 BOOLValue];

  if (v22)
  {
    v23 = NSURL;
    v24 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
    v25 = [v24 objectForKey:*MEMORY[0x263EFF508]];
    v26 = [v24 objectForKey:*MEMORY[0x263EFF540]];
    if (v26) {
      [NSString stringWithFormat:@"%@_%@-dynamic.lm", v25, v26];
    }
    else {
    v27 = [NSString stringWithFormat:@"%@-dynamic.lm", v25];
    }

    v28 = [v6 stringByAppendingPathComponent:v27];
    v9 = [v23 fileURLWithPath:v28];

    if (![v9 checkResourceIsReachableAndReturnError:0]) {
      goto LABEL_21;
    }
    v10 = [[_KSFileDirectory alloc] initWithDirectory:v9 captureContents:1 storeRoot:1];
    [(_KSFileDirectory *)v5 addEntry:v10];
    goto LABEL_20;
  }
LABEL_22:

  v29 = [(_KSFileDirectory *)v5 contents];
  if (v29) {
    v30 = v5;
  }
  else {
    v30 = 0;
  }
  v31 = v30;

  return v31;
}

+ (id)infoWithFiles:(id)a3
{
  id v3 = a3;
  id v4 = [[_KSUserWordsInfo alloc] initWithFiles:v3];

  return v4;
}

+ (id)infoWithRecord:(id)a3
{
  id v3 = a3;
  id v4 = [[_KSUserWordsInfo alloc] initWithRecord:v3];

  return v4;
}

- (_KSUserWordsInfo)initWithFiles:(id)a3
{
  v56[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)_KSUserWordsInfo;
  v6 = [(_KSUserWordsInfo *)&v48 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_14;
  }
  id v47 = v5;
  p_file = (void **)&v6->_file;
  objc_storeStrong((id *)&v6->_file, a3);
  v9 = [MEMORY[0x263EFF9A0] dictionary];
  v10 = FindEntry(v7->_file, @"AutocorrectionRejections.db");
  v11 = v10;
  if (v10)
  {
    v55[0] = @"size";
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v10, "size"));
    v56[0] = v12;
    v55[1] = @"date";
    v13 = [v11 lastModified];
    v56[1] = v13;
    int v14 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    v15 = _KSGetSetting(ksDefaultSortNegativeLearning, &unk_26DE929F0);
    [v9 setObject:v14 forKey:v15];
  }
  v45 = v11;
  id v16 = FindEntry(*p_file, @"VulgarWordUsage.db");
  v17 = v16;
  if (v16)
  {
    v53[0] = @"size";
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v16, "size", v11));
    v53[1] = @"date";
    v54[0] = v18;
    v19 = [v17 lastModified];
    v54[1] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    v21 = _KSGetSetting(ksDefaultSortVulgarWordUsageDatabase, &unk_26DE929F0);
    [v9 setObject:v20 forKey:v21];
  }
  int v22 = FindEntry(*p_file, @"dynamic-text.dat");
  v23 = v22;
  if (v22)
  {
    v51[0] = @"size";
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v22, "size"));
    v51[1] = @"date";
    v52[0] = v24;
    v25 = [v23 lastModified];
    v52[1] = v25;
    v26 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    v27 = _KSGetSetting(ksDefaultSortDynamicData, &unk_26DE92A08);
    [v9 setObject:v26 forKey:v27];
  }
  v28 = FindEntry(*p_file, @"dynamic.lm");
  v29 = FindEntry(v28, @"dynamic.dat");
  v30 = v29;
  if (v29)
  {
    v49[0] = @"size";
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v29, "size"));
    v49[1] = @"date";
    v50[0] = v31;
    v32 = [v30 lastModified];
    v50[1] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    v34 = _KSGetSetting(ksDefaultSortLanguageModel, &unk_26DE92A20);
    [v9 setObject:v33 forKey:v34];
  }
  v35 = objc_msgSend(v9, "allKeys", v45);
  v36 = [v35 sortedArrayUsingComparator:&__block_literal_global_6];

  if (v36)
  {
    v37 = [v36 lastObject];
    v38 = [v9 objectForKey:v37];
  }
  else
  {
    v38 = 0;
  }
  id v5 = v47;
  uint64_t v39 = [v38 objectForKey:@"date"];
  modifiedDate = v7->_modifiedDate;
  v7->_modifiedDate = (NSDate *)v39;

  v41 = [v38 objectForKey:@"size"];
  v7->_size = (int)[v41 intValue];

  v42 = v7->_modifiedDate;
  if (!v42) {
    v43 = 0;
  }
  else {
LABEL_14:
  }
    v43 = v7;

  return v43;
}

- (_KSUserWordsInfo)initWithRecord:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSUserWordsInfo;
  id v5 = [(_KSUserWordsInfo *)&v11 init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 objectForKeyedSubscript:@"DynSize"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  v5->_size = (int)[v6 intValue];
  v7 = [v4 objectForKeyedSubscript:@"DynDate"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_9;
  }
  modifiedDate = v5->_modifiedDate;
  v5->_modifiedDate = v7;

LABEL_7:
  v9 = v5;
LABEL_10:

  return v9;
}

- (BOOL)isBetterThan:(id)a3
{
  if (!a3) {
    return 1;
  }
  double v4 = (double)self->_size - (double)*((unint64_t *)a3 + 2);
  id v5 = ksDefaultSizeNormalise;
  v6 = a3;
  v7 = _KSGetSetting(v5, &unk_26DE92A68);
  [v7 floatValue];
  double v9 = v4 * v8;

  modifiedDate = self->_modifiedDate;
  uint64_t v11 = v6[1];

  [(NSDate *)modifiedDate timeIntervalSinceDate:v11];
  double v13 = v12;
  int v14 = _KSGetSetting(ksDefaultDateNormalise, &unk_26DE92A78);
  [v14 floatValue];
  double v16 = v13 * v15;

  return v9 + v16 > 0.0;
}

- (void)saveToRecord:(id)a3
{
  double v4 = NSNumber;
  unint64_t size = self->_size;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLong:size];
  [v6 setObject:v7 forKeyedSubscript:@"DynSize"];

  [v6 setObject:self->_modifiedDate forKeyedSubscript:@"DynDate"];
  id v8 = objc_alloc(MEMORY[0x263EFD5E0]);
  id v10 = [(_KSFileEntry *)self->_file serialiseToTemporaryFile];
  double v9 = (void *)[v8 initWithFileURL:v10];
  [v6 setObject:v9 forKeyedSubscript:@"Data"];
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_KSUserWordsInfo;
  uint64_t v4 = [(_KSUserWordsInfo *)&v9 description];
  id v5 = (void *)v4;
  if (self->_file) {
    id v6 = @"; local";
  }
  else {
    id v6 = &stru_26DE8B7B0;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@; unint64_t size = %zu; date = %@%@>",
    v4,
    self->_size,
    self->_modifiedDate,
  v7 = v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
}

+ (void)filesForLanguage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "+[_KSUserWordsInfo filesForLanguage:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  Failed to get files for language '%@': %@", (uint8_t *)&v3, 0x20u);
}

@end