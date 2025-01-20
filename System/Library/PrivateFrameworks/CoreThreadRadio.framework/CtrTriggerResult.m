@interface CtrTriggerResult
+ (BOOL)supportsSecureCoding;
- (BOOL)is_border_router_advertised;
- (BOOL)is_leader_thirdparty;
- (BOOL)is_parent_change_detected;
- (BOOL)is_partition_id_change_detected;
- (BOOL)is_role_detach_disable_detected;
- (BOOL)is_threaddaemon_crash_detected;
- (BOOL)is_threadfw_crash_detected;
- (CtrTriggerResult)initWithCoder:(id)a3;
- (CtrTriggerResult)initWithData:(int64_t)a3 num_thirdparty_BRs:(int64_t)a4 num_thread_networks:(int64_t)a5 max_simultaneous_prefixes:(int64_t)a6 tx_total:(int64_t)a7 tx_total_success:(int64_t)a8 tx_success_perc:(int64_t)a9 rx_total:(int64_t)a10 rx_total_success:(int64_t)a11 rx_success_perc:(int64_t)a12 tx_delayavg:(int64_t)a13 tx_delaymin:(int64_t)a14 tx_delaymax:(int64_t)a15 coex_tx_denied_reqs_perc:(int64_t)a16 coex_rx_denied_reqs_perc:(int64_t)a17 thirdparty_leader:(BOOL)a18 last_known_device_role:(id)a19 is_partition_id_change_detected:(BOOL)a20 leader_name:(id)a21 num_routers:(id)a22 thread_mesh_size:(id)a23 is_parent_change_detected:(BOOL)a24 is_threaddaemon_crash_detected:(BOOL)a25 is_threadfw_crash_detected:(BOOL)a26 is_role_detach_disable_detected:(BOOL)a27 is_border_router_advertised:(BOOL)a28 num_border_routers_advertised:(int64_t)a29 duration:(int64_t)a30;
- (NSMutableArray)accessory_result;
- (NSString)last_known_device_role;
- (NSString)leader_name;
- (NSString)num_routers;
- (NSString)thread_mesh_size;
- (int64_t)coex_rx_denied_requests_percentage;
- (int64_t)coex_tx_denied_requests_percentage;
- (int64_t)duration;
- (int64_t)max_simultaneous_prefix_detected;
- (int64_t)num_apple_BRs;
- (int64_t)num_border_routers_advertised;
- (int64_t)num_thirdparty_BRs;
- (int64_t)num_thread_networks;
- (int64_t)rx_success_perc;
- (int64_t)rx_total;
- (int64_t)rx_total_success;
- (int64_t)tx_delayavg;
- (int64_t)tx_delaymax;
- (int64_t)tx_delaymin;
- (int64_t)tx_success_perc;
- (int64_t)tx_total;
- (int64_t)tx_total_success;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CtrTriggerResult

- (CtrTriggerResult)initWithData:(int64_t)a3 num_thirdparty_BRs:(int64_t)a4 num_thread_networks:(int64_t)a5 max_simultaneous_prefixes:(int64_t)a6 tx_total:(int64_t)a7 tx_total_success:(int64_t)a8 tx_success_perc:(int64_t)a9 rx_total:(int64_t)a10 rx_total_success:(int64_t)a11 rx_success_perc:(int64_t)a12 tx_delayavg:(int64_t)a13 tx_delaymin:(int64_t)a14 tx_delaymax:(int64_t)a15 coex_tx_denied_reqs_perc:(int64_t)a16 coex_rx_denied_reqs_perc:(int64_t)a17 thirdparty_leader:(BOOL)a18 last_known_device_role:(id)a19 is_partition_id_change_detected:(BOOL)a20 leader_name:(id)a21 num_routers:(id)a22 thread_mesh_size:(id)a23 is_parent_change_detected:(BOOL)a24 is_threaddaemon_crash_detected:(BOOL)a25 is_threadfw_crash_detected:(BOOL)a26 is_role_detach_disable_detected:(BOOL)a27 is_border_router_advertised:(BOOL)a28 num_border_routers_advertised:(int64_t)a29 duration:(int64_t)a30
{
  id v32 = a19;
  id v33 = a21;
  id v34 = a22;
  id v35 = a23;
  v43.receiver = self;
  v43.super_class = (Class)CtrTriggerResult;
  v36 = [(CtrTriggerResult *)&v43 init];
  if (v36)
  {
    v36->_num_apple_BRs = a3;
    v36->_num_thirdparty_BRs = a4;
    v36->_num_thread_networks = a5;
    v36->_max_simultaneous_prefix_detected = a6;
    v36->_tx_total = a7;
    v36->_tx_total_success = a8;
    v36->_tx_success_perc = a9;
    v36->_rx_total = a10;
    v36->_rx_total_success = a11;
    v36->_rx_success_perc = a12;
    v36->_tx_delayavg = a13;
    v36->_tx_delaymin = a14;
    v36->_tx_delaymax = a15;
    v36->_coex_tx_denied_requests_percentage = a16;
    v36->_coex_rx_denied_requests_percentage = a17;
    v36->_is_leader_thirdparty = a18;
    objc_storeStrong((id *)&v36->_last_known_device_role, a19);
    v36->_is_partition_id_change_detected = a20;
    objc_storeStrong((id *)&v36->_leader_name, a21);
    objc_storeStrong((id *)&v36->_num_routers, a22);
    objc_storeStrong((id *)&v36->_thread_mesh_size, a23);
    v36->_is_parent_change_detected = a24;
    v36->_is_threaddaemon_crash_detected = a25;
    v36->_is_threadfw_crash_detected = a26;
    v36->_is_role_detach_disable_detected = a27;
    v36->_is_border_router_advertised = a28;
    v36->_num_border_routers_advertised = a29;
    v36->_duration = a30;
  }

  return v36;
}

- (CtrTriggerResult)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v31 = [v3 decodeInt64ForKey:@"numAppleBRs"];
  uint64_t v30 = [v3 decodeInt64ForKey:@"thirdPartyBRs"];
  uint64_t v29 = [v3 decodeInt64ForKey:@"threadNwsKey"];
  uint64_t v28 = [v3 decodeInt64ForKey:@"prefixesDetected"];
  [v3 decodeInt64ForKey:@"txTotal"];
  [v3 decodeInt64ForKey:@"txTotalSuccess"];
  uint64_t v26 = [v3 decodeInt64ForKey:@"txSuccessPerc"];
  uint64_t v25 = [v3 decodeInt64ForKey:@"rxTotal"];
  uint64_t v24 = [v3 decodeInt64ForKey:@"rxTotalSuccess"];
  uint64_t v22 = [v3 decodeInt64ForKey:@"rxSuccessPerc"];
  uint64_t v21 = [v3 decodeInt64ForKey:@"txDelayAvg"];
  uint64_t v19 = [v3 decodeInt64ForKey:@"txDelayMin"];
  uint64_t v18 = [v3 decodeInt64ForKey:@"txDelayMax"];
  uint64_t v16 = [v3 decodeInt64ForKey:@"coexTxDeniedReqsPerc"];
  uint64_t v15 = [v3 decodeInt64ForKey:@"coexRxDeniedReqsPerc"];
  char v14 = [v3 decodeBoolForKey:@"leaderIsThirdParty"];
  v27 = [v3 decodeObjectForKey:@"lastKnownRole"];
  char v13 = [v3 decodeBoolForKey:@"partitionChanged"];
  v23 = [v3 decodeObjectForKey:@"leaderName"];
  v20 = [v3 decodeObjectForKey:@"numRouters"];
  v17 = [v3 decodeObjectForKey:@"meshSize"];
  char v4 = [v3 decodeBoolForKey:@"parentChanged"];
  char v5 = [v3 decodeBoolForKey:@"daemonCrashed"];
  char v6 = [v3 decodeBoolForKey:@"fwCrashed"];
  char v7 = [v3 decodeBoolForKey:@"roleDisableDetached"];
  BYTE4(v12) = [v3 decodeBoolForKey:@"borderRouterFound"];
  BYTE3(v12) = v7;
  BYTE2(v12) = v6;
  BYTE1(v12) = v5;
  LOBYTE(v12) = v4;
  LOBYTE(v11) = v13;
  LOBYTE(v10) = v14;
  v8 = -[CtrTriggerResult initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:](self, "initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:", v31, v30, v29, v26, v25, v24, v22, v21, v19, v18, v16, v15, v10,
         v27,
         v11,
         v23,
         v20,
         v17,
         v12,
         v28,
         [v3 decodeInt64ForKey:@"duration"]);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult num_apple_BRs](self, "num_apple_BRs"), @"numAppleBRs");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult num_thirdparty_BRs](self, "num_thirdparty_BRs"), @"thirdPartyBRs");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult num_thread_networks](self, "num_thread_networks"), @"threadNwsKey");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult max_simultaneous_prefix_detected](self, "max_simultaneous_prefix_detected"), @"prefixesDetected");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_total](self, "tx_total"), @"txTotal");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_total_success](self, "tx_total_success"), @"txTotalSuccess");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_success_perc](self, "tx_success_perc"), @"txSuccessPerc");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult rx_total](self, "rx_total"), @"rxTotal");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult rx_total_success](self, "rx_total_success"), @"rxTotalSuccess");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult rx_success_perc](self, "rx_success_perc"), @"rxSuccessPerc");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_delayavg](self, "tx_delayavg"), @"txDelayAvg");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_delaymin](self, "tx_delaymin"), @"txDelayMin");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult tx_delaymax](self, "tx_delaymax"), @"txDelayMax");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult coex_tx_denied_requests_percentage](self, "coex_tx_denied_requests_percentage"), @"coexTxDeniedReqsPerc");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult coex_rx_denied_requests_percentage](self, "coex_rx_denied_requests_percentage"), @"coexRxDeniedReqsPerc");
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_leader_thirdparty](self, "is_leader_thirdparty"), @"leaderIsThirdParty");
  char v4 = [(CtrTriggerResult *)self last_known_device_role];
  [v8 encodeObject:v4 forKey:@"lastKnownRole"];

  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_partition_id_change_detected](self, "is_partition_id_change_detected"), @"partitionChanged");
  char v5 = [(CtrTriggerResult *)self leader_name];
  [v8 encodeObject:v5 forKey:@"leaderName"];

  char v6 = [(CtrTriggerResult *)self num_routers];
  [v8 encodeObject:v6 forKey:@"numRouters"];

  char v7 = [(CtrTriggerResult *)self thread_mesh_size];
  [v8 encodeObject:v7 forKey:@"meshSize"];

  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_parent_change_detected](self, "is_parent_change_detected"), @"parentChanged");
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_threaddaemon_crash_detected](self, "is_threaddaemon_crash_detected"), @"daemonCrashed");
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_threadfw_crash_detected](self, "is_threadfw_crash_detected"), @"fwCrashed");
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_role_detach_disable_detected](self, "is_role_detach_disable_detected"), @"roleDisableDetached");
  objc_msgSend(v8, "encodeBool:forKey:", -[CtrTriggerResult is_border_router_advertised](self, "is_border_router_advertised"), @"borderRouterFound");
  objc_msgSend(v8, "encodeInt64:forKey:", -[CtrTriggerResult duration](self, "duration"), @"duration");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)num_apple_BRs
{
  return self->_num_apple_BRs;
}

- (int64_t)num_thirdparty_BRs
{
  return self->_num_thirdparty_BRs;
}

- (int64_t)num_thread_networks
{
  return self->_num_thread_networks;
}

- (int64_t)max_simultaneous_prefix_detected
{
  return self->_max_simultaneous_prefix_detected;
}

- (int64_t)tx_total
{
  return self->_tx_total;
}

- (int64_t)tx_total_success
{
  return self->_tx_total_success;
}

- (int64_t)tx_success_perc
{
  return self->_tx_success_perc;
}

- (int64_t)rx_total
{
  return self->_rx_total;
}

- (int64_t)rx_total_success
{
  return self->_rx_total_success;
}

- (int64_t)rx_success_perc
{
  return self->_rx_success_perc;
}

- (int64_t)tx_delayavg
{
  return self->_tx_delayavg;
}

- (int64_t)tx_delaymin
{
  return self->_tx_delaymin;
}

- (int64_t)tx_delaymax
{
  return self->_tx_delaymax;
}

- (int64_t)coex_tx_denied_requests_percentage
{
  return self->_coex_tx_denied_requests_percentage;
}

- (int64_t)coex_rx_denied_requests_percentage
{
  return self->_coex_rx_denied_requests_percentage;
}

- (BOOL)is_leader_thirdparty
{
  return self->_is_leader_thirdparty;
}

- (NSString)last_known_device_role
{
  return self->_last_known_device_role;
}

- (BOOL)is_partition_id_change_detected
{
  return self->_is_partition_id_change_detected;
}

- (NSString)leader_name
{
  return self->_leader_name;
}

- (NSString)num_routers
{
  return self->_num_routers;
}

- (NSString)thread_mesh_size
{
  return self->_thread_mesh_size;
}

- (BOOL)is_parent_change_detected
{
  return self->_is_parent_change_detected;
}

- (BOOL)is_threaddaemon_crash_detected
{
  return self->_is_threaddaemon_crash_detected;
}

- (BOOL)is_threadfw_crash_detected
{
  return self->_is_threadfw_crash_detected;
}

- (BOOL)is_role_detach_disable_detected
{
  return self->_is_role_detach_disable_detected;
}

- (BOOL)is_border_router_advertised
{
  return self->_is_border_router_advertised;
}

- (int64_t)num_border_routers_advertised
{
  return self->_num_border_routers_advertised;
}

- (NSMutableArray)accessory_result
{
  return self->_accessory_result;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory_result, 0);
  objc_storeStrong((id *)&self->_thread_mesh_size, 0);
  objc_storeStrong((id *)&self->_num_routers, 0);
  objc_storeStrong((id *)&self->_leader_name, 0);

  objc_storeStrong((id *)&self->_last_known_device_role, 0);
}

@end