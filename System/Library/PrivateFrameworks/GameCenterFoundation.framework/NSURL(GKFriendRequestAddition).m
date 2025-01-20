@interface NSURL(GKFriendRequestAddition)
+ (id)_gkGenerateFriendRequestURL:()GKFriendRequestAddition;
@end

@implementation NSURL(GKFriendRequestAddition)

+ (id)_gkGenerateFriendRequestURL:()GKFriendRequestAddition
{
  v49[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 friendSupportPageURL];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29088]);
    v6 = [v3 friendSupportPageURL];
    id v7 = (id)[v5 initWithString:v6];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
  }
  v8 = [v3 initiator];
  v9 = [v8 displayName];

  if (v9)
  {
    v48[0] = @"fc";
    v10 = [v3 friendCode];
    v49[0] = v10;
    v48[1] = @"rqs";
    v11 = [v3 friendRequestState];
    v49[1] = v11;
    v48[2] = @"pn";
    v12 = [v3 initiator];
    v13 = [v12 displayName];
    v49[2] = v13;
    v48[3] = @"pid";
    v14 = [v3 initiator];
    v15 = [v14 internal];
    v16 = [v15 playerID];
    v49[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];

    v45 = (void *)v17;
    v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
    v19 = [v18 compressedDataUsingAlgorithm:3 error:0];
    v20 = [v19 base64EncodedStringWithOptions:0];
    id v46 = v7;
    id v21 = objc_alloc(MEMORY[0x1E4F290C8]);
    v22 = [v3 friendRequestVersion];
    v23 = (void *)[v21 initWithName:@"vn" value:v22];
    v47[0] = v23;
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"zd" value:v20];
    v47[1] = v24;
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"pid" value:@"UnknownID"];
    v47[2] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
    [v7 setQueryItems:v26];

    v27 = [v7 URL];
    v28 = [v27 absoluteString];
    unint64_t v29 = [v28 length];

    if (v29 >> 3 >= 0x271)
    {
      v30 = NSString;
      v31 = NSNumber;
      v43 = [v27 absoluteString];
      v32 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v43, "length"));
      v33 = [v27 absoluteString];
      [v30 stringWithFormat:@"messages url is too long: %@ - %@", v32, v33];
      v34 = v44 = v18;
      v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKUtils+FriendRequest.m"];
      [v35 lastPathComponent];
      v36 = v20;
      v37 = v19;
      id v38 = objc_claimAutoreleasedReturnValue();
      v39 = [v30 stringWithFormat:@"%@ (generatedURL.absoluteString.length < messagesMaxURLLength)\n[%s (%s:%d)]", v34, "+[NSURL(GKFriendRequestAddition) _gkGenerateFriendRequestURL:]", objc_msgSend(v38, "UTF8String"), 74];

      v19 = v37;
      v20 = v36;

      id v7 = v46;
      v18 = v44;

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v39 format];
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v40 = GKOSLoggers();
    }
    v41 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      +[NSURL(GKFriendRequestAddition) _gkGenerateFriendRequestURL:](v41);
    }
    v27 = 0;
  }

  return v27;
}

+ (void)_gkGenerateFriendRequestURL:()GKFriendRequestAddition .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "Generate Friend Request URL display name is nil.", v1, 2u);
}

@end