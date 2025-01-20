@interface CHRecentCall
+ (BOOL)supportsSecureCoding;
+ (id)callCategoryAsString:(unsigned int)a3;
+ (id)callDirectoryIdentificationTypeAsString:(int64_t)a3;
+ (id)callHandleTypeAsString:(int64_t)a3;
+ (id)callMediaTypeAsString:(int64_t)a3;
+ (id)callStatusAsString:(unsigned int)a3;
+ (id)callTTYTypeAsString:(int64_t)a3;
+ (id)callTypeAsString:(unsigned int)a3;
+ (id)getLocationForCallerId:(id)a3 andIsoCountryCode:(id)a4;
+ (id)predicateForCallsBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)predicateForCallsContainingServiceProvider:(id)a3;
+ (id)predicateForCallsLessThanDate:(id)a3;
+ (id)predicateForCallsWithAnyMediaTypes:(id)a3;
+ (id)predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:(id)a3;
+ (id)predicateForCallsWithAnyRemoteParticipantHandleTypes:(id)a3;
+ (id)predicateForCallsWithAnyRemoteParticipantHandleValues:(id)a3;
+ (id)predicateForCallsWithAnyRemoteParticipantHandles:(id)a3;
+ (id)predicateForCallsWithAnyServiceProviders:(id)a3;
+ (id)predicateForCallsWithAnyTTYTypes:(id)a3;
+ (id)predicateForCallsWithAnyUniqueIDs:(id)a3;
+ (id)predicateForCallsWithCategory:(unsigned int)a3;
+ (id)predicateForCallsWithConversationID:(id)a3;
+ (id)predicateForCallsWithGroupUUID:(id)a3;
+ (id)predicateForCallsWithMediaType:(int64_t)a3;
+ (id)predicateForCallsWithRemoteParticipantCount:(int64_t)a3;
+ (id)predicateForCallsWithRemoteParticipantHandle:(id)a3;
+ (id)predicateForCallsWithRemoteParticipantHandleNormalizedValue:(id)a3;
+ (id)predicateForCallsWithRemoteParticipantHandleType:(int64_t)a3;
+ (id)predicateForCallsWithRemoteParticipantHandleValue:(id)a3;
+ (id)predicateForCallsWithRemoteParticipantHandles:(id)a3;
+ (id)predicateForCallsWithServiceProvider:(id)a3;
+ (id)predicateForCallsWithStatus:(unsigned int)a3;
+ (id)predicateForCallsWithStatusAnswered:(BOOL)a3;
+ (id)predicateForCallsWithStatusJunk:(BOOL)a3;
+ (id)predicateForCallsWithStatusOriginated:(BOOL)a3;
+ (id)predicateForCallsWithStatusRead:(BOOL)a3;
+ (id)predicateForCallsWithTTYType:(int64_t)a3;
+ (id)predicateForCallsWithUniqueID:(id)a3;
+ (id)serviceProviderForCallType:(unsigned int)a3;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
+ (int64_t)mediaTypeForCallCategory:(unsigned int)a3;
+ (int64_t)ttyTypeForCallCategory:(unsigned int)a3;
+ (unsigned)categoryForCallType:(unsigned int)a3;
+ (unsigned)categoryForMediaType:(int64_t)a3 andTTYType:(int64_t)a4;
+ (unsigned)getCallTypeForCategory:(unsigned int)a3 andServiceProvider:(id)a4;
- (BOOL)answered;
- (BOOL)callerIdIsBlocked;
- (BOOL)callerIdIsEmailAddress;
- (BOOL)canCoalesceRemoteParticipantHandlesFromCall:(id)a3;
- (BOOL)canCoalesceSyncWithRecentsStrategyWithCall:(id)a3;
- (BOOL)canCoalesceWithCall:(id)a3 withStrategy:(id)a4;
- (BOOL)coalesceWithCall:(id)a3 withStrategy:(id)a4;
- (BOOL)hasMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecentCall:(id)a3;
- (BOOL)isEquivalentToRecentCall:(id)a3;
- (BOOL)isJunk;
- (BOOL)mobileOriginated;
- (BOOL)multiCall;
- (BOOL)read;
- (BOOL)usedEmergencyVideoStreaming;
- (BOOL)wasAutoAnswered;
- (BOOL)wasEmergencyCall;
- (CHHandle)initiator;
- (CHPhoneBookIOSManager)phoneBookManager;
- (CHRecentCall)init;
- (CHRecentCall)initWithCoder:(id)a3;
- (CNContact)contactRef;
- (INInteraction)interaction;
- (NSArray)callOccurrences;
- (NSDate)date;
- (NSDateInterval)interactionDateInterval;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)bytesOfDataUsed;
- (NSNumber)disconnectedCause;
- (NSNumber)filteredOutReason;
- (NSNumber)timeToEstablish;
- (NSSet)emergencyMediaItems;
- (NSSet)remoteParticipantHandles;
- (NSString)addressBookCallerIDMultiValueId;
- (NSString)addressBookRecordId;
- (NSString)blockedByExtension;
- (NSString)blockedByExtensionName;
- (NSString)callerId;
- (NSString)callerIdForDisplay;
- (NSString)callerIdLabel;
- (NSString)callerIdLocation;
- (NSString)callerName;
- (NSString)callerNetworkFirstName;
- (NSString)callerNetworkSecondName;
- (NSString)contactIdentifier;
- (NSString)devicePhoneId;
- (NSString)identityExtension;
- (NSString)isoCountryCode;
- (NSString)junkIdentificationCategory;
- (NSString)localizedBlockedByExtensionName;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)name;
- (NSString)notificationThreadIdentifier;
- (NSString)serviceProvider;
- (NSString)uniqueId;
- (NSURL)imageURL;
- (NSUUID)conversationID;
- (NSUUID)localParticipantUUID;
- (NSUUID)outgoingLocalParticipantUUID;
- (NSUUID)participantGroupUUID;
- (double)duration;
- (id)archivedDataWithError:(id *)a3;
- (id)callOccurrencesArrayByAddingCallOccurrencesFromArray:(id)a3;
- (id)callOccurrencesAsString;
- (id)callerIdSubStringForDisplay;
- (id)callerNameForDisplay;
- (id)coalescedCallWithCall:(id)a3 usingStrategy:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getLocalizedString:(id)a3;
- (id)validRemoteParticipantHandles;
- (int64_t)autoAnsweredReason;
- (int64_t)callDirectoryIdentityType;
- (int64_t)countOfExcludedHandles;
- (int64_t)handleType;
- (int64_t)junkConfidence;
- (int64_t)mediaType;
- (int64_t)ttyType;
- (int64_t)verificationStatus;
- (unint64_t)hash;
- (unint64_t)numberOfOccurrences;
- (unint64_t)screenSharingType;
- (unint64_t)unreadCount;
- (unsigned)callCategory;
- (unsigned)callStatus;
- (unsigned)callType;
- (unsigned)callerIdAvailability;
- (void)addressBookRecordId;
- (void)callerName;
- (void)callerNameForDisplay;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAndSetContactIdentifier;
- (void)fetchAndSetFullContact;
- (void)fixCallTypeInfo;
- (void)setAddressBookCallerIDMultiValueId:(id)a3;
- (void)setAddressBookRecordId:(id)a3;
- (void)setAnswered:(BOOL)a3;
- (void)setAutoAnsweredReason:(int64_t)a3;
- (void)setBlockedByExtension:(id)a3;
- (void)setBlockedByExtensionName:(id)a3;
- (void)setBytesOfDataUsed:(id)a3;
- (void)setCallCategory:(unsigned int)a3;
- (void)setCallDirectoryIdentityType:(int64_t)a3;
- (void)setCallOccurrences:(id)a3;
- (void)setCallStatus:(unsigned int)a3;
- (void)setCallType:(unsigned int)a3;
- (void)setCallerId:(id)a3;
- (void)setCallerIdAvailability:(unsigned int)a3;
- (void)setCallerIdFormatted:(id)a3;
- (void)setCallerIdIsBlocked:(BOOL)a3;
- (void)setCallerIdLabel:(id)a3;
- (void)setCallerIdLocation:(id)a3;
- (void)setCallerName:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContactRef:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDate:(id)a3;
- (void)setDevicePhoneId:(id)a3;
- (void)setDisconnectedCause:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEmergencyMediaItems:(id)a3;
- (void)setFilteredOutReason:(id)a3;
- (void)setHandleType:(int64_t)a3;
- (void)setHasMessage:(BOOL)a3;
- (void)setIdentityExtension:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJunkConfidence:(int64_t)a3;
- (void)setJunkIdentificationCategory:(id)a3;
- (void)setLocalParticipantUUID:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setMobileCountryCode:(id)a3;
- (void)setMobileNetworkCode:(id)a3;
- (void)setMobileOriginated:(BOOL)a3;
- (void)setMultiCall:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutgoingLocalParticipantUUID:(id)a3;
- (void)setParticipantGroupUUID:(id)a3;
- (void)setPhoneBookManager:(id)a3;
- (void)setRead:(BOOL)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setServiceProvider:(id)a3;
- (void)setTimeToEstablish:(id)a3;
- (void)setTtyType:(int64_t)a3;
- (void)setUniqueId:(id)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)setUsedEmergencyVideoStreaming:(BOOL)a3;
- (void)setVerificationStatus:(int64_t)a3;
- (void)setWasAutoAnswered:(BOOL)a3;
- (void)setWasEmergencyCall:(BOOL)a3;
- (void)updateTTYAndMediaType;
@end

@implementation CHRecentCall

- (NSUUID)participantGroupUUID
{
  return self->_participantGroupUUID;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isJunk
{
  return [(CHRecentCall *)self junkConfidence] > 1;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHRecentCall *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CHRecentCall *)self isEqualToRecentCall:v4];
  }

  return v5;
}

- (BOOL)isEqualToRecentCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CHRecentCall *)self uniqueId];
  v6 = [v4 uniqueId];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (!v8)
    {

      goto LABEL_7;
    }
    int v10 = [(id)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_7;
    }
  }
  int v11 = [(CHRecentCall *)self hasMessage];
  if (v11 != [v4 hasMessage])
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  BOOL v12 = [(CHRecentCall *)self isEquivalentToRecentCall:v4];
LABEL_8:

  return v12;
}

- (NSUUID)outgoingLocalParticipantUUID
{
  outgoingLocalParticipantUUID = self->_outgoingLocalParticipantUUID;
  p_outgoingLocalParticipantUUID = &self->_outgoingLocalParticipantUUID;
  id v4 = outgoingLocalParticipantUUID;
  if (!outgoingLocalParticipantUUID)
  {
    objc_storeStrong((id *)p_outgoingLocalParticipantUUID, self->_localParticipantUUID);
    id v4 = self->_outgoingLocalParticipantUUID;
  }
  return v4;
}

- (unint64_t)hash
{
  v2 = [(CHRecentCall *)self uniqueId];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)canCoalesceRemoteParticipantHandlesFromCall:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!-[CHRecentCall hasMessage](self, "hasMessage") && ![v4 hasMessage])
  {
    uint64_t v13 = [(CHRecentCall *)self isoCountryCode];
    uint64_t v14 = [v4 isoCountryCode];
    char v15 = (v13 | v14) == 0;
    if (v14) {
      char v15 = [(id)v13 isEqualToString:v14];
    }

    if (v15)
    {
      int v16 = [(CHRecentCall *)self callerIdIsBlocked];
      if (v16 != [v4 callerIdIsBlocked])
      {
        v17 = +[CHLogServer sharedInstance];
        v18 = [v17 logHandleForDomain:"CHRecentCall"];

        unint64_t v7 = v18;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        v19 = [(CHRecentCall *)self uniqueId];
        v20 = [v4 uniqueId];
        int v67 = 138544130;
        v68 = v19;
        __int16 v69 = 2114;
        v70 = v20;
        __int16 v71 = 1026;
        *(_DWORD *)v72 = [(CHRecentCall *)self callerIdIsBlocked];
        *(_WORD *)&v72[4] = 1026;
        *(_DWORD *)&v72[6] = [v4 callerIdIsBlocked];
        _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: callerID block statuses are not the same. self.callerIdIsBlocked: %{public}d, otherCall.callerIdIsBlocked: %{public}d", (uint8_t *)&v67, 0x22u);
LABEL_23:

        goto LABEL_24;
      }
      v25 = [(CHRecentCall *)self remoteParticipantHandles];
      uint64_t v26 = [v25 count];

      v27 = [v4 remoteParticipantHandles];
      uint64_t v28 = [v27 count];

      if (v26 == v28)
      {
        if (v26 != 1)
        {
          if (!v26)
          {
            v29 = +[CHLogServer sharedInstance];
            v30 = [v29 logHandleForDomain:"CHRecentCall"];

            unint64_t v7 = v30;
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_24;
            }
            unint64_t v8 = [(CHRecentCall *)self uniqueId];
            v9 = [v4 uniqueId];
            int v67 = 138544130;
            v68 = v8;
            __int16 v69 = 2114;
            v70 = v9;
            __int16 v71 = 2048;
            *(void *)v72 = 0;
            *(_WORD *)&v72[8] = 2048;
            uint64_t v73 = 0;
            int v10 = "%{public}@ cannot coalesce with %{public}@: calls don't have any remote participants. self.remoteParti"
                  "cipantHandles.count: %lu, otherCall.remoteParticipantHandles.count: %lu";
            int v11 = v7;
            uint32_t v12 = 42;
            goto LABEL_6;
          }
          v49 = [(CHRecentCall *)self remoteParticipantHandles];
          unint64_t v50 = [v49 count];

          if (v50 < 2) {
            goto LABEL_45;
          }
          v51 = [(CHRecentCall *)self notificationThreadIdentifier];
          v52 = [v4 notificationThreadIdentifier];
          char v53 = [v51 isEqualToString:v52];

          if ((v53 & 1) == 0) {
            goto LABEL_45;
          }
LABEL_43:
          BOOL v35 = 1;
          goto LABEL_26;
        }
        v37 = [(CHRecentCall *)self remoteParticipantHandles];
        unint64_t v7 = [v37 anyObject];

        v38 = [v4 remoteParticipantHandles];
        v39 = [v38 anyObject];

        v40 = [v7 value];
        if ([v40 length])
        {
          v41 = [v39 value];
          uint64_t v42 = [v41 length];

          if (v42)
          {
            uint64_t v43 = [v39 normalizedValue];
            if (v43)
            {
              v44 = (void *)v43;
              v45 = [v39 normalizedValue];
              if ([v45 length])
              {
                v46 = [v7 normalizedValue];
                v47 = [v39 normalizedValue];
                int v48 = [v46 isEqualToString:v47];

                if (v48)
                {

                  goto LABEL_43;
                }
              }
              else
              {
              }
            }
            v61 = [v39 value];
            if ([v61 length])
            {
              v62 = [v7 value];
              v63 = [v39 value];
              char v64 = [v62 isEqualToString:v63];

              if (v64) {
                goto LABEL_43;
              }
            }
            else
            {
            }
LABEL_45:
            v65 = +[CHLogServer sharedInstance];
            v66 = [v65 logHandleForDomain:"CHRecentCall"];

            unint64_t v7 = v66;
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_24;
            }
            unint64_t v8 = [(CHRecentCall *)self notificationThreadIdentifier];
            v9 = [v4 notificationThreadIdentifier];
            int v67 = 138543618;
            v68 = v8;
            __int16 v69 = 2114;
            v70 = v9;
            int v10 = "%{public}@ cannot coalesce with %{public}@: Handle hashes are not the same";
            goto LABEL_5;
          }
        }
        else
        {
        }
        v54 = +[CHLogServer sharedInstance];
        v55 = [v54 logHandleForDomain:"CHRecentCall"];

        v56 = v55;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = [(CHRecentCall *)self uniqueId];
          v58 = [v4 uniqueId];
          v59 = [(CHRecentCall *)self remoteParticipantHandles];
          v60 = [v4 remoteParticipantHandles];
          int v67 = 138544130;
          v68 = v57;
          __int16 v69 = 2114;
          v70 = v58;
          __int16 v71 = 2112;
          *(void *)v72 = v59;
          *(_WORD *)&v72[8] = 2112;
          uint64_t v73 = (uint64_t)v60;
          _os_log_impl(&dword_1B8E4A000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: One or both calls have a remoteParticipantHandle with length 0. self.remoteParticipantHandles: %@, otherCall.remoteParticipantHandles: %@", (uint8_t *)&v67, 0x2Au);
        }
        goto LABEL_25;
      }
      v31 = +[CHLogServer sharedInstance];
      v32 = [v31 logHandleForDomain:"CHRecentCall"];

      unint64_t v7 = v32;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      v19 = [(CHRecentCall *)self uniqueId];
      v20 = [v4 uniqueId];
      v23 = [(CHRecentCall *)self remoteParticipantHandles];
      uint64_t v33 = [v23 count];
      v34 = [v4 remoteParticipantHandles];
      int v67 = 138544130;
      v68 = v19;
      __int16 v69 = 2114;
      v70 = v20;
      __int16 v71 = 2048;
      *(void *)v72 = v33;
      *(_WORD *)&v72[8] = 2048;
      uint64_t v73 = [v34 count];
      _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: remote participant counts are different. self.remoteParticipantHandles.count: %lu, otherCall.remoteParticipantHandles.count: %lu", (uint8_t *)&v67, 0x2Au);
    }
    else
    {
      v21 = +[CHLogServer sharedInstance];
      v22 = [v21 logHandleForDomain:"CHRecentCall"];

      unint64_t v7 = v22;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      v19 = [(CHRecentCall *)self uniqueId];
      v20 = [v4 uniqueId];
      v23 = [(CHRecentCall *)self isoCountryCode];
      v24 = [v4 isoCountryCode];
      int v67 = 138544130;
      v68 = v19;
      __int16 v69 = 2114;
      v70 = v20;
      __int16 v71 = 2114;
      *(void *)v72 = v23;
      *(_WORD *)&v72[8] = 2114;
      uint64_t v73 = (uint64_t)v24;
      _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: ISO codes are not the same. self.isoCountryCode: %{public}@, otherCall.isoCountryCode: %{public}@", (uint8_t *)&v67, 0x2Au);
    }
    goto LABEL_23;
  }
  BOOL v5 = +[CHLogServer sharedInstance];
  v6 = [v5 logHandleForDomain:"CHRecentCall"];

  unint64_t v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(CHRecentCall *)self uniqueId];
    v9 = [v4 uniqueId];
    int v67 = 138543618;
    v68 = v8;
    __int16 v69 = 2114;
    v70 = v9;
    int v10 = "%{public}@ cannot coalesce with %{public}@: Both calls have messages";
LABEL_5:
    int v11 = v7;
    uint32_t v12 = 22;
LABEL_6:
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v67, v12);
  }
LABEL_24:

LABEL_25:
  BOOL v35 = 0;
LABEL_26:

  return v35;
}

- (BOOL)callerIdIsBlocked
{
  return self->_callerIdIsBlocked;
}

- (NSString)callerIdForDisplay
{
  id v4 = +[CHLogServer sharedInstance];
  BOOL v5 = [v4 logHandleForDomain:"CHRecentCall"];

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall addressBookRecordId].cold.4(a2);
  }

  unint64_t v7 = [(CHRecentCall *)self validRemoteParticipantHandles];
  unint64_t v8 = [v7 anyObject];

  if (![(NSString *)self->_callerIdFormatted length])
  {
    v9 = [v8 value];

    if (v9)
    {
      if ([v8 type] == 2)
      {
        int v10 = [CHPhoneNumber alloc];
        int v11 = [v8 value];
        uint32_t v12 = [(CHRecentCall *)self isoCountryCode];
        uint64_t v13 = [(CHPhoneNumber *)v10 initWithDigits:v11 isoCountryCode:v12];

        uint64_t v14 = [(NSString *)v13 formattedRepresentation];
        callerIdFormatted = self->_callerIdFormatted;
        self->_callerIdFormatted = v14;

        if (!self->_callerIdFormatted)
        {
          int v16 = [v8 value];
          v17 = self->_callerIdFormatted;
          self->_callerIdFormatted = v16;
        }
      }
      else
      {
        v18 = [v8 value];
        uint64_t v13 = self->_callerIdFormatted;
        self->_callerIdFormatted = v18;
      }
    }
  }
  v19 = self->_callerIdFormatted;

  return v19;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (int64_t)countOfExcludedHandles
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CHRecentCall *)self remoteParticipantHandles];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isTemporary] & 1) != 0 || objc_msgSend(v8, "isPseudonym")) {
          ++v5;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)validRemoteParticipantHandles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(CHRecentCall *)self remoteParticipantHandles];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isTemporary", (void)v12) & 1) != 0 || objc_msgSend(v9, "isPseudonym")) {
          [v3 removeObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = (void *)[v3 copy];
  return v10;
}

- (NSSet)remoteParticipantHandles
{
  if (![(NSSet *)self->_remoteParticipantHandles count] && [(NSString *)self->_callerId length])
  {
    uint64_t v3 = self->_callerId;
    if ([(NSString *)v3 length])
    {
      int64_t v4 = +[CHHandle handleTypeForValue:v3];
      if (v4)
      {
        int64_t v5 = v4;
        if ([(NSString *)v3 length])
        {
          uint64_t v6 = [[CHHandle alloc] initWithType:v5 value:v3];
          uint64_t v7 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, 0);
          remoteParticipantHandles = self->_remoteParticipantHandles;
          self->_remoteParticipantHandles = v7;
        }
      }
    }
  }
  v9 = self->_remoteParticipantHandles;
  return v9;
}

- (void)updateTTYAndMediaType
{
  if (!self->_mediaType) {
    self->_mediaType = +[CHRecentCall mediaTypeForCallCategory:self->_callCategory];
  }
  self->_ttyType = +[CHRecentCall ttyTypeForCallCategory:self->_callCategory];
}

+ (int64_t)ttyTypeForCallCategory:(unsigned int)a3
{
  if ((a3 & 8) != 0) {
    return 2;
  }
  else {
    return (a3 & 4) != 0;
  }
}

- (void)setHasMessage:(BOOL)a3
{
  self->_hasMessage = a3;
}

- (void)setCallOccurrences:(id)a3
{
}

- (CHRecentCall)init
{
  v10.receiver = self;
  v10.super_class = (Class)CHRecentCall;
  v2 = [(CHRecentCall *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    int64_t v4 = [v3 UUIDString];
    uint64_t v5 = [v4 copy];
    uniqueId = v2->_uniqueId;
    v2->_uniqueId = (NSString *)v5;

    v2->_callType = 0x80000000;
    *(_WORD *)&v2->_read = 1;
    v2->_duration = 0.0;
    v2->_callStatus = 0;
    v2->_callerIdAvailability = 0;
    v2->_verificationStatus = 0;
    v2->_mediaType = 0;
    v2->_ttyType = 0;
    conversationID = v2->_conversationID;
    v2->_handleType = 0;
    v2->_conversationID = 0;

    v2->_autoAnsweredReason = 0;
    emergencyMediaItems = v2->_emergencyMediaItems;
    v2->_emergencyMediaItems = 0;

    *(_WORD *)&v2->_usedEmergencyVideoStreaming = 0;
    v2->_callDirectoryIdentityType = 0;
    v2->_screenSharingType = 0;
  }
  return v2;
}

- (void)setWasEmergencyCall:(BOOL)a3
{
  self->_wasEmergencyCall = a3;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (void)setUsedEmergencyVideoStreaming:(BOOL)a3
{
  self->_usedEmergencyVideoStreaming = a3;
}

- (void)setUniqueId:(id)a3
{
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (void)setRead:(BOOL)a3
{
  if (self->_read != a3)
  {
    BOOL v3 = a3;
    self->_read = a3;
    unint64_t v5 = [(CHRecentCall *)self unreadCount];
    if (v3) {
      unint64_t v6 = v5 - 1;
    }
    else {
      unint64_t v6 = v5 + 1;
    }
    [(CHRecentCall *)self setUnreadCount:v6];
  }
}

- (void)setParticipantGroupUUID:(id)a3
{
}

- (void)setOutgoingLocalParticipantUUID:(id)a3
{
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_blockedByExtension)
  {
    name = self->_name;
    self->_name = 0;
    goto LABEL_12;
  }
  if ([v4 length]) {
    unint64_t v6 = v13;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;
  v9 = self->_name;
  p_name = &self->_name;
  id v10 = v9;
  id v11 = v7;
  name = (NSString *)v11;
  if (!((unint64_t)v10 | (unint64_t)v11)) {
    goto LABEL_12;
  }
  if (!v11)
  {

    goto LABEL_11;
  }
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0) {
LABEL_11:
  }
    objc_storeStrong((id *)p_name, v6);
LABEL_12:
}

- (void)setLocalParticipantUUID:(id)a3
{
}

- (void)setJunkIdentificationCategory:(id)a3
{
}

- (void)setJunkConfidence:(int64_t)a3
{
  self->_junkConfidence = a3;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (void)setInitiator:(id)a3
{
}

- (void)setImageURL:(id)a3
{
}

- (void)setIdentityExtension:(id)a3
{
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (void)setFilteredOutReason:(id)a3
{
}

- (void)setEmergencyMediaItems:(id)a3
{
}

- (void)setDuration:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (self->_duration != v3) {
    self->_duration = v3;
  }
}

- (void)setDisconnectedCause:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void)setConversationID:(id)a3
{
}

- (void)setCallerIdLocation:(id)a3
{
}

- (void)setCallerIdAvailability:(unsigned int)a3
{
  if (self->_callerIdAvailability != a3)
  {
    self->_callerIdAvailability = a3;
    [(CHRecentCall *)self setCallerIdIsBlocked:a3 == 1];
  }
}

- (void)setCallerId:(id)a3
{
}

- (void)setCallType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_callType = a3;
  if (!self->_serviceProvider)
  {
    unint64_t v5 = +[CHRecentCall serviceProviderForCallType:*(void *)&a3];
    serviceProvider = self->_serviceProvider;
    self->_serviceProvider = v5;
  }
  if (!self->_callCategory) {
    self->_callCategory = +[CHRecentCall categoryForCallType:v3];
  }
  [(CHRecentCall *)self updateTTYAndMediaType];
}

- (void)setCallStatus:(unsigned int)a3
{
  self->_callStatus = a3;
}

- (void)setCallDirectoryIdentityType:(int64_t)a3
{
  self->_callDirectoryIdentityType = a3;
}

- (void)setBytesOfDataUsed:(id)a3
{
}

- (void)setBlockedByExtension:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_blockedByExtension, a3);
    name = self->_name;
    self->_name = 0;

    id v5 = v7;
  }
}

- (void)setAutoAnsweredReason:(int64_t)a3
{
  self->_autoAnsweredReason = a3;
}

+ (int64_t)mediaTypeForCallCategory:(unsigned int)a3
{
  if ((a3 & 2) != 0) {
    return 2;
  }
  else {
    return (a3 & 1) != 0;
  }
}

- (BOOL)hasMessage
{
  return self->_hasMessage;
}

- (NSString)notificationThreadIdentifier
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(CHRecentCall *)self remoteParticipantHandles];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= [*(id *)(*((void *)&v11 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
  v9 = [v8 stringValue];

  return (NSString *)v9;
}

- (BOOL)canCoalesceSyncWithRecentsStrategyWithCall:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(CHRecentCall *)self callStatus] == 8;
  if (((v5 ^ ([v4 callStatus] != 8)) & 1) == 0)
  {
    v24 = +[CHLogServer sharedInstance];
    v25 = [v24 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v25;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    v27 = [(CHRecentCall *)self uniqueId];
    uint64_t v28 = [v4 uniqueId];
    v29 = +[CHRecentCall callStatusAsString:[(CHRecentCall *)self callStatus]];
    v30 = +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", [v4 callStatus]);
    int v53 = 138544130;
    v54 = v27;
    __int16 v55 = 2114;
    v56 = v28;
    __int16 v57 = 2114;
    v58 = v29;
    __int16 v59 = 2114;
    v60 = v30;
    v31 = "%{public}@ cannot coalesce with %{public}@: Call status doesn't match. MyStatus: %{public}@, OtherStatus: %{public}@";
    goto LABEL_24;
  }
  int64_t v6 = [(CHRecentCall *)self mediaType];
  if (v6 != [v4 mediaType])
  {
    v32 = +[CHLogServer sharedInstance];
    uint64_t v33 = [v32 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v33;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    v27 = [(CHRecentCall *)self uniqueId];
    uint64_t v28 = [v4 uniqueId];
    v29 = +[CHRecentCall callMediaTypeAsString:[(CHRecentCall *)self mediaType]];
    v30 = +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", [v4 mediaType]);
    int v53 = 138544130;
    v54 = v27;
    __int16 v55 = 2114;
    v56 = v28;
    __int16 v57 = 2114;
    v58 = v29;
    __int16 v59 = 2114;
    v60 = v30;
    v31 = "%{public}@ cannot coalesce with %{public}@: Call media type does not match. MyMediaType: %{public}@, OtherMedi"
          "aType: %{public}@";
    goto LABEL_24;
  }
  int64_t v7 = [(CHRecentCall *)self ttyType];
  if (v7 != [v4 ttyType])
  {
    v34 = +[CHLogServer sharedInstance];
    BOOL v35 = [v34 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v35;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    v27 = [(CHRecentCall *)self uniqueId];
    uint64_t v28 = [v4 uniqueId];
    v29 = +[CHRecentCall callTTYTypeAsString:[(CHRecentCall *)self ttyType]];
    v30 = +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", [v4 ttyType]);
    int v53 = 138544130;
    v54 = v27;
    __int16 v55 = 2114;
    v56 = v28;
    __int16 v57 = 2114;
    v58 = v29;
    __int16 v59 = 2114;
    v60 = v30;
    v31 = "%{public}@ cannot coalesce with %{public}@: Call TTY type does not match. MyTTYType: %{public}@, OtherTTYType: %{public}@";
LABEL_24:
    _os_log_impl(&dword_1B8E4A000, v26, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v53, 0x2Au);

LABEL_25:
    goto LABEL_26;
  }
  unint64_t v8 = [(CHRecentCall *)self date];
  v9 = [v4 date];
  char v10 = [v8 isSameDayAsDate:v9];

  if ((v10 & 1) == 0)
  {
    v37 = +[CHLogServer sharedInstance];
    v38 = [v37 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v38;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    v29 = [(CHRecentCall *)self uniqueId];
    v39 = [v4 uniqueId];
    int v53 = 138543618;
    v54 = v29;
    __int16 v55 = 2114;
    v56 = v39;
    _os_log_impl(&dword_1B8E4A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ cannot coalesce with %{public}@: Calls happened on different dates.", (uint8_t *)&v53, 0x16u);

    goto LABEL_25;
  }
  uint64_t v11 = [(CHRecentCall *)self serviceProvider];
  uint64_t v12 = [v4 serviceProvider];
  char v13 = (v11 | v12) == 0;
  if (v12) {
    char v13 = [(id)v11 isEqualToString:v12];
  }

  if ((v13 & 1) == 0)
  {
    v40 = +[CHLogServer sharedInstance];
    v41 = [v40 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v41;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v42 = [(CHRecentCall *)self uniqueId];
    uint64_t v43 = [v4 uniqueId];
    v44 = [(CHRecentCall *)self serviceProvider];
    v45 = [v4 serviceProvider];
    int v53 = 138544130;
    v54 = v42;
    __int16 v55 = 2114;
    v56 = v43;
    __int16 v57 = 2114;
    v58 = v44;
    __int16 v59 = 2114;
    v60 = v45;
    v46 = "%{public}@ cannot coalesce with %{public}@: Call service provider does not match. MyServiceProvider: %{public}"
          "@, OtherServiceProvider: %{public}@";
LABEL_38:
    _os_log_impl(&dword_1B8E4A000, v26, OS_LOG_TYPE_DEFAULT, v46, (uint8_t *)&v53, 0x2Au);

    goto LABEL_26;
  }
  uint64_t v14 = [(CHRecentCall *)self localParticipantUUID];
  uint64_t v15 = [v4 localParticipantUUID];
  char v16 = (v14 | v15) == 0;
  if (v15) {
    char v16 = [(id)v14 isEqual:v15];
  }

  if ((v16 & 1) == 0)
  {
    v47 = +[CHLogServer sharedInstance];
    int v48 = [v47 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v48;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v42 = [(CHRecentCall *)self uniqueId];
    uint64_t v43 = [v4 uniqueId];
    v44 = [(CHRecentCall *)self localParticipantUUID];
    v45 = [v4 localParticipantUUID];
    int v53 = 138544130;
    v54 = v42;
    __int16 v55 = 2114;
    v56 = v43;
    __int16 v57 = 2114;
    v58 = v44;
    __int16 v59 = 2114;
    v60 = v45;
    v46 = "%{public}@ cannot coalesce with %{public}@: Call UUIDs are not the same. MyLocalParticipantUUID: %{public}@, O"
          "therLocalParticipantUUID: %{public}@";
    goto LABEL_38;
  }
  uint64_t v17 = [(CHRecentCall *)self blockedByExtension];
  uint64_t v18 = [v4 blockedByExtension];
  char v19 = (v17 | v18) == 0;
  if (v18) {
    char v19 = [(id)v17 isEqual:v18];
  }

  if ((v19 & 1) == 0)
  {
    v49 = +[CHLogServer sharedInstance];
    unint64_t v50 = [v49 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v50;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v42 = [(CHRecentCall *)self uniqueId];
    uint64_t v43 = [v4 uniqueId];
    v44 = [(CHRecentCall *)self blockedByExtension];
    v45 = [v4 blockedByExtension];
    int v53 = 138544130;
    v54 = v42;
    __int16 v55 = 2114;
    v56 = v43;
    __int16 v57 = 2114;
    v58 = v44;
    __int16 v59 = 2114;
    v60 = v45;
    v46 = "%{public}@ cannot coalesce with %{public}@: Call blockedByExtensions are not the same. MyBlockedByExtension: %"
          "{public}@, OtherBlockedByExtension: %{public}@";
    goto LABEL_38;
  }
  uint64_t v20 = [(CHRecentCall *)self identityExtension];
  uint64_t v21 = [v4 identityExtension];
  char v22 = (v20 | v21) == 0;
  if (v21) {
    char v22 = [(id)v20 isEqual:v21];
  }

  if ((v22 & 1) == 0)
  {
    v51 = +[CHLogServer sharedInstance];
    v52 = [v51 logHandleForDomain:"CHRecentCall"];

    uint64_t v26 = v52;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = [(CHRecentCall *)self uniqueId];
      uint64_t v43 = [v4 uniqueId];
      v44 = [(CHRecentCall *)self identityExtension];
      v45 = [v4 identityExtension];
      int v53 = 138544130;
      v54 = v42;
      __int16 v55 = 2114;
      v56 = v43;
      __int16 v57 = 2114;
      v58 = v44;
      __int16 v59 = 2114;
      v60 = v45;
      v46 = "%{public}@ cannot coalesce with %{public}@: Call identityExtensions are not the same. MyIdentityExtension: %"
            "{public}@, OtherIdentityExtension: %{public}@";
      goto LABEL_38;
    }
LABEL_26:

    BOOL v23 = 0;
    goto LABEL_27;
  }
  BOOL v23 = [(CHRecentCall *)self canCoalesceRemoteParticipantHandlesFromCall:v4];
LABEL_27:

  return v23;
}

- (unsigned)callStatus
{
  return self->_callStatus;
}

- (NSUUID)localParticipantUUID
{
  return self->_localParticipantUUID;
}

- (NSString)blockedByExtension
{
  return self->_blockedByExtension;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CHRecentCall callStatus](self, "callStatus"));
  [v3 setObject:v4 forKeyedSubscript:@"kCHCallOccurrenceCallStatusKey"];

  BOOL v5 = NSNumber;
  [(CHRecentCall *)self duration];
  int64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"kCHCallOccurrenceDurationKey"];

  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CHRecentCall mediaType](self, "mediaType"));
  [v3 setObject:v7 forKeyedSubscript:@"kCHCallOccurrenceMediaTypeKey"];

  unint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CHRecentCall ttyType](self, "ttyType"));
  [v3 setObject:v8 forKeyedSubscript:@"kCHCallOccurrenceTTYTypeKey"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CHRecentCall verificationStatus](self, "verificationStatus"));
  [v3 setObject:v9 forKeyedSubscript:@"kCHCallOccurrenceVerificationStatusKey"];

  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CHRecentCall callType](self, "callType"));
  [v3 setObject:v10 forKeyedSubscript:@"kCHCallOccurrenceCallTypeKey"];

  uint64_t v11 = [(CHRecentCall *)self bytesOfDataUsed];
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"kCHCallOccurrenceDataUsageKey"];
  }
  uint64_t v12 = [(CHRecentCall *)self date];
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"kCHCallOccurrenceDateKey"];
  }
  char v13 = [(CHRecentCall *)self serviceProvider];
  if (v13) {
    [v3 setObject:v13 forKeyedSubscript:@"kCHCallOccurrenceServiceProviderKey"];
  }
  uint64_t v14 = [(CHRecentCall *)self uniqueId];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"kCHCallOccurrenceUniqueIdKey"];
  }
  if ([(CHRecentCall *)self wasEmergencyCall])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v15 = [(CHRecentCall *)self usedEmergencyVideoStreaming];
    long long v30 = 0u;
    long long v31 = 0u;
    char v16 = [(CHRecentCall *)self emergencyMediaItems];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    v27 = v11;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = [*(id *)(*((void *)&v28 + 1) + 8 * i) emergencyMediaType];
          if (v22 == 1)
          {
            ++v15;
          }
          else if (!v22)
          {
            ++v19;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }
    else
    {
      uint64_t v19 = 0;
    }

    BOOL v23 = [NSNumber numberWithInteger:v15];
    [v3 setObject:v23 forKeyedSubscript:@"kCHCallOccurrenceEmergencyVideosCountKey"];

    v24 = [NSNumber numberWithInteger:v19];
    [v3 setObject:v24 forKeyedSubscript:@"kCHCallOccurrenceEmergencyImagesCountKey"];

    uint64_t v11 = v27;
  }
  v25 = (void *)[v3 copy];

  return (NSDictionary *)v25;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (BOOL)wasEmergencyCall
{
  return self->_wasEmergencyCall;
}

- (void)setServiceProvider:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_serviceProvider;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    if (v6)
    {
      BOOL v7 = [(id)v5 isEqualToString:v6];

      unint64_t v8 = v11;
      if (v7) {
        goto LABEL_7;
      }
    }
    else
    {

      unint64_t v8 = 0;
    }
    v9 = (NSString *)[v8 copy];
    serviceProvider = self->_serviceProvider;
    self->_serviceProvider = v9;

    self->_callCategory = +[CHRecentCall categoryForMediaType:[(CHRecentCall *)self mediaType] andTTYType:[(CHRecentCall *)self ttyType]];
    self->_callType = +[CHRecentCall getCallTypeForCategory:[(CHRecentCall *)self callCategory] andServiceProvider:v11];
  }
LABEL_7:
  MEMORY[0x1F4181820]();
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setCallCategory:(unsigned int)a3
{
  if (self->_callCategory != a3)
  {
    uint64_t v3 = *(void *)&a3;
    self->_callCategory = a3;
    unint64_t v5 = [(CHRecentCall *)self serviceProvider];
    self->_callType = +[CHRecentCall getCallTypeForCategory:v3 andServiceProvider:v5];

    [(CHRecentCall *)self updateTTYAndMediaType];
  }
}

- (NSString)serviceProvider
{
  return self->_serviceProvider;
}

+ (unsigned)getCallTypeForCategory:(unsigned int)a3 andServiceProvider:(id)a4
{
  char v4 = a3;
  id v5 = a4;
  unint64_t v6 = v5;
  if (v4)
  {
    if ([v5 isEqualToString:@"com.apple.Telephony"])
    {
      BOOL v7 = &kCHCallTypeNormal;
      goto LABEL_10;
    }
    if ([v6 isEqualToString:@"com.apple.FaceTime"])
    {
      BOOL v7 = &kCHCallTypeFaceTimeAudio;
      goto LABEL_10;
    }
  }
  if (v4 & 2) != 0 && ([v6 isEqualToString:@"com.apple.FaceTime"]) {
    BOOL v7 = &kCHCallTypeFaceTimeVideo;
  }
  else {
    BOOL v7 = &kCHCallTypeNone;
  }
LABEL_10:
  unsigned int v8 = *v7;

  return v8;
}

- (double)duration
{
  return self->_duration;
}

- (unsigned)callType
{
  return self->_callType;
}

- (unsigned)callCategory
{
  return self->_callCategory;
}

- (NSNumber)bytesOfDataUsed
{
  return self->_bytesOfDataUsed;
}

+ (unsigned)categoryForMediaType:(int64_t)a3 andTTYType:(int64_t)a4
{
  if (a3 == 2)
  {
    char v4 = &kCHCallCategoryVideo;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    char v4 = &kCHCallCategoryAudio;
LABEL_5:
    unsigned int result = *v4;
    goto LABEL_7;
  }
  unsigned int result = 0;
LABEL_7:
  if (a4 == 1)
  {
    unint64_t v6 = &kCHCallCategoryTTYDirect;
  }
  else
  {
    if (a4 != 2) {
      return result;
    }
    unint64_t v6 = &kCHCallCategoryTTYRelay;
  }
  result |= *v6;
  return result;
}

- (NSString)identityExtension
{
  return self->_identityExtension;
}

+ (id)callStatusAsString:(unsigned int)a3
{
  switch(a3)
  {
    case 1u:
      return @"kCallStatusConnectedIncoming";
    case 2u:
      return @"kCallStatusConnectedOutgoing";
    case 4u:
      return @"kCallStatusAnsweredElsewhere";
    case 8u:
      return @"kCallStatusMissed";
    case 0x10u:
      return @"kCallStatusCancelled";
    case 7u:
      return @"kCallStatusConnected";
    case 0x1Fu:
      return @"kCallStatusAll";
    case 0xFFFFFFF7:
      return @"kCallStatusAllButMissed";
  }
  return @"Unknown";
}

- (void)setCallerIdIsBlocked:(BOOL)a3
{
  self->_callerIdIsBlocked = a3;
}

- (void)setPhoneBookManager:(id)a3
{
}

+ (id)predicateForCallsWithServiceProvider:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"service_provider = %@", a3];
}

+ (id)predicateForCallsWithCategory:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(call_category & %d) = %d", *(void *)&a3, *(void *)&a3);
}

+ (id)predicateForCallsWithMediaType:(int64_t)a3
{
  if (a3 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = a3 == 1;
  }
  if (v3 == 1 || v3 == 2) {
    objc_msgSend(a1, "predicateForCallsWithCategory:");
  }
  else {
  id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  return v5;
}

+ (id)predicateForCallsWithTTYType:(int64_t)a3
{
  if (a3 == 2)
  {
    int v3 = 8;
  }
  else if (a3 == 1)
  {
    int v3 = 4;
  }
  else
  {
    int v3 = 0;
  }
  if (v3 == 4 || v3 == 8) {
    objc_msgSend(a1, "predicateForCallsWithCategory:");
  }
  else {
  id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  return v5;
}

+ (id)callTypeAsString:(unsigned int)a3
{
  switch(a3)
  {
    case 1u:
      return @"kCallTypeNormal";
    case 2u:
      return @"kCallTypeVoicemail";
    case 4u:
      return @"kCallTypeVOIP";
    case 8u:
      return @"kCallTypeFaceTimeVideo";
    case 0x10u:
      return @"kCallTypeFaceTimeAudio";
    case 0xFFFFFFFF:
      return @"kCallTypeAll";
    case 7u:
      return @"kCallTypeTelephony";
    case 0x18u:
      return @"kCallTypeFaceTime";
  }
  return @"Unknown";
}

- (id)coalescedCallWithCall:(id)a3 usingStrategy:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CHRecentCall *)self canCoalesceWithCall:v6 withStrategy:a4])
  {
    BOOL v7 = [v6 callOccurrences];
    if (![v7 count])
    {
      unsigned int v8 = [v6 dictionaryRepresentation];
      v14[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

      BOOL v7 = (void *)v9;
    }
    char v10 = (void *)[(CHRecentCall *)self copy];
    id v11 = [(CHRecentCall *)self callOccurrencesArrayByAddingCallOccurrencesFromArray:v7];
    [v10 setCallOccurrences:v11];

    uint64_t v12 = 1;
    [v10 setMultiCall:1];
    objc_msgSend(v10, "setUnreadCount:", objc_msgSend(v10, "unreadCount") + objc_msgSend(v6, "unreadCount"));
    if (([v10 hasMessage] & 1) == 0) {
      uint64_t v12 = [v6 hasMessage];
    }
    [v10 setHasMessage:v12];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)canCoalesceWithCall:(id)a3 withStrategy:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"kCHCoalescingStrategyRecents"])
  {
    if (![(CHRecentCall *)self canCoalesceSyncWithRecentsStrategyWithCall:v6])
    {
LABEL_9:
      BOOL v13 = 0;
      goto LABEL_10;
    }
  }
  else if (![v7 isEqualToString:@"kCHCoalescingStrategyCollapseIfEqual"] {
         || ![(CHRecentCall *)self canCoalesceRemoteParticipantHandlesFromCall:v6])
  }
  {
    goto LABEL_9;
  }
  unsigned int v8 = +[CHLogServer sharedInstance];
  uint64_t v9 = [v8 logHandleForDomain:"CHRecentCall"];

  char v10 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(CHRecentCall *)self uniqueId];
    uint64_t v12 = [v6 uniqueId];
    int v15 = 138412802;
    char v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "%@ can coalesce with %@ using %@", (uint8_t *)&v15, 0x20u);
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (void)setMultiCall:(BOOL)a3
{
  self->_multiCall = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[CHRecentCall allocWithZone:](CHRecentCall, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_bytesOfDataUsed copyWithZone:a3];
  bytesOfDataUsed = v5->_bytesOfDataUsed;
  v5->_bytesOfDataUsed = (NSNumber *)v6;

  uint64_t v8 = [(NSString *)self->_callerName copyWithZone:a3];
  callerName = v5->_callerName;
  v5->_callerName = (NSString *)v8;

  uint64_t v10 = [(NSArray *)self->_callOccurrences copyWithZone:a3];
  callOccurrences = v5->_callOccurrences;
  v5->_callOccurrences = (NSArray *)v10;

  v5->_callStatus = self->_callStatus;
  uint64_t v12 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  contactIdentifier = v5->_contactIdentifier;
  v5->_contactIdentifier = (NSString *)v12;

  uint64_t v14 = [(CNContact *)self->_contactRef copyWithZone:a3];
  contactRef = v5->_contactRef;
  v5->_contactRef = (CNContact *)v14;

  uint64_t v16 = [(NSDate *)self->_date copyWithZone:a3];
  date = v5->_date;
  v5->_date = (NSDate *)v16;

  uint64_t v18 = [(NSNumber *)self->_disconnectedCause copyWithZone:a3];
  disconnectedCause = v5->_disconnectedCause;
  v5->_disconnectedCause = (NSNumber *)v18;

  v5->_duration = self->_duration;
  uint64_t v20 = [(NSNumber *)self->_filteredOutReason copyWithZone:a3];
  filteredOutReason = v5->_filteredOutReason;
  v5->_filteredOutReason = (NSNumber *)v20;

  uint64_t v22 = [(NSURL *)self->_imageURL copyWithZone:a3];
  imageURL = v5->_imageURL;
  v5->_imageURL = (NSURL *)v22;

  uint64_t v24 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  isoCountryCode = v5->_isoCountryCode;
  v5->_isoCountryCode = (NSString *)v24;

  v5->_junkConfidence = self->_junkConfidence;
  uint64_t v26 = [(NSString *)self->_junkIdentificationCategory copyWithZone:a3];
  junkIdentificationCategory = v5->_junkIdentificationCategory;
  v5->_junkIdentificationCategory = (NSString *)v26;

  uint64_t v28 = [(NSUUID *)self->_localParticipantUUID copyWithZone:a3];
  localParticipantUUID = v5->_localParticipantUUID;
  v5->_localParticipantUUID = (NSUUID *)v28;

  v5->_mediaType = self->_mediaType;
  uint64_t v30 = [(NSString *)self->_mobileCountryCode copyWithZone:a3];
  mobileCountryCode = v5->_mobileCountryCode;
  v5->_mobileCountryCode = (NSString *)v30;

  uint64_t v32 = [(NSString *)self->_mobileNetworkCode copyWithZone:a3];
  mobileNetworkCode = v5->_mobileNetworkCode;
  v5->_mobileNetworkCode = (NSString *)v32;

  v5->_multiCall = self->_multiCall;
  uint64_t v34 = [(NSString *)self->_name copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v34;

  uint64_t v36 = [(NSUUID *)self->_outgoingLocalParticipantUUID copyWithZone:a3];
  outgoingLocalParticipantUUID = v5->_outgoingLocalParticipantUUID;
  v5->_outgoingLocalParticipantUUID = (NSUUID *)v36;

  uint64_t v38 = [(NSUUID *)self->_participantGroupUUID copyWithZone:a3];
  participantGroupUUID = v5->_participantGroupUUID;
  v5->_participantGroupUUID = (NSUUID *)v38;

  v5->_read = self->_read;
  uint64_t v40 = [(NSSet *)self->_remoteParticipantHandles copyWithZone:a3];
  remoteParticipantHandles = v5->_remoteParticipantHandles;
  v5->_remoteParticipantHandles = (NSSet *)v40;

  uint64_t v42 = [(NSString *)self->_serviceProvider copyWithZone:a3];
  serviceProvider = v5->_serviceProvider;
  v5->_serviceProvider = (NSString *)v42;

  uint64_t v44 = [(NSNumber *)self->_timeToEstablish copyWithZone:a3];
  timeToEstablish = v5->_timeToEstablish;
  v5->_timeToEstablish = (NSNumber *)v44;

  v5->_ttyType = self->_ttyType;
  uint64_t v46 = [(NSString *)self->_uniqueId copyWithZone:a3];
  uniqueId = v5->_uniqueId;
  v5->_uniqueId = (NSString *)v46;

  v5->_unreadCount = self->_unreadCount;
  v5->_verificationStatus = self->_verificationStatus;
  v5->_hasMessage = self->_hasMessage;
  uint64_t v48 = [(NSUUID *)self->_conversationID copyWithZone:a3];
  conversationID = v5->_conversationID;
  v5->_conversationID = (NSUUID *)v48;

  v5->_autoAnsweredReason = self->_autoAnsweredReason;
  uint64_t v50 = [(NSSet *)self->_emergencyMediaItems copyWithZone:a3];
  emergencyMediaItems = v5->_emergencyMediaItems;
  v5->_emergencyMediaItems = (NSSet *)v50;

  v5->_usedEmergencyVideoStreaming = self->_usedEmergencyVideoStreaming;
  v5->_wasEmergencyCall = self->_wasEmergencyCall;
  v5->_callDirectoryIdentityType = self->_callDirectoryIdentityType;
  v5->_screenSharingType = self->_screenSharingType;
  objc_storeStrong((id *)&v5->_initiator, self->_initiator);
  uint64_t v52 = [(NSString *)self->_addressBookRecordId copyWithZone:a3];
  addressBookRecordId = v5->_addressBookRecordId;
  v5->_addressBookRecordId = (NSString *)v52;

  uint64_t v54 = [(NSString *)self->_callerId copyWithZone:a3];
  callerId = v5->_callerId;
  v5->_callerId = (NSString *)v54;

  v5->_callerIdAvailability = self->_callerIdAvailability;
  uint64_t v56 = [(NSString *)self->_callerIdFormatted copyWithZone:a3];
  callerIdFormatted = v5->_callerIdFormatted;
  v5->_callerIdFormatted = (NSString *)v56;

  v5->_callerIdIsBlocked = self->_callerIdIsBlocked;
  uint64_t v58 = [(NSString *)self->_callerIdLabel copyWithZone:a3];
  callerIdLabel = v5->_callerIdLabel;
  v5->_callerIdLabel = (NSString *)v58;

  uint64_t v60 = [(NSString *)self->_callerIdLocation copyWithZone:a3];
  callerIdLocation = v5->_callerIdLocation;
  v5->_callerIdLocation = (NSString *)v60;

  uint64_t v62 = [(NSString *)self->_devicePhoneId copyWithZone:a3];
  devicePhoneId = v5->_devicePhoneId;
  v5->_devicePhoneId = (NSString *)v62;

  v5->_handleType = self->_handleType;
  v5->_callType = [(id)objc_opt_class() getCallTypeForCategory:self->_callCategory andServiceProvider:self->_serviceProvider];
  uint64_t v64 = [(NSString *)self->_blockedByExtension copyWithZone:a3];
  blockedByExtension = v5->_blockedByExtension;
  v5->_blockedByExtension = (NSString *)v64;

  uint64_t v66 = [(NSString *)self->_blockedByExtensionName copyWithZone:a3];
  blockedByExtensionName = v5->_blockedByExtensionName;
  v5->_blockedByExtensionName = (NSString *)v66;

  uint64_t v68 = [(NSString *)self->_identityExtension copyWithZone:a3];
  identityExtension = v5->_identityExtension;
  v5->_identityExtension = (NSString *)v68;

  return v5;
}

- (id)callOccurrencesArrayByAddingCallOccurrencesFromArray:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CHRecentCall *)self callOccurrences];
  if (![v5 count])
  {
    uint64_t v6 = [(CHRecentCall *)self dictionaryRepresentation];
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    id v5 = (void *)v7;
  }
  uint64_t v8 = [v5 arrayByAddingObjectsFromArray:v4];

  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_119];

  return v9;
}

- (unint64_t)numberOfOccurrences
{
  v2 = [(CHRecentCall *)self callOccurrences];
  unint64_t v3 = [v2 count];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (NSArray)callOccurrences
{
  return self->_callOccurrences;
}

uint64_t __69__CHRecentCall_callOccurrencesArrayByAddingCallOccurrencesFromArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"kCHCallOccurrenceDateKey"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCHCallOccurrenceDateKey"];

  if (v6) {
    uint64_t v7 = [v5 compare:v6];
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (id)predicateForCallsWithStatusRead:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"read == %d", a3);
}

- (INInteraction)interaction
{
  v2 = [(CHRecentCall *)self uniqueId];
  id v9 = 0;
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F30508], "ch_interactionForIdentifier:error:", v2, &v9);
  id v4 = v9;
  id v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = ch_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CHRecentCall(Intents) *)(uint64_t)v2 interaction];
    }
  }
  return (INInteraction *)v3;
}

- (NSDateInterval)interactionDateInterval
{
  unint64_t v3 = [(CHRecentCall *)self date];
  if (v3
    && ([(CHRecentCall *)self duration], v4 >= 0.0)
    && (double v5 = v4,
        [(CHRecentCall *)self timeToEstablish],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        [v6 doubleValue],
        double v8 = v7,
        v6,
        v8 >= 0.0))
  {
    id v11 = [v3 dateByAddingTimeInterval:-v8];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 duration:v5 + v8];
  }
  else
  {
    id v9 = 0;
  }

  return (NSDateInterval *)v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  double v8 = [a1 unarchivedObjectClasses];
  id v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (BOOL)coalesceWithCall:(id)a3 withStrategy:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"CHRecentCall"];

  id v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(CHRecentCall *)self uniqueId];
    BOOL v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v7 uniqueId];
    int v28 = 138544130;
    long long v29 = v12;
    __int16 v30 = 2114;
    long long v31 = v13;
    __int16 v32 = 2114;
    uint64_t v33 = (uint64_t)v14;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "==> %{public}@ %{public}@ %{public}@ with %@", (uint8_t *)&v28, 0x2Au);
  }
  BOOL v15 = [(CHRecentCall *)self canCoalesceWithCall:v7 withStrategy:v8];
  if (v15)
  {
    uint64_t v16 = [v7 callOccurrences];
    __int16 v17 = [(CHRecentCall *)self callOccurrencesArrayByAddingCallOccurrencesFromArray:v16];
    [(CHRecentCall *)self setCallOccurrences:v17];

    -[CHRecentCall setUnreadCount:](self, "setUnreadCount:", -[CHRecentCall unreadCount](self, "unreadCount") + [v7 unreadCount]);
    uint64_t v18 = 1;
    [(CHRecentCall *)self setMultiCall:1];
    if (![(CHRecentCall *)self hasMessage]) {
      uint64_t v18 = [v7 hasMessage];
    }
    [(CHRecentCall *)self setHasMessage:v18];
  }
  __int16 v19 = +[CHLogServer sharedInstance];
  uint64_t v20 = [v19 logHandleForDomain:"CHRecentCall"];

  uint64_t v21 = v20;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [(CHRecentCall *)self uniqueId];
    BOOL v23 = NSStringFromSelector(a2);
    uint64_t v24 = [v7 uniqueId];
    v25 = (void *)v24;
    int v28 = 138544386;
    uint64_t v26 = @"NO";
    long long v29 = v22;
    if (v15) {
      uint64_t v26 = @"YES";
    }
    __int16 v30 = 2114;
    long long v31 = v23;
    __int16 v32 = 2114;
    uint64_t v33 = v24;
    __int16 v34 = 2114;
    id v35 = v8;
    __int16 v36 = 2114;
    v37 = v26;
    _os_log_impl(&dword_1B8E4A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ %{public}@ with %{public}@ = %{public}@", (uint8_t *)&v28, 0x34u);
  }
  return v15;
}

- (CHHandle)initiator
{
  if ((self->_callStatus & 0xD) != 0 && !self->_initiator)
  {
    uint64_t v3 = [(CHRecentCall *)self validRemoteParticipantHandles];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      double v5 = [(CHRecentCall *)self validRemoteParticipantHandles];
      BOOL v6 = [v5 anyObject];
      initiator = self->_initiator;
      self->_initiator = v6;
    }
  }
  id v8 = self->_initiator;
  return v8;
}

- (void)setTimeToEstablish:(id)a3
{
  id v12 = a3;
  [v12 doubleValue];
  if (v4 <= 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = v12;
  }
  timeToEstablish = self->_timeToEstablish;
  p_timeToEstablish = &self->_timeToEstablish;
  id v8 = timeToEstablish;
  unint64_t v9 = (unint64_t)v5;
  uint64_t v10 = (void *)v9;
  if (v9 | (unint64_t)v8)
  {
    if (v9)
    {
      char v11 = [v8 isEqual:v9];

      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)p_timeToEstablish, v5);
  }
LABEL_10:
}

- (void)fetchAndSetContactIdentifier
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CHRecentCall *)self callerId];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = +[CHSharedAddressBook get];
    BOOL v6 = [(CHRecentCall *)self callerId];
    id v7 = [v5 fetchAddressBookInfoFromCacheForKey:v6];

    id v8 = +[CHLogServer sharedInstance];
    unint64_t v9 = [v8 logHandleForDomain:"CHRecentCall"];

    uint64_t v10 = v9;
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        id v12 = [(CHRecentCall *)self callerId];
        int v32 = 138412290;
        uint64_t v33 = v12;
        _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Address book information for %@ found in our cache, using it", (uint8_t *)&v32, 0xCu);
      }
      BOOL v13 = [v7 valueForKey:@"kCHABCacheCNContactIdKey"];
      contactIdentifier = self->_contactIdentifier;
      self->_contactIdentifier = v13;

      BOOL v15 = [v7 valueForKey:@"kCHABCacheCNContactRefKey"];
      contactRef = self->_contactRef;
      self->_contactRef = v15;

      __int16 v17 = +[CHLogServer sharedInstance];
      uint64_t v18 = [v17 logHandleForDomain:"CHRecentCall"];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = self->_contactIdentifier;
        uint64_t v20 = self->_contactRef;
        int v32 = 138412546;
        uint64_t v33 = v19;
        __int16 v34 = 2048;
        id v35 = v20;
        _os_log_impl(&dword_1B8E4A000, v18, OS_LOG_TYPE_DEFAULT, "Got CNContact Id: %@, CNContact Pointer: %p from the cache.", (uint8_t *)&v32, 0x16u);
      }
    }
    else
    {
      if (v11)
      {
        uint64_t v21 = [(CHRecentCall *)self callerId];
        int v32 = 138412290;
        uint64_t v33 = v21;
        _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Address book information for %@ not found in our cache, looking it up", (uint8_t *)&v32, 0xCu);
      }
      BOOL v22 = [(CHRecentCall *)self callerIdIsEmailAddress];
      BOOL v23 = [(CHRecentCall *)self phoneBookManager];
      uint64_t v24 = [(CHRecentCall *)self callerId];
      v25 = [(CHRecentCall *)self isoCountryCode];
      uint64_t v18 = [v23 getRecordId:v24 countryCode:v25 isEmail:v22];

      uint64_t v26 = [v18 valueForKey:@"kCHABCacheCNContactIdKey"];
      v27 = self->_contactIdentifier;
      self->_contactIdentifier = v26;

      int v28 = [(CHRecentCall *)self callerId];
      [v5 insertAddressBookInfoIntoCache:v18 forKey:v28];
    }
  }
  long long v29 = +[CHLogServer sharedInstance];
  __int16 v30 = [v29 logHandleForDomain:"CHRecentCall"];

  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    long long v31 = self->_contactIdentifier;
    int v32 = 138412290;
    uint64_t v33 = v31;
    _os_log_impl(&dword_1B8E4A000, v30, OS_LOG_TYPE_DEFAULT, "Fetched addressbook record id and multi value id. CNContact Id: %@.", (uint8_t *)&v32, 0xCu);
  }
}

- (void)fetchAndSetFullContact
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CHRecentCall *)self callerId];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = +[CHSharedAddressBook get];
    BOOL v6 = [(CHRecentCall *)self callerId];
    id v7 = [v5 fetchAddressBookInfoFromCacheForKey:v6];

    id v8 = [v7 valueForKey:@"kCHABCacheCNContactRefKey"];
    BOOL v9 = [(CHRecentCall *)self callerIdIsEmailAddress];
    uint64_t v10 = +[CHLogServer sharedInstance];
    BOOL v11 = [v10 logHandleForDomain:"CHRecentCall"];

    id v12 = v11;
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v13)
      {
        uint64_t v14 = [(CHRecentCall *)self callerId];
        int v27 = 138412290;
        int v28 = v14;
        _os_log_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_DEFAULT, "Full contact information for %@ found in our cache, using it", (uint8_t *)&v27, 0xCu);
      }
      objc_storeStrong((id *)&self->_contactRef, v8);
      BOOL v15 = +[CHLogServer sharedInstance];
      uint64_t v16 = [v15 logHandleForDomain:"CHRecentCall"];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        contactIdentifier = self->_contactIdentifier;
        contactRef = self->_contactRef;
        int v27 = 138412546;
        int v28 = contactIdentifier;
        __int16 v29 = 2048;
        __int16 v30 = contactRef;
        _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Got CNContact Id: %@, CNContact Pointer: %p from the cache.", (uint8_t *)&v27, 0x16u);
      }
    }
    else
    {
      if (v13)
      {
        __int16 v19 = [(CHRecentCall *)self callerId];
        int v27 = 138412290;
        int v28 = v19;
        _os_log_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_DEFAULT, "Full contact information for %@ not found in our cache, looking it up", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v16 = [(CHRecentCall *)self contactIdentifier];
      if ([v16 length])
      {
        uint64_t v20 = [(CHRecentCall *)self phoneBookManager];
        uint64_t v21 = [v20 fetchFullCNContactForContactIdentifier:v16 isEmail:v9];
        BOOL v22 = self->_contactRef;
        self->_contactRef = v21;
      }
      if (!self->_contactRef
        || (BOOL v23 = (void *)[v7 mutableCopy],
            [v23 setObject:self->_contactRef forKey:@"kCHABCacheCNContactRefKey"],
            [(CHRecentCall *)self callerId],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            [v5 insertAddressBookInfoIntoCache:v23 forKey:v24],
            v24,
            v23,
            !self->_contactRef))
      {
        v25 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1B8F8]);
        uint64_t v26 = self->_contactRef;
        self->_contactRef = v25;
      }
    }
  }
}

- (NSString)contactIdentifier
{
  contactIdentifier = self->_contactIdentifier;
  if (!contactIdentifier)
  {
    [(CHRecentCall *)self fetchAndSetContactIdentifier];
    contactIdentifier = self->_contactIdentifier;
  }
  if ([(NSString *)contactIdentifier isEqualToString:@"kCNContactInfoNotFound"])
  {
    uint64_t v4 = +[CHLogServer sharedInstance];
    id v5 = [v4 logHandleForDomain:"CHRecentCall"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "CNContact was searched before and not found. Don't need to look agian. Return nil.", v8, 2u);
    }

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = self->_contactIdentifier;
  }
  return v6;
}

- (CNContact)contactRef
{
  contactRef = self->_contactRef;
  if (!contactRef)
  {
    [(CHRecentCall *)self fetchAndSetFullContact];
    contactRef = self->_contactRef;
  }
  return contactRef;
}

- (NSString)addressBookRecordId
{
  uint64_t v4 = +[CHLogServer sharedInstance];
  id v5 = [v4 logHandleForDomain:"CHRecentCall"];

  BOOL v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall addressBookRecordId].cold.4(a2);
  }

  p_addressBookRecordId = &self->_addressBookRecordId;
  if (self->_addressBookRecordId)
  {
    id v8 = 0;
  }
  else
  {
    [(CHRecentCall *)self fetchAndSetContactIdentifier];
    id v8 = [(CHRecentCall *)self contactRef];
    if (!v8) {
      objc_storeStrong((id *)p_addressBookRecordId, @"kCNContactInfoNotFound");
    }
  }
  if ([(NSString *)*p_addressBookRecordId isEqualToString:@"kCNContactInfoNotFound"])
  {
    BOOL v9 = +[CHLogServer sharedInstance];
    uint64_t v10 = [v9 logHandleForDomain:"CHRecentCall"];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CHRecentCall addressBookRecordId](v10);
    }

    BOOL v11 = 0;
  }
  else
  {
    if (v8)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v8, "iOSLegacyIdentifier"));
      BOOL v13 = *p_addressBookRecordId;
      *p_addressBookRecordId = (NSString *)v12;

      uint64_t v14 = +[CHLogServer sharedInstance];
      BOOL v15 = [v14 logHandleForDomain:"CHRecentCall"];

      uint64_t v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[CHRecentCall addressBookRecordId]();
      }
    }
    BOOL v11 = *p_addressBookRecordId;
  }
  __int16 v17 = +[CHLogServer sharedInstance];
  uint64_t v18 = [v17 logHandleForDomain:"CHRecentCall"];

  __int16 v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall addressBookRecordId]();
  }

  return v11;
}

- (BOOL)callerIdIsEmailAddress
{
  return [(CHRecentCall *)self handleType] == 3;
}

- (NSString)callerNetworkFirstName
{
  v2 = [(CHRecentCall *)self name];
  uint64_t v3 = [v2 rangeOfString:@" "];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v2 substringToIndex:v3];
  }
  id v5 = v4;
  if (![v4 length])
  {

    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)callerNetworkSecondName
{
  v2 = [(CHRecentCall *)self name];
  uint64_t v3 = [v2 rangeOfString:@" "];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v5 = v3 + v4, v3 + v4 >= (unint64_t)[v2 length]))
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [v2 substringFromIndex:v5];
  }
  if (![v6 length])
  {

    BOOL v6 = 0;
  }

  return (NSString *)v6;
}

- (int64_t)handleType
{
  if (self->_handleType) {
    return self->_handleType;
  }
  uint64_t v3 = [(CHRecentCall *)self callerId];
  int64_t v4 = +[CHHandle handleTypeForValue:v3];

  return v4;
}

- (NSString)callerName
{
  uint64_t v3 = +[CHLogServer sharedInstance];
  int64_t v4 = [v3 logHandleForDomain:"CHRecentCall"];

  uint64_t v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall callerName]();
  }

  if (!self->_callerName)
  {
    BOOL v6 = +[CHLogServer sharedInstance];
    id v7 = [v6 logHandleForDomain:"CHRecentCall"];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "Caller name is null. Look in AddressBook for a name", buf, 2u);
    }

    id v8 = [(CHRecentCall *)self phoneBookManager];
    BOOL v9 = [(CHRecentCall *)self contactRef];
    uint64_t v10 = [v8 getPersonsNameForContact:v9];
    callerName = self->_callerName;
    self->_callerName = v10;

    if (!self->_callerName)
    {
      uint64_t v12 = +[CHLogServer sharedInstance];
      BOOL v13 = [v12 logHandleForDomain:"CHRecentCall"];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v22 = 0;
        _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "AddressBook did not have a caller name for this caller id. Setting it to network sent name.", v22, 2u);
      }

      uint64_t v14 = [(CHRecentCall *)self name];
      BOOL v15 = self->_callerName;
      self->_callerName = v14;
    }
  }
  p_callerName = &self->_callerName;
  __int16 v17 = +[CHLogServer sharedInstance];
  uint64_t v18 = [v17 logHandleForDomain:"CHRecentCall"];

  __int16 v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall callerName]();
  }

  uint64_t v20 = *p_callerName;
  return v20;
}

- (id)getLocalizedString:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = [v3 bundleForClass:objc_opt_class()];
  BOOL v6 = +[CHLogServer sharedInstance];
  id v7 = [v6 logHandleForDomain:"CHRecentCall"];

  id v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall getLocalizedString:]();
  }

  BOOL v9 = +[CHLogServer sharedInstance];
  uint64_t v10 = [v9 logHandleForDomain:"CHRecentCall"];

  BOOL v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall getLocalizedString:](v5);
  }

  uint64_t v12 = [v5 localizedStringForKey:v4 value:@"Default Value" table:@"CallHistory"];

  return v12;
}

- (id)callerNameForDisplay
{
  uint64_t v3 = [(CHRecentCall *)self callerName];
  if (!v3)
  {
    id v4 = +[CHLogServer sharedInstance];
    uint64_t v5 = [v4 logHandleForDomain:"CHRecentCall"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Caller name is nil, let's use caller id formatted", buf, 2u);
    }

    uint64_t v3 = [(CHRecentCall *)self callerIdForDisplay];
  }
  if (![v3 length])
  {
    BOOL v6 = +[CHLogServer sharedInstance];
    id v7 = [v6 logHandleForDomain:"CHRecentCall"];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "Caller id and caller name are nil, call is blocked or unknown", v14, 2u);
    }

    if ([(CHRecentCall *)self callerIdIsBlocked]) {
      id v8 = @"BLOCKED_CALLER";
    }
    else {
      id v8 = @"UNKNOWN_CALLER";
    }
    uint64_t v9 = [(CHRecentCall *)self getLocalizedString:v8];

    uint64_t v3 = (void *)v9;
  }
  uint64_t v10 = +[CHLogServer sharedInstance];
  BOOL v11 = [v10 logHandleForDomain:"CHRecentCall"];

  uint64_t v12 = v11;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall callerNameForDisplay]();
  }

  return v3;
}

- (NSString)callerIdLabel
{
  id v4 = +[CHLogServer sharedInstance];
  uint64_t v5 = [v4 logHandleForDomain:"CHRecentCall"];

  BOOL v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall addressBookRecordId].cold.4(a2);
  }

  p_callerIdLabel = &self->_callerIdLabel;
  if (!self->_callerIdLabel)
  {
    id v8 = [(CHRecentCall *)self phoneBookManager];
    uint64_t v9 = [(CHRecentCall *)self contactRef];
    uint64_t v10 = [(CHRecentCall *)self callerId];
    objc_msgSend(v8, "getLocalizedCallerIdLabelForContact:forCallerId:withCallerIdIsEmail:", v9, v10, -[CHRecentCall callerIdIsEmailAddress](self, "callerIdIsEmailAddress"));
    BOOL v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    callerIdLabel = self->_callerIdLabel;
    self->_callerIdLabel = v11;
  }
  BOOL v13 = +[CHLogServer sharedInstance];
  uint64_t v14 = [v13 logHandleForDomain:"CHRecentCall"];

  BOOL v15 = v14;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CHRecentCall callerName]();
  }

  uint64_t v16 = *p_callerIdLabel;
  return v16;
}

- (NSString)localizedBlockedByExtensionName
{
  uint64_t v3 = [(CHRecentCall *)self blockedByExtension];

  if (!v3) {
    goto LABEL_3;
  }
  id v4 = (void *)MEMORY[0x1E4F28C70];
  uint64_t v5 = [(CHRecentCall *)self blockedByExtension];
  BOOL v6 = [v4 extensionWithIdentifier:v5 error:0];

  id v7 = [v6 _plugIn];
  id v8 = [v7 localizedContainingName];

  if (!v8)
  {
LABEL_3:
    id v8 = [(CHRecentCall *)self blockedByExtensionName];
  }
  return (NSString *)v8;
}

+ (id)getLocationForCallerId:(id)a3 andIsoCountryCode:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = getSharedGEOPhoneNumberResolver();
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    if ([v6 length])
    {
      uint64_t v9 = *MEMORY[0x1E4F64CA8];
      v35[0] = *MEMORY[0x1E4F64CB0];
      v35[1] = v9;
      v36[0] = v5;
      v36[1] = v6;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    }
    else
    {
      uint64_t v33 = *MEMORY[0x1E4F64CB0];
      id v34 = v5;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    }
    uint64_t v12 = (void *)v10;
    [v8 addObject:v10];
    uint64_t v27 = 0;
    int v28 = &v27;
    uint64_t v29 = 0x3032000000;
    __int16 v30 = __Block_byref_object_copy__3;
    uint64_t v31 = __Block_byref_object_dispose__3;
    id v32 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    BOOL v22 = __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke;
    BOOL v23 = &unk_1E61C8130;
    id v24 = v5;
    uint64_t v26 = &v27;
    uint64_t v14 = v13;
    v25 = v14;
    BOOL v15 = dispatch_get_global_queue(0, 0);
    [v7 resolvePhoneNumbers:v8 handler:&v20 queue:v15];

    dispatch_time_t v16 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v14, v16))
    {
      __int16 v17 = +[CHLogServer sharedInstance];
      uint64_t v18 = [v17 logHandleForDomain:"CHRecentCall"];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[CHRecentCall getLocationForCallerId:andIsoCountryCode:](v18);
      }
    }
    id v11 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2;
  v6[3] = &unk_1E61C8108;
  id v7 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  [a2 enumerateResolutionsUsingBlock:v6];
}

void __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if ([*(id *)(a1 + 32) isEqualToString:v9])
  {
    if (v11)
    {
      uint64_t v12 = +[CHLogServer sharedInstance];
      dispatch_semaphore_t v13 = [v12 logHandleForDomain:"CHRecentCall"];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2_cold_1();
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = @"<<RecentsNumberLocationNotFound>>";
    }
    else
    {
      uint64_t v16 = [v10 locationName];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v15 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }

    *a5 = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSString)callerIdLocation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = +[CHLogServer sharedInstance];
  long long v5 = [v4 logHandleForDomain:"CHRecentCall"];

  id v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    long long v8 = [(CHRecentCall *)self callerId];
    callerIdLocation = self->_callerIdLocation;
    int v17 = 138543874;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    BOOL v22 = callerIdLocation;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "==> %{public}@. Current location info for %@ is %@", (uint8_t *)&v17, 0x20u);
  }
  id v10 = self->_callerIdLocation;
  if (!v10)
  {
    id v11 = [(CHRecentCall *)self callerId];
    uint64_t v12 = [(CHRecentCall *)self isoCountryCode];
    dispatch_semaphore_t v13 = +[CHRecentCall getLocationForCallerId:v11 andIsoCountryCode:v12];
    uint64_t v14 = self->_callerIdLocation;
    self->_callerIdLocation = v13;

    id v10 = self->_callerIdLocation;
  }
  if ([(NSString *)v10 isEqualToString:@"<<RecentsNumberLocationNotFound>>"]) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = self->_callerIdLocation;
  }
  return v15;
}

- (id)callerIdSubStringForDisplay
{
  uint64_t v3 = [(CHRecentCall *)self callerIdLabel];
  if (!v3)
  {
    id v4 = [(CHRecentCall *)self callerIdLocation];
    long long v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(CHRecentCall *)self getLocalizedString:@"UNKNOWN_LABEL"];
    }
    uint64_t v3 = v6;
  }
  return v3;
}

- (BOOL)wasAutoAnswered
{
  return [(CHRecentCall *)self autoAnsweredReason] != 0;
}

- (id)callOccurrencesAsString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(CHRecentCall *)self callOccurrences];
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"\n\tMerged Call %lu:\n", v5);
      id v6 = [v4 objectAtIndexedSubscript:v5];
      id v7 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceUniqueIdKey"];
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceUniqueIdKey", v7];

      long long v8 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceCallTypeKey"];
      id v9 = +[CHRecentCall callTypeAsString:](CHRecentCall, "callTypeAsString:", [v8 unsignedIntegerValue]);
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceCallTypeKey", v9];

      id v10 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceCallStatusKey"];
      id v11 = +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", [v10 unsignedIntegerValue]);
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceCallStatusKey", v11];

      uint64_t v12 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceDurationKey"];
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceDurationKey", v12];

      dispatch_semaphore_t v13 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceDateKey"];
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceDateKey", v13];

      uint64_t v14 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceDataUsageKey"];
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceDataUsageKey", v14];

      BOOL v15 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceServiceProviderKey"];
      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceServiceProviderKey", v15];

      uint64_t v16 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceMediaTypeKey"];
      int v17 = +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", [v16 unsignedIntegerValue]);

      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceMediaTypeKey", v17];
      uint64_t v18 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceTTYTypeKey"];
      __int16 v19 = +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", [v18 unsignedIntegerValue]);

      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceTTYTypeKey", v19];
      uint64_t v20 = NSString;
      __int16 v21 = [v6 objectForKeyedSubscript:@"kCHCallOccurrenceVerificationStatusKey"];
      BOOL v22 = objc_msgSend(v20, "ch_stringWithCHRecentCallVerificationStatus:", objc_msgSend(v21, "unsignedIntegerValue"));

      [v3 appendFormat:@"\t{%@, %@}\n", @"kCHCallOccurrenceVerificationStatusKey", v22];
      ++v5;
    }
    while (v5 < [v4 count]);
  }

  return v3;
}

+ (id)callMediaTypeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E61C8150 + a3);
  }
}

+ (id)callTTYTypeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E61C8168 + a3);
  }
}

+ (id)callHandleTypeAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E61C8180 + a3 - 1);
  }
}

+ (id)callCategoryAsString:(unsigned int)a3
{
  char v3 = a3;
  if ((a3 & 2) != 0)
  {
    maybeAppendStringWithSeparator(&stru_1F129F488, @"kCHCallCategoryVideo");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_1F129F488;
  }
  if (v3)
  {
    uint64_t v5 = maybeAppendStringWithSeparator(v4, @"kCHCallCategoryAudio");

    id v4 = (__CFString *)v5;
  }
  if ((v3 & 4) != 0)
  {
    uint64_t v6 = maybeAppendStringWithSeparator(v4, @"kCHCallCategoryTTYDirect");

    id v4 = (__CFString *)v6;
  }
  if ((v3 & 8) != 0)
  {
    uint64_t v7 = maybeAppendStringWithSeparator(v4, @"kCHCallCategoryTTYRelay");

    id v4 = (__CFString *)v7;
  }
  if (![(__CFString *)v4 length])
  {

    id v4 = @"Unknown";
  }
  return v4;
}

+ (id)callDirectoryIdentificationTypeAsString:(int64_t)a3
{
  char v3 = @"Unknown";
  if (a3 == 2) {
    char v3 = @"CHCallDirectoryIdentityTypeBusiness";
  }
  if (a3 == 1) {
    return @"CHCallDirectoryIdentityTypePerson";
  }
  else {
    return v3;
  }
}

- (void)setMediaType:(int64_t)a3
{
  if (self->_mediaType != a3)
  {
    self->_mediaType = a3;
    self->_callCategory = +[CHRecentCall categoryForMediaType:[(CHRecentCall *)self mediaType] andTTYType:[(CHRecentCall *)self ttyType]];
    uint64_t v4 = [(CHRecentCall *)self callCategory];
    id v5 = [(CHRecentCall *)self serviceProvider];
    self->_callType = +[CHRecentCall getCallTypeForCategory:v4 andServiceProvider:v5];
  }
}

- (void)setTtyType:(int64_t)a3
{
  if (self->_ttyType != a3)
  {
    self->_ttyType = a3;
    self->_callCategory = +[CHRecentCall categoryForMediaType:[(CHRecentCall *)self mediaType] andTTYType:[(CHRecentCall *)self ttyType]];
    uint64_t v4 = [(CHRecentCall *)self callCategory];
    id v5 = [(CHRecentCall *)self serviceProvider];
    self->_callType = +[CHRecentCall getCallTypeForCategory:v4 andServiceProvider:v5];
  }
}

+ (unsigned)categoryForCallType:(unsigned int)a3
{
  if (a3 == 8) {
    return 2;
  }
  return a3 == 16 || a3 == 1;
}

+ (id)serviceProviderForCallType:(unsigned int)a3
{
  if (a3 == 16 || a3 == 8)
  {
    uint64_t v4 = kCHServiceProviderFaceTime;
LABEL_9:
    id v5 = *v4;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v4 = kCHServiceProviderTelephony;
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_11:
  return v5;
}

- (void)fixCallTypeInfo
{
  if (!self->_callCategory) {
    self->_callCategory = +[CHRecentCall categoryForCallType:[(CHRecentCall *)self callType]];
  }
  if (!self->_serviceProvider)
  {
    char v3 = +[CHRecentCall serviceProviderForCallType:[(CHRecentCall *)self callType]];
    serviceProvider = self->_serviceProvider;
    self->_serviceProvider = v3;
  }
  if (self->_callType == 0x80000000)
  {
    uint64_t v5 = [(CHRecentCall *)self callCategory];
    uint64_t v6 = [(CHRecentCall *)self serviceProvider];
    self->_callType = +[CHRecentCall getCallTypeForCategory:v5 andServiceProvider:v6];
  }
  [(CHRecentCall *)self updateTTYAndMediaType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueId = self->_uniqueId;
  id v5 = a3;
  [v5 encodeObject:uniqueId forKey:@"uniqueId"];
  [v5 encodeObject:self->_callerId forKey:@"callerId"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeInteger:self->_callType forKey:@"callType"];
  [v5 encodeInteger:self->_callStatus forKey:@"callStatus"];
  [v5 encodeInteger:self->_mediaType forKey:@"mediaType"];
  uint64_t callerIdAvailability = self->_callerIdAvailability;
  uint64_t v7 = NSStringFromSelector(sel_callerIdAvailability);
  [v5 encodeInteger:callerIdAvailability forKey:v7];

  [v5 encodeBool:self->_read forKey:@"read"];
  [v5 encodeInteger:self->_unreadCount forKey:@"unreadCount"];
  [v5 encodeDouble:@"duration" forKey:self->_duration];
  [v5 encodeObject:self->_bytesOfDataUsed forKey:@"bytesOfDataUsed"];
  [v5 encodeObject:self->_mobileCountryCode forKey:@"mobileCountryCode"];
  [v5 encodeObject:self->_mobileNetworkCode forKey:@"mobileNetworkCode"];
  [v5 encodeObject:self->_devicePhoneId forKey:@"devicePhoneId"];
  imageURL = self->_imageURL;
  id v9 = NSStringFromSelector(sel_imageURL);
  [v5 encodeObject:imageURL forKey:v9];

  [v5 encodeObject:self->_isoCountryCode forKey:@"isoCountryCode"];
  [v5 encodeObject:self->_callerIdLocation forKey:@"callerIdLocation"];
  [v5 encodeInteger:self->_callCategory forKey:@"callCategory"];
  [v5 encodeObject:self->_serviceProvider forKey:@"serviceRadar"];
  [v5 encodeInteger:self->_handleType forKey:@"handleType"];
  [v5 encodeObject:self->_timeToEstablish forKey:@"timeToEstablish"];
  localParticipantUUID = self->_localParticipantUUID;
  id v11 = NSStringFromSelector(sel_localParticipantUUID);
  [v5 encodeObject:localParticipantUUID forKey:v11];

  name = self->_name;
  dispatch_semaphore_t v13 = NSStringFromSelector(sel_name);
  [v5 encodeObject:name forKey:v13];

  outgoingLocalParticipantUUID = self->_outgoingLocalParticipantUUID;
  BOOL v15 = NSStringFromSelector(sel_outgoingLocalParticipantUUID);
  [v5 encodeObject:outgoingLocalParticipantUUID forKey:v15];

  participantGroupUUID = self->_participantGroupUUID;
  int v17 = NSStringFromSelector(sel_participantGroupUUID);
  [v5 encodeObject:participantGroupUUID forKey:v17];

  remoteParticipantHandles = self->_remoteParticipantHandles;
  __int16 v19 = NSStringFromSelector(sel_remoteParticipantHandles);
  [v5 encodeObject:remoteParticipantHandles forKey:v19];

  int64_t verificationStatus = self->_verificationStatus;
  __int16 v21 = NSStringFromSelector(sel_verificationStatus);
  [v5 encodeInteger:verificationStatus forKey:v21];

  int64_t junkConfidence = self->_junkConfidence;
  uint64_t v23 = NSStringFromSelector(sel_junkConfidence);
  [v5 encodeInteger:junkConfidence forKey:v23];

  junkIdentificationCategory = self->_junkIdentificationCategory;
  v25 = NSStringFromSelector(sel_junkIdentificationCategory);
  [v5 encodeObject:junkIdentificationCategory forKey:v25];

  [v5 encodeBool:self->_hasMessage forKey:@"hasMessage"];
  [v5 encodeObject:self->_conversationID forKey:@"conversationID"];
  disconnectedCause = self->_disconnectedCause;
  uint64_t v27 = NSStringFromSelector(sel_disconnectedCause);
  [v5 encodeObject:disconnectedCause forKey:v27];

  [v5 encodeInteger:self->_autoAnsweredReason forKey:@"autoAnsweredReason"];
  emergencyMediaItems = self->_emergencyMediaItems;
  uint64_t v29 = NSStringFromSelector(sel_emergencyMediaItems);
  [v5 encodeObject:emergencyMediaItems forKey:v29];

  BOOL usedEmergencyVideoStreaming = self->_usedEmergencyVideoStreaming;
  uint64_t v31 = NSStringFromSelector(sel_usedEmergencyVideoStreaming);
  [v5 encodeBool:usedEmergencyVideoStreaming forKey:v31];

  BOOL wasEmergencyCall = self->_wasEmergencyCall;
  uint64_t v33 = NSStringFromSelector(sel_wasEmergencyCall);
  [v5 encodeBool:wasEmergencyCall forKey:v33];

  unint64_t screenSharingType = self->_screenSharingType;
  id v35 = NSStringFromSelector(sel_screenSharingType);
  [v5 encodeInteger:screenSharingType forKey:v35];

  [v5 encodeBool:self->_ttyType != 0 forKey:@"kCHCallOccurrenceTTYTypeKey"];
  initiator = self->_initiator;
  v37 = NSStringFromSelector(sel_initiator);
  [v5 encodeObject:initiator forKey:v37];

  blockedByExtension = self->_blockedByExtension;
  v39 = NSStringFromSelector(sel_blockedByExtension);
  [v5 encodeObject:blockedByExtension forKey:v39];

  blockedByExtensionName = self->_blockedByExtensionName;
  v41 = NSStringFromSelector(sel_blockedByExtensionName);
  [v5 encodeObject:blockedByExtensionName forKey:v41];

  identityExtension = self->_identityExtension;
  NSStringFromSelector(sel_identityExtension);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:identityExtension forKey:v43];
}

- (CHRecentCall)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CHRecentCall *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueId"];
    uniqueId = v5->_uniqueId;
    v5->_uniqueId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callerId"];
    callerId = v5->_callerId;
    v5->_callerId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    v5->_callType = [v4 decodeIntegerForKey:@"callType"];
    v5->_callStatus = [v4 decodeIntegerForKey:@"callStatus"];
    v5->_mediaType = [v4 decodeIntegerForKey:@"mediaType"];
    uint64_t v12 = NSStringFromSelector(sel_callerIdAvailability);
    v5->_uint64_t callerIdAvailability = [v4 decodeIntegerForKey:v12];

    v5->_read = [v4 decodeBoolForKey:@"read"];
    v5->_unreadCount = [v4 decodeIntegerForKey:@"unreadCount"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bytesOfDataUsed"];
    bytesOfDataUsed = v5->_bytesOfDataUsed;
    v5->_bytesOfDataUsed = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mobileCountryCode"];
    mobileCountryCode = v5->_mobileCountryCode;
    v5->_mobileCountryCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mobileNetworkCode"];
    mobileNetworkCode = v5->_mobileNetworkCode;
    v5->_mobileNetworkCode = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePhoneId"];
    devicePhoneId = v5->_devicePhoneId;
    v5->_devicePhoneId = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v23 = NSStringFromSelector(sel_imageURL);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isoCountryCode"];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callerIdLocation"];
    callerIdLocation = v5->_callerIdLocation;
    v5->_callerIdLocation = (NSString *)v28;

    v5->_callCategory = [v4 decodeIntegerForKey:@"callCategory"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceRadar"];
    serviceProvider = v5->_serviceProvider;
    v5->_serviceProvider = (NSString *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v33 = NSStringFromSelector(sel_localParticipantUUID);
    uint64_t v34 = [v4 decodeObjectOfClass:v32 forKey:v33];
    localParticipantUUID = v5->_localParticipantUUID;
    v5->_localParticipantUUID = (NSUUID *)v34;

    uint64_t v36 = objc_opt_class();
    v37 = NSStringFromSelector(sel_name);
    uint64_t v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
    name = v5->_name;
    v5->_name = (NSString *)v38;

    uint64_t v40 = objc_opt_class();
    v41 = NSStringFromSelector(sel_outgoingLocalParticipantUUID);
    uint64_t v42 = [v4 decodeObjectOfClass:v40 forKey:v41];
    outgoingLocalParticipantUUID = v5->_outgoingLocalParticipantUUID;
    v5->_outgoingLocalParticipantUUID = (NSUUID *)v42;

    uint64_t v44 = objc_opt_class();
    v45 = NSStringFromSelector(sel_participantGroupUUID);
    uint64_t v46 = [v4 decodeObjectOfClass:v44 forKey:v45];
    participantGroupUUID = v5->_participantGroupUUID;
    v5->_participantGroupUUID = (NSUUID *)v46;

    uint64_t v48 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v51 = NSStringFromSelector(sel_remoteParticipantHandles);
    uint64_t v52 = [v4 decodeObjectOfClasses:v50 forKey:v51];
    remoteParticipantHandles = v5->_remoteParticipantHandles;
    v5->_remoteParticipantHandles = (NSSet *)v52;

    uint64_t v54 = NSStringFromSelector(sel_verificationStatus);
    v5->_int64_t verificationStatus = [v4 decodeIntegerForKey:v54];

    __int16 v55 = NSStringFromSelector(sel_junkConfidence);
    v5->_int64_t junkConfidence = [v4 decodeIntegerForKey:v55];

    v5->_hasMessage = [v4 decodeBoolForKey:@"hasMessage"];
    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationID"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSUUID *)v56;

    v5->_autoAnsweredReason = [v4 decodeIntegerForKey:@"autoAnsweredReason"];
    uint64_t v58 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
    uint64_t v61 = NSStringFromSelector(sel_emergencyMediaItems);
    uint64_t v62 = [v4 decodeObjectOfClasses:v60 forKey:v61];
    emergencyMediaItems = v5->_emergencyMediaItems;
    v5->_emergencyMediaItems = (NSSet *)v62;

    uint64_t v64 = NSStringFromSelector(sel_usedEmergencyVideoStreaming);
    v5->_BOOL usedEmergencyVideoStreaming = [v4 decodeBoolForKey:v64];

    v65 = NSStringFromSelector(sel_wasEmergencyCall);
    v5->_BOOL wasEmergencyCall = [v4 decodeBoolForKey:v65];

    v5->_ttyType = [v4 decodeBoolForKey:@"kCHCallOccurrenceTTYTypeKey"];
    uint64_t v66 = NSStringFromSelector(sel_callDirectoryIdentityType);
    v5->_callDirectoryIdentityType = [v4 decodeIntegerForKey:v66];

    int v67 = NSStringFromSelector(sel_screenSharingType);
    v5->_unint64_t screenSharingType = [v4 decodeIntegerForKey:v67];

    uint64_t v68 = objc_opt_class();
    __int16 v69 = NSStringFromSelector(sel_initiator);
    uint64_t v70 = [v4 decodeObjectOfClass:v68 forKey:v69];
    initiator = v5->_initiator;
    v5->_initiator = (CHHandle *)v70;

    if ([v4 containsValueForKey:@"handleType"]) {
      uint64_t v72 = [v4 decodeIntegerForKey:@"handleType"];
    }
    else {
      uint64_t v72 = +[CHHandle handleTypeForValue:v5->_callerId];
    }
    v5->_handleType = v72;
    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeToEstablish"];
    timeToEstablish = v5->_timeToEstablish;
    v5->_timeToEstablish = (NSNumber *)v73;

    uint64_t v75 = objc_opt_class();
    v76 = NSStringFromSelector(sel_disconnectedCause);
    uint64_t v77 = [v4 decodeObjectOfClass:v75 forKey:v76];
    disconnectedCause = v5->_disconnectedCause;
    v5->_disconnectedCause = (NSNumber *)v77;

    uint64_t v79 = objc_opt_class();
    v80 = NSStringFromSelector(sel_blockedByExtension);
    uint64_t v81 = [v4 decodeObjectOfClass:v79 forKey:v80];
    blockedByExtension = v5->_blockedByExtension;
    v5->_blockedByExtension = (NSString *)v81;

    uint64_t v83 = objc_opt_class();
    v84 = NSStringFromSelector(sel_blockedByExtensionName);
    uint64_t v85 = [v4 decodeObjectOfClass:v83 forKey:v84];
    blockedByExtensionName = v5->_blockedByExtensionName;
    v5->_blockedByExtensionName = (NSString *)v85;

    uint64_t v87 = objc_opt_class();
    v88 = NSStringFromSelector(sel_identityExtension);
    uint64_t v89 = [v4 decodeObjectOfClass:v87 forKey:v88];
    identityExtension = v5->_identityExtension;
    v5->_identityExtension = (NSString *)v89;

    [(CHRecentCall *)v5 fixCallTypeInfo];
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"--------------------------\n"];
  id v4 = [(CHRecentCall *)self uniqueId];
  [v3 appendFormat:@"Identifier: %@\n", v4];

  id v5 = [(CHRecentCall *)self name];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [(CHRecentCall *)self name];
    [v3 appendFormat:@"Name: %@\n", v7];
  }
  uint64_t v8 = [(CHRecentCall *)self imageURL];

  if (v8)
  {
    id v9 = [(CHRecentCall *)self imageURL];
    [v3 appendFormat:@"Image URL: %@\n", v9];
  }
  uint64_t v10 = [(CHRecentCall *)self junkIdentificationCategory];

  if (v10)
  {
    id v11 = [(CHRecentCall *)self junkIdentificationCategory];
    [v3 appendFormat:@"Junk identification category: %@\n", v11];
  }
  uint64_t v12 = [(CHRecentCall *)self localParticipantUUID];
  [v3 appendFormat:@"Local Participant UUID: %@\n", v12];

  double v13 = [(CHRecentCall *)self outgoingLocalParticipantUUID];
  [v3 appendFormat:@"Outgoing Local Participant UUID: %@\n", v13];

  uint64_t v14 = [(CHRecentCall *)self participantGroupUUID];
  [v3 appendFormat:@"Participant Group UUID: %@\n", v14];

  [v3 appendFormat:@"Remote Participant Handles: %@\n", self->_remoteParticipantHandles];
  BOOL v15 = +[CHRecentCall callMediaTypeAsString:[(CHRecentCall *)self mediaType]];
  [v3 appendFormat:@"Call Media Type: %@\n", v15];

  uint64_t v16 = +[CHRecentCall callTTYTypeAsString:[(CHRecentCall *)self ttyType]];
  [v3 appendFormat:@"Call TTY Type: %@\n", v16];

  int v17 = +[CHRecentCall callTypeAsString:[(CHRecentCall *)self callType]];
  [v3 appendFormat:@"Call Type: %@\n", v17];

  uint64_t v18 = +[CHRecentCall callHandleTypeAsString:self->_handleType];
  [v3 appendFormat:@"Handle Type: %@\n", v18];

  __int16 v19 = [(CHRecentCall *)self serviceProvider];
  [v3 appendFormat:@"Call Service Provider: %@\n", v19];

  uint64_t v20 = +[CHRecentCall callStatusAsString:[(CHRecentCall *)self callStatus]];
  [v3 appendFormat:@"Call Status: %@\n", v20];

  __int16 v21 = [(CHRecentCall *)self date];
  [v3 appendFormat:@"Date: %@\n", v21];

  [(CHRecentCall *)self duration];
  objc_msgSend(v3, "appendFormat:", @"Duration: %f\n", v22);
  uint64_t v23 = CHCallerIdAvailabilityAsString(self->_callerIdAvailability);
  [v3 appendFormat:@"Caller Id Availability: %@\n", v23];

  objc_msgSend(v3, "appendFormat:", @"Caller Id Blocked?: %d\n", -[CHRecentCall callerIdIsBlocked](self, "callerIdIsBlocked"));
  [v3 appendFormat:@"Caller Name: %@\n", self->_callerName];
  [v3 appendFormat:@"Caller Id Label: %@\n", self->_callerIdLabel];
  [v3 appendFormat:@"Caller Id Location: %@\n", self->_callerIdLocation];
  uint64_t v24 = [(CHRecentCall *)self bytesOfDataUsed];
  [v3 appendFormat:@"Bytes of data used: %@\n", v24];

  v25 = [(CHRecentCall *)self isoCountryCode];
  [v3 appendFormat:@"Country Code (ISO): %@\n", v25];

  objc_msgSend(v3, "appendFormat:", @"Read: %d\n", self->_read);
  [v3 appendFormat:@"Emergency media items: %@\n", self->_emergencyMediaItems];
  objc_msgSend(v3, "appendFormat:", @"Used emergency video streaming: %d\n", self->_usedEmergencyVideoStreaming);
  objc_msgSend(v3, "appendFormat:", @"Was emergency call: %d\n", self->_wasEmergencyCall);
  uint64_t v26 = [(CHRecentCall *)self disconnectedCause];
  [v3 appendFormat:@"Disconnect Cause: %@\n", v26];

  uint64_t v27 = [(CHRecentCall *)self filteredOutReason];
  [v3 appendFormat:@"Filtered Out Reason: %@\n", v27];

  uint64_t v28 = objc_msgSend(NSString, "ch_stringWithCHRecentCallJunkConfidence:", -[CHRecentCall junkConfidence](self, "junkConfidence"));
  [v3 appendFormat:@"Junk Confidence: %@\n", v28];

  [v3 appendFormat:@"Address Book Id: %@\n", self->_contactIdentifier];
  BOOL v29 = [(CHRecentCall *)self multiCall];
  uint64_t v30 = @"No";
  if (v29) {
    uint64_t v30 = @"Yes";
  }
  [v3 appendFormat:@"Multi-Call: %@\n", v30];
  uint64_t v31 = [(CHRecentCall *)self callOccurrences];
  unint64_t v32 = [v31 count];

  if (v32 >= 2)
  {
    uint64_t v33 = [(CHRecentCall *)self callOccurrencesAsString];
    [v3 appendFormat:@"Call Occurrences: %@\n", v33];
  }
  uint64_t v34 = [(CHRecentCall *)self blockedByExtension];

  if (v34)
  {
    id v35 = [(CHRecentCall *)self identityExtension];
    [v3 appendFormat:@"Identity extension: %@\n", v35];
  }
  uint64_t v36 = [(CHRecentCall *)self identityExtension];

  if (v36)
  {
    v37 = [(CHRecentCall *)self blockedByExtension];
    [v3 appendFormat:@"Blocked by extension: %@\n", v37];
  }
  if ([(CHRecentCall *)self callDirectoryIdentityType])
  {
    uint64_t v38 = +[CHRecentCall callDirectoryIdentificationTypeAsString:[(CHRecentCall *)self callDirectoryIdentityType]];
    [v3 appendFormat:@"CallDirectory Identity Type: %@\n", v38];
  }
  objc_msgSend(v3, "appendFormat:", @"Unread count: %lu\n", -[CHRecentCall unreadCount](self, "unreadCount"));
  v39 = objc_msgSend(NSString, "ch_stringWithCHRecentCallVerificationStatus:", self->_verificationStatus);
  [v3 appendFormat:@"Verification Status: %@\n", v39];

  objc_msgSend(v3, "appendFormat:", @"Has associated message: %d\n", self->_hasMessage);
  objc_msgSend(v3, "appendFormat:", @"Auto answered reason: %ld\n", self->_autoAnsweredReason);
  [v3 appendFormat:@"Conversation ID: %@\n", self->_conversationID];
  objc_msgSend(v3, "appendFormat:", @"Screen sharing type: %ld\n", self->_screenSharingType);
  [v3 appendFormat:@"Initiator: %@\n", self->_initiator];
  [v3 appendFormat:@"--------------------------\n"];
  return v3;
}

- (BOOL)isEquivalentToRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CHRecentCall *)self outgoingLocalParticipantUUID];
  uint64_t v6 = [v4 outgoingLocalParticipantUUID];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  id v9 = (void *)v8;
  if (!(v7 | v8)) {
    goto LABEL_4;
  }
  if (!v8)
  {
    BOOL v15 = 0;
    uint64_t v12 = (void *)v7;
LABEL_12:

    goto LABEL_13;
  }
  int v10 = [(id)v7 isEqual:v8];

  if (v10)
  {
LABEL_4:
    unsigned int v11 = [(CHRecentCall *)self callStatus];
    if (v11 == [v4 callStatus])
    {
      uint64_t v12 = [(CHRecentCall *)self bytesOfDataUsed];
      double v13 = [v4 bytesOfDataUsed];
      if (v12 == v13 && (int v14 = -[CHRecentCall read](self, "read"), v14 == [v4 read]))
      {
        uint64_t v16 = [(CHRecentCall *)self callOccurrences];
        uint64_t v17 = [v16 count];
        uint64_t v18 = [v4 callOccurrences];
        BOOL v15 = v17 == [v18 count];
      }
      else
      {
        BOOL v15 = 0;
      }

      goto LABEL_12;
    }
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (void)setWasAutoAnswered:(BOOL)a3
{
  self->_wasAutoAnswered = a3;
}

- (NSSet)emergencyMediaItems
{
  return self->_emergencyMediaItems;
}

- (BOOL)usedEmergencyVideoStreaming
{
  return self->_usedEmergencyVideoStreaming;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (BOOL)read
{
  return self->_read;
}

- (NSNumber)disconnectedCause
{
  return self->_disconnectedCause;
}

- (NSNumber)filteredOutReason
{
  return self->_filteredOutReason;
}

- (unsigned)callerIdAvailability
{
  return self->_callerIdAvailability;
}

- (NSString)junkIdentificationCategory
{
  return self->_junkIdentificationCategory;
}

- (void)setCallerIdLabel:(id)a3
{
}

- (NSNumber)timeToEstablish
{
  return self->_timeToEstablish;
}

- (int64_t)callDirectoryIdentityType
{
  return self->_callDirectoryIdentityType;
}

- (void)setAddressBookRecordId:(id)a3
{
}

- (NSString)addressBookCallerIDMultiValueId
{
  return self->_addressBookCallerIDMultiValueId;
}

- (void)setAddressBookCallerIDMultiValueId:(id)a3
{
}

- (NSString)callerId
{
  return self->_callerId;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)devicePhoneId
{
  return self->_devicePhoneId;
}

- (void)setDevicePhoneId:(id)a3
{
}

- (NSString)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (void)setMobileCountryCode:(id)a3
{
}

- (NSString)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (void)setMobileNetworkCode:(id)a3
{
}

- (void)setContactRef:(id)a3
{
}

- (NSString)blockedByExtensionName
{
  return self->_blockedByExtensionName;
}

- (void)setBlockedByExtensionName:(id)a3
{
}

- (int64_t)autoAnsweredReason
{
  return self->_autoAnsweredReason;
}

- (void)setCallerName:(id)a3
{
}

- (BOOL)multiCall
{
  return self->_multiCall;
}

- (CHPhoneBookIOSManager)phoneBookManager
{
  return self->_phoneBookManager;
}

- (void)setCallerIdFormatted:(id)a3
{
}

- (BOOL)answered
{
  return self->_answered;
}

- (void)setAnswered:(BOOL)a3
{
  self->_answered = a3;
}

- (BOOL)mobileOriginated
{
  return self->_mobileOriginated;
}

- (void)setMobileOriginated:(BOOL)a3
{
  self->_mobileOriginated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerIdFormatted, 0);
  objc_storeStrong((id *)&self->_phoneBookManager, 0);
  objc_storeStrong((id *)&self->_participantGroupUUID, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
  objc_storeStrong((id *)&self->_identityExtension, 0);
  objc_storeStrong((id *)&self->_blockedByExtensionName, 0);
  objc_storeStrong((id *)&self->_blockedByExtension, 0);
  objc_storeStrong((id *)&self->_contactRef, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
  objc_storeStrong((id *)&self->_devicePhoneId, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_callerId, 0);
  objc_storeStrong((id *)&self->_addressBookCallerIDMultiValueId, 0);
  objc_storeStrong((id *)&self->_addressBookRecordId, 0);
  objc_storeStrong((id *)&self->_timeToEstablish, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_callOccurrences, 0);
  objc_storeStrong((id *)&self->_callerIdLocation, 0);
  objc_storeStrong((id *)&self->_callerIdLabel, 0);
  objc_storeStrong((id *)&self->_junkIdentificationCategory, 0);
  objc_storeStrong((id *)&self->_filteredOutReason, 0);
  objc_storeStrong((id *)&self->_disconnectedCause, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_bytesOfDataUsed, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_emergencyMediaItems, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_outgoingLocalParticipantUUID, 0);
  objc_storeStrong((id *)&self->_localParticipantUUID, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)predicateForCallsBetweenStartDate:(id)a3 endDate:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"date >= %@", a3];
  if (v5)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
    unint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"date <= %@", v5, v6];
    v12[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v10 = [v7 andPredicateWithSubpredicates:v9];

    uint64_t v6 = (void *)v10;
  }

  return v6;
}

+ (id)predicateForCallsLessThanDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"date < %@", a3];
}

+ (id)predicateForCallsWithAnyMediaTypes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "integerValue", (void)v16);
        if ((unint64_t)(v11 - 1) <= 1)
        {
          uint64_t v12 = [a1 predicateForCallsWithMediaType:v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count] == 1) {
      [v5 firstObject];
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
  }
  int v14 = (void *)v13;

  return v14;
}

+ (id)predicateForCallsWithRemoteParticipantCount:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"remoteParticipantHandles.@count = %d", a3);
}

+ (id)predicateForCallsWithRemoteParticipantHandle:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 value];
  id v6 = [a1 predicateForCallsWithRemoteParticipantHandleValue:v5];

  uint64_t v7 = [v4 normalizedValue];

  if (v7)
  {
    uint64_t v8 = [v4 normalizedValue];
    uint64_t v9 = [a1 predicateForCallsWithRemoteParticipantHandleNormalizedValue:v8];
    v17[0] = v9;
    v17[1] = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

    uint64_t v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];

    id v6 = (void *)v11;
  }
  uint64_t v12 = objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleType:", objc_msgSend(v4, "type"));
  v16[0] = v12;
  v16[1] = v6;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  int v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateForCallsWithRemoteParticipantHandleType:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"ANY remoteParticipantHandles.type = %d", a3);
}

+ (id)predicateForCallsWithRemoteParticipantHandleValue:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY remoteParticipantHandles.value ==[c] %@", a3];
}

+ (id)predicateForCallsWithRemoteParticipantHandleNormalizedValue:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue ==[c] %@", a3];
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandles:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    if ([v4 count] == 1)
    {
      BOOL v29 = [v4 firstObject];
      uint64_t v28 = [a1 predicateForCallsWithRemoteParticipantHandle:v29];
    }
    else
    {
      uint64_t v28 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
  }
  else
  {
    id v31 = a1;
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          int v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "type"));
          [v5 addObject:v14];

          BOOL v15 = [v13 value];
          [v6 addObject:v15];

          long long v16 = [v13 normalizedValue];

          if (v16)
          {
            long long v17 = [v13 normalizedValue];
            [v7 addObject:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }

    long long v18 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = [v5 array];
    uint64_t v20 = [v31 predicateForCallsWithAnyRemoteParticipantHandleTypes:v19];
    [v18 addObject:v20];

    uint64_t v21 = [v7 count];
    uint64_t v22 = [v6 array];
    uint64_t v23 = [v31 predicateForCallsWithAnyRemoteParticipantHandleValues:v22];
    uint64_t v24 = (void *)v23;
    if (v21)
    {
      v37[0] = v23;
      v25 = [v7 array];
      uint64_t v26 = [v31 predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:v25];
      v37[1] = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

      uint64_t v24 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v27];
      uint64_t v22 = (void *)v27;
    }
    [v18 addObject:v24];

    uint64_t v28 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];

    id v4 = v32;
  }

  return v28;
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandleTypes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((unint64_t)([v11 integerValue] - 1) <= 2) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v13 = [v5 array];
    uint64_t v14 = [v12 predicateWithFormat:@"ANY remoteParticipantHandles.type IN %@", v13];
LABEL_14:
    BOOL v15 = (void *)v14;

    goto LABEL_16;
  }
  if ([v5 count] == 1)
  {
    uint64_t v13 = [v5 firstObject];
    uint64_t v14 = objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleType:", objc_msgSend(v13, "integerValue"));
    goto LABEL_14;
  }
  BOOL v15 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
LABEL_16:

  return v15;
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandleValues:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a3];
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [v4 array];
    uint64_t v7 = [v5 predicateWithFormat:@"ANY remoteParticipantHandles.value IN %@", v6];
LABEL_5:
    uint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  if ([v4 count] == 1)
  {
    id v6 = [v4 firstObject];
    uint64_t v7 = [a1 predicateForCallsWithRemoteParticipantHandleValue:v6];
    goto LABEL_5;
  }
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
LABEL_7:

  return v8;
}

+ (id)predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a3];
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [v4 array];
    uint64_t v7 = [v5 predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue IN %@", v6];
LABEL_5:
    uint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  if ([v4 count] == 1)
  {
    id v6 = [v4 firstObject];
    uint64_t v7 = [a1 predicateForCallsWithRemoteParticipantHandleNormalizedValue:v6];
    goto LABEL_5;
  }
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
LABEL_7:

  return v8;
}

+ (id)predicateForCallsWithRemoteParticipantHandles:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    id v5 = +[CHRecentCall predicateForCallsWithRemoteParticipantHandle:v4];
  }
  else
  {
    if ((unint64_t)[v3 count] < 2) {
      [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    else {
    id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(remoteParticipantHandles IN %@)", v3];
    }
  }

  return v5;
}

+ (id)predicateForCallsContainingServiceProvider:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"service_provider contains[c] %@", a3];
}

+ (id)predicateForCallsWithAnyServiceProviders:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(service_provider IN %@)", v3];
  }
  else {
  id v4 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v4;
}

+ (id)predicateForCallsWithStatus:(unsigned int)a3
{
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  if ((a3 & 1) == 1) {
    uint64_t v4 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  BOOL v6 = (~a3 & 8) == 0 || (a3 & 0x10) == 16;
  BOOL v7 = (~a3 & 4) == 0 || (~a3 & 8) == 0;
  if ((a3 & 2) == 2)
  {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (~a3 & 4) == 0;
  }
  int v9 = (a3 & 1) == 1 || v8;
  if (v7) {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v10 = v4;
  }
  if ((a3 & 0x10) == 0x10) {
    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }
  if ((v6 | v9) != 1 || v10 == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  else
  {
    if (!v9) {
      uint64_t v5 = 0;
    }
    if (!v6) {
      uint64_t v3 = v5;
    }
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(answered = %@) AND (originated = %@)", v3, v10];
  }
  return v12;
}

+ (id)predicateForCallsWithStatusAnswered:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"answered = %d", a3);
}

+ (id)predicateForCallsWithStatusOriginated:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"originated = %d", a3);
}

+ (id)predicateForCallsWithStatusJunk:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = @"junkConfidence >= %d";
  }
  else {
    uint64_t v3 = @"junkConfidence < %d";
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, 2);
  return v4;
}

+ (id)predicateForCallsWithAnyTTYTypes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "integerValue", (void)v16);
        if ((unint64_t)(v11 - 1) <= 1)
        {
          uint64_t v12 = [a1 predicateForCallsWithTTYType:v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count] == 1) {
      [v5 firstObject];
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

+ (id)predicateForCallsWithUniqueID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"unique_id = %@", a3];
}

+ (id)predicateForCallsWithAnyUniqueIDs:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a3];
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [v4 array];
    uint64_t v7 = [v5 predicateWithFormat:@"(unique_id IN %@)", v6];
LABEL_5:
    uint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  if ([v4 count] == 1)
  {
    id v6 = [v4 firstObject];
    uint64_t v7 = [a1 predicateForCallsWithUniqueID:v6];
    goto LABEL_5;
  }
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
LABEL_7:

  return v8;
}

+ (id)predicateForCallsWithGroupUUID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [a3 UUIDString];
  uint64_t v5 = [v3 predicateWithFormat:@"participantGroupUUID = %@", v4];

  return v5;
}

+ (id)predicateForCallsWithConversationID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [a3 UUIDString];
  uint64_t v5 = [v3 predicateWithFormat:@"conversationID = %@", v4];

  return v5;
}

- (void)addressBookRecordId
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B8E4A000, v2, v3, "==> %{public}@", v4, v5, v6, v7, v8);
}

- (void)callerName
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v9 = [v0 remoteParticipantHandles];
  OUTLINED_FUNCTION_1_1(&dword_1B8E4A000, v3, v4, "==> %{public}@:%@", v5, v6, v7, v8, 2u);
}

- (void)getLocalizedString:(void *)a1 .cold.1(void *a1)
{
  SEL v1 = [a1 resourcePath];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B8E4A000, v2, v3, "ClassBundle: %{public}@", v4, v5, v6, v7, v8);
}

- (void)getLocalizedString:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  SEL v1 = [v0 resourcePath];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B8E4A000, v2, v3, "MainBundle: %{public}@", v4, v5, v6, v7, v8);
}

- (void)callerNameForDisplay
{
  OUTLINED_FUNCTION_2_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1B8E4A000, v2, v3, "<== %{public}@ = %{public}@", v4, v5, v6, v7, v8);
}

+ (void)getLocationForCallerId:(os_log_t)log andIsoCountryCode:.cold.1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Timeout occured waiting for GeoServices to return location!", v1, 2u);
}

void __57__CHRecentCall_getLocationForCallerId_andIsoCountryCode___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1B8E4A000, v1, OS_LOG_TYPE_ERROR, "Could not get location information for phone number %@ error: %{public}@", v2, 0x16u);
}

@end