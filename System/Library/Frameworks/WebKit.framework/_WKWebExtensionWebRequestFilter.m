@interface _WKWebExtensionWebRequestFilter
- (BOOL)matchesRequestForResourceOfType:(int64_t)a3 URL:(id)a4 tabID:(double)a5 windowID:(double)a6;
- (_WKWebExtensionWebRequestFilter)initWithDictionary:(id)a3 outErrorMessage:(id *)a4;
- (id).cxx_construct;
- (id)_initializeWithDictionary:(id)a3;
@end

@implementation _WKWebExtensionWebRequestFilter

- (_WKWebExtensionWebRequestFilter)initWithDictionary:(id)a3 outErrorMessage:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_WKWebExtensionWebRequestFilter;
  v7 = [(_WKWebExtensionWebRequestFilter *)&v12 init];
  if (v7)
  {
    if ((_MergedGlobals_40 & 1) == 0)
    {
      v16[0] = @"urls";
      qword_1EB358A78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      _MergedGlobals_40 = 1;
    }
    if ((byte_1EB358A71 & 1) == 0)
    {
      v14[0] = @"urls";
      uint64_t v13 = objc_opt_class();
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      v15[0] = v11;
      v14[1] = @"types";
      v15[1] = objc_opt_class();
      v14[2] = @"tabId";
      v15[2] = objc_opt_class();
      v14[3] = @"windowId";
      v15[3] = objc_opt_class();
      qword_1EB358A80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

      byte_1EB358A71 = 1;
    }
    if (WebKit::validateDictionary(v6, 0, (void *)qword_1EB358A78, (void *)qword_1EB358A80, a4)
      && ([(_WKWebExtensionWebRequestFilter *)v7 _initializeWithDictionary:v6],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          (*a4 = v8) == 0))
    {
      v9 = v7;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    *a4 = @"Runtime failure.";
  }

  return v9;
}

- (id)_initializeWithDictionary:(id)a3
{
  __y[16] = *(long double *)MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v3 = [v59 objectForKeyedSubscript:@"urls"];
  if ([v3 count])
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v5 = (NSArray *)v3;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v61 objects:__y count:16];
    if (v6)
    {
      id v7 = 0;
      uint64_t v8 = *(void *)v62;
      while (2)
      {
        uint64_t v9 = 0;
        v10 = v7;
        do
        {
          if (*(void *)v62 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v61 + 1) + 8 * v9);
          objc_super v12 = [WKWebExtensionMatchPattern alloc];
          id v60 = v10;
          uint64_t v13 = [(WKWebExtensionMatchPattern *)v12 initWithString:v11 error:&v60];
          id v7 = v60;

          if (!v13)
          {
            v15 = [v7 userInfo];
            v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
            WebKit::toErrorString(0, &cfstr_Urls.isa, &cfstr_IsAnInvalidMat.isa, v17, v11, v16);
            id v14 = (id)objc_claimAutoreleasedReturnValue();

            v5 = v4;
            v4 = 0;
            goto LABEL_14;
          }
          [(NSArray *)v4 addObject:v13];

          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v61 objects:__y count:16];
        if (v6) {
          continue;
        }
        break;
      }
      id v14 = 0;
    }
    else
    {
      id v14 = 0;
      id v7 = 0;
    }
LABEL_14:
  }
  else
  {
    id v14 = 0;
    v4 = 0;
  }

  id v18 = v14;
  urlPatterns = self->_urlPatterns;
  self->_urlPatterns = v4;

  if (!v18)
  {
    id v20 = [v59 objectForKeyedSubscript:@"types"];
    if ([v20 count])
    {
      v21 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v22 = (NSSet *)v20;
      uint64_t v23 = [(NSSet *)v22 countByEnumeratingWithState:&v61 objects:__y count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v62;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v62 != v24) {
              objc_enumerationMutation(v22);
            }
            id v26 = *(id *)(*((void *)&v61 + 1) + 8 * i);
            v28 = [&unk_1EEA53188 objectForKeyedSubscript:v26];
            if (!v28)
            {
              WebKit::toErrorString(0, &cfstr_Types.isa, &cfstr_IsAnUnknownRes.isa, v27, v26);
              id v29 = (id)objc_claimAutoreleasedReturnValue();

              v22 = v21;
              v21 = 0;
              goto LABEL_27;
            }

            [(NSSet *)v21 addObject:v28];
          }
          uint64_t v23 = [(NSSet *)v22 countByEnumeratingWithState:&v61 objects:__y count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
      id v29 = 0;
LABEL_27:
    }
    else
    {
      id v29 = 0;
      v21 = 0;
    }

    id v18 = v29;
    types = self->_types;
    self->_types = v21;

    if (!v18)
    {
      id v31 = [v59 objectForKeyedSubscript:@"tabId"];
      v32 = v31;
      if (v31)
      {
        [v31 doubleValue];
        double v34 = v33;
        if (v33 == -1.0)
        {
          uint64_t v35 = -256;
          BOOL v36 = 1;
          LOBYTE(v37) = -2;
        }
        else
        {
          LOBYTE(v37) = 0;
          BOOL v36 = 0;
          if ((v33 < 0.0 || ((*(void *)&v33 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
            && (unint64_t)(*(void *)&v33 - 1) > 0xFFFFFFFFFFFFELL)
          {
            uint64_t v35 = 0;
          }
          else
          {
            uint64_t v35 = 0;
            if (v33 < 1.84467441e19)
            {
              if (modf(v33, __y) == 0.0)
              {
                unint64_t v37 = (unint64_t)v34;
                if ((unint64_t)v34 == -1) {
                  goto LABEL_80;
                }
                unint64_t v54 = v37 & 0xFFFFFFFFFFFFFF00;
                BOOL v55 = __CFADD__(v37 - 1, 2);
                if (v37 - 1 >= 0xFFFFFFFFFFFFFFFELL) {
                  LOBYTE(v37) = -2;
                }
                uint64_t v35 = -256;
                if (!v55) {
                  uint64_t v35 = v54;
                }
                BOOL v36 = 1;
              }
              else
              {
                BOOL v36 = 0;
                LOBYTE(v37) = 0;
                uint64_t v35 = 0;
              }
            }
          }
        }
        unint64_t v38 = v35 & 0xFFFFFFFFFFFFFF00;
        uint64_t v39 = v37;
      }
      else
      {
        unint64_t v38 = 0;
        BOOL v36 = 0;
        uint64_t v39 = 0;
      }

      self->_tabID.var0.__val_.m_identifier = v39 | v38;
      self->_tabID.__engaged_ = v36;

      id v40 = [v59 objectForKeyedSubscript:@"windowId"];
      v41 = v40;
      if (!v40)
      {
        unint64_t v47 = 0;
        BOOL v45 = 0;
        uint64_t v48 = 0;
LABEL_52:

        self->_windowID.var0.__val_.m_identifier = v48 | v47;
        self->_windowID.__engaged_ = v45;

        id v18 = 0;
        goto LABEL_53;
      }
      [v40 doubleValue];
      double v43 = v42;
      if (v42 == -1.0)
      {
        uint64_t v44 = -256;
        BOOL v45 = 1;
        LOBYTE(v46) = -2;
        goto LABEL_51;
      }
      if (v42 == -2.0)
      {
        uint64_t v44 = -256;
        BOOL v45 = 1;
        LOBYTE(v46) = -3;
        goto LABEL_51;
      }
      LOBYTE(v46) = 0;
      BOOL v45 = 0;
      if ((v42 < 0.0 || ((*(void *)&v42 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
        && (unint64_t)(*(void *)&v42 - 1) > 0xFFFFFFFFFFFFELL)
      {
        uint64_t v44 = 0;
        goto LABEL_51;
      }
      uint64_t v44 = 0;
      if (v42 >= 1.84467441e19)
      {
LABEL_51:
        unint64_t v47 = v44 & 0xFFFFFFFFFFFFFF00;
        uint64_t v48 = v46;
        goto LABEL_52;
      }
      if (modf(v42, __y) != 0.0)
      {
        BOOL v45 = 0;
        LOBYTE(v46) = 0;
        uint64_t v44 = 0;
        goto LABEL_51;
      }
      unint64_t v46 = (unint64_t)v43;
      if ((unint64_t)v43 != -1)
      {
        unint64_t v56 = v46 & 0xFFFFFFFFFFFFFF00;
        BOOL v57 = __CFADD__(v46 - 1, 2);
        if (v46 - 1 >= 0xFFFFFFFFFFFFFFFELL) {
          LOBYTE(v46) = -2;
        }
        uint64_t v44 = -256;
        if (!v57) {
          uint64_t v44 = v56;
        }
        BOOL v45 = 1;
        goto LABEL_51;
      }
LABEL_80:
      __break(0xC471u);
      JUMPOUT(0x1987ADE8CLL);
    }
  }
LABEL_53:

  return v18;
}

- (BOOL)matchesRequestForResourceOfType:(int64_t)a3 URL:(id)a4 tabID:(double)a5 windowID:(double)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  types = self->_types;
  if (!types
    || ([NSNumber numberWithInteger:a3],
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [(NSSet *)types containsObject:v12],
        v12,
        v13))
  {
    urlPatterns = self->_urlPatterns;
    if (urlPatterns)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v15 = urlPatterns;
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "matchesURL:", v10, (void)v24))
            {

              goto LABEL_14;
            }
          }
          uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_14:
      if (!self->_tabID.__engaged_ || (unint64_t v19 = self->_tabID.var0.__val_.m_identifier, v19 == -2) || (double)v19 == a5)
      {
        if (!self->_windowID.__engaged_) {
          goto LABEL_24;
        }
        unint64_t m_identifier = self->_windowID.var0.__val_.m_identifier;
        if (m_identifier == -2) {
          goto LABEL_24;
        }
        double v21 = (double)m_identifier;
        if (m_identifier + 3 < 2) {
          double v21 = -1.0;
        }
        if (v21 == a6)
        {
LABEL_24:
          BOOL v22 = 1;
          goto LABEL_23;
        }
      }
    }
  }
  BOOL v22 = 0;
LABEL_23:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);

  objc_storeStrong((id *)&self->_urlPatterns, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 16) = 0;
  *((unsigned char *)self + 24) = 0;
  *((unsigned char *)self + 32) = 0;
  return self;
}

@end