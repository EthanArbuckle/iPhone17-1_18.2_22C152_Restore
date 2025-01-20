@interface FAInviteRecipientEvaluator
- (id)parseRecipientAddresses:(id)a3;
- (id)recipientAlreadyInFamily:(id)a3 emailOnly:(BOOL)a4 recipients:(id)a5;
- (void)showAlreadyFamilyMember:(id)a3 presenter:(id)a4;
- (void)validateRecipients:(id)a3 inviteContext:(id)a4 presenter:(id)a5 completion:(id)a6;
@end

@implementation FAInviteRecipientEvaluator

- (id)parseRecipientAddresses:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  id v5 = objc_alloc_init(MEMORY[0x263F335B8]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(v5, "firstEmailAddressInString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)recipientAlreadyInFamily:(id)a3 emailOnly:(BOOL)a4 recipients:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v36 = a5;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v28 = v6;
  obuint64_t j = [v6 members];
  uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v53 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v34 = [v9 appleID];
        if (!v34) {
          goto LABEL_20;
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v10 = v36;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v49;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v49 != v12) {
                objc_enumerationMutation(v10);
              }
              if (objc_msgSend(v34, "ea_isEqualToEmailAddress:", *(void *)(*((void *)&v48 + 1) + 8 * j)))
              {
                long long v14 = [v9 fullName];

                if (v14)
                {
                  uint64_t v11 = [v9 fullName];
                  [v7 addObject:v11];

                  LOBYTE(v11) = 1;
                  goto LABEL_19;
                }
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v58 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_19:

        if ((v11 & 1) == 0)
        {
LABEL_20:
          if (!a4)
          {
            uint64_t v31 = i;
            long long v15 = [v9 memberPhoneNumbers];
            long long v16 = [v15 componentsSeparatedByString:@","];

            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v35 = v16;
            uint64_t v38 = [v35 countByEnumeratingWithState:&v44 objects:v57 count:16];
            if (v38)
            {
              uint64_t v37 = *(void *)v45;
              do
              {
                for (uint64_t k = 0; k != v38; ++k)
                {
                  if (*(void *)v45 != v37) {
                    objc_enumerationMutation(v35);
                  }
                  uint64_t v18 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:*(void *)(*((void *)&v44 + 1) + 8 * k)];
                  if (v18)
                  {
                    uint64_t v39 = k;
                    long long v42 = 0u;
                    long long v43 = 0u;
                    long long v40 = 0u;
                    long long v41 = 0u;
                    id v19 = v36;
                    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v56 count:16];
                    if (v20)
                    {
                      uint64_t v21 = v20;
                      uint64_t v22 = *(void *)v41;
                      do
                      {
                        for (uint64_t m = 0; m != v21; ++m)
                        {
                          if (*(void *)v41 != v22) {
                            objc_enumerationMutation(v19);
                          }
                          v24 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:*(void *)(*((void *)&v40 + 1) + 8 * m)];
                          if ([v18 isEqual:v24])
                          {
                            v25 = [v9 fullName];

                            if (v25)
                            {
                              v26 = [v9 fullName];
                              [v7 addObject:v26];
                            }
                          }
                        }
                        uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v56 count:16];
                      }
                      while (v21);
                    }

                    uint64_t k = v39;
                  }
                }
                uint64_t v38 = [v35 countByEnumeratingWithState:&v44 objects:v57 count:16];
              }
              while (v38);
            }

            uint64_t i = v31;
          }
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v33);
  }

  return v7;
}

- (void)showAlreadyFamilyMember:(id)a3 presenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__FAInviteRecipientEvaluator_showAlreadyFamilyMember_presenter___block_invoke;
  block[3] = &unk_2643491B8;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__FAInviteRecipientEvaluator_showAlreadyFamilyMember_presenter___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = v3;
  if (v2 <= 1) {
    id v5 = @"FAMILY_INVITE_ALREADY_FAMILY_MEMBER";
  }
  else {
    id v5 = @"FAMILY_INVITE_ALREADY_FAMILY_MEMBERS";
  }
  id v14 = [v3 localizedStringForKey:v5 value:&stru_26CA2C800 table:@"Localizable"];

  id v6 = NSString;
  id v7 = (void *)MEMORY[0x263F08950];
  id v8 = [*(id *)(a1 + 32) allObjects];
  id v9 = [v7 localizedStringByJoiningStrings:v8];
  id v10 = objc_msgSend(v6, "stringWithFormat:", v14, v9);

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];

  id v13 = [MEMORY[0x263F82418] alertWithTitle:v10 message:0 buttonTitle:v12 actionHandler:&__block_literal_global_7];
  [*(id *)(a1 + 48) presentViewController:v13 animated:1 completion:0];
}

- (void)validateRecipients:(id)a3 inviteContext:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    if ([v11 validation])
    {
      id v14 = objc_alloc_init(MEMORY[0x263F3BF48]);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __84__FAInviteRecipientEvaluator_validateRecipients_inviteContext_presenter_completion___block_invoke;
      v15[3] = &unk_2643491E0;
      v15[4] = self;
      id v16 = v10;
      id v18 = v13;
      id v17 = v12;
      [v14 startRequestWithCompletionHandler:v15];
    }
    else
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __84__FAInviteRecipientEvaluator_validateRecipients_inviteContext_presenter_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) recipientAlreadyInFamily:a2 emailOnly:0 recipients:*(void *)(a1 + 40)];
  uint64_t v3 = [v5 count];
  v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  if (v3)
  {
    v4();
    [*(id *)(a1 + 32) showAlreadyFamilyMember:v5 presenter:*(void *)(a1 + 48)];
  }
  else
  {
    v4();
  }
}

@end