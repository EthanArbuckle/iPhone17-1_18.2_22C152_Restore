@interface ASDTIOA2SelectorControl
+ (BOOL)automaticallyNotifiesObserversOfSelectedValue;
- (ASDTIOA2Device)ioa2Device;
- (ASDTIOA2SelectorControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (BOOL)doSetValues:(const unsigned int *)a3 withCount:(unint64_t)a4;
- (BOOL)marked;
- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (NSArray)properties;
- (NSArray)propertySelectorInfo;
- (id).cxx_construct;
- (unsigned)userClientID;
- (void)dealloc;
- (void)pushValue:(unsigned int)a3;
- (void)pushValues:(id)a3;
- (void)setIoa2Device:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setUserClientID:(unsigned int)a3;
@end

@implementation ASDTIOA2SelectorControl

- (ASDTIOA2SelectorControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  BOOL v12 = a5;
  id v15 = a3;
  v16 = [v15 plugin];
  v19.receiver = self;
  v19.super_class = (Class)ASDTIOA2SelectorControl;
  v17 = [(ASDSelectorControl *)&v19 initWithIsSettable:v12 forElement:v11 inScope:v10 withPlugin:v16 andObjectClassID:v9];

  if (v17)
  {
    objc_storeWeak((id *)&v17->_ioa2Device, v15);
    v17->_userClientID = a4;
  }

  return v17;
}

- (void)dealloc
{
  [(ASDControl *)self asdtRemoveControlProperties];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2SelectorControl;
  [(ASDTIOA2SelectorControl *)&v3 dealloc];
}

- (NSArray)propertySelectorInfo
{
  v13[3] = *MEMORY[0x263EF8340];
  v11[0] = @"selector";
  v11[1] = @"dataType";
  v12[0] = &unk_26FCB2028;
  v12[1] = &unk_26FCB2040;
  v2 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13[0] = v2;
  v9[0] = @"selector";
  v9[1] = @"dataType";
  v10[0] = &unk_26FCB2058;
  v10[1] = &unk_26FCB2040;
  objc_super v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v13[1] = v3;
  v7[0] = @"selector";
  v7[1] = @"dataType";
  v8[0] = &unk_26FCB2070;
  v8[1] = &unk_26FCB2088;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v13[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];

  return (NSArray *)v5;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  v88[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v56 = self;
  p_locuint64_t k = (std::recursive_mutex *)&self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  BOOL v49 = v4 != 0;
  if (!v4)
  {
    id v47 = 0;
    v8 = ASDTIOA2LogType();
    v50 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", buf, 2u);
    }
LABEL_71:

    id v4 = v47;
    goto LABEL_72;
  }
  v5 = [v4 objectForKeyedSubscript:@"property selectors"];
  BOOL v6 = [(ASDControl *)self asdtAddControlProperties:v5];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"multi-selector"];
    id v47 = v4;
    v56->_multiSelector = [v7 BOOLValue];

    if (v56->_multiSelector)
    {
      v50 = [v4 objectForKeyedSubscript:@"value"];
    }
    else
    {
      uint64_t v9 = [v4 objectForKeyedSubscript:@"value"];
      v88[0] = v9;
      v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:1];
    }
    v55 = [(ASDSelectorControl *)v56 values];
    v46 = [v4 objectForKeyedSubscript:@"selectors"];
    v53 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v46, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = v46;
    uint64_t v10 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v78;
      uint64_t v51 = *(void *)v78;
      do
      {
        uint64_t v12 = 0;
        uint64_t v52 = v10;
        do
        {
          if (*(void *)v78 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v77 + 1) + 8 * v12);
          v14 = [v13 objectForKeyedSubscript:@"value"];
          id v15 = [v13 objectForKeyedSubscript:@"name"];
          v16 = [v13 objectForKeyedSubscript:@"kind"];
          uint64_t v17 = [v14 unsignedIntValue];
          if (v17) {
            BOOL v18 = v15 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            if ([v55 count])
            {
              long long v75 = 0uLL;
              long long v76 = 0uLL;
              long long v73 = 0uLL;
              long long v74 = 0uLL;
              id v19 = v55;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v73 objects:v86 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v74;
                while (2)
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v74 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    v23 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                    if ([v23 value] == v17)
                    {
                      uint64_t v11 = v51;
                      uint64_t v10 = v52;
                      uint64_t v20 = [v23 selected];
                      goto LABEL_40;
                    }
                  }
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v73 objects:v86 count:16];
                  if (v20) {
                    continue;
                  }
                  break;
                }
                uint64_t v11 = v51;
                goto LABEL_39;
              }
            }
            else
            {
              long long v71 = 0uLL;
              long long v72 = 0uLL;
              long long v69 = 0uLL;
              long long v70 = 0uLL;
              id v19 = v50;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v85 count:16];
              if (v20)
              {
                uint64_t v24 = *(void *)v70;
                while (2)
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v70 != v24) {
                      objc_enumerationMutation(v19);
                    }
                    if ([*(id *)(*((void *)&v69 + 1) + 8 * j) unsignedIntValue] == v17)
                    {
                      uint64_t v20 = 1;
                      goto LABEL_39;
                    }
                  }
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v85 count:16];
                  if (v20) {
                    continue;
                  }
                  break;
                }
LABEL_39:
                uint64_t v10 = v52;
              }
            }
LABEL_40:

            v26 = objc_msgSend(MEMORY[0x263F28C68], "withValue:name:andKind:selected:", v17, v15, objc_msgSend(v16, "unsignedIntValue"), v20);
            [v53 addObject:v26];
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
      }
      while (v10);
    }

    uint64_t v27 = [v53 count];
    if (v27 == [v55 count])
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v28 = v53;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v84 count:16];
      if (v29)
      {
        uint64_t v30 = 0;
        uint64_t v31 = *(void *)v66;
        while (2)
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v66 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v65 + 1) + 8 * k);
            if (v30 + k < (unint64_t)[v55 count])
            {
              v34 = objc_msgSend(v55, "objectAtIndexedSubscript:");
              int v35 = [v34 value];
              BOOL v36 = v35 == [v33 value];

              if (v36) {
                continue;
              }
            }

            goto LABEL_55;
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v84 count:16];
          v30 += k;
          if (v29) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_55:
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v37 = v55;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v83 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v62;
        do
        {
          for (uint64_t m = 0; m != v38; ++m)
          {
            if (*(void *)v62 != v39) {
              objc_enumerationMutation(v37);
            }
            [(ASDSelectorControl *)v56 removeValue:*(void *)(*((void *)&v61 + 1) + 8 * m)];
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v83 count:16];
        }
        while (v38);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v41 = v53;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v57 objects:v82 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v58;
        do
        {
          for (uint64_t n = 0; n != v42; ++n)
          {
            if (*(void *)v58 != v43) {
              objc_enumerationMutation(v41);
            }
            [(ASDSelectorControl *)v56 addValue:*(void *)(*((void *)&v57 + 1) + 8 * n)];
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v57 objects:v82 count:16];
        }
        while (v42);
      }

      [(ASDControl *)v56 asdtSendControlPropertyChangeNotificationAtIndex:1];
    }
    [(ASDTIOA2SelectorControl *)v56 pushValues:v50];

    goto LABEL_71;
  }
  BOOL v49 = 0;
LABEL_72:
  std::recursive_mutex::unlock(p_lock);

  return v49;
}

- (BOOL)doSetValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  p_locuint64_t k = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  v26.receiver = self;
  v26.super_class = (Class)ASDTIOA2SelectorControl;
  if ([(ASDSelectorControl *)&v26 setSelectedValues:a3 withCount:a4])
  {
    v8 = NSStringFromSelector(sel_selectedValue);
    [(ASDTIOA2SelectorControl *)self willChangeValueForKey:v8];

    [(ASDControl *)self asdtSendControlPropertyChangeNotificationAtIndex:0];
    uint64_t v9 = NSStringFromSelector(sel_selectedValue);
    [(ASDTIOA2SelectorControl *)self didChangeValueForKey:v9];

    if (self->_multiSelector)
    {
      uint64_t v10 = ASDTIOA2LogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
        uint64_t v12 = [WeakRetained deviceUID];
        if ([(ASDTIOA2SelectorControl *)self objectClass] >> 29
          && [(ASDTIOA2SelectorControl *)self objectClass] >> 24 <= 0x7E)
        {
          unsigned int v13 = [(ASDTIOA2SelectorControl *)self objectClass] >> 24;
        }
        else
        {
          unsigned int v13 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE00000) != 0
          && ([(ASDTIOA2SelectorControl *)self objectClass] >> 16) <= 0x7Eu)
        {
          int v17 = ([(ASDTIOA2SelectorControl *)self objectClass] >> 16);
        }
        else
        {
          int v17 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE000) != 0
          && ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8) <= 0x7Eu)
        {
          int v18 = ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8);
        }
        else
        {
          int v18 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE0) != 0
          && [(ASDTIOA2SelectorControl *)self objectClass] <= 0x7Eu)
        {
          int v19 = [(ASDTIOA2SelectorControl *)self objectClass];
        }
        else
        {
          int v19 = 32;
        }
        uint64_t v20 = [(ASDSelectorControl *)self values];
        *(_DWORD *)buf = 138413570;
        id v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = v13;
        __int16 v31 = 1024;
        int v32 = v17;
        __int16 v33 = 1024;
        int v34 = v18;
        __int16 v35 = 1024;
        int v36 = v19;
        __int16 v37 = 2112;
        uint64_t v38 = v20;
        _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %@", buf, 0x2Eu);
      }
    }
    else
    {
      uint64_t v10 = ASDTIOA2LogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_loadWeakRetained((id *)&self->_ioa2Device);
        id v15 = [v14 deviceUID];
        if ([(ASDTIOA2SelectorControl *)self objectClass] >> 29
          && [(ASDTIOA2SelectorControl *)self objectClass] >> 24 <= 0x7E)
        {
          unsigned int v16 = [(ASDTIOA2SelectorControl *)self objectClass] >> 24;
        }
        else
        {
          unsigned int v16 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE00000) != 0
          && ([(ASDTIOA2SelectorControl *)self objectClass] >> 16) <= 0x7Eu)
        {
          int v21 = ([(ASDTIOA2SelectorControl *)self objectClass] >> 16);
        }
        else
        {
          int v21 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE000) != 0
          && ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8) <= 0x7Eu)
        {
          int v22 = ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8);
        }
        else
        {
          int v22 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE0) != 0
          && [(ASDTIOA2SelectorControl *)self objectClass] <= 0x7Eu)
        {
          int v23 = [(ASDTIOA2SelectorControl *)self objectClass];
        }
        else
        {
          int v23 = 32;
        }
        unsigned int v24 = [(ASDSelectorControl *)self selectedValue];
        *(_DWORD *)buf = 138413570;
        id v28 = v15;
        __int16 v29 = 1024;
        unsigned int v30 = v16;
        __int16 v31 = 1024;
        int v32 = v21;
        __int16 v33 = 1024;
        int v34 = v22;
        __int16 v35 = 1024;
        int v36 = v23;
        __int16 v37 = 1024;
        LODWORD(v38) = v24;
        _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
      }
    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return 1;
}

+ (BOOL)automaticallyNotifiesObserversOfSelectedValue
{
  return 0;
}

- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v7 = [(ASDSelectorControl *)self values];
  unint64_t v8 = [v7 count];

  if (v8 <= 1) {
    std::vector<unsigned int>::size_type v9 = 1;
  }
  else {
    std::vector<unsigned int>::size_type v9 = v8;
  }
  std::vector<unsigned int>::size_type v31 = v9;
  std::vector<unsigned int>::vector(&__p, v9);
  if (self->_multiSelector)
  {
    if (v9 < a4)
    {
      uint64_t v10 = ASDTIOA2LogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
        int v19 = [WeakRetained deviceUID];
        if ([(ASDTIOA2SelectorControl *)self objectClass] >> 29
          && [(ASDTIOA2SelectorControl *)self objectClass] >> 24 <= 0x7E)
        {
          unsigned int v20 = [(ASDTIOA2SelectorControl *)self objectClass] >> 24;
        }
        else
        {
          unsigned int v20 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE00000) != 0
          && ([(ASDTIOA2SelectorControl *)self objectClass] >> 16) <= 0x7Eu)
        {
          int v21 = ([(ASDTIOA2SelectorControl *)self objectClass] >> 16);
        }
        else
        {
          int v21 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE000) != 0
          && ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8) <= 0x7Eu)
        {
          int v22 = ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8);
        }
        else
        {
          int v22 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE0) != 0
          && [(ASDTIOA2SelectorControl *)self objectClass] <= 0x7Eu)
        {
          int v23 = [(ASDTIOA2SelectorControl *)self objectClass];
        }
        else
        {
          int v23 = 32;
        }
        *(_DWORD *)buf = 138413826;
        __int16 v33 = v19;
        __int16 v34 = 1024;
        unsigned int v35 = v20;
        __int16 v36 = 1024;
        int v37 = v21;
        __int16 v38 = 1024;
        int v39 = v22;
        __int16 v40 = 1024;
        int v41 = v23;
        __int16 v42 = 2048;
        unint64_t v43 = a4;
        __int16 v44 = 2048;
        std::vector<unsigned int>::size_type v45 = v9;
        _os_log_error_impl(&dword_248A1B000, v10, OS_LOG_TYPE_ERROR, "%@: selector control '%c%c%c%c': bad number of items: %zu (max %zu)", buf, 0x38u);
      }
      goto LABEL_15;
    }
    id v13 = objc_loadWeakRetained((id *)&self->_ioa2Device);
    int v14 = [v13 _setControlValues:a3 withCount:a4 resultValues:__p.__begin_ count:&v31 forControl:self->_userClientID];

    if (v14)
    {
LABEL_12:
      BOOL v15 = -[ASDTIOA2SelectorControl doSetValues:withCount:](self, "doSetValues:withCount:");
      goto LABEL_16;
    }
  }
  else
  {
    if (a4 != 1)
    {
      unsigned int v16 = ASDTIOA2LogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v24 = objc_loadWeakRetained((id *)&self->_ioa2Device);
        v25 = [v24 deviceUID];
        if ([(ASDTIOA2SelectorControl *)self objectClass] >> 29
          && [(ASDTIOA2SelectorControl *)self objectClass] >> 24 <= 0x7E)
        {
          unsigned int v26 = [(ASDTIOA2SelectorControl *)self objectClass] >> 24;
        }
        else
        {
          unsigned int v26 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE00000) != 0
          && ([(ASDTIOA2SelectorControl *)self objectClass] >> 16) <= 0x7Eu)
        {
          int v27 = ([(ASDTIOA2SelectorControl *)self objectClass] >> 16);
        }
        else
        {
          int v27 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE000) != 0
          && ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8) <= 0x7Eu)
        {
          int v28 = ((unsigned __int16)[(ASDTIOA2SelectorControl *)self objectClass] >> 8);
        }
        else
        {
          int v28 = 32;
        }
        if (([(ASDTIOA2SelectorControl *)self objectClass] & 0xE0) != 0
          && [(ASDTIOA2SelectorControl *)self objectClass] <= 0x7Eu)
        {
          int v29 = [(ASDTIOA2SelectorControl *)self objectClass];
        }
        else
        {
          int v29 = 32;
        }
        *(_DWORD *)buf = 138413570;
        __int16 v33 = v25;
        __int16 v34 = 1024;
        unsigned int v35 = v26;
        __int16 v36 = 1024;
        int v37 = v27;
        __int16 v38 = 1024;
        int v39 = v28;
        __int16 v40 = 1024;
        int v41 = v29;
        __int16 v42 = 2048;
        unint64_t v43 = a4;
        _os_log_error_impl(&dword_248A1B000, v16, OS_LOG_TYPE_ERROR, "%@: selector control '%c%c%c%c': bad number of items: %zu (require 1)", buf, 0x2Eu);
      }
      goto LABEL_15;
    }
    *(_DWORD *)buf = *a3;
    id v11 = objc_loadWeakRetained((id *)&self->_ioa2Device);
    int v12 = [v11 _setControlValue:buf forControl:self->_userClientID];

    if (v12)
    {
      *__p.__begin_ = *(_DWORD *)buf;
      goto LABEL_12;
    }
  }
LABEL_15:
  BOOL v15 = 0;
LABEL_16:
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  return v15;
}

- (void)pushValue:(unsigned int)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (!a3 || self->_multiSelector)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
    v7 = [WeakRetained _controlDictionaryForControl:self->_userClientID];

    v5 = [v7 objectForKeyedSubscript:@"value"];
  }
  else
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v8[0] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  [(ASDTIOA2SelectorControl *)self pushValues:v5];
}

- (void)pushValues:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  std::vector<unsigned int>::vector(&v16, [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v6;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "unsignedIntValue", (void)v12);
        uint64_t v6 = v10 + 1;
        v16.__begin_[v10] = v11;
        ++v9;
        ++v10;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  [(ASDTIOA2SelectorControl *)self doSetValues:v16.__begin_ withCount:v6];
  if (v16.__begin_)
  {
    v16.__end_ = v16.__begin_;
    operator delete(v16.__begin_);
  }
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (NSArray)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
}

- (ASDTIOA2Device)ioa2Device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  return (ASDTIOA2Device *)WeakRetained;
}

- (void)setIoa2Device:(id)a3
{
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void)setUserClientID:(unsigned int)a3
{
  self->_userClientID = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioa2Device);
  objc_storeStrong((id *)&self->properties, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
}

- (id).cxx_construct
{
  return self;
}

@end