@interface ATXHomeScreenWidgetDescriptor
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenWidgetDescriptor)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetDescriptor)avocadoDescriptor;
- (NSString)appBundleId;
- (NSString)description;
- (id)compactDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)extensionBundleIdForMetrics;
- (id)widgetKind;
- (int64_t)rankType;
- (unint64_t)hash;
- (unint64_t)suggestedSize;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setAvocadoDescriptor:(id)a3;
- (void)setRankType:(int64_t)a3;
- (void)setSuggestedSize:(unint64_t)a3;
@end

@implementation ATXHomeScreenWidgetDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSString *)self->_appBundleId copyWithZone:a3];
  [v5 setAppBundleId:v6];

  v7 = (void *)[(CHSWidgetDescriptor *)self->_avocadoDescriptor copyWithZone:a3];
  [v5 setAvocadoDescriptor:v7];

  [v5 setSuggestedSize:self->_suggestedSize];
  [v5 setRankType:self->_rankType];
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_appBundleId forKeyedSubscript:@"appBundleId"];
  v4 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor extensionBundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"extensionBundleId"];

  v5 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor displayName];
  [v3 setObject:v5 forKeyedSubscript:@"widgetDisplayName"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_suggestedSize];
  [v3 setObject:v6 forKeyedSubscript:@"widgetSuggestedSize"];

  v7 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
  [v3 setObject:v7 forKeyedSubscript:@"widgetKind"];

  v8 = [NSNumber numberWithInteger:self->_rankType];
  [v3 setObject:v8 forKeyedSubscript:@"rankType"];

  return v3;
}

- (id)extensionBundleIdForMetrics
{
  v3 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor extensionBundleIdentifier];
  int v4 = [v3 isEqualToString:&stru_1EFD9B408];

  if (!v4) {
    goto LABEL_12;
  }
  v5 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
  char v6 = [v5 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSiri"];

  if (v6)
  {
    v7 = @"suggestions";
    goto LABEL_13;
  }
  v8 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
  if ([v8 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"])
  {

LABEL_7:
    v7 = @"shortcuts";
    goto LABEL_13;
  }
  v9 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
  char v10 = [v9 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"];

  if (v10) {
    goto LABEL_7;
  }
  v11 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
  char v12 = [v11 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"];

  if (v12)
  {
    v7 = @"files";
    goto LABEL_13;
  }
  v13 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
  char v14 = [v13 isEqualToString:@"SBHSpecialAvocadoDescriptorKindAppPredictions"];

  if (v14)
  {
    v7 = @"apppredpanel";
  }
  else
  {
LABEL_12:
    v7 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor extensionBundleIdentifier];
  }
LABEL_13:

  return v7;
}

- (id)widgetKind
{
  return (id)[(CHSWidgetDescriptor *)self->_avocadoDescriptor kind];
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(ATXHomeScreenWidgetDescriptor *)self dictionaryRepresentation];
  int v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (id)compactDescription
{
  v3 = NSString;
  int v4 = [(ATXHomeScreenWidgetDescriptor *)self avocadoDescriptor];
  v5 = [v4 extensionBundleIdentifier];
  char v6 = [(ATXHomeScreenWidgetDescriptor *)self avocadoDescriptor];
  v7 = [v6 kind];
  v8 = [v3 stringWithFormat:@"%@:%@", v5, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenWidgetDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenWidgetDescriptor;
  v5 = [(ATXHomeScreenWidgetDescriptor *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v6;

    v8 = (void *)MEMORY[0x1AD0D3C30]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"avocadoDescriptor"];
    avocadoDescriptor = v5->_avocadoDescriptor;
    v5->_avocadoDescriptor = (CHSWidgetDescriptor *)v12;

    v5->_suggestedSize = [v4 decodeIntegerForKey:@"widgetSuggestedSize"];
    v5->_rankType = [v4 decodeIntegerForKey:@"rankType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appBundleId = self->_appBundleId;
  id v5 = a3;
  [v5 encodeObject:appBundleId forKey:@"appBundleId"];
  [v5 encodeObject:self->_avocadoDescriptor forKey:@"avocadoDescriptor"];
  [v5 encodeInteger:self->_suggestedSize forKey:@"widgetSuggestedSize"];
  [v5 encodeInteger:self->_rankType forKey:@"rankType"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleId hash];
  uint64_t v4 = [(CHSWidgetDescriptor *)self->_avocadoDescriptor hash];
  unint64_t v5 = self->_suggestedSize - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return self->_rankType - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXHomeScreenWidgetDescriptor *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      appBundleId = self->_appBundleId;
      v7 = (NSString *)v5[1];
      if (appBundleId == v7)
      {
      }
      else
      {
        v8 = v7;
        id v9 = appBundleId;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_15;
        }
      }
      avocadoDescriptor = self->_avocadoDescriptor;
      v13 = (CHSWidgetDescriptor *)v5[2];
      if (avocadoDescriptor == v13)
      {
      }
      else
      {
        char v14 = v13;
        objc_super v15 = avocadoDescriptor;
        char v16 = [(CHSWidgetDescriptor *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_15;
        }
      }
      unint64_t suggestedSize = self->_suggestedSize;
      if (suggestedSize == [v5 suggestedSize])
      {
        int64_t rankType = self->_rankType;
        BOOL v11 = rankType == [v5 rankType];
LABEL_16:

        goto LABEL_17;
      }
LABEL_15:
      BOOL v11 = 0;
      goto LABEL_16;
    }
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (CHSWidgetDescriptor)avocadoDescriptor
{
  return self->_avocadoDescriptor;
}

- (void)setAvocadoDescriptor:(id)a3
{
}

- (unint64_t)suggestedSize
{
  return self->_suggestedSize;
}

- (void)setSuggestedSize:(unint64_t)a3
{
  self->_unint64_t suggestedSize = a3;
}

- (int64_t)rankType
{
  return self->_rankType;
}

- (void)setRankType:(int64_t)a3
{
  self->_int64_t rankType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avocadoDescriptor, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end