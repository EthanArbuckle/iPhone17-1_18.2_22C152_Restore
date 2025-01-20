@interface LNIntentsValueType(CATSupport)
- (__CFString)cat_dialogType;
- (id)cat_value:()CATSupport;
- (uint64_t)cat_keyPath;
@end

@implementation LNIntentsValueType(CATSupport)

- (uint64_t)cat_keyPath
{
  return 0;
}

- (id)cat_value:()CATSupport
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = 0;
  switch([a1 typeIdentifier])
  {
    case 3:
      v34[0] = @"familyName";
      v6 = [v4 value];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7 = v6;
        }
        else {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      id v16 = v7;

      v17 = [v16 nameComponents];

      v18 = [v17 familyName];
      v35[0] = v18;
      v34[1] = @"givenName";
      v19 = [v4 value];
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
      }
      else
      {
        v20 = 0;
      }
      id v22 = v20;

      v23 = [v22 nameComponents];

      v24 = [v23 givenName];
      v35[1] = v24;
      v34[2] = @"nickname";
      v25 = [v4 value];
      if (v25)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v26 = v25;
        }
        else {
          v26 = 0;
        }
      }
      else
      {
        v26 = 0;
      }
      id v29 = v26;

      v30 = [v29 nameComponents];

      v31 = [v30 nickname];
      v35[2] = v31;
      id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];

      goto LABEL_48;
    case 4:
      v8 = [v4 value];
      if (v8) {
        goto LABEL_11;
      }
      goto LABEL_14;
    case 7:
      v8 = [v4 value];
      if (v8) {
        goto LABEL_11;
      }
      goto LABEL_14;
    case 8:
      v8 = [v4 value];
      if (v8)
      {
LABEL_11:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v8;
        }
        else {
          v9 = 0;
        }
      }
      else
      {
LABEL_14:
        v9 = 0;
      }
      id v10 = v9;

      uint64_t v11 = [v10 title];
      goto LABEL_34;
    case 12:
      v12 = [v4 value];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      id v21 = v13;

      v17 = [v21 filename];

      if (v17)
      {
        id v5 = v17;
      }
      else
      {
        v27 = [v4 value];
        if (v27)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v28 = v27;
          }
          else {
            v28 = 0;
          }
        }
        else
        {
          v28 = 0;
        }
        id v32 = v28;

        v18 = [v32 fileURL];

        id v5 = [v18 lastPathComponent];
LABEL_48:
      }
      break;
    case 13:
      v14 = [v4 value];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
      }
      else
      {
        v15 = 0;
      }
      id v10 = v15;

      uint64_t v11 = [v10 name];
LABEL_34:
      id v5 = (id)v11;

      break;
    default:
      break;
  }

  return v5;
}

- (__CFString)cat_dialogType
{
  unint64_t v1 = [a1 typeIdentifier];
  if (v1 > 0xE) {
    return @"dialog.Person";
  }
  else {
    return off_1E5B394C0[v1];
  }
}

@end