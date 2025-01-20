@interface CHRecentCall
+ (id)predicateForFilteringOutFaceTimeAudioCalls;
+ (id)predicateForRecentCallsGreaterThanDate:(id)a3;
+ (id)predicateForRecentCallsMatchingAnyMediaTypes:(id)a3;
+ (id)predicateForRecentCallsMatchingCallStatus:(unsigned int)a3;
+ (id)predicateForRecentCallsMatchingRead:(BOOL)a3;
+ (id)predicateForRecentCallsMatchingServiceProvider:(id)a3;
+ (id)predicateForRecentCallsMatchingServiceProviders:(id)a3;
- (BOOL)carrierAllowsReportVoiceCall;
- (BOOL)isComingFaceTimeCall;
- (BOOL)isFaceTime;
- (BOOL)isIncoming;
- (BOOL)isOneToOne;
- (BOOL)isTelephony;
- (BOOL)ph_canAssociateWithMessage:(id)a3;
- (BOOL)ph_supportsLocalParticipantBadge;
- (NSSet)ph_uniqueIDs;
- (TUHandle)handle;
- (id)familyName;
- (id)fullName;
- (id)givenName;
@end

@implementation CHRecentCall

- (BOOL)ph_supportsLocalParticipantBadge
{
  v3 = [(CHRecentCall *)self localParticipantUUID];
  uint64_t v4 = [(CHRecentCall *)self outgoingLocalParticipantUUID];
  v5 = (void *)v4;
  unsigned __int8 v6 = 0;
  if (v3 && v4) {
    unsigned __int8 v6 = [v3 isEqual:v4];
  }

  return v6;
}

+ (id)predicateForRecentCallsGreaterThanDate:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"(date > %@)", a3];
}

+ (id)predicateForRecentCallsMatchingAnyMediaTypes:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"(mediaType IN %@)", a3];
}

+ (id)predicateForRecentCallsMatchingCallStatus:(unsigned int)a3
{
  v3 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  uint64_t v4 = +[NSPredicate predicateWithFormat:@"(callStatus == %@)", v3];

  return v4;
}

+ (id)predicateForRecentCallsMatchingRead:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  uint64_t v4 = +[NSPredicate predicateWithFormat:@"(read == %@)", v3];

  return v4;
}

+ (id)predicateForRecentCallsMatchingServiceProvider:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"(serviceProvider == %@)", a3];
}

+ (id)predicateForRecentCallsMatchingServiceProviders:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"(serviceProvider IN %@)", a3];
}

+ (id)predicateForFilteringOutFaceTimeAudioCalls
{
  return +[NSPredicate predicateWithFormat:@"!(mediaType == %@ && serviceProvider == %@)", &off_10028CE60, kCHServiceProviderFaceTime];
}

- (TUHandle)handle
{
  v3 = [(CHRecentCall *)self callerId];
  if ([v3 length])
  {
    switch((unint64_t)[(CHRecentCall *)self handleType])
    {
      case 0uLL:
        uint64_t v4 = PHDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          -[CHRecentCall(PhoneKit) handle](v4);
        }

        id v5 = +[TUHandle handleWithDestinationID:v3];
        goto LABEL_11;
      case 1uLL:
        id v7 = objc_alloc((Class)TUHandle);
        uint64_t v8 = 1;
        goto LABEL_10;
      case 2uLL:
        id v7 = objc_alloc((Class)TUHandle);
        uint64_t v8 = 2;
        goto LABEL_10;
      case 3uLL:
        id v7 = objc_alloc((Class)TUHandle);
        uint64_t v8 = 3;
LABEL_10:
        id v5 = [v7 initWithType:v8 value:v3];
LABEL_11:
        unsigned __int8 v6 = v5;
        break;
      default:
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    unsigned __int8 v6 = 0;
  }

  return (TUHandle *)v6;
}

- (NSSet)ph_uniqueIDs
{
  v3 = +[NSMutableSet set];
  uint64_t v4 = [(CHRecentCall *)self uniqueId];
  [v3 addObject:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CHRecentCall *)self callOccurrences];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = kCHCallOccurrenceUniqueIdKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:v9];
        if (v11) {
          [v3 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v3 copy];

  return (NSSet *)v12;
}

- (BOOL)ph_canAssociateWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CHRecentCall *)self remoteParticipantHandles];
  if ([v5 count] == (id)1)
  {
    id v6 = [v5 anyObject];
    id v7 = [v6 value];
    uint64_t v8 = +[TUHandle normalizedHandleWithDestinationID:v7];

    uint64_t v9 = [v4 senderDestinationID];
    v10 = +[TUHandle normalizedHandleWithDestinationID:v9];

    unsigned __int8 v11 = [v10 isEquivalentToHandle:v8];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)fullName
{
  v3 = [(CHRecentCall *)self identityExtension];

  if (v3)
  {
    id v4 = [(CHRecentCall *)self name];
    id v5 = [(CHRecentCall *)self identityExtension];
    id v6 = +[NSString stringWithFormat:@"%@: ", v5];
    id v7 = [v4 stringByReplacingOccurrencesOfString:v6 withString:&stru_100285990];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)givenName
{
  v2 = [(CHRecentCall *)self fullName];
  v3 = [v2 componentsSeparatedByString:@" "];

  if (v3 && [v3 count])
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)familyName
{
  v2 = [(CHRecentCall *)self fullName];
  v3 = [v2 componentsSeparatedByString:@" "];

  if (v3 && (unint64_t)[v3 count] >= 2)
  {
    id v4 = [v3 lastObject];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isTelephony
{
  v2 = self;
  char v3 = CHRecentCall.isTelephony.getter();

  return v3 & 1;
}

- (BOOL)isFaceTime
{
  v2 = self;
  char v3 = CHRecentCall.isFaceTime.getter();

  return v3 & 1;
}

- (BOOL)isOneToOne
{
  v2 = self;
  unsigned __int8 v3 = CHRecentCall.isOneToOne.getter();

  return v3 & 1;
}

- (BOOL)carrierAllowsReportVoiceCall
{
  type metadata accessor for VoiceSpamReportTelephonyManager();
  unsigned __int8 v3 = self;
  static VoiceSpamReportTelephonyManager.shared.getter();
  type metadata accessor for CarrierVoiceSpamReportHelper();
  swift_allocObject();
  CarrierVoiceSpamReportHelper.init(voiceSpamReportTelephonyManager:)();
  v7[3] = type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);
  v7[4] = lazy protocol witness table accessor for type CHHandle and conformance NSObject(&lazy protocol witness table cache variable for type CHRecentCall and conformance CHRecentCall, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);
  v7[0] = v3;
  id v4 = v3;
  char v5 = dispatch thunk of CarrierVoiceSpamReportHelper.carrierAllowsReportVoiceCall(for:)();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);

  return v5 & 1;
}

- (BOOL)isIncoming
{
  int v2 = kCHCallStatusIncoming;
  return ([(CHRecentCall *)self callStatus] & v2) != 0;
}

- (BOOL)isComingFaceTimeCall
{
  int v2 = self;
  if ([(CHRecentCall *)v2 isIncoming]) {
    unsigned __int8 v3 = [(CHRecentCall *)v2 isFaceTime];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

@end