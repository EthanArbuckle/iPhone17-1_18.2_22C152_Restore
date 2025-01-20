@interface AMSCommandLineDialogTask
- (AMSCommandLineDialogTask)initWithRequest:(id)a3;
- (AMSDialogRequest)request;
- (double)dialogPadding;
- (double)maximumDialogWidth;
- (double)minimumDialogWidth;
- (id)_createHorizontolLineWithWidth:(int64_t)a3;
- (id)_createLinesFromText:(id)a3 width:(int64_t)a4;
- (id)_createText:(id)a3 width:(int64_t)a4 centered:(BOOL)a5 omitLeftPipe:(BOOL)a6;
- (id)_createTextfieldWithTextfield:(id)a3 width:(int64_t)a4;
- (id)_gatherTextfieldInput;
- (id)_getUserInput;
- (id)present;
- (int64_t)_gatherButtonInput;
- (int64_t)automaticButtonSelection;
- (void)_printMessage:(id)a3;
- (void)setAutomaticButtonSelection:(int64_t)a3;
- (void)setDialogPadding:(double)a3;
- (void)setMaximumDialogWidth:(double)a3;
- (void)setMinimumDialogWidth:(double)a3;
@end

@implementation AMSCommandLineDialogTask

- (AMSCommandLineDialogTask)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCommandLineDialogTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_automaticButtonSelection = -1;
    v6->_dialogPadding = 2.0;
    v6->_maximumDialogWidth = 70.0;
    v6->_minimumDialogWidth = 40.0;
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)present
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AMSCommandLineDialogTask_present__block_invoke;
  v5[3] = &unk_1E55A11F8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

AMSDialogResult *__35__AMSCommandLineDialogTask_present__block_invoke(uint64_t a1)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AMSLogConfig sharedConfig];
  if (!v1)
  {
    v1 = +[AMSLogConfig sharedConfig];
  }
  v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    v4 = [WeakRetained request];
    id v5 = [v4 logKey];
    id v6 = [WeakRetained request];
    *(_DWORD *)buf = 138543874;
    uint64_t v159 = v3;
    __int16 v160 = 2114;
    v161 = v5;
    __int16 v162 = 2114;
    v163 = v6;
    _os_log_impl(&dword_18D554000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting command line alert using request: %{public}@", buf, 0x20u);
  }
  v7 = [WeakRetained request];
  v8 = [v7 buttonActions];
  uint64_t v9 = [v8 count];

  [WeakRetained dialogPadding];
  uint64_t v11 = (uint64_t)(v10 * 2.0 + 2.0);
  v12 = [WeakRetained request];
  v13 = [v12 title];
  uint64_t v14 = [v13 length] + v11;

  [WeakRetained minimumDialogWidth];
  if (v15 >= (double)v14) {
    double v16 = v15;
  }
  else {
    double v16 = (double)v14;
  }
  [WeakRetained maximumDialogWidth];
  if (v17 >= (double)(uint64_t)v16) {
    double v18 = (double)(uint64_t)v16;
  }
  else {
    double v18 = v17;
  }
  v19 = [WeakRetained request];
  v20 = [v19 title];
  uint64_t v21 = [v20 length] + v11;

  [WeakRetained minimumDialogWidth];
  if (v22 >= (double)v21) {
    double v23 = v22;
  }
  else {
    double v23 = (double)v21;
  }
  [WeakRetained maximumDialogWidth];
  if (v24 >= (double)(uint64_t)v23) {
    double v25 = (double)(uint64_t)v23;
  }
  else {
    double v25 = v24;
  }
  [WeakRetained minimumDialogWidth];
  double v27 = v26;
  uint64_t v135 = v9;
  if (v9 == 2)
  {
    double v27 = v26 * 0.5;
    [WeakRetained maximumDialogWidth];
    double v29 = v28 * 0.5;
  }
  else
  {
    [WeakRetained maximumDialogWidth];
    double v29 = v30;
  }
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v31 = [WeakRetained request];
  v32 = [v31 buttonActions];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v150 objects:v157 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v151;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v151 != v36) {
          objc_enumerationMutation(v32);
        }
        v38 = [*(id *)(*((void *)&v150 + 1) + 8 * i) title];
        uint64_t v39 = [v38 length] + v11;

        if (v39 <= (uint64_t)v27) {
          uint64_t v40 = (uint64_t)v27;
        }
        else {
          uint64_t v40 = v39;
        }
        if (v40 >= (uint64_t)v29) {
          uint64_t v40 = (uint64_t)v29;
        }
        uint64_t v41 = v40 - v11;
        if (v35 <= v41) {
          uint64_t v35 = v41;
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v150 objects:v157 count:16];
    }
    while (v34);
  }
  else
  {
    uint64_t v35 = 0;
  }

  uint64_t v42 = (uint64_t)v18;
  if ((uint64_t)v25 > (uint64_t)v18) {
    uint64_t v42 = (uint64_t)v25;
  }
  uint64_t v43 = v35 + v11;
  if (v135 == 2) {
    uint64_t v43 = 2 * (v35 + v11) - 1;
  }
  if (v42 <= v43) {
    uint64_t v44 = v43;
  }
  else {
    uint64_t v44 = v42;
  }
  id v45 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v46 = [WeakRetained _createHorizontolLineWithWidth:v44];
  [v45 appendString:v46];

  v47 = [WeakRetained request];
  v48 = [v47 title];
  uint64_t v49 = [v48 length];
  BOOL v50 = v49 != 0;

  if (v49)
  {
    v51 = [WeakRetained request];
    v52 = [v51 title];
    v53 = [WeakRetained _createText:v52 width:v44 centered:1 omitLeftPipe:0];
    [v45 appendString:v53];
  }
  uint64_t v129 = v44;
  v54 = [WeakRetained request];
  v55 = [v54 message];
  uint64_t v56 = [v55 length];

  if (v56)
  {
    if (v49)
    {
      v57 = [WeakRetained _createText:@" " width:v44 centered:0 omitLeftPipe:0];
      [v45 appendString:v57];
    }
    v58 = [WeakRetained request];
    v59 = [v58 message];
    v60 = [WeakRetained _createText:v59 width:v44 centered:0 omitLeftPipe:0];
    [v45 appendString:v60];

    BOOL v50 = 1;
  }
  v61 = [WeakRetained request];
  v62 = [v61 textFields];
  uint64_t v63 = [v62 count];

  if (v63)
  {
    if (v50)
    {
      v64 = [WeakRetained _createText:@" " width:v44 centered:0 omitLeftPipe:0];
      [v45 appendString:v64];
    }
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    v65 = [WeakRetained request];
    v66 = [v65 textFields];

    uint64_t v67 = [v66 countByEnumeratingWithState:&v146 objects:v156 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v147;
      do
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v147 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = [WeakRetained _createTextfieldWithTextfield:*(void *)(*((void *)&v146 + 1) + 8 * j) width:v129];
          [v45 appendString:v71];
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v146 objects:v156 count:16];
      }
      while (v68);
    }
  }
  v72 = [WeakRetained _createHorizontolLineWithWidth:v129];
  v134 = v45;
  [v45 appendString:v72];

  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v73 = [WeakRetained request];
  v74 = [v73 buttonActions];

  uint64_t v75 = [v74 countByEnumeratingWithState:&v142 objects:v155 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v143;
    uint64_t v78 = 1;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v143 != v77) {
          objc_enumerationMutation(v74);
        }
        v80 = NSString;
        v81 = [*(id *)(*((void *)&v142 + 1) + 8 * k) title];
        v82 = [v80 stringWithFormat:@"(%ld) %@", v78 + k, v81];
        [v137 addObject:v82];
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v142 objects:v155 count:16];
      v78 += k;
    }
    while (v76);
  }

  if (v135 == 2)
  {
    double v83 = (double)v129 * 0.5;
    unint64_t v84 = vcvtpd_s64_f64(v83);
    unint64_t v85 = vcvtmd_s64_f64(v83);
    id v86 = [v137 objectAtIndexedSubscript:0];
    uint64_t v87 = [v137 objectAtIndexedSubscript:1];
    v88 = WeakRetained;
    unint64_t v133 = v84;
    v89 = [WeakRetained _createLinesFromText:v86 width:v84];
    v128 = (void *)v87;
    unint64_t v132 = v85;
    v90 = [WeakRetained _createLinesFromText:v87 width:v85];
    unint64_t v91 = [v89 count];
    v136 = v90;
    unint64_t v92 = [v90 count];
    if (v91 <= v92) {
      uint64_t v93 = v92;
    }
    else {
      uint64_t v93 = v91;
    }
    uint64_t v131 = v93;
    if (v93 >= 1)
    {
      unint64_t v94 = 0;
      v95 = @" ";
      do
      {
        v96 = v95;
        if (v94 < [v89 count])
        {
          v96 = [v89 objectAtIndexedSubscript:v94];
        }
        v97 = v95;
        if (v94 < [v136 count])
        {
          v95 = [v136 objectAtIndexedSubscript:v94];
        }
        v98 = [WeakRetained _createText:v96 width:v133 centered:1 omitLeftPipe:0];
        v99 = [WeakRetained _createText:v95 width:v132 centered:1 omitLeftPipe:1];
        v100 = objc_msgSend(v98, "substringToIndex:", objc_msgSend(v98, "length") - 1);

        [v134 appendFormat:@"%@%@", v100, v99];
        ++v94;
        v95 = v97;
      }
      while (v131 != v94);
    }
    v101 = [WeakRetained _createHorizontolLineWithWidth:v129];
    v102 = v89;
    v103 = v134;
    [v134 appendString:v101];
  }
  else
  {
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v86 = v137;
    uint64_t v104 = [v86 countByEnumeratingWithState:&v138 objects:v154 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v139;
      v103 = v134;
      do
      {
        for (uint64_t m = 0; m != v105; ++m)
        {
          if (*(void *)v139 != v106) {
            objc_enumerationMutation(v86);
          }
          v108 = [WeakRetained _createText:*(void *)(*((void *)&v138 + 1) + 8 * m) width:v129 centered:1 omitLeftPipe:0];
          [v134 appendString:v108];

          v109 = [WeakRetained _createHorizontolLineWithWidth:v129];
          [v134 appendString:v109];
        }
        uint64_t v105 = [v86 countByEnumeratingWithState:&v138 objects:v154 count:16];
      }
      while (v105);
      v88 = WeakRetained;
    }
    else
    {
      v88 = WeakRetained;
      v103 = v134;
    }
  }

  [v88 _printMessage:@"\n"];
  [v88 _printMessage:v103];
  [v88 _printMessage:@"\n"];
  v110 = [v88 _gatherTextfieldInput];
  if (![v110 count]) {
    goto LABEL_92;
  }
  if ([v88 automaticButtonSelection] < 0) {
    goto LABEL_92;
  }
  unint64_t v111 = [v88 automaticButtonSelection];
  v112 = [v88 request];
  v113 = [v112 buttonActions];
  unint64_t v114 = [v113 count];

  if (v111 >= v114 || (unint64_t v115 = [v88 automaticButtonSelection], v115 == -1)) {
LABEL_92:
  }
    unint64_t v115 = [v88 _gatherButtonInput];
  v116 = @"AMSDialogResultDismissIdentifier";
  if ((v115 & 0x8000000000000000) == 0)
  {
    v117 = [WeakRetained request];
    v118 = [v117 buttonActions];
    unint64_t v119 = [v118 count];

    if (v115 < v119)
    {
      v120 = [WeakRetained request];
      v121 = [v120 buttonActions];
      v122 = [v121 objectAtIndexedSubscript:v115];

      uint64_t v123 = [v122 identifier];

      v116 = (__CFString *)v123;
    }
  }
  v124 = [AMSDialogResult alloc];
  v125 = [WeakRetained request];
  v126 = [(AMSDialogResult *)v124 initWithOriginalRequest:v125 selectedActionIdentifier:v116];

  [(AMSDialogResult *)v126 setTextfieldValues:v110];
  return v126;
}

- (id)_createHorizontolLineWithWidth:(int64_t)a3
{
  uint64_t v3 = [&stru_1EDCA7308 stringByPaddingToLength:a3 - 2 withString:@"-" startingAtIndex:0];
  v4 = [NSString stringWithFormat:@" %@ \n", v3];

  return v4;
}

- (id)_createLinesFromText:(id)a3 width:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v31 = v4;
  obuint64_t j = [v4 componentsSeparatedByString:@" "];
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v38 + 1) + 8 * i) componentsSeparatedByString:@"\n"];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v35;
          char v13 = 1;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              if ((v13 & 1) == 0) {
                [v5 addObject:@"\n"];
              }
              [v5 addObject:v15];
              char v13 = 0;
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
            char v13 = 0;
          }
          while (v11);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v7);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(AMSCommandLineDialogTask *)self dialogPadding];
  double v18 = v17;
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v5 count])
  {
    uint64_t v20 = 0;
    uint64_t v21 = a4 - (uint64_t)(v18 * 2.0 + 2.0);
    while (1)
    {
      double v22 = [v5 objectAtIndexedSubscript:v20];
      char v23 = [v22 isEqualToString:@"\n"];
      uint64_t v24 = [v19 length];
      uint64_t v25 = [v22 length];
      if (v23) {
        break;
      }
      if (v24 + v25 + 1 <= v21)
      {
        if ([v19 length]) {
          [v19 appendString:@" "];
        }
        [v19 appendString:v22];
        goto LABEL_29;
      }
      [v16 addObject:v19];
      if ([v22 length] > (unint64_t)v21)
      {
        double v26 = [v22 substringToIndex:v21 - 1];
        goto LABEL_24;
      }
LABEL_25:
      uint64_t v27 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", v22];

      id v19 = (id)v27;
LABEL_29:

      if (++v20 >= (unint64_t)[v5 count]) {
        goto LABEL_30;
      }
    }
    [v16 addObject:v19];
    double v26 = &stru_1EDCA7308;
LABEL_24:

    double v22 = v26;
    goto LABEL_25;
  }
LABEL_30:
  if ([v19 length] || !objc_msgSend(v16, "count")) {
    [v16 addObject:v19];
  }

  return v16;
}

- (id)_createText:(id)a3 width:(int64_t)a4 centered:(BOOL)a5 omitLeftPipe:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v34 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(AMSCommandLineDialogTask *)self dialogPadding];
  double v11 = v10;
  id v35 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v33 = self;
  [(AMSCommandLineDialogTask *)self _createLinesFromText:v9 width:a4];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = @"|";
    if (v6) {
      uint64_t v15 = &stru_1EDCA7308;
    }
    else {
      uint64_t v15 = @"|";
    }
    v31 = v15;
    uint64_t v32 = *(void *)v37;
    int64_t v28 = a4 - (uint64_t)(v11 * 2.0 + 2.0);
    if (v6) {
      uint64_t v14 = @" |";
    }
    double v30 = v14;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [(AMSCommandLineDialogTask *)v33 dialogPadding];
        id v19 = [&stru_1EDCA7308 stringByPaddingToLength:(unint64_t)v18 withString:@" " startingAtIndex:0];
        uint64_t v20 = v30;
        uint64_t v21 = v31;
        unint64_t v22 = [v17 length];
        if (v34)
        {
          double v23 = ((double)v28 - (double)v22) * 0.5;
          unint64_t v24 = vcvtpd_s64_f64(v23);
          uint64_t v25 = [&stru_1EDCA7308 stringByPaddingToLength:vcvtmd_s64_f64(v23) withString:@" " startingAtIndex:0];
        }
        else
        {
          unint64_t v24 = v28 - v22;
          uint64_t v25 = &stru_1EDCA7308;
        }
        double v26 = [&stru_1EDCA7308 stringByPaddingToLength:v24 withString:@" " startingAtIndex:0];
        [v35 appendFormat:@"%@%@%@%@%@%@%@\n", v21, v19, v25, v17, v26, v19, v20];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }

  return v35;
}

- (id)_createTextfieldWithTextfield:(id)a3 width:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(AMSCommandLineDialogTask *)self dialogPadding];
  int64_t v9 = a4 - (uint64_t)(v8 * 2.0 + 2.0);
  double v10 = [&stru_1EDCA7308 stringByPaddingToLength:v9 - 2 withString:@"-" startingAtIndex:0];
  double v11 = [(AMSCommandLineDialogTask *)self _createText:v10 width:a4 centered:1 omitLeftPipe:0];
  [v7 appendString:v11];

  uint64_t v12 = NSString;
  uint64_t v13 = [v6 text];
  uint64_t v14 = (void *)v13;
  id v23 = v6;
  if (v13)
  {
    uint64_t v15 = [v12 stringWithFormat:@"| %@", v13, v6];
  }
  else
  {
    id v16 = [v6 placeholder];
    uint64_t v15 = [v12 stringWithFormat:@"| %@", v16, v23];
  }
  double v17 = [v15 stringByPaddingToLength:v9 - 1 withString:@" " startingAtIndex:0];

  double v18 = [NSString stringWithFormat:@"%@|", v17];

  id v19 = [(AMSCommandLineDialogTask *)self _createText:v18 width:a4 centered:0 omitLeftPipe:0];
  [v7 appendString:v19];

  uint64_t v20 = [&stru_1EDCA7308 stringByPaddingToLength:v9 - 2 withString:@"-" startingAtIndex:0];
  uint64_t v21 = [(AMSCommandLineDialogTask *)self _createText:v20 width:a4 centered:1 omitLeftPipe:0];
  [v7 appendString:v21];

  return v7;
}

- (int64_t)_gatherButtonInput
{
  if (+[AMSUnitTests isRunningUnitTests])
  {
    [(AMSCommandLineDialogTask *)self _printMessage:@"NOTE: Skipping button input while running in unit tests.\n      Automatically selecting the first button...\n"];
    return 0;
  }
  uint64_t v3 = [(AMSCommandLineDialogTask *)self request];
  id v4 = [v3 buttonActions];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    [(AMSCommandLineDialogTask *)self _printMessage:@"Press <return> to continue..."];
    id v12 = [(AMSCommandLineDialogTask *)self _getUserInput];
    return 0;
  }
  while (1)
  {
    [(AMSCommandLineDialogTask *)self _printMessage:@"Select a button: "];
    id v6 = [(AMSCommandLineDialogTask *)self _getUserInput];
    uint64_t v7 = [v6 integerValue];
    unint64_t v8 = v7 - 1;
    if (v7 >= 1)
    {
      int64_t v9 = [(AMSCommandLineDialogTask *)self request];
      double v10 = [v9 buttonActions];
      unint64_t v11 = [v10 count];

      if (v8 < v11) {
        break;
      }
    }
    [(AMSCommandLineDialogTask *)self _printMessage:@"Invalid input detected!\n"];
  }
  return v8;
}

- (id)_gatherTextfieldInput
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (+[AMSUnitTests isRunningUnitTests])
  {
    [(AMSCommandLineDialogTask *)self _printMessage:@"NOTE: Skipping textfield input while running in unit tests.\n"];
    id v3 = 0;
    goto LABEL_24;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = [(AMSCommandLineDialogTask *)self request];
  uint64_t v5 = [v4 textFields];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  unint64_t v8 = 0x1E4F29000uLL;
  uint64_t v30 = *(void *)v32;
  uint64_t v27 = self;
  do
  {
    uint64_t v9 = 0;
    uint64_t v28 = v7;
    do
    {
      if (*(void *)v32 != v30) {
        objc_enumerationMutation(obj);
      }
      double v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      unint64_t v11 = [v10 text];
      uint64_t v12 = [v11 length];

      uint64_t v13 = *(void **)(v8 + 24);
      uint64_t v14 = [v10 placeholder];
      uint64_t v15 = (void *)v14;
      if (v12)
      {
        id v16 = [v10 text];
        double v17 = [v13 stringWithFormat:@"Enter response for '%@' textfield [%@]: ", v15, v16];
      }
      else
      {
        double v17 = [v13 stringWithFormat:@"Enter response for '%@' textfield: ", v14];
      }

      [(AMSCommandLineDialogTask *)self _printMessage:v17];
      if ([v10 secure])
      {
        memset(&v37, 0, sizeof(v37));
        memset(&v36, 0, sizeof(v36));
        tcgetattr(0, &v37);
        termios v36 = v37;
        v37.c_lflag &= ~8uLL;
        tcsetattr(0, 0, &v37);
        scanf("%s", v35);
        double v18 = [*(id *)(v8 + 24) stringWithUTF8String:v35];
        tcsetattr(0, 0, &v36);
        [(AMSCommandLineDialogTask *)self _printMessage:@"\n"];
      }
      else
      {
        double v18 = [(AMSCommandLineDialogTask *)self _getUserInput];
      }
      id v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v20 = [v18 stringByTrimmingCharactersInSet:v19];
      if ([v20 length])
      {

LABEL_18:
        goto LABEL_19;
      }
      unint64_t v21 = v8;
      id v22 = v3;
      id v23 = [v10 text];
      uint64_t v24 = [v23 length];

      if (v24)
      {
        [v10 text];
        double v18 = v19 = v18;
        id v3 = v22;
        unint64_t v8 = v21;
        self = v27;
        uint64_t v7 = v28;
        goto LABEL_18;
      }
      id v3 = v22;
      unint64_t v8 = v21;
      self = v27;
      uint64_t v7 = v28;
LABEL_19:
      [v3 addObject:v18];

      ++v9;
    }
    while (v7 != v9);
    uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    uint64_t v7 = v25;
  }
  while (v25);
LABEL_23:

LABEL_24:
  return v3;
}

- (id)_getUserInput
{
  v2 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardInput];
  id v3 = [v2 availableData];
  id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  uint64_t v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (void)_printMessage:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  id v3 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
  [v3 writeData:v4];
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (double)maximumDialogWidth
{
  return self->_maximumDialogWidth;
}

- (void)setMaximumDialogWidth:(double)a3
{
  self->_maximumDialogWidth = a3;
}

- (double)minimumDialogWidth
{
  return self->_minimumDialogWidth;
}

- (void)setMinimumDialogWidth:(double)a3
{
  self->_minimumDialogWidth = a3;
}

- (double)dialogPadding
{
  return self->_dialogPadding;
}

- (void)setDialogPadding:(double)a3
{
  self->_dialogPadding = a3;
}

- (int64_t)automaticButtonSelection
{
  return self->_automaticButtonSelection;
}

- (void)setAutomaticButtonSelection:(int64_t)a3
{
  self->_automaticButtonSelection = a3;
}

- (void).cxx_destruct
{
}

@end