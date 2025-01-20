@interface IDSEntitlements
- (BOOL)hasAnyEntitlements;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasService:(id)a3 forAnyOfEntitlements:(id)a4;
- (BOOL)hasService:(id)a3 forEntitlement:(id)a4;
- (IDSEntitlements)initWithEntitlements:(id)a3;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (void)dealloc;
@end

@implementation IDSEntitlements

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_specificEntitlementCount)
  {
    for (unint64_t i = 0; i < self->_specificEntitlementCount; ++i)
    {
      v5 = &self->_specificEntitlements[i];
      uint64_t var0 = v5->var0;
      v7 = v5->var1.var0;
      unsigned int v8 = v5->var2 - 1;
      if (v8 > 0x22) {
        id v9 = 0;
      }
      else {
        id v9 = *(id *)*(&off_100985DB8 + (char)v8);
      }
      if (var0 == 57005)
      {
        [v3 setObject:&off_1009D1890 forKeyedSubscript:v9];
      }
      else
      {
        if (var0 == 57007)
        {
          v10 = +[NSString stringWithCString:self->_shrunkenServiceIdentifiers[(unsigned __int16)v7] encoding:4];
          v11 = sub_100008268(v10);
          [v3 setObject:v11 forKeyedSubscript:v9];
        }
        else
        {
          if (var0 != 57069)
          {
            id v12 = objc_alloc_init((Class)NSMutableArray);
            if (var0)
            {
              do
              {
                unsigned int v14 = *v7++;
                uint64_t v13 = v14;
                if (v14 <= self->_serviceIdentifierCount)
                {
                  v15 = +[NSString stringWithCString:self->_shrunkenServiceIdentifiers[v13 - 1] encoding:4];
                  v16 = sub_100008268(v15);
                  [v12 addObject:v16];
                }
                --var0;
              }
              while (var0);
            }
            id v17 = [v12 copy];
            [v3 setObject:v17 forKeyedSubscript:v9];

            goto LABEL_18;
          }
          v10 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v7];
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }
LABEL_18:
    }
  }
  id v18 = [v3 copy];

  return v18;
}

- (BOOL)hasService:(id)a3 forEntitlement:(id)a4
{
  id v6 = a3;
  int v7 = sub_100009A28(a4);
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t specificEntitlementCount = self->_specificEntitlementCount;
  if (!self->_specificEntitlementCount) {
    goto LABEL_17;
  }
  p_uint64_t var1 = &self->_specificEntitlements->var1;
  while (LOBYTE(p_var1[1].var1) != v7)
  {
    p_var1 += 3;
    if (!--specificEntitlementCount) {
      goto LABEL_17;
    }
  }
  uint64_t var1 = p_var1[-1].var1;
  if (var1 == 57005) {
    goto LABEL_17;
  }
  uint64_t var0 = p_var1->var0;
  if (var1 == 57007)
  {
    sub_10000969C(v6);
    id v13 = objc_claimAutoreleasedReturnValue();
    unsigned int v14 = (const char *)[v13 UTF8String];

    BOOL v12 = strcmp(v14, self->_shrunkenServiceIdentifiers[(unsigned __int16)var0]) == 0;
    goto LABEL_18;
  }
  if (var1 == 57069)
  {
    BOOL v12 = (unsigned __int16)p_var1->var0 != 0;
    goto LABEL_18;
  }
  sub_10000969C(v6);
  id v15 = objc_claimAutoreleasedReturnValue();
  v16 = (const char *)[v15 UTF8String];

  uint64_t serviceIdentifierCount = self->_serviceIdentifierCount;
  if (!self->_serviceIdentifierCount)
  {
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = 0;
  shrunkenServiceIdentifiers = self->_shrunkenServiceIdentifiers;
  while (1)
  {
    BOOL v12 = 0;
    if (!strcmp(v16, shrunkenServiceIdentifiers[v18])) {
      break;
    }
    if (serviceIdentifierCount == ++v18) {
      goto LABEL_18;
    }
  }
  if (v18 != -1 && var1)
  {
    uint64_t v21 = var1 - 1;
    do
    {
      int v22 = *var0++;
      BOOL v12 = v18 - v22 == -1;
    }
    while (v18 - v22 != -1 && v21-- != 0);
  }
LABEL_18:

  return v12;
}

- (BOOL)hasAnyEntitlements
{
  return self->_specificEntitlementCount != 0;
}

- (IDSEntitlements)initWithEntitlements:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)IDSEntitlements;
  v5 = [(IDSEntitlements *)&v68 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    unsigned __int8 v7 = [v4 count];
    v5->_uint64_t specificEntitlementCount = v7;
    v5->_specificEntitlements = (_SpecificEntitlement *)malloc_type_calloc(v7, 0x18uLL, 0x1012040FC628917uLL);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v50 = v4;
    id v8 = v4;
    id v9 = v5;
    id v10 = v8;
    id v57 = [v8 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v57)
    {
      LODWORD(v11) = 0;
      uint64_t v12 = *(void *)v65;
      uint64_t v54 = *(void *)v65;
      id v51 = v10;
      v52 = v5;
      do
      {
        uint64_t v13 = 0;
        uint64_t v11 = (int)v11;
        do
        {
          if (*(void *)v65 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v59 = v13;
          unsigned int v14 = *(void **)(*((void *)&v64 + 1) + 8 * v13);
          specificEntitlements = v9->_specificEntitlements;
          int v16 = sub_100009A28(v14);
          if (v16 >= 1)
          {
            unsigned __int8 v17 = v16;
            v55 = (__int16 *)&specificEntitlements[v11];
            uint64_t v18 = objc_msgSend(v10, "objectForKeyedSubscript:", v14, v49);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = v9;
              id v20 = v10;
              uint64_t v21 = v18;
              int v22 = sub_10000969C(v18);
              uint64_t v23 = (uint64_t)[v6 indexOfObject:v22];
              if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v23 = (uint64_t)[v6 count];
                [v6 addObject:v22];
              }
              if (v23 >= 0x10000)
              {
                v26 = +[IMRGLog warning];
                if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v71 = v21;
                  __int16 v72 = 2048;
                  uint64_t v73 = v23;
                  _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Too many services in entitlements! {value: %@, index: %llx}", buf, 0x16u);
                }
              }
              else
              {
                v24 = &specificEntitlements[v11];
                v24->var2 = v17;
                __int16 *v55 = -8529;
                v24->var1.uint64_t var1 = v23;
              }
              v27 = v19;
              uint64_t v12 = v54;

              uint64_t v18 = v21;
              id v10 = v20;
              id v9 = v27;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                specificEntitlements[v11].var2 = v17;
                if (qword_100A4AAB8 != -1) {
                  dispatch_once(&qword_100A4AAB8, &stru_100985D98);
                }
                if (byte_100A4AAB0 == v17
                  || _os_feature_enabled_impl()
                  && (byte_100A4AAB1 == v17 || byte_100A4AAB2 == v17))
                {
                  __int16 v25 = -8531;
                }
                else
                {
                  __int16 v25 = -8467;
                }
                __int16 *v55 = v25;
                specificEntitlements[v11].var1.uint64_t var1 = (unsigned __int16)[v18 unsignedShortValue];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v53 = v11;
                  v28 = &specificEntitlements[v11];
                  v28->var2 = v17;
                  unsigned __int16 v29 = (unsigned __int16)[v18 count];
                  if ((v29 & 0xFFBF) == 0xDEAD || v29 == 57007) {
                    unsigned __int16 v31 = v29 + 1;
                  }
                  else {
                    unsigned __int16 v31 = v29;
                  }
                  __int16 *v55 = v31;
                  v28->var1.uint64_t var0 = (unsigned __int16 *)malloc_type_calloc(v31, 2uLL, 0x1000040BDFB0063uLL);
                  p_uint64_t var1 = &v28->var1;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v63 = 0u;
                  v56 = v18;
                  id v33 = v18;
                  id v34 = [v33 countByEnumeratingWithState:&v60 objects:v69 count:16];
                  if (v34)
                  {
                    id v35 = v34;
                    LODWORD(v36) = 0;
                    uint64_t v37 = *(void *)v61;
                    do
                    {
                      v38 = 0;
                      uint64_t v36 = (int)v36;
                      do
                      {
                        if (*(void *)v61 != v37) {
                          objc_enumerationMutation(v33);
                        }
                        v39 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v38);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v40 = sub_10000969C(v39);
                          id v41 = [v6 indexOfObject:v40];
                          unsigned __int16 v42 = (unsigned __int16)v41;
                          if (v41 == (id)0x7FFFFFFFFFFFFFFFLL)
                          {
                            unsigned __int16 v42 = (unsigned __int16)[v6 count];
                            [v6 addObject:v40];
                          }
                          p_var1->var0[v36] = v42 + 1;
                        }
                        ++v36;
                        v38 = (char *)v38 + 1;
                      }
                      while (v35 != v38);
                      id v35 = [v33 countByEnumeratingWithState:&v60 objects:v69 count:16];
                    }
                    while (v35);
                  }

                  id v10 = v51;
                  id v9 = v52;
                  uint64_t v11 = v53;
                  uint64_t v12 = v54;
                  uint64_t v18 = v56;
                }
              }
            }
          }
          ++v11;
          uint64_t v13 = v59 + 1;
        }
        while ((id)(v59 + 1) != v57);
        id v57 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v57);
    }

    unsigned __int16 v43 = (unsigned __int16)[v6 count];
    v9->_uint64_t serviceIdentifierCount = v43;
    v9->_shrunkenServiceIdentifiers = (char **)malloc_type_calloc(v43, 8uLL, 0x10040436913F5uLL);
    if (v9->_serviceIdentifierCount)
    {
      unint64_t v44 = 0;
      do
      {
        v45 = objc_msgSend(v6, "objectAtIndex:", v44, v49);
        v46 = (char *)[v45 lengthOfBytesUsingEncoding:4] + 1;
        v47 = (char *)malloc_type_malloc((size_t)v46, 0x100004077774924uLL);
        v9->_shrunkenServiceIdentifiers[v44] = v47;
        [v45 getCString:v47 maxLength:v46 encoding:4];

        ++v44;
      }
      while (v44 < v9->_serviceIdentifierCount);
    }
    v5 = v9;

    id v4 = v50;
  }

  return v5;
}

- (BOOL)hasService:(id)a3 forAnyOfEntitlements:(id)a4
{
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[IDSEntitlements hasService:forEntitlement:](self, "hasService:forEntitlement:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  unsigned int specificEntitlementCount = self->_specificEntitlementCount;
  if (self->_specificEntitlementCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      specificEntitlements = self->_specificEntitlements;
      int var0 = specificEntitlements[v4].var0;
      if (var0 != 57005 && var0 != 57007 && var0 != 57069)
      {
        free(specificEntitlements[v4].var1.var0);
        unsigned int specificEntitlementCount = self->_specificEntitlementCount;
      }
      ++v5;
      ++v4;
    }
    while (v5 < specificEntitlementCount);
  }
  free(self->_specificEntitlements);
  if (self->_serviceIdentifierCount)
  {
    unint64_t v10 = 0;
    do
      free(self->_shrunkenServiceIdentifiers[v10++]);
    while (v10 < self->_serviceIdentifierCount);
  }
  free(self->_shrunkenServiceIdentifiers);
  v11.receiver = self;
  v11.super_class = (Class)IDSEntitlements;
  [(IDSEntitlements *)&v11 dealloc];
}

- (id)debugDescription
{
  v2 = [(IDSEntitlements *)self dictionaryRepresentation];
  id v3 = [v2 description];

  return v3;
}

- (BOOL)hasEntitlement:(id)a3
{
  int v4 = sub_100009A28(a3);
  if (v4)
  {
    uint64_t specificEntitlementCount = self->_specificEntitlementCount;
    if (self->_specificEntitlementCount)
    {
      uint64_t v6 = specificEntitlementCount - 1;
      p_var2 = &self->_specificEntitlements->var2;
      do
      {
        int v8 = *p_var2;
        p_var2 += 24;
        LOBYTE(specificEntitlementCount) = v8 == v4;
      }
      while (v8 != v4 && v6-- != 0);
    }
  }
  else
  {
    LOBYTE(specificEntitlementCount) = 0;
  }
  return specificEntitlementCount;
}

@end