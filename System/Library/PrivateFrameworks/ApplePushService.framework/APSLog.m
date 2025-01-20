@interface APSLog
+ (BOOL)shouldPowerLogEvent:(id)a3;
+ (OS_os_log)PUSHTRACE;
+ (OS_os_log)activityTracking;
+ (OS_os_log)alert;
+ (OS_os_log)certificate;
+ (OS_os_log)connection;
+ (OS_os_log)connectionServer;
+ (OS_os_log)courier;
+ (OS_os_log)courierOversized;
+ (OS_os_log)daemon;
+ (OS_os_log)database;
+ (OS_os_log)main;
+ (OS_os_log)networking;
+ (OS_os_log)nonce;
+ (OS_os_log)power;
+ (OS_os_log)preference;
+ (OS_os_log)protocolParser;
+ (OS_os_log)protocolParserDetailed;
+ (OS_os_log)proxy;
+ (OS_os_log)pubSub;
+ (OS_os_log)pushHistory;
+ (OS_os_log)simulator;
+ (OS_os_log)stream;
+ (OS_os_log)taskManager;
+ (OS_os_log)telemetry;
+ (OS_os_log)topicManager;
+ (OS_os_log)topicManagerOversized;
+ (OS_os_log)ttlCollection;
+ (OS_os_log)xpc;
@end

@implementation APSLog

+ (OS_os_log)courier
{
  if (courier_onceToken != -1) {
    dispatch_once(&courier_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)courier___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)topicManager
{
  if (topicManager_onceToken != -1) {
    dispatch_once(&topicManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)topicManager___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)connectionServer
{
  if (connectionServer_onceToken != -1) {
    dispatch_once(&connectionServer_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)connectionServer___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)connection
{
  if (connection_onceToken != -1) {
    dispatch_once(&connection_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)connection___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)telemetry
{
  if (telemetry_onceToken != -1) {
    dispatch_once(&telemetry_onceToken, &__block_literal_global);
  }
  v2 = (void *)telemetry___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)power
{
  if (power_onceToken != -1) {
    dispatch_once(&power_onceToken, &__block_literal_global_81);
  }
  v2 = (void *)power___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)courierOversized
{
  if (courierOversized_onceToken != -1) {
    dispatch_once(&courierOversized_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)courierOversized___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)protocolParser
{
  if (protocolParser_onceToken != -1) {
    dispatch_once(&protocolParser_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)protocolParser___log;
  return (OS_os_log *)v2;
}

+ (BOOL)shouldPowerLogEvent:(id)a3
{
  id v3 = a3;
  if (shouldPowerLogEvent___pred_PLShouldLogRegisteredEventPowerLog != -1) {
    dispatch_once(&shouldPowerLogEvent___pred_PLShouldLogRegisteredEventPowerLog, &__block_literal_global_84);
  }
  if (shouldPowerLogEvent___PLShouldLogRegisteredEvent) {
    char v4 = shouldPowerLogEvent___PLShouldLogRegisteredEvent(2, v3);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __19__APSLog_telemetry__block_invoke()
{
  telemetry___log = (uint64_t)os_log_create("com.apple.apsd", "telemetry");
  return MEMORY[0x1F41817F8]();
}

uint64_t __22__APSLog_topicManager__block_invoke()
{
  topicManager___log = (uint64_t)os_log_create("com.apple.apsd", "topicManager");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)topicManagerOversized
{
  if (topicManagerOversized_onceToken != -1) {
    dispatch_once(&topicManagerOversized_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)topicManagerOversized___log;
  return (OS_os_log *)v2;
}

uint64_t __31__APSLog_topicManagerOversized__block_invoke()
{
  topicManagerOversized___log = (uint64_t)os_log_create("com.apple.apsd", "topicManager-oversized");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)daemon
{
  if (daemon_onceToken != -1) {
    dispatch_once(&daemon_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)daemon___log;
  return (OS_os_log *)v2;
}

uint64_t __16__APSLog_daemon__block_invoke()
{
  daemon___log = (uint64_t)os_log_create("com.apple.apsd", "daemon");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)pushHistory
{
  if (pushHistory_onceToken != -1) {
    dispatch_once(&pushHistory_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)pushHistory___log;
  return (OS_os_log *)v2;
}

uint64_t __21__APSLog_pushHistory__block_invoke()
{
  pushHistory___log = (uint64_t)os_log_create("com.apple.apsd", "pushHistory");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)database
{
  if (database_onceToken != -1) {
    dispatch_once(&database_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)database___log;
  return (OS_os_log *)v2;
}

uint64_t __18__APSLog_database__block_invoke()
{
  database___log = (uint64_t)os_log_create("com.apple.apsd", "database");
  return MEMORY[0x1F41817F8]();
}

uint64_t __20__APSLog_connection__block_invoke()
{
  connection___log = (uint64_t)os_log_create("com.apple.apsd", "connection");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)xpc
{
  if (xpc_onceToken != -1) {
    dispatch_once(&xpc_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)xpc___log;
  return (OS_os_log *)v2;
}

uint64_t __13__APSLog_xpc__block_invoke()
{
  xpc___log = (uint64_t)os_log_create("com.apple.apsd", "xpc");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)certificate
{
  if (certificate_onceToken != -1) {
    dispatch_once(&certificate_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)certificate___log;
  return (OS_os_log *)v2;
}

uint64_t __21__APSLog_certificate__block_invoke()
{
  certificate___log = (uint64_t)os_log_create("com.apple.apsd", "certificate");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)networking
{
  if (networking_onceToken != -1) {
    dispatch_once(&networking_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)networking___log;
  return (OS_os_log *)v2;
}

uint64_t __20__APSLog_networking__block_invoke()
{
  networking___log = (uint64_t)os_log_create("com.apple.apsd", "networking");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)nonce
{
  if (nonce_onceToken != -1) {
    dispatch_once(&nonce_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)nonce___log;
  return (OS_os_log *)v2;
}

uint64_t __15__APSLog_nonce__block_invoke()
{
  nonce___log = (uint64_t)os_log_create("com.apple.apsd", "nonce");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)alert
{
  if (alert_onceToken != -1) {
    dispatch_once(&alert_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)alert___log;
  return (OS_os_log *)v2;
}

uint64_t __15__APSLog_alert__block_invoke()
{
  alert___log = (uint64_t)os_log_create("com.apple.apsd", "alert");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)stream
{
  if (stream_onceToken != -1) {
    dispatch_once(&stream_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)stream___log;
  return (OS_os_log *)v2;
}

uint64_t __16__APSLog_stream__block_invoke()
{
  stream___log = (uint64_t)os_log_create("com.apple.apsd", "stream");
  return MEMORY[0x1F41817F8]();
}

uint64_t __17__APSLog_courier__block_invoke()
{
  courier___log = (uint64_t)os_log_create("com.apple.apsd", "courier");
  return MEMORY[0x1F41817F8]();
}

uint64_t __26__APSLog_courierOversized__block_invoke()
{
  courierOversized___log = (uint64_t)os_log_create("com.apple.apsd", "courier-oversized");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)preference
{
  if (preference_onceToken != -1) {
    dispatch_once(&preference_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)preference___log;
  return (OS_os_log *)v2;
}

uint64_t __20__APSLog_preference__block_invoke()
{
  preference___log = (uint64_t)os_log_create("com.apple.apsd", "preference");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)main
{
  if (main_onceToken != -1) {
    dispatch_once(&main_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)main___log;
  return (OS_os_log *)v2;
}

uint64_t __14__APSLog_main__block_invoke()
{
  main___log = (uint64_t)os_log_create("com.apple.apsd", "main");
  return MEMORY[0x1F41817F8]();
}

uint64_t __26__APSLog_connectionServer__block_invoke()
{
  connectionServer___log = (uint64_t)os_log_create("com.apple.apsd", "connectionServer");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)taskManager
{
  if (taskManager_onceToken != -1) {
    dispatch_once(&taskManager_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)taskManager___log;
  return (OS_os_log *)v2;
}

uint64_t __21__APSLog_taskManager__block_invoke()
{
  taskManager___log = (uint64_t)os_log_create("com.apple.apsd", "taskManager");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)ttlCollection
{
  if (ttlCollection_onceToken != -1) {
    dispatch_once(&ttlCollection_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)ttlCollection___log;
  return (OS_os_log *)v2;
}

uint64_t __23__APSLog_ttlCollection__block_invoke()
{
  ttlCollection___log = (uint64_t)os_log_create("com.apple.apsd", "ttlCollection");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)pubSub
{
  if (pubSub_onceToken != -1) {
    dispatch_once(&pubSub_onceToken, &__block_literal_global_60);
  }
  v2 = (void *)pubSub___log;
  return (OS_os_log *)v2;
}

uint64_t __16__APSLog_pubSub__block_invoke()
{
  pubSub___log = (uint64_t)os_log_create("com.apple.apsd", "pubSub");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)PUSHTRACE
{
  if (PUSHTRACE_onceToken != -1) {
    dispatch_once(&PUSHTRACE_onceToken, &__block_literal_global_63);
  }
  v2 = (void *)PUSHTRACE___log;
  return (OS_os_log *)v2;
}

uint64_t __19__APSLog_PUSHTRACE__block_invoke()
{
  PUSHTRACE___log = (uint64_t)os_log_create("com.apple.apsd", "PUSHTRACE");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)simulator
{
  if (simulator_onceToken != -1) {
    dispatch_once(&simulator_onceToken, &__block_literal_global_66);
  }
  v2 = (void *)simulator___log;
  return (OS_os_log *)v2;
}

uint64_t __19__APSLog_simulator__block_invoke()
{
  simulator___log = (uint64_t)os_log_create("com.apple.apsd", "simulator");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)activityTracking
{
  if (activityTracking_onceToken != -1) {
    dispatch_once(&activityTracking_onceToken, &__block_literal_global_69);
  }
  v2 = (void *)activityTracking___log;
  return (OS_os_log *)v2;
}

uint64_t __26__APSLog_activityTracking__block_invoke()
{
  activityTracking___log = (uint64_t)os_log_create("com.apple.apsd", "activityTracking");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)proxy
{
  if (proxy_onceToken != -1) {
    dispatch_once(&proxy_onceToken, &__block_literal_global_72);
  }
  v2 = (void *)proxy___log;
  return (OS_os_log *)v2;
}

uint64_t __15__APSLog_proxy__block_invoke()
{
  proxy___log = (uint64_t)os_log_create("com.apple.apsd", "proxy");
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__APSLog_protocolParser__block_invoke()
{
  protocolParser___log = (uint64_t)os_log_create("com.apple.apsd", "protocolParser");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)protocolParserDetailed
{
  if (protocolParserDetailed_onceToken != -1) {
    dispatch_once(&protocolParserDetailed_onceToken, &__block_literal_global_78);
  }
  v2 = (void *)protocolParserDetailed___log;
  return (OS_os_log *)v2;
}

uint64_t __32__APSLog_protocolParserDetailed__block_invoke()
{
  protocolParserDetailed___log = (uint64_t)os_log_create("com.apple.apsd", "protocolParserDetail");
  return MEMORY[0x1F41817F8]();
}

uint64_t __15__APSLog_power__block_invoke()
{
  power___log = (uint64_t)os_log_create("com.apple.apsd", "power");
  return MEMORY[0x1F41817F8]();
}

uint64_t (*__30__APSLog_shouldPowerLogEvent___block_invoke())(void, void)
{
  result = (uint64_t (*)(void, void))CUTWeakLinkSymbol();
  shouldPowerLogEvent___PLShouldLogRegisteredEvent = result;
  return result;
}

@end