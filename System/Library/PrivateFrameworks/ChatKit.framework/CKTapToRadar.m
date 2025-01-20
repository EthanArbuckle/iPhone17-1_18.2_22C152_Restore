@interface CKTapToRadar
+ (id)_titleForFailedMessageRadar;
+ (void)launchTapToRadarForChatControllerLeak:(id)a3;
+ (void)launchTapToRadarForFailedMessage:(id)a3 inChat:(id)a4;
+ (void)launchTapToRadarForFailedMessageGUID:(id)a3 chatGUID:(id)a4 messageDescription:(id)a5 error:(int64_t)a6;
+ (void)launchTapToRadarForTranscriptDynamicsWatchdogWithTimeInterval:(double)a3;
+ (void)launchTapToRadarWithTitle:(id)a3 description:(id)a4 bundleID:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 autodiagnostics:(id)a9 classification:(id)a10 reproducibility:(id)a11;
@end

@implementation CKTapToRadar

+ (void)launchTapToRadarWithTitle:(id)a3 description:(id)a4 bundleID:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 autodiagnostics:(id)a9 classification:(id)a10 reproducibility:(id)a11
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  id v38 = a6;
  id v40 = a7;
  id v41 = a8;
  id v39 = a9;
  id v42 = a10;
  id v43 = a11;
  v16 = [MEMORY[0x1E4F6C360] sharedInstance];
  LODWORD(a7) = [v16 isInternalInstall];

  if (a7)
  {
    v17 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
    v18 = NSString;
    v19 = [v35 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v20 = [v36 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v21 = [v37 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v22 = [v38 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v23 = [v40 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v24 = [v41 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v25 = [v42 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v26 = [v43 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    v27 = [v18 stringWithFormat:@"tap-to-radar://new?Title=%@&Description=%@&BundleID=%@&ComponentID=%@&ComponentName=%@&ComponentVersion=%@&AutoDiagnostics=%@&Classification=%@&Reproducibility=%@&IncludeDevicePrefixInTitle=1", v19, v20, v21, v22, v23, v24, v39, v25, v26];

    v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    v29 = (void *)getLSApplicationWorkspaceClass_softClass;
    uint64_t v47 = getLSApplicationWorkspaceClass_softClass;
    if (!getLSApplicationWorkspaceClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getLSApplicationWorkspaceClass_block_invoke;
      v49 = &unk_1E5620B90;
      v50 = &v44;
      __getLSApplicationWorkspaceClass_block_invoke((uint64_t)buf);
      v29 = (void *)v45[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v44, 8);
    v31 = [v30 defaultWorkspace];
    int v32 = [v31 openURL:v28 withOptions:0];

    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = @"Failed to open";
        if (v32) {
          v34 = @"Successfully opened";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "%@ Tap-to-Radar url, URL: %@", buf, 0x16u);
      }
    }
  }
}

+ (id)_titleForFailedMessageRadar
{
  return (id)[NSString stringWithFormat:@"[Send Fail] Message failed to send"];
}

+ (void)launchTapToRadarForFailedMessageGUID:(id)a3 chatGUID:(id)a4 messageDescription:(id)a5 error:(int64_t)a6
{
  id v17 = a4;
  id v10 = a5;
  v11 = [NSString stringWithFormat:@"Additional Notes:\n\n\nGUID: %@", a3];
  if (v17)
  {
    uint64_t v12 = [v11 stringByAppendingFormat:@"\n\nChat GUID: %@", v17];

    v11 = (void *)v12;
  }
  if (a6)
  {
    v13 = _NSStringFromIMMessageError();
    uint64_t v14 = [v11 stringByAppendingFormat:@"\n\nError: %@ (%llu)", v13, a6];

    v11 = (void *)v14;
  }
  if (v10)
  {
    uint64_t v15 = [v11 stringByAppendingFormat:@"\n\nDescription: %@", v10];

    v11 = (void *)v15;
  }
  v16 = [a1 _titleForFailedMessageRadar];
  [a1 launchTapToRadarWithTitle:v16 description:v11 bundleID:@"com.apple.MobileSMS" componentID:@"137610" componentName:@"Messages" componentVersion:@"(New Bugs)" autodiagnostics:@"phone" classification:@"Serious Bug" reproducibility:@"I Didn't Try"];
}

+ (void)launchTapToRadarForFailedMessage:(id)a3 inChat:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 guid];
  v8 = [v6 guid];

  v9 = [v7 description];
  id v10 = [v7 error];

  objc_msgSend(a1, "launchTapToRadarForFailedMessageGUID:chatGUID:messageDescription:error:", v11, v8, v9, objc_msgSend(v10, "code"));
}

+ (void)launchTapToRadarForChatControllerLeak:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v7 = [v4 stringWithFormat:@"%@ Leak", v5];
  id v6 = [NSString stringWithFormat:@"%@ leak detected with chat controller leak detector", v5];

  [a1 launchTapToRadarWithTitle:v7 description:v6 bundleID:@"com.apple.MobileSMS" componentID:@"137610" componentName:@"Messages" componentVersion:@"(New Bugs)" autodiagnostics:@"phone" classification:@"Serious Bug" reproducibility:@"I Didn't Try"];
}

+ (void)launchTapToRadarForTranscriptDynamicsWatchdogWithTimeInterval:(double)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"Transcript Dynamics Running For More Than %.1f Seconds", *(void *)&a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 launchTapToRadarWithTitle:v4, @"Transcript dynamics wathdog fired. Animations have been invalidated, likely leading to an incorrect transcript layout.\n\nPlease describe what you were doing when this occured:\n", @"com.apple.MobileSMS", @"137610", @"Messages", @"(New Bugs)", @"phone", @"Serious Bug", @"I Didn't Try" description bundleID componentID componentName componentVersion autodiagnostics classification reproducibility];
}

@end