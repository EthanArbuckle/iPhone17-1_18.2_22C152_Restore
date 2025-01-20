@interface IDSMMCSUploader
- (IDSMMCSUploader)initWithEncryptionController:(id)a3 transferServicesController:(id)a4;
- (id)pinnedIdentityController;
- (id)uploadData:(id)a3 fromID:(id)a4 toEndpoint:(id)a5 onTopic:(id)a6 forGUID:(id)a7 encryptionType:(unint64_t)a8;
@end

@implementation IDSMMCSUploader

- (id)pinnedIdentityController
{
  return +[IDSPinnedIdentityController sharedInstance];
}

- (IDSMMCSUploader)initWithEncryptionController:(id)a3 transferServicesController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSMMCSUploader;
  v9 = [(IDSMMCSUploader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptionController, a3);
    objc_storeStrong((id *)&v10->_transferServicesController, a4);
  }

  return v10;
}

- (id)uploadData:(id)a3 fromID:(id)a4 toEndpoint:(id)a5 onTopic:(id)a6 forGUID:(id)a7 encryptionType:(unint64_t)a8
{
  id v14 = a3;
  id v32 = a4;
  id v33 = a5;
  id v34 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  v17 = +[NSFileManager defaultManager];
  v18 = [v17 _randomTemporaryPathWithSuffix:0];

  if (!v18)
  {
    _IMWarn();
LABEL_11:
    id v26 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Failed uploading attachment file transfer (could not generate file)", NSLocalizedDescriptionKey, 0);
    id v27 = objc_alloc((Class)NSError);
    id v28 = [v27 initWithDomain:IDSSendErrorDomain code:4 userInfo:v26];
    [v16 failWithError:v28];

    goto LABEL_12;
  }
  v19 = [v14 data];
  id v44 = 0;
  unsigned int v20 = [v19 writeToFile:v18 options:1 error:&v44];
  id v21 = v44;

  if (!v20)
  {
    v31 = [v14 data];
    _IMWarn();

    goto LABEL_11;
  }
  v22 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v46 = @"YES";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "    Wrote data to path: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }

  transferServicesController = self->_transferServicesController;
  v24 = [v18 stringByResolvingAndStandardizingPath];
  v25 = +[NSString stringGUIDForObject:v18];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10037EA88;
  v35[3] = &unk_10098A558;
  id v36 = v33;
  id v37 = v15;
  unint64_t v43 = a8;
  id v38 = v32;
  id v39 = v34;
  v40 = self;
  id v41 = v18;
  id v42 = v16;
  [(IDSTransferServicesController *)transferServicesController sendFilePath:v24 topic:v39 userInfo:0 transferID:v25 encryptFile:0 progressBlock:&stru_10098A508 completionBlock:v35];

  id v26 = v36;
LABEL_12:

  v29 = [v16 promise];

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferServicesController, 0);

  objc_storeStrong((id *)&self->_encryptionController, 0);
}

@end