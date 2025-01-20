@interface ASDTIOA2LegacySelectorControl
+ (BOOL)automaticallyNotifiesObserversOfSelectedValue;
- (ASDTIOA2LegacySelectorControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (BOOL)doSetValues:(const unsigned int *)a3 withCount:(unint64_t)a4;
- (BOOL)marked;
- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4;
- (BOOL)synchronizeWithRegistry;
- (unsigned)userClientID;
- (void)pushValue:(unsigned int)a3;
- (void)pushValues:(id)a3;
- (void)setMarked:(BOOL)a3;
@end

@implementation ASDTIOA2LegacySelectorControl

- (ASDTIOA2LegacySelectorControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  BOOL v12 = a5;
  id v16 = a3;
  v17 = [v16 plugin];
  v20.receiver = self;
  v20.super_class = (Class)ASDTIOA2LegacySelectorControl;
  v18 = [(ASDSelectorControl *)&v20 initWithIsSettable:v12 forElement:v11 inScope:v10 withPlugin:v17 andObjectClassID:v9];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_ioa2Device, a3);
    v18->_userClientID = a4;
  }

  return v18;
}

- (BOOL)synchronizeWithRegistry
{
  v87[1] = *MEMORY[0x263EF8340];
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    [(ASDTIOA2LegacyDevice *)ioa2Device scopedLock];
    v3 = self;
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    v79 = 0;
    uint64_t v80 = 0;
    v3 = self;
  }
  v4 = [(ASDTIOA2LegacyDevice *)ioa2Device _controlDictionaryForControl:v3->_userClientID];
  v46 = v4;
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"multi-selector"];
    self->_multiSelector = [v5 BOOLValue];

    if (self->_multiSelector)
    {
      v47 = [v46 objectForKeyedSubscript:@"value"];
    }
    else
    {
      v7 = [v46 objectForKeyedSubscript:@"value"];
      v87[0] = v7;
      v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:1];
    }
    v8 = [(ASDSelectorControl *)self values];
    v45 = [v46 objectForKeyedSubscript:@"selectors"];
    v50 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v45, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = v45;
    uint64_t v9 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    v48 = v8;
    if (v9)
    {
      uint64_t v10 = *(void *)v75;
      uint64_t v49 = *(void *)v75;
      do
      {
        uint64_t v52 = v9;
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v75 != v10) {
            objc_enumerationMutation(obj);
          }
          BOOL v12 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v13 = [v12 objectForKeyedSubscript:@"value"];
          v14 = [v12 objectForKeyedSubscript:@"name"];
          v15 = [v12 objectForKeyedSubscript:@"kind"];
          uint64_t v16 = [v13 unsignedIntValue];
          if (v16) {
            BOOL v17 = v14 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            if ([v8 count])
            {
              long long v72 = 0uLL;
              long long v73 = 0uLL;
              long long v70 = 0uLL;
              long long v71 = 0uLL;
              id v18 = v8;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v85 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v71;
                while (2)
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v71 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    v22 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                    if ([v22 value] == v16)
                    {
                      v8 = v48;
                      uint64_t v10 = v49;
                      uint64_t v19 = [v22 selected];
                      goto LABEL_41;
                    }
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v85 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
                v8 = v48;
                goto LABEL_40;
              }
            }
            else
            {
              long long v68 = 0uLL;
              long long v69 = 0uLL;
              long long v66 = 0uLL;
              long long v67 = 0uLL;
              id v18 = v47;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v84 count:16];
              if (v19)
              {
                uint64_t v23 = *(void *)v67;
                while (2)
                {
                  for (uint64_t k = 0; k != v19; ++k)
                  {
                    if (*(void *)v67 != v23) {
                      objc_enumerationMutation(v18);
                    }
                    if ([*(id *)(*((void *)&v66 + 1) + 8 * k) unsignedIntValue] == v16)
                    {
                      uint64_t v19 = 1;
                      goto LABEL_40;
                    }
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v84 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
LABEL_40:
                uint64_t v10 = v49;
              }
            }
LABEL_41:

            v25 = objc_msgSend(MEMORY[0x263F28C68], "withValue:name:andKind:selected:", v16, v14, objc_msgSend(v15, "unsignedIntValue"), v19);
            [v50 addObject:v25];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
      }
      while (v9);
    }

    uint64_t v26 = [v50 count];
    if (v26 == [v8 count])
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v27 = v50;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v83 count:16];
      if (v28)
      {
        uint64_t v29 = 0;
        uint64_t v30 = *(void *)v63;
        while (2)
        {
          for (uint64_t m = 0; m != v28; ++m)
          {
            if (*(void *)v63 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v62 + 1) + 8 * m);
            if (v29 + m < (unint64_t)[v8 count])
            {
              v33 = objc_msgSend(v8, "objectAtIndexedSubscript:");
              int v34 = [v33 value];
              BOOL v35 = v34 == [v32 value];

              if (v35) {
                continue;
              }
            }

            goto LABEL_56;
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v83 count:16];
          v29 += m;
          if (v28) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_56:
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v36 = v8;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v82 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v59;
        do
        {
          for (uint64_t n = 0; n != v37; ++n)
          {
            if (*(void *)v59 != v38) {
              objc_enumerationMutation(v36);
            }
            [(ASDSelectorControl *)self removeValue:*(void *)(*((void *)&v58 + 1) + 8 * n)];
          }
          uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v82 count:16];
        }
        while (v37);
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v40 = v50;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v81 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v55;
        do
        {
          for (iuint64_t i = 0; ii != v41; ++ii)
          {
            if (*(void *)v55 != v42) {
              objc_enumerationMutation(v40);
            }
            [(ASDSelectorControl *)self addValue:*(void *)(*((void *)&v54 + 1) + 8 * ii)];
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v81 count:16];
        }
        while (v41);
      }
    }

    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v79);
    [(ASDTIOA2LegacySelectorControl *)self pushValues:v47];
  }
  else
  {
    v6 = ASDTIOA2LogType();
    v47 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", buf, 2u);
    }
  }

  if ((_BYTE)v80) {
    std::recursive_mutex::unlock(v79);
  }
  return v46 != 0;
}

- (BOOL)doSetValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)ASDTIOA2LegacySelectorControl;
  BOOL v5 = [(ASDSelectorControl *)&v24 setSelectedValues:a3 withCount:a4];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_selectedValue);
    [(ASDTIOA2LegacySelectorControl *)self willChangeValueForKey:v6];

    v7 = NSStringFromSelector(sel_selectedValue);
    [(ASDTIOA2LegacySelectorControl *)self didChangeValueForKey:v7];

    BOOL v8 = !self->_multiSelector;
    uint64_t v9 = ASDTIOA2LogType();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v13 = [(ASDAudioDevice *)self->_ioa2Device deviceUID];
        if ([(ASDTIOA2LegacySelectorControl *)self objectClass] >> 29
          && [(ASDTIOA2LegacySelectorControl *)self objectClass] >> 24 <= 0x7E)
        {
          unsigned int v14 = [(ASDTIOA2LegacySelectorControl *)self objectClass] >> 24;
        }
        else
        {
          unsigned int v14 = 32;
        }
        if (([(ASDTIOA2LegacySelectorControl *)self objectClass] & 0xE00000) != 0
          && ([(ASDTIOA2LegacySelectorControl *)self objectClass] >> 16) <= 0x7Eu)
        {
          int v19 = ([(ASDTIOA2LegacySelectorControl *)self objectClass] >> 16);
        }
        else
        {
          int v19 = 32;
        }
        if (([(ASDTIOA2LegacySelectorControl *)self objectClass] & 0xE000) != 0
          && ((unsigned __int16)[(ASDTIOA2LegacySelectorControl *)self objectClass] >> 8) <= 0x7Eu)
        {
          int v20 = ((unsigned __int16)[(ASDTIOA2LegacySelectorControl *)self objectClass] >> 8);
        }
        else
        {
          int v20 = 32;
        }
        if (([(ASDTIOA2LegacySelectorControl *)self objectClass] & 0xE0) != 0
          && [(ASDTIOA2LegacySelectorControl *)self objectClass] <= 0x7Eu)
        {
          int v21 = [(ASDTIOA2LegacySelectorControl *)self objectClass];
        }
        else
        {
          int v21 = 32;
        }
        unsigned int v22 = [(ASDSelectorControl *)self selectedValue];
        *(_DWORD *)buf = 138413570;
        uint64_t v26 = v13;
        __int16 v27 = 1024;
        unsigned int v28 = v14;
        __int16 v29 = 1024;
        int v30 = v19;
        __int16 v31 = 1024;
        int v32 = v20;
        __int16 v33 = 1024;
        int v34 = v21;
        __int16 v35 = 1024;
        LODWORD(v36) = v22;
        _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [(ASDAudioDevice *)self->_ioa2Device deviceUID];
      if ([(ASDTIOA2LegacySelectorControl *)self objectClass] >> 29
        && [(ASDTIOA2LegacySelectorControl *)self objectClass] >> 24 <= 0x7E)
      {
        unsigned int v12 = [(ASDTIOA2LegacySelectorControl *)self objectClass] >> 24;
      }
      else
      {
        unsigned int v12 = 32;
      }
      if (([(ASDTIOA2LegacySelectorControl *)self objectClass] & 0xE00000) != 0
        && ([(ASDTIOA2LegacySelectorControl *)self objectClass] >> 16) <= 0x7Eu)
      {
        int v15 = ([(ASDTIOA2LegacySelectorControl *)self objectClass] >> 16);
      }
      else
      {
        int v15 = 32;
      }
      if (([(ASDTIOA2LegacySelectorControl *)self objectClass] & 0xE000) != 0
        && ((unsigned __int16)[(ASDTIOA2LegacySelectorControl *)self objectClass] >> 8) <= 0x7Eu)
      {
        int v16 = ((unsigned __int16)[(ASDTIOA2LegacySelectorControl *)self objectClass] >> 8);
      }
      else
      {
        int v16 = 32;
      }
      if (([(ASDTIOA2LegacySelectorControl *)self objectClass] & 0xE0) != 0
        && [(ASDTIOA2LegacySelectorControl *)self objectClass] <= 0x7Eu)
      {
        int v17 = [(ASDTIOA2LegacySelectorControl *)self objectClass];
      }
      else
      {
        int v17 = 32;
      }
      id v18 = [(ASDSelectorControl *)self values];
      *(_DWORD *)buf = 138413570;
      uint64_t v26 = v11;
      __int16 v27 = 1024;
      unsigned int v28 = v12;
      __int16 v29 = 1024;
      int v30 = v15;
      __int16 v31 = 1024;
      int v32 = v16;
      __int16 v33 = 1024;
      int v34 = v17;
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %@", buf, 0x2Eu);
    }
  }
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversOfSelectedValue
{
  return 0;
}

- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    [(ASDTIOA2LegacyDevice *)ioa2Device scopedLock];
  }
  else
  {
    int v16 = 0;
    uint64_t v17 = 0;
  }
  BOOL v8 = [(ASDSelectorControl *)self values];
  unint64_t v9 = [v8 count];

  if (v9 <= 1) {
    std::vector<unsigned int>::size_type v10 = 1;
  }
  else {
    std::vector<unsigned int>::size_type v10 = v9;
  }
  std::vector<unsigned int>::size_type v15 = v10;
  std::vector<unsigned int>::vector(&__p, v10);
  BOOL v11 = [(ASDTIOA2LegacyDevice *)self->_ioa2Device _setControlValues:a3 withCount:a4 resultValues:__p.__begin_ count:&v15 forControl:self->_userClientID];
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v16);
  BOOL v12 = v11
     && [(ASDTIOA2LegacySelectorControl *)self doSetValues:__p.__begin_ withCount:v15];
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  if ((_BYTE)v17) {
    std::recursive_mutex::unlock(v16);
  }
  return v12;
}

- (void)pushValue:(unsigned int)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (!a3 || self->_multiSelector)
  {
    v6 = [(ASDTIOA2LegacyDevice *)self->_ioa2Device _controlDictionaryForControl:self->_userClientID];
    BOOL v5 = [v6 objectForKeyedSubscript:@"value"];
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v7[0] = v4;
    BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  [(ASDTIOA2LegacySelectorControl *)self pushValues:v5];
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

  [(ASDTIOA2LegacySelectorControl *)self doSetValues:v16.__begin_ withCount:v6];
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

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void).cxx_destruct
{
}

@end