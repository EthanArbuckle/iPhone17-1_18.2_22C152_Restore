@interface IPv4AddressFormatter
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
@end

@implementation IPv4AddressFormatter

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  v63.receiver = self;
  v63.super_class = (Class)IPv4AddressFormatter;
  BOOL v8 = -[APFormatter isPartialStringValid:newEditingString:errorDescription:](&v63, sel_isPartialStringValid_newEditingString_errorDescription_);
  if (v8)
  {
    if (!objc_msgSend_length(a3, v9, v10)) {
      goto LABEL_12;
    }
    v12 = objc_msgSend_componentsSeparatedByString_(a3, v11, @".");
    unint64_t v15 = objc_msgSend_count(v12, v13, v14);
    if (v15 > 4)
    {
      if (a4)
      {
        v17 = NSString;
        uint64_t v18 = objc_msgSend_objectAtIndex_(v12, v16, 0);
        uint64_t v20 = objc_msgSend_objectAtIndex_(v12, v19, 1);
        uint64_t v22 = objc_msgSend_objectAtIndex_(v12, v21, 2);
        uint64_t v24 = objc_msgSend_objectAtIndex_(v12, v23, 3);
        *a4 = (id)objc_msgSend_stringWithFormat_(v17, v25, @"%@.%@.%@.%@", v18, v20, v22, v24);
      }
      if (a5) {
        goto LABEL_7;
      }
      goto LABEL_43;
    }
    unint64_t v26 = v15;
    if (!v15)
    {
LABEL_12:
      LOBYTE(v8) = 1;
      return v8;
    }
    uint64_t v27 = 0;
    while (1)
    {
      v28 = objc_msgSend_objectAtIndex_(v12, v16, v27);
      if (objc_msgSend_integerValue(v28, v29, v30) >= 256) {
        break;
      }
      if (v26 == ++v27) {
        goto LABEL_12;
      }
    }
    if (!a4)
    {
LABEL_42:
      if (a5)
      {
LABEL_7:
        LOBYTE(v8) = 0;
        *a5 = @"gErE";
        return v8;
      }
LABEL_43:
      LOBYTE(v8) = 0;
      return v8;
    }
    if ((unint64_t)objc_msgSend_UTF8ByteCount(v28, v16, v31) >= 4) {
      v28 = objc_msgSend_substringToIndex_(v28, v32, 3);
    }
    if (objc_msgSend_integerValue(v28, v32, v33) >= 256) {
      v28 = objc_msgSend_substringToIndex_(v28, v34, 2);
    }
    if (v26 >= 4)
    {
      switch(v27)
      {
        case 0:
          v35 = NSString;
          uint64_t v36 = objc_msgSend_objectAtIndex_(v12, v34, 1);
          uint64_t v61 = objc_msgSend_objectAtIndex_(v12, v37, 2);
          uint64_t v62 = objc_msgSend_objectAtIndex_(v12, v38, 3);
          v57 = v28;
          uint64_t v59 = v36;
          goto LABEL_34;
        case 1:
          v35 = NSString;
          uint64_t v43 = objc_msgSend_objectAtIndex_(v12, v34, 0);
          uint64_t v61 = objc_msgSend_objectAtIndex_(v12, v44, 2);
          uint64_t v62 = objc_msgSend_objectAtIndex_(v12, v45, 3);
          uint64_t v59 = (uint64_t)v28;
          goto LABEL_33;
        case 2:
          v35 = NSString;
          uint64_t v43 = objc_msgSend_objectAtIndex_(v12, v34, 0);
          uint64_t v47 = objc_msgSend_objectAtIndex_(v12, v46, 1);
          uint64_t v61 = (uint64_t)v28;
          uint64_t v62 = objc_msgSend_objectAtIndex_(v12, v48, 3);
          goto LABEL_32;
        case 3:
          v35 = NSString;
          uint64_t v43 = objc_msgSend_objectAtIndex_(v12, v34, 0);
          uint64_t v47 = objc_msgSend_objectAtIndex_(v12, v49, 1);
          uint64_t v61 = objc_msgSend_objectAtIndex_(v12, v50, 2);
          uint64_t v62 = (uint64_t)v28;
LABEL_32:
          uint64_t v59 = v47;
LABEL_33:
          v57 = (void *)v43;
LABEL_34:
          v51 = @"%@.%@.%@.%@";
          goto LABEL_39;
        default:
          goto LABEL_42;
      }
    }
    if (v26 != 3)
    {
      if (v26 < 2)
      {
LABEL_41:
        *a4 = v28;
        goto LABEL_42;
      }
      v41 = NSString;
      if (v27)
      {
        uint64_t v58 = objc_msgSend_objectAtIndex_(v12, v34, 0);
        uint64_t v60 = (uint64_t)v28;
      }
      else
      {
        uint64_t v58 = (uint64_t)v28;
        uint64_t v60 = objc_msgSend_objectAtIndex_(v12, v34, 1);
      }
      uint64_t v55 = objc_msgSend_stringWithFormat_(v41, v42, @"%@.%@", v58, v60);
LABEL_40:
      v28 = (void *)v55;
      goto LABEL_41;
    }
    if (v27 == 2)
    {
      v35 = NSString;
      uint64_t v52 = objc_msgSend_objectAtIndex_(v12, v34, 0);
      uint64_t v59 = objc_msgSend_objectAtIndex_(v12, v53, 1);
      uint64_t v61 = (uint64_t)v28;
    }
    else
    {
      if (v27 != 1)
      {
        if (v27) {
          goto LABEL_42;
        }
        v35 = NSString;
        uint64_t v59 = objc_msgSend_objectAtIndex_(v12, v34, 1);
        uint64_t v61 = objc_msgSend_objectAtIndex_(v12, v40, 2);
        v57 = v28;
        goto LABEL_38;
      }
      v35 = NSString;
      uint64_t v52 = objc_msgSend_objectAtIndex_(v12, v34, 0);
      uint64_t v59 = (uint64_t)v28;
      uint64_t v61 = objc_msgSend_objectAtIndex_(v12, v54, 2);
    }
    v57 = (void *)v52;
LABEL_38:
    v51 = @"%@.%@.%@";
LABEL_39:
    uint64_t v55 = objc_msgSend_stringWithFormat_(v35, v39, (uint64_t)v51, v57, v59, v61, v62);
    goto LABEL_40;
  }
  return v8;
}

@end