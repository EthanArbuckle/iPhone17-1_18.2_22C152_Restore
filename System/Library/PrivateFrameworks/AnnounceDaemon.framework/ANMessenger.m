@interface ANMessenger
+ (BOOL)_isAnnouncerAdminInAnnouncement:(id)a3 home:(id)a4;
+ (id)_performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4;
+ (id)_performPreflightChecksForSendingToRooms:(id)a3 zones:(id)a4;
+ (id)announcementForAccessory:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5;
+ (id)announcementForDevice:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5;
+ (id)announcementForUser:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5;
+ (id)createAnnouncementWithRequest:(id)a3 forLocation:(id)a4 inHome:(id)a5 isReply:(BOOL)a6 error:(id *)a7;
+ (id)locationForHome:(id)a3 rooms:(id)a4 zones:(id)a5 idsService:(id)a6;
+ (id)locationForReplyToAnnouncement:(id)a3 home:(id)a4 idsService:(id)a5;
+ (id)performBasicValidationForAnnouncement:(id)a3 type:(unint64_t)a4;
+ (id)performIDSValidationForAnnouncement:(id)a3 withSenderContext:(id)a4;
+ (id)performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4 rooms:(id)a5 zones:(id)a6;
+ (id)performRapportValidationForAnnouncement:(id)a3 withSenderContext:(id)a4;
+ (id)validateAnnouncerInAnnouncement:(id)a3 home:(id)a4;
+ (void)_setIdentifiersForIDSService:(id)a3 inLocation:(id)a4 home:(id)a5;
+ (void)purgeTemporaryFiles;
- (ANIDSConnectionProvider)idsConnection;
- (ANMessenger)init;
- (ANMessenger)initWithIDSConnection:(id)a3 rapportConnection:(id)a4;
- (ANMessengerDelegate)delegate;
- (ANParticipant)localParticipant;
- (ANRapportConnectionProvider)rapportConnection;
- (BOOL)_willTargetReachableDevicesForAnnouncement:(id)a3 inDestination:(id)a4;
- (OS_os_log)log;
- (double)_calculateAnnouncementDeadline:(id)a3;
- (id)connectionDidReceiveRequestForHomeLocationStatus:(id)a3;
- (id)getScanningDeviceCandidates;
- (void)_forwardRelayRequest:(id)a3 withSenderContext:(id)a4 sentHandler:(id)a5;
- (void)_fulfillRelayRequest:(id)a3 withSenderContext:(id)a4 sentHandler:(id)a5;
- (void)_logDebugInfoForHome:(id)a3;
- (void)_relayAnnouncementThroughHomePod:(id)a3 inHome:(id)a4 rooms:(id)a5 sentHandler:(id)a6;
- (void)_sendAnnouncement:(id)a3 toDestination:(id)a4 sentHandler:(id)a5;
- (void)broadcastReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5;
- (void)cleanForExit;
- (void)connection:(id)a3 didReceiveMessage:(id)a4 fromSender:(id)a5 senderContext:(id)a6 handler:(id)a7;
- (void)connection:(id)a3 failedDeliveryForMessage:(id)a4 withError:(id)a5;
- (void)forwardAnnouncementToCompanion:(id)a3;
- (void)mockAnnouncement:(id)a3 playbackDeadline:(id)a4 sentHandler:(id)a5;
- (void)sendAnnouncement:(id)a3 isRetry:(BOOL)a4 sentHandler:(id)a5;
- (void)sendAnnouncement:(id)a3 sentHandler:(id)a4;
- (void)sendReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5;
- (void)sendRequest:(id)a3 sentHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ANMessenger

- (ANMessenger)init
{
  v3 = objc_opt_new();
  v4 = +[ANRapportConnection sharedConnection];
  v5 = [(ANMessenger *)self initWithIDSConnection:v3 rapportConnection:v4];

  return v5;
}

- (ANMessenger)initWithIDSConnection:(id)a3 rapportConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ANMessenger;
  v9 = [(ANMessenger *)&v13 init];
  if (v9)
  {
    uint64_t v10 = ANLogWithCategory();
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_idsConnection, a3);
    [(ANIDSConnectionProvider *)v9->_idsConnection setDelegate:v9];
    objc_storeStrong((id *)&v9->_rapportConnection, a4);
    [(ANRapportConnectionProvider *)v9->_rapportConnection setDelegate:v9];
    +[ANMessenger purgeTemporaryFiles];
  }

  return v9;
}

- (void)cleanForExit
{
  id v2 = [(ANMessenger *)self rapportConnection];
  [v2 deactivateLinkWithOptions:1];
}

- (ANParticipant)localParticipant
{
  v3 = objc_opt_new();
  v4 = [(ANMessenger *)self rapportConnection];
  v5 = [v4 localDevice];
  [v3 populateWithDevice:v5];

  return (ANParticipant *)v3;
}

- (void)sendRequest:(id)a3 sentHandler:(id)a4
{
  id v14 = a3;
  v6 = (void (**)(id, void, void *))a4;
  id v7 = [v14 destination];
  unint64_t v8 = [v7 type];

  if (v8 >= 2)
  {
    if (v8 == 2)
    {
      v9 = [v14 destination];
      int v10 = [v9 replyToSender];

      v11 = [v14 destination];
      v12 = [v11 announcement];
      if (v10) {
        [(ANMessenger *)self sendReply:v14 forAnnouncement:v12 completion:v6];
      }
      else {
        [(ANMessenger *)self broadcastReply:v14 forAnnouncement:v12 completion:v6];
      }
    }
    else
    {
      objc_super v13 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1045, *MEMORY[0x1E4F4A728]);
      v6[2](v6, 0, v13);
    }
  }
  else
  {
    [(ANMessenger *)self sendAnnouncement:v14 sentHandler:v6];
  }
}

- (void)sendAnnouncement:(id)a3 sentHandler:(id)a4
{
}

- (void)sendAnnouncement:(id)a3 isRetry:(BOOL)a4 sentHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void, id))a5;
  int v10 = [v8 destination];
  v11 = [v10 home];

  if (v11)
  {
    v12 = [v8 destination];
    uint64_t v13 = [v12 rooms];

    id v14 = [v8 destination];
    v15 = [v14 zones];

    v60 = [v8 content];
    v61 = (void *)v13;
    uint64_t v16 = +[ANValidationHelper performPreflightChecksForSendingContent:toHome:rooms:zones:](ANValidationHelper, "performPreflightChecksForSendingContent:toHome:rooms:zones:");
    if (v16)
    {
      id v17 = (id)v16;
      v18 = [(ANMessenger *)self log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v66 = v11;
        __int16 v67 = 2112;
        uint64_t v68 = v13;
        __int16 v69 = 2112;
        v70 = v15;
        __int16 v71 = 2112;
        id v72 = v17;
        _os_log_error_impl(&dword_1DA5ED000, v18, OS_LOG_TYPE_ERROR, "Failed preflight check. Home = %@, Rooms = %@, Zones = %@, Error = %@", buf, 0x2Au);
      }

      v9[2](v9, 0, v17);
      v19 = +[ANAnalytics shared];
      v20 = v11;
      uint64_t v21 = [v17 code];
      v22 = v60;
      v23 = [v60 endpointIdentifier];
      v24 = +[ANAnalyticsContext contextWithEndpointID:v23];
      uint64_t v25 = v21;
      v11 = v20;
      [v19 error:v25 context:v24];
    }
    else
    {
      v27 = [(ANMessenger *)self idsConnection];
      v28 = [v27 service];
      v19 = +[ANMessenger locationForHome:v11 rooms:v61 zones:v15 idsService:v28];

      id v62 = 0;
      v29 = +[ANMessenger createAnnouncementWithRequest:v8 forLocation:v19 inHome:v11 isReply:0 error:&v62];
      id v17 = v62;
      v59 = v11;
      if (v29)
      {
        v56 = v19;
        char v30 = [v19 flags];
        v57 = v15;
        v24 = objc_msgSend(MEMORY[0x1E4F2EBF0], "hmu_roomsInZones:appendingRooms:", v15, v61);
        v31 = v29;
        if ([v29 isRelayRequest])
        {
          v32 = [(ANMessenger *)self log];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = @"Everyone";
            if ((v30 & 1) == 0) {
              v33 = @"Rooms/Zones";
            }
            *(_DWORD *)buf = 138412290;
            v66 = v33;
            _os_log_impl(&dword_1DA5ED000, v32, OS_LOG_TYPE_DEFAULT, "Sending (Announce To %@) Relay Request", buf, 0xCu);
          }

          v23 = v31;
          v34 = v31;
          v11 = v59;
          [(ANMessenger *)self _relayAnnouncementThroughHomePod:v34 inHome:v59 rooms:v24 sentHandler:v9];
          v22 = v60;
        }
        else
        {
          if (v30)
          {
            v42 = [v60 homeKitUserIdentifier];

            if (v42
              && ([v60 homeKitUserIdentifier],
                  v43 = objc_claimAutoreleasedReturnValue(),
                  [(__CFString *)v59 hmu_userWithUniqueIdentifier:v43],
                  uint64_t v44 = objc_claimAutoreleasedReturnValue(),
                  v43,
                  v44))
            {
              v54 = (void *)v44;
              uint64_t v64 = v44;
              v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
            }
            else
            {
              v54 = 0;
              v55 = (void *)MEMORY[0x1E4F1CBF0];
            }
            v45 = +[ANHomeManager shared];
            v46 = [v45 currentAccessory];
            if (v46)
            {
              id v53 = v46;
              v47 = [v60 endpointIdentifier];
              if (v47)
              {
                v48 = (void *)MEMORY[0x1E4F1CBF0];
              }
              else
              {
                v49 = +[ANHomeManager shared];
                [v49 currentAccessory];
                v50 = v52 = v45;
                v63 = v50;
                v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];

                v45 = v52;
              }

              v46 = v53;
            }
            else
            {
              v48 = (void *)MEMORY[0x1E4F1CBF0];
            }

            v51 = [(ANMessenger *)self rapportConnection];
            v41 = +[ANMessengerDestination destinationForHome:v59 excludingUsers:v55 excludingAccessories:v48 rapportConnection:v51];

            v15 = v57;
            v40 = v54;
          }
          else
          {
            v40 = [(ANMessenger *)self rapportConnection];
            v41 = +[ANMessengerDestination destinationForAccessoriesInHome:v59 rooms:v24 rapportConnection:v40];
          }

          [(ANMessenger *)self _sendAnnouncement:v31 toDestination:v41 sentHandler:v9];
          v23 = v31;
          v11 = v59;
          v22 = v60;
          v19 = v56;
        }
      }
      else
      {
        v9[2](v9, 0, v17);
        v24 = +[ANAnalytics shared];
        uint64_t v58 = [v17 code];
        v38 = [v60 endpointIdentifier];
        v39 = +[ANAnalyticsContext contextWithEndpointID:v38];
        [v24 error:v58 context:v39];

        v22 = v60;
        v23 = 0;
      }
    }
  }
  else if (v6)
  {
    v26 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1002, *MEMORY[0x1E4F4A728]);
    v9[2](v9, 0, v26);
  }
  else
  {
    v35 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA5ED000, v35, OS_LOG_TYPE_DEFAULT, "Home is nil for sendAnnouncement, refreshing Home Manager and retrying", buf, 2u);
    }

    v36 = +[ANHomeManager shared];
    id v37 = (id)[v36 refreshHomeSynchronous];

    [(ANMessenger *)self sendAnnouncement:v8 isRetry:1 sentHandler:v9];
  }
}

- (void)sendReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, id))a5;
  v11 = +[ANHomeManager shared];
  v12 = [v9 location];
  uint64_t v13 = [v12 homeUUID];
  id v14 = [v11 homeForID:v13];

  v15 = [v9 location];
  uint64_t v16 = (void *)[v15 copy];

  [v16 setFlags:0];
  id v38 = 0;
  id v17 = +[ANMessenger createAnnouncementWithRequest:v8 forLocation:v16 inHome:v14 isReply:1 error:&v38];
  id v18 = v38;
  id v37 = v18;
  if (v17)
  {
    v34 = self;
    id v35 = v8;
    v19 = objc_opt_new();
    v20 = [v9 announcer];
    int v21 = [v20 isAccessory];

    v22 = [v9 announcer];
    v23 = [v22 homeKitID];
    if (v21)
    {
      v24 = objc_msgSend(v14, "hmu_accessoryWithUniqueIdentifierUUIDString:", v23);

      if (v24) {
        [v19 addAccessory:v24];
      }
    }
    else
    {
      v24 = objc_msgSend(v14, "hmu_userWithUniqueIdentifierUUIDString:", v23);

      if (v24) {
        [v19 addUser:v24 inHome:v14];
      }
    }
    v29 = v35;
    v33 = v37;

    [(ANMessenger *)v34 _sendAnnouncement:v17 toDestination:v19 sentHandler:v10];
  }
  else
  {
    uint64_t v25 = v18;
    v10[2](v10, 0, v18);
    v19 = +[ANAnalytics shared];
    v36 = v14;
    v26 = v10;
    uint64_t v27 = [v25 code];
    v28 = [v8 content];
    [v28 endpointIdentifier];
    char v30 = v29 = v8;
    v31 = +[ANAnalyticsContext contextWithEndpointID:v30];
    uint64_t v32 = v27;
    int v10 = v26;
    id v14 = v36;
    [v19 error:v32 context:v31];

    v33 = v37;
  }
}

- (void)broadcastReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v8 = a4;
  id v87 = a5;
  id v9 = [(ANMessenger *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    v94 = v10;
    _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Replying to Announcement: %@", buf, 0xCu);
  }
  v11 = +[ANHomeManager shared];
  v12 = [v8 location];
  uint64_t v13 = [v12 homeUUID];
  id v14 = [v11 homeForID:v13];

  v15 = [(ANMessenger *)self idsConnection];
  uint64_t v16 = [v15 service];
  id v17 = +[ANMessenger locationForReplyToAnnouncement:v8 home:v14 idsService:v16];

  id v90 = 0;
  id v18 = +[ANMessenger createAnnouncementWithRequest:v89 forLocation:v17 inHome:v14 isReply:1 error:&v90];
  id v19 = v90;
  v20 = v19;
  v88 = v8;
  if (!v18)
  {
    v39 = v87;
    (*((void (**)(id, void, id))v87 + 2))(v87, 0, v19);
    v22 = +[ANAnalytics shared];
    uint64_t v41 = [v20 code];
    v24 = [v89 content];
    id v37 = [v24 endpointIdentifier];
    v42 = +[ANAnalyticsContext contextWithEndpointID:v37];
    uint64_t v43 = v41;
    v40 = v20;
    [v22 error:v43 context:v42];

    goto LABEL_40;
  }
  id v86 = v19;
  int v21 = [v17 allRoomsInHome:v14];
  v22 = (void *)[v21 mutableCopy];

  v23 = [v18 announcer];
  v24 = [v23 homeKitID];

  if (v24)
  {
    uint64_t v25 = [v18 announcer];
    int v26 = [v25 isAccessory];

    if (v26)
    {
      uint64_t v27 = objc_msgSend(v14, "hmu_accessoryWithUniqueIdentifierUUIDString:", v24);
      v28 = [v27 room];

      if (v28)
      {
        v29 = [v17 roomUUIDs];
        char v30 = v24;
        id v31 = v8;
        uint64_t v32 = v22;
        v33 = (void *)[v29 mutableCopy];

        v34 = [v28 uniqueIdentifier];
        [v33 removeObject:v34];

        id v35 = (void *)[v33 copy];
        [v17 setRoomUUIDs:v35];

        [v32 removeObject:v28];
        v22 = v32;
        id v8 = v31;
        v24 = v30;
      }
    }
  }
  if (![v18 isRelayRequest])
  {
    uint64_t v44 = [v89 content];
    v45 = [v18 location];
    char v46 = [v45 flags];

    v85 = v22;
    if (v46)
    {
      v55 = [v44 homeKitUserIdentifier];

      if (v55
        && ([v44 homeKitUserIdentifier],
            v56 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "hmu_userWithUniqueIdentifier:", v56),
            uint64_t v57 = objc_claimAutoreleasedReturnValue(),
            v56,
            v57))
      {
        v84 = (void *)v57;
        uint64_t v92 = v57;
        uint64_t v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
      }
      else
      {
        v84 = 0;
        uint64_t v79 = MEMORY[0x1E4F1CBF0];
      }
      uint64_t v58 = +[ANHomeManager shared];
      v59 = [v58 currentAccessory];
      v81 = v44;
      if (v59)
      {
        v60 = [v44 endpointIdentifier];
        if (v60)
        {
          v61 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v77 = +[ANHomeManager shared];
          v65 = [v77 currentAccessory];
          v91 = v65;
          v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];

          v60 = 0;
        }
        uint64_t v64 = v24;
      }
      else
      {
        uint64_t v64 = v24;
        v61 = (void *)MEMORY[0x1E4F1CBF0];
      }

      v66 = [(ANMessenger *)self rapportConnection];
      __int16 v67 = (void *)v79;
      id v37 = +[ANMessengerDestination destinationForHome:v14 excludingUsers:v79 excludingAccessories:v61 rapportConnection:v66];

      v40 = v86;
      v24 = v64;
      uint64_t v44 = v81;
      v63 = v84;
      goto LABEL_37;
    }
    v83 = v24;
    v47 = (void *)[v22 copy];
    v48 = [(ANMessenger *)self rapportConnection];
    +[ANMessengerDestination destinationForAccessoriesInHome:v14 rooms:v47 rapportConnection:v48];
    id v37 = v49 = v8;

    v50 = [v49 announcer];
    v51 = [v50 homeKitUserID];

    v52 = [v49 announcer];
    id v53 = v52;
    v82 = self;
    if (v51)
    {
      uint64_t v54 = [v52 homeKitUserID];
    }
    else
    {
      uint64_t v62 = [v52 isAccessory];

      if (v62)
      {
        v63 = 0;
        v24 = v83;
        goto LABEL_32;
      }
      id v53 = [v88 announcer];
      uint64_t v54 = [v53 homeKitID];
    }
    uint64_t v68 = (void *)v54;
    v24 = v83;
    v63 = objc_msgSend(v14, "hmu_userWithUniqueIdentifierUUIDString:", v54);

LABEL_32:
    uint64_t v69 = [v44 homeKitUserIdentifier];
    if (v69)
    {
      v70 = (void *)v69;
      v80 = [v44 homeKitUserIdentifier];
      __int16 v71 = [v80 UUIDString];
      id v72 = [v88 announcer];
      [v72 homeKitUserID];
      uint64_t v73 = v17;
      v75 = v74 = v44;
      char v78 = [v71 isEqualToString:v75];

      uint64_t v44 = v74;
      id v17 = v73;

      v24 = v83;
      if (v78)
      {
        self = v82;
        v40 = v86;
LABEL_38:

LABEL_39:
        v76 = self;
        v39 = v87;
        [(ANMessenger *)v76 _sendAnnouncement:v18 toDestination:v37 sentHandler:v87];

        v22 = v85;
        goto LABEL_40;
      }
    }
    if (!v63)
    {
      self = v82;
      v40 = v86;
      goto LABEL_39;
    }
    self = v82;
    __int16 v67 = [(ANMessenger *)v82 rapportConnection];
    [v37 addUser:v63 inHome:v14 rapportConnection:v67];
    v40 = v86;
LABEL_37:

    goto LABEL_38;
  }
  v36 = [(ANMessenger *)self log];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA5ED000, v36, OS_LOG_TYPE_DEFAULT, "Sending (Reply) Relay Request", buf, 2u);
  }

  id v37 = (void *)[v22 copy];
  id v38 = self;
  v39 = v87;
  [(ANMessenger *)v38 _relayAnnouncementThroughHomePod:v18 inHome:v14 rooms:v37 sentHandler:v87];
  v40 = v86;
LABEL_40:
}

- (void)forwardAnnouncementToCompanion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ANMessenger *)self rapportConnection];
  BOOL v6 = [v5 devices];
  id v7 = [v6 pairedCompanion];

  if (v7 && [v7 supportsAnnounce])
  {
    id v8 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v9;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "Forwarding announcement to companion %@", buf, 0xCu);
    }
    int v10 = +[ANHomeManager shared];
    v11 = [v4 location];
    v12 = [v11 homeUUID];
    uint64_t v13 = [v10 homeForID:v12];

    if (v13)
    {
      id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "homeLocationStatus"));
      v15 = [v4 location];
      [v15 setHomeLocationStatus:v14];

      uint64_t v16 = [(ANMessenger *)self log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v13 homeLocationStatus];
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = v17;
        _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_INFO, "Inserted Home Location Status: %ld", buf, 0xCu);
      }

      id v18 = [v4 announcerNameInHome:v13];
      id v19 = ANLocalizedString();
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        int v21 = [v4 announcer];
        [v21 setName:v18];
      }
    }
    v22 = [(ANMessenger *)self rapportConnection];
    v23 = [v4 messageForCompanion];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__ANMessenger_forwardAnnouncementToCompanion___block_invoke;
    v26[3] = &unk_1E6BCDBB8;
    v26[4] = self;
    v24 = [v22 sendMessage:v23 device:v7 responseHandler:v26];

    if (v24)
    {
      uint64_t v25 = [(ANMessenger *)self log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        [(ANMessenger *)v7 forwardAnnouncementToCompanion:v25];
      }
    }
  }
}

void __46__ANMessenger_forwardAnnouncementToCompanion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "Announcement forwarded to companion over rapport: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)mockAnnouncement:(id)a3 playbackDeadline:(id)a4 sentHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *, void))a5;
  v11 = [v8 destination];
  v12 = [v11 home];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F4A908]);
    id v14 = [v12 uniqueIdentifier];
    v15 = (void *)[v13 initWithHomeID:v14];

    [v15 setFlags:1];
    id v31 = 0;
    uint64_t v16 = +[ANMessenger createAnnouncementWithRequest:v8 forLocation:v15 inHome:v12 isReply:1 error:&v31];
    id v17 = v31;
    if (v16)
    {
      [v16 setPlaybackDeadline:v9];
      id v18 = [v16 playbackDeadline];

      if (!v18)
      {
        id v19 = (void *)MEMORY[0x1E4F1C9C8];
        [(ANMessenger *)self _calculateAnnouncementDeadline:v16];
        double v21 = v20;
        v22 = [MEMORY[0x1E4F1C9C8] date];
        v23 = [v19 dateWithTimeInterval:v22 sinceDate:v21];
        [v16 setPlaybackDeadline:v23];
      }
      v24 = [MEMORY[0x1E4F4A930] senderWithID:&stru_1F34A0E10 type:0];
      [v16 setSender:v24];

      id v25 = objc_alloc(MEMORY[0x1E4F4A8A8]);
      int v26 = [v16 message];
      uint64_t v27 = (void *)[v25 initWithMessage:v26];

      uint64_t v28 = [(ANMessenger *)self log];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[ANMessenger mockAnnouncement:playbackDeadline:sentHandler:]";
        __int16 v34 = 2112;
        id v35 = v27;
        _os_log_impl(&dword_1DA5ED000, v28, OS_LOG_TYPE_DEFAULT, "%s: Sending announcement: %@", buf, 0x16u);
      }

      uint64_t v29 = [(ANMessenger *)self delegate];
      [v29 receivedAnnouncement:v27];

      v10[2](v10, v27, 0);
    }
    else
    {
      ((void (**)(id, void *, id))v10)[2](v10, 0, v17);
    }
  }
  else
  {
    char v30 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1002, *MEMORY[0x1E4F4A728]);
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v30);
  }
}

- (void)_relayAnnouncementThroughHomePod:(id)a3 inHome:(id)a4 rooms:(id)a5 sentHandler:(id)a6
{
  id v10 = a3;
  v11 = (void (**)(id, void, id))a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(ANMessenger *)self rapportConnection];
  id v17 = 0;
  v15 = +[ANMessengerDestination relayDestinationForHome:v13 rooms:v12 rapportConnection:v14 error:&v17];

  id v16 = v17;
  if (v15)
  {
    [(ANMessenger *)self _sendAnnouncement:v10 toDestination:v15 sentHandler:v11];
  }
  else
  {
    v11[2](v11, 0, v16);

    v11 = +[ANAnalytics shared];
    objc_msgSend(v11, "error:", objc_msgSend(v16, "code"));
  }
}

- (double)_calculateAnnouncementDeadline:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v6 = [v5 numberForDefault:*MEMORY[0x1E4F4A5A0]];
  [v6 doubleValue];
  double v8 = v7;

  id v9 = [v4 fileData];

  if (v9)
  {
    id v10 = [v4 fileData];
    unint64_t v11 = [v10 length];

    id v12 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      id v16 = "-[ANMessenger _calculateAnnouncementDeadline:]";
      __int16 v17 = 2048;
      double v18 = (double)(v11 >> 10);
      __int16 v19 = 2048;
      double v20 = v8;
      _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%s: Calculate announcement deadline. fileSize: %f defaultDeadline: %f", (uint8_t *)&v15, 0x20u);
    }

    if ((v11 - 204800) >> 10 >= 0x65)
    {
      if (v11 < 0x32000) {
        double v8 = v8 + -0.5;
      }
      else {
        double v8 = v8 + 0.5;
      }
    }
  }
  else
  {
    id v13 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ANMessenger _calculateAnnouncementDeadline:](v13, v8);
    }
  }
  return v8;
}

- (void)_fulfillRelayRequest:(id)a3 withSenderContext:(id)a4 sentHandler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 action];
  if (v9 == 4)
  {
    uint64_t v10 = 2;
  }
  else
  {
    if (v9 != 5) {
      goto LABEL_6;
    }
    uint64_t v10 = 3;
  }
  [v7 setAction:v10];
LABEL_6:
  unint64_t v11 = +[ANHomeManager shared];
  id v12 = [v7 location];
  id v13 = [v12 homeUUID];
  id v14 = [v11 homeForID:v13];

  int v15 = [v7 location];
  if ([v15 flags])
  {
    __int16 v19 = [v7 announcer];
    double v20 = [v19 homeKitID];
    id v16 = objc_msgSend(v14, "hmu_userWithUniqueIdentifierUUIDString:", v20);

    if (v16)
    {
      v31[0] = v16;
      __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    }
    else
    {
      __int16 v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v21 = [(ANMessenger *)self rapportConnection];
    uint64_t v22 = MEMORY[0x1E4F1CBF0];
    double v18 = +[ANMessengerDestination destinationForHome:v14 excludingUsers:v17 excludingAccessories:MEMORY[0x1E4F1CBF0] rapportConnection:v21];

    objc_msgSend(v15, "setFlags:", objc_msgSend(v15, "flags") & 0xFFFFFFFFFFFFFFFDLL);
    objc_msgSend(v15, "setFlags:", objc_msgSend(v15, "flags") & 0xFFFFFFFFFFFFFFFBLL);
    [v15 setUserUUIDs:v22];
    [v15 setDeviceIDs:v22];
  }
  else
  {
    id v16 = [v15 allRoomsInHome:v14];
    __int16 v17 = [(ANMessenger *)self rapportConnection];
    double v18 = +[ANMessengerDestination destinationForAccessoriesInHome:v14 rooms:v16 rapportConnection:v17];
  }

  v23 = (void *)MEMORY[0x1E4F1C9C8];
  [(ANMessenger *)self _calculateAnnouncementDeadline:v7];
  double v25 = v24;
  int v26 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v27 = [v23 dateWithTimeInterval:v26 sinceDate:v25];
  [v7 setPlaybackDeadline:v27];

  id v30 = 0;
  objc_msgSend(v7, "processAudioWithEffects:error:", objc_msgSend(MEMORY[0x1E4F4A8A8], "defaultAudioEffects"), &v30);
  id v28 = v30;
  if (v28)
  {
    uint64_t v29 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ANMessenger _fulfillRelayRequest:withSenderContext:sentHandler:]();
    }
  }
  [(ANMessenger *)self _sendAnnouncement:v7 toDestination:v18 sentHandler:v8];
}

- (void)_forwardRelayRequest:(id)a3 withSenderContext:(id)a4 sentHandler:(id)a5
{
  id v26 = a3;
  id v7 = (void (**)(id, id, void *))a5;
  id v8 = [(ANMessenger *)self rapportConnection];
  uint64_t v9 = [v8 devices];
  uint64_t v10 = [v9 pairedCompanion];

  unint64_t v11 = [v26 sender];
  id v12 = v11;
  if (v10 && v11)
  {
    id v13 = [v11 identifier];
    id v14 = [v10 idsDeviceIdentifier];
    char v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      id v16 = +[ANHomeManager shared];
      __int16 v17 = [v26 location];
      double v18 = [v17 homeUUID];
      __int16 v19 = [v16 homeForID:v18];

      double v20 = [v26 location];
      uint64_t v21 = [v20 allRoomsInHome:v19];

      [(ANMessenger *)self _relayAnnouncementThroughHomePod:v26 inHome:v19 rooms:v21 sentHandler:v7];
    }
    else
    {
      uint64_t v22 = NSString;
      v23 = [v12 identifier];
      double v24 = [v10 identifier];
      __int16 v19 = [v22 stringWithFormat:@"Sender is not companion: %@ != %@", v23, v24];

      double v25 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E4F4A728], v19);
      v7[2](v7, v26, v25);
    }
  }
  else
  {
    __int16 v19 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E4F4A728], @"Unable to validate sender");
    v7[2](v7, v26, v19);
  }
}

- (void)_sendAnnouncement:(id)a3 toDestination:(id)a4 sentHandler:(id)a5
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  v145 = v9;
  unint64_t v11 = [v9 home];
  [(ANMessenger *)self _logDebugInfoForHome:v11];

  id v12 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v13 = [v12 BOOLForDefault:*MEMORY[0x1E4F4A650]];

  if (v13)
  {
    id v14 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ANMessenger _sendAnnouncement:toDestination:sentHandler:]();
    }

    char v15 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1036, *MEMORY[0x1E4F4A728], @"Force Send Failure Enabled in User Defaults");
    v10[2](v10, 0, v15);
    goto LABEL_89;
  }
  id v16 = [v8 playbackDeadline];

  if (!v16)
  {
    __int16 v17 = (void *)MEMORY[0x1E4F1C9C8];
    [(ANMessenger *)self _calculateAnnouncementDeadline:v8];
    double v19 = v18;
    double v20 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v21 = [v17 dateWithTimeInterval:v20 sinceDate:v19];
    [v8 setPlaybackDeadline:v21];
  }
  uint64_t v22 = [(ANMessenger *)self idsConnection];
  v23 = [v22 service];
  double v24 = [v9 participantsWithService:v23];
  [v8 setListeners:v24];

  double v25 = [v8 listeners];
  uint64_t v26 = [v25 count];

  uint64_t v27 = +[ANHomeManager shared];
  id v28 = [v27 currentAccessory];

  if (!v26)
  {
    if (v28)
    {
      uint64_t v32 = [v8 location];
      if ([v32 flags])
      {
        v124 = [v9 home];
        v125 = [v124 usersIncludingCurrentUserWithAnnounceEnabled];
        uint64_t v126 = [v125 count];

        if (v126) {
          uint64_t v31 = 1009;
        }
        else {
          uint64_t v31 = 1043;
        }
        goto LABEL_86;
      }
    }
    uint64_t v31 = 1009;
LABEL_86:
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F4A728];
    goto LABEL_87;
  }
  if (v28)
  {
    if (![(ANMessenger *)self _willTargetReachableDevicesForAnnouncement:v8 inDestination:v9])
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F4A728];
      uint64_t v31 = 1009;
LABEL_87:
      char v15 = objc_msgSend(v29, "an_errorWithCode:component:", v31, v30);
      v10[2](v10, 0, v15);
      v127 = +[ANAnalytics shared];
      uint64_t v128 = [v15 code];
      v129 = [v8 announcer];
      v130 = +[ANAnalyticsContext contextWithAnnouncer:v129];
      [v127 error:v128 context:v130];

LABEL_88:
LABEL_89:

      goto LABEL_90;
    }
  }
  else if ([v8 isRelayRequest])
  {
    v33 = [v9 accessories];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      id v35 = [v9 accessories];
      v168[0] = MEMORY[0x1E4F143A8];
      v168[1] = 3221225472;
      v168[2] = __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke;
      v168[3] = &unk_1E6BCDBE0;
      v168[4] = self;
      char v15 = objc_msgSend(v35, "hmu_compactMap:", v168);

      if (![v15 count])
      {
        v131 = [(ANMessenger *)self log];
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
          -[ANMessenger _sendAnnouncement:toDestination:sentHandler:](v9, v131);
        }

        v127 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1009, *MEMORY[0x1E4F4A728]);
        v10[2](v10, 0, v127);
        v132 = +[ANAnalytics shared];
        objc_msgSend(v132, "error:", objc_msgSend(v127, "code"));

        goto LABEL_88;
      }
    }
  }
  uint64_t v36 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  id v37 = [v36 numberForDefault:*MEMORY[0x1E4F4A6C8]];
  [v37 doubleValue];
  double v39 = v38;

  v40 = [MEMORY[0x1E4F4A950] sharedManager];
  [v40 transaction:*MEMORY[0x1E4F4A878] setActiveForTimeInterval:v39];

  uint64_t v41 = [(ANMessenger *)self log];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v172 = v8;
    _os_log_impl(&dword_1DA5ED000, v41, OS_LOG_TYPE_DEFAULT, "Sending Message: %@", buf, 0xCu);
  }
  v133 = v10;

  v42 = [(ANMessenger *)self log];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = [v8 listeners];
    uint64_t v44 = [v43 count];
    *(_DWORD *)buf = 134217984;
    *(void *)v172 = v44;
    _os_log_impl(&dword_1DA5ED000, v42, OS_LOG_TYPE_DEFAULT, "Sending To %lu Participants", buf, 0xCu);
  }
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  v45 = [v8 listeners];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v164 objects:v174 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v165;
    int v49 = 1;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v165 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v164 + 1) + 8 * i);
        v52 = [(ANMessenger *)self log];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v172 = v49 + i;
          *(_WORD *)&v172[4] = 2112;
          *(void *)&v172[6] = v51;
          _os_log_impl(&dword_1DA5ED000, v52, OS_LOG_TYPE_DEFAULT, "Participant %d: %@", buf, 0x12u);
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v164 objects:v174 count:16];
      v49 += i;
    }
    while (v47);
  }

  id v53 = [v8 announcer];
  v143 = +[ANAnalyticsContext contextWithAnnouncer:v53];

  uint64_t v54 = [v145 devices];
  uint64_t v142 = [v54 count];

  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  obuint64_t j = [v145 devices];
  uint64_t v55 = [obj countByEnumeratingWithState:&v160 objects:v173 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    int v144 = 0;
    uint64_t v139 = *(void *)v161;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v161 != v139) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = *(void **)(*((void *)&v160 + 1) + 8 * j);
        v59 = [v145 home];
        v60 = +[ANMessenger announcementForDevice:v58 inHome:v59 fromAnnouncement:v8];
        v61 = [v60 message];

        uint64_t v62 = [(ANMessenger *)self rapportConnection];
        v154[0] = MEMORY[0x1E4F143A8];
        v154[1] = 3221225472;
        v154[2] = __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke_44;
        v154[3] = &unk_1E6BCDC08;
        id v155 = v8;
        v156 = self;
        id v157 = v145;
        uint64_t v159 = v142;
        id v158 = v143;
        v63 = [v62 sendMessage:v61 device:v58 responseHandler:v154];

        if (v63)
        {
          uint64_t v64 = [(ANMessenger *)self log];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v65 = [v58 name];
            *(_DWORD *)buf = 138412546;
            *(void *)v172 = v65;
            *(_WORD *)&v172[8] = 2112;
            *(void *)&v172[10] = v63;
            _os_log_error_impl(&dword_1DA5ED000, v64, OS_LOG_TYPE_ERROR, "Failed to send Message for Device %@: %@", buf, 0x16u);
          }
          ++v144;
        }
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v160 objects:v173 count:16];
    }
    while (v56);
  }
  else
  {
    int v144 = 0;
  }

  v66 = [v145 users];
  obja = (char *)[v66 count];

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v135 = [v145 users];
  uint64_t v67 = [v135 countByEnumeratingWithState:&v150 objects:v170 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v140 = *(void *)v151;
    do
    {
      for (uint64_t k = 0; k != v68; ++k)
      {
        if (*(void *)v151 != v140) {
          objc_enumerationMutation(v135);
        }
        v70 = *(void **)(*((void *)&v150 + 1) + 8 * k);
        __int16 v71 = objc_msgSend(v70, "hmu_idsDestination");
        if (v71)
        {
          id v72 = [v145 home];
          uint64_t v73 = +[ANMessenger announcementForUser:v70 inHome:v72 fromAnnouncement:v8];
          v74 = [v73 message];

          v75 = [(ANMessenger *)self idsConnection];
          v76 = [v8 identifier];
          v77 = [v75 sendMessage:v74 messageUUIDString:v76 destination:v71];

          char v78 = [MEMORY[0x1E4F1C9C8] now];
          uint64_t v79 = [v8 creationTimestamp];
          [v78 timeIntervalSinceDate:v79];
          double v81 = v80;

          v82 = [(ANMessenger *)self log];
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(double *)v172 = v81;
            *(_WORD *)&v172[8] = 2112;
            *(void *)&v172[10] = v71;
            _os_log_impl(&dword_1DA5ED000, v82, OS_LOG_TYPE_INFO, "Took %f sec to send over IDS to %@", buf, 0x16u);
          }

          if (v77)
          {
            v83 = [(ANMessenger *)self log];
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              id v87 = [v70 userID];
              *(_DWORD *)buf = 138412546;
              *(void *)v172 = v87;
              *(_WORD *)&v172[8] = 2112;
              *(void *)&v172[10] = v77;
              _os_log_error_impl(&dword_1DA5ED000, v83, OS_LOG_TYPE_ERROR, "Failed to send Message for User %@: %@", buf, 0x16u);
            }
            ++v144;
          }
          v84 = +[ANAnalytics shared];
          v85 = [v145 home];
          id v86 = [v85 uniqueIdentifier];
          objc_msgSend(v84, "announcementSent:inHome:withError:withTime:sendType:ofGroupCount:context:", v8, v86, objc_msgSend(v77, "code"), 2, obja, v143, v81);
        }
      }
      uint64_t v68 = [v135 countByEnumeratingWithState:&v150 objects:v170 count:16];
    }
    while (v68);
  }

  v88 = [v145 accessories];
  uint64_t v136 = [v88 count];

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  v134 = [v145 accessories];
  uint64_t v89 = [v134 countByEnumeratingWithState:&v146 objects:v169 count:16];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v141 = *(void *)v147;
    do
    {
      for (uint64_t m = 0; m != v90; ++m)
      {
        if (*(void *)v147 != v141) {
          objc_enumerationMutation(v134);
        }
        uint64_t v92 = *(void **)(*((void *)&v146 + 1) + 8 * m);
        v93 = [(ANMessenger *)self idsConnection];
        v94 = [v93 service];
        uint64_t v95 = objc_msgSend(v92, "hmu_destinationForService:", v94);

        v96 = [v95 destinationURIs];
        uint64_t v97 = [v96 count];

        if (v97)
        {
          v98 = [v145 home];
          v99 = +[ANMessenger announcementForAccessory:v92 inHome:v98 fromAnnouncement:v8];
          v100 = [v99 message];

          v101 = [(ANMessenger *)self idsConnection];
          v102 = [v8 identifier];
          v103 = [v101 sendMessage:v100 messageUUIDString:v102 destination:v95];

          v104 = [MEMORY[0x1E4F1C9C8] now];
          v105 = [v8 creationTimestamp];
          [v104 timeIntervalSinceDate:v105];
          double v107 = v106;

          v108 = [(ANMessenger *)self log];
          if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(double *)v172 = v107;
            *(_WORD *)&v172[8] = 2112;
            *(void *)&v172[10] = v95;
            _os_log_impl(&dword_1DA5ED000, v108, OS_LOG_TYPE_INFO, "Took %f sec to send over IDS to %@", buf, 0x16u);
          }

          if (v103)
          {
            v109 = [(ANMessenger *)self log];
            if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
            {
              v113 = [v92 name];
              *(_DWORD *)buf = 138412546;
              *(void *)v172 = v113;
              *(_WORD *)&v172[8] = 2112;
              *(void *)&v172[10] = v103;
              _os_log_error_impl(&dword_1DA5ED000, v109, OS_LOG_TYPE_ERROR, "Failed to send Message for User %@: %@", buf, 0x16u);
            }
            ++v144;
          }
          v110 = +[ANAnalytics shared];
          v111 = [v145 home];
          v112 = [v111 uniqueIdentifier];
          objc_msgSend(v110, "announcementSent:inHome:withError:withTime:sendType:ofGroupCount:context:", v8, v112, objc_msgSend(v103, "code"), 3, v136, v143, v107);
        }
        else
        {
          if (objc_msgSend(v92, "hmu_isEndpoint")) {
            goto LABEL_77;
          }
          v100 = [(ANMessenger *)self log];
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            v114 = [v92 name];
            v115 = [v92 uniqueIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)v172 = v114;
            *(_WORD *)&v172[8] = 2112;
            *(void *)&v172[10] = v115;
            _os_log_error_impl(&dword_1DA5ED000, v100, OS_LOG_TYPE_ERROR, "No IDS URI for Accessory: %@, %@", buf, 0x16u);
          }
        }

LABEL_77:
      }
      uint64_t v90 = [v134 countByEnumeratingWithState:&v146 objects:v169 count:16];
    }
    while (v90);
  }

  uint64_t v10 = v133;
  ((void (**)(id, id, void *))v133)[2](v133, v8, 0);
  v116 = [MEMORY[0x1E4F1C9C8] now];
  v117 = [v8 creationTimestamp];
  [v116 timeIntervalSinceDate:v117];
  double v119 = v118;

  if (v144 <= 0) {
    uint64_t v120 = 0;
  }
  else {
    uint64_t v120 = 5000;
  }
  v121 = +[ANAnalytics shared];
  v122 = [v145 home];
  v123 = [v122 uniqueIdentifier];
  [v121 announcementSent:v8 inHome:v123 withError:v120 withTime:0 sendType:&obja[v142 + v136] ofGroupCount:v143 context:v119];

LABEL_90:
}

id __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v4 = [*(id *)(a1 + 32) idsConnection];
  int v5 = [v4 service];
  id v6 = [v3 IDSDestinationForIDSService:v5];
  id v7 = [v6 destinationURIs];
  id v8 = [v7 anyObject];

  return v8;
}

void __59__ANMessenger__sendAnnouncement_toDestination_sentHandler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v8 = [v6 now];
  id v9 = [*(id *)(a1 + 32) creationTimestamp];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  id v12 = [*(id *)(a1 + 40) log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v18 = 134218242;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_INFO, "Took %f sec to send over rapport to %@", (uint8_t *)&v18, 0x16u);
  }

  int v13 = +[ANAnalytics shared];
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = [*(id *)(a1 + 48) home];
  id v16 = [v15 uniqueIdentifier];
  uint64_t v17 = [v7 code];

  [v13 announcementSent:v14 inHome:v16 withError:v17 withTime:1 sendType:*(void *)(a1 + 64) ofGroupCount:*(void *)(a1 + 56) context:v11];
}

- (BOOL)_willTargetReachableDevicesForAnnouncement:(id)a3 inDestination:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 location];
  if ([v7 flags] & 1) != 0 || (objc_msgSend(v5, "isRelayType"))
  {
  }
  else
  {
    uint64_t v10 = [v5 action];

    if (v10 != 1)
    {
      double v11 = [v6 home];
      id v12 = [v5 location];
      int v13 = [v12 allRoomsInHome:v11];

      uint64_t v14 = (void *)MEMORY[0x1E4F2E4F8];
      char v15 = objc_msgSend(MEMORY[0x1E4F2EA80], "hmu_accessoriesInRooms:", v13);
      id v16 = [v14 announceAccessoriesWithAnnounceEnabledFromAccessories:v15];

      uint64_t v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_0);
      int v18 = [v6 devices];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __72__ANMessenger__willTargetReachableDevicesForAnnouncement_inDestination___block_invoke_2;
      v21[3] = &unk_1E6BCDC50;
      id v22 = v17;
      id v19 = v17;
      __int16 v20 = objc_msgSend(v18, "na_firstObjectPassingTest:", v21);

      BOOL v8 = v20 != 0;
      goto LABEL_5;
    }
  }
  BOOL v8 = 1;
LABEL_5:

  return v8;
}

uint64_t __72__ANMessenger__willTargetReachableDevicesForAnnouncement_inDestination___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __72__ANMessenger__willTargetReachableDevicesForAnnouncement_inDestination___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 homeKitIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)getScanningDeviceCandidates
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [(ANMessenger *)self idsConnection];
  id v5 = [v4 service];
  id v6 = [v5 devices];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v11 isHomePod] & 1) == 0)
        {
          id v12 = [v11 nsuuid];

          if (v12)
          {
            int v13 = [v11 nsuuid];
            uint64_t v14 = [v13 UUIDString];
            [v3 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  char v15 = [(ANMessenger *)self log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_INFO, "Coordinated Alerts Announce device candidates: %@", buf, 0xCu);
  }

  id v16 = (void *)[v3 copy];
  return v16;
}

- (void)_logDebugInfoForHome:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__ANMessenger__logDebugInfoForHome___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__ANMessenger__logDebugInfoForHome___block_invoke(uint64_t a1)
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v1 = (void *)MEMORY[0x1E4F2E4F8];
  id v2 = [*(id *)(a1 + 32) accessories];
  id v3 = [v1 announceAccessoriesFromAccessories:v2];

  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v110 objects:v136 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v111;
    do
    {
      uint64_t v7 = 0;
      uint64_t v85 = v5;
      do
      {
        if (*(void *)v111 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v110 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 40) log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 name];
          double v11 = [v8 room];
          id v12 = [v11 name];
          int v13 = [v8 uniqueIdentifier];
          uint64_t v14 = v6;
          char v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "supportsAnnounce"));
          id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "an_isAnnounceEnabled"));
          *(_DWORD *)buf = 138413314;
          id v118 = v10;
          __int16 v119 = 2112;
          uint64_t v120 = v12;
          __int16 v121 = 2112;
          v122 = v13;
          __int16 v123 = 2112;
          v124 = v15;
          __int16 v125 = 2112;
          uint64_t v126 = v16;
          _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "[Accessory] Name: %@, Room: %@, HomeKitID: %@, Announce Supported: %@, Announced Enabled: %@", buf, 0x34u);

          uint64_t v6 = v14;
          uint64_t v5 = v85;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v110 objects:v136 count:16];
    }
    while (v5);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v17 = [*(id *)(a1 + 40) rapportConnection];
  long long v18 = [v17 devices];
  long long v19 = [v18 activeDevicesSupportingAnnounce];

  id v81 = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v106 objects:v135 count:16];
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v107;
    *(void *)&long long v21 = 138414338;
    long long v77 = v21;
    uint64_t v78 = *(void *)v107;
    do
    {
      uint64_t v24 = 0;
      uint64_t v79 = v22;
      do
      {
        if (*(void *)v107 != v23) {
          objc_enumerationMutation(v81);
        }
        uint64_t v25 = *(void **)(*((void *)&v106 + 1) + 8 * v24);
        uint64_t v26 = objc_msgSend(*(id *)(a1 + 40), "log", v77);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id objc = [v25 name];
          id v86 = [v25 identifier];
          uint64_t v27 = [v25 idsDeviceIdentifier];
          id v28 = [v25 homeKitIdentifier];
          v83 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v25, "flags"));
          uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "statusFlags"));
          uint64_t v30 = [v25 model];
          int v31 = [v25 supportsAnnounce];
          uint64_t v32 = [v25 homeKitUserIdentifiers];
          *(_DWORD *)buf = v77;
          id v118 = objc;
          __int16 v119 = 2112;
          uint64_t v120 = v86;
          __int16 v121 = 2112;
          v122 = v27;
          __int16 v123 = 2112;
          v124 = v28;
          __int16 v125 = 2112;
          uint64_t v126 = v83;
          __int16 v127 = 2112;
          uint64_t v128 = v29;
          __int16 v129 = 2112;
          v130 = v30;
          __int16 v131 = 1024;
          int v132 = v31;
          __int16 v133 = 2112;
          v134 = v32;
          _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "[RPDevice] Name: %@, RapportID: %@, IDSDeviceID: %@, HomeKitID: %@, Flags: %@, Status Flags: %@, Model: %@, Announce Supported: %d, HomeKitUserIDs: %@", buf, 0x58u);

          uint64_t v23 = v78;
          uint64_t v22 = v79;
        }
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v81 countByEnumeratingWithState:&v106 objects:v135 count:16];
    }
    while (v22);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v33 = [*(id *)(a1 + 40) rapportConnection];
  uint64_t v34 = [v33 devices];
  id v35 = [v34 activeDevicesSupportingAnnounce];
  uint64_t v36 = [v35 devicesInHome:*(void *)(a1 + 32)];

  v84 = v36;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v102 objects:v116 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v103;
    uint64_t v80 = *(void *)v103;
    do
    {
      uint64_t v40 = 0;
      id v82 = (id)v38;
      do
      {
        if (*(void *)v103 != v39) {
          objc_enumerationMutation(v84);
        }
        uint64_t v41 = *(void **)(*((void *)&v102 + 1) + 8 * v40);
        v42 = [*(id *)(a1 + 40) log];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          id objd = [v41 name];
          id v87 = [v41 identifier];
          uint64_t v43 = [v41 idsDeviceIdentifier];
          uint64_t v44 = [v41 homeKitIdentifier];
          v45 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v41, "flags"));
          uint64_t v46 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v41, "statusFlags"));
          uint64_t v47 = [v41 model];
          int v48 = [v41 supportsAnnounce];
          int v49 = [v41 homeKitUserIdentifiers];
          *(_DWORD *)buf = 138414338;
          id v118 = objd;
          __int16 v119 = 2112;
          uint64_t v120 = v87;
          __int16 v121 = 2112;
          v122 = v43;
          __int16 v123 = 2112;
          v124 = v44;
          __int16 v125 = 2112;
          uint64_t v126 = v45;
          __int16 v127 = 2112;
          uint64_t v128 = v46;
          __int16 v129 = 2112;
          v130 = v47;
          __int16 v131 = 1024;
          int v132 = v48;
          __int16 v133 = 2112;
          v134 = v49;
          _os_log_impl(&dword_1DA5ED000, v42, OS_LOG_TYPE_DEFAULT, "[RPDevice Device In Home] Name: %@, RapportID: %@, IDSDeviceID: %@, HomeKitID: %@, Flags: %@, Status Flags: %@, Model: %@, Announce Supported: %d, HomeKitUserIDs: %@", buf, 0x58u);

          uint64_t v39 = v80;
          uint64_t v38 = (uint64_t)v82;
        }
        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [v84 countByEnumeratingWithState:&v102 objects:v116 count:16];
    }
    while (v38);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "hmu_allUsersIncludingCurrentUser");
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = [obja countByEnumeratingWithState:&v98 objects:v115 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v99 != v52) {
          objc_enumerationMutation(obja);
        }
        uint64_t v54 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        uint64_t v55 = [*(id *)(a1 + 40) log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v56 = [v54 userID];
          uint64_t v57 = [v54 userIDSURI];
          uint64_t v58 = [v57 unprefixedURI];
          v59 = [v54 senderCorrelationIdentifier];
          int v60 = [*(id *)(a1 + 32) announceAccessAllowedForUser:v54];
          *(_DWORD *)buf = 138413058;
          id v118 = v56;
          __int16 v119 = 2112;
          uint64_t v120 = v58;
          __int16 v121 = 2112;
          v122 = v59;
          __int16 v123 = 1024;
          LODWORD(v124) = v60;
          _os_log_impl(&dword_1DA5ED000, v55, OS_LOG_TYPE_DEFAULT, "[HMUser] UserID: %@, IDSURI: %@, SenderCorrID: %@, Announce Enabled: %d", buf, 0x26u);
        }
      }
      uint64_t v51 = [obja countByEnumeratingWithState:&v98 objects:v115 count:16];
    }
    while (v51);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v61 = [*(id *)(a1 + 40) idsConnection];
  uint64_t v62 = [v61 service];
  v63 = [v62 devices];

  id objb = v63;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v94 objects:v114 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v65; ++j)
      {
        if (*(void *)v95 != v66) {
          objc_enumerationMutation(objb);
        }
        uint64_t v68 = *(void **)(*((void *)&v94 + 1) + 8 * j);
        uint64_t v69 = [*(id *)(a1 + 40) log];
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v70 = [v68 name];
          __int16 v71 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v68, "isHomePod"));
          id v72 = [v68 uniqueID];
          uint64_t v73 = [v68 uniqueIDOverride];
          v74 = [v68 modelIdentifier];
          *(_DWORD *)buf = 138413314;
          id v118 = v70;
          __int16 v119 = 2112;
          uint64_t v120 = v71;
          __int16 v121 = 2112;
          v122 = v72;
          __int16 v123 = 2112;
          v124 = v73;
          __int16 v125 = 2112;
          uint64_t v126 = v74;
          _os_log_impl(&dword_1DA5ED000, v69, OS_LOG_TYPE_DEFAULT, "[IDS Device] Name: %@, isHomePod: %@, Unique ID: %@, Unique ID Override: %@, Model: %@", buf, 0x34u);
        }
      }
      uint64_t v65 = [objb countByEnumeratingWithState:&v94 objects:v114 count:16];
    }
    while (v65);
  }

  v75 = [*(id *)(a1 + 40) log];
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    v76 = (void *)IDSCopyLocalDeviceUniqueID();
    *(_DWORD *)buf = 138412290;
    id v118 = v76;
    _os_log_impl(&dword_1DA5ED000, v75, OS_LOG_TYPE_DEFAULT, "[IDS Local Device] UniqueID: %@", buf, 0xCu);
  }
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4 fromSender:(id)a5 senderContext:(id)a6 handler:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(ANMessenger *)self log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v65 = *(double *)&v14;
    __int16 v66 = 2112;
    uint64_t v67 = v13;
    _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "Received Message From (%@): %@", buf, 0x16u);
  }

  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F4A8A8]) initWithMessage:v13];
  if (v18)
  {
    long long v19 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v20 = [v18 creationTimestamp];
    [v19 timeIntervalSinceDate:v20];
    double v22 = v21;

    [v18 setSender:v14];
    uint64_t v23 = +[ANValidationHelper performBasicValidationForAnnouncement:v18 type:1];
    int v60 = (void (**)(void, void))v16;
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      uint64_t v25 = v13;
      id v26 = v14;
      id v27 = v12;
      id v28 = v15;
      uint64_t v29 = [(ANMessenger *)self log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.5();
      }

      uint64_t v30 = +[ANAnalytics shared];
      uint64_t v31 = [v24 code];
      uint64_t v32 = [v18 announcer];
      v33 = +[ANAnalyticsContext contextWithAnnouncer:v32];
      [v30 error:v31 context:v33];

      goto LABEL_8;
    }
    id v36 = [(ANMessenger *)self idsConnection];

    if (v36 == v12)
    {
      uint64_t v43 = +[ANMessenger performIDSValidationForAnnouncement:v18 withSenderContext:v15];
      if (v43)
      {
        uint64_t v24 = (void *)v43;
        uint64_t v25 = v13;
        id v26 = v14;
        id v27 = v12;
        id v28 = v15;
        uint64_t v44 = [(ANMessenger *)self log];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:]();
        }
        goto LABEL_24;
      }
    }
    else
    {
      id v37 = [(ANMessenger *)self rapportConnection];

      if (v37 != v12)
      {
        id v59 = v15;
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 5018, *MEMORY[0x1E4F4A728]);
        uint64_t v38 = [(ANMessenger *)self log];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:].cold.4();
        }

        uint64_t v39 = +[ANAnalytics shared];
        uint64_t v40 = [v24 code];
        uint64_t v41 = [v18 announcer];
        v42 = +[ANAnalyticsContext contextWithAnnouncer:v41];
        [v39 error:v40 context:v42];

        id v16 = v60;
        ((void (**)(void, void *))v60)[2](v60, v24);
        id v15 = v59;
        goto LABEL_12;
      }
      uint64_t v45 = +[ANMessenger performRapportValidationForAnnouncement:v18 withSenderContext:v15];
      if (v45)
      {
        uint64_t v24 = (void *)v45;
        uint64_t v25 = v13;
        id v26 = v14;
        id v27 = v12;
        id v28 = v15;
        uint64_t v44 = [(ANMessenger *)self log];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:]();
        }
LABEL_24:

        uint64_t v46 = +[ANAnalytics shared];
        uint64_t v47 = [v24 code];
        int v48 = [v18 announcer];
        int v49 = +[ANAnalyticsContext contextWithAnnouncer:v48];
        [v46 error:v47 context:v49];

LABEL_8:
        id v16 = v60;
        ((void (**)(void, void *))v60)[2](v60, v24);
        id v15 = v28;
        id v12 = v27;
        id v14 = v26;
        int v13 = v25;
        goto LABEL_12;
      }
    }
    uint64_t v50 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      id v51 = [(ANMessenger *)self rapportConnection];
      uint64_t v52 = @"IDS";
      if (v51 == v12) {
        uint64_t v52 = @"rapport";
      }
      *(_DWORD *)buf = 134218242;
      double v65 = v22;
      __int16 v66 = 2112;
      uint64_t v67 = v52;
      _os_log_impl(&dword_1DA5ED000, v50, OS_LOG_TYPE_INFO, "Received Message took %f over %@", buf, 0x16u);
    }
    if (![MEMORY[0x1E4F4A8E8] isPhone] || (objc_msgSend(v18, "isRelayRequest") & 1) == 0)
    {
      id v53 = [v18 announcer];
      uint64_t v54 = +[ANAnalyticsContext contextWithAnnouncer:v53];

      uint64_t v55 = +[ANAnalytics shared];
      id v56 = [(ANMessenger *)self rapportConnection];
      [v55 announcementReceived:v18 withTime:v56 != v12 receiveTimeType:v54 context:v22];
    }
    uint64_t v57 = +[ANHomeManager shared];
    uint64_t v24 = [v57 currentAccessory];

    if (([v18 action] & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      id v16 = v60;
      if (!v24)
      {
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke;
        v62[3] = &unk_1E6BCDCA0;
        v62[4] = self;
        v63 = v60;
        [(ANMessenger *)self _forwardRelayRequest:v18 withSenderContext:v15 sentHandler:v62];

        goto LABEL_12;
      }
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_58;
      v61[3] = &unk_1E6BCDCC8;
      v61[4] = self;
      [(ANMessenger *)self _fulfillRelayRequest:v18 withSenderContext:v15 sentHandler:v61];
    }
    uint64_t v58 = [(ANMessenger *)self delegate];
    [v58 receivedAnnouncement:v18];

    id v16 = v60;
    v60[2](v60, 0);
  }
  else
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 5017, *MEMORY[0x1E4F4A728]);
    uint64_t v34 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:]();
    }

    id v35 = +[ANAnalytics shared];
    objc_msgSend(v35, "error:", objc_msgSend(v24, "code"));

    (*((void (**)(id, void *))v16 + 2))(v16, v24);
  }
LABEL_12:
}

void __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) log];
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "Forwarded message on behalf of companion", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "Did not relay announcement: %@, announcement = %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)connection:(id)a3 failedDeliveryForMessage:(id)a4 withError:(id)a5
{
  id v7 = a5;
  int v8 = (objc_class *)MEMORY[0x1E4F4A8A8];
  id v9 = a4;
  __int16 v10 = (void *)[[v8 alloc] initWithMessage:v9];

  if (v10)
  {
    id v11 = [(ANMessenger *)self delegate];
    [v11 failedToDeliverAnnouncement:v10 error:v7];
  }
  else
  {
    id v11 = [(ANMessenger *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ANMessenger connection:didReceiveMessage:fromSender:senderContext:handler:]();
    }
  }
}

- (id)connectionDidReceiveRequestForHomeLocationStatus:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = +[ANHomeManager shared];
  id v5 = [v4 allHomes];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "homeLocationStatus", (void)v15));
        int v13 = [v11 uniqueIdentifier];
        [v3 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

- (ANMessengerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANMessengerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ANRapportConnectionProvider)rapportConnection
{
  return self->_rapportConnection;
}

- (ANIDSConnectionProvider)idsConnection
{
  return self->_idsConnection;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_idsConnection, 0);
  objc_storeStrong((id *)&self->_rapportConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)createAnnouncementWithRequest:(id)a3 forLocation:(id)a4 inHome:(id)a5 isReply:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = [v11 content];
  long long v15 = [v14 audioFileURL];
  id v63 = 0;
  long long v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v15 options:2 error:&v63];
  id v17 = v63;
  long long v18 = ANLogHandleMessenger_Announcement();
  long long v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      double v65 = &stru_1F34A0E10;
      __int16 v66 = 2112;
      id v67 = v15;
      __int16 v68 = 2112;
      id v69 = v17;
      _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_ERROR, "%@Failed to load data from file: URL = %@, Error = %@", buf, 0x20u);
    }

    id v20 = 0;
    if (a7) {
      *a7 = v17;
    }
    goto LABEL_43;
  }
  BOOL log = v8;
  v61 = v11;
  uint64_t v52 = a7;
  id v59 = v13;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
    *(_DWORD *)buf = 138412802;
    double v65 = &stru_1F34A0E10;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    id v69 = v21;
    _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Loaded audio file data from URL (%@) of size %@", buf, 0x20u);
  }
  double v22 = (void *)[objc_alloc(MEMORY[0x1E4F4A8C0]) initWithData:v16 type:1];
  [v22 setFlags:1];
  uint64_t v23 = objc_opt_new();
  uint64_t v57 = v22;
  [v23 addObject:v22];
  uint64_t v24 = [v14 transcription];
  uint64_t v25 = v24;
  if (v24)
  {
    id v26 = [v24 dataUsingEncoding:4];
    id v27 = (void *)[objc_alloc(MEMORY[0x1E4F4A8C0]) initWithData:v26 type:2];
    [v23 addObject:v27];
  }
  id v56 = v25;
  id v28 = objc_opt_new();
  int v60 = v23;
  uint64_t v29 = [v23 copy];
  [v28 setDataItems:v29];

  id v62 = 0;
  LOBYTE(v29) = objc_msgSend(v28, "processAudioWithEffects:error:", objc_msgSend(MEMORY[0x1E4F4A8A8], "defaultAudioEffects"), &v62);
  id v30 = v62;
  if ((v29 & 1) == 0)
  {
    uint64_t v31 = ANLogHandleMessenger_Announcement();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v65 = &stru_1F34A0E10;
      __int16 v66 = 2112;
      id v67 = v30;
      _os_log_impl(&dword_1DA5ED000, v31, OS_LOG_TYPE_ERROR, "%@Failed to process audio. Requesting remote normalization. Error = %@", buf, 0x16u);
    }
  }
  uint64_t v55 = v30;
  id v58 = v12;
  [v28 setLocation:v12];
  uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
  [v28 setCreationTimestamp:v32];

  v33 = (void *)MEMORY[0x1E4F4A8A8];
  uint64_t v34 = [v61 clientID];
  objc_msgSend(v28, "setSource:", objc_msgSend(v33, "sourceFromString:", v34));

  id v35 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v36 = [v35 BOOLForDefault:*MEMORY[0x1E4F4A6B0]];

  id v37 = +[ANHomeManager shared];
  uint64_t v38 = [v37 currentAccessory];

  if (v36 && !v38)
  {
    uint64_t v39 = 0;
    if (log) {
      uint64_t v40 = 5;
    }
    else {
      uint64_t v40 = 4;
    }
    [v28 setAction:v40];
    uint64_t v41 = ANLogHandleMessenger_Announcement();
    v42 = v60;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v65 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v41, OS_LOG_TYPE_DEFAULT, "%@Relaying message via resident.", buf, 0xCu);
    }

    id v13 = v59;
    goto LABEL_29;
  }
  [v28 setAction:log];
  id v13 = v59;
  v42 = v60;
  uint64_t v39 = (void *)v38;
  if (v38)
  {
    uint64_t v43 = [v14 homeKitUserIdentifier];
    if (v43)
    {
      uint64_t v44 = objc_msgSend(v59, "hmu_userWithUniqueIdentifier:", v43);
      if (!v44)
      {
        uint64_t v45 = 0;
LABEL_34:

        uint64_t v47 = [v28 announcer];
        [v47 populateWithUser:v44 andAccessory:v39];

        id v13 = v59;
        goto LABEL_35;
      }
      if ([v59 announceAccessAllowedForUser:v44])
      {
        uint64_t v45 = ANLogHandleMessenger_Announcement();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          id v51 = [v44 name];
          [v44 uniqueIdentifier];
          uint64_t v46 = loga = v45;
          *(_DWORD *)buf = 138412802;
          double v65 = &stru_1F34A0E10;
          __int16 v66 = 2112;
          id v67 = v51;
          __int16 v68 = 2112;
          id v69 = v46;
          _os_log_impl(&dword_1DA5ED000, loga, OS_LOG_TYPE_DEFAULT, "%@Recognized User with Announce access. Not sending to personal devices for user. %@, %@", buf, 0x20u);

          uint64_t v45 = loga;
        }
        goto LABEL_34;
      }
      uint64_t v45 = v44;
    }
    else
    {
      uint64_t v45 = 0;
    }
    uint64_t v44 = 0;
    goto LABEL_34;
  }
LABEL_29:
  uint64_t v43 = [v28 announcer];
  uint64_t v44 = [v13 currentUser];
  [v43 populateWithUser:v44];
LABEL_35:

  int v48 = +[ANValidationHelper performBasicValidationForAnnouncement:v28 type:0];
  if (v48)
  {
    int v49 = ANLogHandleMessenger_Announcement();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v65 = &stru_1F34A0E10;
      __int16 v66 = 2112;
      id v67 = v48;
      _os_log_impl(&dword_1DA5ED000, v49, OS_LOG_TYPE_ERROR, "%@Failed Send Basic Validation with Error: %@", buf, 0x16u);
    }

    id v20 = 0;
    if (v52) {
      id *v52 = v48;
    }
    v42 = v60;
  }
  else
  {
    id v20 = v28;
  }

  id v12 = v58;
  id v11 = v61;
LABEL_43:

  return v20;
}

+ (id)announcementForDevice:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v9 isRelayRequest] & 1) != 0
    || +[ANMessenger _isAnnouncerAdminInAnnouncement:home:](ANMessenger, "_isAnnouncerAdminInAnnouncement:home:", v9, v8)|| [v7 isOwnerDevice])
  {
    id v10 = v9;
  }
  else
  {
    id v12 = [v7 homeKitUserIdentifiers];
    id v13 = v12;
    if (v12)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = objc_msgSend(v8, "hmu_userWithUniqueIdentifier:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
            if (v19)
            {
              id v20 = (void *)v19;
              id v10 = +[ANMessenger announcementForUser:v19 inHome:v8 fromAnnouncement:v9];

              goto LABEL_20;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
    id v10 = (id)objc_msgSend(v9, "copy", (void)v21);
    id v14 = [v10 announcer];
    [v14 clearIdentifiers];
LABEL_20:
  }
  return v10;
}

+ (id)announcementForAccessory:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5
{
  id v5 = a5;
  return v5;
}

+ (id)announcementForUser:(id)a3 inHome:(id)a4 fromAnnouncement:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[ANMessenger _isAnnouncerAdminInAnnouncement:home:](ANMessenger, "_isAnnouncerAdminInAnnouncement:home:", v9, v8)|| (objc_msgSend(v8, "hmu_isAdministrator:", v7) & 1) != 0)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = (id)[v9 copy];
    id v11 = [v10 announcer];
    [v11 clearIdentifiers];
  }
  return v10;
}

+ (id)locationForHome:(id)a3 rooms:(id)a4 zones:(id)a5 idsService:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (objc_class *)MEMORY[0x1E4F4A908];
  id v13 = a6;
  id v14 = [v12 alloc];
  uint64_t v15 = [v9 uniqueIdentifier];
  uint64_t v16 = (void *)[v14 initWithHomeID:v15];

  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    [v16 setFlags:0];
    uint64_t v17 = (void *)MEMORY[0x1E4F2EA80];
    long long v18 = objc_msgSend(MEMORY[0x1E4F2EA80], "an_roomsWithAnnounceAccessoriesFromRooms:", v10);
    uint64_t v19 = objc_msgSend(v17, "hmu_uniqueIdentifiersFromRooms:", v18);
    [v16 setRoomUUIDs:v19];

    id v20 = (void *)MEMORY[0x1E4F2EBF0];
    long long v21 = objc_msgSend(MEMORY[0x1E4F2EBF0], "an_zonesWithAnnounceAccessoriesFromZones:", v11);
    long long v22 = objc_msgSend(v20, "hmu_uniqueIdentifiersFromZones:", v21);
    [v16 setZoneUUIDs:v22];
  }
  else
  {
    [v16 setFlags:1];
  }
  +[ANMessenger _setIdentifiersForIDSService:v13 inLocation:v16 home:v9];

  return v16;
}

+ (id)locationForReplyToAnnouncement:(id)a3 home:(id)a4 idsService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 location];
  if (([v10 flags] & 1) == 0)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F4A908]);
    id v12 = [v10 homeUUID];
    id v13 = (void *)[v11 initWithHomeID:v12];

    id v14 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v15 = [v10 roomUUIDs];
    uint64_t v16 = objc_msgSend(v8, "hmu_roomsWithUniqueIdentifiers:", v15);
    uint64_t v34 = [v14 setWithArray:v16];

    uint64_t v17 = (void *)MEMORY[0x1E4F1CA80];
    long long v18 = [v10 zoneUUIDs];
    uint64_t v19 = objc_msgSend(v8, "hmu_zonesWithUniqueIdentifiers:", v18);
    id v20 = [v17 setWithArray:v19];

    long long v21 = [v7 announcer];
    if ([v21 isAccessory])
    {
      long long v22 = [v7 announcer];
      long long v23 = [v22 homeKitID];

      if (!v23)
      {
LABEL_7:
        id v27 = (void *)MEMORY[0x1E4F2EA80];
        id v28 = [v34 allObjects];
        uint64_t v29 = objc_msgSend(v27, "hmu_uniqueIdentifiersFromRooms:", v28);
        [v13 setRoomUUIDs:v29];

        id v30 = (void *)MEMORY[0x1E4F2EBF0];
        uint64_t v31 = [v20 allObjects];
        uint64_t v32 = objc_msgSend(v30, "hmu_uniqueIdentifiersFromZones:", v31);
        [v13 setZoneUUIDs:v32];

        goto LABEL_9;
      }
      long long v24 = [v7 announcer];
      uint64_t v25 = [v24 homeKitID];
      uint64_t v26 = objc_msgSend(v8, "hmu_accessoryWithUniqueIdentifierUUIDString:", v25);
      long long v21 = [v26 room];

      if (v21) {
        [v34 addObject:v21];
      }
    }

    goto LABEL_7;
  }
  id v13 = (void *)[v10 copy];
LABEL_9:
  +[ANMessenger _setIdentifiersForIDSService:v9 inLocation:v13 home:v8];

  return v13;
}

+ (void)purgeTemporaryFiles
{
}

+ (BOOL)_isAnnouncerAdminInAnnouncement:(id)a3 home:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 announcer];
  id v8 = [v7 homeKitID];

  if (v8)
  {
    id v9 = [v5 announcer];
    int v10 = [v9 isAccessory];

    if (v10)
    {
      id v11 = [v5 announcer];
      id v12 = [v11 homeKitUserID];

      if (!v12)
      {
        uint64_t v15 = objc_msgSend(v6, "hmu_accessoryWithUniqueIdentifierUUIDString:", v8);
        uint64_t v16 = v15 != 0;
        goto LABEL_10;
      }
      id v13 = [v5 announcer];
      id v14 = [v13 homeKitUserID];
      uint64_t v15 = objc_msgSend(v6, "hmu_userWithUniqueIdentifierUUIDString:", v14);

      if (!v15) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v15 = objc_msgSend(v6, "hmu_userWithUniqueIdentifierUUIDString:", v8);
      if (!v15)
      {
LABEL_5:
        LOBYTE(v16) = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    LOBYTE(v16) = objc_msgSend(v6, "hmu_isAdministrator:", v15);
    goto LABEL_10;
  }
  LOBYTE(v16) = 0;
LABEL_11:

  return v16;
}

+ (void)_setIdentifiersForIDSService:(id)a3 inLocation:(id)a4 home:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = +[ANHomeManager shared];
  id v11 = [v10 currentAccessory];

  if (!v11)
  {
    if ([v8 flags]) {
      objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 6);
    }
    id v12 = [v9 currentUser];
    id v13 = [v12 uniqueIdentifier];
    v16[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v8 setUserUUIDs:v14];

    uint64_t v15 = [v7 uniqueIdentifiersForDevicesExcludingAppleAccessories];
    [v8 setDeviceIDs:v15];
  }
}

+ (id)performBasicValidationForAnnouncement:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 location];
  id v7 = [v6 homeUUID];

  if (!v7)
  {
    uint64_t v15 = NSString;
    uint64_t v16 = [v5 identifier];
    id v9 = [v15 stringWithFormat:@"Announcement (%@) missing Home ID", v16];

    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E4F4A728], v9);
    goto LABEL_30;
  }
  id v8 = +[ANHomeManager shared];
  id v9 = [v8 homeForID:v7];

  if (!v9)
  {
    uint64_t v17 = NSString;
    long long v18 = [v5 identifier];
    id v11 = [v17 stringWithFormat:@"Local device is not part of home: (%@) in Announcement (%@)", v7, v18];

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F4A728];
    uint64_t v21 = 1016;
    long long v22 = v11;
LABEL_27:
    uint64_t v32 = objc_msgSend(v19, "an_errorWithCode:component:description:", v21, v20, v22);
LABEL_28:
    id v14 = (void *)v32;
    goto LABEL_29;
  }
  int v10 = +[ANHomeManager shared];
  id v11 = [v10 currentAccessory];

  int v12 = [MEMORY[0x1E4F4A8E8] isAnnounceAccessory];
  int v13 = v12;
  if (v11 || (v12 & 1) != 0)
  {
    if (v11) {
      int v23 = 0;
    }
    else {
      int v23 = v12;
    }
    if (v23 == 1)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F4A728];
      long long v22 = @"Current Accessory is nil, and device is HomePod this should not happen";
      uint64_t v21 = 1048;
      goto LABEL_27;
    }
    if (([(__CFString *)v11 an_supportsAnnounce] & 1) == 0)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F4A728];
      long long v22 = @"Current Accessory does not support Announce";
      uint64_t v21 = 1030;
      goto LABEL_27;
    }
    char v24 = [v5 isRelayRequest];
    if (!a4 && (v24 & 1) == 0 && ([(__CFString *)v11 an_isAnnounceEnabled] & 1) == 0)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F4A728];
      long long v22 = @"Announce not enabled for Current Accessory";
      goto LABEL_15;
    }
    id v14 = 0;
    if (!v11 || ((v13 ^ 1) & 1) != 0) {
      goto LABEL_29;
    }
    uint64_t v25 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    int v26 = [v25 BOOLForDefault:*MEMORY[0x1E4F4A580]];

    if (v26)
    {
      id v27 = +[ANHomeManager shared];
      id v28 = [v27 currentHome];

      if (v28)
      {
        uint64_t v29 = [(__CFString *)v28 uniqueIdentifier];
        id v30 = [v9 uniqueIdentifier];
        char v31 = [v29 isEqual:v30];

        if (v31)
        {

LABEL_35:
          uint64_t v32 = +[ANMessenger validateAnnouncerInAnnouncement:v5 home:v9];
          goto LABEL_28;
        }
        uint64_t v40 = NSString;
        uint64_t v41 = [v9 uniqueIdentifier];
        v42 = [(__CFString *)v28 uniqueIdentifier];
        uint64_t v43 = [v40 stringWithFormat:@"Announcent Home ID (%@) does not match Current Home ID (%@)", v41, v42];

        id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1016, *MEMORY[0x1E4F4A728], v43);

LABEL_40:
        goto LABEL_29;
      }
      int v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F4A728];
      uint64_t v39 = @"Unable to determine current home for accessory to validate announcement";
      uint64_t v38 = 1030;
    }
    else
    {
      if ([(__CFString *)v11 hmu_isPartOfHome:v9]) {
        goto LABEL_35;
      }
      uint64_t v34 = NSString;
      id v35 = [v9 uniqueIdentifier];
      id v28 = [v34 stringWithFormat:@"Accessory is not in the Announcement's home (%@)", v35];

      int v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F4A728];
      uint64_t v38 = 1016;
      uint64_t v39 = v28;
    }
    id v14 = objc_msgSend(v36, "an_errorWithCode:component:description:", v38, v37, v39);
    goto LABEL_40;
  }
  if (([v9 announceAccessAllowedForCurrentUser] & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F4A728];
    long long v22 = @"Announce Access Not Allowed For Current User";
LABEL_15:
    uint64_t v21 = 1017;
    goto LABEL_27;
  }
  id v14 = 0;
LABEL_29:

LABEL_30:
  return v14;
}

+ (id)validateAnnouncerInAnnouncement:(id)a3 home:(id)a4
{
  id v5 = a4;
  id v6 = [a3 announcer];
  id v7 = [v6 homeKitUserID];

  if (!v7)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  id v8 = objc_msgSend(v5, "hmu_userWithUniqueIdentifierUUIDString:", v7);
  if (!v8)
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F4A728];
    int v12 = @"No user with matching identifier";
    uint64_t v13 = 1030;
LABEL_8:
    id v9 = objc_msgSend(v10, "an_errorWithCode:component:description:", v13, v11, v12);
    goto LABEL_9;
  }
  if (([v5 announceAccessAllowedForUser:v8] & 1) == 0)
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F4A728];
    int v12 = @"Announce Access Not Allowed For User";
    uint64_t v13 = 1017;
    goto LABEL_8;
  }
  id v9 = 0;
LABEL_9:

LABEL_10:
  return v9;
}

+ (id)performIDSValidationForAnnouncement:(id)a3 withSenderContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ANHomeManager shared];
  id v8 = [v7 currentAccessory];

  id v9 = +[ANHomeManager shared];
  int v10 = [v6 location];

  uint64_t v11 = [v10 homeUUID];
  int v12 = [v9 homeForID:v11];

  if (!v8 && (objc_msgSend(v12, "hmu_isRemoteAccessAllowedForCurrentUser") & 1) == 0)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F4A728];
    long long v22 = @"Remote Access Not Allowed for Current User";
    goto LABEL_14;
  }
  uint64_t v13 = [v5 senderCorrelationIdentifier];

  if (!v13)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F4A728];
    long long v22 = @"No Sender Correlation ID";
LABEL_14:
    id v30 = objc_msgSend(v20, "an_errorWithCode:component:description:", 1030, v21, v22);
    goto LABEL_20;
  }
  if (![v5 isValidDevice])
  {
    int v23 = [v5 senderCorrelationIdentifier];
    uint64_t v19 = objc_msgSend(v12, "hmu_userWithSenderCorrelationIdentifier:", v23);

    if (v19) {
      goto LABEL_9;
    }
    char v31 = @"No user with matching Sender Correlation ID";
LABEL_18:
    id v30 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:description:", 1030, *MEMORY[0x1E4F4A728], v31);
    goto LABEL_19;
  }
  id v14 = [v12 currentUser];
  uint64_t v15 = [v14 uniqueIdentifier];
  uint64_t v16 = [v12 owner];
  uint64_t v17 = [v16 uniqueIdentifier];
  int v18 = [v15 isEqual:v17];

  if (!v18)
  {
    uint64_t v19 = 0;
    char v31 = @"Received message from a known device but current user is not owner.";
    goto LABEL_18;
  }
  uint64_t v19 = [v12 owner];
LABEL_9:
  if (!v8)
  {
    char v24 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    int v25 = [v24 BOOLForDefault:*MEMORY[0x1E4F4A6B0]];

    if (v25)
    {
      int v26 = [v19 uniqueIdentifier];
      id v27 = [v12 owner];
      id v28 = [v27 uniqueIdentifier];
      char v29 = [v26 isEqual:v28];

      if ((v29 & 1) == 0)
      {
        char v31 = @"Received an announcement from non-owner";
        goto LABEL_18;
      }
    }
  }
  id v30 = 0;
LABEL_19:

LABEL_20:
  return v30;
}

+ (id)performRapportValidationForAnnouncement:(id)a3 withSenderContext:(id)a4
{
  return 0;
}

+ (id)performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4 rooms:(id)a5 zones:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 count] || objc_msgSend(v12, "count"))
  {
    uint64_t v13 = +[ANMessenger _performPreflightChecksForSendingToRooms:v11 zones:v12];
  }
  else
  {
    uint64_t v13 = +[ANMessenger _performPreflightChecksForSendingContent:v9 toHome:v10];
  }
  id v14 = (void *)v13;

  return v14;
}

+ (id)_performPreflightChecksForSendingContent:(id)a3 toHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 appleAnnounceCapableAccessories];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    char v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F4A728];
    uint64_t v31 = 1033;
LABEL_19:
    id v4 = objc_msgSend(v29, "an_errorWithCode:component:", v31, v30);
    goto LABEL_24;
  }
  id v10 = [v7 appleAnnounceAccessories];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    char v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F4A728];
    uint64_t v31 = 1035;
    goto LABEL_19;
  }
  id v12 = +[ANHomeManager shared];
  uint64_t v13 = [v12 currentAccessory];

  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = [v7 usersIncludingCurrentUserWithAnnounceEnabled];
    uint64_t v16 = (void *)MEMORY[0x1E4F2E4F8];
    uint64_t v17 = [v7 accessories];
    int v18 = [v16 announceAccessoriesWithAnnounceEnabledFromAccessories:v17];
    uint64_t v19 = (void *)[v18 mutableCopy];

    uint64_t v20 = [v14 room];
    uint64_t v21 = v20;
    if (v20)
    {
      long long v22 = (void *)MEMORY[0x1E4F2E4F8];
      int v23 = [v20 accessories];
      char v24 = [v22 announceAccessoriesWithAnnounceEnabledFromAccessories:v23];

      [v19 removeObjectsInArray:v24];
    }
    int v25 = [v6 homeKitUserIdentifier];
    if (v25)
    {
      id v37 = v14;
      int v26 = objc_msgSend(v7, "hmu_userWithUniqueIdentifier:", v25);
      if (v26)
      {
        id v27 = (void *)[v15 mutableCopy];
        [v27 removeObject:v26];
        if (![v27 count] && !objc_msgSend(v19, "count"))
        {
          id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1047, *MEMORY[0x1E4F4A728]);

          char v28 = 0;
          id v14 = v37;
          goto LABEL_15;
        }
      }
      id v14 = v37;
    }
    if ([v15 count] || objc_msgSend(v19, "count"))
    {
      char v28 = 1;
    }
    else
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1031, *MEMORY[0x1E4F4A728]);
      char v28 = 0;
    }
LABEL_15:

    if ((v28 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F2E4F8];
  v33 = [v7 accessories];
  uint64_t v34 = [v32 announceAccessoriesWithAnnounceEnabledFromAccessories:v33];
  uint64_t v35 = [v34 count];

  if (!v35)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1031, *MEMORY[0x1E4F4A728]);
    goto LABEL_23;
  }
LABEL_21:
  id v4 = 0;
LABEL_23:

LABEL_24:
  return v4;
}

+ (id)_performPreflightChecksForSendingToRooms:(id)a3 zones:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F2EA80], "an_roomsWithAnnounceAccessoriesFromRooms:", v5);
  if ([v7 count])
  {
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F2EBF0], "an_zonesWithAnnounceAccessoriesFromZones:", v6);
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      int v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F4A728];
      uint64_t v27 = 1049;
      goto LABEL_14;
    }
  }
  id v10 = (void *)MEMORY[0x1E4F2E4F8];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F2EA80], "hmu_accessoriesInRooms:", v5);
  id v12 = [v10 announceAccessoriesFromAccessories:v11];
  if ([v12 count])
  {
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F2E4F8];
    id v14 = objc_msgSend(MEMORY[0x1E4F2EBF0], "hmu_accessoriesInZones:", v6);
    uint64_t v15 = [v13 announceAccessoriesFromAccessories:v14];
    uint64_t v16 = [v15 count];

    if (!v16)
    {
      int v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F4A728];
      uint64_t v27 = 1035;
      goto LABEL_14;
    }
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F2E4F8];
  int v18 = objc_msgSend(MEMORY[0x1E4F2EA80], "hmu_accessoriesInRooms:", v5);
  uint64_t v19 = [v17 announceAccessoriesWithAnnounceEnabledFromAccessories:v18];
  if ([v19 count])
  {

LABEL_10:
    char v24 = 0;
    goto LABEL_15;
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F2E4F8];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F2EBF0], "hmu_accessoriesInZones:", v6);
  long long v22 = [v20 announceAccessoriesWithAnnounceEnabledFromAccessories:v21];
  uint64_t v23 = [v22 count];

  if (v23) {
    goto LABEL_10;
  }
  int v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v26 = *MEMORY[0x1E4F4A728];
  uint64_t v27 = 1031;
LABEL_14:
  char v24 = objc_msgSend(v25, "an_errorWithCode:component:", v27, v26);
LABEL_15:

  return v24;
}

- (void)forwardAnnouncementToCompanion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 name];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DA5ED000, a3, OS_LOG_TYPE_ERROR, "Failed to forward message to companion %@: %@", v6, 0x16u);
}

- (void)_calculateAnnouncementDeadline:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[ANMessenger _calculateAnnouncementDeadline:]";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_error_impl(&dword_1DA5ED000, log, OS_LOG_TYPE_ERROR, "%s: Error in Calculate announcement deadline, fileData is nil. return defaultDeadline: %f", (uint8_t *)&v2, 0x16u);
}

- (void)_fulfillRelayRequest:withSenderContext:sentHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Failed to process audio pre-relay. %@", v2, v3, v4, v5, v6);
}

- (void)_sendAnnouncement:toDestination:sentHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Forcing Send Failure", v2, v3, v4, v5, v6);
}

- (void)_sendAnnouncement:(void *)a1 toDestination:(NSObject *)a2 sentHandler:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 accessories];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA5ED000, a2, OS_LOG_TYPE_ERROR, "Unable to relay over IDS. No URI for accessories %@", v4, 0xCu);
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Failed to init Announcement from message", v2, v3, v4, v5, v6);
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "IDS Validation Failed with Error: %@", v2, v3, v4, v5, v6);
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Rapport Validation Failed with Error: %@", v2, v3, v4, v5, v6);
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DA5ED000, v0, v1, "Received announcement from unsupported connection", v2, v3, v4, v5, v6);
}

- (void)connection:didReceiveMessage:fromSender:senderContext:handler:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Basic Validation Failed with Error: %@", v2, v3, v4, v5, v6);
}

void __77__ANMessenger_connection_didReceiveMessage_fromSender_senderContext_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA5ED000, v0, v1, "Failed to forward announcement for companion; %@", v2, v3, v4, v5, v6);
}

@end