@interface CNGroupIdentityInlineActionsViewConfiguration
- (BOOL)displaysUnavailableActionTypes;
- (CNGroupIdentityInlineActionsViewConfiguration)initWithDefaultActionItems:(id)a3 displaysUnavailableActionTypes:(BOOL)a4;
- (CNGroupIdentityInlineActionsViewConfiguration)initWithDefaultActionItems:(id)a3 displaysUnavailableActionTypes:(BOOL)a4 actionViewStyle:(int64_t)a5;
- (NSArray)supportedActionTypes;
- (NSDictionary)actionsPerType;
- (NSString)geminiChannelIdentifier;
- (int64_t)actionViewStyle;
- (void)setGeminiChannelIdentifier:(id)a3;
@end

@implementation CNGroupIdentityInlineActionsViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiChannelIdentifier, 0);
  objc_storeStrong((id *)&self->_actionsPerType, 0);

  objc_storeStrong((id *)&self->_supportedActionTypes, 0);
}

- (void)setGeminiChannelIdentifier:(id)a3
{
}

- (NSString)geminiChannelIdentifier
{
  return self->_geminiChannelIdentifier;
}

- (int64_t)actionViewStyle
{
  return self->_actionViewStyle;
}

- (NSDictionary)actionsPerType
{
  return self->_actionsPerType;
}

- (NSArray)supportedActionTypes
{
  return self->_supportedActionTypes;
}

- (BOOL)displaysUnavailableActionTypes
{
  return self->_displaysUnavailableActionTypes;
}

- (CNGroupIdentityInlineActionsViewConfiguration)initWithDefaultActionItems:(id)a3 displaysUnavailableActionTypes:(BOOL)a4 actionViewStyle:(int64_t)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNGroupIdentityInlineActionsViewConfiguration;
  v9 = [(CNGroupIdentityInlineActionsViewConfiguration *)&v21 init];
  v10 = v9;
  if (v9)
  {
    v9->_displaysUnavailableActionTypes = a4;
    v11 = [MEMORY[0x1E4F1CA48] array];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __123__CNGroupIdentityInlineActionsViewConfiguration_initWithDefaultActionItems_displaysUnavailableActionTypes_actionViewStyle___block_invoke;
    v19[3] = &unk_1E54976A0;
    id v20 = v11;
    id v12 = v11;
    uint64_t v13 = objc_msgSend(v8, "_cn_indexBy:", v19);
    actionsPerType = v10->_actionsPerType;
    v10->_actionsPerType = (NSDictionary *)v13;

    uint64_t v15 = [v12 copy];
    supportedActionTypes = v10->_supportedActionTypes;
    v10->_supportedActionTypes = (NSArray *)v15;

    v10->_actionViewStyle = a5;
    v17 = v10;
  }
  return v10;
}

id __123__CNGroupIdentityInlineActionsViewConfiguration_initWithDefaultActionItems_displaysUnavailableActionTypes_actionViewStyle___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 actionType];
  objc_msgSend(*(id *)(a1 + 32), "_cn_addNonNilObjectIfNotPresent:", v3);

  return v3;
}

- (CNGroupIdentityInlineActionsViewConfiguration)initWithDefaultActionItems:(id)a3 displaysUnavailableActionTypes:(BOOL)a4
{
  return [(CNGroupIdentityInlineActionsViewConfiguration *)self initWithDefaultActionItems:a3 displaysUnavailableActionTypes:a4 actionViewStyle:7];
}

@end