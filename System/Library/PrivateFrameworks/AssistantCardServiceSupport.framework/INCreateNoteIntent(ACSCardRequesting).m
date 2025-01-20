@interface INCreateNoteIntent(ACSCardRequesting)
- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting;
- (void)_buildCardFromRequest:()ACSCardRequesting reply:;
- (void)requestCard:()ACSCardRequesting reply:;
@end

@implementation INCreateNoteIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = [v6 content];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v8 underlyingInteraction], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      unint64_t v11 = [v9 intentHandlingStatus];
      if (v11 <= 6)
      {
        if (v11 == 4)
        {
          v17 = (void *)MEMORY[0x263F087E8];
          uint64_t v18 = *MEMORY[0x263F31628];
          v19 = [NSString stringWithFormat:@"Content %@ is incompatible with this service", v8, *MEMORY[0x263F07F80]];
          v23 = v19;
          v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          v21 = [v17 errorWithDomain:v18 code:400 userInfo:v20];
          v7[2](v7, 0, v21);
        }
        else
        {
          [a1 _buildCardFromRequest:v6 reply:v7];
        }
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F31628];
      uint64_t v24 = *MEMORY[0x263F07F80];
      v14 = [NSString stringWithFormat:@"Content %@ is incompatible with this service", v8];
      v25[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      v16 = [v12 errorWithDomain:v13 code:400 userInfo:v15];
      v7[2](v7, 0, v16);

      v10 = 0;
    }
  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

- (void)_buildCardFromRequest:()ACSCardRequesting reply:
{
  v60[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    v7 = [a3 content];
    v48 = v7;
    if (objc_opt_respondsToSelector())
    {
      v8 = [v7 underlyingInteraction];
    }
    else
    {
      v8 = 0;
    }
    v47 = v8;
    id v9 = [v8 intentResponse];
    v46 = objc_msgSend(MEMORY[0x263F677D0], "acs_uniquelyIdentifiedCard");
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    unint64_t v11 = [v9 createdNote];
    v12 = [v11 title];
    uint64_t v13 = [v12 spokenPhrase];

    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = [MEMORY[0x263F0FCE0] parameterForClass:objc_opt_class() keyPath:@"createdNote.title"];
    }
    else
    {
      v16 = [a1 title];
      id v14 = [v16 spokenPhrase];

      uint64_t v15 = [MEMORY[0x263F0FCE0] parameterForClass:objc_opt_class() keyPath:@"title"];
      if (!v14) {
        goto LABEL_11;
      }
    }
    v17 = objc_msgSend(MEMORY[0x263F679F8], "acs_uniquelyIdentifiedCardSection");
    [v17 setTitle:v14];
    [v17 setIsCentered:1];
    [v17 setSeparatorStyle:5];
    [v17 setTitleAlign:1];
    [v17 setTitleWeight:&unk_26D3AB7A8];
    if (v15)
    {
      v60[0] = v15;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
      v19 = uint64_t v18 = v15;
      objc_msgSend(v17, "acs_setParameters:", v19);

      uint64_t v15 = v18;
    }
    [v10 addObject:v17];

LABEL_11:
    v44 = v13;
    v20 = objc_msgSend(MEMORY[0x263F67980], "acs_wildCardSection");
    [v10 addObject:v20];

    v21 = [a1 content];
    v45 = v11;
    uint64_t v22 = [v11 contents];
    v23 = v22;
    id v49 = v6;
    v42 = v22;
    v43 = (void *)v15;
    if (v22 || !v21)
    {
      id v24 = v22;
      id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v25 = v30;
      if (v23)
      {
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __69__INCreateNoteIntent_ACSCardRequesting___buildCardFromRequest_reply___block_invoke;
        v54[3] = &unk_2645BC1D0;
        id v25 = v30;
        id v55 = v25;
        id v56 = v9;
        [v24 enumerateObjectsUsingBlock:v54];

        goto LABEL_18;
      }
      if (!v21)
      {
LABEL_30:
        objc_msgSend(v46, "setCardSections:", v10, v41);
        objc_msgSend(v46, "acs_setInteraction:", v47);
        id v6 = v49;
        (*((void (**)(id, void *, void))v49 + 2))(v49, v46, 0);

        goto LABEL_31;
      }
      id v24 = 0;
    }
    else
    {
      v59 = v21;
      id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
      id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v26 = (void *)MEMORY[0x263F0FCE0];
    uint64_t v27 = objc_opt_class();
    v28 = [NSString stringWithFormat:@"content"];
    v29 = [v26 parameterForClass:v27 keyPath:v28];
    [v25 setObject:v29 forKey:v21];

    if (!v24) {
      goto LABEL_30;
    }
LABEL_18:
    v41 = v21;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v31 = v24;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v51 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v37 = objc_msgSend(v36, "acs_cardSection", v41, v42, v43);
          uint64_t v38 = [v25 objectForKey:v36];
          v39 = (void *)v38;
          if (v38)
          {
            uint64_t v57 = v38;
            v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
            objc_msgSend(v37, "acs_setParameters:", v40);
          }
          if (v37) {
            [v10 addObject:v37];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v33);
    }

    v21 = v41;
    goto LABEL_30;
  }
LABEL_31:
}

@end