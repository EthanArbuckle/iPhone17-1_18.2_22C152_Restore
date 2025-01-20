@interface _HKFitnessFriendAchievement
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (id)achievementWithTemplateUniqueName:(id)a3 completedDate:(id)a4 value:(id)a5 friendUUID:(id)a6;
- (NSDate)completedDate;
- (NSNumber)value;
- (NSString)templateUniqueName;
- (NSUUID)friendUUID;
- (_HKFitnessFriendAchievement)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedDate:(id)a3;
- (void)setFriendUUID:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _HKFitnessFriendAchievement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKFitnessFriendAchievement;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_friendUUID, @"FriendUUID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_templateUniqueName forKey:@"TemplateUniqueName"];
  [v4 encodeObject:self->_completedDate forKey:@"CompletedDate"];
  [v4 encodeObject:self->_value forKey:@"Value"];
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (NSDate)completedDate
{
  return self->_completedDate;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_completedDate, 0);
  objc_storeStrong((id *)&self->_templateUniqueName, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (void)setFriendUUID:(id)a3
{
}

- (void)setCompletedDate:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FitnessFriendAchievement(%@ friend: %@, completion date: %@, value: %@)", self->_templateUniqueName, self->_friendUUID, self->_completedDate, self->_value];
}

+ (id)achievementWithTemplateUniqueName:(id)a3 completedDate:(id)a4 value:(id)a5 friendUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"_HKFitnessFriendAchievement.m", 28, @"Invalid parameter not satisfying: %@", @"templateUniqueName != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"_HKFitnessFriendAchievement.m", 29, @"Invalid parameter not satisfying: %@", @"completedDate != nil" object file lineNumber description];

LABEL_3:
  v15 = +[HKObjectType fitnessFriendAchievementType];
  [v12 timeIntervalSinceReferenceDate];
  double v17 = v16;
  [v12 timeIntervalSinceReferenceDate];
  double v19 = v18;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __96___HKFitnessFriendAchievement_achievementWithTemplateUniqueName_completedDate_value_friendUUID___block_invoke;
  v29[3] = &unk_1E58C62A8;
  id v30 = v14;
  id v31 = v11;
  id v32 = v12;
  id v33 = v13;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendAchievement;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  id v23 = v14;
  id v24 = objc_msgSendSuper2(&v28, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v15, 0, 0, v29, v17, v19);

  return v24;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (_HKFitnessFriendAchievement)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_HKFitnessFriendAchievement;
  objc_super v5 = [(HKSample *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FriendUUID"];
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TemplateUniqueName"];
    templateUniqueName = v5->_templateUniqueName;
    v5->_templateUniqueName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CompletedDate"];
    completedDate = v5->_completedDate;
    v5->_completedDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v12;
  }
  return v5;
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
}

@end