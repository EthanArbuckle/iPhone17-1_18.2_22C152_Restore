@interface HKInitializeLogging
@end

@implementation HKInitializeLogging

os_log_t ___HKInitializeLogging_block_invoke()
{
  HKLogDefault = (uint64_t)os_log_create("com.apple.HealthKit", "default");
  HKLogActivity = (uint64_t)os_log_create("com.apple.HealthKit", "activity");
  HKLogActivityCache = (uint64_t)os_log_create("com.apple.HealthKit", "activitycache");
  HKLogAuthorization = (uint64_t)os_log_create("com.apple.HealthKit", "auth");
  HKLogBackgroundUpdates = (uint64_t)os_log_create("com.apple.HealthKit", "background");
  HKLogHeartRhythm = (uint64_t)os_log_create("com.apple.HealthKit", "cinnamon");
  HKLogCoaching = (uint64_t)os_log_create("com.apple.HealthKit", "coaching");
  HKLogDataCollection = (uint64_t)os_log_create("com.apple.HealthKit", "data_collection");
  HKLogDatabase = (uint64_t)os_log_create("com.apple.HealthKit", "database");
  HKLogDeepBreathing = (uint64_t)os_log_create("com.apple.HealthKit", "deep_breathing");
  HKLogDemoData = (uint64_t)os_log_create("com.apple.HealthKit", "demodata");
  HKLogGuestMode = (uint64_t)os_log_create("com.apple.HealthKit", "guest_mode");
  HKLogHealthRecords = (uint64_t)os_log_create("com.apple.HealthKit", "health_records");
  HKLogHearing = (uint64_t)os_log_create("com.apple.HealthKit", "hearing");
  HKLogHeartRate = (uint64_t)os_log_create("com.apple.HealthKit", "heart_rate");
  HKLogMedicalID = (uint64_t)os_log_create("com.apple.HealthKit", "medical_id");
  HKLogMenstrualCycles = (uint64_t)os_log_create("com.apple.HealthKit", "menstrual_cycles");
  HKLogMentalHealth = (uint64_t)os_log_create("com.apple.HealthKit", "mental_health");
  HKLogMobileAsset = (uint64_t)os_log_create("com.apple.HealthKit", "mobile_asset");
  HKLogMobility = (uint64_t)os_log_create("com.apple.HealthKit", "mobility");
  HKLogNotifications = (uint64_t)os_log_create("com.apple.HealthKit", "notifications");
  HKLogProcessState = (uint64_t)os_log_create("com.apple.HealthKit", "process_state");
  HKLogQuery = (uint64_t)os_log_create("com.apple.HealthKit", "query");
  HKLogRespiratory = (uint64_t)os_log_create("com.apple.HealthKit", "respiratory");
  HKLogServices = (uint64_t)os_log_create("com.apple.HealthKit", "services");
  HKLogSleep = (uint64_t)os_log_create("com.apple.HealthKit", "sleep");
  HKLogSync = (uint64_t)os_log_create("com.apple.HealthKit", "sync");
  HKLogWellnessDashboard = (uint64_t)os_log_create("com.apple.HealthKit", "wellness_dashboard");
  HKLogWorkouts = (uint64_t)os_log_create("com.apple.HealthKit", "workouts");
  os_log_t result = os_log_create("com.apple.HealthKit", "gymkit");
  HKLogGymKit = (uint64_t)result;
  return result;
}

@end