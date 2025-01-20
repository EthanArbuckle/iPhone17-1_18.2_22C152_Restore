@interface ODRAssetPackValidationMaintenanceTask
- (void)main;
@end

@implementation ODRAssetPackValidationMaintenanceTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Executing the Validate On Device Asset Packs Operation.", (uint8_t *)&buf, 2u);
  }

  v4 = [[KeepAlive alloc] initWithName:@"com.apple.appstored.ODRAssetPackValidationMaintenanceOperation"];
  if (self)
  {
    if ([(ODRAssetPackValidationMaintenanceTask *)self isCancelled])
    {
      v5 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ValidateOnDeviceManifestsOperation has been cancelled.", (uint8_t *)&buf, 2u);
      }

      ASDErrorWithTitleAndMessage();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [(Task *)self completeWithError:v6];
    }
    else
    {
      uint64_t v7 = sub_1003F9F04();
      v8 = (void *)v7;
      if (v7) {
        v9 = *(void **)(v7 + 32);
      }
      else {
        v9 = 0;
      }
      id v6 = v9;

      if (v6)
      {
        v10 = +[NSFileManager defaultManager];
        v11 = +[NSURL fileURLWithPath:v6 isDirectory:1];
        id v17 = 0;
        v12 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v17];
        id v13 = v17;
        if (v12)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          v19 = sub_1002CFF90;
          v20 = &unk_100526458;
          v21 = self;
          id v22 = v10;
          sub_1002CFCD8((uint64_t)ODRAssetPackValidationMaintenanceTask, v12, &buf);
          [(Task *)self completeWithSuccess];
        }
        else
        {
          v15 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Correctness checking the on-disk asset packs failed.  Error: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          v16 = ASDErrorWithUnderlyingError();
          [(Task *)self completeWithError:v16];
        }
      }
      else
      {
        v14 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Path for asset packs is unset.", (uint8_t *)&buf, 2u);
        }

        v10 = ASDErrorWithTitleAndMessage();
        [(Task *)self completeWithError:v10];
      }
    }
  }
}

@end