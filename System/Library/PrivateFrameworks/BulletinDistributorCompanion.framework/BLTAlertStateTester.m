@interface BLTAlertStateTester
- (BOOL)isScreenTimeBlockedForBundleIdentifier:(id)a3 ignoresDowntime:(BOOL)a4;
- (BOOL)testCheckedSubsections;
- (id)sectionInfoRetriever;
- (unint64_t)willNanoPresentNotificationForSectionInfo:(id)a3 subsectionIDs:(id)a4 isWristDetectDisabled:(BOOL)a5 hasSectionIDOptedOutOfCoordination:(BOOL)a6 hasSectionIDOptedForwardOnly:(BOOL)a7 ignoresDowntime:(BOOL)a8 isCritical:(BOOL)a9;
- (void)setSectionInfoRetriever:(id)a3;
- (void)setTestCheckedSubsections:(BOOL)a3;
@end

@implementation BLTAlertStateTester

- (unint64_t)willNanoPresentNotificationForSectionInfo:(id)a3 subsectionIDs:(id)a4 isWristDetectDisabled:(BOOL)a5 hasSectionIDOptedOutOfCoordination:(BOOL)a6 hasSectionIDOptedForwardOnly:(BOOL)a7 ignoresDowntime:(BOOL)a8 isCritical:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  v17 = [v15 sectionID];
  LODWORD(v9) = [(BLTAlertStateTester *)self isScreenTimeBlockedForBundleIdentifier:v17 ignoresDowntime:v9];

  uint64_t v18 = 512;
  if (!v9) {
    uint64_t v18 = 0;
  }
  if (v12) {
    v18 |= 0x80uLL;
  }
  if (v11) {
    v18 |= 0x40uLL;
  }
  if (v10) {
    uint64_t v19 = v18 | 0x100;
  }
  else {
    uint64_t v19 = v18;
  }
  v20 = [v15 subsections];
  v47 = v16;
  if ([v16 count] && objc_msgSend(v20, "count"))
  {
    unint64_t v45 = v19;
    id v46 = v15;
    v21 = self;
    [(BLTAlertStateTester *)self setTestCheckedSubsections:1];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v44 = v20;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(v22);
          }
          v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v30 = [v29 subsectionID];
          int v31 = [v47 containsObject:v30];

          if (v31)
          {
            uint64_t v32 = [(BLTAlertStateTester *)v21 _blockingReasonForSectionInfo:v29 isCritical:a9];
            if (!v32) {
              goto LABEL_38;
            }
            uint64_t v26 = v32;
            v25 |= v32;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v24);

      if (v26)
      {
        unint64_t v33 = v25 | v45;
        id v15 = v46;
LABEL_40:
        v20 = v44;
        goto LABEL_41;
      }
    }
    else
    {
LABEL_38:
    }
    unint64_t v33 = v45;
    id v15 = v46;
    goto LABEL_40;
  }
  [(BLTAlertStateTester *)self setTestCheckedSubsections:0];
  if ([v16 count] && !objc_msgSend(v20, "count"))
  {
    v34 = blt_general_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [v15 sectionID];
      *(_DWORD *)buf = 138412802;
      v54 = v35;
      __int16 v55 = 2112;
      id v56 = v16;
      __int16 v57 = 2112;
      id v58 = v15;
      _os_log_impl(&dword_222F4C000, v34, OS_LOG_TYPE_DEFAULT, "Checking if notification with subsections will present in sectionInfo that has no subsections! Falling back to checking against sectionInfo. sectionID:%@ subsectionIDs:%@ sectionInfo:%@", buf, 0x20u);
    }
  }
  id v36 = [v15 factorySectionID];
  if (!v36 || ![v15 suppressFromSettings]) {
    goto LABEL_36;
  }
  v37 = [(BLTAlertStateTester *)self sectionInfoRetriever];

  if (v37)
  {
    v38 = [(BLTAlertStateTester *)self sectionInfoRetriever];
    v39 = [v15 factorySectionID];
    ((void (**)(void, void *))v38)[2](v38, v39);
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v40 = blt_general_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [v15 sectionID];
        v42 = [v15 factorySectionID];
        *(_DWORD *)buf = 138412546;
        v54 = v41;
        __int16 v55 = 2112;
        id v56 = v42;
        _os_log_impl(&dword_222F4C000, v40, OS_LOG_TYPE_DEFAULT, "Section settings for %@ overridden by factory section %@", buf, 0x16u);
      }
      id v36 = v36;

      id v15 = v36;
    }
LABEL_36:
  }
  unint64_t v33 = [(BLTAlertStateTester *)self _blockingReasonForSectionInfo:v15 isCritical:a9] | v19;
LABEL_41:

  return v33;
}

- (BOOL)isScreenTimeBlockedForBundleIdentifier:(id)a3 ignoresDowntime:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v5];
  uint64_t v7 = [v6 deviceManagementPolicy];
  if (v7) {
    BOOL v8 = !v4;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    char v14 = 1;
  }
  else
  {
    uint64_t v9 = v7;
    BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F39D10]) initWithPolicyChangeHandler:0];
    uint64_t v18 = 0;
    BOOL v11 = [v10 requestPoliciesByBundleIdentifierWithError:&v18];
    BOOL v12 = v11;
    if (v18)
    {
      BOOL v13 = 1;
    }
    else
    {
      id v15 = [v11 objectForKey:v5];
      uint64_t v16 = [v15 unsignedIntegerValue];

      BOOL v13 = v16 == 0;
    }
    if (v9) {
      BOOL v13 = 0;
    }
    char v14 = !v13 && !v4;
  }
  return v14;
}

- (id)sectionInfoRetriever
{
  return self->_sectionInfoRetriever;
}

- (void)setSectionInfoRetriever:(id)a3
{
}

- (BOOL)testCheckedSubsections
{
  return self->_testCheckedSubsections;
}

- (void)setTestCheckedSubsections:(BOOL)a3
{
  self->_testCheckedSubsections = a3;
}

- (void).cxx_destruct
{
}

@end