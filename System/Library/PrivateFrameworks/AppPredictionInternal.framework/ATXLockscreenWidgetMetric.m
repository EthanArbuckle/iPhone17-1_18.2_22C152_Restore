@interface ATXLockscreenWidgetMetric
- (BOOL)isLandscape;
- (NSString)extensionBundleId;
- (NSString)kind;
- (NSString)lockscreenId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)family;
- (unint64_t)source;
- (void)setExtensionBundleId:(id)a3;
- (void)setFamily:(unint64_t)a3;
- (void)setIsLandscape:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setLockscreenId:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation ATXLockscreenWidgetMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.Widget";
}

- (id)coreAnalyticsDictionary
{
  v15[6] = *MEMORY[0x1E4F143B8];
  v14[0] = @"lockscreenId";
  v3 = [(ATXLockscreenWidgetMetric *)self lockscreenId];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v4;
  v14[1] = @"extensionBundleId";
  v5 = [(ATXLockscreenWidgetMetric *)self extensionBundleId];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v6;
  v14[2] = @"kind";
  v7 = [(ATXLockscreenWidgetMetric *)self kind];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v8;
  v14[3] = @"source";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenWidgetMetric source](self, "source"));
  v15[3] = v9;
  v14[4] = @"family";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenWidgetMetric family](self, "family"));
  v15[4] = v10;
  v14[5] = @"isLandscape";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenWidgetMetric isLandscape](self, "isLandscape"));
  v15[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];

  if (!v7) {
  if (!v5)
  }

  if (!v3) {
  return v12;
  }
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (unint64_t)family
{
  return self->_family;
}

- (void)setFamily:(unint64_t)a3
{
  self->_family = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)isLandscape
{
  return self->_isLandscape;
}

- (void)setIsLandscape:(BOOL)a3
{
  self->_isLandscape = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end