@interface AXMAddressFormatter
+ (void)replaceDirectionalAbbreviations:(id *)a3;
@end

@implementation AXMAddressFormatter

+ (void)replaceDirectionalAbbreviations:(id *)a3
{
  uint64_t v4 = [*a3 rangeOfString:@" N "];
  id v5 = *a3;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" N ";
LABEL_21:
    v22 = @" North ";
    goto LABEL_37;
  }
  uint64_t v6 = [v5 rangeOfString:@" N. "];
  id v5 = *a3;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" N. ";
    goto LABEL_21;
  }
  uint64_t v7 = [v5 rangeOfString:@" S "];
  id v5 = *a3;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" S ";
LABEL_24:
    v22 = @" South ";
    goto LABEL_37;
  }
  uint64_t v8 = [v5 rangeOfString:@" S. "];
  id v5 = *a3;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" S. ";
    goto LABEL_24;
  }
  uint64_t v9 = [v5 rangeOfString:@" E "];
  id v5 = *a3;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" E ";
LABEL_27:
    v22 = @" East ";
    goto LABEL_37;
  }
  uint64_t v10 = [v5 rangeOfString:@" E. "];
  id v5 = *a3;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" E. ";
    goto LABEL_27;
  }
  uint64_t v11 = [v5 rangeOfString:@" W "];
  id v5 = *a3;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" W ";
LABEL_30:
    v22 = @" West ";
    goto LABEL_37;
  }
  uint64_t v12 = [v5 rangeOfString:@" W. "];
  id v5 = *a3;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" W. ";
    goto LABEL_30;
  }
  uint64_t v13 = [v5 rangeOfString:@" NE "];
  id v5 = *a3;
  v14 = @" NE ";
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_32:
    v22 = @" North East ";
    goto LABEL_37;
  }
  uint64_t v15 = [v5 rangeOfString:@" NE "];
  id v5 = *a3;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" NE. ";
    goto LABEL_32;
  }
  uint64_t v16 = [v5 rangeOfString:@" NW "];
  id v5 = *a3;
  v14 = @" NW ";
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_34:
    v22 = @" North West ";
    goto LABEL_37;
  }
  uint64_t v17 = [v5 rangeOfString:@" NW "];
  id v5 = *a3;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" NW. ";
    goto LABEL_34;
  }
  uint64_t v18 = [v5 rangeOfString:@" SE "];
  id v5 = *a3;
  v14 = @" SE ";
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_36:
    v22 = @" South East ";
    goto LABEL_37;
  }
  uint64_t v19 = [v5 rangeOfString:@" SE "];
  id v5 = *a3;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = @" SE. ";
    goto LABEL_36;
  }
  uint64_t v20 = [v5 rangeOfString:@" SW "];
  id v5 = *a3;
  v14 = @" SW ";
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = [v5 rangeOfString:@" SW "];
    id v5 = *a3;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_38;
    }
    v14 = @" SW. ";
  }
  v22 = @" South West ";
LABEL_37:
  id v5 = [v5 stringByReplacingOccurrencesOfString:v14 withString:v22];
  *a3 = v5;
LABEL_38:
  int v23 = [v5 hasSuffix:@" N"];
  id v24 = *a3;
  if (v23)
  {
    uint64_t v25 = [*a3 length] - 1;
    v26 = @"North";
LABEL_52:
    v34 = v24;
    uint64_t v35 = 1;
LABEL_70:
    objc_msgSend(v34, "stringByReplacingCharactersInRange:withString:", v25, v35, v26);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v45;
    goto LABEL_71;
  }
  int v27 = [*a3 hasSuffix:@" N."];
  id v28 = *a3;
  if (v27)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"North";
LABEL_69:
    v34 = v28;
    uint64_t v35 = 2;
    goto LABEL_70;
  }
  int v29 = [*a3 hasSuffix:@" S"];
  id v24 = *a3;
  if (v29)
  {
    uint64_t v25 = [*a3 length] - 1;
    v26 = @"South";
    goto LABEL_52;
  }
  int v30 = [*a3 hasSuffix:@" S."];
  id v28 = *a3;
  if (v30)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"South";
    goto LABEL_69;
  }
  int v31 = [*a3 hasSuffix:@" E"];
  id v24 = *a3;
  if (v31)
  {
    uint64_t v25 = [*a3 length] - 1;
    v26 = @"East";
    goto LABEL_52;
  }
  int v32 = [*a3 hasSuffix:@" E."];
  id v28 = *a3;
  if (v32)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"East";
    goto LABEL_69;
  }
  int v33 = [*a3 hasSuffix:@" W"];
  id v24 = *a3;
  if (v33)
  {
    uint64_t v25 = [*a3 length] - 1;
    v26 = @"West";
    goto LABEL_52;
  }
  int v36 = [*a3 hasSuffix:@" W."];
  id v28 = *a3;
  if (v36)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"West";
    goto LABEL_69;
  }
  int v37 = [*a3 hasSuffix:@" NE"];
  id v28 = *a3;
  if (v37)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"North East";
    goto LABEL_69;
  }
  int v38 = [*a3 hasSuffix:@" NE."];
  id v39 = *a3;
  if (v38)
  {
    uint64_t v25 = [*a3 length] - 3;
    v26 = @"North East";
LABEL_101:
    v34 = v39;
    uint64_t v35 = 3;
    goto LABEL_70;
  }
  int v40 = [*a3 hasSuffix:@" NW"];
  id v28 = *a3;
  if (v40)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"North West";
    goto LABEL_69;
  }
  int v41 = [*a3 hasSuffix:@" NW."];
  id v39 = *a3;
  if (v41)
  {
    uint64_t v25 = [*a3 length] - 3;
    v26 = @"North West";
    goto LABEL_101;
  }
  int v42 = [*a3 hasSuffix:@" SE"];
  id v28 = *a3;
  if (v42)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"South East";
    goto LABEL_69;
  }
  int v43 = [*a3 hasSuffix:@" SE."];
  id v39 = *a3;
  if (v43)
  {
    uint64_t v25 = [*a3 length] - 3;
    v26 = @"South East";
    goto LABEL_101;
  }
  int v44 = [*a3 hasSuffix:@" SW"];
  id v28 = *a3;
  if (v44)
  {
    uint64_t v25 = [*a3 length] - 2;
    v26 = @"South West";
    goto LABEL_69;
  }
  int v68 = [*a3 hasSuffix:@" SW."];
  id v39 = *a3;
  if (v68)
  {
    uint64_t v25 = [*a3 length] - 3;
    v26 = @"South West";
    goto LABEL_101;
  }
  id v45 = *a3;
LABEL_71:
  int v46 = [v45 hasSuffix:@" ST"];
  id v47 = *a3;
  if (!v46)
  {
    int v50 = [*a3 hasSuffix:@" AVE"];
    id v51 = *a3;
    if (v50)
    {
      uint64_t v48 = [*a3 length] - 2;
      v49 = @"Avenue";
    }
    else
    {
      int v52 = [*a3 hasSuffix:@" RD"];
      id v47 = *a3;
      if (v52)
      {
        uint64_t v48 = [*a3 length] - 1;
        v49 = @"Road";
        goto LABEL_77;
      }
      int v55 = [*a3 hasSuffix:@" LN"];
      id v51 = *a3;
      if (!v55) {
        goto LABEL_82;
      }
      uint64_t v48 = [*a3 length] - 2;
      v49 = @"Lane";
    }
    v53 = v51;
    uint64_t v54 = 2;
    goto LABEL_81;
  }
  uint64_t v48 = [*a3 length] - 1;
  v49 = @"Street";
LABEL_77:
  v53 = v47;
  uint64_t v54 = 1;
LABEL_81:
  objc_msgSend(v53, "stringByReplacingCharactersInRange:withString:", v48, v54, v49);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v51;
LABEL_82:
  uint64_t v56 = [v51 rangeOfString:@" ST "];
  id v57 = *a3;
  if (v56 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v58 = [v57 rangeOfString:@" AVE "];
    id v57 = *a3;
    if (v58 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v59 = [v57 rangeOfString:@" RD "];
      id v57 = *a3;
      if (v59 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v60 = [v57 rangeOfString:@" LN "];
        id v57 = *a3;
        if (v60 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_91;
        }
        v61 = @" LN ";
        v62 = @" Lane ";
      }
      else
      {
        v61 = @" RD ";
        v62 = @" Road ";
      }
    }
    else
    {
      v61 = @" AVE ";
      v62 = @" Avenue ";
    }
  }
  else
  {
    v61 = @" ST ";
    v62 = @" Street ";
  }
  id v57 = [v57 stringByReplacingOccurrencesOfString:v61 withString:v62];
  *a3 = v57;
LABEL_91:
  uint64_t v63 = [v57 rangeOfString:@" STE "];
  id v64 = *a3;
  if (v63 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v65 = [v64 rangeOfString:@" APT "];
    id v64 = *a3;
    if (v65 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v64 rangeOfString:@" UNT "] == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      id v64 = *a3;
      v66 = @" UNT ";
      v67 = @" Unit ";
    }
    else
    {
      v66 = @" APT ";
      v67 = @" Apartment ";
    }
  }
  else
  {
    v66 = @" STE ";
    v67 = @" Suite ";
  }
  *a3 = [v64 stringByReplacingOccurrencesOfString:v66 withString:v67];
}

@end