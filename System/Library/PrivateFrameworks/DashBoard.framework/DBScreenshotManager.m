@interface DBScreenshotManager
- (DBScreenshotManager)initWithWindowScene:(id)a3;
- (void)saveScreenshotsForDisplayIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation DBScreenshotManager

- (DBScreenshotManager)initWithWindowScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBScreenshotManager;
  v6 = [(DBScreenshotManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_windowScene, a3);
  }

  return v7;
}

- (void)saveScreenshotsForDisplayIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v43 = a3;
  v35 = (void (**)(id, void *))a4;
  v37 = [MEMORY[0x263EFF9A0] dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [MEMORY[0x263F82B60] screens];
  uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v44)
  {

    goto LABEL_35;
  }
  char v36 = 0;
  uint64_t v42 = *(void *)v46;
  uint64_t v39 = *MEMORY[0x263F0F038];
  uint64_t v40 = *MEMORY[0x263F0EFC0];
  do
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v46 != v42) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      v7 = [v6 displayIdentity];
      if ([v43 containsObject:v7])
      {
        id v8 = v6;
        objc_super v9 = (const void *)[MEMORY[0x263F82E88] createIOSurfaceFromScreen:v8];
        if (v9)
        {
          uint64_t v51 = v40;
          uint64_t v52 = v39;
          *(void *)&long long buf = &unk_26E17EA80;
          *((void *)&buf + 1) = &unk_26E17EA98;
          v10 = [NSDictionary dictionaryWithObjects:&buf forKeys:&v51 count:2];
          v11 = (CGImage *)CGImageCreateFromIOSurface();
          if (v11)
          {
            v12 = (void *)MEMORY[0x263F827E8];
            [v8 scale];
            v13 = objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v11, 0);
            CGImageRelease(v11);
          }
          else
          {
            v13 = 0;
          }
          CFRelease(v9);

          if (v13)
          {
            v15 = [[DBScreenshotFlasher alloc] initWithWindowScene:self->_windowScene];
            v16 = [MEMORY[0x263F825C8] whiteColor];
            [(DBScreenshotFlasher *)v15 flashColor:v16 withCompletion:0];

            id v17 = v13;
            v18 = (void *)MEMORY[0x263EFF910];
            v14 = (UIImage *)v17;
            v19 = [v18 date];
            [v19 timeIntervalSinceReferenceDate];
            double v21 = v20;

            v22 = [MEMORY[0x263F08850] defaultManager];
            v23 = [v22 temporaryDirectory];
            v24 = NSString;
            v25 = [NSNumber numberWithDouble:v21];
            v26 = [v24 stringWithFormat:@"carplayScreenshot.%@.png", v25];
            v27 = [v23 URLByAppendingPathComponent:v26];

            v28 = UIImagePNGRepresentation(v14);

            if (v28)
            {
              if ([v28 writeToURL:v27 atomically:1]) {
                v29 = v27;
              }
              else {
                v29 = 0;
              }
            }
            else
            {
              v29 = 0;
            }
            id v30 = v29;

            if (v30)
            {
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v58 = 0x3032000000;
              v59 = __Block_byref_object_copy__0;
              v60 = __Block_byref_object_dispose__0;
              id v61 = [MEMORY[0x263EFF980] array];
              v31 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
              uint64_t v51 = MEMORY[0x263EF8330];
              uint64_t v52 = 3221225472;
              v53 = __DBSaveScreenshotToLibrary_block_invoke;
              v54 = &unk_2649B3FD0;
              v32 = v14;
              v55 = v32;
              p_long long buf = &buf;
              v49[0] = MEMORY[0x263EF8330];
              v49[1] = 3221225472;
              v49[2] = __DBSaveScreenshotToLibrary_block_invoke_54;
              v49[3] = &unk_2649B3FF8;
              v49[4] = &buf;
              [v31 performChanges:&v51 completionHandler:v49];

              _Block_object_dispose(&buf, 8);
              [v37 setObject:v30 forKeyedSubscript:v7];
              char v36 = 1;
            }
            else
            {
              v33 = DBLogForCategory(0);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_22D6F0000, v33, OS_LOG_TYPE_INFO, "Unable to save temporary screenshot", (uint8_t *)&buf, 2u);
              }

              v34 = DBLogForCategory(0);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v8;
                _os_log_error_impl(&dword_22D6F0000, v34, OS_LOG_TYPE_ERROR, "Unable to save temporary screenshot for screen %@", (uint8_t *)&buf, 0xCu);
              }
            }
            goto LABEL_30;
          }
        }
        else
        {
        }
        DBLogForCategory(0);
        v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_error_impl(&dword_22D6F0000, &v14->super, OS_LOG_TYPE_ERROR, "Failed to capture a screenshot for screen %@", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        DBLogForCategory(0);
        v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v6;
          _os_log_impl(&dword_22D6F0000, &v14->super, OS_LOG_TYPE_INFO, "Skipping screenshot for screen %@", (uint8_t *)&buf, 0xCu);
        }
      }
LABEL_30:
    }
    uint64_t v44 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  }
  while (v44);

  if (v36) {
    AudioServicesPlaySystemSoundWithCompletion(0x454u, 0);
  }
LABEL_35:
  if (v35) {
    v35[2](v35, v37);
  }
}

- (void).cxx_destruct
{
}

@end