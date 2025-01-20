@interface CERecommendation
+ (BOOL)supportsSecureCoding;
- (BOOL)completed;
- (CEIcon)icon;
- (CERecommendation)initWithCoder:(id)a3;
- (CERecommendation)initWithDictionary:(id)a3;
- (CERecommendation)initWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 bundleID:(id)a6 storageRecoverable:(id)a7 category:(id)a8 actions:(id)a9;
- (CERecommendation)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6 bundleID:(id)a7 storageRecoverable:(id)a8 category:(id)a9 actions:(id)a10;
- (NSArray)actions;
- (NSNumber)storageRecoverable;
- (NSString)bundleID;
- (NSString)category;
- (NSString)identifier;
- (NSString)message;
- (NSString)status;
- (NSString)subTitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)parseActions:(id)a3;
- (void)setActions:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStorageRecoverable:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CERecommendation

- (CERecommendation)initWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 bundleID:(id)a6 storageRecoverable:(id)a7 category:(id)a8 actions:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v16 = a8;
  id v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)CERecommendation;
  v18 = [(CERecommendation *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    subTitle = v19->_subTitle;
    v19->_subTitle = (NSString *)&stru_26FE029C8;

    objc_storeStrong((id *)&v19->_message, a5);
    objc_storeStrong((id *)&v19->_bundleID, a6);
    objc_storeStrong((id *)&v19->_storageRecoverable, a7);
    objc_storeStrong((id *)&v19->_category, a8);
    objc_storeStrong((id *)&v19->_actions, a9);
    v19->_completed = 0;
    status = v19->_status;
    v19->_status = 0;
  }
  return v19;
}

- (CERecommendation)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6 bundleID:(id)a7 storageRecoverable:(id)a8 category:(id)a9 actions:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v17 = a10;
  v29.receiver = self;
  v29.super_class = (Class)CERecommendation;
  v18 = [(CERecommendation *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_subTitle, a5);
    objc_storeStrong((id *)&v19->_message, a6);
    objc_storeStrong((id *)&v19->_bundleID, a7);
    objc_storeStrong((id *)&v19->_storageRecoverable, a8);
    objc_storeStrong((id *)&v19->_category, a9);
    objc_storeStrong((id *)&v19->_actions, a10);
    v19->_completed = 0;
    status = v19->_status;
    v19->_status = 0;
  }
  return v19;
}

- (CERecommendation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CERecommendation;
  v5 = [(CERecommendation *)&v47 init];
  v6 = v5;
  if (v5)
  {
    v5->_completed = 0;
    v7 = [v4 objectForKeyedSubscript:@"id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      identifier = v6->_identifier;
      v6->_identifier = v8;
    }
    else
    {
      identifier = _CELogSystem();
      if (os_log_type_enabled(identifier, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:]0();
      }
    }

    v10 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v10;
      title = v6->_title;
      v6->_title = v11;
    }
    else
    {
      title = _CELogSystem();
      if (os_log_type_enabled(title, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:].cold.9();
      }
    }

    v13 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = v13;
      subTitle = v6->_subTitle;
      v6->_subTitle = v14;
    }
    else
    {
      subTitle = _CELogSystem();
      if (os_log_type_enabled(subTitle, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:].cold.8();
      }
    }

    id v16 = [v4 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
      message = v6->_message;
      v6->_message = v17;
    }
    else
    {
      message = _CELogSystem();
      if (os_log_type_enabled(message, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:].cold.7();
      }
    }

    v19 = [v4 objectForKeyedSubscript:@"bundleID"];
    objc_opt_class();
    v46 = v19;
    if (objc_opt_isKindOfClass())
    {
      v20 = v19;
      bundleID = v6->_bundleID;
      v6->_bundleID = v20;
    }
    else
    {
      bundleID = _CELogSystem();
      if (os_log_type_enabled(bundleID, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:].cold.6();
      }
    }

    id v22 = [v4 objectForKeyedSubscript:@"storageRecoverable"];
    objc_opt_class();
    v45 = v22;
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
      p_super = &v6->_storageRecoverable->super.super;
      v6->_storageRecoverable = v23;
    }
    else
    {
      p_super = _CELogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:].cold.5();
      }
    }

    id v25 = [v4 objectForKeyedSubscript:@"category"];
    objc_opt_class();
    v44 = v25;
    if (objc_opt_isKindOfClass())
    {
      id v26 = v25;
      category = v6->_category;
      v6->_category = v26;
    }
    else
    {
      category = _CELogSystem();
      if (os_log_type_enabled(category, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:].cold.4();
      }
    }

    id v28 = [v4 objectForKeyedSubscript:@"actions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CERecommendation *)v6 parseActions:v28];
    }
    else
    {
      objc_super v29 = _CELogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:]();
      }
    }
    v30 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v30;
      status = v6->_status;
      v6->_status = v31;
    }
    else
    {
      status = _CELogSystem();
      if (os_log_type_enabled(status, OS_LOG_TYPE_DEBUG)) {
        -[CERecommendation initWithDictionary:]();
      }
    }

    v33 = [v4 objectForKeyedSubscript:@"icon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = v16;
      v43 = v13;
      v34 = v10;
      v35 = v7;
      v36 = [v33 objectForKeyedSubscript:@"type"];
      int v37 = [v36 isEqualToString:@"IMAGE"];

      v38 = [v33 objectForKeyedSubscript:@"type"];
      int v39 = [v38 isEqualToString:@"SF_SYMBOL"];

      if (v37)
      {
        v40 = [[CEImageIcon alloc] initWithDictionary:v33];
        if (v40) {
          objc_storeStrong((id *)&v6->_icon, v40);
        }
        v7 = v35;
        v10 = v34;
        id v16 = v42;
        v13 = v43;
      }
      else
      {
        v7 = v35;
        v10 = v34;
        id v16 = v42;
        v13 = v43;
        if (!v39) {
          goto LABEL_47;
        }
        v40 = [[CESymbolIcon alloc] initWithDictionary:v33];
        if (v40) {
          objc_storeStrong((id *)&v6->_icon, v40);
        }
      }
    }
    else
    {
      _CELogSystem();
      v40 = (CEImageIcon *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v40->super.super, OS_LOG_TYPE_ERROR)) {
        -[CERecommendation initWithDictionary:]();
      }
    }

LABEL_47:
  }

  return v6;
}

- (void)parseActions:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __33__CERecommendation_parseActions___block_invoke;
  v10[3] = &unk_2652845A8;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  v8 = (NSArray *)[v7 copy];
  actions = self->_actions;
  self->_actions = v8;
}

void __33__CERecommendation_parseActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 objectForKeyedSubscript:@"actionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [v5 isEqualToString:@"Deeplink"];
      char v7 = [v5 isEqualToString:@"LiftUIUrl"];
      char v8 = [v5 isEqualToString:@"RemoteUIUrl"];
      int v9 = [v5 isEqualToString:@"WebUrl"];
      int v10 = [v5 isEqualToString:@"EnableDataclass"];
      int v11 = [v5 isEqualToString:@"AppInstall"];
      if ((v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || v9)
      {
        v12 = CEURLRecommendationAction;
      }
      else if (v10)
      {
        v12 = CEDataclassRecommendationAction;
      }
      else
      {
        if (!v11)
        {
          v14 = _CELogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            __33__CERecommendation_parseActions___block_invoke_cold_1(v14);
          }

          goto LABEL_17;
        }
        v12 = CEAppInstallRecommendationAction;
      }
      v13 = (void *)[[v12 alloc] initWithDictionary:v4];
      if (v13) {
        [*(id *)(a1 + 32) addObject:v13];
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __33__CERecommendation_parseActions___block_invoke_cold_2();
  }
LABEL_18:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subTitle forKey:@"subtitle"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_storageRecoverable forKey:@"storageRecoverable"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeBool:self->_completed forKey:@"completed"];
  [v5 encodeObject:self->_status forKey:@"status"];
}

- (CERecommendation)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CERecommendation;
  id v5 = [(CERecommendation *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageRecoverable"];
    storageRecoverable = v5->_storageRecoverable;
    v5->_storageRecoverable = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    id v22 = [v20 setWithArray:v21];

    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (CEIcon *)v25;

    v5->_completed = [v4 decodeBoolForKey:@"completed"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v27;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CERecommendation allocWithZone:a3] initWithIdentifier:self->_identifier title:self->_title message:self->_message bundleID:self->_bundleID storageRecoverable:self->_storageRecoverable category:self->_category actions:self->_actions];
  [(CERecommendation *)v4 setSubTitle:self->_subTitle];
  [(CERecommendation *)v4 setIcon:self->_icon];
  [(CERecommendation *)v4 setCompleted:self->_completed];
  [(CERecommendation *)v4 setStatus:self->_status];
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Recommendation with id: %@, title: %@, subtitle: %@, message: %@, bundleID: %@, storageRecoverable: %@, category: %@, actions: %@, icon: %@ completed: %d status: %@", self->_identifier, self->_title, self->_subTitle, self->_message, self->_bundleID, self->_storageRecoverable, self->_category, self->_actions, self->_icon, self->_completed, self->_status];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)storageRecoverable
{
  return self->_storageRecoverable;
}

- (void)setStorageRecoverable:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (CEIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_storageRecoverable, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_2(&dword_24A2CB000, v2, v3, "%@ Unable to parse icon for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Status string not present for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.3()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse actions for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.4()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse category for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.5()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse storageRecoverable for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.6()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse bundleID for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.7()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse message for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.8()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse subtitle for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.9()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse title for recommendation.", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.10()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse identifier for recommendation.", v4, v5, v6, v7, v8);
}

void __33__CERecommendation_parseActions___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_24A2CB000, log, OS_LOG_TYPE_DEBUG, "Action type provided is invalid or unsupported.", v1, 2u);
}

void __33__CERecommendation_parseActions___block_invoke_cold_2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_2(&dword_24A2CB000, v2, v3, "Expected action object to be a dictionary, instead found a %@", v4, v5, v6, v7, v8);
}

@end