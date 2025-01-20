@interface ATXHomeScreenSessionMetadata
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenSessionMetadata)initWithCoder:(id)a3;
- (ATXHomeScreenSessionMetadata)initWithWidgetUniqueId:(id)a3 widgetBundleId:(id)a4 isWidgetInTodayView:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenSessionMetadata:(id)a3;
- (BOOL)isWidgetInTodayView;
- (NSString)description;
- (NSString)widgetBundleId;
- (NSString)widgetUniqueId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsWidgetInTodayView:(BOOL)a3;
- (void)setWidgetBundleId:(id)a3;
- (void)setWidgetUniqueId:(id)a3;
@end

@implementation ATXHomeScreenSessionMetadata

- (ATXHomeScreenSessionMetadata)initWithWidgetUniqueId:(id)a3 widgetBundleId:(id)a4 isWidgetInTodayView:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXHomeScreenSessionMetadata;
  v11 = [(ATXHomeScreenSessionMetadata *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_widgetUniqueId, a3);
    objc_storeStrong((id *)&v12->_widgetBundleId, a4);
    v12->_isWidgetInTodayView = a5;
  }

  return v12;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  id v4 = [NSString alloc];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  if (self->_isWidgetInTodayView) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  id v9 = (void *)[v4 initWithFormat:@"%@: \nwidgetUniqueId: %@ \nwidgetBundleId: %@ \nisWidgetInTodayView: %@ \n", v6, self->_widgetBundleId, self->_widgetUniqueId, v8];

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  widgetUniqueId = self->_widgetUniqueId;
  id v5 = a3;
  [v5 encodeObject:widgetUniqueId forKey:@"widgetUniqueId"];
  [v5 encodeObject:self->_widgetBundleId forKey:@"widgetBundleId"];
  [v5 encodeBool:self->_isWidgetInTodayView forKey:@"widgetTodayView"];
}

- (ATXHomeScreenSessionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_feedback();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"widgetUniqueId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    v11 = __atxlog_handle_feedback();
    v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"widgetBundleId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v11];

    if (v12)
    {
      self = -[ATXHomeScreenSessionMetadata initWithWidgetUniqueId:widgetBundleId:isWidgetInTodayView:](self, "initWithWidgetUniqueId:widgetBundleId:isWidgetInTodayView:", v8, v12, [v4 decodeBoolForKey:@"widgetTodayView"]);
      v13 = self;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_widgetUniqueId hash];
  NSUInteger v4 = [(NSString *)self->_widgetBundleId hash];
  return self->_isWidgetInTodayView - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXHomeScreenSessionMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenSessionMetadata *)self isEqualToATXHomeScreenSessionMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenSessionMetadata:(id)a3
{
  NSUInteger v4 = (id *)a3;
  widgetUniqueId = self->_widgetUniqueId;
  BOOL v6 = (NSString *)v4[2];
  if (widgetUniqueId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = widgetUniqueId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  widgetBundleId = self->_widgetBundleId;
  v11 = (NSString *)v4[3];
  if (widgetBundleId == v11)
  {

    goto LABEL_9;
  }
  v12 = v11;
  v13 = widgetBundleId;
  char v14 = [(NSString *)v13 isEqual:v12];

  if (v14)
  {
LABEL_9:
    BOOL v15 = self->_isWidgetInTodayView == *((unsigned __int8 *)v4 + 8);
    goto LABEL_10;
  }
LABEL_7:
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (void)setWidgetUniqueId:(id)a3
{
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
}

- (BOOL)isWidgetInTodayView
{
  return self->_isWidgetInTodayView;
}

- (void)setIsWidgetInTodayView:(BOOL)a3
{
  self->_isWidgetInTodayView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetBundleId, 0);

  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
}

@end