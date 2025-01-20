@interface MSPSenderMessageStrategy
+ (BOOL)_supportsEvent:(unint64_t)a3;
- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4;
- (MSPSenderMessageStrategy)initWithDelegate:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5;
- (MSPSenderMessageStrategyDelegate)delegate;
- (void)addParticipants:(id)a3;
- (void)sendMessageIfNeeded;
- (void)setDelegate:(id)a3;
@end

@implementation MSPSenderMessageStrategy

- (MSPSenderMessageStrategy)initWithDelegate:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSPSenderMessageStrategy;
  v10 = [(MSPSenderStrategy *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11->_type = a4;
    uint64_t v12 = [v9 copy];
    serviceName = v11->_serviceName;
    v11->_serviceName = (NSString *)v12;
  }
  return v11;
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return a3 - 7 < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMessageStrategy;
  BOOL v5 = [(MSPSenderStrategy *)&v7 setState:a3 forEvent:a4];
  if (v5) {
    [(MSPSenderMessageStrategy *)self sendMessageIfNeeded];
  }
  return v5;
}

- (void)addParticipants:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSPSenderMessageStrategy;
  [(MSPSenderStrategy *)&v4 addParticipants:a3];
  [(MSPSenderMessageStrategy *)self sendMessageIfNeeded];
}

- (void)sendMessageIfNeeded
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->super._participants count])
  {
    v76 = self;
    v3 = self->super._state;
    objc_super v4 = v3;
    if (v3)
    {
      BOOL v5 = [(GEOSharedNavState *)v3 etaInfo];
      if ([v5 hasEtaTimestamp])
      {
        v6 = [(GEOSharedNavState *)v4 destinationWaypointMapItem];

        if (v6)
        {
          objc_super v7 = (void *)[(GEOSharedNavState *)v4 copy];

          id v8 = v76;
          id v9 = [(MSPSenderMessageStrategy *)v76 delegate];
          v10 = (void *)[(NSMutableSet *)v76->super._participants copy];
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id obj = v10;
          uint64_t v80 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
          if (v80)
          {
            uint64_t v79 = *(void *)v83;
            v78 = v7;
            os_log_t log = v9;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v83 != v79) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v12 = *(NSObject **)(*((void *)&v82 + 1) + 8 * v11);
                v13 = [v9 rulesForParticipant:v12];
                v14 = [v7 etaInfo];
                [v14 etaTimestamp];
                double v16 = v15;
                [v7 updatedTimestamp];
                [v13 didReceiveUpdateWithETA:v16 lastUpdated:v17];

                unint64_t v18 = [v13 currentlyNecessaryNotificationTypeForState:v7];
                v19 = MSPGetSharedTripLog();
                v20 = v19;
                if (v18)
                {
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    v21 = NSString;
                    v22 = v8;
                    v23 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];

                    unint64_t type = v22->_type;
                    v25 = @"Unknown";
                    if (type <= 4) {
                      v25 = off_1E617C6C0[type];
                    }
                    serviceName = v22->_serviceName;
                    id v27 = v23;
                    MSPSharedTripNotificationTypeAsString(v18);
                    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    *(_DWORD *)buf = 138544387;
                    v88 = v23;
                    __int16 v89 = 2114;
                    v90 = v25;
                    __int16 v91 = 2114;
                    v92 = serviceName;
                    __int16 v93 = 2114;
                    v94 = v28;
                    __int16 v95 = 2113;
                    v96 = v12;
                    _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@/%{public}@: sendMessageIfNeeded will send %{public}@ to participant %{private}@", buf, 0x34u);

                    id v9 = log;
                    id v8 = v76;
                    objc_super v7 = v78;
                  }

                  switch(v18)
                  {
                    case 1uLL:
                      uint64_t v29 = [v7 initialMessage];
                      goto LABEL_26;
                    case 2uLL:
                      uint64_t v29 = [v7 updateMessage];
                      goto LABEL_26;
                    case 3uLL:
                      uint64_t v29 = [v7 chargingStopMessage];
                      goto LABEL_26;
                    case 4uLL:
                      uint64_t v29 = [v7 intermediateArrivalMessage];
                      goto LABEL_26;
                    case 5uLL:
                      uint64_t v29 = [v7 waypointResumeMessage];
                      goto LABEL_26;
                    case 6uLL:
                      uint64_t v29 = [v7 arrivalMessage];
LABEL_26:
                      v20 = v29;
                      if (!v29) {
                        goto LABEL_32;
                      }
                      if (v8->super._loggingOnly)
                      {
                        v39 = MSPGetSharedTripVirtualReceiverLog();
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                        {
                          v40 = NSString;
                          v41 = v8;
                          v42 = [v40 stringWithFormat:@"%@<%p>", objc_opt_class(), v41];

                          unint64_t v43 = v41->_type;
                          v44 = @"Unknown";
                          if (v43 <= 4) {
                            v44 = off_1E617C6C0[v43];
                          }
                          v45 = v41->_serviceName;
                          *(_DWORD *)buf = 138544386;
                          v88 = v42;
                          __int16 v89 = 2114;
                          v90 = v44;
                          __int16 v91 = 2114;
                          v92 = v45;
                          __int16 v93 = 2114;
                          v94 = (__CFString *)v12;
                          __int16 v95 = 2114;
                          v96 = v20;
                          _os_log_impl(&dword_1B87E5000, v39, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@/%{public}@: TO %{public}@: \"%{public}@\"", buf, 0x34u);
                        }
LABEL_38:

                        objc_super v7 = v78;
                        [v13 didPostNotificationType:v18 forState:v78];
                        [v9 touchedRules];
                        break;
                      }
                      v39 = IDSCopyRawAddressForDestination();
                      if (IMSPISendMessageWithAttachments()) {
                        goto LABEL_38;
                      }
                      v51 = MSPGetSharedTripLog();
                      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                      {
                        v52 = NSString;
                        v53 = v8;
                        v54 = [v52 stringWithFormat:@"%@<%p>", objc_opt_class(), v53];

                        unint64_t v55 = v53->_type;
                        v56 = @"Unknown";
                        if (v55 <= 4) {
                          v56 = off_1E617C6C0[v55];
                        }
                        v57 = v8->_serviceName;
                        *(_DWORD *)buf = 138543874;
                        v88 = v54;
                        __int16 v89 = 2114;
                        v90 = v56;
                        __int16 v91 = 2114;
                        v92 = v57;
                        _os_log_impl(&dword_1B87E5000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@/%{public}@: IMSPISendMessageWithAttachments returned NO", buf, 0x20u);
                      }
                      objc_super v7 = v78;
                      break;
                    default:
LABEL_32:
                      v20 = MSPGetSharedTripLog();
                      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
                        break;
                      }
                      v46 = NSString;
                      v47 = v8;
                      v32 = [v46 stringWithFormat:@"%@<%p>", objc_opt_class(), v47];

                      unint64_t v48 = v47->_type;
                      v49 = @"Unknown";
                      if (v48 <= 4) {
                        v49 = off_1E617C6C0[v48];
                      }
                      v50 = v47->_serviceName;
                      *(_DWORD *)buf = 138544131;
                      v88 = v32;
                      __int16 v89 = 2114;
                      v90 = v49;
                      __int16 v91 = 2114;
                      v92 = v50;
                      __int16 v93 = 2113;
                      v94 = (__CFString *)v12;
                      v36 = v20;
                      os_log_type_t v37 = OS_LOG_TYPE_FAULT;
                      v38 = "[%{public}@] %{public}@/%{public}@: no message body generated but we expected to send someth"
                            "ing to %{private}@";
                      goto LABEL_36;
                  }
                }
                else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  v30 = NSString;
                  v31 = v8;
                  v32 = [v30 stringWithFormat:@"%@<%p>", objc_opt_class(), v31];

                  unint64_t v33 = v31->_type;
                  v34 = @"Unknown";
                  if (v33 <= 4) {
                    v34 = off_1E617C6C0[v33];
                  }
                  v35 = v31->_serviceName;
                  *(_DWORD *)buf = 138544131;
                  v88 = v32;
                  __int16 v89 = 2114;
                  v90 = v34;
                  __int16 v91 = 2114;
                  v92 = v35;
                  __int16 v93 = 2113;
                  v94 = (__CFString *)v12;
                  v36 = v20;
                  os_log_type_t v37 = OS_LOG_TYPE_INFO;
                  v38 = "[%{public}@] %{public}@%{public}@: no necessary notification for %{private}@";
LABEL_36:
                  _os_log_impl(&dword_1B87E5000, v36, v37, v38, buf, 0x2Au);
                }
                ++v11;
              }
              while (v80 != v11);
              uint64_t v58 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
              uint64_t v80 = v58;
            }
            while (v58);
          }

          objc_super v4 = (GEOSharedNavState *)v7;
          goto LABEL_63;
        }
      }
      else
      {
      }
    }
    id v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      loga = v9;
      v59 = NSString;
      v60 = v76;
      v61 = [v59 stringWithFormat:@"%@<%p>", objc_opt_class(), v60];

      unint64_t v62 = v60->_type;
      if (v62 > 4) {
        v63 = @"Unknown";
      }
      else {
        v63 = off_1E617C6C0[v62];
      }
      v81 = v63;
      v64 = v60->_serviceName;
      if (v4) {
        v65 = @"YES";
      }
      else {
        v65 = @"NO";
      }
      v66 = v65;
      id v67 = v61;
      v68 = [(GEOSharedNavState *)v4 etaInfo];
      if ([v68 hasEtaTimestamp]) {
        v69 = @"YES";
      }
      else {
        v69 = @"NO";
      }
      v70 = v69;
      v71 = [(GEOSharedNavState *)v4 destinationWaypointMapItem];

      if (v71) {
        v72 = @"YES";
      }
      else {
        v72 = @"NO";
      }
      v73 = v72;
      *(_DWORD *)buf = 138544642;
      v88 = v61;
      __int16 v89 = 2114;
      v90 = v81;
      __int16 v91 = 2114;
      v92 = v64;
      __int16 v93 = 2114;
      v94 = v66;
      __int16 v95 = 2114;
      v96 = v70;
      __int16 v97 = 2114;
      v98 = v73;
      id v9 = loga;
      _os_log_impl(&dword_1B87E5000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@/%{public}@: sendMessageIfNeeded called without requisite state (state: %{public}@, etaInfo: %{public}@, destinationInfo: %{public}@)", buf, 0x3Eu);
    }
LABEL_63:
  }
}

- (MSPSenderMessageStrategyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSenderMessageStrategyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end