@interface DSConflictStrategy
- (DSConflictStrategy)init;
- (NSMutableDictionary)localizedTitlesByResolution;
- (NSString)localizedAlertMessageFormat;
- (NSString)localizedAlertTitle;
- (id)conflictHandler;
- (id)localizedAlertMessageForSourceFileURL:(id)a3;
- (id)localizedTitleForResolution:(unint64_t)a3;
- (unint64_t)type;
- (void)setConflictHandler:(id)a3;
- (void)setLocalizedAlertMessageFormat:(id)a3;
- (void)setLocalizedAlertTitle:(id)a3;
- (void)setLocalizedTitle:(id)a3 forResolution:(unint64_t)a4;
- (void)setLocalizedTitlesByResolution:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)validate;
@end

@implementation DSConflictStrategy

- (DSConflictStrategy)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSConflictStrategy;
  v2 = [(DSConflictStrategy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    localizedTitlesByResolution = v2->_localizedTitlesByResolution;
    v2->_localizedTitlesByResolution = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setLocalizedTitle:(id)a3 forResolution:(unint64_t)a4
{
  id v8 = a3;
  localizedTitlesByResolution = self->_localizedTitlesByResolution;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)localizedTitlesByResolution setObject:v8 forKeyedSubscript:v7];
}

- (id)localizedTitleForResolution:(unint64_t)a3
{
  localizedTitlesByResolution = self->_localizedTitlesByResolution;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)localizedTitlesByResolution objectForKeyedSubscript:v4];

  return v5;
}

- (id)localizedAlertMessageForSourceFileURL:(id)a3
{
  id v4 = a3;
  v5 = [(DSConflictStrategy *)self localizedAlertMessageFormat];
  if ([v5 length])
  {
    objc_super v6 = [v4 lastPathComponent];
    objc_msgSend(NSString, "stringWithFormat:", v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1F2ABD380;
  }

  return v7;
}

- (void)validate
{
  if ([(DSConflictStrategy *)self type] != 2)
  {
    [(DSConflictStrategy *)self type];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)conflictHandler
{
  return self->_conflictHandler;
}

- (void)setConflictHandler:(id)a3
{
}

- (NSString)localizedAlertTitle
{
  return self->_localizedAlertTitle;
}

- (void)setLocalizedAlertTitle:(id)a3
{
}

- (NSString)localizedAlertMessageFormat
{
  return self->_localizedAlertMessageFormat;
}

- (void)setLocalizedAlertMessageFormat:(id)a3
{
}

- (NSMutableDictionary)localizedTitlesByResolution
{
  return self->_localizedTitlesByResolution;
}

- (void)setLocalizedTitlesByResolution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitlesByResolution, 0);
  objc_storeStrong((id *)&self->_localizedAlertMessageFormat, 0);
  objc_storeStrong((id *)&self->_localizedAlertTitle, 0);
  objc_storeStrong(&self->_conflictHandler, 0);
}

@end