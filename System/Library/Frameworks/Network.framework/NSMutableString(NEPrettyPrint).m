@interface NSMutableString(NEPrettyPrint)
- (uint64_t)appendPrettyBOOL:()NEPrettyPrint withName:indent:;
- (uint64_t)appendPrettyInt:()NEPrettyPrint withName:indent:;
- (void)appendPrettyObject:()NEPrettyPrint withName:indent:showFullContent:;
@end

@implementation NSMutableString(NEPrettyPrint)

- (void)appendPrettyObject:()NEPrettyPrint withName:indent:showFullContent:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    id v11 = v9;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v56 = v9;
      id v13 = v11;
      id v55 = v10;
      uint64_t v58 = (4 * a5 + 4);
      objc_msgSend(a1, "appendFormat:", @"\n%*s%@ = ("), v58, " ", v10;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      obuint64_t j = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = (4 * a5 + 8);
        uint64_t v17 = (a5 + 2);
        uint64_t v18 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v67 != v18) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v22 = (void *)[v21 descriptionWithIndent:v17 showFullContent:a6];
              [a1 appendFormat:@"\n%*s{%@", v16, " ", v22];

              objc_msgSend(a1, "appendFormat:", @"\n%*s},", v16, " ", v51);
            }
            else
            {
              id v23 = v21;
              objc_opt_class();
              char v24 = objc_opt_isKindOfClass();

              if (v24 & 1) == 0 || (a6)
              {
                v20 = [v23 description];
                [a1 appendFormat:@"\n%*s%@,", v16, " ", v20];
              }
              else
              {
                objc_msgSend(a1, "appendFormat:", @"\n%*s<%lu-char-str>,", v16, " ", objc_msgSend(v23, "length"));
              }
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
        }
        while (v15);
      }

      [a1 appendFormat:@"\n%*s"], v58, " ");
LABEL_37:
      id v10 = v55;
      id v9 = v56;
      goto LABEL_38;
    }
    id v25 = v11;
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();

    if (v26)
    {
      id v56 = v9;
      id v27 = v25;
      uint64_t v54 = (4 * a5 + 4);
      id v55 = v10;
      v28 = " ";
      [a1 appendFormat:@"\n%*s%@ = {", v54, " ", v10];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v29 = v27;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        unint64_t obja = (4 * a5 + 8);
        unsigned int v57 = a5 + 2;
        uint64_t v32 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v63 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v35 = *(void *)(*((void *)&v62 + 1) + 8 * j);
            v36 = [v29 objectForKeyedSubscript:v35];
            if (objc_opt_respondsToSelector())
            {
              v34 = (void *)[v36 descriptionWithIndent:v57 showFullContent:a6];
              [a1 appendFormat:@"\n%*s%@ = {%@", obja, v28, v35, v34];

              objc_msgSend(a1, "appendFormat:", @"\n%*s},", obja, v28);
            }
            else
            {
              id v37 = v29;
              uint64_t v38 = v32;
              uint64_t v39 = v31;
              v40 = v28;
              id v41 = v36;
              objc_opt_class();
              char v42 = objc_opt_isKindOfClass();

              if (v42 & 1) == 0 || (a6)
              {
                v43 = [v41 description];
                v28 = v40;
                [a1 appendFormat:@"\n%*s%@ = %@", obja, v40, v35, v43];
              }
              else
              {
                v28 = v40;
                [a1 appendFormat:@"\n%*s%@ = <%lu-char-str>", obja, v40, v35, objc_msgSend(v41, "length")];
              }
              uint64_t v31 = v39;
              uint64_t v32 = v38;
              id v29 = v37;
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
        }
        while (v31);
      }

      objc_msgSend(a1, "appendFormat:", @"\n%*s}", v54, v28);
      goto LABEL_37;
    }
    id v44 = v25;
    objc_opt_class();
    char v45 = objc_opt_isKindOfClass();

    if (v45)
    {
      id v46 = [v44 UUIDString];
      [a1 appendFormat:@"\n%*s%@ = %@", (4 * a5 + 4), " ", v10, v46];
LABEL_35:

      goto LABEL_38;
    }
    id v47 = v44;
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    if ((v48 & 1) == 0)
    {
      id v46 = v47;
      if (objc_opt_respondsToSelector())
      {
        v49 = objc_msgSend(v46, "descriptionWithIndent:showFullContent:");
        [a1 appendFormat:@"\n%*s%@ = {%@", (4 * (a5 + 1)), " ", v10, v49];

        objc_msgSend(a1, "appendFormat:", @"\n%*s}", (4 * (a5 + 1)), " ", v52, v53);
      }
      else
      {
        v50 = [v46 description];
        [a1 appendFormat:@"\n%*s%@ = %@", (4 * a5 + 4), " ", v10, v50];
      }
      goto LABEL_35;
    }
    if (a6) {
      [a1 appendFormat:@"\n%*s%@ = %@", (4 * a5 + 4), " ", v10, v47];
    }
    else {
      [a1 appendFormat:@"\n%*s%@ = <%lu-char-str>", (4 * a5 + 4), " ", v10, objc_msgSend(v47, "length")];
    }
  }
LABEL_38:
}

- (uint64_t)appendPrettyInt:()NEPrettyPrint withName:indent:
{
  return [a1 appendFormat:@"\n%*s%@ = %d", (4 * a5 + 4), " ", a4, a3];
}

- (uint64_t)appendPrettyBOOL:()NEPrettyPrint withName:indent:
{
  v5 = @"NO";
  if (a3) {
    v5 = @"YES";
  }
  return [a1 appendFormat:@"\n%*s%@ = %@", (4 * a5 + 4), " ", a4, v5];
}

@end