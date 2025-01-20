@interface UNNotificationCategory
+ (BOOL)supportsSecureCoding;
+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers hiddenPreviewsBodyPlaceholder:(NSString *)hiddenPreviewsBodyPlaceholder categorySummaryFormat:(NSString *)categorySummaryFormat options:(UNNotificationCategoryOptions)options;
+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers hiddenPreviewsBodyPlaceholder:(NSString *)hiddenPreviewsBodyPlaceholder options:(UNNotificationCategoryOptions)options;
+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers options:(UNNotificationCategoryOptions)options;
+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 hiddenPreviewsBodyPlaceholder:(id)a7 categorySummaryFormat:(id)a8 options:(unint64_t)a9;
+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 hiddenPreviewsBodyPlaceholder:(id)a7 options:(unint64_t)a8;
+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 options:(unint64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)actions;
- (NSArray)intentIdentifiers;
- (NSArray)minimalActions;
- (NSString)actionsMenuTitle;
- (NSString)categorySummaryFormat;
- (NSString)hiddenPreviewsBodyPlaceholder;
- (NSString)identifier;
- (UNNotificationAction)alternateAction;
- (UNNotificationCategory)initWithCoder:(id)a3;
- (UNNotificationCategoryOptions)options;
- (id)_initWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 alternateAction:(id)a6 intentIdentifiers:(id)a7 hiddenPreviewsBodyPlaceholder:(id)a8 categorySummaryFormat:(id)a9 actionsMenuTitle:(id)a10 options:(unint64_t)a11 backgroundStyle:(unint64_t)a12 listPriority:(unint64_t)a13;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)backgroundStyle;
- (unint64_t)hash;
- (unint64_t)listPriority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationCategory

- (id)_initWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 alternateAction:(id)a6 intentIdentifiers:(id)a7 hiddenPreviewsBodyPlaceholder:(id)a8 categorySummaryFormat:(id)a9 actionsMenuTitle:(id)a10 options:(unint64_t)a11 backgroundStyle:(unint64_t)a12 listPriority:(unint64_t)a13
{
  id v42 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  v43.receiver = self;
  v43.super_class = (Class)UNNotificationCategory;
  v26 = [(UNNotificationCategory *)&v43 init];
  if (v26)
  {
    uint64_t v27 = [v19 copy];
    actions = v26->_actions;
    v26->_actions = (NSArray *)v27;

    uint64_t v29 = [v20 copy];
    minimalActions = v26->_minimalActions;
    v26->_minimalActions = (NSArray *)v29;

    uint64_t v31 = [v21 copy];
    alternateAction = v26->_alternateAction;
    v26->_alternateAction = (UNNotificationAction *)v31;

    uint64_t v33 = [v22 copy];
    intentIdentifiers = v26->_intentIdentifiers;
    v26->_intentIdentifiers = (NSArray *)v33;

    uint64_t v35 = [v42 copy];
    identifier = v26->_identifier;
    v26->_identifier = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    hiddenPreviewsBodyPlaceholder = v26->_hiddenPreviewsBodyPlaceholder;
    v26->_hiddenPreviewsBodyPlaceholder = (NSString *)v37;

    v26->_options = a11;
    uint64_t v39 = [v24 copy];
    categorySummaryFormat = v26->_categorySummaryFormat;
    v26->_categorySummaryFormat = (NSString *)v39;

    objc_storeStrong((id *)&v26->_actionsMenuTitle, a10);
    v26->_backgroundStyle = a12;
    v26->_listPriority = a13;
  }

  return v26;
}

- (UNNotificationCategory)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v6 = [v3 setWithArray:v5];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"actions"];
  uint64_t v39 = (void *)[v7 copy];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"minimalActions"];
  v38 = (void *)[v11 copy];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateAction"];
  uint64_t v37 = (void *)[v12 copy];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v15 = [v13 setWithArray:v14];
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"intentIdentifiers"];
  v17 = (void *)[v16 copy];

  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v19 = (void *)[v18 copy];

  uint64_t v20 = [v4 decodeIntegerForKey:@"options"];
  id v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  id v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  id v24 = [v4 decodeObjectOfClasses:v23 forKey:@"hiddenPreviewsBodyPlaceholder"];

  id v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v28 = [v4 decodeObjectOfClasses:v27 forKey:@"categorySummaryFormat"];

  uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v32 = [v4 decodeObjectOfClasses:v31 forKey:@"actionsMenuTitle"];

  uint64_t v33 = [v4 decodeIntegerForKey:@"backgroundStyle"];
  uint64_t v34 = [v4 decodeIntegerForKey:@"listPriority"];

  uint64_t v35 = [(UNNotificationCategory *)self _initWithIdentifier:v19 actions:v39 minimalActions:v38 alternateAction:v37 intentIdentifiers:v17 hiddenPreviewsBodyPlaceholder:v24 categorySummaryFormat:v28 actionsMenuTitle:v32 options:v20 backgroundStyle:v33 listPriority:v34];
  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = [(UNNotificationCategory *)self actions];
  [v15 encodeObject:v4 forKey:@"actions"];

  v5 = [(UNNotificationCategory *)self identifier];
  [v15 encodeObject:v5 forKey:@"identifier"];

  v6 = [(UNNotificationCategory *)self intentIdentifiers];
  [v15 encodeObject:v6 forKey:@"intentIdentifiers"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[UNNotificationCategory options](self, "options"), @"options");
  v7 = [(UNNotificationCategory *)self minimalActions];
  [v15 encodeObject:v7 forKey:@"minimalActions"];

  v8 = [(UNNotificationCategory *)self alternateAction];
  [v15 encodeObject:v8 forKey:@"alternateAction"];

  v9 = [(UNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  v10 = objc_msgSend(v9, "un_stringWithMaxLength:", 1000);
  [v15 encodeObject:v10 forKey:@"hiddenPreviewsBodyPlaceholder"];

  v11 = [(UNNotificationCategory *)self categorySummaryFormat];
  v12 = objc_msgSend(v11, "un_stringWithMaxLength:", 1000);
  [v15 encodeObject:v12 forKey:@"categorySummaryFormat"];

  v13 = [(UNNotificationCategory *)self actionsMenuTitle];
  v14 = objc_msgSend(v13, "un_stringWithMaxLength:", 1000);
  [v15 encodeObject:v14 forKey:@"actionsMenuTitle"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[UNNotificationCategory backgroundStyle](self, "backgroundStyle"), @"backgroundStyle");
  objc_msgSend(v15, "encodeInteger:forKey:", -[UNNotificationCategory listPriority](self, "listPriority"), @"listPriority");
}

- (unint64_t)hash
{
  uint64_t v22 = [(UNNotificationCategory *)self actions];
  uint64_t v3 = [v22 hash];
  id v4 = [(UNNotificationCategory *)self minimalActions];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(UNNotificationCategory *)self intentIdentifiers];
  uint64_t v7 = [v6 hash];
  v8 = [(UNNotificationCategory *)self alternateAction];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(UNNotificationCategory *)self identifier];
  uint64_t v11 = [v10 hash];
  UNNotificationCategoryOptions v12 = v11 ^ [(UNNotificationCategory *)self options];
  v13 = [(UNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  uint64_t v14 = v9 ^ v12 ^ [v13 hash];
  id v15 = [(UNNotificationCategory *)self categorySummaryFormat];
  uint64_t v16 = [v15 hash];
  v17 = [(UNNotificationCategory *)self actionsMenuTitle];
  uint64_t v18 = v16 ^ [v17 hash];
  unint64_t v19 = v18 ^ [(UNNotificationCategory *)self backgroundStyle];
  unint64_t v20 = v14 ^ v19 ^ [(UNNotificationCategory *)self listPriority];

  return v20;
}

- (UNNotificationCategoryOptions)options
{
  return self->_options;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)minimalActions
{
  return self->_minimalActions;
}

- (unint64_t)listPriority
{
  return self->_listPriority;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  return self->_hiddenPreviewsBodyPlaceholder;
}

- (NSString)categorySummaryFormat
{
  return self->_categorySummaryFormat;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (UNNotificationAction)alternateAction
{
  return self->_alternateAction;
}

- (NSString)actionsMenuTitle
{
  return self->_actionsMenuTitle;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(UNNotificationCategory *)self actions];
    v6 = [v4 actions];
    if (!UNEqualObjects(v5, v6))
    {
      BOOL v20 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v7 = [(UNNotificationCategory *)self minimalActions];
    v8 = [v4 minimalActions];
    if (!UNEqualObjects(v7, v8))
    {
      BOOL v20 = 0;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v9 = [(UNNotificationCategory *)self intentIdentifiers];
    v10 = [v4 intentIdentifiers];
    if (!UNEqualObjects(v9, v10))
    {
      BOOL v20 = 0;
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v11 = [(UNNotificationCategory *)self alternateAction];
    UNNotificationCategoryOptions v12 = [v4 alternateAction];
    if (!UNEqualObjects(v11, v12))
    {
      BOOL v20 = 0;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v29 = v12;
    v13 = [(UNNotificationCategory *)self identifier];
    uint64_t v30 = [v4 identifier];
    uint64_t v31 = v13;
    if (UNEqualStrings(v13, v30))
    {
      v28 = v11;
      UNNotificationCategoryOptions v14 = [(UNNotificationCategory *)self options];
      if (v14 == [v4 options])
      {
        id v15 = [(UNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
        uint64_t v26 = [v4 hiddenPreviewsBodyPlaceholder];
        uint64_t v27 = v15;
        if (UNEqualStrings(v15, v26))
        {
          uint64_t v16 = [(UNNotificationCategory *)self categorySummaryFormat];
          id v24 = [v4 categorySummaryFormat];
          id v25 = v16;
          if (UNEqualStrings(v16, v24))
          {
            v17 = [(UNNotificationCategory *)self actionsMenuTitle];
            uint64_t v22 = [v4 actionsMenuTitle];
            id v23 = v17;
            if (UNEqualStrings(v17, v22)
              && (unint64_t v18 = [(UNNotificationCategory *)self backgroundStyle],
                  v18 == [v4 backgroundStyle]))
            {
              unint64_t v19 = [(UNNotificationCategory *)self listPriority];
              BOOL v20 = v19 == [v4 listPriority];
            }
            else
            {
              BOOL v20 = 0;
            }
            uint64_t v11 = v28;
            UNNotificationCategoryOptions v12 = v29;
          }
          else
          {
            BOOL v20 = 0;
            uint64_t v11 = v28;
            UNNotificationCategoryOptions v12 = v29;
          }
        }
        else
        {
          BOOL v20 = 0;
          uint64_t v11 = v28;
          UNNotificationCategoryOptions v12 = v29;
        }

        goto LABEL_27;
      }
      BOOL v20 = 0;
      uint64_t v11 = v28;
    }
    else
    {
      BOOL v20 = 0;
    }
    UNNotificationCategoryOptions v12 = v29;
LABEL_27:

    goto LABEL_28;
  }
  BOOL v20 = 0;
LABEL_32:

  return v20;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateAction, 0);
  objc_storeStrong((id *)&self->_actionsMenuTitle, 0);
  objc_storeStrong((id *)&self->_categorySummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_minimalActions, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers options:(UNNotificationCategoryOptions)options
{
  v10 = intentIdentifiers;
  uint64_t v11 = actions;
  UNNotificationCategoryOptions v12 = identifier;
  id v13 = objc_alloc((Class)a1);
  UNNotificationCategoryOptions v14 = objc_msgSend(v13, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v12, v11, MEMORY[0x1E4F1CBF0], 0, v10, &stru_1F062A810, &stru_1F062A810, options, 0, 0);

  return (UNNotificationCategory *)v14;
}

+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 options:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v15, v14, v13, 0, v12, &stru_1F062A810, &stru_1F062A810, a7, 0, 0);

  return (UNNotificationCategory *)v16;
}

+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers hiddenPreviewsBodyPlaceholder:(NSString *)hiddenPreviewsBodyPlaceholder options:(UNNotificationCategoryOptions)options
{
  id v12 = hiddenPreviewsBodyPlaceholder;
  id v13 = intentIdentifiers;
  id v14 = actions;
  id v15 = identifier;
  id v16 = objc_alloc((Class)a1);
  v17 = (void *)[v16 _initWithIdentifier:v15 actions:v14 minimalActions:MEMORY[0x1E4F1CBF0] alternateAction:0 intentIdentifiers:v13 hiddenPreviewsBodyPlaceholder:v12 categorySummaryFormat:&stru_1F062A810 actionsMenuTitle:&stru_1F062A810 options:options backgroundStyle:0 listPriority:0];

  return (UNNotificationCategory *)v17;
}

+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 hiddenPreviewsBodyPlaceholder:(id)a7 options:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  unint64_t v19 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v18 actions:v17 minimalActions:v16 alternateAction:0 intentIdentifiers:v15 hiddenPreviewsBodyPlaceholder:v14 categorySummaryFormat:&stru_1F062A810 actionsMenuTitle:&stru_1F062A810 options:a8 backgroundStyle:0 listPriority:0];

  return (UNNotificationCategory *)v19;
}

+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers hiddenPreviewsBodyPlaceholder:(NSString *)hiddenPreviewsBodyPlaceholder categorySummaryFormat:(NSString *)categorySummaryFormat options:(UNNotificationCategoryOptions)options
{
  id v14 = categorySummaryFormat;
  id v15 = hiddenPreviewsBodyPlaceholder;
  id v16 = intentIdentifiers;
  id v17 = actions;
  id v18 = identifier;
  id v19 = objc_alloc((Class)a1);
  BOOL v20 = (void *)[v19 _initWithIdentifier:v18 actions:v17 minimalActions:MEMORY[0x1E4F1CBF0] alternateAction:0 intentIdentifiers:v16 hiddenPreviewsBodyPlaceholder:v15 categorySummaryFormat:v14 actionsMenuTitle:&stru_1F062A810 options:options backgroundStyle:0 listPriority:0];

  return (UNNotificationCategory *)v20;
}

+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 hiddenPreviewsBodyPlaceholder:(id)a7 categorySummaryFormat:(id)a8 options:(unint64_t)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v20 actions:v19 minimalActions:v18 alternateAction:0 intentIdentifiers:v17 hiddenPreviewsBodyPlaceholder:v16 categorySummaryFormat:v15 actionsMenuTitle:&stru_1F062A810 options:a9 backgroundStyle:0 listPriority:0];

  return (UNNotificationCategory *)v21;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(UNNotificationCategory *)self identifier];
  v6 = [(UNNotificationCategory *)self actions];
  uint64_t v7 = [(UNNotificationCategory *)self minimalActions];
  v8 = [(UNNotificationCategory *)self intentIdentifiers];
  [(UNNotificationCategory *)self options];
  uint64_t v9 = NSStringFromBOOL();
  [(UNNotificationCategory *)self options];
  v10 = NSStringFromBOOL();
  uint64_t v11 = [(UNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@, actions: %@, minimalAction: %@, intentIdentifiers: %@, custom dismiss: %@, CarPlay: %@, private body: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  id v12 = v11);

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v14 = +[UNMutableNotificationCategory allocWithZone:a3];
  id v13 = [(UNNotificationCategory *)self identifier];
  uint64_t v4 = [(UNNotificationCategory *)self actions];
  uint64_t v5 = [(UNNotificationCategory *)self minimalActions];
  v6 = [(UNNotificationCategory *)self alternateAction];
  uint64_t v7 = [(UNNotificationCategory *)self intentIdentifiers];
  v8 = [(UNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  uint64_t v9 = [(UNNotificationCategory *)self categorySummaryFormat];
  v10 = [(UNNotificationCategory *)self actionsMenuTitle];
  id v11 = [(UNNotificationCategory *)v14 _initWithIdentifier:v13 actions:v4 minimalActions:v5 alternateAction:v6 intentIdentifiers:v7 hiddenPreviewsBodyPlaceholder:v8 categorySummaryFormat:v9 actionsMenuTitle:v10 options:[(UNNotificationCategory *)self options] backgroundStyle:[(UNNotificationCategory *)self backgroundStyle] listPriority:[(UNNotificationCategory *)self listPriority]];

  return v11;
}

@end