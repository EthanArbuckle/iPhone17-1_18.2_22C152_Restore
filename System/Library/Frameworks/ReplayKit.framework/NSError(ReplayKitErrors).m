@interface NSError(ReplayKitErrors)
+ (id)_rpUserErrorForCode:()ReplayKitErrors userInfo:;
+ (id)_scUserErrorForCode:()ReplayKitErrors userInfo:;
@end

@implementation NSError(ReplayKitErrors)

+ (id)_rpUserErrorForCode:()ReplayKitErrors userInfo:
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 mutableCopy];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v8 = (void *)v7;
  switch(a3)
  {
    case -5836:
      v9 = @"RECORDING_ERROR_CLIP_IN_PROGRESS";
      break;
    case -5835:
      v9 = @"RECORDING_ERROR_FILE_PERMISSIONS";
      break;
    case -5834:
      v9 = @"RECORDING_ERROR_INVALID_PARAMETER";
      break;
    case -5833:
      v9 = @"RECORDING_ERROR_FAILURE_IN_CAPTURE_STACK";
      break;
    case -5832:
      v9 = @"RECORDING_ERROR_INVALID_SESSION";
      break;
    case -5831:
      v9 = @"RECORDING_ERROR_FAILED_TO_SAVE_TO_PHOTOS";
      break;
    case -5830:
      v9 = @"RECORDING_ERROR_STARTING_IN_RECORDING_STATE";
      break;
    case -5829:
      v9 = @"RECORDING_ERROR_STOPING_NON_RECORDING";
      break;
    case -5828:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_EXPORT_CANCELED";
      break;
    case -5827:
      v9 = @"RECORDING_ERROR_FAILED_TO_REOMOVE_FILE";
      break;
    case -5826:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_EXPORT_FAILED";
      break;
    case -5825:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_IN_WRONG_STATE";
      break;
    case -5824:
      v9 = @"RECORDING_ERROR_NO_ASSET_WRITER";
      break;
    case -5823:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_FAILED_TO_SAVE";
      break;
    case -5822:
      v9 = @"RECORDING_ERROR_FAILED_PROCESS_FIRST_SAMPLE";
      break;
    case -5821:
      v9 = @"RECORDING_ERROR_INCORRECT_TIME_STAMPS";
      break;
    case -5820:
      v9 = @"RECORDING_ERROR_FAILED_TO_OBTAIN_URL";
      break;
    case -5819:
      v9 = @"RECORDING_ERROR_BROADCAST_SETUP_FAILED";
      break;
    case -5818:
      v9 = @"RECORDING_ERROR_MIXING_FAILURE";
      break;
    case -5817:
      v9 = @"RECORDING_ERROR_MEDIASERVICES_FAILED";
      break;
    case -5816:
      v9 = @"RECORDING_ERROR_NO_CONTEXTID_MATCH";
      break;
    case -5815:
      v9 = @"RECORDING_ERROR_CONNECTION_INTERRUPTED";
      break;
    case -5814:
      v9 = @"RECORDING_ERROR_CONNECTION_INVALID";
      break;
    case -5813:
      v9 = @"RECORDING_ERROR_CARPLAY";
      break;
    case -5812:
      v9 = @"RECORDING_ERROR_FAILED_TO_SAVE";
      break;
    case -5811:
      v9 = @"RECORDING_ERROR_ACTIVE_PHONE_CALL";
      break;
    case -5810:
      v9 = @"RECORDING_ERROR_ENTITLEMENTS";
      break;
    case -5809:
      v9 = @"RECORDING_ERROR_SYSTEM_DORMANCY";
      break;
    case -5808:
      v9 = @"RECORDING_ERROR_INVALID_BROADCAST_SESSION";
      break;
    case -5807:
      v9 = @"RECORDING_ERROR_CONTENT_RESIZE";
      break;
    case -5806:
      v9 = @"RECORDING_ERROR_INTERRUPTED";
      break;
    case -5805:
      v9 = @"RECORDING_ERROR_INSUFFICIENT_STORAGE";
      break;
    case -5804:
      v9 = @"RECORDING_ERROR_FAILED";
      break;
    case -5803:
      v9 = @"RECORDING_ERROR_FAILED_TO_START";
      break;
    case -5802:
      v9 = @"RECORDING_ERROR_DISABLED";
      break;
    case -5801:
      v9 = @"RECORDING_ERROR_USER_DECLINED";
      break;
    default:
      if (a3) {
        v9 = @"RECORDING_ERROR_UNKNOWN";
      }
      else {
        v9 = @"RECORDING_ERROR_SUCCESSFUL";
      }
      break;
  }
  v10 = [MEMORY[0x263F086E0] _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  if (v10) {
    [v8 setValue:v10 forKey:*MEMORY[0x263F08320]];
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:a3 userInfo:v8];

  return v11;
}

+ (id)_scUserErrorForCode:()ReplayKitErrors userInfo:
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 mutableCopy];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v8 = (void *)v7;
  if ((unint64_t)(a3 + 3821) > 0x14) {
    v9 = @"SCSTREAM_ERROR_UNKNOWN";
  }
  else {
    v9 = off_26451D870[a3 + 3821];
  }
  v10 = [MEMORY[0x263F086E0] _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  if (v10) {
    [v8 setValue:v10 forKey:*MEMORY[0x263F08320]];
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ScreenCaptureKit.SCStreamErrorDomain" code:a3 userInfo:v8];

  return v11;
}

@end