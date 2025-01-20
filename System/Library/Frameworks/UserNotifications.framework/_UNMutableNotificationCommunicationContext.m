@interface _UNMutableNotificationCommunicationContext
+ (id)mutableContextFromINIntent:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssociatedObjectUri:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBusinessCorrespondence:(BOOL)a3;
- (void)setCapabilities:(int64_t)a3;
- (void)setContentURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageName:(id)a3;
- (void)setMentionsCurrentUser:(BOOL)a3;
- (void)setNotifyRecipientAnyway:(BOOL)a3;
- (void)setRecipientCount:(unint64_t)a3;
- (void)setRecipients:(id)a3;
- (void)setReplyToCurrentUser:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setSystemImage:(BOOL)a3;
@end

@implementation _UNMutableNotificationCommunicationContext

+ (id)mutableContextFromINIntent:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(_UNMutableNotificationCommunicationContext);
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];
  [(_UNMutableNotificationCommunicationContext *)v4 setBundleIdentifier:v6];

  v7 = [v3 identifier];
  [(_UNMutableNotificationCommunicationContext *)v4 setAssociatedObjectUri:v7];

  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"Persisting INImage for Intent Type '%@':", v10];

  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2050000000;
  v12 = (void *)getINSendMessageIntentClass_softClass;
  uint64_t v96 = getINSendMessageIntentClass_softClass;
  if (!getINSendMessageIntentClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getINSendMessageIntentClass_block_invoke;
    v98 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5F061A8;
    *(void *)&long long v99 = &v93;
    __getINSendMessageIntentClass_block_invoke((uint64_t)buf);
    v12 = (void *)v94[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v93, 8);
  if (objc_opt_isKindOfClass())
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v14 = [v3 recipients];
    char v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = [v14 countByEnumeratingWithState:&v89 objects:v100 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v90 != v18) {
            objc_enumerationMutation(v14);
          }
          int v20 = [*(id *)(*((void *)&v89 + 1) + 8 * i) isMe];
          v15 |= v20;
          v16 += 8 * (v20 ^ 1u);
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v89 objects:v100 count:16];
      }
      while (v17);
    }

    v21 = [v3 donationMetadata];
    v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 recipientCount];
      uint64_t v24 = v23 - 1;
      if ((v15 & 1) == 0) {
        uint64_t v24 = 1;
      }
      if (!v23) {
        uint64_t v24 = 0;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (v16) {
      BOOL v33 = 0;
    }
    else {
      BOOL v33 = v24 == 0;
    }
    if (v33)
    {
      v37 = [v3 sender];
      v29 = [v37 image];

      v38 = (void *)UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = [v29 _uri];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v40;
        _os_log_impl(&dword_1AE729000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ sender image _uri: %@", buf, 0x16u);
      }
    }
    else
    {
      v29 = [v3 imageForParameterNamed:@"speakableGroupName"];
      v34 = (void *)UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        v36 = [v29 _uri];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v36;
        _os_log_impl(&dword_1AE729000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ speakableGroupName image _uri: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x2050000000;
    v25 = (void *)getINStartCallIntentClass_softClass;
    uint64_t v96 = getINStartCallIntentClass_softClass;
    if (!getINStartCallIntentClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getINStartCallIntentClass_block_invoke;
      v98 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5F061A8;
      *(void *)&long long v99 = &v93;
      __getINStartCallIntentClass_block_invoke((uint64_t)buf);
      v25 = (void *)v94[3];
    }
    id v26 = v25;
    _Block_object_dispose(&v93, 8);
    if (objc_opt_isKindOfClass())
    {
      v27 = [v3 contacts];
      BOOL v28 = (unint64_t)[v27 count] > 1;

      if (v28)
      {
        v29 = [v3 imageForParameterNamed:@"callRecordToCallBack"];
      }
      else
      {
        v41 = [v3 contacts];
        v42 = [v41 firstObject];
        v29 = [v42 image];
      }
    }
    else
    {
      v29 = [v3 keyImage];
      v30 = (void *)UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = [v29 _uri];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v32;
        _os_log_impl(&dword_1AE729000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ key image _uri: %@", buf, 0x16u);
      }
    }
  }
  if (v29)
  {
    v43 = [v29 _name];

    if (v43)
    {
      v44 = [v29 _name];
      uint64_t v45 = [v29 _isSystem];
      [(_UNMutableNotificationCommunicationContext *)v4 setImageName:v44];
      [(_UNMutableNotificationCommunicationContext *)v4 setSystemImage:v45];
      v46 = UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v47 = @"NO";
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        if (v45) {
          v47 = @"YES";
        }
        *(void *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2114;
        v98 = (uint64_t (*)(uint64_t, uint64_t))v47;
        _os_log_impl(&dword_1AE729000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ Found image of '%{public}@' name. System image:%{public}@", buf, 0x20u);
      }

      goto LABEL_80;
    }
    v49 = [MEMORY[0x1E4F1C9C8] now];
    v50 = [v29 _uri];

    if (v50)
    {
      v51 = [v29 _uri];
      uint64_t v52 = UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v51;
        v53 = "%{public}@ url found at image's _uri: %{public}@";
        v54 = v52;
        uint32_t v55 = 22;
LABEL_50:
        _os_log_impl(&dword_1AE729000, v54, OS_LOG_TYPE_DEFAULT, v53, buf, v55);
      }
    }
    else
    {
      v56 = [v29 _identifier];

      if (!v56)
      {
        v70 = UNLogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v11;
          _os_log_impl(&dword_1AE729000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ url cannot be found", buf, 0xCu);
        }
        v51 = 0;
        goto LABEL_77;
      }
      v57 = (void *)MEMORY[0x1E4F1CB10];
      v58 = [v29 _identifier];
      v51 = [v57 URLWithString:v58];

      uint64_t v59 = UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v11;
        v53 = "%{public}@ url created from image's _identifier";
        v54 = v59;
        uint32_t v55 = 12;
        goto LABEL_50;
      }
    }
    if (v51)
    {
      v60 = [v51 scheme];
      char v61 = [v60 isEqualToString:@"intents-remote-image-proxy"];

      if ((v61 & 1) == 0)
      {
        v62 = UNLogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = @"intents-remote-image-proxy";
          *(_WORD *)&buf[22] = 2114;
          v98 = (uint64_t (*)(uint64_t, uint64_t))@"intents-remote-image-proxy";
          LOWORD(v99) = 2114;
          *(void *)((char *)&v99 + 2) = v51;
          _os_log_impl(&dword_1AE729000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ contentURL scheme does not match scheme '%{public}@'. Attempting to get a corresponding url with '%{public}@' scheme. contentURL: '%{public}@'", buf, 0x2Au);
        }
        char v63 = objc_opt_respondsToSelector();
        v64 = UNLogCommunicationNotifications;
        BOOL v65 = os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT);
        if (v63)
        {
          if (v65)
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v51;
            _os_log_impl(&dword_1AE729000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ Getting proxied image synchronously for content url '%{public}@'.", buf, 0x16u);
          }
          id v88 = 0;
          v66 = [v29 _proxiedImageWithError:&v88];
          id v67 = v88;
          if (v67)
          {
            v68 = (void *)UNLogCommunicationNotifications;
            if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_ERROR))
            {
              log = v68;
              v69 = [v67 localizedDescription];
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v51;
              *(_WORD *)&buf[22] = 2114;
              v98 = v69;
              _os_log_error_impl(&dword_1AE729000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error getting proxied image synchronously for content url '%{public}@' error: %{public}@", buf, 0x20u);
            }
          }
          else if (v66)
          {
            os_log_t loga = (os_log_t)MEMORY[0x1E4F1CB10];
            v76 = [v66 _identifier];
            os_log_t logb = [loga URLWithString:v76];

            v51 = logb;
          }
          else if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          {
            +[_UNMutableNotificationCommunicationContext(UserNotifications_INIntent) mutableContextFromINIntent:]();
          }
        }
        else
        {
          if (v65)
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v51;
            _os_log_impl(&dword_1AE729000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ Getting proxied image asynchronously for content url '%{public}@'.", buf, 0x16u);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v98 = __Block_byref_object_copy_;
          *(void *)&long long v99 = __Block_byref_object_dispose_;
          *((void *)&v99 + 1) = 0;
          dispatch_semaphore_t v71 = dispatch_semaphore_create(0);
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __101___UNMutableNotificationCommunicationContext_UserNotifications_INIntent__mutableContextFromINIntent___block_invoke;
          v85[3] = &unk_1E5F06180;
          v87 = buf;
          v72 = v71;
          v86 = v72;
          [v29 _requestProxy:v85];
          dispatch_time_t v73 = dispatch_time(0, 1000000000);
          if (dispatch_semaphore_wait(v72, v73)
            && os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          {
            +[_UNMutableNotificationCommunicationContext(UserNotifications_INIntent) mutableContextFromINIntent:]();
          }
          v74 = *(void **)(*(void *)&buf[8] + 40);
          if (v74)
          {
            id v75 = v74;

            v51 = v75;
          }

          _Block_object_dispose(buf, 8);
        }
      }
    }
LABEL_77:
    v77 = [MEMORY[0x1E4F1C9C8] now];
    [v77 timeIntervalSinceDate:v49];
    v79 = v78;
    v80 = UNLogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2050;
      v98 = v79;
      _os_log_impl(&dword_1AE729000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@ Final contentURL '%{public}@' to persist. Finished in: %{public}f seconds", buf, 0x20u);
    }
    [(_UNMutableNotificationCommunicationContext *)v4 setContentURL:v51];

    goto LABEL_80;
  }
  v48 = UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v11;
    _os_log_impl(&dword_1AE729000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ INImage is nil.", buf, 0xCu);
  }
LABEL_80:

  return v4;
}

- (void)setIdentifier:(id)a3
{
  self->super._identifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAssociatedObjectUri:(id)a3
{
  self->super._associatedObjectUruint64_t i = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setBundleIdentifier:(id)a3
{
  self->super._bundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDisplayName:(id)a3
{
  self->super._displayName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setSender:(id)a3
{
  self->super._sender = (_UNNotificationContact *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setRecipients:(id)a3
{
  self->super._recipients = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setContentURL:(id)a3
{
  self->super._contentURL = (NSURL *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setImageName:(id)a3
{
  self->super._imageName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setSystemImage:(BOOL)a3
{
  self->super._systemImage = a3;
}

- (void)setMentionsCurrentUser:(BOOL)a3
{
  self->super._mentionsCurrentUser = a3;
}

- (void)setNotifyRecipientAnyway:(BOOL)a3
{
  self->super._notifyRecipientAnyway = a3;
}

- (void)setReplyToCurrentUser:(BOOL)a3
{
  self->super._replyToCurrentUser = a3;
}

- (void)setRecipientCount:(unint64_t)a3
{
  self->super._recipientCount = a3;
}

- (void)setCapabilities:(int64_t)a3
{
  self->super._capabilities = a3;
}

- (void)setBusinessCorrespondence:(BOOL)a3
{
  self->super._businessCorrespondence = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22 = +[_UNNotificationCommunicationContext allocWithZone:a3];
  v21 = [(_UNNotificationCommunicationContext *)self identifier];
  int v20 = [(_UNNotificationCommunicationContext *)self associatedObjectUri];
  v19 = [(_UNNotificationCommunicationContext *)self bundleIdentifier];
  uint64_t v18 = [(_UNNotificationCommunicationContext *)self displayName];
  uint64_t v17 = [(_UNNotificationCommunicationContext *)self sender];
  v4 = [(_UNNotificationCommunicationContext *)self recipients];
  v5 = [(_UNNotificationCommunicationContext *)self contentURL];
  v6 = [(_UNNotificationCommunicationContext *)self imageName];
  BOOL v7 = [(_UNNotificationCommunicationContext *)self isSystemImage];
  BOOL v8 = [(_UNNotificationCommunicationContext *)self mentionsCurrentUser];
  BOOL v9 = [(_UNNotificationCommunicationContext *)self notifyRecipientAnyway];
  BOOL v10 = [(_UNNotificationCommunicationContext *)self isReplyToCurrentUser];
  unint64_t v11 = [(_UNNotificationCommunicationContext *)self recipientCount];
  int64_t v12 = [(_UNNotificationCommunicationContext *)self capabilities];
  LOBYTE(v16) = [(_UNNotificationCommunicationContext *)self isBusinessCorrespondence];
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  id v13 = -[_UNNotificationCommunicationContext _initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

@end