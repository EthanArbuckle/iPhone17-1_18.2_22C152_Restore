@interface EKEvent(Suggestions)
- (BOOL)sg_isCuratedEventFromSuggestionNewerThan:()Suggestions;
- (id)sg_fallbackURL;
- (id)sg_schemas;
- (uint64_t)sg_eventMetadata;
@end

@implementation EKEvent(Suggestions)

- (id)sg_fallbackURL
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "sg_schemas");
  v2 = v1;
  if (!v1)
  {
    v3 = sgEventsLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "sg_fallbackURL: Event does not have schame", buf, 2u);
    }
    goto LABEL_24;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
      v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"url", (void)v21);

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_24;
      }
    }
    v10 = [v8 objectForKeyedSubscript:@"url"];
    v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 scheme];
      v14 = [v13 lowercaseString];
      if ([v14 isEqualToString:@"http"])
      {

LABEL_19:
        goto LABEL_25;
      }
      v17 = [v12 scheme];
      v18 = [v17 lowercaseString];
      char v19 = [v18 isEqualToString:@"https"];

      if (v19) {
        goto LABEL_19;
      }
      v15 = sgDeveloperLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v16 = "Ignoring URL that is not http or https";
    }
    else
    {
      v15 = sgDeveloperLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      v16 = "Could not convert string to URL";
    }
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    goto LABEL_23;
  }
LABEL_24:
  v12 = 0;
LABEL_25:

  return v12;
}

- (id)sg_schemas
{
  v1 = objc_msgSend(a1, "sg_eventMetadata");
  v2 = [v1 schemaOrg];

  return v2;
}

- (uint64_t)sg_eventMetadata
{
  return [MEMORY[0x1E4F5DA18] eventMetadataFromEKEvent:a1];
}

- (BOOL)sg_isCuratedEventFromSuggestionNewerThan:()Suggestions
{
  uint64_t v4 = [a1 suggestionInfo];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [a1 suggestionInfo],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 timestamp],
        double v8 = v7,
        v6,
        v5,
        v8 == 0.0))
  {
    v12 = sgEventsLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "sg_isCuratedEventFromSuggestionNewerThan: missing suggestion info or timestamp", v14, 2u);
    }

    return 0;
  }
  else
  {
    v9 = [a1 suggestionInfo];
    [v9 timestamp];
    BOOL v11 = v10 > a2;
  }
  return v11;
}

@end