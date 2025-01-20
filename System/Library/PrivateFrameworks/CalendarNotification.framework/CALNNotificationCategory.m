@interface CALNNotificationCategory
+ (id)categoryWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6;
+ (id)categoryWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6 categorySummaryFormat:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategory:(id)a3;
- (CALNNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6 categorySummaryFormat:(id)a7;
- (NSArray)actions;
- (NSString)categorySummaryFormat;
- (NSString)hiddenPreviewsBodyPlaceholder;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)options;
@end

@implementation CALNNotificationCategory

+ (id)categoryWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v12 actions:v11 hiddenPreviewsBodyPlaceholder:v10 options:a6 categorySummaryFormat:0];

  return v13;
}

+ (id)categoryWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6 categorySummaryFormat:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v15 actions:v14 hiddenPreviewsBodyPlaceholder:v13 options:a6 categorySummaryFormat:v12];

  return v16;
}

- (CALNNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6 categorySummaryFormat:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CALNNotificationCategory;
  v16 = [(CALNNotificationCategory *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    actions = v16->_actions;
    v16->_actions = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    hiddenPreviewsBodyPlaceholder = v16->_hiddenPreviewsBodyPlaceholder;
    v16->_hiddenPreviewsBodyPlaceholder = (NSString *)v21;

    v16->_options = a6;
    uint64_t v23 = [v15 copy];
    categorySummaryFormat = v16->_categorySummaryFormat;
    v16->_categorySummaryFormat = (NSString *)v23;
  }
  return v16;
}

- (unint64_t)hash
{
  v3 = [(CALNNotificationCategory *)self actions];
  uint64_t v4 = [v3 hash];

  v5 = [(CALNNotificationCategory *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;

  unint64_t v7 = [(CALNNotificationCategory *)self options];
  v8 = [(CALNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];

  id v10 = [(CALNNotificationCategory *)self categorySummaryFormat];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationCategory *)self isEqualToCategory:v4];

  return v5;
}

- (BOOL)isEqualToCategory:(id)a3
{
  id v4 = (CALNNotificationCategory *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotificationCategory *)self actions];
    uint64_t v6 = [(CALNNotificationCategory *)v4 actions];
    int v7 = CalEqualObjects();

    if (!v7) {
      goto LABEL_7;
    }
    v8 = [(CALNNotificationCategory *)self identifier];
    uint64_t v9 = [(CALNNotificationCategory *)v4 identifier];
    int v10 = CalEqualStrings();

    if (!v10) {
      goto LABEL_7;
    }
    unint64_t v11 = [(CALNNotificationCategory *)self options];
    if (v11 != [(CALNNotificationCategory *)v4 options]) {
      goto LABEL_7;
    }
    id v12 = [(CALNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
    id v13 = [(CALNNotificationCategory *)v4 hiddenPreviewsBodyPlaceholder];
    int v14 = CalEqualStrings();

    if (v14)
    {
      id v15 = [(CALNNotificationCategory *)self categorySummaryFormat];
      v16 = [(CALNNotificationCategory *)v4 categorySummaryFormat];
      char v17 = CalEqualStrings();
    }
    else
    {
LABEL_7:
      char v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CALNNotificationCategory *)self identifier];
  int v7 = [(CALNNotificationCategory *)self actions];
  v8 = CALNStringFromNotificationCategoryOptions([(CALNNotificationCategory *)self options]);
  uint64_t v9 = [(CALNNotificationCategory *)self hiddenPreviewsBodyPlaceholder];
  int v10 = [(CALNNotificationCategory *)self categorySummaryFormat];
  unint64_t v11 = [v3 stringWithFormat:@"<%@: %p>(identifier = %@, actions = %@, options = %@, hiddenPreviewsBodyPlaceholder = %@, categorySummaryFormat = %@)", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)actions
{
  return self->_actions;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  return self->_hiddenPreviewsBodyPlaceholder;
}

- (NSString)categorySummaryFormat
{
  return self->_categorySummaryFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end