@interface LNPrimitiveValueType(CATSupport)
- (__CFString)cat_dialogType;
- (__CFString)cat_keyPath;
- (id)cat_value:()CATSupport;
@end

@implementation LNPrimitiveValueType(CATSupport)

- (__CFString)cat_keyPath
{
  uint64_t v1 = [a1 typeIdentifier];
  v2 = @"longLocation";
  if (v1 != 10) {
    v2 = 0;
  }
  if (v1 == 8) {
    return @"dateTimeDescriptive";
  }
  else {
    return v2;
  }
}

- (id)cat_value:()CATSupport
{
  v83[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([a1 typeIdentifier])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v5 = [v4 value];
      break;
    case 8:
      v82[0] = @"secs";
      v7 = (void *)MEMORY[0x1E4F28ED0];
      v8 = [v4 value];
      if (v8)
      {
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
        v9 = 0;
      }
      id v20 = v9;

      [v20 timeIntervalSince1970];
      double v22 = v21;

      v11 = [v7 numberWithDouble:v22];
      v82[1] = @"timeZone";
      v83[0] = v11;
      v23 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      v24 = [v23 name];
      v83[1] = v24;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];

      goto LABEL_31;
    case 9:
      v80 = @"secs";
      v10 = (void *)MEMORY[0x1E4F28ED0];
      v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
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
      id v25 = v13;

      v26 = [v11 dateFromComponents:v25];

      [v26 timeIntervalSince1970];
      v27 = objc_msgSend(v10, "numberWithDouble:");
      v81 = v27;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];

LABEL_31:
      break;
    case 10:
      v78 = @"values";
      v75 = @"address";
      v73[0] = @"administrativeArea";
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
      id v28 = v15;

      uint64_t v29 = [v28 administrativeArea];

      v74[0] = v29;
      v73[1] = @"country";
      v30 = [v4 value];
      v72 = (void *)v29;
      if (v30)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v31 = v30;
        }
        else {
          v31 = 0;
        }
      }
      else
      {
        v31 = 0;
      }
      id v34 = v31;

      uint64_t v35 = [v34 country];

      v74[1] = v35;
      v73[2] = @"countryCode";
      v36 = [v4 value];
      if (v36)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v37 = v36;
        }
        else {
          v37 = 0;
        }
      }
      else
      {
        v37 = 0;
      }
      id v38 = v37;

      uint64_t v39 = [v38 ISOcountryCode];

      v74[2] = v39;
      v73[3] = @"locality";
      v40 = [v4 value];
      v71 = (void *)v39;
      if (v40)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v41 = v40;
        }
        else {
          v41 = 0;
        }
      }
      else
      {
        v41 = 0;
      }
      id v42 = v41;

      uint64_t v43 = [v42 locality];

      v74[3] = v43;
      v73[4] = @"name";
      v44 = [v4 value];
      if (v44)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v45 = v44;
        }
        else {
          v45 = 0;
        }
      }
      else
      {
        v45 = 0;
      }
      id v46 = v45;

      uint64_t v47 = [v46 name];

      v74[4] = v47;
      v73[5] = @"postCode";
      v48 = [v4 value];
      v70 = (void *)v47;
      if (v48)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v49 = v48;
        }
        else {
          v49 = 0;
        }
      }
      else
      {
        v49 = 0;
      }
      id v50 = v49;

      uint64_t v51 = [v50 postalCode];

      v74[5] = v51;
      v73[6] = @"subAdministrativeArea";
      v52 = [v4 value];
      v69 = (void *)v51;
      if (v52)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v53 = v52;
        }
        else {
          v53 = 0;
        }
      }
      else
      {
        v53 = 0;
      }
      id v54 = v53;

      v55 = [v54 subAdministrativeArea];

      v74[6] = v55;
      v73[7] = @"subThoroughfare";
      v56 = [v4 value];
      if (v56)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v57 = v56;
        }
        else {
          v57 = 0;
        }
      }
      else
      {
        v57 = 0;
      }
      id v58 = v57;

      v59 = [v58 subThoroughfare];

      v74[7] = v59;
      v73[8] = @"thoroughfare";
      v60 = [v4 value];
      v61 = (void *)v43;
      v62 = (void *)v35;
      if (v60)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v63 = v60;
        }
        else {
          v63 = 0;
        }
      }
      else
      {
        v63 = 0;
      }
      id v64 = v63;

      v65 = [v64 thoroughfare];

      v74[8] = v65;
      v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:9];
      v76 = v66;
      v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      v77 = v67;
      v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
      v79 = v68;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];

      break;
    case 11:
      v16 = [v4 value];
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v32 = v17;

      uint64_t v33 = [v32 absoluteString];
      goto LABEL_41;
    case 12:
      v18 = [v4 value];
      if (v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
      }
      id v32 = v19;

      uint64_t v33 = [v32 string];
LABEL_41:
      v5 = (void *)v33;

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (__CFString)cat_dialogType
{
  uint64_t v1 = [a1 typeIdentifier];
  if ((unint64_t)(v1 - 1) > 9) {
    return @"dialog.String";
  }
  else {
    return off_1E5B39380[v1 - 1];
  }
}

@end