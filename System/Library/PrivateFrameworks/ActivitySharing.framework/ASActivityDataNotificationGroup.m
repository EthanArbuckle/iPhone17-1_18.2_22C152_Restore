@interface ASActivityDataNotificationGroup
- (NSSet)achievementNotifications;
- (NSSet)allNotifications;
- (NSSet)goalCompletionNotifications;
- (NSSet)workoutNotifications;
- (unint64_t)notificationCount;
- (void)setAchievementNotifications:(id)a3;
- (void)setGoalCompletionNotifications:(id)a3;
- (void)setWorkoutNotifications:(id)a3;
@end

@implementation ASActivityDataNotificationGroup

- (unint64_t)notificationCount
{
  NSUInteger v3 = [(NSSet *)self->_goalCompletionNotifications count];
  NSUInteger v4 = [(NSSet *)self->_workoutNotifications count] + v3;
  return v4 + [(NSSet *)self->_achievementNotifications count];
}

- (NSSet)allNotifications
{
  NSUInteger v3 = [MEMORY[0x263EFFA08] set];
  NSUInteger v4 = v3;
  if (self->_goalCompletionNotifications)
  {
    uint64_t v5 = objc_msgSend(v3, "setByAddingObjectsFromSet:");

    NSUInteger v4 = (void *)v5;
  }
  if (self->_workoutNotifications)
  {
    uint64_t v6 = objc_msgSend(v4, "setByAddingObjectsFromSet:");

    NSUInteger v4 = (void *)v6;
  }
  if (self->_achievementNotifications)
  {
    uint64_t v7 = objc_msgSend(v4, "setByAddingObjectsFromSet:");

    NSUInteger v4 = (void *)v7;
  }

  return (NSSet *)v4;
}

- (NSSet)goalCompletionNotifications
{
  return self->_goalCompletionNotifications;
}

- (void)setGoalCompletionNotifications:(id)a3
{
}

- (NSSet)achievementNotifications
{
  return self->_achievementNotifications;
}

- (void)setAchievementNotifications:(id)a3
{
}

- (NSSet)workoutNotifications
{
  return self->_workoutNotifications;
}

- (void)setWorkoutNotifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutNotifications, 0);
  objc_storeStrong((id *)&self->_achievementNotifications, 0);

  objc_storeStrong((id *)&self->_goalCompletionNotifications, 0);
}

@end