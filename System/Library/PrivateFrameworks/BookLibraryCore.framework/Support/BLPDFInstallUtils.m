@interface BLPDFInstallUtils
+ (BOOL)decryptFileAtURL:(id)a3 encryptionKey:(id)a4 salt:(id)a5 error:(id *)a6;
@end

@implementation BLPDFInstallUtils

+ (BOOL)decryptFileAtURL:(id)a3 encryptionKey:(id)a4 salt:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    v12 = 0;
  }
  else {
    v12 = @"Missing URL. ";
  }
  if (!v10)
  {
    CFStringRef v16 = @"Missing property k. ";
    goto LABEL_10;
  }
  uint64_t v13 = +[NSData bu_dataFromHexString:v10];
  if (!v13)
  {
    CFStringRef v16 = @"Failed to decode k. ";
LABEL_10:
    v12 = [(__CFString *)v12 stringByAppendingString:v16];
    v14 = 0;
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_11;
  }
  v14 = (void *)v13;
  if (!v11)
  {
LABEL_7:
    CFStringRef v15 = @"Missing property s. ";
LABEL_16:
    uint64_t v21 = [(__CFString *)v12 stringByAppendingString:v15];

    v12 = (__CFString *)v21;
    goto LABEL_17;
  }
LABEL_11:
  id v17 = +[NSData bu_dataFromHexString:v11];
  id v18 = [v17 bytes];

  if (!v18)
  {
    CFStringRef v15 = @"Failed to decode s. ";
    goto LABEL_16;
  }
  if (v9 && v14)
  {
    v19 = -[BLEncryptedBuffer initWithFileAtURL:pageSize:key:options:]([BLEncryptedBuffer alloc], "initWithFileAtURL:pageSize:key:options:", v9, 1008, [v14 bytes], 0);
    [(BLEncryptedBuffer *)v19 setIVProc:sub_100056EAC withContext:v18];
    [(BLEncryptedBuffer *)v19 decrypt];

    v20 = 0;
    goto LABEL_18;
  }
LABEL_17:
  v20 = sub_10004B6AC(0, @"Missing or malformed fields", v12);
LABEL_18:
  v22 = +[NSUserDefaults standardUserDefaults];
  if ([v22 BOOLForKey:@"BKSimulateCrashAtInstallDuringDecrypt"])
  {
    v23 = BLBookInstallLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[PDFInstall-Op]: Simulating a crash during install decrypt", v25, 2u);
    }

    [v22 removeObjectForKey:@"BKSimulateCrashAtInstallDuringDecrypt"];
    [v22 synchronize];
    raise(11);
  }
  if (a6 && v20) {
    *a6 = v20;
  }

  return v20 == 0;
}

@end