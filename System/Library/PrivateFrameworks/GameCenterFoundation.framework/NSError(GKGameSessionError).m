@interface NSError(GKGameSessionError)
+ (id)_gkUserErrorForGameSessionErrorCode:()GKGameSessionError userInfo:;
@end

@implementation NSError(GKGameSessionError)

+ (id)_gkUserErrorForGameSessionErrorCode:()GKGameSessionError userInfo:
{
  id v5 = a4;
  if (v5) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  }
  else {
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  switch(a3)
  {
    case 2:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_ICLOUD_NOT_AUTHENTICATED_DESCRIPTION];
      break;
    case 3:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SESSION_CONFLICT_DESCRIPTION];
      break;
    case 4:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SESSION_NOT_SHARED_DESCRIPTION];
      break;
    case 5:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SESSION_CONNECTION_CANCELLED_BY_USER];
      break;
    case 6:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SESSION_CONNECTION_FAILED_DESCRIPTION];
      break;
    case 7:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SESSION_HAS_MAX_CONNECTED_PLAYERS_DESCRIPTION];
      break;
    case 8:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SEND_DATA_NOT_CONNECTED_DESCRIPTION];
      break;
    case 9:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SEND_DATA_NO_RECIPIENTS_DESCRIPTION];
      break;
    case 10:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SEND_DATA_PLAYERS_NOT_REACHABLE];
      break;
    case 11:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SEND_RATE_LIMIT_REACHED];
      break;
    case 12:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_BAD_CONTAINER];
      break;
    case 13:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_CLOUD_QUOTA_EXCEEDED];
      break;
    case 14:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_NETWORK_FAILURE];
      break;
    case 15:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_CLOUD_DRIVE_DISABLED];
      break;
    case 16:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_SESSION_INVALID];
      break;
    default:
      uint64_t v7 = +[GCFLocalizedStrings ERROR_UNKNOWN_DESCRIPTION];
      break;
  }
  v8 = (void *)v7;
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:GKGameSessionErrorDomain code:a3 userInfo:v6];

  return v9;
}

@end