@interface AKPushMessage
- (AKPushMessage)initWithMessage:(id)a3;
- (APSIncomingMessage)message;
- (BOOL)isSilent;
- (BOOL)isValidMessage;
- (BOOL)piggybackingAcceptorSupportsPresence;
- (BOOL)piggybackingIDMSFallbackApproved;
- (BOOL)piggybackingRequestorUsesPresence;
- (BOOL)requiresPasscode;
- (NSDictionary)alertInfo;
- (NSDictionary)eventDetails;
- (NSDictionary)serverContext;
- (NSDictionary)userInfo;
- (NSDictionary)walrusWebAccessInfo;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)timestamp;
- (NSNumber)ttlInMinutes;
- (NSString)alertBody;
- (NSString)alertTitle;
- (NSString)altDSID;
- (NSString)alternateButtonTitle;
- (NSString)appName;
- (NSString)defaultButtonTitle;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)idmsData;
- (NSString)lockScreenBody;
- (NSString)lockScreenTitle;
- (NSString)messageId;
- (NSString)previousMessageId;
- (NSString)secondaryBody;
- (NSString)secondaryBodyCDP;
- (NSString)secondaryFooter;
- (NSString)secondaryTitle;
- (NSString)secondaryTitleCDP;
- (NSString)serverMachineId;
- (NSString)webSessionUUID;
- (NSUUID)piggybackingRequestorPresenceSID;
- (id)description;
- (int64_t)piggybackingPresenceMode;
- (unint64_t)command;
- (unint64_t)piggybackingContext;
- (void)setAlertBody:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCommand:(unint64_t)a3;
- (void)setLockScreenBody:(id)a3;
- (void)setLockScreenTitle:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setSecondaryBodyCDP:(id)a3;
- (void)setSecondaryFooter:(id)a3;
- (void)setSecondaryTitleCDP:(id)a3;
@end

@implementation AKPushMessage

- (AKPushMessage)initWithMessage:(id)a3
{
  id v5 = a3;
  v122.receiver = self;
  v122.super_class = (Class)AKPushMessage;
  v6 = [(AKPushMessage *)&v122 init];

  if (!v6) {
    goto LABEL_139;
  }
  objc_storeStrong((id *)&v6->_message, a3);
  objc_opt_class();
  id v7 = [v5 userInfo];
  if (objc_opt_isKindOfClass()) {
    v8 = (NSDictionary *)v7;
  }
  else {
    v8 = 0;
  }

  p_userInfo = (id *)&v6->_userInfo;
  userInfo = v6->_userInfo;
  v6->_userInfo = v8;

  objc_opt_class();
  id v11 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"cmd"];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12)
  {
    id v13 = [v12 unsignedIntegerValue];
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018278C((id *)&v6->_userInfo, v14);
    }

    id v13 = 0;
  }
  v6->_command = (unint64_t)v13;
  objc_opt_class();
  id v15 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"txnid"];
  if (objc_opt_isKindOfClass()) {
    v16 = (NSString *)v15;
  }
  else {
    v16 = 0;
  }

  messageId = v6->_messageId;
  v6->_messageId = v16;

  objc_opt_class();
  id v18 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"prevtxnid"];
  if (objc_opt_isKindOfClass()) {
    v19 = (NSString *)v18;
  }
  else {
    v19 = 0;
  }

  previousMessageId = v6->_previousMessageId;
  v6->_previousMessageId = v19;

  objc_opt_class();
  id v21 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"adsid"];
  if (objc_opt_isKindOfClass()) {
    v22 = (NSString *)v21;
  }
  else {
    v22 = 0;
  }

  altDSID = v6->_altDSID;
  v6->_altDSID = v22;

  objc_opt_class();
  id v24 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"mid"];
  if (objc_opt_isKindOfClass()) {
    v25 = (NSString *)v24;
  }
  else {
    v25 = 0;
  }

  serverMachineId = v6->_serverMachineId;
  v6->_serverMachineId = v25;

  objc_opt_class();
  id v27 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"idmsdata"];
  if (objc_opt_isKindOfClass()) {
    v28 = (NSString *)v27;
  }
  else {
    v28 = 0;
  }

  idmsData = v6->_idmsData;
  v6->_idmsData = v28;

  objc_opt_class();
  id v30 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"pbv2"];
  if (objc_opt_isKindOfClass()) {
    id v31 = v30;
  }
  else {
    id v31 = 0;
  }

  v6->_piggybackingAcceptorSupportsPresence = [v31 BOOLValue];
  objc_opt_class();
  id v32 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"pbp"];
  if (objc_opt_isKindOfClass()) {
    id v33 = v32;
  }
  else {
    id v33 = 0;
  }

  v6->_piggybackingRequestorUsesPresence = [v33 BOOLValue];
  objc_opt_class();
  id v34 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"pbc"];
  if (objc_opt_isKindOfClass()) {
    id v35 = v34;
  }
  else {
    id v35 = 0;
  }

  v6->_unint64_t piggybackingContext = (unint64_t)[v35 integerValue];
  v36 = _AKLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t piggybackingContext = v6->_piggybackingContext;
    *(_DWORD *)buf = 134217984;
    unint64_t v124 = piggybackingContext;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Received Piggybacking context as %lu", buf, 0xCu);
  }

  objc_opt_class();
  id v38 = [*p_userInfo objectForKeyedSubscript:@"idmsapproved"];
  if (objc_opt_isKindOfClass()) {
    id v39 = v38;
  }
  else {
    id v39 = 0;
  }

  v6->_piggybackingIDMSFallbackApproved = [v39 BOOLValue];
  objc_opt_class();
  id v40 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"pbv2m"];
  if (objc_opt_isKindOfClass()) {
    id v41 = v40;
  }
  else {
    id v41 = 0;
  }

  id v42 = [v41 integerValue];
  uint64_t v43 = v42 == (id)1;
  if (v42 == (id)2) {
    uint64_t v43 = 2;
  }
  v6->_piggybackingPresenceMode = v43;

  v44 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"sid"];
  objc_opt_class();
  v45 = v44;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = 0;
    piggybackingRequestorPresenceSID = v45;
    goto LABEL_51;
  }
  v46 = v45;

  if (v46)
  {
    v47 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v46];
    piggybackingRequestorPresenceSID = v6->_piggybackingRequestorPresenceSID;
    v6->_piggybackingRequestorPresenceSID = v47;
LABEL_51:
  }
  if ((v6->_piggybackingAcceptorSupportsPresence || v6->_piggybackingRequestorUsesPresence)
    && !v6->_piggybackingRequestorPresenceSID)
  {
    v49 = _AKLogSystem();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_100182714((uint64_t)v45, v49);
    }
  }
  objc_opt_class();
  id v50 = [*p_userInfo objectForKeyedSubscript:@"pedr"];
  if (objc_opt_isKindOfClass()) {
    id v51 = v50;
  }
  else {
    id v51 = 0;
  }

  if (v51) {
    v6->_requiresPasscode = [v51 BOOLValue];
  }
  objc_opt_class();
  id v52 = [*p_userInfo objectForKeyedSubscript:@"aps"];
  if (objc_opt_isKindOfClass()) {
    id v53 = v52;
  }
  else {
    id v53 = 0;
  }

  objc_opt_class();
  id v54 = [v53 objectForKeyedSubscript:@"alert"];
  if (objc_opt_isKindOfClass()) {
    v55 = (NSDictionary *)v54;
  }
  else {
    v55 = 0;
  }

  alertInfo = v6->_alertInfo;
  v6->_alertInfo = v55;

  if (!v6->_alertInfo)
  {
    v57 = _AKLogSystem();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_100182680((id *)&v6->_userInfo);
    }
  }
  objc_opt_class();
  id v58 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"title"];
  if (objc_opt_isKindOfClass()) {
    v59 = (NSString *)v58;
  }
  else {
    v59 = 0;
  }

  alertTitle = v6->_alertTitle;
  v6->_alertTitle = v59;

  objc_opt_class();
  id v61 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"body"];
  if (objc_opt_isKindOfClass()) {
    v62 = (NSString *)v61;
  }
  else {
    v62 = 0;
  }

  alertBody = v6->_alertBody;
  v6->_alertBody = v62;

  objc_opt_class();
  id v64 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"defbtn"];
  if (objc_opt_isKindOfClass()) {
    v65 = (NSString *)v64;
  }
  else {
    v65 = 0;
  }

  defaultButtonTitle = v6->_defaultButtonTitle;
  v6->_defaultButtonTitle = v65;

  objc_opt_class();
  id v67 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"albtn"];
  if (objc_opt_isKindOfClass()) {
    v68 = (NSString *)v67;
  }
  else {
    v68 = 0;
  }

  alternateButtonTitle = v6->_alternateButtonTitle;
  v6->_alternateButtonTitle = v68;

  objc_opt_class();
  id v70 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"stitle"];
  if (objc_opt_isKindOfClass()) {
    v71 = (NSString *)v70;
  }
  else {
    v71 = 0;
  }

  secondaryTitle = v6->_secondaryTitle;
  v6->_secondaryTitle = v71;

  objc_opt_class();
  id v73 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"sbdy"];
  if (objc_opt_isKindOfClass()) {
    v74 = (NSString *)v73;
  }
  else {
    v74 = 0;
  }

  secondaryBody = v6->_secondaryBody;
  v6->_secondaryBody = v74;

  objc_opt_class();
  id v76 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"sftr"];
  if (objc_opt_isKindOfClass()) {
    v77 = (NSString *)v76;
  }
  else {
    v77 = 0;
  }

  secondaryFooter = v6->_secondaryFooter;
  v6->_secondaryFooter = v77;

  objc_opt_class();
  id v79 = [(NSDictionary *)v6->_alertInfo objectForKeyedSubscript:@"silent"];
  if (objc_opt_isKindOfClass()) {
    id v80 = v79;
  }
  else {
    id v80 = 0;
  }

  if (v80) {
    v6->_isSilent = [v80 BOOLValue];
  }
  objc_opt_class();
  id v81 = [*p_userInfo objectForKeyedSubscript:@"akdata"];
  if (objc_opt_isKindOfClass()) {
    v82 = (NSDictionary *)v81;
  }
  else {
    v82 = 0;
  }

  eventDetails = v6->_eventDetails;
  v6->_eventDetails = v82;

  objc_opt_class();
  id v84 = [(NSDictionary *)v6->_eventDetails objectForKeyedSubscript:@"lat"];
  if (objc_opt_isKindOfClass()) {
    v85 = (NSNumber *)v84;
  }
  else {
    v85 = 0;
  }

  latitude = v6->_latitude;
  v6->_latitude = v85;

  objc_opt_class();
  id v87 = [(NSDictionary *)v6->_eventDetails objectForKeyedSubscript:@"lng"];
  if (objc_opt_isKindOfClass()) {
    v88 = (NSNumber *)v87;
  }
  else {
    v88 = 0;
  }

  longitude = v6->_longitude;
  v6->_longitude = v88;

  objc_opt_class();
  id v90 = [(NSDictionary *)v6->_eventDetails objectForKeyedSubscript:@"cls"];
  if (objc_opt_isKindOfClass()) {
    v91 = (NSString *)v90;
  }
  else {
    v91 = 0;
  }

  deviceClass = v6->_deviceClass;
  v6->_deviceClass = v91;

  objc_opt_class();
  id v93 = [(NSDictionary *)v6->_eventDetails objectForKeyedSubscript:@"dc"];
  if (objc_opt_isKindOfClass()) {
    v94 = (NSString *)v93;
  }
  else {
    v94 = 0;
  }

  deviceColor = v6->_deviceColor;
  v6->_deviceColor = v94;

  objc_opt_class();
  id v96 = [(NSDictionary *)v6->_eventDetails objectForKeyedSubscript:@"dec"];
  if (objc_opt_isKindOfClass()) {
    v97 = (NSString *)v96;
  }
  else {
    v97 = 0;
  }

  deviceEnclosureColor = v6->_deviceEnclosureColor;
  v6->_deviceEnclosureColor = v97;

  objc_opt_class();
  id v99 = [(NSDictionary *)v6->_userInfo objectForKeyedSubscript:@"srdwa"];
  if (objc_opt_isKindOfClass()) {
    v100 = (NSDictionary *)v99;
  }
  else {
    v100 = 0;
  }

  walrusWebAccessInfo = v6->_walrusWebAccessInfo;
  v6->_walrusWebAccessInfo = v100;

  objc_opt_class();
  id v102 = [(NSDictionary *)v6->_walrusWebAccessInfo objectForKeyedSubscript:@"wscUUID"];
  if (objc_opt_isKindOfClass()) {
    v103 = (NSString *)v102;
  }
  else {
    v103 = 0;
  }

  webSessionUUID = v6->_webSessionUUID;
  v6->_webSessionUUID = v103;

  objc_opt_class();
  id v105 = [(NSDictionary *)v6->_walrusWebAccessInfo objectForKeyedSubscript:@"ttlMin"];
  if (objc_opt_isKindOfClass()) {
    v106 = (NSNumber *)v105;
  }
  else {
    v106 = 0;
  }

  ttlInMinutes = v6->_ttlInMinutes;
  v6->_ttlInMinutes = v106;

  objc_opt_class();
  id v108 = [(NSDictionary *)v6->_walrusWebAccessInfo objectForKeyedSubscript:@"ts"];
  if (objc_opt_isKindOfClass()) {
    v109 = (NSNumber *)v108;
  }
  else {
    v109 = 0;
  }

  timestamp = v6->_timestamp;
  v6->_timestamp = v109;

  objc_opt_class();
  id v111 = [(NSDictionary *)v6->_walrusWebAccessInfo objectForKeyedSubscript:@"app"];
  if (objc_opt_isKindOfClass()) {
    v112 = (NSString *)v111;
  }
  else {
    v112 = 0;
  }

  appName = v6->_appName;
  v6->_appName = v112;

  objc_opt_class();
  id v114 = [(NSDictionary *)v6->_walrusWebAccessInfo objectForKeyedSubscript:@"stitleCDP"];
  if (objc_opt_isKindOfClass()) {
    v115 = (NSString *)v114;
  }
  else {
    v115 = 0;
  }

  secondaryTitleCDP = v6->_secondaryTitleCDP;
  v6->_secondaryTitleCDP = v115;

  objc_opt_class();
  id v117 = [(NSDictionary *)v6->_walrusWebAccessInfo objectForKeyedSubscript:@"sbdyCDP"];
  if (objc_opt_isKindOfClass()) {
    v118 = (NSString *)v117;
  }
  else {
    v118 = 0;
  }

  secondaryBodyCDP = v6->_secondaryBodyCDP;
  v6->_secondaryBodyCDP = v118;

LABEL_139:
  v120 = v6;

  return v120;
}

- (BOOL)isValidMessage
{
  if (self->_command)
  {
    NSUInteger v2 = [(NSString *)self->_messageId length];
    BOOL result = v2 != 0;
    if (v2) {
      return result;
    }
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1001828DC(v4);
    }
  }
  else
  {
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100182848();
    }
  }

  return 0;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p> command: %lu, identifier: %@", objc_opt_class(), self, self->_command, self->_messageId];
}

- (APSIncomingMessage)message
{
  return self->_message;
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)previousMessageId
{
  return self->_previousMessageId;
}

- (NSString)serverMachineId
{
  return self->_serverMachineId;
}

- (NSString)idmsData
{
  return self->_idmsData;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDictionary)alertInfo
{
  return self->_alertInfo;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertBody
{
  return self->_alertBody;
}

- (void)setAlertBody:(id)a3
{
}

- (NSString)lockScreenTitle
{
  return self->_lockScreenTitle;
}

- (void)setLockScreenTitle:(id)a3
{
}

- (NSString)lockScreenBody
{
  return self->_lockScreenBody;
}

- (void)setLockScreenBody:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (NSString)secondaryBody
{
  return self->_secondaryBody;
}

- (NSString)secondaryFooter
{
  return self->_secondaryFooter;
}

- (void)setSecondaryFooter:(id)a3
{
}

- (BOOL)isSilent
{
  return self->_isSilent;
}

- (BOOL)requiresPasscode
{
  return self->_requiresPasscode;
}

- (NSDictionary)eventDetails
{
  return self->_eventDetails;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (BOOL)piggybackingRequestorUsesPresence
{
  return self->_piggybackingRequestorUsesPresence;
}

- (NSUUID)piggybackingRequestorPresenceSID
{
  return self->_piggybackingRequestorPresenceSID;
}

- (BOOL)piggybackingAcceptorSupportsPresence
{
  return self->_piggybackingAcceptorSupportsPresence;
}

- (BOOL)piggybackingIDMSFallbackApproved
{
  return self->_piggybackingIDMSFallbackApproved;
}

- (int64_t)piggybackingPresenceMode
{
  return self->_piggybackingPresenceMode;
}

- (unint64_t)piggybackingContext
{
  return self->_piggybackingContext;
}

- (NSDictionary)walrusWebAccessInfo
{
  return self->_walrusWebAccessInfo;
}

- (NSString)webSessionUUID
{
  return self->_webSessionUUID;
}

- (NSNumber)ttlInMinutes
{
  return self->_ttlInMinutes;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)secondaryTitleCDP
{
  return self->_secondaryTitleCDP;
}

- (void)setSecondaryTitleCDP:(id)a3
{
}

- (NSString)secondaryBodyCDP
{
  return self->_secondaryBodyCDP;
}

- (void)setSecondaryBodyCDP:(id)a3
{
}

- (NSDictionary)serverContext
{
  return self->_serverContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverContext, 0);
  objc_storeStrong((id *)&self->_secondaryBodyCDP, 0);
  objc_storeStrong((id *)&self->_secondaryTitleCDP, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_ttlInMinutes, 0);
  objc_storeStrong((id *)&self->_webSessionUUID, 0);
  objc_storeStrong((id *)&self->_walrusWebAccessInfo, 0);
  objc_storeStrong((id *)&self->_piggybackingRequestorPresenceSID, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_eventDetails, 0);
  objc_storeStrong((id *)&self->_secondaryFooter, 0);
  objc_storeStrong((id *)&self->_secondaryBody, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_lockScreenBody, 0);
  objc_storeStrong((id *)&self->_lockScreenTitle, 0);
  objc_storeStrong((id *)&self->_alertBody, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_alertInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_serverMachineId, 0);
  objc_storeStrong((id *)&self->_previousMessageId, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_messageId, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end