@interface APUICardService
+ (BOOL)supportsSecureCoding;
- (BOOL)canSatisfyCardRequest:(id)a3;
- (NSString)serviceIdentifier;
- (unint64_t)servicePriorityForRequest:(id)a3;
- (void)requestCard:(id)a3 reply:(id)a4;
@end

@implementation APUICardService

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v3 = a3;
  v4 = +[APUICardRequestSatisfactionCriteria generalSatisfactionCriteria];
  char v5 = [v4 canSatisfyCardRequest:v3];

  return v5;
}

- (NSString)serviceIdentifier
{
  v2 = (void *)[(id)kAPUICardServiceIdentifier copy];

  return (NSString *)v2;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v3 = a3;
  v4 = +[APUICardRequestSatisfactionCriteria customIntentSatisfactionCriteria];
  unint64_t v5 = [v4 servicePriorityForRequest:v3];

  v6 = +[APUICardRequestSatisfactionCriteria compactSatisfactionCriteria];
  unint64_t v7 = [v6 servicePriorityForRequest:v3];

  if (v5 <= v7) {
    return v7;
  }
  else {
    return v5;
  }
}

- (void)requestCard:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    if ([(APUICardService *)self canSatisfyCardRequest:v6])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [v6 cardViewConfig];
      }
      else
      {
        v8 = objc_alloc_init(APUIActionCardViewConfig);
        [(APUIActionCardViewConfig *)v8 setStyle:2];
        [(APUIActionCardViewConfig *)v8 setShowThumbnailImage:1];
        [(APUIActionCardViewConfig *)v8 setShowAppFootnote:1];
        [(APUIActionCardViewConfig *)v8 setShowActionButton:1];
      }
      v11 = [v6 content];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        v13 = [(APUIActionCardViewConfig *)v8 bundleId];
        uint64_t v14 = [v13 length];

        if (!v14)
        {
          v15 = [v12 _bundleIdForDisplay];
          [(APUIActionCardViewConfig *)v8 setBundleId:v15];
        }
        v9 = +[APUIActionCardUtils cardSectionForATXAction:v12 withConfig:v8];
        id v16 = [v12 intent];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v11;
          id v16 = [v18 intent];
          v17 = [v18 intentResponse];
          v9 = +[APUIActionCardUtils cardSectionForINInteraction:v18 withConfig:v8];

          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = +[APUIActionCardUtils cardSectionForNSUserActivity:v11 withConfig:v8];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v32 = __atxlog_handle_ui();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                -[APUICardService requestCard:reply:](v6, v32);
              }

              v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:0 userInfo:0];
              v7[2](v7, 0, v17);
              id v16 = 0;
              v9 = 0;
              goto LABEL_36;
            }
            uint64_t v19 = +[APUIActionCardUtils cardSectionForHeroApp:v11 withConfig:v8];
          }
          v9 = v19;
          v17 = 0;
          id v16 = 0;
LABEL_25:
          v20 = +[APUIActionCardUtils cardForCardSection:v9];
          if (v16)
          {
            v21 = [v16 backingStore];
            v22 = [v21 data];
            [v20 setIntentMessageData:v22];

            v23 = [v16 _intentInstanceDescription];
            v24 = [v23 type];
            [v20 setIntentMessageName:v24];
          }
          if (v17)
          {
            v25 = __atxlog_handle_ui();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v33) = 0;
              _os_log_impl(&dword_23455F000, v25, OS_LOG_TYPE_DEFAULT, "settings ActionCardService intentResponse...", (uint8_t *)&v33, 2u);
            }

            v26 = [v17 backingStore];
            v27 = [v26 data];
            [v20 setIntentResponseMessageData:v27];

            v28 = [v17 _payloadResponseTypeName];
            [v20 setIntentResponseMessageName:v28];

            v29 = __atxlog_handle_ui();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[APUICardService requestCard:reply:](v20, v29);
            }

            v30 = __atxlog_handle_ui();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = [v20 intentResponseMessageName];
              int v33 = 138412290;
              v34 = v31;
              _os_log_impl(&dword_23455F000, v30, OS_LOG_TYPE_DEFAULT, "name: %@", (uint8_t *)&v33, 0xCu);
            }
          }
          ((void (**)(id, void *, void *))v7)[2](v7, v20, 0);

LABEL_36:
          goto LABEL_37;
        }
        id v16 = v11;
        v9 = +[APUIActionCardUtils cardSectionForINIntent:v16 withConfig:v8];
      }
      v17 = 0;
      goto LABEL_25;
    }
    v10 = __atxlog_handle_ui();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[APUICardService requestCard:reply:].cold.4((uint64_t)v6, v10);
    }

    v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:0 userInfo:0];
    v7[2](v7, 0, v9);
  }
  else
  {
    v9 = __atxlog_handle_ui();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[APUICardService requestCard:reply:](v9);
    }
  }
LABEL_37:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)requestCard:(os_log_t)log reply:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 5501;
  _os_log_error_impl(&dword_23455F000, log, OS_LOG_TYPE_ERROR, "e:%ld * No reply block specified for cardRequest!", (uint8_t *)&v1, 0xCu);
}

- (void)requestCard:(void *)a1 reply:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 intentResponseMessageData];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_debug_impl(&dword_23455F000, a2, OS_LOG_TYPE_DEBUG, "data: %@", (uint8_t *)&v4, 0xCu);
}

- (void)requestCard:(void *)a1 reply:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 content];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_fault_impl(&dword_23455F000, a2, OS_LOG_TYPE_FAULT, "e:fault The cardContent is not something we can render: %@", (uint8_t *)&v4, 0xCu);
}

- (void)requestCard:(uint64_t)a1 reply:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 5501;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23455F000, a2, OS_LOG_TYPE_ERROR, "e:%ld * We cannot satisfy the card request: %@", (uint8_t *)&v2, 0x16u);
}

@end