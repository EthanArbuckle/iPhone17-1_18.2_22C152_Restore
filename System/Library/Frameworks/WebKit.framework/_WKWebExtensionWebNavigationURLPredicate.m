@interface _WKWebExtensionWebNavigationURLPredicate
- (BOOL)matchesURL:(id)a3;
- (_WKWebExtensionWebNavigationURLPredicate)initWithTypeString:(id)a3 value:(id)a4 outErrorMessage:(id *)a5;
@end

@implementation _WKWebExtensionWebNavigationURLPredicate

- (_WKWebExtensionWebNavigationURLPredicate)initWithTypeString:(id)a3 value:(id)a4 outErrorMessage:(id *)a5
{
  v60[20] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)_WKWebExtensionWebNavigationURLPredicate;
  v10 = [(_WKWebExtensionWebNavigationURLPredicate *)&v56 init];
  if (v10)
  {
    if (_MergedGlobals_39 == 1)
    {
      v11 = (void *)qword_1EB358A48;
    }
    else
    {
      v59[0] = @"hostContains";
      v59[1] = @"hostEquals";
      v60[0] = &unk_1EEA529F0;
      v60[1] = &unk_1EEA52A08;
      v59[2] = @"hostPrefix";
      v59[3] = @"hostSuffix";
      v60[2] = &unk_1EEA52A20;
      v60[3] = &unk_1EEA52A38;
      v59[4] = @"pathContains";
      v59[5] = @"pathEquals";
      v60[4] = &unk_1EEA52A50;
      v60[5] = &unk_1EEA52A68;
      v59[6] = @"pathPrefix";
      v59[7] = @"pathSuffix";
      v60[6] = &unk_1EEA52A80;
      v60[7] = &unk_1EEA52A98;
      v59[8] = @"queryContains";
      v59[9] = @"queryEquals";
      v60[8] = &unk_1EEA52AB0;
      v60[9] = &unk_1EEA52AC8;
      v59[10] = @"queryPrefix";
      v59[11] = @"querySuffix";
      v60[10] = &unk_1EEA52AE0;
      v60[11] = &unk_1EEA52AF8;
      v59[12] = @"urlContains";
      v59[13] = @"urlEquals";
      v60[12] = &unk_1EEA52B10;
      v60[13] = &unk_1EEA52B28;
      v59[14] = @"urlMatches";
      v59[15] = @"originAndPathMatches";
      v60[14] = &unk_1EEA52B40;
      v60[15] = &unk_1EEA52B58;
      v59[16] = @"urlPrefix";
      v59[17] = @"urlSuffix";
      v60[16] = &unk_1EEA52B70;
      v60[17] = &unk_1EEA52B88;
      v59[18] = @"schemes";
      v59[19] = @"ports";
      v60[18] = &unk_1EEA52BA0;
      v60[19] = &unk_1EEA52BB8;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:20];
      qword_1EB358A48 = (uint64_t)v11;
      _MergedGlobals_39 = 1;
    }
    v12 = [v11 objectForKeyedSubscript:v8];
    unint64_t v13 = [v12 integerValue];
    v10->_type = v13;
    if (v13 >= 0xE)
    {
      switch(v13)
      {
        case 0xEuLL:
        case 0xFuLL:
          uint64_t v18 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v9 options:0 error:0];
          id value = v10->_value;
          v10->_id value = (id)v18;

          if (v18) {
            goto LABEL_7;
          }
          WebKit::toErrorString(0, &cfstr_Originandpathm.isa, &cfstr_IsNotAValidReg.isa, v20, v9);
          v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
          goto LABEL_5;
        case 0x13uLL:
          id v15 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          if ((byte_1EB358A41 & 1) == 0)
          {
            v42 = (void *)MEMORY[0x1E4F1CAA0];
            uint64_t v43 = objc_opt_class();
            uint64_t v58 = objc_opt_class();
            v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
            qword_1EB358A50 = objc_msgSend(v42, "orderedSetWithObjects:", v43, v44, 0);

            byte_1EB358A41 = 1;
          }
          objc_opt_class();
          v21 = WTF::dynamic_objc_cast<NSArray>(v9);
          uint64_t v49 = [v21 count];

          if (!v49) {
            goto LABEL_36;
          }
          uint64_t v22 = 0;
          v48 = v15;
          break;
        default:
          goto LABEL_7;
      }
      while (1)
      {
        v51 = [v9 objectAtIndexedSubscript:v22];
        v23 = [NSString stringWithFormat:@"%@[%lu]", @"ports", v22];
        BOOL v24 = WebKit::validateObject(v51, v23, (void *)qword_1EB358A50, a5);

        if (!v24) {
          break;
        }
        objc_opt_class();
        v25 = WTF::dynamic_objc_cast<NSNumber>(v51);
        v26 = v25;
        if (v25)
        {
          unint64_t v27 = [v25 integerValue];
          if (v27 >= 0x10000)
          {
            WebKit::toErrorString(0, &cfstr_Ports.isa, &cfstr_ZdIsNotAValidP.isa, v28, v27);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

            break;
          }
          [v15 addIndex:v27];
        }
        else
        {
          objc_opt_class();
          v29 = WTF::dynamic_objc_cast<NSArray>(v51);
          v30 = v29;
          if (v29)
          {
            v47 = v29;
            if ([v29 count] != 2)
            {
              WebKit::toErrorString(0, &cfstr_Ports.isa, &cfstr_APortRangeMust.isa, v31);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v26 = v30;
              goto LABEL_39;
            }
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id obj = v30;
            uint64_t v32 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v53;
              while (2)
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v53 != v33) {
                    objc_enumerationMutation(obj);
                  }
                  unint64_t v35 = [*(id *)(*((void *)&v52 + 1) + 8 * i) integerValue];
                  if (v35 >= 0x10000)
                  {
                    WebKit::toErrorString(0, &cfstr_Ports.isa, &cfstr_ZdIsNotAValidP.isa, v36, v35);
                    id v15 = v48;
                    *a5 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_38;
                  }
                }
                uint64_t v32 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
                if (v32) {
                  continue;
                }
                break;
              }
            }

            v30 = v47;
            id v15 = v48;
            v37 = [obj objectAtIndexedSubscript:0];
            unint64_t v46 = [v37 unsignedIntegerValue];

            v45 = [obj objectAtIndexedSubscript:1];
            unint64_t v38 = [v45 unsignedIntegerValue];

            if (v38 <= v46)
            {
              WebKit::toErrorString(0, &cfstr_Ports.isa, &cfstr_ZdZdIsNotAVali.isa, v39, v46, v38);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
              v26 = obj;
              goto LABEL_39;
            }
            objc_msgSend(v48, "addIndexesInRange:");
          }
        }
        if (++v22 == v49)
        {
LABEL_36:
          uint64_t v40 = [v15 copy];
          id v41 = v10->_value;
          v10->_id value = (id)v40;

          goto LABEL_6;
        }
      }

      v16 = 0;
    }
    else
    {
LABEL_5:
      uint64_t v14 = [v9 copy];
      id v15 = v10->_value;
      v10->_id value = (id)v14;
LABEL_6:

LABEL_7:
      v16 = v10;
    }
LABEL_8:
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)matchesURL:(id)a3
{
  id v4 = a3;
  id v5 = self->_value;
  id v6 = self->_value;
  id v7 = self->_value;
  id v8 = self->_value;
  switch(self->_type)
  {
    case 0:
      uint64_t v9 = [v4 host];
      v10 = (void *)v9;
      if (v9) {
        v11 = (__CFString *)v9;
      }
      else {
        v11 = &stru_1EEA10550;
      }
      v12 = [@"." stringByAppendingString:v11];
      char v13 = [v12 containsString:v5];
      goto LABEL_24;
    case 1:
      v10 = [v4 host];
      char v14 = [v10 isEqualToString:v5];
      goto LABEL_28;
    case 2:
      v10 = [v4 host];
      char v14 = [v10 hasPrefix:v5];
      goto LABEL_28;
    case 3:
      v10 = [v4 host];
      char v14 = [v10 hasSuffix:v5];
      goto LABEL_28;
    case 4:
      v10 = [v4 path];
      char v14 = [v10 containsString:v5];
      goto LABEL_28;
    case 5:
      v10 = [v4 path];
      char v14 = [v10 isEqualToString:v5];
      goto LABEL_28;
    case 6:
      v10 = [v4 path];
      char v14 = [v10 hasPrefix:v5];
      goto LABEL_28;
    case 7:
      v10 = [v4 path];
      char v14 = [v10 hasSuffix:v5];
      goto LABEL_28;
    case 8:
      v10 = [v4 query];
      char v14 = [v10 containsString:v5];
      goto LABEL_28;
    case 9:
      v10 = [v4 query];
      char v14 = [v10 isEqualToString:v5];
      goto LABEL_28;
    case 0xALL:
      v10 = [v4 query];
      char v14 = [v10 hasPrefix:v5];
      goto LABEL_28;
    case 0xBLL:
      v10 = [v4 query];
      char v14 = [v10 hasSuffix:v5];
      goto LABEL_28;
    case 0xCLL:
      v10 = objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v12 = [v10 absoluteString];
      char v13 = [v12 containsString:v5];
      goto LABEL_24;
    case 0xDLL:
      v10 = objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v12 = [v10 absoluteString];
      char v13 = [v12 isEqualToString:v5];
      goto LABEL_24;
    case 0xELL:
      id v15 = objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v10 = [v15 absoluteString];

      BOOL v16 = objc_msgSend(v8, "rangeOfFirstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")) != 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_29;
    case 0xFLL:
      v10 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
      [v10 setFragment:0];
      [v10 setQuery:0];
      v12 = [v10 string];
      BOOL v16 = objc_msgSend(v8, "rangeOfFirstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length")) != 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_25;
    case 0x10:
      v10 = objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v12 = [v10 absoluteString];
      char v13 = [v12 hasPrefix:v5];
      goto LABEL_24;
    case 0x11:
      v10 = objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v12 = [v10 absoluteString];
      char v13 = [v12 hasSuffix:v5];
LABEL_24:
      BOOL v16 = v13;
LABEL_25:

      goto LABEL_29;
    case 0x12:
      v10 = [v4 scheme];
      char v14 = [v6 containsObject:v10];
      goto LABEL_28;
    case 0x13:
      v10 = [v4 port];
      char v14 = objc_msgSend(v7, "containsIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
LABEL_28:
      BOOL v16 = v14;
LABEL_29:

      break;
    default:
      BOOL v16 = 0;
      break;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end