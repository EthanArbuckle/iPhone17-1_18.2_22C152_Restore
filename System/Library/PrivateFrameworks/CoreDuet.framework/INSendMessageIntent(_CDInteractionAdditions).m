@interface INSendMessageIntent(_CDInteractionAdditions)
- (id)cd_derivedIntentIdentifier;
- (id)cd_groupName;
- (uint64_t)cd_interactionMechanism;
@end

@implementation INSendMessageIntent(_CDInteractionAdditions)

- (uint64_t)cd_interactionMechanism
{
  return 4;
}

- (id)cd_groupName
{
  v1 = [a1 speakableGroupName];
  v2 = [v1 spokenPhrase];

  return v2;
}

- (id)cd_derivedIntentIdentifier
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 notificationThreadIdentifier];
  if (!v2
    || (v3 = (void *)v2,
        [a1 notificationThreadIdentifier],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v3,
        !v5))
  {
    uint64_t v8 = [a1 conversationIdentifier];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [a1 conversationIdentifier];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        v6 = NSStringFromSelector(sel_conversationIdentifier);
        v7 = [a1 conversationIdentifier];
        goto LABEL_7;
      }
    }
    v14 = [a1 speakableGroupName];
    uint64_t v15 = [v14 spokenPhrase];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [a1 speakableGroupName];
      v18 = [v17 spokenPhrase];
      uint64_t v19 = [v18 length];

      if (v19)
      {
        v6 = NSStringFromSelector(sel_speakableGroupName);
        v12 = [a1 speakableGroupName];
        id v20 = [v12 spokenPhrase];
        v13 = _CDNormalizeString(v20);
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
    }
    v6 = [a1 recipients];
    if (v6)
    {
      v21 = [a1 recipients];
      v13 = (void *)[v21 count];

      if (v13)
      {
        v6 = NSStringFromSelector(sel_recipients);
        v12 = [a1 recipients];
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v41 = [&unk_1EDE1E950 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v41)
        {
          v39 = v6;
          uint64_t v40 = *(void *)v47;
LABEL_16:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v47 != v40) {
              objc_enumerationMutation(&unk_1EDE1E950);
            }
            v23 = *(void **)(*((void *)&v46 + 1) + 8 * v22);
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            v24 = [v12 valueForKey:v23];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v43;
LABEL_21:
              uint64_t v28 = 0;
              while (1)
              {
                if (*(void *)v43 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v42 + 1) + 8 * v28);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || ![v29 length]) {
                  break;
                }
                v30 = _CDNormalizeString(v29);
                [v20 addObject:v30];

                if (v26 == ++v28)
                {
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
                  if (v26) {
                    goto LABEL_21;
                  }
                  break;
                }
              }
            }

            uint64_t v31 = [v20 count];
            if (v31 == [v12 count]) {
              break;
            }
            [v20 removeAllObjects];
            if (++v22 == v41)
            {
              uint64_t v41 = [&unk_1EDE1E950 countByEnumeratingWithState:&v46 objects:v51 count:16];
              if (v41) {
                goto LABEL_16;
              }
              goto LABEL_38;
            }
          }
          id v32 = v23;
          if (v32)
          {
            v33 = v32;
            v34 = [v20 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
            v35 = NSString;
            v36 = [v34 componentsJoinedByString:@"-"];
            v13 = [v35 stringWithFormat:@"%@:%@", v33, v36];

            goto LABEL_39;
          }
LABEL_38:
          v13 = 0;
LABEL_39:
          v6 = v39;
        }
        else
        {
          v13 = 0;
        }
        goto LABEL_40;
      }
      v6 = 0;
    }
    else
    {
      v13 = 0;
    }
    v37 = 0;
    goto LABEL_44;
  }
  v6 = NSStringFromSelector(sel_notificationThreadIdentifier);
  v7 = [a1 notificationThreadIdentifier];
LABEL_7:
  v12 = v7;
  v13 = _CDNormalizeString(v7);
LABEL_41:

  v37 = 0;
  if (v13 && v6)
  {
    v37 = [NSString stringWithFormat:@"%@(%@)", v6, v13];
  }
LABEL_44:

  return v37;
}

@end