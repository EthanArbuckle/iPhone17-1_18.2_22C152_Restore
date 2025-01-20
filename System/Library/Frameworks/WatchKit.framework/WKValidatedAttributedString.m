@interface WKValidatedAttributedString
@end

@implementation WKValidatedAttributedString

void ___WKValidatedAttributedString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a2;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    uint64_t v11 = *MEMORY[0x263F1C208];
    uint64_t v48 = *MEMORY[0x263F1C258];
    uint64_t v45 = *MEMORY[0x263F1C210];
    uint64_t v46 = *MEMORY[0x263F1C240];
    uint64_t v44 = *MEMORY[0x263F1C2A0];
    uint64_t v43 = *MEMORY[0x263F1C2D0];
    uint64_t v42 = *MEMORY[0x263F1C290];
    uint64_t v41 = *MEMORY[0x263F1C238];
    uint64_t v47 = a4;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v49 + 1) + 8 * v12);
        if ([v13 isEqualToString:v11])
        {
          v14 = wk_default_log();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_11;
          }
          v15 = [*(id *)(a1 + 32) string];
          *(_DWORD *)buf = 136446723;
          v54 = "_WKValidatedAttributedString_block_invoke";
          __int16 v55 = 1024;
          int v56 = 315;
          __int16 v57 = 2113;
          v58 = v15;
          v16 = v14;
          v17 = "%{public}s:%d: Attributed string '%{private}@' contains NSAttachmentAttributeName. Removed";
LABEL_40:
          _os_log_error_impl(&dword_2211F3000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x1Cu);

          a4 = v47;
          goto LABEL_11;
        }
        if ([v13 isEqualToString:v48])
        {
          v14 = wk_default_log();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_11;
          }
          v15 = [*(id *)(a1 + 32) string];
          *(_DWORD *)buf = 136446723;
          v54 = "_WKValidatedAttributedString_block_invoke";
          __int16 v55 = 1024;
          int v56 = 318;
          __int16 v57 = 2113;
          v58 = v15;
          v16 = v14;
          v17 = "%{public}s:%d: Attributed string '%{private}@' contains NSLinkAttributeName. Removed";
          goto LABEL_40;
        }
        if ([v13 isEqualToString:v46])
        {
          v18 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          a4 = v47;
          if ((isKindOfClass & 1) == 0)
          {
            v14 = wk_default_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v40 = [*(id *)(a1 + 32) string];
              uint64_t v34 = [v7 objectForKeyedSubscript:v13];
              *(_DWORD *)buf = 136446979;
              v54 = "_WKValidatedAttributedString_block_invoke";
              __int16 v55 = 1024;
              int v56 = 321;
              __int16 v57 = 2113;
              v58 = v40;
              __int16 v59 = 2114;
              uint64_t v60 = v34;
              v31 = (void *)v34;
              v32 = v14;
              v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSForegroundColorAttributeName that isn't a "
                    "UIColor (%{public}@). Removed";
              goto LABEL_38;
            }
LABEL_11:

            objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v13, a3, a4);
            goto LABEL_12;
          }
        }
        if ([v13 isEqualToString:v45])
        {
          v20 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          char v21 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v21 & 1) == 0)
          {
            v14 = wk_default_log();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_11;
            }
            v40 = [*(id *)(a1 + 32) string];
            uint64_t v35 = [v7 objectForKeyedSubscript:v13];
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            __int16 v55 = 1024;
            int v56 = 324;
            __int16 v57 = 2113;
            v58 = v40;
            __int16 v59 = 2114;
            uint64_t v60 = v35;
            v31 = (void *)v35;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSBackgroundColorAttributeName that isn't a UI"
                  "Color (%{public}@). Removed";
LABEL_38:
            _os_log_error_impl(&dword_2211F3000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x26u);

            a4 = v47;
            goto LABEL_11;
          }
        }
        if ([v13 isEqualToString:v44])
        {
          v22 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          char v23 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v23 & 1) == 0)
          {
            v14 = wk_default_log();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_11;
            }
            v40 = [*(id *)(a1 + 32) string];
            uint64_t v36 = [v7 objectForKeyedSubscript:v13];
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            __int16 v55 = 1024;
            int v56 = 327;
            __int16 v57 = 2113;
            v58 = v40;
            __int16 v59 = 2114;
            uint64_t v60 = v36;
            v31 = (void *)v36;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSStrokeColorAttributeName that isn't a UIColo"
                  "r (%{public}@). Removed";
            goto LABEL_38;
          }
        }
        if ([v13 isEqualToString:v43])
        {
          v24 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          char v25 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v25 & 1) == 0)
          {
            v14 = wk_default_log();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_11;
            }
            v40 = [*(id *)(a1 + 32) string];
            uint64_t v37 = [v7 objectForKeyedSubscript:v13];
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            __int16 v55 = 1024;
            int v56 = 330;
            __int16 v57 = 2113;
            v58 = v40;
            __int16 v59 = 2114;
            uint64_t v60 = v37;
            v31 = (void *)v37;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSUnderlineColorAttributeName that isn't a UIC"
                  "olor (%{public}@). Removed";
            goto LABEL_38;
          }
        }
        if ([v13 isEqualToString:v42])
        {
          v26 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          char v27 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v27 & 1) == 0)
          {
            v14 = wk_default_log();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_11;
            }
            v40 = [*(id *)(a1 + 32) string];
            uint64_t v38 = [v7 objectForKeyedSubscript:v13];
            *(_DWORD *)buf = 136446979;
            v54 = "_WKValidatedAttributedString_block_invoke";
            __int16 v55 = 1024;
            int v56 = 333;
            __int16 v57 = 2113;
            v58 = v40;
            __int16 v59 = 2114;
            uint64_t v60 = v38;
            v31 = (void *)v38;
            v32 = v14;
            v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSStrikethroughColorAttributeName that isn't a"
                  " UIColor (%{public}@). Removed";
            goto LABEL_38;
          }
        }
        if ([v13 isEqualToString:v41])
        {
          v28 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          char v29 = objc_opt_isKindOfClass();

          a4 = v47;
          if ((v29 & 1) == 0)
          {
            v14 = wk_default_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v40 = [*(id *)(a1 + 32) string];
              uint64_t v30 = [v7 objectForKeyedSubscript:v13];
              *(_DWORD *)buf = 136446979;
              v54 = "_WKValidatedAttributedString_block_invoke";
              __int16 v55 = 1024;
              int v56 = 336;
              __int16 v57 = 2113;
              v58 = v40;
              __int16 v59 = 2114;
              uint64_t v60 = v30;
              v31 = (void *)v30;
              v32 = v14;
              v33 = "%{public}s:%d: Attributed string '%{private}@' contains NSFontAttributeName that isn't a UIFont (%{p"
                    "ublic}@). Removed";
              goto LABEL_38;
            }
            goto LABEL_11;
          }
        }
LABEL_12:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v39 = [v7 countByEnumeratingWithState:&v49 objects:v61 count:16];
      uint64_t v9 = v39;
    }
    while (v39);
  }
}

@end