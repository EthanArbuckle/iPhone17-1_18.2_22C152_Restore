@interface ATXLockscreenEditMetric
- (BOOL)didLockscreenHaveWidgetsBeforeEdit;
- (BOOL)isNew;
- (BOOL)userChangedColor;
- (BOOL)userChangedFont;
- (BOOL)userChangedNumberingSystem;
- (BOOL)userChangedPosterContent;
- (BOOL)userChangedWidgets;
- (NSString)entryPoint;
- (NSString)lockscreenId;
- (NSString)outcome;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (int64_t)duration;
- (unint64_t)secondsSinceLastEdit;
- (void)setDidLockscreenHaveWidgetsBeforeEdit:(BOOL)a3;
- (void)setDuration:(int64_t)a3;
- (void)setEntryPoint:(id)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setLockscreenId:(id)a3;
- (void)setOutcome:(id)a3;
- (void)setSecondsSinceLastEdit:(unint64_t)a3;
- (void)setUserChangedColor:(BOOL)a3;
- (void)setUserChangedFont:(BOOL)a3;
- (void)setUserChangedNumberingSystem:(BOOL)a3;
- (void)setUserChangedPosterContent:(BOOL)a3;
- (void)setUserChangedWidgets:(BOOL)a3;
@end

@implementation ATXLockscreenEditMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.Edit";
}

- (id)coreAnalyticsDictionary
{
  v25[12] = *MEMORY[0x1E4F143B8];
  v24[0] = @"lockscreenId";
  uint64_t v3 = [(ATXLockscreenEditMetric *)self lockscreenId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = v4;
  v20 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"entryPoint";
  uint64_t v5 = [(ATXLockscreenEditMetric *)self entryPoint];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v5;
  v25[1] = v5;
  v24[2] = @"isNew";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric isNew](self, "isNew"));
  v25[2] = v22;
  v24[3] = @"secondsSinceLastEdit";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenEditMetric secondsSinceLastEdit](self, "secondsSinceLastEdit"));
  v25[3] = v21;
  v24[4] = @"outcome";
  uint64_t v7 = [(ATXLockscreenEditMetric *)self outcome];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v7;
  v24[5] = @"timeSpentEditing";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXLockscreenEditMetric duration](self, "duration", v7));
  v25[5] = v9;
  v24[6] = @"userChangedColor";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric userChangedColor](self, "userChangedColor"));
  v25[6] = v10;
  v24[7] = @"userChangedFont";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric userChangedFont](self, "userChangedFont"));
  v25[7] = v11;
  v24[8] = @"userChangedNumberingSystem";
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric userChangedNumberingSystem](self, "userChangedNumberingSystem"));
  v25[8] = v12;
  v24[9] = @"userChangedWidgets";
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric userChangedWidgets](self, "userChangedWidgets"));
  v25[9] = v13;
  v24[10] = @"userChangedPosterContent";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric userChangedPosterContent](self, "userChangedPosterContent"));
  v25[10] = v14;
  v24[11] = @"didLockscreenHaveWidgetsBeforeEdit";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenEditMetric didLockscreenHaveWidgetsBeforeEdit](self, "didLockscreenHaveWidgetsBeforeEdit"));
  v25[11] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:12];

  if (!v8) {
  if (!v6)
  }

  if (!v23) {
  return v16;
  }
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (unint64_t)secondsSinceLastEdit
{
  return self->_secondsSinceLastEdit;
}

- (void)setSecondsSinceLastEdit:(unint64_t)a3
{
  self->_secondsSinceLastEdit = a3;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (BOOL)userChangedColor
{
  return self->_userChangedColor;
}

- (void)setUserChangedColor:(BOOL)a3
{
  self->_userChangedColor = a3;
}

- (BOOL)userChangedFont
{
  return self->_userChangedFont;
}

- (void)setUserChangedFont:(BOOL)a3
{
  self->_userChangedFont = a3;
}

- (BOOL)userChangedNumberingSystem
{
  return self->_userChangedNumberingSystem;
}

- (void)setUserChangedNumberingSystem:(BOOL)a3
{
  self->_userChangedNumberingSystem = a3;
}

- (BOOL)userChangedPosterContent
{
  return self->_userChangedPosterContent;
}

- (void)setUserChangedPosterContent:(BOOL)a3
{
  self->_userChangedPosterContent = a3;
}

- (BOOL)userChangedWidgets
{
  return self->_userChangedWidgets;
}

- (void)setUserChangedWidgets:(BOOL)a3
{
  self->_userChangedWidgets = a3;
}

- (BOOL)didLockscreenHaveWidgetsBeforeEdit
{
  return self->_didLockscreenHaveWidgetsBeforeEdit;
}

- (void)setDidLockscreenHaveWidgetsBeforeEdit:(BOOL)a3
{
  self->_didLockscreenHaveWidgetsBeforeEdit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end