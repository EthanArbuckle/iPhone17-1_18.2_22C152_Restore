@interface NSMutableString
- (void)appendPrettyObject:(int)a3 withIndent:(uint64_t)a4 options:(unint64_t)a5 depth:;
- (void)appendPrettyObject:(uint64_t)a3 withName:(int)a4 andIndent:(uint64_t)a5 options:(unint64_t)a6 depth:;
@end

@implementation NSMutableString

- (void)appendPrettyObject:(uint64_t)a3 withName:(int)a4 andIndent:(uint64_t)a5 options:(unint64_t)a6 depth:
{
  if (a1)
  {
    uint64_t v11 = (4 * a4 + 4);
    id v12 = a2;
    [a1 appendFormat:@"\n%*s%@ = ", v11, " ", a3];
    -[NSMutableString appendPrettyObject:withIndent:options:depth:](a1, v12, a4, a5, a6);
  }
}

- (void)appendPrettyObject:(int)a3 withIndent:(uint64_t)a4 options:(unint64_t)a5 depth:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  self;
  if (a5 > 4) {
    goto LABEL_41;
  }
  if ((isa_nsarray(v41) & 1) != 0 || isa_nsset(v41))
  {
    id v8 = v41;
    int v9 = isa_nsset(v8);
    v10 = "(";
    if (v9)
    {
      v10 = "{(";
      uint64_t v11 = ")}";
    }
    else
    {
      uint64_t v11 = ")";
    }
    objc_msgSend(a1, "appendFormat:", @"%s", v10);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v39 = v11;
      uint64_t v15 = (a3 + 1);
      int v16 = 4 * a3;
      uint64_t v17 = *(void *)v44;
      int v38 = v16;
      uint64_t v18 = (v16 + 8);
      unint64_t v19 = a5 + 1;
      do
      {
        v20 = v12;
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v20);
          }
          uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          objc_msgSend(a1, "appendFormat:", @"\n%*s", v18, " ");
          -[NSMutableString appendPrettyObject:withIndent:options:depth:](a1, v22, v15, a4, v19);
          [a1 appendFormat:@","];
        }
        id v12 = v20;
        uint64_t v14 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v14);

      objc_msgSend(a1, "appendFormat:", @"\n%*s", (v38 + 4), " ");
      uint64_t v11 = v39;
    }
    else
    {
    }
    objc_msgSend(a1, "appendFormat:", @"%s", v11);

    goto LABEL_36;
  }
  if (!isa_nsdictionary(v41))
  {
LABEL_41:
    if (isa_nsstring(v41))
    {
      id v33 = v41;
      v34 = v33;
      if ((~a4 & 3) != 0) {
        [a1 appendFormat:@"%@", v33];
      }
      else {
        objc_msgSend(a1, "appendFormat:", @"<%lu-char-str>", objc_msgSend(v33, "length"));
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      int v35 = a3 + 1;
      v36 = [v41 descriptionWithIndent:(a3 + 1) options:a4];
      [a1 appendFormat:@"{%@", v36];

      objc_msgSend(a1, "appendFormat:", @"\n%*s}", (4 * v35), " ");
    }
    else
    {
      v37 = [v41 description];
      [a1 appendFormat:@"%@", v37];
    }
    goto LABEL_36;
  }
  id v23 = v41;
  [a1 appendFormat:@"{"];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    int v40 = a3;
    uint64_t v28 = (a3 + 1);
    unint64_t v29 = a5 + 1;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v31 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        v32 = [v24 objectForKeyedSubscript:v31];
        -[NSMutableString appendPrettyObject:withName:andIndent:options:depth:](a1, v32, v31, v28, a4, v29);
        [a1 appendFormat:@","];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v26);

    objc_msgSend(a1, "appendFormat:", @"\n%*s", (4 * v40 + 4), " ");
  }
  else
  {
  }
  [a1 appendString:@"}"];

LABEL_36:
}

@end