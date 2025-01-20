@interface FLFollowUpNotification
+ (BOOL)supportsSecureCoding;
+ (NSSet)defaultOptions;
- (BOOL)_shouldDeliverNotificationWithStringOut:(id *)a3;
- (BOOL)forceDelivery;
- (BOOL)shouldBackgroundDefaultAction;
- (BOOL)shouldDeliverNotification;
- (FLFollowUpAction)activateAction;
- (FLFollowUpAction)clearAction;
- (FLFollowUpAction)dismissAction;
- (FLFollowUpNotification)init;
- (FLFollowUpNotification)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSDate)previousNotificationActionDate;
- (NSSet)options;
- (NSString)informativeText;
- (NSString)subtitleText;
- (NSString)title;
- (NSString)unlockActionLabel;
- (double)_creationDateAugmentedRepeatTimer;
- (double)_frequencyDelta;
- (double)firstNotificationDelay;
- (double)frequency;
- (id)_optionsData;
- (id)description;
- (unint64_t)sqlID;
- (void)_optionsData;
- (void)encodeWithCoder:(id)a3;
- (void)recalculateActionDateToAccountForDelay;
- (void)setActivateAction:(id)a3;
- (void)setClearAction:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setFirstNotificationDelay:(double)a3;
- (void)setForceDelivery:(BOOL)a3;
- (void)setFrequency:(double)a3;
- (void)setInformativeText:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPreviousNotificationActionDate:(id)a3;
- (void)setSqlID:(unint64_t)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnlockActionLabel:(id)a3;
- (void)set_optionsData:(id)a3;
@end

@implementation FLFollowUpNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FLFollowUpNotification)init
{
  v8.receiver = self;
  v8.super_class = (Class)FLFollowUpNotification;
  v2 = [(FLFollowUpNotification *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    uint64_t v5 = +[FLFollowUpNotification defaultOptions];
    options = v2->_options;
    v2->_options = (NSSet *)v5;
  }
  return v2;
}

+ (NSSet)defaultOptions
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"bannerAlert", @"lockScreen", @"notificationCenter", 0);
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_informativeText forKey:@"_informativeText"];
  [v5 encodeObject:self->_subtitleText forKey:@"_subtitleText"];
  [v5 encodeObject:self->_unlockActionLabel forKey:@"_unlockActionLabel"];
  [v5 encodeObject:self->_previousNotificationActionDate forKey:@"_previousNotificationActionDate"];
  [v5 encodeObject:self->_creationDate forKey:@"_creationDate"];
  [v5 encodeObject:self->_activateAction forKey:@"_activateAction"];
  [v5 encodeObject:self->_dismissAction forKey:@"_dismissAction"];
  [v5 encodeObject:self->_clearAction forKey:@"_clearAction"];
  [v5 encodeDouble:@"_frequency" forKey:self->_frequency];
  [v5 encodeInteger:self->_sqlID forKey:@"_sqlID"];
  [v5 encodeDouble:@"_firstNotificationDelay" forKey:self->_firstNotificationDelay];
  [v5 encodeObject:self->_options forKey:@"_options"];
}

- (FLFollowUpNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FLFollowUpNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subtitleText"];
    subtitleText = v5->_subtitleText;
    v5->_subtitleText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_unlockActionLabel"];
    unlockActionLabel = v5->_unlockActionLabel;
    v5->_unlockActionLabel = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_previousNotificationActionDate"];
    previousNotificationActionDate = v5->_previousNotificationActionDate;
    v5->_previousNotificationActionDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activateAction"];
    activateAction = v5->_activateAction;
    v5->_activateAction = (FLFollowUpAction *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dismissAction"];
    dismissAction = v5->_dismissAction;
    v5->_dismissAction = (FLFollowUpAction *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clearAction"];
    clearAction = v5->_clearAction;
    v5->_clearAction = (FLFollowUpAction *)v22;

    [v4 decodeDoubleForKey:@"_frequency"];
    v5->_frequency = v24;
    v5->_sqlID = [v4 decodeIntegerForKey:@"_sqlID"];
    [v4 decodeDoubleForKey:@"_firstNotificationDelay"];
    v5->_firstNotificationDelay = v25;
    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_options"];
    options = v5->_options;
    v5->_options = (NSSet *)v29;
  }
  return v5;
}

- (BOOL)shouldDeliverNotification
{
  return [(FLFollowUpNotification *)self _shouldDeliverNotificationWithStringOut:0];
}

- (BOOL)_shouldDeliverNotificationWithStringOut:(id *)a3
{
  [(FLFollowUpNotification *)self _frequencyDelta];
  double v6 = v5;
  [(FLFollowUpNotification *)self _creationDateAugmentedRepeatTimer];
  double v8 = v7;
  if (v7 <= 0.0) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6 >= v7 || self->_previousNotificationActionDate == 0;
  }
  BOOL v10 = v7 == 0.0 && self->_previousNotificationActionDate == 0;
  if ([(NSSet *)self->_options containsObject:@"force"]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10 | v9;
  }
  if (a3)
  {
    uint64_t v12 = NSString;
    v13 = [NSNumber numberWithBool:v11];
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[NSSet containsObject:](self->_options, "containsObject:", @"force"));
    v15 = [NSNumber numberWithDouble:v6];
    uint64_t v16 = [NSNumber numberWithDouble:v8];
    v17 = [NSNumber numberWithDouble:self->_firstNotificationDelay];
    objc_msgSend(v12, "stringWithFormat:", @"Delivery State: %@ (force = %@, delta = %@, repeat = %@, delay = %@"), v13, v14, v15, v16, v17;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (void)setForceDelivery:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  options = self->_options;
  if (a3)
  {
    double v5 = [(NSSet *)options setByAddingObject:@"force"];
    double v6 = self->_options;
    self->_options = v5;
  }
  else
  {
    double v6 = (NSSet *)[(NSSet *)options mutableCopy];
    [(NSSet *)v6 removeObject:@"force"];
    double v7 = (NSSet *)[(NSSet *)v6 copy];
    double v8 = self->_options;
    self->_options = v7;
  }
  BOOL v9 = _FLLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = self->_options;
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1BE24A000, v9, OS_LOG_TYPE_DEFAULT, "Updated options: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (BOOL)forceDelivery
{
  return [(NSSet *)self->_options containsObject:@"force"];
}

- (id)_optionsData
{
  uint64_t v3 = [(FLFollowUpNotification *)self options];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    double v5 = [(FLFollowUpNotification *)self options];
    double v6 = [v5 allObjects];
    id v10 = 0;
    uint64_t v3 = [v4 dataWithPropertyList:v6 format:200 options:0 error:&v10];
    id v7 = v10;

    if (!v3)
    {
      double v8 = _FLLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FLFollowUpNotification _optionsData]();
      }
    }
  }

  return v3;
}

- (void)set_optionsData:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v9];
    id v5 = v9;
    double v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    [(FLFollowUpNotification *)self setOptions:v6];

    id v7 = [(FLFollowUpNotification *)self options];

    if (!v7)
    {
      double v8 = _FLLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FLFollowUpNotification set_optionsData:]();
      }
    }
  }
}

- (double)_frequencyDelta
{
  if (!self->_previousNotificationActionDate) {
    return 0.0;
  }
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_previousNotificationActionDate];
  double v5 = v4;

  return v5;
}

- (double)_creationDateAugmentedRepeatTimer
{
  [(NSDate *)self->_creationDate timeIntervalSinceNow];
  if (fabs(v3) >= 259200.0) {
    return self->_frequency * 3.0;
  }
  else {
    return self->_frequency;
  }
}

- (void)recalculateActionDateToAccountForDelay
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_previousNotificationActionDate)
  {
    double firstNotificationDelay = self->_firstNotificationDelay;
    if (firstNotificationDelay > 0.0)
    {
      double frequency = self->_frequency;
      if (frequency > 0.0)
      {
        double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:firstNotificationDelay - frequency];
        previousNotificationActionDate = self->_previousNotificationActionDate;
        self->_previousNotificationActionDate = v5;

        id v7 = _FLLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          double v8 = self->_previousNotificationActionDate;
          int v9 = 138412290;
          id v10 = v8;
          _os_log_impl(&dword_1BE24A000, v7, OS_LOG_TYPE_DEFAULT, "Adjusted the target notification eligibility date to %@", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
}

- (BOOL)shouldBackgroundDefaultAction
{
  return [(NSSet *)self->_options containsObject:@"extensionForNotification"];
}

- (id)description
{
  id v8 = 0;
  [(FLFollowUpNotification *)self _shouldDeliverNotificationWithStringOut:&v8];
  id v3 = v8;
  double v4 = NSString;
  double v5 = [(id)objc_opt_class() description];
  double v6 = [v4 stringWithFormat:@"<%@: %p - title: %@ subtitle: %@ activate: %@ clear: %@ dismiss: %@ previous: %@ created: %@ %@ options: %@>", v5, self, self->_title, self->_subtitleText, self->_activateAction, self->_clearAction, self->_dismissAction, self->_previousNotificationActionDate, self->_creationDate, v3, self->_options];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (FLFollowUpAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
}

- (FLFollowUpAction)clearAction
{
  return self->_clearAction;
}

- (void)setClearAction:(id)a3
{
}

- (NSString)unlockActionLabel
{
  return self->_unlockActionLabel;
}

- (void)setUnlockActionLabel:(id)a3
{
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_double frequency = a3;
}

- (double)firstNotificationDelay
{
  return self->_firstNotificationDelay;
}

- (void)setFirstNotificationDelay:(double)a3
{
  self->_double firstNotificationDelay = a3;
}

- (NSSet)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (NSDate)previousNotificationActionDate
{
  return self->_previousNotificationActionDate;
}

- (void)setPreviousNotificationActionDate:(id)a3
{
}

- (FLFollowUpAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_previousNotificationActionDate, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_unlockActionLabel, 0);
  objc_storeStrong((id *)&self->_clearAction, 0);
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_optionsData
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE24A000, v0, v1, "%@: Failed to serialize options for notification %@ with error %@");
}

- (void)set_optionsData:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE24A000, v0, v1, "%@: Failed to deserialize options for notification %@ with error %@");
}

@end