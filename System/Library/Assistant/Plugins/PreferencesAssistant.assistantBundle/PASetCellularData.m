@interface PASetCellularData
- (void)performWithCompletion:(id)a3;
@end

@implementation PASetCellularData

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (+[PSCellularDataSettingsDetail deviceSupportsCellularData])
  {
    id v5 = +[PSCellularDataSettingsDetail isEnabled];
    if ([(PASetCellularData *)self toggle]) {
      id v6 = (id)(v5 ^ 1);
    }
    else {
      id v6 = [(PASetCellularData *)self value];
    }
    unsigned int v9 = [(PASetCellularData *)self dryRun];
    if (v5 == v6)
    {
      id v10 = objc_alloc_init((Class)SACommandFailed);
      [v10 setErrorCode:SASettingValueUnchangedErrorCode];
      [v10 setReason:@"Value unchanged, No change was made"];
    }
    else
    {
      id v10 = 0;
    }
    if (v10) {
      char v11 = 1;
    }
    else {
      char v11 = v9;
    }
    if ((v11 & 1) == 0) {
      +[PSCellularDataSettingsDetail setEnabled:v6];
    }
    v12 = PALogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"Set";
      if (v9) {
        CFStringRef v13 = @"Dry Run";
      }
      *(_DWORD *)v21 = 138413058;
      *(void *)&v21[4] = v13;
      if (v5) {
        CFStringRef v14 = @"ON";
      }
      else {
        CFStringRef v14 = @"OFF";
      }
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v14;
      *(_WORD *)&v21[22] = 2112;
      if (v6) {
        CFStringRef v15 = @"ON";
      }
      else {
        CFStringRef v15 = @"OFF";
      }
      CFStringRef v22 = v15;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "########## PASetCellularData (%@ / prev: %@ / value: %@ / %@)", v21, 0x2Au);
    }

    id v8 = v10;
    if (!v10)
    {
      id v19 = objc_alloc_init((Class)SASettingBooleanEntity);
      [v19 setValue:v6];
      v20 = +[NSNumber numberWithBool:v5];
      [v19 setPreviousValue:v20];

      id v17 = objc_alloc_init((Class)SASettingSetBoolResponse);
      [v17 setSetting:v19];

      v16 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    id v7 = objc_alloc_init((Class)SACommandFailed);
    [v7 setErrorCode:SASettingPropertyUnsupportedByDeviceErrorCode];
    [v7 setReason:@"Device does not support Cellular Data"];
    id v8 = v7;
  }
  v16 = v8;
  id v17 = v8;
LABEL_26:
  v18 = objc_msgSend(v17, "dictionary", *(_OWORD *)v21, *(void *)&v21[16]);
  v4[2](v4, v18);
}

@end