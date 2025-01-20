@interface BluetoothPacketLoggerExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4;
@end

@implementation BluetoothPacketLoggerExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v41 = a3;
  char v68 = 0;
  int v67 = -1;
  sub_100002F44(buf, "HCITraces");
  sub_100002F44(__p, "UnlimitedHCIFileSize");
  getBoolValue((uint64_t *)buf, (uint64_t *)__p, &v68);
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  if (v66 < 0) {
    operator delete(*(void **)buf);
  }
  sub_100002F44(buf, "HCITraces");
  sub_100002F44(__p, "MaxFileSize");
  int IntValue = getIntValue((uint64_t *)buf, (uint64_t *)__p, &v67);
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  if (v66 < 0) {
    operator delete(*(void **)buf);
  }
  v40 = [v41 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if (!v68 || (v67 > 209715200 ? (int v5 = IntValue) : (int v5 = 0), v5 == 1))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ERROR: Extension launch failed. Use extension only when UnlimitedHCIFileSize is enabled or maxFileSize is less than 200MB.", buf, 2u);
    }
    goto LABEL_43;
  }
  if (![v40 isEqualToString:@"com.apple.taptoradard"])
  {
LABEL_43:
    id v49 = &__NSArray0__struct;
    goto LABEL_44;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BluetoothPacketLoggerExtension: DiagnosticExtension for PacketLogger launched.", buf, 2u);
  }
  v37 = +[NSRegularExpression regularExpressionWithPattern:@"bluetoothd-hci.*.pklg" options:1 error:0];
  v38 = +[NSRegularExpression regularExpressionWithPattern:@"bluetoothd-FWCOREDUMP.*.log" options:1 error:0];
  v39 = +[NSRegularExpression regularExpressionWithPattern:@"bluetoothd-UART.*.log" options:1 error:0];
  id v49 = +[NSMutableArray array];
  v6 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/Bluetooth"];
  v7 = [(BluetoothPacketLoggerExtension *)self filesInDir:v6 matchingPattern:v38 excludingPattern:0];
  [v49 addObjectsFromArray:v7];

  v8 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/Bluetooth"];
  v9 = [(BluetoothPacketLoggerExtension *)self filesInDir:v8 matchingPattern:v39 excludingPattern:0];
  [v49 addObjectsFromArray:v9];

  v10 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/Bluetooth"];
  id obja = [(BluetoothPacketLoggerExtension *)self filesInDir:v10 matchingPattern:v37 excludingPattern:0];

  v11 = [(BluetoothPacketLoggerExtension *)self getFilesAtPathSortedByModificationDate:obja numberOfFirstNFiles:2];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v60;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v16 = [v15 filesize];
        BOOL v17 = (unint64_t)[v16 unsignedIntegerValue] < 0xC800001;

        if (v17) {
          [v49 addObject:v15];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v12);
  }

  v18 = +[NSURL fileURLWithPath:@"/Library/Logs/CrashReporter/CoreCapture/BT"];
  v72 = v18;
  v19 = +[NSArray arrayWithObjects:&v72 count:1];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v42 = v19;
  id v44 = [v42 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v56;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v42);
        }
        uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
        v21 = +[NSFileManager defaultManager];
        v70[0] = NSURLNameKey;
        v70[1] = NSURLIsDirectoryKey;
        v22 = +[NSArray arrayWithObjects:v70 count:2];
        v23 = [v21 enumeratorAtURL:v20 includingPropertiesForKeys:v22 options:5 errorHandler:0];

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v48 = v23;
        id v24 = [v48 countByEnumeratingWithState:&v51 objects:v69 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v52;
          do
          {
            for (k = 0; k != v24; k = (char *)k + 1)
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v48);
              }
              v27 = *(void **)(*((void *)&v51 + 1) + 8 * (void)k);
              id v50 = 0;
              [v27 getResourceValue:&v50 forKey:NSURLNameKey error:0];
              id v28 = v50;
              v29 = [v27 lastPathComponent];
              v30 = +[NSFileManager defaultManager];
              v31 = [v27 path];
              v32 = [v30 attributesOfItemAtPath:v31 error:0];

              v33 = [v32 fileModificationDate];
              v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v32 fileSize]);
              v35 = +[DEAttachmentItem attachmentWithPath:v27 withDisplayName:v29 modificationDate:v33 andFilesize:v34];

              [v49 addObject:v35];
            }
            id v24 = [v48 countByEnumeratingWithState:&v51 objects:v69 count:16];
          }
          while (v24);
        }
      }
      id v44 = [v42 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v44);
  }

LABEL_44:
  return v49;
}

- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4
{
  int v5 = [a3 sortedArrayUsingComparator:&stru_1000041D8];
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