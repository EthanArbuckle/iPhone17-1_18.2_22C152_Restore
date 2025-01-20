@interface BLSHBacklightEnvironmentPresentation
- (BLSHBacklightEnvironmentPresentation)initWithEnvironments:(id)a3 caContext:(id)a4 expirationDate:(id)a5;
- (BLSHBacklightEnvironmentPresentation)initWithPresentationEntries:(id)a3 caContext:(id)a4 expirationDate:(id)a5;
- (BLSHBacklightEnvironmentPresentation)initWithPresentationEntries:(id)a3 flipbookContext:(id)a4 expirationDate:(id)a5;
- (BLSHFlipbookContext)flipbookContext;
- (BLSHPresentationDateSpecifier)currentSpecifier;
- (BOOL)containsEnvironment:(id)a3;
- (BOOL)hasUnrestrictedFramerateUpdates;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighLuminanceAlwaysOn;
- (BOOL)isLiveUpdating;
- (CAContext)caContext;
- (NSArray)environments;
- (NSArray)presentationEntries;
- (NSDate)expirationDate;
- (NSSet)environmentsSet;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (id)debugDescription;
- (id)differenceFromPresentation:(id)a3;
- (unint64_t)hash;
- (void)differenceFromPresentation:(id)a3 forEachRemoval:(id)a4 forEachAddition:(id)a5;
- (void)invalidateContentForReason:(id)a3;
@end

@implementation BLSHBacklightEnvironmentPresentation

- (BLSHBacklightEnvironmentPresentation)initWithPresentationEntries:(id)a3 flipbookContext:(id)a4 expirationDate:(id)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v60 = a5;
  v80.receiver = self;
  v80.super_class = (Class)BLSHBacklightEnvironmentPresentation;
  v11 = [(BLSHBacklightEnvironmentPresentation *)&v80 init];
  if (v11)
  {
    if (!v9)
    {
      v56 = [NSString stringWithFormat:@"%p cannot initialize with nil presentationEntries, %@", v11, v11];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:](a2, (uint64_t)v11, (uint64_t)v56);
      }
      [v56 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD4AE74);
    }
    SEL v57 = a2;
    id v58 = v10;
    uint64_t v12 = [v9 copy];
    presentationEntries = v11->_presentationEntries;
    v11->_presentationEntries = (NSArray *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v67 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v59 = v9;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v77 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v76 + 1) + 8 * i) environment];
          [v14 addObject:v20];
          v21 = [v20 identifier];
          [v67 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v17);
    }

    uint64_t v22 = [v14 copy];
    environmentsSet = v11->_environmentsSet;
    v11->_environmentsSet = (NSSet *)v22;

    objc_storeStrong((id *)&v11->_flipbookContext, a4);
    objc_storeStrong((id *)&v11->_expirationDate, a5);
    uint64_t v24 = [v67 count];
    if (v24 != [v15 count] || (uint64_t v25 = objc_msgSend(v14, "count"), v25 != objc_msgSend(v15, "count")))
    {
      v61 = v11;
      id v26 = objc_alloc(MEMORY[0x263F29C70]);
      uint64_t v27 = [v14 count];
      v28 = [MEMORY[0x263F29C90] sortByInsertionOrder];
      v29 = (void *)[v26 initWithCapacity:v27 keyOrderingStrategy:v28];

      v65 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = v15;
      uint64_t v30 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
      v64 = v29;
      if (v30)
      {
        uint64_t v31 = v30;
        int v62 = 0;
        uint64_t v66 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v73 != v66) {
              objc_enumerationMutation(obj);
            }
            v33 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            v34 = [v33 environment];
            v35 = [v34 identifier];
            v36 = [v29 objectForKey:v35];
            v37 = v36;
            if (v36)
            {
              v38 = v14;
              v39 = [v36 environment];
              v40 = [v33 environment];

              if (v37 == v33)
              {
                v45 = bls_backlight_log();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218498;
                  v84 = v61;
                  __int16 v85 = 1024;
                  *(_DWORD *)v86 = v62 + j;
                  *(_WORD *)&v86[4] = 2114;
                  *(void *)&v86[6] = v33;
                  _os_log_error_impl(&dword_21FCFC000, v45, OS_LOG_TYPE_ERROR, "%p entry appears twice, index:%d %{public}@", buf, 0x1Cu);
                }

                v46 = v65;
              }
              else
              {
                v41 = bls_backlight_log();
                BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
                if (v39 == v40)
                {
                  if (v42)
                  {
                    *(_DWORD *)buf = 134218498;
                    v84 = v61;
                    __int16 v85 = 2114;
                    *(void *)v86 = v37;
                    *(_WORD *)&v86[8] = 2114;
                    *(void *)&v86[10] = v33;
                    _os_log_error_impl(&dword_21FCFC000, v41, OS_LOG_TYPE_ERROR, "%p duplicate entries for same environment: %{public}@ %{public}@", buf, 0x20u);
                  }
                }
                else if (v42)
                {
                  v43 = [v37 environment];
                  v44 = [v33 environment];
                  *(_DWORD *)buf = 134218498;
                  v84 = v61;
                  __int16 v85 = 2114;
                  *(void *)v86 = v43;
                  *(_WORD *)&v86[8] = 2114;
                  *(void *)&v86[10] = v44;
                  _os_log_error_impl(&dword_21FCFC000, v41, OS_LOG_TYPE_ERROR, "%p two environments have the same identifier: %{public}@ %{public}@", buf, 0x20u);
                }
                [v65 addObject:v37];
                v46 = v65;
              }
              [v46 addObject:v33];
              v14 = v38;
              v29 = v64;
            }
            else
            {
              [v29 setObject:v33 forKey:v35];
            }
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
          v62 += j;
        }
        while (v31);
      }

      if (!os_variant_has_internal_diagnostics()) {
        goto LABEL_36;
      }
      v47 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
      v81 = @"crashOnInvalidPresentation";
      uint64_t v82 = MEMORY[0x263EFFA80];
      v48 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      [v47 registerDefaults:v48];

      int v49 = [v47 BOOLForKey:@"crashOnInvalidPresentation"];
      if (v49)
      {
        v11 = v61;
        v50 = [NSString stringWithFormat:@"%p bad presentation created, duplicate entries: %@", v61, v65];
        BLSHRecordCriticalAssertFailure(v50);
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __99__BLSHBacklightEnvironmentPresentation_initWithPresentationEntries_flipbookContext_expirationDate___block_invoke;
        v68[3] = &unk_2645324E8;
        v69 = v61;
        id v70 = v65;
        SEL v71 = v57;
        v51 = (void (**)(void))MEMORY[0x223C5E2B0](v68);
        if (BLSHIsUnitTestRunning())
        {
          v51[2](v51);
        }
        else
        {
          dispatch_time_t v52 = dispatch_time(0, 1000000000);
          dispatch_after(v52, MEMORY[0x263EF83A0], v51);
        }
      }
      else
      {
LABEL_36:
        v50 = bls_backlight_log();
        v11 = v61;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
          -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:]((uint64_t)v61, (uint64_t)v65, v50);
        }
      }

      uint64_t v53 = [v64 allValues];
      v54 = v11->_presentationEntries;
      v11->_presentationEntries = (NSArray *)v53;
    }
    id v10 = v58;
    id v9 = v59;
  }

  return v11;
}

void __99__BLSHBacklightEnvironmentPresentation_initWithPresentationEntries_flipbookContext_expirationDate___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  v3 = [NSString stringWithFormat:@"%p bad presentation created, duplicate entries: %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    id v9 = v4;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = @"BLSHBacklightEnvironmentPresentation.m";
    __int16 v16 = 1024;
    int v17 = 86;
    __int16 v18 = 2114;
    v19 = v3;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v3 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BLSHBacklightEnvironmentPresentation)initWithPresentationEntries:(id)a3 caContext:(id)a4 expirationDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[BLSHFlipbookContext alloc] initWithCAContext:v9 wantsTransform:0 inverted:0];

  __int16 v12 = [(BLSHBacklightEnvironmentPresentation *)self initWithPresentationEntries:v10 flipbookContext:v11 expirationDate:v8];
  return v12;
}

- (BLSHBacklightEnvironmentPresentation)initWithEnvironments:(id)a3 caContext:(id)a4 expirationDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_16);
  v11 = [(BLSHBacklightEnvironmentPresentation *)self initWithPresentationEntries:v10 caContext:v9 expirationDate:v8];

  return v11;
}

BLSHPresentationEntry *__86__BLSHBacklightEnvironmentPresentation_initWithEnvironments_caContext_expirationDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BLSHPresentationEntry alloc] initWithEnvironment:v2 userObject:0];

  return v3;
}

- (NSArray)environments
{
  return (NSArray *)[(NSArray *)self->_presentationEntries bs_mapNoNulls:&__block_literal_global_25];
}

uint64_t __52__BLSHBacklightEnvironmentPresentation_environments__block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment];
}

- (BOOL)isLiveUpdating
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_presentationEntries;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "environment", (void)v9);
        char v7 = [v6 isLiveUpdating];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_presentationEntries;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "environment", (void)v9);
        char v7 = [v6 hasUnrestrictedFramerateUpdates];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isHighLuminanceAlwaysOn
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self->_presentationEntries;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v7 = objc_msgSend(v6, "environment", (void)v11);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [v6 environment];
          char v9 = [v8 isHighLuminanceAlwaysOn];

          if (v9)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BLSHPresentationDateSpecifier)currentSpecifier
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__8;
  long long v14 = __Block_byref_object_dispose__8;
  id v15 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v3 = [(BLSHBacklightEnvironmentPresentation *)self presentationEntries];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__BLSHBacklightEnvironmentPresentation_currentSpecifier__block_invoke;
  v9[3] = &unk_264533B78;
  v9[4] = &v10;
  uint64_t v4 = objc_msgSend(v3, "bs_mapNoNulls:", v9);

  v5 = (void *)v11[5];
  v6 = [MEMORY[0x263EFF910] distantPast];
  LOBYTE(v5) = [v5 isEqualToDate:v6];

  if (v5)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = +[BLSHPresentationDateSpecifier specifierWithPresentationDate:v11[5] specifiers:v4];
  }

  _Block_object_dispose(&v10, 8);

  return (BLSHPresentationDateSpecifier *)v7;
}

id __56__BLSHBacklightEnvironmentPresentation_currentSpecifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 currentSpecifier];
  uint64_t v4 = [v3 dateSpecifier];
  v5 = [v4 date];

  if (v5)
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) laterDate:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  return v3;
}

- (CAContext)caContext
{
  return [(BLSHFlipbookContext *)self->_flipbookContext caContext];
}

- (id)bls_shortLoggingString
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendArraySection:self->_presentationEntries withName:0 skipIfEmpty:0 objectTransformer:&__block_literal_global_32];
  uint64_t v4 = [(NSDate *)self->_expirationDate bls_loggingString];
  [v3 appendString:v4 withName:@"expirationDate" skipIfEmpty:1];

  v5 = [v3 build];

  return v5;
}

id __62__BLSHBacklightEnvironmentPresentation_bls_shortLoggingString__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 environment];
  uint64_t v3 = NSString;
  uint64_t v4 = [v2 identifier];
  v5 = [v3 stringWithFormat:@"<%p:%@>", v2, v4];

  return v5;
}

- (id)bls_loggingString
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendArraySection:self->_presentationEntries withName:@"presentationEntries" skipIfEmpty:0 objectTransformer:&__block_literal_global_43];
  id v4 = (id)[v3 appendObject:self->_flipbookContext withName:@"context"];
  v5 = [(NSDate *)self->_expirationDate bls_loggingString];
  [v3 appendString:v5 withName:@"expirationDate" skipIfEmpty:1];

  uint64_t v6 = [v3 build];

  return v6;
}

id __57__BLSHBacklightEnvironmentPresentation_bls_loggingString__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 environment];
  uint64_t v3 = NSString;
  id v4 = [v2 identifier];
  v5 = [v3 stringWithFormat:@"<%p:%@>", v2, v4];

  return v5;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendArraySection:self->_presentationEntries withName:@"presentationEntries" skipIfEmpty:0 objectTransformer:&__block_literal_global_49];
  id v4 = (id)[v3 appendObject:self->_flipbookContext withName:@"context"];
  v5 = [(NSDate *)self->_expirationDate bls_loggingString];
  [v3 appendString:v5 withName:@"expirationDate" skipIfEmpty:1];

  uint64_t v6 = [v3 build];

  return v6;
}

uint64_t __56__BLSHBacklightEnvironmentPresentation_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugDescription];
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_presentationEntries];
  id v5 = (id)[v3 appendObject:self->_flipbookContext];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  presentationEntries = self->_presentationEntries;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke;
  v18[3] = &unk_264532810;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:presentationEntries counterpart:v18];
  flipbookContext = self->_flipbookContext;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke_2;
  uint64_t v16 = &unk_264532810;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:flipbookContext counterpart:&v13];
  LOBYTE(flipbookContext) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)flipbookContext;
}

uint64_t __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationEntries];
}

uint64_t __48__BLSHBacklightEnvironmentPresentation_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) flipbookContext];
}

- (BOOL)containsEnvironment:(id)a3
{
  return [(NSSet *)self->_environmentsSet containsObject:a3];
}

- (id)differenceFromPresentation:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 environmentsSet];
  unint64_t v6 = (void *)[(NSSet *)self->_environmentsSet mutableCopy];
  id v7 = v6;
  if (v5) {
    [v6 minusSet:v5];
  }
  id v8 = (void *)[v5 mutableCopy];
  [v8 minusSet:self->_environmentsSet];
  if ([v7 count]) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = [v8 count] != 0;
  }
  BOOL v26 = v9;
  id v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = self->_presentationEntries;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) environment];
        if ([v7 containsObject:v16]) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }

  id v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v27 = v4;
  __int16 v18 = [v4 presentationEntries];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v28 + 1) + 8 * j) environment];
        if ([v8 containsObject:v23]) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [[BLSHPresentationDifference alloc] initWithHasChanges:v26 insertedEnvironments:v10 removedEnvironments:v17];

  return v24;
}

- (void)differenceFromPresentation:(id)a3 forEachRemoval:(id)a4 forEachAddition:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void))a4;
  BOOL v9 = (void (**)(id, void))a5;
  id v10 = [(BLSHBacklightEnvironmentPresentation *)self differenceFromPresentation:a3];
  if ([v10 hasChanges])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [v10 removals];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v8[2](v8, *(void *)(*((void *)&v25 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v13);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v16 = objc_msgSend(v10, "insertions", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          v9[2](v9, *(void *)(*((void *)&v21 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }
  }
}

- (void)invalidateContentForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_presentationEntries;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "environment", (void)v11);
        [v10 invalidateContentForReason:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSArray)presentationEntries
{
  return self->_presentationEntries;
}

- (BLSHFlipbookContext)flipbookContext
{
  return self->_flipbookContext;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSSet)environmentsSet
{
  return self->_environmentsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentsSet, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_flipbookContext, 0);

  objc_storeStrong((id *)&self->_presentationEntries, 0);
}

- (void)initWithPresentationEntries:(const char *)a1 flipbookContext:(uint64_t)a2 expirationDate:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"BLSHBacklightEnvironmentPresentation.m";
  __int16 v16 = 1024;
  int v17 = 26;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)initWithPresentationEntries:(uint64_t)a1 flipbookContext:(uint64_t)a2 expirationDate:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_21FCFC000, log, OS_LOG_TYPE_FAULT, "%p bad presentation created, duplicate entries: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end