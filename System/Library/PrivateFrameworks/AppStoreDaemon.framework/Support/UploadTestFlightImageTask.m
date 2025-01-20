@interface UploadTestFlightImageTask
- (id)acceptHeaderValue;
- (id)contentTypeHeaderValue;
- (void)main;
@end

@implementation UploadTestFlightImageTask

- (void)main
{
  id v3 = objc_alloc((Class)NSMutableURLRequest);
  pendingUpload = self->_pendingUpload;
  if (pendingUpload) {
    pendingUpload = (TFPendingImageUpload *)pendingUpload->_URL;
  }
  v5 = pendingUpload;
  id v6 = [v3 initWithURL:v5];

  v7 = self->_pendingUpload;
  if (v7) {
    v7 = (TFPendingImageUpload *)v7->_data;
  }
  v8 = v7;
  [v6 setHTTPBody:v8];

  [v6 setHTTPMethod:@"PUT"];
  v9 = [(UploadTestFlightImageTask *)self contentTypeHeaderValue];
  [v6 setHTTPContentType:v9];

  v10 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  objc_msgSend(v10, "set_sourceApplicationBundleIdentifier:", @"com.apple.AppStore");
  v11 = +[NSURLSession sessionWithConfiguration:v10];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_100017F88;
  v46 = sub_100017B80;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100017F88;
  v40 = sub_100017B80;
  id v41 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10026A9F4;
  v32[3] = &unk_1005232C0;
  v34 = &v36;
  v35 = &v42;
  v12 = dispatch_semaphore_create(0);
  v33 = v12;
  v13 = [v11 dataTaskWithRequest:v6 completionHandler:v32];
  [v13 resume];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  if (!v43[5])
  {
    if (v37[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = (id)v37[5];
        if ([v14 statusCode] == (id)200)
        {
          v15 = [v14 allHeaderFields];
          v30 = [v15 objectForKeyedSubscript:@"x-icloud-versionid"];

          if (v30)
          {
            v16 = (TFImageUpload *)objc_opt_new();
            v17 = self->_pendingUpload;
            if (v17) {
              v17 = (TFPendingImageUpload *)v17->_URL;
            }
            v18 = v17;
            v19 = [(TFPendingImageUpload *)v18 absoluteString];
            sub_100209A34((uint64_t)v16, v19);

            sub_100209A4C((uint64_t)v16, v30);
            successfulUpload = self->_successfulUpload;
            self->_successfulUpload = v16;

            [(Task *)self completeWithSuccess];
            goto LABEL_22;
          }
          v25 = self->_pendingUpload;
          if (v25) {
            v25 = (TFPendingImageUpload *)v25->_URL;
          }
          v31 = v25;
          v29 = self->super._entity;
          v26 = sub_100233690((_TtC9appstored6LogKey *)v29);
          v27 = [v26 appVersion];
          v24 = +[NSString stringWithFormat:@"Successfully uploaded image to %@ for %@ but failed to find the versionid header", v31, v27];

          v28 = ASDErrorWithDescription();
          [(Task *)self completeWithError:v28];

          v30 = 0;
        }
        else
        {
          v21 = self->super._entity;
          v22 = sub_100233690((_TtC9appstored6LogKey *)v21);
          v23 = [v22 appVersion];
          v30 = +[NSString stringWithFormat:@"Failed to upload the image for %@", v23];

          [v14 statusCode];
          v24 = ASDErrorWithDescription();
          [(Task *)self completeWithError:v24];
        }

LABEL_22:
        goto LABEL_7;
      }
    }
  }
  ASDErrorWithSafeUserInfo();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [(Task *)self completeWithError:v14];
LABEL_7:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

- (id)acceptHeaderValue
{
  return 0;
}

- (id)contentTypeHeaderValue
{
  return @"image/jpeg";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successfulUpload, 0);
  objc_storeStrong((id *)&self->_pendingUpload, 0);
}

@end