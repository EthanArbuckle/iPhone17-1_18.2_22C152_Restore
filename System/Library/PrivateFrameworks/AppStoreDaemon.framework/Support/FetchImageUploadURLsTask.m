@interface FetchImageUploadURLsTask
- (void)main;
@end

@implementation FetchImageUploadURLsTask

- (void)main
{
  if (self)
  {
    v3 = self->super._entity;
    v4 = sub_100233690((_TtC9appstored6LogKey *)v3);
    v5 = [v4 imagesData];
    unsigned int v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = objc_opt_new();
      v8 = self->super._entity;
      v9 = sub_1002333F4(v8);
      id v10 = [v9 unsignedLongLongValue];
      if (v7)
      {
        *(unsigned char *)(v7 + 36) |= 2u;
        *(void *)(v7 + 16) = v10;

        *(unsigned char *)(v7 + 36) |= 4u;
        *(_DWORD *)(v7 + 32) = v6;
        sub_100288940(v7, @"image/jpeg");
        v11 = sub_10030B11C();
        id v52 = 0;
        v12 = sub_10030B9EC((uint64_t)v11, @"testflight-visual-feedback/get-image-upload-urls-url", &v52);
        id v13 = v52;

        if (v13)
        {
          id v14 = +[NSString stringWithFormat:@"Failed to find URL to fetch image upload URLs: %@", v13];
          ASDErrorWithDescription();
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          [(Task *)self completeWithError:v15];
          v16 = v12;
        }
        else
        {
          v16 = sub_10031756C((id *)&self->super.super.super.super.isa, v12);

          v17 = [(id)v7 data];
          id v51 = 0;
          sub_10031701C((_TtC9appstored6LogKey **)self, 4, v16, v17, &v51);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          id v14 = v51;

          if (v14)
          {
            [(Task *)self completeWithError:v14];
          }
          else
          {
            id v15 = v15;
            if ([v15 responseStatusCode] == (id)200)
            {
              v18 = [TFGetImageUploadUrlsResponse alloc];
              id v47 = v15;
              v19 = [v15 data];
              v20 = [(TFGetImageUploadUrlsResponse *)v18 initWithData:v19];

              uint64_t v49 = v7;
              v48 = v16;
              if (v20) {
                uploadUrls = v20->_uploadUrls;
              }
              else {
                uploadUrls = 0;
              }
              v22 = uploadUrls;
              id v23 = [(NSMutableArray *)v22 count];
              v24 = self->super._entity;
              sub_100233690((_TtC9appstored6LogKey *)v24);
              v26 = v25 = self;
              v27 = [v26 imagesData];
              id v28 = [v27 count];

              if (v23 == v28)
              {
                v29 = objc_opt_new();
                long long v53 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                v46 = v20;
                if (v20) {
                  v30 = v20->_uploadUrls;
                }
                else {
                  v30 = 0;
                }
                v31 = v30;
                id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v53 objects:v61 count:16];
                if (v32)
                {
                  id v33 = v32;
                  uint64_t v34 = *(void *)v54;
                  do
                  {
                    for (i = 0; i != v33; i = (char *)i + 1)
                    {
                      if (*(void *)v54 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                      v37 = +[NSURL URLWithString:v36];
                      if (v37)
                      {
                        [v29 addObject:v37];
                      }
                      else
                      {
                        v38 = ASDLogHandleForCategory();
                        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                        {
                          v50 = v25->super._entity;
                          v39 = sub_100233614(v50);
                          *(_DWORD *)buf = 138412546;
                          v58 = v39;
                          __int16 v59 = 2114;
                          uint64_t v60 = v36;
                          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "[%@]: Unable to create a valid URL with the provided string %{public}@", buf, 0x16u);
                        }
                      }
                    }
                    id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v53 objects:v61 count:16];
                  }
                  while (v33);
                }

                v40 = (NSArray *)[v29 copy];
                signedURLs = v25->_signedURLs;
                v25->_signedURLs = v40;

                [(Task *)v25 completeWithSuccess];
                v16 = v48;
                id v13 = 0;
                v20 = v46;
              }
              else
              {
                v29 = ASDErrorWithDescription();
                [(Task *)v25 completeWithError:v29];
                v16 = v48;
              }

              uint64_t v7 = v49;
              id v15 = v47;
            }
            else
            {
              [v15 responseStatusCode];
              ASDErrorWithDescription();
              v20 = (TFGetImageUploadUrlsResponse *)objc_claimAutoreleasedReturnValue();
              [(Task *)self completeWithError:v20];
            }

            id v14 = 0;
          }
        }

        goto LABEL_38;
      }

      sub_100288940(0, @"image/jpeg");
    }
  }
  v42 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      entity = self->super._entity;
    }
    else {
      entity = 0;
    }
    v44 = entity;
    v45 = sub_100233614(v44);
    *(_DWORD *)v61 = 138412290;
    v62 = v45;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[%@]: No images to upload, skipping FetchImageUploadURLsTask", v61, 0xCu);
  }
  [(Task *)self completeWithSuccess];
  uint64_t v7 = 0;
LABEL_38:
}

- (void).cxx_destruct
{
}

@end