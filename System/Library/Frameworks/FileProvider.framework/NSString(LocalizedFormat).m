@interface NSString(LocalizedFormat)
- (id)fp_formatStringWithValues:()LocalizedFormat error:;
- (id)fp_localizedFormatWithKeys:()LocalizedFormat fromDictionary:error:;
@end

@implementation NSString(LocalizedFormat)

- (id)fp_localizedFormatWithKeys:()LocalizedFormat fromDictionary:error:
{
  v18 = a1;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = objc_msgSend(v7, "fp_valueForKeyPath:", *(void *)(*((void *)&v20 + 1) + 8 * i), v18);
        if (!v13)
        {
          if (a5)
          {
            FPNotSupportedError();
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_17;
        }
        id v14 = v13;
        objc_opt_class();
        v15 = v14;
        if (objc_opt_isKindOfClass())
        {
          v15 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v14 style:0 options:0];

          if (!v15)
          {
            if (a5)
            {
              FPNotSupportedError();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_17:
            v16 = 0;
            goto LABEL_18;
          }
        }
        [v8 addObject:v15];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16 = objc_msgSend(v18, "fp_formatStringWithValues:error:", v8, a5);
LABEL_18:

  return v16;
}

- (id)fp_formatStringWithValues:()LocalizedFormat error:
{
  id v6 = a3;
  switch([v6 count])
  {
    case 0:
      id v14 = a1;
      goto LABEL_4;
    case 1:
      v16 = NSString;
      v17 = [v6 objectAtIndexedSubscript:0];
      v15 = [v16 localizedStringWithValidatedFormat:a1, @"%@", a4, v17 validFormatSpecifiers error];
      goto LABEL_17;
    case 2:
      v18 = NSString;
      v17 = [v6 objectAtIndexedSubscript:0];
      v19 = [v6 objectAtIndexedSubscript:1];
      v15 = [v18 localizedStringWithValidatedFormat:a1, @"%@%@", a4, v17, v19 validFormatSpecifiers error];
      goto LABEL_8;
    case 3:
      long long v20 = NSString;
      v17 = [v6 objectAtIndexedSubscript:0];
      v19 = [v6 objectAtIndexedSubscript:1];
      long long v21 = [v6 objectAtIndexedSubscript:2];
      v15 = [v20 localizedStringWithValidatedFormat:a1, @"%@%@%@", a4, v17, v19, v21 validFormatSpecifiers error];

LABEL_8:
      goto LABEL_17;
    case 4:
      long long v22 = NSString;
      long long v23 = [v6 objectAtIndexedSubscript:0];
      v24 = [v6 objectAtIndexedSubscript:1];
      uint64_t v25 = [v6 objectAtIndexedSubscript:2];
      v26 = [v6 objectAtIndexedSubscript:3];
      v15 = [v22 localizedStringWithValidatedFormat:a1, @"%@%@%@%@", a4, v23, v24, v25, v26 validFormatSpecifiers error];

      goto LABEL_15;
    case 5:
      v27 = NSString;
      long long v23 = [v6 objectAtIndexedSubscript:0];
      v28 = [v6 objectAtIndexedSubscript:1];
      v29 = [v6 objectAtIndexedSubscript:2];
      v30 = [v6 objectAtIndexedSubscript:3];
      v31 = [v6 objectAtIndexedSubscript:4];
      v15 = [v27 localizedStringWithValidatedFormat:a1, @"%@%@%@%@%@", a4, v23, v28, v29, v30, v31 validFormatSpecifiers error];

      goto LABEL_14;
    case 6:
      v32 = NSString;
      long long v23 = [v6 objectAtIndexedSubscript:0];
      v28 = [v6 objectAtIndexedSubscript:1];
      v33 = [v6 objectAtIndexedSubscript:2];
      v34 = [v6 objectAtIndexedSubscript:3];
      v35 = [v6 objectAtIndexedSubscript:4];
      v36 = [v6 objectAtIndexedSubscript:5];
      v15 = [v32 localizedStringWithValidatedFormat:a1, @"%@%@%@%@%@%@", a4, v23, v28, v33, v34, v35, v36 validFormatSpecifiers error];
      goto LABEL_13;
    case 7:
      v66 = NSString;
      long long v23 = [v6 objectAtIndexedSubscript:0];
      v28 = [v6 objectAtIndexedSubscript:1];
      v33 = [v6 objectAtIndexedSubscript:2];
      v34 = [v6 objectAtIndexedSubscript:3];
      v35 = [v6 objectAtIndexedSubscript:4];
      v36 = [v6 objectAtIndexedSubscript:5];
      v37 = [v6 objectAtIndexedSubscript:6];
      v15 = [v66 localizedStringWithValidatedFormat:a1, @"%@%@%@%@%@%@%@", a4, v23, v28, v33, v34, v35, v36, v37 validFormatSpecifiers error];

LABEL_13:
LABEL_14:

LABEL_15:
      break;
    case 8:
      v67 = NSString;
      uint64_t v63 = [v6 objectAtIndexedSubscript:0];
      v60 = [v6 objectAtIndexedSubscript:1];
      v38 = [v6 objectAtIndexedSubscript:2];
      v39 = [v6 objectAtIndexedSubscript:3];
      v40 = [v6 objectAtIndexedSubscript:4];
      v41 = [v6 objectAtIndexedSubscript:5];
      v42 = [v6 objectAtIndexedSubscript:6];
      v43 = [v6 objectAtIndexedSubscript:7];
      v17 = (void *)v63;
      v15 = [v67 localizedStringWithValidatedFormat:a1, @"%@%@%@%@%@%@%@%@", a4, v63, v60, v38, v39, v40, v41, v42, v43 validFormatSpecifiers error];

LABEL_17:
      break;
    case 9:
      v61 = NSString;
      v58 = [v6 objectAtIndexedSubscript:0];
      v68 = [v6 objectAtIndexedSubscript:1];
      v64 = [v6 objectAtIndexedSubscript:2];
      v44 = [v6 objectAtIndexedSubscript:3];
      v45 = [v6 objectAtIndexedSubscript:4];
      v46 = [v6 objectAtIndexedSubscript:5];
      v47 = [v6 objectAtIndexedSubscript:6];
      v48 = [v6 objectAtIndexedSubscript:7];
      v49 = [v6 objectAtIndexedSubscript:8];
      v15 = [v61 localizedStringWithValidatedFormat:a1, @"%@%@%@%@%@%@%@%@%@", a4, v58, v68, v64, v44, v45, v46, v47, v48, v49 validFormatSpecifiers error];

      break;
    case 10:
      v65 = NSString;
      v62 = [v6 objectAtIndexedSubscript:0];
      v69 = [v6 objectAtIndexedSubscript:1];
      v57 = [v6 objectAtIndexedSubscript:2];
      v59 = [v6 objectAtIndexedSubscript:3];
      v56 = [v6 objectAtIndexedSubscript:4];
      v50 = [v6 objectAtIndexedSubscript:5];
      v51 = [v6 objectAtIndexedSubscript:6];
      v52 = [v6 objectAtIndexedSubscript:7];
      v53 = [v6 objectAtIndexedSubscript:8];
      v54 = [v6 objectAtIndexedSubscript:9];
      v15 = [v65 localizedStringWithValidatedFormat:a1, @"%@%@%@%@%@%@%@%@%@%@", a4, v62, v69, v57, v59, v56, v50, v51, v52, v53, v54 validFormatSpecifiers error];

      break;
    default:
      FPLoc(@"TOO_MANY_FORMATS_%@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)a1);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v15 = v14;
      break;
  }

  return v15;
}

@end