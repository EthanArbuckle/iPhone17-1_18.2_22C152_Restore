@interface IDSDeviceCertificationRepair
- (BOOL)_missingDeviceIdentity:(BOOL *)a3;
- (IDSDeviceCertificationRepair)init;
- (IDSDeviceCertificationRepairDelegate)delegate;
- (IMDispatchTimer)repairTimer;
- (void)recertifyDeviceIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setRepairTimer:(id)a3;
@end

@implementation IDSDeviceCertificationRepair

- (IDSDeviceCertificationRepair)init
{
  v11.receiver = self;
  v11.super_class = (Class)IDSDeviceCertificationRepair;
  v2 = [(IDSDeviceCertificationRepair *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)IMDispatchTimer);
    v4 = im_primary_queue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100407308;
    v9[3] = &unk_100980598;
    v5 = v2;
    v10 = v5;
    v6 = (IMDispatchTimer *)[v3 initWithQueue:v4 interval:604800 repeats:1 handlerBlock:v9];
    repairTimer = v5->_repairTimer;
    v5->_repairTimer = v6;
  }
  return v2;
}

- (void)recertifyDeviceIfNeeded
{
  id v3 = +[IMSystemMonitor sharedInstance];
  unsigned int v4 = [v3 isUnderFirstDataProtectionLock];

  if (v4)
  {
    v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Under first lock, not re-certifying device";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (+[IDSRegistrationController isBuddyBlockingRegistration])
  {
    v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = 0x402E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device is not setup, trying to re-certify in %f seconds", buf, 0xCu);
    }

    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10040764C;
    v17 = &unk_10097E4D0;
    v18 = self;
LABEL_13:
    im_dispatch_after_primary_queue();
    return;
  }
  unsigned __int8 v13 = 0;
  if (![(IDSDeviceCertificationRepair *)self _missingDeviceIdentity:&v13])
  {
    v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Identity present, not re-certifying";
      goto LABEL_16;
    }
LABEL_17:

    return;
  }
  int v8 = v13;
  v9 = +[IMRGLog warning];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = 0x402E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Keychain upgrade pending, trying again in %f seconds", buf, 0xCu);
    }

    v12[5] = _NSConcreteStackBlock;
    v12[6] = 3221225472;
    v12[7] = sub_100407654;
    v12[8] = &unk_10097E4D0;
    v12[9] = self;
    goto LABEL_13;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Re-certifying device (in background)", buf, 2u);
  }

  objc_super v11 = dispatch_get_global_queue(0, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10040765C;
  v12[3] = &unk_10097E4D0;
  v12[4] = self;
  dispatch_async(v11, v12);
}

- (BOOL)_missingDeviceIdentity:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  *(void *)buf = 0;
  unsigned int v4 = (__SecIdentity *)MAECopyLegacyDeviceIdentityWithError();
  id v5 = 0;
  unsigned int v6 = sub_1004070B8(v5);

  v7 = (__SecIdentity *)[sub_100407E34() copyIdentity];
  int v8 = v7;
  if (v7) {
    int v9 = 0;
  }
  else {
    int v9 = -25300;
  }
  if (v4 && v7)
  {
    CFTypeRef cf = 0;
    SecCertificateRef certificateRef = 0;
    OSStatus v10 = SecIdentityCopyCertificate(v4, &certificateRef);
    OSStatus v11 = SecIdentityCopyCertificate(v8, (SecCertificateRef *)&cf);
    int v12 = v11;
    if (v10 || !certificateRef || v11 || !cf)
    {
      v19 = +[IMRGLog warning];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_1007243A8(v10, v12, v19);
      }
    }
    else
    {
      BOOL v13 = sub_100407C48((uint64_t)cf);
      BOOL v14 = sub_100407C48((uint64_t)certificateRef);
      uint64_t v15 = +[IMRGLog warning];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = @"NO";
        if (v14) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        *(_DWORD *)buf = 134218754;
        if (v13) {
          CFStringRef v16 = @"YES";
        }
        *(void *)&uint8_t buf[4] = certificateRef;
        __int16 v33 = 2112;
        *(void *)v34 = v17;
        *(_WORD *)&v34[8] = 2048;
        *(void *)&v34[10] = cf;
        *(_WORD *)&v34[18] = 2112;
        v35[0] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded identities { lockdownIdentityCert: %p, lockdownCertWillExpire: %@, apsIdentityCert: %p, apsCertWillExpire: %@ }", buf, 0x2Au);
      }

      int v18 = v13 || v14;
      v19 = +[IMRGLog warning];
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18 != 1)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device identity is not expired", buf, 2u);
        }
        BOOL v25 = 0;
        goto LABEL_45;
      }
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "An identity is expired -- deleting identity", buf, 2u);
      }

      sleep(5u);
      *(void *)buf = 0;
      char v21 = MAEDeleteLegacyDeviceIdentityWithError();
      id v22 = *(id *)buf;
      if ((v21 & 1) == 0)
      {
        v23 = +[IMRGLog warning];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_100724330((uint64_t)v22, v23);
        }
      }
      sleep(5u);
      dispatch_time_t v24 = dispatch_time(0, 5000000000);
      v19 = im_primary_queue();
      dispatch_after(v24, v19, &stru_10098CC30);
    }
    BOOL v25 = 1;
LABEL_45:

    if (certificateRef)
    {
      CFRelease(certificateRef);
      SecCertificateRef certificateRef = 0;
    }
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_49;
  }
  if (v6 == -34019)
  {
    if (a3) {
      *a3 = 1;
    }
  }
  else
  {
    if (qword_100A4CA18 != -1) {
      dispatch_once(&qword_100A4CA18, &stru_10098CC50);
    }
    if (!byte_100A4CA10)
    {
      int v26 = MGGetBoolAnswer();
      v27 = +[IMRGLog warning];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        CFStringRef v29 = @"NO";
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v4;
        __int16 v33 = 1024;
        if (v26) {
          CFStringRef v29 = @"YES";
        }
        *(_DWORD *)v34 = v6;
        *(_WORD *)&v34[4] = 2048;
        *(void *)&v34[6] = v8;
        *(_WORD *)&v34[14] = 1024;
        *(_DWORD *)&v34[16] = v9;
        LOWORD(v35[0]) = 2112;
        *(void *)((char *)v35 + 2) = v29;
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Failed to load identities { lockdownIdentity: %p, lockdownResult: %d, apsIdentity: %p, apsResult: %d, shouldHacktivate: %@ }", buf, 0x2Cu);
      }
    }
  }
  BOOL v25 = 1;
  if (v4)
  {
LABEL_49:
    CFRelease(v4);
    if (!v8) {
      return v25;
    }
    goto LABEL_40;
  }
  if (v8) {
LABEL_40:
  }
    CFRelease(v8);
  return v25;
}

- (IDSDeviceCertificationRepairDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSDeviceCertificationRepairDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMDispatchTimer)repairTimer
{
  return self->_repairTimer;
}

- (void)setRepairTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairTimer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end