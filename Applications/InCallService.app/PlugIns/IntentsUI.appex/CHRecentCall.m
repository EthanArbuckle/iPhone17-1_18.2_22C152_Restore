@interface CHRecentCall
+ (id)predicateForFilteringOutFaceTimeAudioCalls;
+ (id)predicateForRecentCallsGreaterThanDate:(id)a3;
+ (id)predicateForRecentCallsMatchingAnyMediaTypes:(id)a3;
+ (id)predicateForRecentCallsMatchingCallStatus:(unsigned int)a3;
+ (id)predicateForRecentCallsMatchingRead:(BOOL)a3;
+ (id)predicateForRecentCallsMatchingServiceProvider:(id)a3;
+ (id)predicateForRecentCallsMatchingServiceProviders:(id)a3;
- (BOOL)ph_canAssociateWithMessage:(id)a3;
- (BOOL)ph_supportsLocalParticipantBadge;
- (NSSet)ph_uniqueIDs;
- (TUHandle)handle;
- (id)familyName;
- (id)fullName;
- (id)givenName;
@end

@implementation CHRecentCall

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
  v4 = +[NSPredicate predicateWithFormat:@"(callStatus == %@)", v3];

  return v4;
}

+ (id)predicateForRecentCallsMatchingRead:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  v4 = +[NSPredicate predicateWithFormat:@"(read == %@)", v3];

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
  return +[NSPredicate predicateWithFormat:@"!(mediaType == %@ && serviceProvider == %@)", &off_100090590, kCHServiceProviderFaceTime];
}

- (TUHandle)handle
{
  v3 = [(CHRecentCall *)self callerId];
  if ([v3 length])
  {
    switch((unint64_t)[(CHRecentCall *)self handleType])
    {
      case 0uLL:
        v4 = PHDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100061C2C(v4);
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
        v6 = v5;
        break;
      default:
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v6 = 0;
  }

  return (TUHandle *)v6;
}

- (BOOL)ph_supportsLocalParticipantBadge
{
  v3 = [(CHRecentCall *)self localParticipantUUID];
  uint64_t v4 = [(CHRecentCall *)self outgoingLocalParticipantUUID];
  id v5 = (void *)v4;
  unsigned __int8 v6 = 0;
  if (v3 && v4) {
    unsigned __int8 v6 = [v3 isEqual:v4];
  }

  return v6;
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
  v3 = [(CHRecentCall *)self remoteParticipantHandles];
  [v3 count];

  return 0;
}

- (id)fullName
{
  v3 = [(CHRecentCall *)self identityExtension];

  if (v3)
  {
    uint64_t v4 = [(CHRecentCall *)self name];
    id v5 = [(CHRecentCall *)self identityExtension];
    id v6 = +[NSString stringWithFormat:@"%@: ", v5];
    id v7 = [v4 stringByReplacingOccurrencesOfString:v6 withString:&stru_10008F308];
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
    uint64_t v4 = [v3 firstObject];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)familyName
{
  v2 = [(CHRecentCall *)self fullName];
  v3 = [v2 componentsSeparatedByString:@" "];

  if (v3 && (unint64_t)[v3 count] >= 2)
  {
    uint64_t v4 = [v3 lastObject];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end