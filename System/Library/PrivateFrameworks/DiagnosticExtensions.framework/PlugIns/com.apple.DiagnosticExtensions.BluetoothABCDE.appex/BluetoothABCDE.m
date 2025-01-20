@interface BluetoothABCDE
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4;
@end

@implementation BluetoothABCDE

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if ([v4 isEqualToString:@"com.apple.symptomsd"])
  {
    v53 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BluetoothABCDE: DiagnosticExtension for AutoBugCapture launched.", buf, 2u);
    }
    uint64_t v5 = +[NSRegularExpression regularExpressionWithPattern:@"bluetoothd-hci.*.pklg" options:1 error:0];
    uint64_t v6 = +[NSRegularExpression regularExpressionWithPattern:@"bluetoothd-FWCOREDUMP.*.log" options:1 error:0];
    uint64_t v7 = +[NSRegularExpression regularExpressionWithPattern:@"bluetoothd-UART.*.log" options:1 error:0];
    v8 = +[NSMutableArray array];
    v9 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/Bluetooth"];
    v51 = (void *)v6;
    v10 = [(BluetoothABCDE *)self filesInDir:v9 matchingPattern:v6 excludingPattern:0];
    [v8 addObjectsFromArray:v10];

    v11 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/Bluetooth"];
    v50 = (void *)v7;
    v12 = [(BluetoothABCDE *)self filesInDir:v11 matchingPattern:v7 excludingPattern:0];
    id v59 = v8;
    [v8 addObjectsFromArray:v12];

    v13 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/Bluetooth"];
    v52 = (void *)v5;
    v14 = [(BluetoothABCDE *)self filesInDir:v13 matchingPattern:v5 excludingPattern:0];

    v15 = [(BluetoothABCDE *)self getFilesAtPathSortedByModificationDate:v14 numberOfFirstNFiles:2];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v70;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v22 = [v21 filesize];
          id v23 = [v22 unsignedIntegerValue];

          if ((unint64_t)v23 <= 0x4C5054) {
            [v59 addObject:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v18);
    }
    v49 = v16;

    v24 = +[NSURL fileURLWithPath:@"/Library/Logs/CrashReporter/CoreCapture/BT"];
    v77[0] = v24;
    v25 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/CoreCapture/BT"];
    v77[1] = v25;
    v26 = +[NSURL fileURLWithPath:@"/var/log/CoreCapture/com.apple.driver.AppleMarconiBTDriver"];
    v77[2] = v26;
    v27 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT"];
    v77[3] = v27;
    v28 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT-sysdiagnose"];
    v77[4] = v28;
    v29 = +[NSArray arrayWithObjects:v77 count:5];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v29;
    id v56 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v56)
    {
      uint64_t v55 = *(void *)v66;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v57 = v30;
          uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * v30);
          v32 = +[NSFileManager defaultManager];
          v75[0] = NSURLNameKey;
          v75[1] = NSURLIsDirectoryKey;
          v33 = +[NSArray arrayWithObjects:v75 count:2];
          v34 = [v32 enumeratorAtURL:v31 includingPropertiesForKeys:v33 options:5 errorHandler:0];

          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v58 = v34;
          id v35 = [v58 countByEnumeratingWithState:&v61 objects:v74 count:16];
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = *(void *)v62;
            do
            {
              for (j = 0; j != v36; j = (char *)j + 1)
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v58);
                }
                v39 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
                id v60 = 0;
                [v39 getResourceValue:&v60 forKey:NSURLNameKey error:0];
                id v40 = v60;
                v41 = [v39 lastPathComponent];
                v42 = +[NSFileManager defaultManager];
                v43 = [v39 path];
                v44 = [v42 attributesOfItemAtPath:v43 error:0];

                v45 = [v44 fileModificationDate];
                v46 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v44 fileSize]);
                v47 = +[DEAttachmentItem attachmentWithPath:v39 withDisplayName:v41 modificationDate:v45 andFilesize:v46];

                [v59 addObject:v47];
              }
              id v36 = [v58 countByEnumeratingWithState:&v61 objects:v74 count:16];
            }
            while (v36);
          }

          uint64_t v30 = v57 + 1;
        }
        while ((id)(v57 + 1) != v56);
        id v56 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      }
      while (v56);
    }

    v4 = v53;
  }
  else
  {
    id v59 = &__NSArray0__struct;
  }

  return v59;
}

- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4
{
  uint64_t v5 = [a3 sortedArrayUsingComparator:&stru_100004130];
  id v6 = [v5 count];
  if ((unint64_t)v6 >= a4) {
    id v7 = (id)a4;
  }
  else {
    id v7 = v6;
  }
  if (v7) {
    [v5 subarrayWithRange:0];
  }
  else {
  v8 = +[NSArray array];
  }

  return v8;
}

@end