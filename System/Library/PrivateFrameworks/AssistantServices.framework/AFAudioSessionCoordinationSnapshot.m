@interface AFAudioSessionCoordinationSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAudioSessionCoordinationDeviceInfo)localDevice;
- (AFAudioSessionCoordinationSnapshot)init;
- (AFAudioSessionCoordinationSnapshot)initWithBuilder:(id)a3;
- (AFAudioSessionCoordinationSnapshot)initWithCoder:(id)a3;
- (AFAudioSessionCoordinationSnapshot)initWithCurrentOrUpNextDateInterval:(id)a3 isAudioSessionActive:(BOOL)a4 localActiveAssertionContexts:(id)a5 localPendingAssertionContexts:(id)a6 remoteActiveAssertionContexts:(id)a7 remotePendingAssertionContexts:(id)a8 localDevice:(id)a9 remoteQualifiedInRangeDevices:(id)a10 remoteQualifiedOutOfRangeDevices:(id)a11 remoteDisqualifiedDevices:(id)a12;
- (AFAudioSessionCoordinationSnapshot)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isAudioSessionActive;
- (BOOL)isEqual:(id)a3;
- (NSArray)localActiveAssertionContexts;
- (NSArray)localPendingAssertionContexts;
- (NSArray)remoteActiveAssertionContexts;
- (NSArray)remoteDisqualifiedDevices;
- (NSArray)remotePendingAssertionContexts;
- (NSArray)remoteQualifiedInRangeDevices;
- (NSArray)remoteQualifiedOutOfRangeDevices;
- (NSDateInterval)currentOrUpNextDateInterval;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAudioSessionCoordinationSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisqualifiedDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedOutOfRangeDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedInRangeDevices, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_remotePendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_remoteActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localPendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_currentOrUpNextDateInterval, 0);
}

- (NSArray)remoteDisqualifiedDevices
{
  return self->_remoteDisqualifiedDevices;
}

- (NSArray)remoteQualifiedOutOfRangeDevices
{
  return self->_remoteQualifiedOutOfRangeDevices;
}

- (NSArray)remoteQualifiedInRangeDevices
{
  return self->_remoteQualifiedInRangeDevices;
}

- (AFAudioSessionCoordinationDeviceInfo)localDevice
{
  return self->_localDevice;
}

- (NSArray)remotePendingAssertionContexts
{
  return self->_remotePendingAssertionContexts;
}

- (NSArray)remoteActiveAssertionContexts
{
  return self->_remoteActiveAssertionContexts;
}

- (NSArray)localPendingAssertionContexts
{
  return self->_localPendingAssertionContexts;
}

- (NSArray)localActiveAssertionContexts
{
  return self->_localActiveAssertionContexts;
}

- (BOOL)isAudioSessionActive
{
  return self->_isAudioSessionActive;
}

- (NSDateInterval)currentOrUpNextDateInterval
{
  return self->_currentOrUpNextDateInterval;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
  if (currentOrUpNextDateInterval) {
    [v3 setObject:currentOrUpNextDateInterval forKey:@"currentOrUpNextDateInterval"];
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAudioSessionActive];
  [v4 setObject:v6 forKey:@"isAudioSessionActive"];

  if (self->_localActiveAssertionContexts)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_localActiveAssertionContexts, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v8 = self->_localActiveAssertionContexts;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v92 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v91 + 1) + 8 * i) buildDictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v10);
    }

    v14 = (void *)[v7 copy];
    [v4 setObject:v14 forKey:@"localActiveAssertionContexts"];
  }
  if (self->_localPendingAssertionContexts)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_localPendingAssertionContexts, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v16 = self->_localPendingAssertionContexts;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v88 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v87 + 1) + 8 * j) buildDictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v18);
    }

    v22 = (void *)[v15 copy];
    [v4 setObject:v22 forKey:@"localPendingAssertionContexts"];
  }
  if (self->_remoteActiveAssertionContexts)
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_remoteActiveAssertionContexts, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v24 = self->_remoteActiveAssertionContexts;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v83 objects:v99 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v84 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v83 + 1) + 8 * k) buildDictionaryRepresentation];
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v83 objects:v99 count:16];
      }
      while (v26);
    }

    v30 = (void *)[v23 copy];
    [v4 setObject:v30 forKey:@"remoteActiveAssertionContexts"];
  }
  if (self->_remotePendingAssertionContexts)
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_remotePendingAssertionContexts, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v32 = self->_remotePendingAssertionContexts;
    uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v79 objects:v98 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v80 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v79 + 1) + 8 * m) buildDictionaryRepresentation];
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v79 objects:v98 count:16];
      }
      while (v34);
    }

    v38 = (void *)[v31 copy];
    [v4 setObject:v38 forKey:@"remotePendingAssertionContexts"];
  }
  localDevice = self->_localDevice;
  if (localDevice)
  {
    v40 = [(AFAudioSessionCoordinationDeviceInfo *)localDevice buildDictionaryRepresentation];
    [v4 setObject:v40 forKey:@"localDevice"];
  }
  if (self->_remoteQualifiedInRangeDevices)
  {
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_remoteQualifiedInRangeDevices, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v42 = self->_remoteQualifiedInRangeDevices;
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v75 objects:v97 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v76;
      do
      {
        for (uint64_t n = 0; n != v44; ++n)
        {
          if (*(void *)v76 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [*(id *)(*((void *)&v75 + 1) + 8 * n) buildDictionaryRepresentation];
          [v41 addObject:v47];
        }
        uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v75 objects:v97 count:16];
      }
      while (v44);
    }

    v48 = (void *)[v41 copy];
    [v4 setObject:v48 forKey:@"remoteQualifiedInRangeDevices"];
  }
  if (self->_remoteQualifiedOutOfRangeDevices)
  {
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_remoteQualifiedOutOfRangeDevices, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v50 = self->_remoteQualifiedOutOfRangeDevices;
    uint64_t v51 = [(NSArray *)v50 countByEnumeratingWithState:&v71 objects:v96 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v72;
      do
      {
        for (iuint64_t i = 0; ii != v52; ++ii)
        {
          if (*(void *)v72 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [*(id *)(*((void *)&v71 + 1) + 8 * ii) buildDictionaryRepresentation];
          [v49 addObject:v55];
        }
        uint64_t v52 = [(NSArray *)v50 countByEnumeratingWithState:&v71 objects:v96 count:16];
      }
      while (v52);
    }

    v56 = (void *)[v49 copy];
    [v4 setObject:v56 forKey:@"remoteQualifiedOutOfRangeDevices"];
  }
  if (self->_remoteDisqualifiedDevices)
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_remoteDisqualifiedDevices, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v58 = self->_remoteDisqualifiedDevices;
    uint64_t v59 = [(NSArray *)v58 countByEnumeratingWithState:&v67 objects:v95 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v68;
      do
      {
        for (juint64_t j = 0; jj != v60; ++jj)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * jj), "buildDictionaryRepresentation", (void)v67);
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSArray *)v58 countByEnumeratingWithState:&v67 objects:v95 count:16];
      }
      while (v60);
    }

    v64 = (void *)[v57 copy];
    [v4 setObject:v64 forKey:@"remoteDisqualifiedDevices"];
  }
  v65 = objc_msgSend(v4, "copy", (void)v67);

  return v65;
}

- (AFAudioSessionCoordinationSnapshot)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"currentOrUpNextDateInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v86 = v6;
    }
    else {
      id v86 = 0;
    }
    long long v85 = self;

    v8 = [v5 objectForKey:@"isAudioSessionActive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    unsigned int v84 = [v9 BOOLValue];
    uint64_t v10 = [v5 objectForKey:@"localActiveAssertionContexts"];
    objc_opt_class();
    unint64_t v11 = 0x1E4F1C000uLL;
    long long v87 = v5;
    if (objc_opt_isKindOfClass())
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v112 objects:v122 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v113;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v113 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(id *)(*((void *)&v112 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [[AFAssertionContext alloc] initWithDictionaryRepresentation:v18];

              if (v19) {
                [v12 addObject:v19];
              }
            }
            else
            {

              uint64_t v19 = 0;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v112 objects:v122 count:16];
        }
        while (v15);
      }

      long long v83 = (void *)[v12 copy];
      v5 = v87;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v83 = 0;
    }

    v20 = [v5 objectForKey:@"localPendingAssertionContexts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v20, "count"));
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v22 = v20;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v108 objects:v121 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v109;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v109 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = *(id *)(*((void *)&v108 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = [[AFAssertionContext alloc] initWithDictionaryRepresentation:v27];

              if (v28) {
                [v21 addObject:v28];
              }
            }
            else
            {

              v28 = 0;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v108 objects:v121 count:16];
        }
        while (v24);
      }

      long long v82 = (void *)[v21 copy];
      v5 = v87;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v82 = 0;
    }

    v29 = [v5 objectForKey:@"remoteActiveAssertionContexts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v29, "count"));
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v31 = v29;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v104 objects:v120 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v105;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v105 != v34) {
              objc_enumerationMutation(v31);
            }
            id v36 = *(id *)(*((void *)&v104 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v37 = [[AFAssertionContext alloc] initWithDictionaryRepresentation:v36];

              if (v37) {
                [v30 addObject:v37];
              }
            }
            else
            {

              v37 = 0;
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v104 objects:v120 count:16];
        }
        while (v33);
      }

      long long v81 = (void *)[v30 copy];
      v5 = v87;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v81 = 0;
    }

    v38 = [v5 objectForKey:@"remotePendingAssertionContexts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v38, "count"));
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v40 = v38;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v100 objects:v119 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v101;
        do
        {
          for (uint64_t m = 0; m != v42; ++m)
          {
            if (*(void *)v101 != v43) {
              objc_enumerationMutation(v40);
            }
            id v45 = *(id *)(*((void *)&v100 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = [[AFAssertionContext alloc] initWithDictionaryRepresentation:v45];

              if (v46) {
                [v39 addObject:v46];
              }
            }
            else
            {

              v46 = 0;
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v100 objects:v119 count:16];
        }
        while (v42);
      }

      long long v80 = (void *)[v39 copy];
      v5 = v87;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v80 = 0;
    }

    v47 = [v5 objectForKey:@"localDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v79 = [[AFAudioSessionCoordinationDeviceInfo alloc] initWithDictionaryRepresentation:v47];
    }
    else {
      long long v79 = 0;
    }

    v48 = [v5 objectForKey:@"remoteQualifiedInRangeDevices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v48, "count"));
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v50 = v48;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v96 objects:v118 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v97;
        do
        {
          for (uint64_t n = 0; n != v52; ++n)
          {
            if (*(void *)v97 != v53) {
              objc_enumerationMutation(v50);
            }
            id v55 = *(id *)(*((void *)&v96 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v56 = [[AFAudioSessionCoordinationDeviceInfo alloc] initWithDictionaryRepresentation:v55];

              if (v56) {
                [v49 addObject:v56];
              }
            }
            else
            {

              v56 = 0;
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v96 objects:v118 count:16];
        }
        while (v52);
      }

      long long v78 = (void *)[v49 copy];
      v5 = v87;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v78 = 0;
    }

    v57 = [v5 objectForKey:@"remoteQualifiedOutOfRangeDevices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v58 = objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v57, "count"));
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v59 = v57;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v92 objects:v117 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v93;
        do
        {
          for (iuint64_t i = 0; ii != v61; ++ii)
          {
            if (*(void *)v93 != v62) {
              objc_enumerationMutation(v59);
            }
            id v64 = *(id *)(*((void *)&v92 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v65 = [[AFAudioSessionCoordinationDeviceInfo alloc] initWithDictionaryRepresentation:v64];

              if (v65) {
                [v58 addObject:v65];
              }
            }
            else
            {

              v65 = 0;
            }
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v92 objects:v117 count:16];
        }
        while (v61);
      }

      long long v77 = (void *)[v58 copy];
      v5 = v87;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v77 = 0;
    }

    v66 = [v5 objectForKey:@"remoteDisqualifiedDevices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v67 = objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v66, "count"));
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v68 = v66;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v88 objects:v116 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v89;
        do
        {
          for (juint64_t j = 0; jj != v70; ++jj)
          {
            if (*(void *)v89 != v71) {
              objc_enumerationMutation(v68);
            }
            id v73 = *(id *)(*((void *)&v88 + 1) + 8 * jj);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v74 = [[AFAudioSessionCoordinationDeviceInfo alloc] initWithDictionaryRepresentation:v73];

              if (v74) {
                [v67 addObject:v74];
              }
            }
            else
            {

              long long v74 = 0;
            }
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v88 objects:v116 count:16];
        }
        while (v70);
      }

      long long v75 = (void *)[v67 copy];
      v5 = v87;
    }
    else
    {
      long long v75 = 0;
    }

    self = [(AFAudioSessionCoordinationSnapshot *)v85 initWithCurrentOrUpNextDateInterval:v86 isAudioSessionActive:v84 localActiveAssertionContexts:v83 localPendingAssertionContexts:v82 remoteActiveAssertionContexts:v81 remotePendingAssertionContexts:v80 localDevice:v79 remoteQualifiedInRangeDevices:v78 remoteQualifiedOutOfRangeDevices:v77 remoteDisqualifiedDevices:v75];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
  id v6 = a3;
  [v6 encodeObject:currentOrUpNextDateInterval forKey:@"AFAudioSessionCoordinationSnapshot::currentOrUpNextDateInterval"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAudioSessionActive];
  [v6 encodeObject:v5 forKey:@"AFAudioSessionCoordinationSnapshot::isAudioSessionActive"];

  [v6 encodeObject:self->_localActiveAssertionContexts forKey:@"AFAudioSessionCoordinationSnapshot::localActiveAssertionContexts"];
  [v6 encodeObject:self->_localPendingAssertionContexts forKey:@"AFAudioSessionCoordinationSnapshot::localPendingAssertionContexts"];
  [v6 encodeObject:self->_remoteActiveAssertionContexts forKey:@"AFAudioSessionCoordinationSnapshot::remoteActiveAssertionContexts"];
  [v6 encodeObject:self->_remotePendingAssertionContexts forKey:@"AFAudioSessionCoordinationSnapshot::remotePendingAssertionContexts"];
  [v6 encodeObject:self->_localDevice forKey:@"AFAudioSessionCoordinationSnapshot::localDevice"];
  [v6 encodeObject:self->_remoteQualifiedInRangeDevices forKey:@"AFAudioSessionCoordinationSnapshot::remoteQualifiedInRangeDevices"];
  [v6 encodeObject:self->_remoteQualifiedOutOfRangeDevices forKey:@"AFAudioSessionCoordinationSnapshot::remoteQualifiedOutOfRangeDevices"];
  [v6 encodeObject:self->_remoteDisqualifiedDevices forKey:@"AFAudioSessionCoordinationSnapshot::remoteDisqualifiedDevices"];
}

- (AFAudioSessionCoordinationSnapshot)initWithCoder:(id)a3
{
  id v3 = a3;
  v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSnapshot::currentOrUpNextDateInterval"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSnapshot::isAudioSessionActive"];
  unsigned int v36 = [v4 BOOLValue];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v35 = [v3 decodeObjectOfClasses:v7 forKey:@"AFAudioSessionCoordinationSnapshot::localActiveAssertionContexts"];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v34 = [v3 decodeObjectOfClasses:v10 forKey:@"AFAudioSessionCoordinationSnapshot::localPendingAssertionContexts"];

  unint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  uint64_t v14 = [v3 decodeObjectOfClasses:v13 forKey:@"AFAudioSessionCoordinationSnapshot::remoteActiveAssertionContexts"];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  id v18 = [v3 decodeObjectOfClasses:v17 forKey:@"AFAudioSessionCoordinationSnapshot::remotePendingAssertionContexts"];

  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSnapshot::localDevice"];
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  id v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  uint64_t v23 = [v3 decodeObjectOfClasses:v22 forKey:@"AFAudioSessionCoordinationSnapshot::remoteQualifiedInRangeDevices"];

  uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  id v27 = [v3 decodeObjectOfClasses:v26 forKey:@"AFAudioSessionCoordinationSnapshot::remoteQualifiedOutOfRangeDevices"];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  id v31 = [v3 decodeObjectOfClasses:v30 forKey:@"AFAudioSessionCoordinationSnapshot::remoteDisqualifiedDevices"];

  uint64_t v32 = [(AFAudioSessionCoordinationSnapshot *)self initWithCurrentOrUpNextDateInterval:v37 isAudioSessionActive:v36 localActiveAssertionContexts:v35 localPendingAssertionContexts:v34 remoteActiveAssertionContexts:v14 remotePendingAssertionContexts:v18 localDevice:v19 remoteQualifiedInRangeDevices:v23 remoteQualifiedOutOfRangeDevices:v27 remoteDisqualifiedDevices:v31];
  return v32;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFAudioSessionCoordinationSnapshot *)a3;
  if (self == v4)
  {
    BOOL v28 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isAudioSessionActive = self->_isAudioSessionActive;
      if (isAudioSessionActive == [(AFAudioSessionCoordinationSnapshot *)v5 isAudioSessionActive])
      {
        v7 = [(AFAudioSessionCoordinationSnapshot *)v5 currentOrUpNextDateInterval];
        currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
        if (currentOrUpNextDateInterval == v7
          || [(NSDateInterval *)currentOrUpNextDateInterval isEqual:v7])
        {
          uint64_t v9 = [(AFAudioSessionCoordinationSnapshot *)v5 localActiveAssertionContexts];
          localActiveAssertionContexts = self->_localActiveAssertionContexts;
          if (localActiveAssertionContexts == v9
            || [(NSArray *)localActiveAssertionContexts isEqual:v9])
          {
            unint64_t v11 = [(AFAudioSessionCoordinationSnapshot *)v5 localPendingAssertionContexts];
            localPendingAssertionContexts = self->_localPendingAssertionContexts;
            if (localPendingAssertionContexts == v11
              || [(NSArray *)localPendingAssertionContexts isEqual:v11])
            {
              id v13 = [(AFAudioSessionCoordinationSnapshot *)v5 remoteActiveAssertionContexts];
              remoteActiveAssertionContexts = self->_remoteActiveAssertionContexts;
              if (remoteActiveAssertionContexts == v13
                || [(NSArray *)remoteActiveAssertionContexts isEqual:v13])
              {
                uint64_t v15 = [(AFAudioSessionCoordinationSnapshot *)v5 remotePendingAssertionContexts];
                remotePendingAssertionContexts = self->_remotePendingAssertionContexts;
                if (remotePendingAssertionContexts == v15
                  || [(NSArray *)remotePendingAssertionContexts isEqual:v15])
                {
                  uint64_t v17 = [(AFAudioSessionCoordinationSnapshot *)v5 localDevice];
                  localDevice = self->_localDevice;
                  if (localDevice == v17
                    || [(AFAudioSessionCoordinationDeviceInfo *)localDevice isEqual:v17])
                  {
                    uint64_t v19 = [(AFAudioSessionCoordinationSnapshot *)v5 remoteQualifiedInRangeDevices];
                    remoteQualifiedInRangeDevices = self->_remoteQualifiedInRangeDevices;
                    if (remoteQualifiedInRangeDevices == v19
                      || [(NSArray *)remoteQualifiedInRangeDevices isEqual:v19])
                    {
                      id v31 = v17;
                      uint64_t v21 = [(AFAudioSessionCoordinationSnapshot *)v5 remoteQualifiedOutOfRangeDevices];
                      remoteQualifiedOutOfRangeDevices = self->_remoteQualifiedOutOfRangeDevices;
                      if (remoteQualifiedOutOfRangeDevices == v21
                        || (uint64_t v23 = v21,
                            int v24 = [(NSArray *)remoteQualifiedOutOfRangeDevices isEqual:v21],
                            uint64_t v21 = v23,
                            v24))
                      {
                        uint64_t v25 = v21;
                        uint64_t v26 = [(AFAudioSessionCoordinationSnapshot *)v5 remoteDisqualifiedDevices];
                        remoteDisqualifiedDevices = self->_remoteDisqualifiedDevices;
                        BOOL v28 = remoteDisqualifiedDevices == v26
                           || [(NSArray *)remoteDisqualifiedDevices isEqual:v26];

                        uint64_t v19 = v30;
                        uint64_t v21 = v25;
                      }
                      else
                      {
                        BOOL v28 = 0;
                      }
                      uint64_t v17 = v31;
                    }
                    else
                    {
                      BOOL v28 = 0;
                    }
                  }
                  else
                  {
                    BOOL v28 = 0;
                  }
                }
                else
                {
                  BOOL v28 = 0;
                }
              }
              else
              {
                BOOL v28 = 0;
              }
            }
            else
            {
              BOOL v28 = 0;
            }
          }
          else
          {
            BOOL v28 = 0;
          }
        }
        else
        {
          BOOL v28 = 0;
        }
      }
      else
      {
        BOOL v28 = 0;
      }
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_currentOrUpNextDateInterval hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAudioSessionActive];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v3 ^ [(NSArray *)self->_localActiveAssertionContexts hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_localPendingAssertionContexts hash];
  uint64_t v8 = [(NSArray *)self->_remoteActiveAssertionContexts hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_remotePendingAssertionContexts hash];
  unint64_t v10 = v9 ^ [(AFAudioSessionCoordinationDeviceInfo *)self->_localDevice hash];
  uint64_t v11 = v7 ^ v10 ^ [(NSArray *)self->_remoteQualifiedInRangeDevices hash];
  uint64_t v12 = [(NSArray *)self->_remoteQualifiedOutOfRangeDevices hash];
  unint64_t v13 = v11 ^ v12 ^ [(NSArray *)self->_remoteDisqualifiedDevices hash];

  return v13;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFAudioSessionCoordinationSnapshot;
  uint64_t v5 = [(AFAudioSessionCoordinationSnapshot *)&v10 description];
  uint64_t v6 = (void *)v5;
  if (self->_isAudioSessionActive) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {currentOrUpNextDateInterval = %@, BOOL isAudioSessionActive = %@, localActiveAssertionContexts = %@, localPendingAssertionContexts = %@, remoteActiveAssertionContexts = %@, remotePendingAssertionContexts = %@, localDevice = %@, remoteQualifiedInRangeDevices = %@, remoteQualifiedOutOfRangeDevices = %@, remoteDisqualifiedDevices = %@}", v5, self->_currentOrUpNextDateInterval, v7, self->_localActiveAssertionContexts, self->_localPendingAssertionContexts, self->_remoteActiveAssertionContexts, self->_remotePendingAssertionContexts, self->_localDevice, self->_remoteQualifiedInRangeDevices, self->_remoteQualifiedOutOfRangeDevices, self->_remoteDisqualifiedDevices];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(AFAudioSessionCoordinationSnapshot *)self _descriptionWithIndent:0];
}

- (AFAudioSessionCoordinationSnapshot)initWithCurrentOrUpNextDateInterval:(id)a3 isAudioSessionActive:(BOOL)a4 localActiveAssertionContexts:(id)a5 localPendingAssertionContexts:(id)a6 remoteActiveAssertionContexts:(id)a7 remotePendingAssertionContexts:(id)a8 localDevice:(id)a9 remoteQualifiedInRangeDevices:(id)a10 remoteQualifiedOutOfRangeDevices:(id)a11 remoteDisqualifiedDevices:(id)a12
{
  id v37 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __316__AFAudioSessionCoordinationSnapshot_initWithCurrentOrUpNextDateInterval_isAudioSessionActive_localActiveAssertionContexts_localPendingAssertionContexts_remoteActiveAssertionContexts_remotePendingAssertionContexts_localDevice_remoteQualifiedInRangeDevices_remoteQualifiedOutOfRangeDevices_remoteDisqualifiedDevices___block_invoke;
  v40[3] = &unk_1E592AF98;
  BOOL v50 = a4;
  id v41 = v37;
  id v42 = v16;
  id v43 = v17;
  id v44 = v18;
  int v24 = v17;
  uint64_t v25 = v18;
  id v45 = v19;
  id v46 = v20;
  id v47 = v21;
  id v48 = v22;
  id v49 = v23;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v25;
  id v32 = v24;
  id v33 = v16;
  id v34 = v37;
  uint64_t v35 = [(AFAudioSessionCoordinationSnapshot *)self initWithBuilder:v40];

  return v35;
}

void __316__AFAudioSessionCoordinationSnapshot_initWithCurrentOrUpNextDateInterval_isAudioSessionActive_localActiveAssertionContexts_localPendingAssertionContexts_remoteActiveAssertionContexts_remotePendingAssertionContexts_localDevice_remoteQualifiedInRangeDevices_remoteQualifiedOutOfRangeDevices_remoteDisqualifiedDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setCurrentOrUpNextDateInterval:v3];
  [v4 setIsAudioSessionActive:*(unsigned __int8 *)(a1 + 104)];
  [v4 setLocalActiveAssertionContexts:*(void *)(a1 + 40)];
  [v4 setLocalPendingAssertionContexts:*(void *)(a1 + 48)];
  [v4 setRemoteActiveAssertionContexts:*(void *)(a1 + 56)];
  [v4 setRemotePendingAssertionContexts:*(void *)(a1 + 64)];
  [v4 setLocalDevice:*(void *)(a1 + 72)];
  [v4 setRemoteQualifiedInRangeDevices:*(void *)(a1 + 80)];
  [v4 setRemoteQualifiedOutOfRangeDevices:*(void *)(a1 + 88)];
  [v4 setRemoteDisqualifiedDevices:*(void *)(a1 + 96)];
}

- (AFAudioSessionCoordinationSnapshot)init
{
  return [(AFAudioSessionCoordinationSnapshot *)self initWithBuilder:0];
}

- (AFAudioSessionCoordinationSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFAudioSessionCoordinationSnapshotMutation *))a3;
  v36.receiver = self;
  v36.super_class = (Class)AFAudioSessionCoordinationSnapshot;
  uint64_t v5 = [(AFAudioSessionCoordinationSnapshot *)&v36 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFAudioSessionCoordinationSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFAudioSessionCoordinationSnapshotMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getCurrentOrUpNextDateInterval];
      uint64_t v9 = [v8 copy];
      currentOrUpNextDateInterval = v6->_currentOrUpNextDateInterval;
      v6->_currentOrUpNextDateInterval = (NSDateInterval *)v9;

      v6->_BOOL isAudioSessionActive = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getIsAudioSessionActive];
      uint64_t v11 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getLocalActiveAssertionContexts];
      uint64_t v12 = [v11 copy];
      localActiveAssertionContexts = v6->_localActiveAssertionContexts;
      v6->_localActiveAssertionContexts = (NSArray *)v12;

      uint64_t v14 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getLocalPendingAssertionContexts];
      uint64_t v15 = [v14 copy];
      localPendingAssertionContexts = v6->_localPendingAssertionContexts;
      v6->_localPendingAssertionContexts = (NSArray *)v15;

      id v17 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getRemoteActiveAssertionContexts];
      uint64_t v18 = [v17 copy];
      remoteActiveAssertionContexts = v6->_remoteActiveAssertionContexts;
      v6->_remoteActiveAssertionContexts = (NSArray *)v18;

      id v20 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getRemotePendingAssertionContexts];
      uint64_t v21 = [v20 copy];
      remotePendingAssertionContexts = v6->_remotePendingAssertionContexts;
      v6->_remotePendingAssertionContexts = (NSArray *)v21;

      id v23 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getLocalDevice];
      uint64_t v24 = [v23 copy];
      localDevice = v6->_localDevice;
      v6->_localDevice = (AFAudioSessionCoordinationDeviceInfo *)v24;

      id v26 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getRemoteQualifiedInRangeDevices];
      uint64_t v27 = [v26 copy];
      remoteQualifiedInRangeDevices = v6->_remoteQualifiedInRangeDevices;
      v6->_remoteQualifiedInRangeDevices = (NSArray *)v27;

      id v29 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getRemoteQualifiedOutOfRangeDevices];
      uint64_t v30 = [v29 copy];
      remoteQualifiedOutOfRangeDevices = v6->_remoteQualifiedOutOfRangeDevices;
      v6->_remoteQualifiedOutOfRangeDevices = (NSArray *)v30;

      id v32 = [(_AFAudioSessionCoordinationSnapshotMutation *)v7 getRemoteDisqualifiedDevices];
      uint64_t v33 = [v32 copy];
      remoteDisqualifiedDevices = v6->_remoteDisqualifiedDevices;
      v6->_remoteDisqualifiedDevices = (NSArray *)v33;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFAudioSessionCoordinationSnapshotMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFAudioSessionCoordinationSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFAudioSessionCoordinationSnapshotMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFAudioSessionCoordinationSnapshot);
      uint64_t v7 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getCurrentOrUpNextDateInterval];
      uint64_t v8 = [v7 copy];
      currentOrUpNextDateInterval = v6->_currentOrUpNextDateInterval;
      v6->_currentOrUpNextDateInterval = (NSDateInterval *)v8;

      v6->_BOOL isAudioSessionActive = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getIsAudioSessionActive];
      objc_super v10 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getLocalActiveAssertionContexts];
      uint64_t v11 = [v10 copy];
      localActiveAssertionContexts = v6->_localActiveAssertionContexts;
      v6->_localActiveAssertionContexts = (NSArray *)v11;

      unint64_t v13 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getLocalPendingAssertionContexts];
      uint64_t v14 = [v13 copy];
      localPendingAssertionContexts = v6->_localPendingAssertionContexts;
      v6->_localPendingAssertionContexts = (NSArray *)v14;

      id v16 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getRemoteActiveAssertionContexts];
      uint64_t v17 = [v16 copy];
      remoteActiveAssertionContexts = v6->_remoteActiveAssertionContexts;
      v6->_remoteActiveAssertionContexts = (NSArray *)v17;

      id v19 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getRemotePendingAssertionContexts];
      uint64_t v20 = [v19 copy];
      remotePendingAssertionContexts = v6->_remotePendingAssertionContexts;
      v6->_remotePendingAssertionContexts = (NSArray *)v20;

      id v22 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getLocalDevice];
      uint64_t v23 = [v22 copy];
      localDevice = v6->_localDevice;
      v6->_localDevice = (AFAudioSessionCoordinationDeviceInfo *)v23;

      uint64_t v25 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getRemoteQualifiedInRangeDevices];
      uint64_t v26 = [v25 copy];
      remoteQualifiedInRangeDevices = v6->_remoteQualifiedInRangeDevices;
      v6->_remoteQualifiedInRangeDevices = (NSArray *)v26;

      id v28 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getRemoteQualifiedOutOfRangeDevices];
      uint64_t v29 = [v28 copy];
      remoteQualifiedOutOfRangeDevices = v6->_remoteQualifiedOutOfRangeDevices;
      v6->_remoteQualifiedOutOfRangeDevices = (NSArray *)v29;

      id v31 = [(_AFAudioSessionCoordinationSnapshotMutation *)v5 getRemoteDisqualifiedDevices];
      uint64_t v32 = [v31 copy];
      remoteDisqualifiedDevices = v6->_remoteDisqualifiedDevices;
      v6->_remoteDisqualifiedDevices = (NSArray *)v32;
    }
    else
    {
      uint64_t v6 = (AFAudioSessionCoordinationSnapshot *)[(AFAudioSessionCoordinationSnapshot *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFAudioSessionCoordinationSnapshot *)[(AFAudioSessionCoordinationSnapshot *)self copy];
  }

  return v6;
}

@end