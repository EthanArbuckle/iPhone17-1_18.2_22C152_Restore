@interface _CDUserContextQueries
+ (id)keyPathForUserIsArrivingAtHomeStatus;
+ (id)keyPathForUserIsAsleepStatus;
+ (id)keyPathForUserIsAtHomeStatus;
+ (id)keyPathForUserIsAtWorkStatus;
+ (id)keyPathForUserIsDrivingStatus;
+ (id)keyPathForUserIsLeavingHomeStatus;
+ (id)keyPathForUserIsTravelingStatus;
+ (id)predicateForUserIsAtHomeStatus:(BOOL)a3;
+ (id)userNextPreferredDevice;
@end

@implementation _CDUserContextQueries

+ (id)userNextPreferredDevice
{
  return +[_CDDevice localDevice];
}

+ (id)keyPathForUserIsAsleepStatus
{
  if (keyPathForUserIsAsleepStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsAsleepStatus_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)keyPathForUserIsAsleepStatus_userIsAsleepStatus;
  return v2;
}

+ (id)keyPathForUserIsAtHomeStatus
{
  if (keyPathForUserIsAtHomeStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsAtHomeStatus_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)keyPathForUserIsAtHomeStatus_userIsAtHomeStatus;
  return v2;
}

+ (id)predicateForUserIsAtHomeStatus:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[_CDUserContextQueries keyPathForUserIsAtHomeStatus];
  v5 = [NSNumber numberWithBool:v3];
  v6 = +[_CDContextualPredicate predicateForKeyPath:v4 equalToValue:v5];

  return v6;
}

+ (id)keyPathForUserIsAtWorkStatus
{
  if (keyPathForUserIsAtWorkStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsAtWorkStatus_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)keyPathForUserIsAtWorkStatus_userIsAtHomeStatus;
  return v2;
}

+ (id)keyPathForUserIsDrivingStatus
{
  if (keyPathForUserIsDrivingStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsDrivingStatus_onceToken, &__block_literal_global_29_0);
  }
  v2 = (void *)keyPathForUserIsDrivingStatus_userIsAtHomeStatus;
  return v2;
}

+ (id)keyPathForUserIsTravelingStatus
{
  if (keyPathForUserIsTravelingStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsTravelingStatus_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)keyPathForUserIsTravelingStatus_userIsAtHomeStatus;
  return v2;
}

+ (id)keyPathForUserIsLeavingHomeStatus
{
  if (keyPathForUserIsLeavingHomeStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsLeavingHomeStatus_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)keyPathForUserIsLeavingHomeStatus_userIsAtHomeStatus;
  return v2;
}

+ (id)keyPathForUserIsArrivingAtHomeStatus
{
  if (keyPathForUserIsArrivingAtHomeStatus_onceToken != -1) {
    dispatch_once(&keyPathForUserIsArrivingAtHomeStatus_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)keyPathForUserIsArrivingAtHomeStatus_userIsAtHomeStatus;
  return v2;
}

@end