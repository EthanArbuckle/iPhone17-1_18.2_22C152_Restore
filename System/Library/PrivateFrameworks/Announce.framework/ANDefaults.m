@interface ANDefaults
+ (id)sharedInstance;
- (ANDefaults)init;
- (BOOL)BOOLForDefault:(id)a3;
- (NSDictionary)defaultsItems;
- (NSUserDefaults)defaults;
- (id)numberForDefault:(id)a3;
- (id)objectForDefault:(id)a3;
- (void)setBool:(BOOL)a3 forDefault:(id)a4;
- (void)setDefaults:(id)a3;
- (void)setNumber:(id)a3 forDefault:(id)a4;
- (void)setObject:(id)a3 forDefault:(id)a4;
@end

@implementation ANDefaults

- (ANDefaults)init
{
  v65[55] = *MEMORY[0x263EF8340];
  v63.receiver = self;
  v63.super_class = (Class)ANDefaults;
  v2 = [(ANDefaults *)&v63 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.announce"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v64[0] = @"announce_enabled";
    v62 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Announce Enabled for the Local Device (Only valid when HPSFeatureStatus.isLocalSettingsEnabled == true)"];
    v65[0] = v62;
    v64[1] = @"announcement_receipt_expiration";
    v61 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC00 userInfo:@"[Int] Announcement Receipt Expiration in Seconds"];
    v65[1] = v61;
    v64[2] = @"ids_server_message_timeout";
    v60 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB40 userInfo:@"[Int] IDS Server Message Timeout in Seconds"];
    v65[2] = v60;
    v64[3] = @"announcement_user_notification_expiration";
    v59 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC10 userInfo:@"[Int] Announcement User Notification Expiration in Seconds"];
    v65[3] = v59;
    v64[4] = @"allow_announcement_to_accessory_physically_in_target_home";
    v58 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Allow Announcements to Accessory if the Accessory is physically located in the target home"];
    v65[4] = v58;
    v64[5] = @"relay_announcements_through_resident";
    v57 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Relay Announcements through a Resident HomePod"];
    v65[5] = v57;
    v64[6] = @"send_transaction_active_memory_timeout";
    v56 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC20 userInfo:@"[Double] How long (in seconds) to stay in active memory when sending an announcement"];
    v65[6] = v56;
    v64[7] = @"use_rapport";
    v55 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Use Rapport (when available) in addition to IDS"];
    v65[7] = v55;
    v64[8] = @"rapport_scan_timeout";
    v54 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC30 userInfo:@"[Double] How long to wait after starting a scan before checking active devices"];
    v65[8] = v54;
    v64[9] = @"rapport_scan_duration";
    v53 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC40 userInfo:@"[Double] How long to continue scanning before deactivating the link client"];
    v65[9] = v53;
    v64[10] = @"rapport_scan_interval";
    v52 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC20 userInfo:@"[Double] How often to scan for devices"];
    v65[10] = v52;
    v64[11] = @"rapport_send_message_timeout";
    v51 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC50 userInfo:@"[Double] Send Message Timeout"];
    v65[11] = v51;
    v64[12] = @"rapport_send_home_location_status_request_timeout";
    v50 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC60 userInfo:@"[Double] Send Home Location Status Request Timeout in seconds"];
    v65[12] = v50;
    v64[13] = @"announcement_deadline";
    v49 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC70 userInfo:@"[Double] Announcement deadline"];
    v65[13] = v49;
    v64[14] = @"announcement_playback_minimum_delay";
    v48 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC60 userInfo:@"[Double] Minimum Delay Before Playing an Announcement in seconds"];
    v65[14] = v48;
    v64[15] = @"silence_between_tracks_ms";
    v47 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB70 userInfo:@"[Int] Silence to insert between each track in milliseconds"];
    v65[15] = v47;
    v64[16] = @"previous_goes_to_previous_ms";
    v46 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB88 userInfo:@"[Int] Amount of time into a track where previous goes back to beginning in milliseconds"];
    v65[16] = v46;
    v64[17] = @"start_tone_trim";
    v45 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC80 userInfo:@"[Double] Amount to trim off the start tone tail in seconds"];
    v65[17] = v45;
    v64[18] = @"transition_tone_trim";
    v44 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC90 userInfo:@"[Double] Amount to trim off the transition tone tail in seconds"];
    v65[18] = v44;
    v64[19] = @"force_allow_announce_for_all_users";
    v43 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Forces Announce Access Allowed to be true for any HMUser"];
    v65[19] = v43;
    v64[20] = @"force_allow_announce_for_all_accessories";
    v42 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Forces Announce Access Allowed to be true for all Accessories"];
    v65[20] = v42;
    v64[21] = @"force_supports_announce_for_all_accessories";
    v41 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Forces Announce Supported to be true for all Accessories"];
    v65[21] = v41;
    v64[22] = @"force_allow_announce_notifications_for_all_users";
    v40 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Forces Announce Notifications for any HMUser"];
    v65[22] = v40;
    v64[23] = @"force_send_failures";
    v39 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Force Announcement Send Failures"];
    v65[23] = v39;
    v64[24] = @"force_delivery_failures";
    v38 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Force Announcement Delivery Failures"];
    v65[24] = v38;
    v64[25] = @"audio_session_wait_for_call_end_timeout";
    v37 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCA0 userInfo:@"[Double] Audio Session Wait For Call End Timeout in Seconds"];
    v65[25] = v37;
    v64[26] = @"audio_session_activation_retry_delay";
    v36 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCA0 userInfo:@"[Double] Audio Session Activation Retry Delay in Seconds"];
    v65[26] = v36;
    v64[27] = @"audio_session_deactivation_timeout";
    v35 = +[ANDefaultsItem itemWithValue:&unk_26D2DBBA0 userInfo:@"[Int] Audio Session Deactivation Timeout in Seconds"];
    v65[27] = v35;
    v64[28] = @"audio_session_resume_after_interruption_delay";
    v34 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCB0 userInfo:@"[Double] Audio Session Resume after Interruption Delay in Seconds"];
    v65[28] = v34;
    v64[29] = @"resume_playback_after_interruption_timeout";
    v33 = +[ANDefaultsItem itemWithValue:&unk_26D2DBC20 userInfo:@"[Double] Playback Audio Session Interruption Resume Timeout in Seconds"];
    v65[29] = v33;
    v64[30] = @"normalize_audio";
    v32 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Normalize Audio in Announcement before sending"];
    v65[30] = v32;
    v64[31] = @"send_analytics";
    v31 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Fire events to CoreAnalytics"];
    v65[31] = v31;
    v64[32] = @"use_coordinated_alerts";
    v30 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Scan devices to find the best one to prominently alert an Announcement Notification"];
    v65[32] = v30;
    v64[33] = @"announcement_entry_age_limit";
    v29 = +[ANDefaultsItem itemWithValue:&unk_26D2DBBB8 userInfo:@"[Int] An announcement's age in seconds that is considered too old for it to be accepted"];
    v65[33] = v29;
    v64[34] = @"announcement_storage_age_limit";
    v28 = +[ANDefaultsItem itemWithValue:&unk_26D2DBBD0 userInfo:@"[Int] An announcement's age in seconds that is considered too old for it to be kept around"];
    v65[34] = v28;
    v64[35] = @"siri_interruption_stops_playback";
    v27 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Siri should explicitly stop playback. When false, playback will be stopped by audio session interruption."];
    v65[35] = v27;
    v64[36] = @"playback_status_returns_immediately";
    v26 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Return playback status immediately after starting playback"];
    v65[36] = v26;
    v64[37] = @"analytics_daily_background_activity";
    v25 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Start a 24 hour interval to run a background task for collecting daily metrics"];
    v65[37] = v25;
    v64[38] = @"analytics_daily_background_activity_ts";
    v24 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCC0 userInfo:@"[Double] A timestamp of when the activity was last triggered"];
    v65[38] = v24;
    v64[39] = @"daily_home_announcements_count";
    v23 = +[ANDefaultsItem itemWithValue:MEMORY[0x263EFFA78] userInfo:@"[NSDictionary] A dictionary of the number of announcements sent/received per home per location group"];
    v65[39] = v23;
    v64[40] = @"use_original_audio_file_on_process_failure";
    v22 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Use Original Audio Files if Audio Processing Fails or produces a bad output"];
    v65[40] = v22;
    v64[41] = @"keep_sent_audio_files";
    v21 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Keep Sent Audio Files"];
    v65[41] = v21;
    v64[42] = @"keep_received_audio_files";
    v20 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Keep Received Audio Files"];
    v65[42] = v20;
    v64[43] = @"play_sound_on_critical_failure";
    v19 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Play a Sound when a critical failure occurs. Useful on HomePod, which does not contain a display"];
    v65[43] = v19;
    v64[44] = @"audio_accessory_db_boost";
    v18 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCD0 userInfo:@"[Float] Playback dB Boost for Audio Accessories"];
    v65[44] = v18;
    v64[45] = @"transcription_timeout";
    v17 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCE0 userInfo:@"[Double] On-device transcription wait timeout in seconds"];
    v65[45] = v17;
    v64[46] = @"user_notification_include_transcription";
    v5 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Include transcription in User Notification Body"];
    v65[46] = v5;
    v64[47] = @"user_notification_unified_banner";
    v6 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Post a single user notification for all announcements for each Home"];
    v65[47] = v6;
    v64[48] = @"user_notification_include_recipients";
    v7 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB58 userInfo:@"[BOOL] Include recipients in communication user notificaitons"];
    v65[48] = v7;
    v64[49] = @"enable_save_announcement_meta_data";
    v8 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Enable Save Announcement Meta Data in User Defaults"];
    v65[49] = v8;
    v64[50] = @"check_residents_for_ids";
    v9 = +[ANDefaultsItem itemWithValue:&unk_26D2DBB28 userInfo:@"[BOOL] Perform Resident-level checks when sending over IDS"];
    v65[50] = v9;
    v64[51] = @"track_player_playback_timeout";
    v10 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCF0 userInfo:@"[Double] Track Player Playback Timeout Value in seconds"];
    v65[51] = v10;
    v64[52] = @"accessory_settings_refresh_interval";
    v11 = +[ANDefaultsItem itemWithValue:&unk_26D2DBD00 userInfo:@"[Double] Accessory settings refresh interval in seconds"];
    v65[52] = v11;
    v64[53] = @"disable_homekit_caching";
    v12 = +[ANDefaultsItem itemWithValue:MEMORY[0x263EFFA80] userInfo:@"[BOOL] Disable HomeKit Caching"];
    v65[53] = v12;
    v64[54] = @"homekit_refresh_timeout";
    v13 = +[ANDefaultsItem itemWithValue:&unk_26D2DBCA0 userInfo:@"[Double] Duration to wait for HomeKit refresh in seconds"];
    v65[54] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:55];
    defaultsItems = v2->_defaultsItems;
    v2->_defaultsItems = (NSDictionary *)v14;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ANDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedDefaults;

  return v2;
}

uint64_t __28__ANDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedDefaults = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (id)objectForDefault:(id)a3
{
  id v4 = a3;
  v5 = [(NSUserDefaults *)self->_defaults objectForKey:v4];
  if (!v5)
  {
    v6 = [(NSDictionary *)self->_defaultsItems objectForKeyedSubscript:v4];
    v5 = [v6 defaultValue];
  }

  return v5;
}

- (id)numberForDefault:(id)a3
{
  id v4 = a3;
  v5 = [(NSUserDefaults *)self->_defaults objectForKey:v4];
  if (!v5)
  {
    v6 = [(NSDictionary *)self->_defaultsItems objectForKeyedSubscript:v4];
    v5 = [v6 defaultValue];
  }

  return v5;
}

- (BOOL)BOOLForDefault:(id)a3
{
  id v4 = a3;
  v5 = [(NSUserDefaults *)self->_defaults objectForKey:v4];
  if (!v5)
  {
    v6 = [(NSDictionary *)self->_defaultsItems objectForKeyedSubscript:v4];
    v5 = [v6 defaultValue];
  }
  char v7 = [v5 BOOLValue];

  return v7;
}

- (void)setObject:(id)a3 forDefault:(id)a4
{
}

- (void)setNumber:(id)a3 forDefault:(id)a4
{
}

- (void)setBool:(BOOL)a3 forDefault:(id)a4
{
}

- (NSDictionary)defaultsItems
{
  return self->_defaultsItems;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_defaultsItems, 0);
}

@end