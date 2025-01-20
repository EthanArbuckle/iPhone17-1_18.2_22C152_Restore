@interface BPSRemoteUISetupStyle
- (int64_t)navBarActivityIndicatorStyle;
- (void)_applyToLabel:(id)a3;
- (void)_applyToTitleLabel:(id)a3;
- (void)applyToObjectModel:(id)a3;
@end

@implementation BPSRemoteUISetupStyle

- (void)_applyToTitleLabel:(id)a3
{
  id v9 = a3;
  v3 = BPSTextColor();
  [v9 setTextColor:v3];

  v4 = [MEMORY[0x263F1C550] blackColor];
  [v9 setBackgroundColor:v4];

  v5 = BPSFontWithSize(30.0);
  [v9 setFont:v5];

  [v9 setTextAlignment:1];
  v6 = [v9 text];
  v7 = [v6 componentsSeparatedByString:@" "];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    [v9 setNumberOfLines:1];
    [v9 setAdjustsFontSizeToFitWidth:1];
  }
}

- (void)_applyToLabel:(id)a3
{
  id v3 = a3;
  v4 = BPSTextColor();
  [v3 setTextColor:v4];

  id v5 = [MEMORY[0x263F1C550] blackColor];
  [v3 setBackgroundColor:v5];
}

- (void)applyToObjectModel:(id)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 setNextButtonStyle:2];
  v76 = v3;
  [v3 allPages];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v83 = *(void *)v100;
    double v6 = *MEMORY[0x263F1D5D0];
    uint64_t v90 = *MEMORY[0x263F1C240];
    do
    {
      uint64_t v7 = 0;
      uint64_t v77 = v5;
      do
      {
        if (*(void *)v100 != v83) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v99 + 1) + 8 * v7);
        if ([v8 hasWebView])
        {
          id v9 = [v8 webViewOM];
          v10 = [v9 webView];

          v11 = [v10 scrollView];
          [v11 setDecelerationRate:v6];

          v12 = [v10 scrollView];
          [v12 setIndicatorStyle:2];

          objc_msgSend(v10, "evaluateJavaScript:completionHandler:", @"document.body.style.webkitUserSelect='none';",
            0);
        }
        [v8 setShowsTitlesAsHeaderViews:1];
        objc_msgSend(v8, "setTitleLabelPadding:", 6.0, 0.0, 14.0, 0.0);
        v13 = [v8 titleLabel];
        [(BPSRemoteUISetupStyle *)self _applyToTitleLabel:v13];

        if ([v8 hasTableView])
        {
          v81 = v8;
          uint64_t v82 = v7;
          v14 = [v8 tableViewOM];
          v15 = [v14 tableView];
          v16 = [MEMORY[0x263F1C550] blackColor];
          [v15 setBackgroundColor:v16];

          [v15 setBackgroundView:0];
          v17 = BPSSeparatorColor();
          [v15 setSeparatorColor:v17];

          v79 = v15;
          [v15 setIndicatorStyle:2];
          v80 = v14;
          v18 = [v14 sections];
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v85 = v18;
          uint64_t v87 = [v18 countByEnumeratingWithState:&v95 objects:v106 count:16];
          if (!v87) {
            goto LABEL_36;
          }
          uint64_t v86 = *(void *)v96;
          while (1)
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v96 != v86) {
                objc_enumerationMutation(v85);
              }
              v88 = *(void **)(*((void *)&v95 + 1) + 8 * v19);
              uint64_t v89 = v19;
              v20 = [v88 rows];
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v91 objects:v105 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v92;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v92 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    v25 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                    v26 = [v25 tableCell];
                    v27 = [v25 attributes];
                    v28 = [v27 objectForKey:@"class"];
                    int v29 = [v28 isEqualToString:@"label"];

                    if (v29)
                    {
                      v30 = [v26 textLabel];
                      v31 = BPSForegroundColor();
                      [v26 setBackgroundColor:v31];

                      v32 = BPSTextColor();
                      [v30 setTextColor:v32];

                      v33 = BPSFontWithSize(15.0);
                      [v30 setFont:v33];

                      [v30 setAdjustsFontSizeToFitWidth:1];
                      [v30 setMinimumScaleFactor:0.70588237];
                      v34 = [v26 detailTextLabel];
                      v35 = BPSTextColor();
                      [v34 setTextColor:v35];

                      v36 = [v25 attributes];
                      v37 = (void *)[v36 mutableCopy];

                      [v37 setObject:@"white" forKey:@"labelColor"];
                      v38 = [v37 objectForKey:@"radioGroup"];

                      if (v38) {
                        [v37 setObject:@"systemOrange" forKey:@"radioGroupSelectedColor"];
                      }
                      [v25 setAttributes:v37];
                      goto LABEL_26;
                    }
                    v39 = BPSForegroundColor();
                    [v26 setBackgroundColor:v39];

                    v40 = [v26 textLabel];
                    v41 = BPSSetupTintColor();
                    [v40 setTextColor:v41];

                    v42 = [v26 editableTextField];

                    if (!v42) {
                      goto LABEL_28;
                    }
                    v43 = [v26 editableTextField];
                    v44 = BPSTextColor();
                    [v43 setTextColor:v44];

                    v45 = [v26 editableTextField];
                    v30 = [v45 placeholder];

                    if ([v30 length])
                    {
                      uint64_t v103 = v90;
                      v46 = [MEMORY[0x263F1C550] lightGrayColor];
                      v104 = v46;
                      v37 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];

                      v47 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v30 attributes:v37];
                      v48 = [v26 editableTextField];
                      [v48 setAttributedPlaceholder:v47];

LABEL_26:
                    }

LABEL_28:
                    id v49 = objc_alloc_init(MEMORY[0x263F1CB60]);
                    v50 = BPSCellHightlightColor();
                    [v49 setBackgroundColor:v50];

                    [v26 setSelectedBackgroundView:v49];
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v91 objects:v105 count:16];
                }
                while (v22);
              }
              v51 = [v88 footerView];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v52 = [v51 linkButton];
                v53 = [v52 titleLabel];
                v54 = BPSFontWithSize(15.0);
                [v53 setFont:v54];
              }
              v55 = [v88 headerView];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v56 = [v55 headerLabel];
                v57 = [v55 subHeaderLabel];
                [(BPSRemoteUISetupStyle *)self _applyToLabel:v56];
                [(BPSRemoteUISetupStyle *)self _applyToLabel:v57];
              }
              uint64_t v19 = v89 + 1;
            }
            while (v89 + 1 != v87);
            uint64_t v87 = [v85 countByEnumeratingWithState:&v95 objects:v106 count:16];
            if (!v87)
            {
LABEL_36:

              uint64_t v5 = v77;
              uint64_t v8 = v81;
              uint64_t v7 = v82;
              v59 = v79;
              v58 = v80;
              goto LABEL_43;
            }
          }
        }
        if ([v8 hasPasscodeView])
        {
          v60 = [v8 passcodeViewOM];
          v61 = [v60 passcodeView];
          [MEMORY[0x263F1C550] blackColor];
          v63 = v62 = v8;
          [v61 setBackgroundColor:v63];

          uint64_t v8 = v62;
          v64 = [v62 passcodeViewOM];
          v65 = BPSTextColor();
          [v64 setForegroundColor:v65];

          v66 = [v62 passcodeViewOM];
          [v66 setKeyboardAppearance:1];

          v58 = [v62 containerView];
          v67 = (void *)MEMORY[0x263F1C550];
        }
        else
        {
          if ([v8 hasSpinnerView])
          {
            v68 = [v8 spinnerViewOM];
            v69 = [MEMORY[0x263F1C550] whiteColor];
            [v68 setSpinnerColor:v69];
          }
          v58 = [v8 containerView];
          v67 = (void *)MEMORY[0x263F1C550];
        }
        v59 = [v67 blackColor];
        [v58 setBackgroundColor:v59];
LABEL_43:

        v70 = [v8 toolbar];
        [v70 setBarStyle:1];
        [v70 setTranslucent:0];
        v71 = [v8 leftToolbarItem];
        BPSSetupTintColor();
        v73 = v72 = v8;
        [v71 setTintColor:v73];

        v74 = [v72 rightToolbarItem];
        v75 = BPSSetupTintColor();
        [v74 setTintColor:v75];

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
    }
    while (v5);
  }
}

- (int64_t)navBarActivityIndicatorStyle
{
  return 100;
}

@end