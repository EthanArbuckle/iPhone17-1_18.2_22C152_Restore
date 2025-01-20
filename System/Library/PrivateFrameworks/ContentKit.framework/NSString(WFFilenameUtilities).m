@interface NSString(WFFilenameUtilities)
+ (id)wf_datedFilenameWithTypeString:()WFFilenameUtilities fileExtension:;
- (id)wf_filenameTruncatedToMaximumLengthWithFormat:()WFFilenameUtilities;
- (id)wf_filenameTruncatedToMaximumLengthWithSuffix:()WFFilenameUtilities;
- (uint64_t)wf_filenameTruncatedToMaximumLength;
@end

@implementation NSString(WFFilenameUtilities)

- (id)wf_filenameTruncatedToMaximumLengthWithFormat:()WFFilenameUtilities
{
  id v4 = a3;
  v5 = [a1 pathExtension];
  uint64_t v6 = [a1 lengthOfBytesUsingEncoding:4];
  uint64_t v7 = [v4 lengthOfBytesUsingEncoding:4];
  uint64_t v8 = [v5 lengthOfBytesUsingEncoding:4];
  id v9 = a1;
  id v10 = v4;
  id v11 = v5;
  if (v8)
  {
    id v12 = [v9 stringByDeletingPathExtension];

    v13 = WFFilenameByApplyingFormatStringToBasenameAndAppendPathExtension(v12, v10, v7, v11, v8);
  }
  else
  {
    id v12 = v9;
    id v14 = v10;
    id v15 = v11;
    v13 = v12;
    if (v7)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", v14, v12);
    }
  }

  uint64_t v16 = [v13 lengthOfBytesUsingEncoding:4];
  if (v16 > 255)
  {
    uint64_t v18 = v16 - v6;
    id v19 = v9;
    v20 = v19;
    if (v8 + v18 + 2 < 256)
    {
      unint64_t v22 = 255 - v18;
      if (v8)
      {
        v22 += ~v8;
LABEL_13:
        id v23 = v20;
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x2020000000;
        unint64_t v34 = 0;
        unint64_t v24 = [v23 length];
        if (v24 >= v22) {
          unint64_t v25 = v22;
        }
        else {
          unint64_t v25 = v24;
        }
        unint64_t v34 = v25;
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x2020000000;
        v30[3] = 0;
        uint64_t v26 = v32[3];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __WFSubstringByEncodingComposedCharacterSequencesToMaxLength_block_invoke;
        v29[3] = &unk_2642858B8;
        v29[6] = 4;
        v29[7] = v22;
        v29[4] = v30;
        v29[5] = &v31;
        objc_msgSend(v23, "enumerateSubstringsInRange:options:usingBlock:", 0, v26, 2, v29);
        v27 = [v23 substringToIndex:v32[3]];
        _Block_object_dispose(v30, 8);
        _Block_object_dispose(&v31, 8);

        WFFilenameByApplyingFormatStringToBasenameAndAppendPathExtension(v27, v10, v7, v11, v8);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v21 = [v19 stringByDeletingPathExtension];

      id v11 = 0;
      unint64_t v22 = 255 - v18;
      v20 = (void *)v21;
    }
    uint64_t v8 = 0;
    goto LABEL_13;
  }
  id v17 = v13;
LABEL_17:

  return v17;
}

- (uint64_t)wf_filenameTruncatedToMaximumLength
{
  return objc_msgSend(a1, "wf_filenameTruncatedToMaximumLengthWithSuffix:", 0);
}

- (id)wf_filenameTruncatedToMaximumLengthWithSuffix:()WFFilenameUtilities
{
  if (a3)
  {
    id v4 = objc_msgSend(@"%@", "stringByAppendingString:");
  }
  else
  {
    id v4 = 0;
  }
  v5 = objc_msgSend(a1, "wf_filenameTruncatedToMaximumLengthWithFormat:", v4);

  return v5;
}

+ (id)wf_datedFilenameWithTypeString:()WFFilenameUtilities fileExtension:
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = WFLocalizedString(@"yyyy-MM-dd");
  uint64_t v8 = [MEMORY[0x263F08790] dateFormatFromTemplate:v7 options:0 locale:0];
  id v9 = objc_opt_new();
  [v9 setDateFormat:v8];
  id v10 = [MEMORY[0x263EFF910] date];
  id v11 = [v9 stringFromDate:v10];
  id v12 = [MEMORY[0x263F08790] localizedStringFromDate:v10 dateStyle:0 timeStyle:2];
  v13 = NSString;
  id v14 = WFLocalizedString(@"%1$@ %2$@ at %3$@");
  id v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v6, v11, v12);

  uint64_t v16 = [v15 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  id v17 = WFLocalizedString(@"-");
  uint64_t v18 = [v16 stringByReplacingOccurrencesOfString:@"-" withString:v17];

  id v19 = WFLocalizedString(@".");
  v20 = [v18 stringByReplacingOccurrencesOfString:@":" withString:v19];

  uint64_t v21 = [v20 stringByAppendingPathExtension:v5];

  return v21;
}

@end