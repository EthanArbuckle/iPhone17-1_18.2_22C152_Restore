@interface _CRKSendMessageCardFactory
+ (BOOL)supportsSecureCoding;
- (BOOL)canSatisfyCardRequest:(id)a3;
- (NSString)serviceIdentifier;
- (_CRKSendMessageCardFactory)initWithCoder:(id)a3;
- (_CRKSendMessageCardFactoryDelegate)delegate;
- (unint64_t)servicePriorityForRequest:(id)a3;
- (void)buildCardForContent:(id)a3 completion:(id)a4;
- (void)requestCard:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _CRKSendMessageCardFactory

- (void)buildCardForContent:(id)a3 completion:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  if (v7)
  {
    if ([v6 conformsToProtocol:&unk_26D87F808])
    {
      v7[2](v7, v6, 0);
      goto LABEL_36;
    }
    if (objc_opt_respondsToSelector())
    {
      v8 = [v6 underlyingInteraction];
    }
    else
    {
      v8 = 0;
    }
    v9 = [v8 intent];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7[2](v7, 0, 0);
LABEL_35:

      goto LABEL_36;
    }
    v69 = v9;
    id v10 = v9;
    v71 = v8;
    v72 = [v8 intentResponse];
    id v11 = objc_alloc_init(MEMORY[0x263F677D0]);
    [v11 setType:1];
    v12 = [MEMORY[0x263F08C38] UUID];
    v13 = [v12 UUIDString];
    [v11 setCardId:v13];

    v70 = v11;
    [v11 setSource:2];
    id v68 = objc_alloc_init(MEMORY[0x263F67AA0]);
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"SEND_MESSAGE_TO_PREFIX" value:&stru_26D8523E8 table:0];

    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v73 = v10;
    v17 = [v10 recipients];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v74 objects:v79 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v75 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v74 + 1) + 8 * i) displayName];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v74 objects:v79 count:16];
      }
      while (v19);
    }

    v23 = [(_CRKSendMessageCardFactory *)self delegate];
    uint64_t v24 = [v23 semanticContentAttributeForCardFactory:self];

    if (v24 == 4)
    {
      v25 = [v16 reverseObjectEnumerator];
      id v26 = [v25 allObjects];
    }
    else
    {
      id v26 = v16;
    }
    v67 = v26;
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"MESSAGE_RECIPIENTS_DELIMITER" value:&stru_26D8523E8 table:0];
    v29 = [v26 componentsJoinedByString:v28];

    v30 = [v73 speakableGroupName];
    uint64_t v31 = [v30 spokenPhrase];
    if (v31)
    {
      v32 = (void *)v31;
      uint64_t v65 = v24;
      v33 = v29;
      v34 = [v73 speakableGroupName];
      v35 = [v34 spokenPhrase];

      if (!v35)
      {
        v29 = v33;
        uint64_t v24 = v65;
        goto LABEL_25;
      }
      v30 = [v73 speakableGroupName];
      v36 = [v30 spokenPhrase];
      uint64_t v37 = [v36 mutableCopy];

      v29 = (void *)v37;
      uint64_t v24 = v65;
    }

LABEL_25:
    v66 = v29;
    if (v24 == 4)
    {
      id v38 = (id)[v29 copy];
      id v39 = v15;
    }
    else
    {
      id v38 = v15;
      id v39 = (id)[v29 copy];
    }
    v63 = v38;
    v64 = v39;
    v40 = [NSString stringWithFormat:@"%@%@", v38, v39];
    [v68 setTitle:v40];

    v41 = [MEMORY[0x263F08C38] UUID];
    v42 = [v41 UUIDString];
    [v68 setCardSectionId:v42];

    [v68 setParameterKeyPaths:&unk_26D85A0E0];
    [v68 setSeparatorStyle:2];
    id v43 = objc_alloc_init(MEMORY[0x263F67960]);
    if ([v72 code] == 3) {
      uint64_t v44 = 2;
    }
    else {
      uint64_t v44 = 1;
    }
    [v43 setMessageStatus:v44];
    v45 = [v73 launchId];
    INExtractAppInfoFromSiriLaunchId();
    id v62 = 0;

    if ([v62 isEqualToString:@"com.apple.MobileSMS"]) {
      uint64_t v46 = 1;
    }
    else {
      uint64_t v46 = 3;
    }
    [v43 setMessageServiceType:v46];
    v61 = [v73 content];
    [v43 setMessageText:v61];
    [v43 setSeparatorStyle:1];
    v47 = [MEMORY[0x263F08C38] UUID];
    v48 = [v47 UUIDString];
    [v43 setCardSectionId:v48];

    [v43 setParameterKeyPaths:&unk_26D85A0F8];
    v49 = [v73 backingStore];
    v50 = [v49 data];

    [v70 setIntentMessageData:v50];
    objc_opt_class();
    v51 = INIntentSchemaGetIntentDescriptionWithFacadeClass();
    v52 = [v51 type];
    [v70 setIntentMessageName:v52];

    v53 = [v72 backingStore];
    v54 = [v53 data];
    [v70 setIntentResponseMessageData:v54];

    objc_opt_class();
    v55 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
    v56 = [v55 type];
    [v70 setIntentResponseMessageName:v56];

    id v57 = objc_alloc_init(MEMORY[0x263F67980]);
    v58 = [MEMORY[0x263F08C38] UUID];
    v59 = [v58 UUIDString];
    [v57 setCardSectionId:v59];

    [v57 setParameterKeyPaths:MEMORY[0x263EFFA68]];
    v78[0] = v57;
    v78[1] = v68;
    v78[2] = v43;
    v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
    [v70 setCardSections:v60];

    v7[2](v7, v70, 0);
    v8 = v71;
    v9 = v69;
    goto LABEL_35;
  }
LABEL_36:
}

- (void)requestCard:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [a3 content];
  [(_CRKSendMessageCardFactory *)self buildCardForContent:v7 completion:v6];
}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 content];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 underlyingInteraction];
    id v6 = [v5 intent];
  }
  else
  {
    id v6 = 0;
  }
  BOOL v7 = 0;
  if (([v4 conformsToProtocol:&unk_26D87F808] & 1) == 0 && v6)
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 format] != 2;
  }

  return v7;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  return 2;
}

- (NSString)serviceIdentifier
{
  return (NSString *)@"com.apple.CardKit.BuiltInSendMessageCardFactory";
}

- (_CRKSendMessageCardFactory)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_CRKSendMessageCardFactory;
  return [(_CRKSendMessageCardFactory *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CRKSendMessageCardFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CRKSendMessageCardFactoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end