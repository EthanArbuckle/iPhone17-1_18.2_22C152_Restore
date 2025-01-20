@interface QuickTypeFavoniusEvaluator
- (BOOL)extractBundle:(id)a3 destination:(id)a4 error:(id *)a5;
- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (QuickTypeFavoniusEvaluator)init;
- (id)evaluateLanguageModelRecipe:(id)a3 recordText:(id)a4 customModelPath:(id)a5 error:(id *)a6;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
@end

@implementation QuickTypeFavoniusEvaluator

- (QuickTypeFavoniusEvaluator)init
{
  v3.receiver = self;
  v3.super_class = (Class)QuickTypeFavoniusEvaluator;
  return [(QuickTypeFavoniusEvaluator *)&v3 init];
}

- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [a4 objectForKey:@"localeIdentifier"];
  v9 = [v7 objectForKey:@"localeIdentifier"];
  if (v9)
  {
    if (v8)
    {
      v10 = +[NSLocale localeWithLocaleIdentifier:v8];
      v11 = v10;
      if (!v10)
      {
        BOOL v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v12 = [v10 languageCode];
      v13 = v12;
      if (!v12
        || ([v12 isEqualToString:@"zh"] & 1) != 0
        || [v13 isEqualToString:@"ja"])
      {
        if (a5)
        {
          v14 = &off_19BD8;
LABEL_9:
          +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:2 userInfo:v14];
          BOOL v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        if (+[QuickTypeEvaluatorUtils isMatchingRecipeLocale:v8 withRecordLocale:v9])
        {
          BOOL v15 = 1;
          goto LABEL_22;
        }
        if (a5)
        {
          v14 = &off_19C00;
          goto LABEL_9;
        }
      }
      BOOL v15 = 0;
      goto LABEL_22;
    }
    if (a5)
    {
      v16 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:1 userInfo:&off_19BB0];
      goto LABEL_14;
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_24;
  }
  if (!a5) {
    goto LABEL_15;
  }
  v16 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:1 userInfo:&off_19B88];
LABEL_14:
  BOOL v15 = 0;
  *a5 = v16;
LABEL_24:

  return v15;
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (BOOL)extractBundle:(id)a3 destination:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  archive_write_disk_new();
  archive_write_disk_set_standard_lookup();
  id v9 = v7;
  [v9 fileSystemRepresentation];
  unsigned int open_filename = archive_read_open_filename();
  if (!open_filename)
  {
    while (1)
    {
      unsigned int open_filename = archive_read_next_header();
      if (open_filename) {
        break;
      }
      v11 = +[NSString stringWithUTF8String:archive_entry_pathname()];
      v12 = [v8 URLByAppendingPathComponent:v11];

      id v13 = v12;
      [v13 fileSystemRepresentation];
      archive_entry_set_pathname();
      if (!archive_write_header())
      {
        while (1)
        {
          unsigned int data_block = archive_read_data_block();
          unsigned int open_filename = data_block;
          if (data_block) {
            break;
          }
          if (archive_write_data_block()) {
            goto LABEL_11;
          }
        }
        if (data_block == 1)
        {
          if (!archive_write_finish_entry()) {
            goto LABEL_4;
          }
          unsigned int open_filename = 1;
        }
LABEL_11:

        break;
      }
LABEL_4:
    }
  }
  archive_read_free();
  archive_write_free();
  if (a5 && open_filename >= 2)
  {
    *a5 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:(int)open_filename userInfo:&off_19C28];
  }

  return open_filename < 2;
}

- (id)evaluateLanguageModelRecipe:(id)a3 recordText:(id)a4 customModelPath:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v46 = a5;
  if (v10)
  {
    v44 = [v9 objectForKey:@"localeIdentifier"];
    v45 = [v9 objectForKey:@"pathToDynamicData"];
    v11 = [v9 objectForKey:@"filterDynamicData"];
    id v12 = [v11 BOOLValue];

    if (v45)
    {
      id v13 = +[NSFileManager defaultManager];
      v14 = +[NSLocale localeWithLocaleIdentifier:v44];
      BOOL v15 = [v14 languageCode];

      v16 = +[NSString stringWithFormat:@"/%@-dynamic.lm/", v15];
      v17 = [v45 stringByAppendingPathComponent:v16];

      if (([v13 fileExistsAtPath:v17 isDirectory:0] & 1) == 0)
      {
        if (a6)
        {
          *a6 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:&off_19C78];
        }

        v22 = 0;
        goto LABEL_31;
      }
    }
    v18 = [[QuickTypeLanguageModel alloc] initWithLocale:v44];
    v43 = v18;
    if (!v18)
    {
      if (a6)
      {
        +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:6 userInfo:&off_19CA0];
        v22 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_30;
    }
    v19 = [(QuickTypeLanguageModel *)v18 tokensForString:v10];
    unint64_t v38 = +[QuickTypeLanguageModel unknownTokenCountOfTokenSequence:v19];
    [(QuickTypeLanguageModel *)v43 perplexityOfTokenSequence:v19];
    v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v40 = [(QuickTypeLanguageModel *)v43 ksrOfTokenSequence:v19];
    v41 = +[NSNumber numberWithDouble:0.0];
    v42 = [[KSRScore alloc] initWithTotalCount:0 andSavedCount:0];
    if (v46)
    {
      v20 = [[QuickTypeLanguageModel alloc] initWithLocale:v44 resourceDirectory:v46 andDynamicData:0 filtered:v12];
      v21 = v20;
      if (v20) {
        goto LABEL_19;
      }
      if (a6)
      {
        id v26 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:6 userInfo:&off_19CC8];
LABEL_27:
        v22 = 0;
        *a6 = v26;
        goto LABEL_29;
      }
    }
    else
    {
      if (!v45)
      {
        unint64_t v37 = 0;
        uint64_t v24 = (uint64_t)v41;
        goto LABEL_24;
      }
      v20 = [[QuickTypeLanguageModel alloc] initWithLocale:v44 resourceDirectory:0 andDynamicData:v45 filtered:v12];
      v21 = v20;
      if (v20)
      {
LABEL_19:
        uint64_t v23 = [(QuickTypeLanguageModel *)v20 tokensForString:v10];

        unint64_t v37 = +[QuickTypeLanguageModel unknownTokenCountOfTokenSequence:v23];
        [(QuickTypeLanguageModel *)v21 perplexityOfTokenSequence:v23];
        uint64_t v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

        uint64_t v25 = [(QuickTypeLanguageModel *)v21 ksrOfTokenSequence:v23];

        v19 = (void *)v23;
        v42 = (KSRScore *)v25;
LABEL_24:
        v47[0] = @"BaselinePerplexity";
        v47[1] = @"TestPerplexity";
        v48[0] = v39;
        v48[1] = v24;
        v41 = (void *)v24;
        v47[2] = @"BaselineKSR";
        [v40 ksrScore];
        v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v48[2] = v36;
        v47[3] = @"TestKSR";
        [(KSRScore *)v42 ksrScore];
        v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v48[3] = v35;
        v47[4] = @"BaselineSavedKeystrokes";
        v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v40 numSavedCharacters]);
        v48[4] = v34;
        v47[5] = @"TestSavedKeystrokes";
        v27 = +[NSNumber numberWithUnsignedInteger:[(KSRScore *)v42 numSavedCharacters]];
        v48[5] = v27;
        v47[6] = @"BaselineTotalKeystrokes";
        v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v40 numCharacters]);
        v48[6] = v28;
        v47[7] = @"TestTotalKeystrokes";
        v29 = +[NSNumber numberWithUnsignedInteger:[(KSRScore *)v42 numCharacters]];
        v48[7] = v29;
        v47[8] = @"TokenCount";
        v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
        v48[8] = v30;
        v47[9] = @"BaselineUnknownTokenCount";
        v31 = +[NSNumber numberWithUnsignedInteger:v38];
        v48[9] = v31;
        v47[10] = @"TestUnknownTokenCount";
        v32 = +[NSNumber numberWithUnsignedInteger:v37];
        v48[10] = v32;
        v22 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:11];

LABEL_29:
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      if (a6)
      {
        id v26 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:6 userInfo:&off_19CF0];
        goto LABEL_27;
      }
    }
    v22 = 0;
    goto LABEL_29;
  }
  if (a6)
  {
    +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:3 userInfo:&off_19C50];
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_32:

  return v22;
}

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v25 = a4;
  id v29 = a5;
  id v26 = v11;
  id v24 = a6;
  v28 = [v11 objectForKey:@"mode"];
  id v27 = [objc_alloc((Class)NSString) initWithData:v29 encoding:4];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v24;
  id v12 = 0;
  id v13 = 0;
  id v14 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    while (2)
    {
      v16 = 0;
      v17 = v12;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v16);
        v19 = [v18 pathExtension];
        if ([v19 isEqualToString:@"txt"])
        {
          id v20 = v18;

          id v12 = v17;
          id v13 = v20;
        }
        else
        {
          id v12 = [v18 URLByDeletingLastPathComponent];

          if (![(QuickTypeFavoniusEvaluator *)self extractBundle:v18 destination:v12 error:a7])
          {
            v22 = obj;
            goto LABEL_15;
          }
        }

        v16 = (char *)v16 + 1;
        v17 = v12;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (v28 && ![v28 isEqualToString:@"lm_only"])
  {
    if (a7)
    {
      CFStringRef v36 = @"message";
      v22 = +[NSString stringWithFormat:@"Unrecognized evaluation mode '%@'", v28];
      unint64_t v37 = v22;
      v19 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a7 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:4 userInfo:v19];
LABEL_15:
    }
    v21 = 0;
  }
  else
  {
    v21 = [(QuickTypeFavoniusEvaluator *)self evaluateLanguageModelRecipe:v26 recordText:v27 customModelPath:v12 error:a7];
  }

  return v21;
}

@end