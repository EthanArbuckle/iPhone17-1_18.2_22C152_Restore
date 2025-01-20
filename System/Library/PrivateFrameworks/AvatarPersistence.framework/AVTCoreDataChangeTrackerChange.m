@interface AVTCoreDataChangeTrackerChange
+ (int64_t)trackerChangeTypeFromPersistentChangeType:(int64_t)a3;
- (AVTCoreDataChangeTrackerChange)initWithRecordIdentifier:(id)a3 changeType:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)recordIdentifier;
- (id)description;
- (int64_t)changeType;
@end

@implementation AVTCoreDataChangeTrackerChange

+ (int64_t)trackerChangeTypeFromPersistentChangeType:(int64_t)a3
{
  return (unint64_t)a3 > 1;
}

- (AVTCoreDataChangeTrackerChange)initWithRecordIdentifier:(id)a3 changeType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTCoreDataChangeTrackerChange;
  v8 = [(AVTCoreDataChangeTrackerChange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordIdentifier, a3);
    v9->_changeType = a4;
  }

  return v9;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)AVTCoreDataChangeTrackerChange;
  v3 = [(AVTCoreDataChangeTrackerChange *)&v9 description];
  v4 = (void *)[v3 mutableCopy];

  int64_t v5 = [(AVTCoreDataChangeTrackerChange *)self changeType];
  v6 = [(AVTCoreDataChangeTrackerChange *)self recordIdentifier];
  [v4 appendFormat:@" type:%ld identifier:%@", v5, v6];

  id v7 = (void *)[v4 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return AVTAvatarRecordChangeEqualToChange(self, a3);
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
}

@end