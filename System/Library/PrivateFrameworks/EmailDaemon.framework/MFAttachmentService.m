@interface MFAttachmentService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFAttachmentService

+ (id)serviceName
{
  return @"MSAttachmentRequest";
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = xpc_dictionary_get_value(v10, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v11)
  {
    v58 = +[NSAssertionHandler currentHandler];
    [v58 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 374, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
  }
  v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  [v12 objectForKey:@"MSAttachmentRequestKeyOperation"];
  v64 = v63 = a5;
  id v13 = [v64 integerValue];
  v14 = +[NSMutableDictionary dictionary];
  if (v13 == (id)1)
  {
    v40 = MFLogGeneral();
    v62 = a6;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_1000C163C(v40, v41, v42, v43, v44, v45, v46, v47);
    }

    v23 = [v12 objectForKey:@"MSAttachmentRequestKeyNameType"];
    if (!v23)
    {
      v60 = +[NSAssertionHandler currentHandler];
      [v60 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 388, @"Invalid parameter not satisfying: %@", @"argName" object file lineNumber description];
    }
    v48 = [v12 objectForKey:@"MSAttachmentRequestKeySizeType"];
    id v49 = [v48 integerValue];

    v25 = [v12 objectForKey:@"MSAttachmentRequestKeyMimeType"];
    v26 = [v12 objectForKey:@"MSAttachmentRequestKeyContentID"];
    v50 = +[MFAttachmentPlaceholder serializedPlaceholderForFileName:v23 fileSize:v49 mimeType:v25 contentID:v26];
    if (v50) {
      [v14 setObject:v50 forKey:@"MSAttachmentResponseKeyData"];
    }
    goto LABEL_34;
  }
  if (v13 != (id)2)
  {
    if (v13 != (id)3)
    {
      v51 = MFLogGeneral();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1000C15C4((uint64_t)v13, v51);
      }

      v31 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7342 userInfo:0];
      if (v14) {
        goto LABEL_37;
      }
      goto LABEL_29;
    }
    v15 = MFLogGeneral();
    v62 = a6;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000C1724(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v23 = [v12 objectForKey:@"MSAttachmentRequestKeyURL"];
    if (!v23)
    {
      v61 = +[NSAssertionHandler currentHandler];
      [v61 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 414, @"Invalid parameter not satisfying: %@", @"argURL" object file lineNumber description];
    }
    v24 = [v23 path];
    v25 = objc_msgSend(v24, "mf_canonicalizedAbsolutePath");

    v26 = +[MFAttachmentPlaceholder placeholderDirectory];
    if (![v25 hasPrefix:v26]
      || ([v25 lastPathComponent],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v26 lastPathComponent],
          v28 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v29 = [v27 isEqualToString:v28],
          v28,
          v27,
          (v29 & 1) != 0))
    {
      v30 = MFLogGeneral();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1000C16AC((uint64_t)v23, v30);
      }

      v31 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:9089 userInfo:0];
      goto LABEL_35;
    }
    v50 = +[NSURL fileURLWithPath:v25];
    v52 = +[MFAttachmentSecurityScope securityScopedURL:v50];
    v53 = [v52 securityScopeToken];

    if (v53) {
      [v14 setObject:v53 forKey:@"MSAttachmentResponseKeyData"];
    }

LABEL_34:
    v31 = 0;
LABEL_35:

    goto LABEL_36;
  }
  v32 = MFLogGeneral();
  v62 = a6;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_1000C1674(v32, v33, v34, v35, v36, v37, v38, v39);
  }

  v23 = [v12 objectForKey:@"MSAttachmentRequestKeyURL"];
  if (!v23)
  {
    v59 = +[NSAssertionHandler currentHandler];
    [v59 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 404, @"Invalid parameter not satisfying: %@", @"argURL" object file lineNumber description];
  }
  +[MFAttachmentPlaceholder removePlaceholderForFileURL:v23];
  v25 = +[NSNull null];
  [v14 setObject:v25 forKey:@"MSAttachmentResponseKeyError"];
  v31 = 0;
LABEL_36:

  a6 = v62;
  if (v14)
  {
LABEL_37:
    xpc_object_t reply = xpc_dictionary_create_reply(v10);
    v55 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, (const char *)[@"MSAttachmentResponse" UTF8String], v55);
    id v56 = reply;
    id *v63 = v56;

    goto LABEL_38;
  }
LABEL_29:
  if (a6) {
    *a6 = v31;
  }
LABEL_38:

  return v14 != 0;
}

@end