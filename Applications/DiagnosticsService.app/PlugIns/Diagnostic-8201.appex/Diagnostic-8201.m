void DeviceCMInterface::DeviceCMInterface(DeviceCMInterface *this)
{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

DeviceCMInterface *DeviceCMInterface::resetMembers(DeviceCMInterface *this)
{
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return this;
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseInterface(DeviceCMInterface *this)
{
  result = this->m_captureDeviceController;
  if (result)
  {
    HxISPCaptureDeviceController::deactivate(result);
    result = this->m_captureDeviceController;
    if (result)
    {
      HxISPCaptureDeviceController::~HxISPCaptureDeviceController(result);
      operator delete();
    }
  }
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return result;
}

void DeviceCMInterface::~DeviceCMInterface(DeviceCMInterface *this)
{
}

void sub_100001C34(void *a1)
{
}

void DeviceCMInterface::initAndActivateCaptureDeviceController(DeviceCMInterface *this)
{
}

void sub_100001D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setSWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 40), a2);
}

uint64_t DeviceCMInterface::setRgbConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x80000000) != 0 || (v3 = *(HxISPCaptureDeviceController **)(a1 + 16)) == 0)
  {
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v13 = [v12 lastPathComponent];
    v14 = +[NSString stringWithFormat:@"error bad streamID of %d ", a2];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 164, v14);

    return 3758097084;
  }
  uint64_t v5 = *(unsigned int *)(a3 + 44);
  if (v5 == -1)
  {
    id v78 = 0;
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, a2, kFigCaptureStreamProperty_SupportedFormatsArray, &v78);
    if (v7)
    {
      id obja = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v15 = [obja lastPathComponent];
      v16 = DeviceCMInterface::getErrorInformationString(v7);
      v17 = +[NSString stringWithFormat:@"error %d failed to get sw stream supported formats %@", v7, v16];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 175, v17);

      return (uint64_t)v7;
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id obj = v78;
    id v31 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v31)
    {
      int v32 = -1;
      uint64_t v72 = *(void *)v75;
      while (2)
      {
        v33 = 0;
        int v67 = v32 + v31;
        int v68 = v32;
        do
        {
          if (*(void *)v75 != v72) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v33);
          v35 = [v34 valueForKey:@"VideoIsBinned"];
          unsigned int v36 = [v35 BOOLValue];

          v37 = [v34 valueForKey:@"SensorWidth"];
          unsigned int v38 = [v37 integerValue];

          v39 = [v34 valueForKey:@"SensorHeight"];
          unsigned int v40 = [v39 integerValue];

          v41 = [v34 valueForKey:@"SupportedOutputs"];
          v42 = [v41 valueForKey:@"PrimaryScaler"];
          v43 = [v42 valueForKey:@"DefaultCropRect"];
          v44 = [v43 valueForKey:@"X"];
          [v44 floatValue];
          float v46 = v45;

          v47 = [v43 valueForKey:@"Y"];
          [v47 floatValue];
          float v49 = v48;

          v50 = [v43 valueForKey:@"Width"];
          [v50 floatValue];
          float v52 = v51;

          v53 = [v43 valueForKey:@"Height"];
          [v53 floatValue];
          float v55 = v54;

          BOOL v58 = *(unsigned __int8 *)(a3 + 40) != v36 || *(_DWORD *)a3 != v38 || *(_DWORD *)(a3 + 4) != v40;
          if (*(double *)(a3 + 8) != v46) {
            BOOL v58 = 1;
          }
          if (*(double *)(a3 + 16) != v49) {
            BOOL v58 = 1;
          }
          if (*(double *)(a3 + 24) != v52) {
            BOOL v58 = 1;
          }
          char v59 = *(double *)(a3 + 32) != v55 || v58;

          if ((v59 & 1) == 0)
          {
            uint64_t v5 = (v68 + v33 + 1);
            goto LABEL_47;
          }
          v33 = (char *)v33 + 1;
        }
        while (v31 != v33);
        id v31 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
        int v32 = v67;
        if (v31) {
          continue;
        }
        break;
      }
      uint64_t v5 = 0xFFFFFFFFLL;
LABEL_47:

      if (v5 != -1)
      {
        v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
        goto LABEL_4;
      }
    }
    else
    {
    }
    v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v61 = [v60 lastPathComponent];
    v62 = DeviceCMInterface::getErrorInformationString(0);
    v63 = +[NSString stringWithFormat:@"error %d failed to find cam required format, %@", 0, v62];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v61, 216, v63);

    return 0;
  }
LABEL_4:
  v6 = +[NSNumber numberWithInt:v5];
  v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v3, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)v6);
  if (!v7)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    if (*(_DWORD *)(a3 + 52))
    {
      v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v18 setValue:v19 forKey:kFigCaptureStreamVideoOutputConfigurationKey_Height];
    }
    if (*(_DWORD *)(a3 + 48))
    {
      v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v18 setValue:v20 forKey:kFigCaptureStreamVideoOutputConfigurationKey_Width];
    }
    double v21 = *(double *)(a3 + 80);
    if (v21 != 0.0)
    {
      uint64_t v22 = *(void *)(a3 + 56);
      uint64_t v23 = *(void *)(a3 + 64);
      uint64_t v24 = *(void *)(a3 + 72);
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v21 - 3));
      [v18 setValue:DictionaryRepresentation forKey:kFigCaptureStreamVideoOutputConfigurationKey_CropRect];
    }
    if ([v18 count])
    {
      uint64_t v79 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
      id v80 = v18;
      CFBooleanRef v26 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_VideoOutputConfigurations, v26);
      if (v7)
      {
        v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v28 = [v27 lastPathComponent];
        v29 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = +[NSString stringWithFormat:@"error %d failed to video configuration, %@", v7, v29];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 243, v30);
        goto LABEL_18;
      }
    }
    if (*(_DWORD *)(a3 + 100))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_ContinuousAutoFocusNow, 0);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set auto focus, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 251, v29);
        goto LABEL_66;
      }
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_AutoFocusPositionSensorMode, (const __CFBoolean *)&off_100034678);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set auto focus pos, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 257, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 92))
    {
      v64 = *(HxISPCaptureDeviceController **)(a1 + 16);
      v65 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v64, a2, kFigCaptureStreamProperty_MaxIntegrationTime, (const __CFBoolean *)v65);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set max integrtion time, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 265, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 104))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_UnlockAENow, (const __CFBoolean *)&__kCFBooleanTrue);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set unlock auto expsosure now, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 274, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 96))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_SphereMode, kFigCaptureStreamSphereMode_Lock);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set SphereMode, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 283, v29);
        goto LABEL_66;
      }
    }
    if (!*(_DWORD *)(a3 + 88))
    {
      v7 = 0;
      goto LABEL_68;
    }
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    CFBooleanRef v26 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_MaximumFrameRate, v26);
    if (!v7)
    {
LABEL_67:

LABEL_68:
      return (uint64_t)v7;
    }
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v28 = [v27 lastPathComponent];
    v29 = DeviceCMInterface::getErrorInformationString(v7);
    v30 = +[NSString stringWithFormat:@"error %d failed to set auto focus, %@", v7, v29];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 292, v30);
LABEL_18:

LABEL_66:
    goto LABEL_67;
  }
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  v9 = [v8 lastPathComponent];
  v10 = DeviceCMInterface::getErrorInformationString(v7);
  v11 = +[NSString stringWithFormat:@"error %d failed to set sw format index, %@", v7, v10];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 222, v11);

  return (uint64_t)v7;
}

void sub_100002970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 28), a2);
}

uint64_t DeviceCMInterface::setFrontConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 32), a2);
}

const __CFString *DeviceCMInterface::getErrorInformationString(DeviceCMInterface *this)
{
  if ((int)this > -12789)
  {
    switch(this)
    {
      case 0xFFFFCE0C:
        CFStringRef result = @"base object error unsupported protocol";
        break;
      case 0xFFFFCE0D:
        CFStringRef result = @"base object error property not supported";
        break;
      case 0xFFFFCE0E:
        CFStringRef result = @"base object error allocation failed";
        break;
      case 0xFFFFCE0F:
        CFStringRef result = @"base object error invalidated";
        break;
      case 0xFFFFCE10:
        CFStringRef result = @"base object error property not found";
        break;
      case 0xFFFFCE11:
        CFStringRef result = @"base object error value not available";
        break;
      case 0xFFFFCE12:
        CFStringRef result = @"base object error unsupported operation";
        break;
      case 0xFFFFCE13:
        CFStringRef result = @"base object error unsupported version";
        break;
      case 0xFFFFCE14:
        CFStringRef result = @"base object error parameter error";
        break;
      default:
        if (this) {
LABEL_10:
        }
          CFStringRef result = @"Unknown error information";
        else {
          CFStringRef result = @"OK";
        }
        break;
    }
  }
  else
  {
    switch(this)
    {
      case 0xE00002BC:
        CFStringRef result = @"general error";
        break;
      case 0xE00002BD:
        CFStringRef result = @"can't allocate memory";
        break;
      case 0xE00002BE:
        CFStringRef result = @"resource shortage";
        break;
      case 0xE00002BF:
        CFStringRef result = @"error during IPC";
        break;
      case 0xE00002C0:
        CFStringRef result = @"no such device";
        break;
      case 0xE00002C1:
        CFStringRef result = @"privilege violation";
        break;
      case 0xE00002C2:
        CFStringRef result = @"invalid argument";
        break;
      case 0xE00002C3:
        CFStringRef result = @"device read locked";
        break;
      case 0xE00002C4:
        CFStringRef result = @"device write locked";
        break;
      case 0xE00002C5:
        CFStringRef result = @"exclusive access and";
        break;
      case 0xE00002C6:
        CFStringRef result = @"sent/received messages";
        break;
      case 0xE00002C7:
        CFStringRef result = @"unsupported function";
        break;
      case 0xE00002C8:
        CFStringRef result = @"misc. VM failure";
        break;
      case 0xE00002C9:
        CFStringRef result = @"internal error";
        break;
      case 0xE00002CA:
        CFStringRef result = @"General I/O error";
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_10;
      case 0xE00002CC:
        CFStringRef result = @"can't acquire lock";
        break;
      case 0xE00002CD:
        CFStringRef result = @"device not open";
        break;
      case 0xE00002CE:
        CFStringRef result = @"read not supported";
        break;
      case 0xE00002CF:
        CFStringRef result = @"write not supported";
        break;
      case 0xE00002D0:
        CFStringRef result = @"alignment error";
        break;
      case 0xE00002D1:
        CFStringRef result = @"Media Error";
        break;
      case 0xE00002D2:
        CFStringRef result = @"device(s) still open";
        break;
      case 0xE00002D3:
        CFStringRef result = @"rld failure";
        break;
      case 0xE00002D4:
        CFStringRef result = @"DMA failure";
        break;
      case 0xE00002D5:
        CFStringRef result = @"Device Busy";
        break;
      case 0xE00002D6:
        CFStringRef result = @"I/O Timeout";
        break;
      case 0xE00002D7:
        CFStringRef result = @"device offline";
        break;
      case 0xE00002D8:
        CFStringRef result = @"not ready";
        break;
      case 0xE00002D9:
        CFStringRef result = @"device not attached";
        break;
      case 0xE00002DA:
        CFStringRef result = @"no DMA channels left";
        break;
      case 0xE00002DB:
        CFStringRef result = @"no space for data";
        break;
      case 0xE00002DD:
        CFStringRef result = @"port already exists";
        break;
      case 0xE00002DE:
        CFStringRef result = @"can't wire down";
        break;
      case 0xE00002DF:
        CFStringRef result = @"no interrupt attached";
        break;
      case 0xE00002E0:
        CFStringRef result = @"no DMA frames enqueued";
        break;
      case 0xE00002E1:
        CFStringRef result = @"oversized msg received";
        break;
      case 0xE00002E2:
        CFStringRef result = @"not permitted";
        break;
      case 0xE00002E3:
        CFStringRef result = @"no power to device";
        break;
      case 0xE00002E4:
        CFStringRef result = @"media not present";
        break;
      case 0xE00002E5:
        CFStringRef result = @"media not formatted";
        break;
      case 0xE00002E6:
        CFStringRef result = @"no such mode";
        break;
      case 0xE00002E7:
        CFStringRef result = @"data underrun";
        break;
      case 0xE00002E8:
        CFStringRef result = @"data overrun";
        break;
      case 0xE00002E9:
        CFStringRef result = @"the device is not working properly!";
        break;
      case 0xE00002EA:
        CFStringRef result = @"a completion routine is required";
        break;
      case 0xE00002EB:
        CFStringRef result = @"operation aborted";
        break;
      case 0xE00002EC:
        CFStringRef result = @"bus bandwidth would be exceeded";
        break;
      case 0xE00002ED:
        CFStringRef result = @"device not responding";
        break;
      case 0xE00002EE:
        CFStringRef result = @"isochronous I/O request for distant past!";
        break;
      case 0xE00002EF:
        CFStringRef result = @"isochronous I/O request for distant future";
        break;
      case 0xE00002F0:
        CFStringRef result = @"data was not found";
        break;
      default:
        if (this != -536870911) {
          goto LABEL_10;
        }
        CFStringRef result = @"should never be seen";
        break;
    }
  }
  return result;
}

DeviceCMInterface *DeviceCMInterface::enableJasperRgbVideo(DeviceCMInterface *this)
{
  if (this->m_currentJasperConfiguration.isWideOn)
  {
    uint64_t v2 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbWideStreamId);
    if (v2)
    {
      v3 = (DeviceCMInterface *)v2;
      v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      v6 = DeviceCMInterface::getErrorInformationString(v3);
      v7 = +[NSString stringWithFormat:@"enable wide stream failed with %d, %@", v3, v6];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 306, v7);
LABEL_7:

LABEL_10:
      return v3;
    }
  }
  if (this->m_currentJasperConfiguration.isSuperWideOn)
  {
    uint64_t v8 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
    if (v8)
    {
      v3 = (DeviceCMInterface *)v8;
      v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      v6 = DeviceCMInterface::getErrorInformationString(v3);
      v7 = +[NSString stringWithFormat:@"enable wide stream failed with %d, %@", v3, v6];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 315, v7);
      goto LABEL_7;
    }
  }
  v3 = (DeviceCMInterface *)DeviceCMInterface::enableJasperPointCloudOutput(this);
  if (v3)
  {
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v5 = [v4 lastPathComponent];
    v6 = +[NSString stringWithFormat:@"failed to enable outputs"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 323, v6);
    goto LABEL_10;
  }
  return v3;
}

void sub_1000032A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableRGBOutputForStreamId(DeviceCMInterface *this, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || !this->m_captureDeviceController)
  {
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    v9 = +[NSString stringWithFormat:@"enableRGBOutputForStreamId failed, stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 885, v9);
    uint64_t v6 = 3758097129;

    return v6;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0;
  }
  uint64_t v5 = Mutable;
  CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PrimaryScaler, kCFBooleanTrue);
  if (!HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_VideoOutputsEnabled, v5))
  {
    CFRelease(v5);
    return 0;
  }
  return 3758097129;
}

void sub_100003428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableJasperPointCloudOutput(DeviceCMInterface *this)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFBooleanRef v3 = Mutable;
    CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PointCloud, kCFBooleanTrue);
    uint64_t v4 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v3);
    if (v4)
    {
      uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v6 = [v5 lastPathComponent];
      v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
      uint64_t v8 = +[NSString stringWithFormat:@"enableJasperOutput failed with OSStatus 0x%x, %@", v4, v7];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 945, v8);

      return 3758097129;
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v10 = [v9 lastPathComponent];
    v11 = +[NSString stringWithFormat:@"fail to create output enable dictionary for pointcloud output"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 954, v11);
    uint64_t v4 = 3758097084;
  }
  return v4;
}

void sub_100003610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::configJasperRgbMultiStream(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  uint64_t v2 = 3758097126;
  if (!a2->isSyncModeOn && a2->isJasperOn)
  {
    if (this->m_streamIdsInfo.jasperStreamId == -1)
    {
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v16 = [v15 lastPathComponent];
      v17 = +[NSString stringWithFormat:@"no jasper id detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 339, v17);

      return 3758097088;
    }
    int bitMaskID = a2->bitMaskID;
    if (bitMaskID == 16 || bitMaskID == 8)
    {
      uint64_t v35 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      unsigned int v36 = &off_100034690;
      CFBooleanRef v8 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v8);
      if (v9)
      {
        v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v11 = [v10 lastPathComponent];
        uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
        v13 = DeviceCMInterface::getErrorInformationString(v9);
        v14 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v9, jasperStreamId, v13];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 356, v14);

LABEL_13:
        uint64_t v2 = (uint64_t)v9;
LABEL_14:

        return v2;
      }
      this->m_isJasperConfigured = 1;
      this->m_currentJasperConfiguration.isJasperOn = 1;
      BOOL isWideOn = a2->isWideOn;
      if (!a2->isSuperWideOn && !a2->isWideOn) {
        goto LABEL_14;
      }
      if (a2->isSuperWideOn)
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
        if (v9)
        {
          v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          v11 = [v10 lastPathComponent];
          v20 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb sw failed"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 369, v20);

          goto LABEL_13;
        }
        BOOL isWideOn = a2->isWideOn;
      }
      if (isWideOn
        && (v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1), v9))
      {
        v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v11 = [v10 lastPathComponent];
        double v21 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb w failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 378, v21);
      }
      else
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
        if (v9)
        {
          v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          v11 = [v10 lastPathComponent];
          uint64_t v22 = +[NSString stringWithFormat:@"faile to enable jasper multi output mode"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 387, v22);
        }
        else
        {
          uint64_t v23 = (char *)this->m_captureDeviceController + 16;
          uint64_t v24 = *(void *)&v23[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
          uint64_t v25 = *(void *)&v23[8 * this->m_streamIdsInfo.rgbWideStreamId];
          uint64_t v26 = *(void *)&v23[8 * this->m_streamIdsInfo.jasperStreamId];
          id v27 = objc_alloc_init((Class)NSMutableArray);
          v11 = v27;
          if (a2->isWideOn) {
            [v27 addObject:v25];
          }
          if (a2->isSuperWideOn) {
            [v11 addObject:v24];
          }
          if (a2->isJasperOn) {
            [v11 addObject:v26];
          }
          uint64_t v33 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
          v34 = v11;
          v10 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v10);
          if (v9)
          {
            v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
            v29 = [v28 lastPathComponent];
            uint64_t v30 = this->m_streamIdsInfo.jasperStreamId;
            id v31 = DeviceCMInterface::getErrorInformationString(v9);
            int v32 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v9, v30, v31];
            NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v29, 408, v32);
          }
          else
          {
            this->m_currentJasperConfiguration = *a2;
          }
        }
      }
      goto LABEL_13;
    }
  }
  return v2;
}

void sub_100003B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setJasperRGBSuperWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperRGBWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 774, v10);
    uint64_t v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.jasperStreamId != a2
    && this->m_streamIdsInfo.rgbSuperWideStreamId != a2
    && this->m_streamIdsInfo.rgbWideStreamId != a2)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:@"stream id %d is invalid (should be %d or %d or %d for jasper)", a2, this->m_streamIdsInfo.jasperStreamId, this->m_streamIdsInfo.rgbSuperWideStreamId, this->m_streamIdsInfo.rgbWideStreamId];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 780, v10);
    uint64_t v7 = 3758097090;
    goto LABEL_10;
  }
  uint64_t v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3) {
    uint64_t v6 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if (v7)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v9 = [v8 lastPathComponent];
    v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)", v7, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 790, v11);

    uint64_t v7 = 3758097129;
LABEL_10:
  }
  return v7;
}

void sub_100003EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentJasperConfiguration(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  this->m_currentJasperConfiguration = *a2;
  return this;
}

uint64_t DeviceCMInterface::configJasperDevice(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  *(_WORD *)&this->m_isJasperSuperWideConfigured = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  this->m_currentJasperConfiguration.int bitMaskID = 0;
  unsigned int jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v13 = [v12 lastPathComponent];
    v14 = +[NSString stringWithFormat:@"no jasper id detected"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 424, v14);

    return 3758097088;
  }
  if (a2->isJasperOn)
  {
    CFArrayRef theArray = 0;
    uint64_t v5 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, jasperStreamId, kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes, &theArray);
    CFArrayRef v6 = theArray;
    CFArrayRef theArray = 0;
    if (v5)
    {
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFBooleanRef v8 = [v7 lastPathComponent];
      uint64_t v9 = this->m_streamIdsInfo.jasperStreamId;
      v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v11 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes failed with OSStatus 0x%x for stream id %d (%@)", v5, v9, v10];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 441, v11);

      return v5;
    }
    unsigned int v15 = [(__CFArray *)v6 containsObject:&off_1000346A8];
    unsigned int v16 = [(__CFArray *)v6 containsObject:&off_100034690];
    if (v15)
    {
      uint64_t v76 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      long long v77 = &off_1000346A8;
      CFBooleanRef v17 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v19 = [v18 lastPathComponent];
      v20 = +[NSString stringWithFormat:@"NormalShortHybridMode detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 456, v20);
    }
    else
    {
      if (!v16)
      {
        id v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v22 = [v27 lastPathComponent];
        uint64_t v23 = +[NSString stringWithFormat:@"cannot resolve projector mode"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v22, 467, v23);
        uint64_t v5 = 3758097084;
        goto LABEL_37;
      }
      uint64_t v74 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      long long v75 = &off_100034690;
      CFBooleanRef v17 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v19 = [v18 lastPathComponent];
      v20 = +[NSString stringWithFormat:@"NormalMode detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 463, v20);
    }
    CFBooleanRef v21 = v17;

    uint64_t v5 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v17);
    if (v5)
    {
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = this->m_streamIdsInfo.jasperStreamId;
      uint64_t v25 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      uint64_t v26 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v5, v24, v25];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 474, v26);

      id v27 = v21;
LABEL_37:

      return v5;
    }
    this->m_isJasperConfigured = 1;
    this->m_currentJasperConfiguration.isJasperOn = 1;
  }
  if (a2->isSuperWideOn)
  {
    uint64_t rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
    if (rgbSuperWideStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      uint64_t rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
      if (rgbSuperWideStreamId == -1)
      {
        float v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        float v46 = [v45 lastPathComponent];
        v47 = +[NSString stringWithFormat:@"no available RGB super wide stream index"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v46, 485, v47);

        return 3758097136;
      }
    }
    uint64_t v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, rgbSuperWideStreamId, 1);
    if (v5)
    {
      v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v30 = [v29 lastPathComponent];
      id v31 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v30, 493, v31);

      return v5;
    }
    this->m_isJasperSuperWideConfigured = 1;
    if (a2->isJasperOn && a2->isSuperWideOn)
    {
      m_captureDeviceController = this->m_captureDeviceController;
      if (a2->isSyncModeOn)
      {
        if (*((_DWORD *)m_captureDeviceController + 536))
        {
          uint64_t v33 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
          uint64_t v34 = 260;
          do
          {
            CFArrayRef theArray = 0;
            uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
            uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
            uint64_t v37 = v36 ? v36 : 0;
            unsigned int v38 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v37 + 48);
            if (!v38 || v38(FigBaseObject, v33, kCFAllocatorDefault, &theArray)) {
              break;
            }
            CFArrayRef v39 = theArray;
            v78.length = CFArrayGetCount(theArray);
            v78.location = 0;
            if (CFArrayContainsValue(v39, v78, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.jasperStreamId + 2))&& (CFArrayRef v40 = theArray, v79.length = CFArrayGetCount(theArray), v79.location = 0, CFArrayContainsValue(v40, v79, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbSuperWideStreamId + 2))))
            {
              uint64_t v41 = *((void *)this->m_captureDeviceController + v34);
            }
            else
            {
              uint64_t v41 = 0;
            }
            CFRelease(theArray);
            if (v41) {
              goto LABEL_35;
            }
            unint64_t v42 = v34 - 259;
            ++v34;
          }
          while (v42 < *((unsigned int *)this->m_captureDeviceController + 536));
        }
        uint64_t v41 = 0;
LABEL_35:
        uint64_t v71 = v41;
        uint64_t v72 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
        v43 = +[NSArray arrayWithObjects:&v71 count:1];
        v73 = v43;
        uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      }
      else
      {
        float v48 = (char *)m_captureDeviceController + 16;
        uint64_t v49 = *(void *)&v48[8 * this->m_streamIdsInfo.jasperStreamId];
        v68[1] = *(void *)&v48[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
        uint64_t v69 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
        v68[0] = v49;
        v43 = +[NSArray arrayWithObjects:v68 count:2];
        v70 = v43;
        uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      }
      v50 = (void *)v44;

      float v51 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v50);
      if (v51)
      {
        float v52 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v53 = [v52 lastPathComponent];
        uint64_t v54 = this->m_streamIdsInfo.jasperStreamId;
        float v55 = DeviceCMInterface::getErrorInformationString(v51);
        v56 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v51, v54, v55];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v53, 542, v56);
      }
      uint64_t v5 = DeviceCMInterface::enableSWRGBOutput(this);
      if (v5)
      {
        v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        BOOL v58 = [v57 lastPathComponent];
        char v59 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v58, 549, v59);

        return v5;
      }
    }
  }
  uint64_t v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
  if (v5)
  {
    v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v61 = [v60 lastPathComponent];
    v62 = +[NSString stringWithFormat:@"faile to enable jasper multi output mode"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v61, 560, v62);
  }
  else
  {
    uint64_t v5 = DeviceCMInterface::enableJasperPointCloudOutput(this);
    if (v5)
    {
      v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v64 = [v63 lastPathComponent];
      v65 = +[NSString stringWithFormat:@"failed to enable outputs"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v64, 568, v65);
    }
    else
    {
      this->m_currentJasperConfiguration = *a2;
    }
  }
  return v5;
}

void sub_10000498C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isJasperSuperWideExist(DeviceCMInterface *this)
{
  int rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  if (rgbSuperWideStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  }
  return rgbSuperWideStreamId != -1;
}

uint64_t DeviceCMInterface::enableSWRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
  if (v1)
  {
    uint64_t v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"enableRGBOutput failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 926, v4);
  }
  return v1;
}

void sub_100004C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::requestControlOfStreams(DeviceCMInterface *this, int a2, useconds_t a3)
{
  if (this->m_captureDeviceController)
  {
    if (a2)
    {
      uint64_t v30 = kFigCaptureDeviceRequestControlOfStreamsOptionsKey_ClientPriority;
      id v31 = &off_1000346A8;
      uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFArrayRef v6 = [v5 lastPathComponent];
      uint64_t v7 = +[NSString stringWithFormat:@"request control on high priority"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 592, v7);

      v29 = (__CFDictionary *)v4;
    }
    else
    {
      v29 = 0;
    }
    uint64_t v12 = 1;
    while (1)
    {
      uint64_t v13 = HxISPCaptureDeviceController::RequestStreams(this->m_captureDeviceController, *((const __CFArray **)this->m_captureDeviceController + 1), v29);
      v14 = (DeviceCMInterface *)v13;
      if (v13 != -12681) {
        break;
      }
      unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      unsigned int v16 = [v15 lastPathComponent];
      CFBooleanRef v17 = +[NSString stringWithFormat:@"requestControlOfStreamscontrol - controlled by another client. %d/%d", v12, 10];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 600, v17);

      usleep(0x7A120u);
      uint64_t v12 = (v12 + 1);
      if (v12 == 11) {
        goto LABEL_17;
      }
    }
    if (v13 != -12782 && v13 != 0)
    {
LABEL_17:
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = DeviceCMInterface::getErrorInformationString(v14);
      uint64_t v25 = +[NSString stringWithFormat:@"requestControlOfStreamscontrol failed, OSStatus error 0x%x, %@", v14, v24];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 614, v25);

      uint64_t v11 = 3758097129;
      goto LABEL_18;
    }
    if (a2)
    {
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v20 = [v19 lastPathComponent];
      CFBooleanRef v21 = +[NSString stringWithFormat:@"waiting for preempted client to terminate for %.2f sec...", (double)a3 / 1000000.0];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v20, 621, v21);

      usleep(a3);
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = +[NSString stringWithFormat:@"done waiting"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 623, v24);
      uint64_t v11 = 0;
LABEL_18:

      goto LABEL_20;
    }
    uint64_t v11 = 0;
LABEL_20:
  }
  else
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 584, v10);
    uint64_t v11 = 3758097084;
  }
  return v11;
}

void sub_100005104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::releaseControlOfStreams(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFBooleanRef v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 635, v5);
    uint64_t v2 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v2 = HxISPCaptureDeviceController::RelinquishStreams(m_captureDeviceController, *((const __CFArray **)m_captureDeviceController + 1));
  if (v2)
  {
    CFBooleanRef v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v2);
    CFArrayRef v6 = +[NSString stringWithFormat:@"fail during releaseControlOfStreams, OSStatus error 0x%x (%@)", v2, v5];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 642, v6);

LABEL_5:
  }
  return v2;
}

void sub_100005348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enumerateStreamsIndices(DeviceCMInterface *this)
{
  unsigned int v2 = 0;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.int rgbSuperWideStreamId = -1;
  p_m_streamIdsInfo = &this->m_streamIdsInfo;
  CFStringRef v3 = (const __CFString *)kFigCaptureStreamProperty_PortType;
  CFStringRef v4 = (const __CFString *)kFigCapturePortType_FrontFacingInfraredCamera;
  CFStringRef v5 = (const __CFString *)kFigCapturePortType_FrontFacingCamera;
  CFStringRef v6 = (const __CFString *)kFigCapturePortType_FrontFacingSuperWideCamera;
  CFStringRef v7 = (const __CFString *)kFigCapturePortType_BackFacingSuperWideCamera;
  CFStringRef v8 = (const __CFString *)kFigCapturePortType_BackFacingCamera;
  CFStringRef v9 = (const __CFString *)kFigCapturePortType_BackFacingTelephotoCamera;
  CFStringRef v10 = (const __CFString *)kFigCapturePortType_BackFacingSparseTimeOfFlightCamera;
  do
  {
    CFStringRef theString1 = 0;
    if (HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, v2, v3, &theString1))BOOL v11 = 1; {
    else
    }
      BOOL v11 = theString1 == 0;
    if (!v11)
    {
      if (CFEqual(theString1, v4)) {
        this->m_streamIdsInfo.irPearlStreamId = v2;
      }
      if (CFEqual(theString1, v5)
        || CFEqual(theString1, v6))
      {
        this->m_streamIdsInfo.rgbPearlStreamId = v2;
      }
      if (CFEqual(theString1, v7)) {
        this->m_streamIdsInfo.int rgbSuperWideStreamId = v2;
      }
      if (CFEqual(theString1, v8)) {
        this->m_streamIdsInfo.rgbWideStreamId = v2;
      }
      if (CFEqual(theString1, v9)) {
        p_m_streamIdsInfo->rgbTeleStreamId = v2;
      }
      if (CFEqual(theString1, v10)) {
        this->m_streamIdsInfo.unsigned int jasperStreamId = v2;
      }
      CFRelease(theString1);
    }
    ++v2;
  }
  while (v2 != 8);
  if (!this->m_captureDeviceController || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v14 = [v13 lastPathComponent];
    unsigned int v15 = +[NSString stringWithFormat:@"IR Stream id not found"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 703, v15);
    uint64_t v12 = 3758097084;
LABEL_26:

    return v12;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId < 0)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v14 = [v13 lastPathComponent];
    unsigned int v15 = +[NSString stringWithFormat:@"RGB Stream id not found"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 709, v15);
    uint64_t v12 = 0;
    goto LABEL_26;
  }
  return 0;
}

void sub_100005628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isActivated(DeviceCMInterface *this)
{
  return this->m_captureDeviceController != 0;
}

uint64_t DeviceCMInterface::setPearlIRMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.irPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setPearlMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 802, v10);
    uint64_t v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId != a2 && this->m_streamIdsInfo.irPearlStreamId != a2)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = +[NSString stringWithFormat:@"stream id %d is invalid (should be %d for rgb or %d for ir)", a2, this->m_streamIdsInfo.rgbPearlStreamId, this->m_streamIdsInfo.irPearlStreamId];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 808, v10);
    uint64_t v7 = 3758097090;
    goto LABEL_10;
  }
  CFStringRef v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3) {
    CFStringRef v6 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if (v7)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    BOOL v11 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)", v7, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 819, v11);

    uint64_t v7 = 3758097129;
LABEL_10:
  }
  return v7;
}

void sub_100005890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isPearlIrExist(DeviceCMInterface *this)
{
  int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if (irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  }
  return irPearlStreamId != -1;
}

BOOL DeviceCMInterface::isPearlRgbExist(DeviceCMInterface *this)
{
  int rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  if (rgbPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  }
  return rgbPearlStreamId != -1;
}

BOOL DeviceCMInterface::isJasperExist(DeviceCMInterface *this)
{
  int jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  }
  return jasperStreamId != -1;
}

uint64_t DeviceCMInterface::setPearlRGBMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setStreamProperty(DeviceCMInterface *this, uint64_t a2, const __CFString *a3, NSDictionary *a4)
{
  uint64_t v7 = a4;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController)
  {
    CFStringRef v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, a3, (const __CFBoolean *)v7);
    if (!v9)
    {
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    CFStringRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = DeviceCMInterface::getErrorInformationString(v9);
    uint64_t v13 = +[NSString stringWithFormat:@"SetStreamProperty %@ for stream id %d failed with OSStatus 0x%x (%@)", a3, a2, v9, v12];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 839, v13);

    uint64_t v14 = 3758097129;
  }
  else
  {
    CFStringRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 831, v12);
    uint64_t v14 = 3758097084;
  }

LABEL_7:
  return v14;
}

void sub_100005B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlIROutput(DeviceCMInterface *this)
{
  unsigned int v2 = (const void *)kFigCaptureStreamVideoOutputID_PrimaryScaler;
  uint64_t v16 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  uint64_t v14 = kFigCaptureStreamVideoOutputConfigurationKey_AttachRaw;
  unsigned int v15 = &__kCFBooleanTrue;
  CFStringRef v3 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  CFBooleanRef v17 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  uint64_t v5 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputConfigurations, v4);
  if (!v5)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFBooleanRef v10 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
      BOOL v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v10);
      if (v11)
      {
        CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v7 = [v6 lastPathComponent];
        CFStringRef v8 = DeviceCMInterface::getErrorInformationString(v11);
        uint64_t v12 = +[NSString stringWithFormat:@"enableIROutput failed with OSStatus 0x%x (%@)", v11, v8];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 870, v12);

        uint64_t v5 = 3758097129;
        goto LABEL_3;
      }
      CFRelease(v10);
    }
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v7 = [v6 lastPathComponent];
  CFStringRef v8 = +[NSString stringWithFormat:@"Configure the primary output failed"];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 855, v8);
LABEL_3:

LABEL_9:
  return v5;
}

void sub_100005DD4(_Unwind_Exception *a1)
{
  CFStringRef v6 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId);
  if (v1)
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v3 = [v2 lastPathComponent];
    CFStringRef v4 = +[NSString stringWithFormat:@"enableRGBOutput failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 914, v4);
  }
  return v1;
}

void sub_100005F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIrCofiguration(DeviceCMInterface *this, int a2)
{
  switch(a2)
  {
    case 0:
      CFStringRef v24 = @"EnableIRProjector";
      uint64_t v25 = &__kCFBooleanFalse;
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"None"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 972, v6);
      goto LABEL_10;
    case 1:
      v22[0] = @"EnableIRProjector";
      v22[1] = @"ProjectorType";
      v23[0] = &__kCFBooleanTrue;
      v23[1] = @"Flood";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Flood"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 981, v6);
      goto LABEL_10;
    case 2:
      v20[0] = @"EnableIRProjector";
      v20[1] = @"ProjectorType";
      v21[0] = &__kCFBooleanTrue;
      v21[1] = @"SparseLowPower";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"SparseLowPower"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 989, v6);
      goto LABEL_10;
    case 3:
      v18[0] = @"EnableIRProjector";
      v18[1] = @"ProjectorType";
      v19[0] = &__kCFBooleanTrue;
      v19[1] = @"Sparse";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Sparse"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 997, v6);
      goto LABEL_10;
    case 4:
      v14[0] = @"EnableIRProjector";
      v14[1] = @"ProjectorType";
      v15[0] = &__kCFBooleanTrue;
      v15[1] = @"Dense";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Dense"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1014, v6);
      goto LABEL_10;
    case 5:
      v16[0] = @"EnableIRProjector";
      v16[1] = @"ProjectorType";
      v17[0] = &__kCFBooleanTrue;
      v17[1] = @"DenseProbeAB";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"DenseProbeAB"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1005, v6);
      goto LABEL_10;
    case 6:
      v12[0] = @"EnableIRProjector";
      v12[1] = @"ProjectorType";
      v13[0] = &__kCFBooleanTrue;
      v13[1] = @"SparseProbeAB";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"SparseProbeAB"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1023, v6);
LABEL_10:

      break;
    default:
      CFStringRef v3 = 0;
      break;
  }
  uint64_t v7 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, @"IRProjectorParams", v3);
  if (v7)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFBooleanRef v10 = +[NSString stringWithFormat:@"setProjectorMode failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1031, v10);
  }
  return v7;
}

void sub_100006564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlDepthConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v23 = a3;
  uint64_t valuePtr = a2;
  if (!*(void *)(a1 + 16))
  {
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v20 = [v19 lastPathComponent];
    CFBooleanRef v21 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v20, 1042, v21, v23, valuePtr);
    uint64_t v14 = 3758097084;

    return v14;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v23);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputWidth, v9);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputHeight, v10);
  CFRelease(v9);
  CFRelease(v10);
  BOOL v11 = (const void **)&kFigCapturePortType_FrontFacingCamera;
  if (!a4) {
    BOOL v11 = (const void **)&kFigCapturePortType_FrontFacingInfraredCamera;
  }
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_DepthPerspectivePortType, *v11);
  uint64_t v12 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v13 = v12;
  if (a5)
  {
    CFArrayAppendValue(v12, kFigCaptureStreamDepthData_DX);
    if ((a5 & 0x10000) == 0)
    {
LABEL_6:
      if ((a5 & 0x1000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else if ((a5 & 0x10000) == 0)
  {
    goto LABEL_6;
  }
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DY);
  if ((a5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((a5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DepthImage);
  if ((a5 & 0x100) == 0)
  {
LABEL_8:
    if ((a5 & 0x100000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_NormalizedDX);
  if ((a5 & 0x100000000) != 0) {
LABEL_9:
  }
    CFArrayAppendValue(v13, kFigCaptureStreamDepthData_GMS);
LABEL_10:
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_EnabledOutputs, v13);
  uint64_t v14 = HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 36), kFigCaptureStreamProperty_DepthEngineConfiguration, Mutable);
  CFRelease(v13);
  if (v14)
  {
    unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v16 = [v15 lastPathComponent];
    CFBooleanRef v17 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v14);
    id v18 = +[NSString stringWithFormat:@"setDepthCofiguration failed with OSStatus 0x%x (%@)", v14, v17];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 1092, v18, v23, valuePtr);

    return 3758097129;
  }
  return v14;
}

void sub_1000069D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbSuperWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::startRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  if (!this->m_captureDeviceController)
  {
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1289, v13);
    uint64_t started = 3758097084;
LABEL_13:

    return started;
  }
  if ((a2 & 0x80000000) != 0)
  {
    CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v5 = [v4 lastPathComponent];
    CFStringRef v6 = +[NSString stringWithFormat:@"stream id is invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1295, v6);
  }
  if (!this->m_currentJasperConfiguration.bitMaskID)
  {
    uint64_t v15 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_1000346D8);
    if (v15)
    {
      uint64_t v16 = (DeviceCMInterface *)v15;
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = DeviceCMInterface::getErrorInformationString(v16);
      uint64_t v14 = +[NSString stringWithFormat:@"set min fps 30 failed with OSStatus 0x%x (%@)", v16, v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1301, v14);
      goto LABEL_12;
    }
    uint64_t v17 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_1000346D8);
    if (v17)
    {
      id v18 = (DeviceCMInterface *)v17;
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = DeviceCMInterface::getErrorInformationString(v18);
      uint64_t v14 = +[NSString stringWithFormat:@"set max fps 30 failed with OSStatus 0x%x (%@)", v18, v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1307, v14);
      goto LABEL_12;
    }
  }
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  CFStringRef v8 = [v7 lastPathComponent];
  CFNumberRef v9 = +[NSString stringWithFormat:@"start receiving stream id: %d", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1312, v9);

  uint64_t started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, a2, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100007B2C, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if (started)
  {
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    uint64_t v14 = +[NSString stringWithFormat:@"startRgbStream failed with OSStatus 0x%x (%@)", started, v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1321, v14);
LABEL_12:

    uint64_t started = 3758097129;
    goto LABEL_13;
  }
  return started;
}

void sub_100006DB0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::startJasperStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFNumberRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 1114, v12);

    return 3758097084;
  }
  CFBooleanRef v37 = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  id v35 = 0;
  uint64_t v3 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureProperty_SupportedPropertiesDictionary, &v35);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
    CFStringRef v8 = +[NSString stringWithFormat:@"get SupportedPropertiesDictionary failed with OSStatus 0x%x (%@)", v4, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1127, v8);
    goto LABEL_4;
  }
  id v14 = v35;
  uint64_t v5 = [v35 allKeys];

  id v35 = 0;
  CFStringRef v15 = (const __CFString *)kFigCaptureStreamProperty_MaximumAllowedFrameRate;
  if ([v5 containsObject:kFigCaptureStreamProperty_MaximumAllowedFrameRate])
  {
    uint64_t v16 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, v15, &v37);
    if (v16)
    {
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v18 = [v17 lastPathComponent];
      v19 = DeviceCMInterface::getErrorInformationString(v16);
      v20 = +[NSString stringWithFormat:@"failed resolving maximum frame rate information OSStatus 0x%x (%@)", v16, v19];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v18, 1148, v20);
      uint64_t v9 = 3758097129;

      if (v37) {
        CFRelease(v37);
      }
      goto LABEL_5;
    }
    CFNumberRef v21 = v37;
    if (!v37)
    {
      CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v7 = [v6 lastPathComponent];
      CFStringRef v8 = +[NSString stringWithFormat:@"null maximum frame rate detected"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1156, v8);
      uint64_t v4 = 3758097129;
      goto LABEL_4;
    }
  }
  else
  {
    CFNumberRef v21 = (const __CFNumber *)&off_1000346C0;
    CFBooleanRef v37 = (const __CFBoolean *)&off_1000346C0;
  }
  CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
  uint64_t v22 = valuePtr;
  uint64_t v23 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MinimumFrameRate, v37);
  uint64_t v4 = 3758097129;
  if (v23)
  {
    CFStringRef v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v26 = DeviceCMInterface::getErrorInformationString(v23);
    id v27 = +[NSString stringWithFormat:@"set min fps of %d failed with OSStatus 0x%x (%@)", v22, v23, v26];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v25, 1168, v27);
  }
  else
  {
    v28 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MaximumFrameRate, v37);
    if (!v28)
    {
      uint64_t v9 = 0;
      int v29 = 1;
      goto LABEL_18;
    }
    CFStringRef v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v26 = DeviceCMInterface::getErrorInformationString(v28);
    id v27 = +[NSString stringWithFormat:@"set max fps of %d failed with OSStatus 0x%x (%@)", v22, v28, v26];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v25, 1176, v27);
  }

  int v29 = 0;
  uint64_t v9 = 3758097129;
LABEL_18:
  CFRelease(v37);
  if (!v29) {
    goto LABEL_5;
  }
  uint64_t v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  id v31 = [v30 lastPathComponent];
  int v32 = +[NSString stringWithFormat:@"start receiving stream id: %d", this->m_streamIdsInfo.jasperStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v31, 1187, v32);

  uint64_t started = (DeviceCMInterface *)HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   0,
                                   (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_1000074D4,
                                   this);
  if (!started)
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v7 = [v6 lastPathComponent];
  CFStringRef v8 = DeviceCMInterface::getErrorInformationString(started);
  uint64_t v34 = +[NSString stringWithFormat:@"startJasperStream failed with OSStatus 0x%x (%@)", started, v8];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1201, v34);

LABEL_4:
  uint64_t v9 = v4;
LABEL_5:

  return v9;
}

void sub_100007408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000074D4(uint64_t result, long long *a2, int a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    CFStringRef result = *(void *)(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 40) == a3) {
          int v6 = 3;
        }
        else {
          int v6 = 0;
        }
        if (*(_DWORD *)(a4 + 32) == a3) {
          unsigned int v7 = 2;
        }
        else {
          unsigned int v7 = v6;
        }
        if (*(_DWORD *)(a4 + 44) == a3) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v7;
        }
      }
      long long v8 = *a2;
      uint64_t v9 = *((void *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t))(*(void *)result + 8))(result, v4, &v8, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopJasperStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v4 = v3;
  if (!m_captureDeviceController)
  {
    long long v8 = [v3 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1212, v9);
    uint64_t v7 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 lastPathComponent];
  int v6 = +[NSString stringWithFormat:@"stop receiving stream id: %d", this->m_streamIdsInfo.jasperStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1216, v6);

  uint64_t v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId);
  if (v7)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    long long v8 = [v4 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    CFNumberRef v10 = +[NSString stringWithFormat:@"stopJasperStream failed with OSStatus 0x%x (%@)", v7, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1220, v10);

    uint64_t v7 = 3758097129;
LABEL_5:
  }
  return v7;
}

void sub_10000772C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlIrStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1232, v7);
    uint64_t started = 3758097084;
LABEL_10:

    return started;
  }
  uint64_t v3 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_1000346D8);
  if (v3)
  {
    uint64_t v4 = (DeviceCMInterface *)v3;
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString(v4);
    long long v8 = +[NSString stringWithFormat:@"set min fps 30 failed with OSStatus 0x%x (%@)", v4, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1239, v8);
LABEL_9:

    uint64_t started = 3758097129;
    goto LABEL_10;
  }
  CFNumberRef v10 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_1000346D8);
  BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v5 = v11;
  if (v10)
  {
    int v6 = [v11 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString(v10);
    long long v8 = +[NSString stringWithFormat:@"set max fps 30 failed with OSStatus 0x%x (%@)", v10, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1245, v8);
    goto LABEL_9;
  }
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v13 = +[NSString stringWithFormat:@"start receiving stream id: %d", this->m_streamIdsInfo.irPearlStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1250, v13);

  uint64_t started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100007B2C, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if (started)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    long long v8 = +[NSString stringWithFormat:@"startIrStream failed with OSStatus 0x%x (%@)", started, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1259, v8);
    goto LABEL_9;
  }
  return started;
}

void sub_100007AB4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t (***sub_100007B2C(uint64_t (***result)(void, void, long long *, uint64_t), long long *a2, int a3, uint64_t a4))(void, void, long long *, uint64_t)
{
  if (a4)
  {
    uint64_t v4 = result;
    CFStringRef result = *(uint64_t (****)(void, void, long long *, uint64_t))(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 28) == a3) {
          unsigned int v6 = 5;
        }
        else {
          unsigned int v6 = 0;
        }
        if (*(_DWORD *)(a4 + 40) == a3) {
          unsigned int v6 = 3;
        }
        if (*(_DWORD *)(a4 + 32) == a3) {
          unsigned int v6 = 2;
        }
        if (*(_DWORD *)(a4 + 44) == a3) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v6;
        }
      }
      long long v7 = *a2;
      uint64_t v8 = *((void *)a2 + 2);
      return (uint64_t (***)(void, void, long long *, uint64_t))(**result)(result, v4, &v7, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopPearlIrStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v4 = v3;
  if (!m_captureDeviceController)
  {
    uint64_t v8 = [v3 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1270, v9);
    uint64_t v7 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 lastPathComponent];
  unsigned int v6 = +[NSString stringWithFormat:@"stop receiving stream id: %d", this->m_streamIdsInfo.irPearlStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1274, v6);

  uint64_t v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  if (v7)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v4 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    CFNumberRef v10 = +[NSString stringWithFormat:@"stopIrStream failed with OSStatus 0x%x (%@)", v7, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1278, v10);

    uint64_t v7 = 3758097129;
LABEL_5:
  }
  return v7;
}

void sub_100007D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  unsigned int v6 = v5;
  if (!m_captureDeviceController)
  {
    CFNumberRef v10 = [v5 lastPathComponent];
    BOOL v11 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1337, v11);
    uint64_t v9 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v7 = [v5 lastPathComponent];
  uint64_t v8 = +[NSString stringWithFormat:@"stop receiving stream id: %d", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1341, v8);

  uint64_t v9 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, a2);
  if (v9)
  {
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFNumberRef v10 = [v6 lastPathComponent];
    BOOL v11 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v9);
    uint64_t v12 = +[NSString stringWithFormat:@"stopRgbStream failed with OSStatus 0x%x (%@)", v9, v11];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1345, v12);

LABEL_5:
  }
  return v9;
}

void sub_100007FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::stopPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbSuperWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::stopRgbWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::validateJasperFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"ValidateComplianceWithDetails", &number);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    uint64_t result = 0;
    *a2 = valuePtr;
  }
  else
  {
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v7 = [v6 lastPathComponent];
    uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    uint64_t v9 = DeviceCMInterface::getErrorInformationString(v4);
    CFNumberRef v10 = +[NSString stringWithFormat:@"validateJasperFwStatus failed with OSStatus 0x%x for stream id %d (%@)", v4, irPearlStreamId, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1385, v10);

    return 3758097084;
  }
  return result;
}

void sub_100008140(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::validateIrFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController
    && *((unsigned char *)m_captureDeviceController + 2148)
    && (unsigned int v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) == 0))
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, @"ValidateComplianceWithDetails", &number);
    if (v6)
    {
      uint64_t v7 = (DeviceCMInterface *)v6;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      BOOL v11 = DeviceCMInterface::getErrorInformationString(v7);
      uint64_t v12 = +[NSString stringWithFormat:@"validateIrFwStatus failed with OSStatus 0x%x for stream id %d (%@)", v7, irPearlStreamId, v11];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1407, v12);
      uint64_t v13 = 3758097084;
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
      return v13;
    }
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"validateIrFwStatus failed as bit mask was NULL"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 1419, v16);
  }
  else
  {
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"device is not activated"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 1400, v16);
  }
  uint64_t v13 = 3758097084;

  return v13;
}

void sub_100008398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableDefaultDepthStream(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::setPearlDepthConfiguration((uint64_t)this, 360, 640, 1, 0x1000000);
  if (v1)
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"setDepthCofiguration failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 1435, v4);
  }
  return v1;
}

void sub_100008498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setPearlMultiCam(DeviceCMInterface *this)
{
  unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = +[NSString stringWithFormat:@"setting multicam..."];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 1443, v4);

  Group = (const void *)HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  uint64_t v6 = HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId);
  if (Group && (uint64_t v7 = (const void *)v6, Group != (const void *)v6) && v6)
  {
    CFRelease(Group);
    CFRelease(v7);
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"cannot set multi cam if both rgb/ir groups not the same"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1452, v10);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    uint64_t v13 = Mutable;
    if (Mutable) {
      CFArrayAppendValue(Mutable, Group);
    }
    uint64_t v24 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
    uint64_t v25 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    BOOL v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v14);
    CFStringRef v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"setting kFigCaptureDeviceProperty_MultiCamConfiguration return val is %d", v11];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 1469, v17);

    if (v13) {
      CFRelease(v13);
    }
    if (v11)
    {
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v19 = [v18 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      CFNumberRef v21 = DeviceCMInterface::getErrorInformationString(v11);
      uint64_t v22 = +[NSString stringWithFormat:@"kFigCaptureDeviceProperty_MultiCamConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v11, irPearlStreamId, v21];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 1476, v22);
    }
  }
  return v11;
}

void sub_1000087E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableSyncForEnumeratedStreams(DeviceCMInterface *this, int a2)
{
  if (!this->m_captureDeviceController
    || this->m_streamIdsInfo.rgbPearlStreamId < 0
    || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"cannot enableSyncForEnumeratedStreams one or more stream ids is invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1486, v10);
    uint64_t v6 = 3758097084;
    goto LABEL_13;
  }
  unsigned int irPearlStreamId = a2;
  this->m_primarySyncModeStreamID = a2;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  unsigned int v5 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbPearlStreamId + 2));
    CFArrayAppendValue(v5, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.irPearlStreamId + 2));
  }
  if (!irPearlStreamId) {
    unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  }
  uint64_t v6 = HxISPCaptureDeviceController::SetGroupProperty(this->m_captureDeviceController, irPearlStreamId, kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v5);
  if (v5) {
    CFRelease(v5);
  }
  if (v6)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    CFNumberRef v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v6);
    BOOL v11 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v6, rgbPearlStreamId, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1538, v11);

    uint64_t v6 = 3758097129;
LABEL_13:
  }
  return v6;
}

void sub_100008A70(_Unwind_Exception *a1)
{
  unsigned int v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlSyncSlave(DeviceCMInterface *this, uint64_t a2, int a3)
{
  int valuePtr = a3;
  if (this->m_captureDeviceController)
  {
    if ((a2 & 0x80000000) == 0
      || this->m_streamIdsInfo.irPearlStreamId == a2
      || this->m_streamIdsInfo.rgbPearlStreamId == a2)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled, kCFBooleanFalse);
      if (a3)
      {
        CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_MasterToSlaveFrameRateRatio, v7);
        CFRelease(v7);
      }
      uint64_t v8 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, Mutable);
      CFRelease(Mutable);
      if (v8)
      {
        uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        CFNumberRef v10 = [v9 lastPathComponent];
        BOOL v11 = DeviceCMInterface::getErrorInformationString(v8);
        uint64_t v12 = +[NSString stringWithFormat:@"setSyncSlave failed with OSStatus 0x%x for stream id %d (%@)", v8, a2, v11];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1598, v12);
      }
    }
    else
    {
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v18 = [v17 lastPathComponent];
      v19 = +[NSString stringWithFormat:@"cannot set stream %d as master for sync, stream is invalid", a2];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v18, 1556, v19);

      return 3758096385;
    }
  }
  else
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v14 = [v13 lastPathComponent];
    CFStringRef v15 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 1549, v15);

    return 3758097084;
  }
  return (uint64_t)v8;
}

void sub_100008D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIRAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.irPearlStreamId, a2);
}

uint64_t DeviceCMInterface::setPearlRgbAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.rgbPearlStreamId, a2);
}

DeviceCMInterface *DeviceCMInterface::disablePearlSyncMode(DeviceCMInterface *this, unsigned int irPearlStreamId)
{
  int m_primarySyncModeStreamID = this->m_primarySyncModeStreamID;
  if (m_primarySyncModeStreamID == -1)
  {
    m_captureDeviceController = this->m_captureDeviceController;
    if (!irPearlStreamId) {
      unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    }
    CFStringRef v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
  }
  else
  {
    m_captureDeviceController = this->m_captureDeviceController;
    CFStringRef v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
    unsigned int irPearlStreamId = m_primarySyncModeStreamID;
  }
  uint64_t v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetGroupProperty(m_captureDeviceController, irPearlStreamId, v5, 0);
  if (v6)
  {
    CFNumberRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString(v6);
    CFNumberRef v10 = +[NSString stringWithFormat:@"disableSyncMode failed with OSStatus 0x%x for stream id (%@)", v6, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1636, v10);
  }
  return v6;
}

void sub_100008EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlFormatIndex(DeviceCMInterface *this, unsigned int a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  CFStringRef v4 = (const __CFString *)kFigCaptureStreamProperty_FormatIndex;
  CFStringRef v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");

  return HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, v4, (const __CFBoolean *)v5);
}

uint64_t DeviceCMInterface::configPearlDevice(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  *(_WORD *)&this->m_currentPearlConfiguration.BOOL isIrOn = 0;
  this->m_currentPearlConfiguration.BOOL isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.int bitMaskID = 0;
  if (a2->isRgbOn)
  {
    uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    if (rgbPearlStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
      if (rgbPearlStreamId == -1)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"no available RGB stream index"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1731, v10);
LABEL_32:
        uint64_t v11 = 3758097136;
        goto LABEL_40;
      }
      BOOL isRgbOn = a2->isRgbOn;
    }
    else
    {
      BOOL isRgbOn = 1;
    }
    if (a2->isIrOn && isRgbOn)
    {
      uint64_t v11 = DeviceCMInterface::enableSyncForEnumeratedStreams(this, rgbPearlStreamId);
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = +[NSString stringWithFormat:@"cmsync 2 3 (enableSyncForEnumeratedStreams) ret = %d", v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 1740, v14);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1744, v10);
        goto LABEL_40;
      }
      uint64_t v11 = (uint64_t)DeviceCMInterface::setPearlMultiCam(this);
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v17 = [v16 lastPathComponent];
      id v18 = +[NSString stringWithFormat:@"CMMULTICAMCREATE -s 2 3(setPearlMultiCam) ret = %d", v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v17, 1750, v18);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1754, v10);
        goto LABEL_40;
      }
      uint64_t v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:0]);
      uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v27 = [v26 lastPathComponent];
      v28 = +[NSString stringWithFormat:@"cmsetcurrentformat 2 0, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, 0) ret = %d", this->m_streamIdsInfo.rgbPearlStreamId];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 1760, v28);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1764, v10);
        goto LABEL_40;
      }
      uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    }
    uint64_t v7 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, rgbPearlStreamId, 1);
    if (v7)
    {
      uint64_t v11 = v7;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1773, v10);
LABEL_40:

      return v11;
    }
    uint64_t v15 = DeviceCMInterface::enablePearlRGBOutput(this);
    if (v15)
    {
      uint64_t v11 = v15;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1781, v10);
      goto LABEL_40;
    }
    this->m_isPearlRgbConfigured = 1;
  }
  BOOL isIrOn = a2->isIrOn;
  if (!a2->isIrOn) {
    goto LABEL_49;
  }
  uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if (irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    if (irPearlStreamId == -1)
    {
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"no available IR stream index"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1792, v10);
      goto LABEL_32;
    }
  }
  uint64_t v21 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, irPearlStreamId, 1);
  if (v21)
  {
    uint64_t v11 = v21;
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1800, v10);
    goto LABEL_40;
  }
  if (this->m_hVersion < 11) {
    goto LABEL_35;
  }
  int v43 = 0;
  uint64_t PearlProjectorHWVersion = DeviceCMInterface::getPearlProjectorHWVersion(this, &v43);
  if (!PearlProjectorHWVersion)
  {
    if (v43 == 10)
    {
      int v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v30 = [v29 lastPathComponent];
      id v31 = +[NSString stringWithFormat:@"projector version %d", 10];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v30, 1816, v31);

      uint64_t v32 = 1;
LABEL_36:
      uint64_t v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:v32]);
      uint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v34 = [v33 lastPathComponent];
      id v35 = +[NSString stringWithFormat:@"cmsetcurrentformat 2 %d, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, %d) ret = %d", this->m_streamIdsInfo.rgbPearlStreamId, v32, v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v34, 1826, v35);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setPearlFormatIndex failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1830, v10);
        goto LABEL_40;
      }
      uint64_t v36 = DeviceCMInterface::enablePearlIROutput(this);
      if (v36)
      {
        uint64_t v11 = v36;
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1838, v10);
        goto LABEL_40;
      }
      uint64_t v38 = DeviceCMInterface::setPearlIrCofiguration(this, a2->irType);
      if (v38)
      {
        uint64_t v11 = v38;
        CFArrayRef v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        CFArrayRef v40 = [v39 lastPathComponent];
        uint64_t v41 = +[NSString stringWithFormat:@"set projector mode to %u failed", a2->irType];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v40, 1846, v41);

        return v11;
      }
      if (a2->isDepthOn)
      {
        uint64_t v42 = DeviceCMInterface::enableDefaultDepthStream(this);
        if (v42)
        {
          uint64_t v11 = v42;
          uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v9 = [v8 lastPathComponent];
          CFNumberRef v10 = +[NSString stringWithFormat:@"enableDefaultDepthStream failed"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1856, v10);
          goto LABEL_40;
        }
      }
      this->m_isPearlIrConfigured = 1;
      BOOL isIrOn = a2->isIrOn;
LABEL_49:
      uint64_t v11 = 0;
      this->m_currentPearlConfiguration.irType = a2->irType;
      this->m_currentPearlConfiguration.BOOL isIrOn = isIrOn;
      *(_WORD *)&this->m_currentPearlConfiguration.isDepthOn = *(_WORD *)&a2->isDepthOn;
      return v11;
    }
LABEL_35:
    uint64_t v32 = 0;
    goto LABEL_36;
  }
  uint64_t v11 = PearlProjectorHWVersion;
  uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v24 = [v23 lastPathComponent];
  uint64_t v25 = +[NSString stringWithFormat:@"config pearl device failed to read projector version"];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 1821, v25);

  return v11;
}

void sub_1000098E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlProjectorHWVersion(DeviceCMInterface *this, int *a2)
{
  CFTypeRef cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"getPearlProjectorVersion failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2398, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, @"ProjectorHWVersion", &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorHWVersion"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2410, v13);
    }
  }
  return v6;
}

void sub_100009B74(_Unwind_Exception *a1)
{
  CFStringRef v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentPearlConfiguration(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  this->m_currentPearlConfiguration.irType = a2->irType;
  this->m_currentPearlConfiguration.BOOL isRgbOn = a2->isRgbOn;
  *(_WORD *)&this->m_currentPearlConfiguration.BOOL isIrOn = *(_WORD *)&a2->isIrOn;
  return this;
}

id DeviceCMInterface::getJasperConfigurationStringKey(DeviceCMInterface *this, JasperConfiguration *a2)
{
  p_m_currentJasperConfiguration = &this->m_currentJasperConfiguration;
  if (a2) {
    p_m_currentJasperConfiguration = a2;
  }
  JasperConfiguration v3 = *p_m_currentJasperConfiguration;
  CFStringRef v4 = +[NSMutableString string];
  [v4 appendString:@"DEVICE_CONFIG"];
  if (v3.isJasperOn) {
    [v4 appendString:@"_JASPER_DEPTH"];
  }
  if ((*(void *)&v3 & 0xFF0000) != 0) {
    [v4 appendString:@"_WIDE"];
  }
  if ((*(_WORD *)&v3.isJasperOn & 0xFF00) != 0)
  {
    if ((*(_DWORD *)&v3.isJasperOn & 0xFF000000) != 0) {
      CFStringRef v5 = @"_SUPER_WIDE_SYNCED";
    }
    else {
      CFStringRef v5 = @"_SUPER_WIDE_UNSYNCED";
    }
    [v4 appendString:v5];
  }
  uint64_t v6 = +[NSString stringWithString:v4];

  return v6;
}

void sub_100009CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id DeviceCMInterface::getPearlConfigurationStringKey(DeviceCMInterface *this, PearlConfiguration *a2)
{
  p_m_currentPearlConfiguration = &this->m_currentPearlConfiguration;
  p_isDepthOn = &this->m_currentPearlConfiguration.isDepthOn;
  p_BOOL isRgbOn = &this->m_currentPearlConfiguration.isRgbOn;
  p_irType = &this->m_currentPearlConfiguration.irType;
  p_deviceName = &this->m_currentPearlConfiguration.deviceName;
  if (a2)
  {
    p_deviceName = &a2->deviceName;
    p_irType = &a2->irType;
    p_BOOL isRgbOn = &a2->isRgbOn;
    p_isDepthOn = &a2->isDepthOn;
    p_m_currentPearlConfiguration = a2;
  }
  BOOL isIrOn = p_m_currentPearlConfiguration->isIrOn;
  BOOL v8 = *p_isDepthOn;
  BOOL v9 = *p_isRgbOn;
  int v10 = *p_irType;
  uint64_t v11 = *p_deviceName;
  uint64_t v12 = +[NSMutableString string];
  [v12 appendString:@"DEVICE_CONFIG"];
  if (isIrOn) {
    [v12 appendString:@"_IR"];
  }
  if (v8) {
    CFStringRef v13 = @"_DEPTH";
  }
  else {
    CFStringRef v13 = @"_NO_PCE";
  }
  [v12 appendString:v13];
  if (v9) {
    [v12 appendString:@"_RGB"];
  }
  CFStringRef v14 = @"_DENSE";
  switch(v10)
  {
    case 0:
      CFStringRef v14 = @"_IR_MODE_NONE";
      goto LABEL_17;
    case 1:
      CFStringRef v14 = @"_FLOOD";
      goto LABEL_17;
    case 2:
      CFStringRef v14 = @"_SPARSE_LOW_POWER";
      goto LABEL_17;
    case 3:
      CFStringRef v14 = @"_SPARSE";
      goto LABEL_17;
    case 4:
      goto LABEL_17;
    case 5:
      [v12 appendString:@"_DENSE_PROB_AB"];
      goto LABEL_16;
    case 6:
LABEL_16:
      CFStringRef v14 = @"_SPARSE_PROB_AB";
LABEL_17:
      [v12 appendString:v14];
      break;
    default:
      break;
  }
  uint64_t v15 = +[NSString stringWithString:v12];

  return v15;
}

void sub_100009E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::isPDECaliobrationValid(DeviceCMInterface *this, BOOL *a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2004, v7);
LABEL_6:
    uint64_t v4 = 3758097084;

    return v4;
  }
  CFTypeRef cf = 0;
  *a2 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"PCECalib", &cf) == 0;
  if (!cf)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_PCECalib"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2023, v7);
    goto LABEL_6;
  }
  CFRelease(cf);
  return 0;
}

void sub_100009FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperProjectorFault(uint64_t a1, void *a2, void *a3)
{
  if (*(int *)a1 <= 15)
  {
    unsigned int valuePtr = 0;
    CFNumberRef number = 0;
    CFStringRef v5 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 44), @"ProjectorRikerFaultStatus", &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    CFStringRef v6 = @"ProjectorRikerFaultStatus";
    if (!v5) {
      return v5;
    }
LABEL_9:
    BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v9 = [v8 lastPathComponent];
    uint64_t v10 = *(unsigned int *)(a1 + 44);
    uint64_t v11 = DeviceCMInterface::getErrorInformationString(v5);
    uint64_t v12 = +[NSString stringWithFormat:@"getJasperProjectorFault %@ failed with OSStatus 0x%x for stream id %d (%@) and property (%@)", v6, v5, v10, v11, v6];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 2063, v12);

    return v5;
  }
  CFNumberRef number = 0;
  CFStringRef v5 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 44), @"ProjectorQuarkFaultStatus", &number);
  if (number)
  {
    *a3 = number;
    CFRelease(number);
  }
  CFStringRef v6 = @"ProjectorQuarkFaultStatus";
  if (v5) {
    goto LABEL_9;
  }
  return v5;
}

void sub_10000A1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperProjectorWillFault(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"ProjectorWillFaultStatus", &number);
  if (v4)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    BOOL v8 = DeviceCMInterface::getErrorInformationString(v4);
    BOOL v9 = +[NSString stringWithFormat:@"getJasperRikerProjectorWillFault failed with OSStatus 0x%x for stream id %d (%@)", v4, jasperStreamId, v8];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2080, v9);
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorWillFaultStatus"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2092, v12);
  }
  return v4;
}

void sub_10000A368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperResistance(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RikerResistance", &number);
  if (v4)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    BOOL v8 = DeviceCMInterface::getErrorInformationString(v4);
    BOOL v9 = +[NSString stringWithFormat:@"getJasperRikerResistance failed with OSStatus 0x%x for stream id %d (%@)", v4, jasperStreamId, v8];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2107, v9);
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_RikerResistance"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2119, v12);
  }
  return v4;
}

void sub_10000A544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getPearlFloodProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (unsigned int v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v13 = [v12 lastPathComponent];
    CFStringRef v14 = +[NSString stringWithFormat:@"getFloodProjectorFault failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 2132, v14);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFStringRef v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, @"ProjectorRosalineFaultStatus", &number);
    if (v6)
    {
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      BOOL v8 = [v7 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      uint64_t v10 = DeviceCMInterface::getErrorInformationString(v6);
      uint64_t v11 = +[NSString stringWithFormat:@"getFloodProjectorFault failed with OSStatus 0x%x for stream id %d (%@)", v6, irPearlStreamId, v10];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2139, v11);
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v17 = [v16 lastPathComponent];
      id v18 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v17, 2151, v18);
    }
  }
  return v6;
}

void sub_10000A7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getStructuredProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  unint64_t valuePtr = 0;
  CFNumberRef number = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (unsigned int v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getStructuredProjectorFault failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2163, v9);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFStringRef v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, @"ProjectorFaultStatus", &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      CFStringRef v14 = DeviceCMInterface::getErrorInformationString(v6);
      uint64_t v15 = +[NSString stringWithFormat:@"getStructuredProjectorFault failed with OSStatus 0x%x for stream id %d (%@)", v6, irPearlStreamId, v14];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2176, v15);
    }
  }
  return v6;
}

void sub_10000A994(_Unwind_Exception *a1)
{
  unsigned int v5 = v3;

  _Unwind_Resume(a1);
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseDevice(DeviceCMInterface *this)
{
  if (DeviceCMInterface::releaseControlOfStreams(this))
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    JasperConfiguration v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"releaseControlOfStreams failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 2187, v4);
  }

  return DeviceCMInterface::releaseInterface(this);
}

void sub_10000AAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 DeviceCMInterface::getStreamIdsInfo@<Q0>(DeviceCMInterface *this@<X0>, int a2@<W1>, __n128 *a3@<X8>)
{
  if (a2) {
    DeviceCMInterface::initAndActivateCaptureDeviceController(this);
  }
  __n128 result = *(__n128 *)&this->m_streamIdsInfo.rgbTeleStreamId;
  *a3 = result;
  a3[1].n128_u64[0] = *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId;
  return result;
}

DeviceCMInterface *DeviceCMInterface::getRgbjReport(DeviceCMInterface *this, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  CFDictionaryRef theDict = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RgbjReport", &theDict);
  if (v12)
  {
    CFStringRef v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v14 = [v13 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    uint64_t v16 = DeviceCMInterface::getErrorInformationString(v12);
    uint64_t v17 = +[NSString stringWithFormat:@"getRgbjReport: failed with OSStatus 0x%x for stream id %d (%@)", v12, jasperStreamId, v16];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 2232, v17);
  }
  else
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportControllerReached");
    CFNumberGetValue(Value, kCFNumberIntType, a2);
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportControllerPassed");
    CFNumberGetValue(v19, kCFNumberIntType, a3);
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportIsfSuccess");
    CFNumberGetValue(v20, kCFNumberIntType, a4);
    CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportIsfFailure");
    CFNumberGetValue(v21, kCFNumberIntType, a5);
    *a6 = 0;
    CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportFailedToSave");
    if (v22)
    {
      CFNumberRef v23 = v22;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v23)) {
        CFNumberGetValue(v23, kCFNumberIntType, a6);
      }
      else {
        NSLog(@"The value for key %@ is not a number", @"RgbjReportFailedToSave");
      }
    }
    CFRelease(theDict);
  }
  return v12;
}

void sub_10000AD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::forceSaveWideJasperCalib(DeviceCMInterface *this)
{
  unsigned int v2 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RgbjForceSaveCalib", 0);
  if (v2)
  {
    JasperConfiguration v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    CFStringRef v6 = DeviceCMInterface::getErrorInformationString(v2);
    uint64_t v7 = +[NSString stringWithFormat:@"forceSaveWideJasperCalib: failed with OSStatus 0x%x for stream id %d (%@)", v2, jasperStreamId, v6];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 2263, v7);
  }
  return v2;
}

void sub_10000AE24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setRgbjConfiguration(DeviceCMInterface *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  v16[0] = @"RgbjConfigurationFeatureVectorSize";
  CFStringRef v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v16[1] = @"RgbjConfigurationDilutionRate";
  v17[0] = v6;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:a4];
  v17[1] = v7;
  CFBooleanRef v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  BOOL v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RgbjConfiguration", v8);
  if (v9)
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    CFStringRef v13 = DeviceCMInterface::getErrorInformationString(v9);
    CFStringRef v14 = +[NSString stringWithFormat:@"setRgbjConfiguration: failed with OSStatus 0x%x for stream id %d (%@)", v9, jasperStreamId, v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2276, v14);
  }
  return v9;
}

void sub_10000AFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setWideJasperExtrinsics(DeviceCMInterface *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  CFStringRef v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v32[0] = v13;
  *(float *)&double v14 = a3;
  uint64_t v15 = +[NSNumber numberWithFloat:v14];
  v32[1] = v15;
  *(float *)&double v16 = a4;
  uint64_t v17 = +[NSNumber numberWithFloat:v16];
  v32[2] = v17;
  *(float *)&double v18 = a5;
  CFNumberRef v19 = +[NSNumber numberWithFloat:v18];
  v32[3] = v19;
  *(float *)&double v20 = a6;
  CFNumberRef v21 = +[NSNumber numberWithFloat:v20];
  v32[4] = v21;
  *(float *)&double v22 = a7;
  CFNumberRef v23 = +[NSNumber numberWithFloat:v22];
  v32[5] = v23;
  CFBooleanRef v24 = +[NSArray arrayWithObjects:v32 count:6];

  uint64_t v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"OverrideJasperWideExtrinsics", v24);
  if (v25)
  {
    uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v27 = [v26 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    int v29 = DeviceCMInterface::getErrorInformationString(v25);
    uint64_t v30 = +[NSString stringWithFormat:@"setWideJasperExtrinsics: failed with OSStatus 0x%x for stream id %d (%@)", v25, jasperStreamId, v29];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 2288, v30);
  }
  return v25;
}

void sub_10000B250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperModuleInfo(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_ModuleInfo, a2);
}

uint64_t DeviceCMInterface::getJasperCalib(DeviceCMInterface *this, const __CFData **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"JasperCalib", a2);
}

uint64_t DeviceCMInterface::getJasperCalibData(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"JapserCalibData", a2);
}

uint64_t DeviceCMInterface::getPearlPleUUID(DeviceCMInterface *this, unsigned __int8 *a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlPCECalib failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2320, v9);

    return 3758097084;
  }
  else
  {
    CFDataRef theData = 0;
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, @"PCECalib", &theData);
    if (theData)
    {
      *(_OWORD *)a2 = *(_OWORD *)(CFDataGetBytePtr(theData) + 8);
      CFRelease(theData);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_PCECalib"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2336, v13);
    }
  }
  return v6;
}

void sub_10000B494(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelSerialNumber(uint64_t a1, void *a2)
{
  id v15 = 0;
  JasperConfiguration v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
  if (!v3 || (unsigned int v5 = *(_DWORD *)(a1 + 36), (v5 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlRigelSerialNumber failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2349, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, v5, @"RigelSerialNumber", &v15);
    if (v15)
    {
      *a2 = v15;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = DeviceCMInterface::getErrorInformationString(v6);
      double v14 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_RigelSerialNumber, %@", v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2360, v14);
    }
  }
  return (uint64_t)v6;
}

void sub_10000B660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelOtpVersion(DeviceCMInterface *this, int *a2)
{
  CFTypeRef cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlRigelOtpVersion failed, ir stream id invalid, %@", @"OK"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2373, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, @"ProjectorVersion", &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorVersion"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2385, v13);
    }
  }
  return v6;
}

void sub_10000B808(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getGuadalupeValues(DeviceCMInterface *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, int *a5, uint64_t *a6)
{
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"GuadRecordRegisters", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = DeviceCMInterface::getErrorInformationString(v12);
    double v18 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_GuadRecordRegisters, %@", v17];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2428, v18);

LABEL_14:
    return v12;
  }
  *a6 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"GuadLastResistance", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_GuadLastResistance"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2443, v17);
    goto LABEL_14;
  }
  *a5 = FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"BaneState", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneState"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2457, v17);
    goto LABEL_14;
  }
  *a2 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v13 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"ProjectorRosalineFaultStatus", &cf);
  if (cf)
  {
    *a3 = (int)FigCFNumberGetSInt32();
    CFRelease(cf);
    CFTypeRef cf = 0;
    uint64_t v14 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"BaneResistance", &cf);
    if (cf)
    {
      if (!v12) {
        LODWORD(v12) = v13;
      }
      *a4 = (int)FigCFNumberGetSInt32();
      CFRelease(cf);
      if (v12) {
        return (DeviceCMInterface *)v12;
      }
      else {
        return (DeviceCMInterface *)v14;
      }
    }
    else
    {
      CFNumberRef v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFBooleanRef v24 = [v23 lastPathComponent];
      uint64_t v25 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneResistance"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 2490, v25);

      return (DeviceCMInterface *)v14;
    }
  }
  else
  {
    double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFNumberRef v21 = [v20 lastPathComponent];
    double v22 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v21, 2473, v22);

    return (DeviceCMInterface *)v13;
  }
}

void sub_10000BC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getCurrentVersion(void)
{
  v0 = +[NSBundle mainBundle];
  uint64_t v1 = [v0 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  return v1;
}

void sub_10000BCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void logMainResults(NSDictionary *a1, uint64_t a2, uint64_t a3)
{
  id v31 = a1;
  unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = +[NSString stringWithFormat:@"Start Diag Logging Results Dictionary for %d -->", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 23, v7);

  CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  BOOL v9 = [v8 lastPathComponent];
  uint64_t v10 = +[NSString stringWithFormat:@"Return code: %d", a3];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 24, v10);

  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v13 = [(NSDictionary *)v31 description];
  uint64_t v14 = +[NSString stringWithFormat:@"Result description: %@", v13];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 25, v14);

  id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  double v16 = [v15 lastPathComponent];
  uint64_t v17 = +[NSString stringWithFormat:@"Key/Val pairs:"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 26, v17);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v18 = [(NSDictionary *)v31 allKeys];
  id obj = v18;
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      CFNumberRef v21 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v21);
        CFNumberRef v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
        CFBooleanRef v24 = [v23 lastPathComponent];
        uint64_t v25 = [(NSDictionary *)v31 objectForKey:v22];
        uint64_t v26 = +[NSString stringWithFormat:@"key:%@ val: %@", v22, v25];
        NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 29, v26);

        CFNumberRef v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      double v18 = obj;
      id v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v19);
  }

  id v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  v28 = [v27 lastPathComponent];
  int v29 = +[NSString stringWithFormat:@"Done Diag Logging Results Dictionary <--"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 31, v29);
}

void sub_10000C108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

__CFString *decToBinStr(unsigned int a1)
{
  unint64_t v1 = a1;
  unsigned int v2 = &stru_100032C70;
  int v3 = 32;
  do
  {
    uint64_t v4 = +[NSString stringWithFormat:@"%lu", v1 & 1];
    unsigned int v5 = [v4 stringByAppendingString:v2];

    v1 >>= 1;
    unsigned int v2 = v5;
    --v3;
  }
  while (v3);

  return v5;
}

void sub_10000C2B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t setBit(uint64_t result, int a2, unsigned int *a3)
{
  unsigned int v3 = *a3 | result;
  if (!a2) {
    unsigned int v3 = *a3 & ~result;
  }
  *a3 = v3;
  return result;
}

void updateJasperValidationStatus(int a1, void *a2)
{
  if ((a1 & 0x400) != 0)
  {
    sub_10000C41C(a2, 40, @"JASPER_VC_PROJECTOR_NOT_ACTIVE");
    if ((a1 & 0x1000) == 0)
    {
LABEL_3:
      if ((a1 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  sub_10000C41C(a2, 41, @"JASPER_VC_BRICK");
  if ((a1 & 0x8000) == 0)
  {
LABEL_4:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  sub_10000C41C(a2, 42, @"JASPER_VC_PROJECTOR_FAULT");
  if ((a1 & 0x20000) == 0)
  {
LABEL_5:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  sub_10000C41C(a2, 43, @"JASPER_VC_SW_SAFETY");
  if ((a1 & 0x40000) == 0)
  {
LABEL_6:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  sub_10000C41C(a2, 44, @"JASPER_VC_OVERHEAT");
  if ((a1 & 0x80000) == 0)
  {
LABEL_7:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  sub_10000C41C(a2, 45, @"JASPER_VC_POWERSUPPLY");
  if ((a1 & 0x100000) == 0)
  {
LABEL_8:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    sub_10000C41C(a2, 47, @"JASPER_VC_SENSOR_MONITOR");
    if ((a1 & 0x400000) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  sub_10000C41C(a2, 46, @"JASPER_VC_SENSOR_STATUS");
  if ((a1 & 0x200000) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((a1 & 0x400000) == 0) {
    return;
  }
LABEL_19:

  sub_10000C41C(a2, 48, @"JASPER_VC_PROJECTORON_NOT_ALLOWED");
}

void sub_10000C41C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[NSNumber numberWithInt:a2];
  v28 = v6;
  id v29 = v5;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  unint64_t v8 = a1[3];
  BOOL v9 = (uint64_t *)a1[2];
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = a1[1];
    uint64_t v12 = ((uint64_t)v9 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61) {
      sub_10000CAEC();
    }
    uint64_t v13 = v8 - v11;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    id v27 = a1 + 3;
    if (v15) {
      double v16 = (char *)sub_10000CB94((uint64_t)(a1 + 3), v15);
    }
    else {
      double v16 = 0;
    }
    uint64_t v17 = (uint64_t *)&v16[8 * v12];
    double v18 = &v16[8 * v15];
    uint64_t v26 = v18;
    uint64_t *v17 = v7;
    uint64_t v10 = v17 + 1;
    v25.i64[1] = (uint64_t)(v17 + 1);
    uint64_t v20 = (void *)a1[1];
    id v19 = (void *)a1[2];
    if (v19 == v20)
    {
      int64x2_t v22 = vdupq_n_s64((unint64_t)v19);
    }
    else
    {
      do
      {
        uint64_t v21 = *--v19;
        void *v19 = 0;
        *--uint64_t v17 = v21;
      }
      while (v19 != v20);
      int64x2_t v22 = *(int64x2_t *)(a1 + 1);
      uint64_t v10 = (void *)v25.i64[1];
      double v18 = v26;
    }
    a1[1] = v17;
    a1[2] = v10;
    int64x2_t v25 = v22;
    CFNumberRef v23 = (char *)a1[3];
    a1[3] = v18;
    uint64_t v26 = v23;
    uint64_t v24 = v22.i64[0];
    sub_10000CC00((uint64_t)&v24);
  }
  else
  {
    uint64_t *v9 = v7;
    uint64_t v10 = v9 + 1;
  }
  a1[2] = v10;
}

void sub_10000C5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void setTestValidationBit(int a1, id *a2)
{
  if (a1)
  {
    id v4 = +[NSMutableDictionary dictionary];
    if (a1) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_FRAMERATE"];
    }
    if ((a1 & 2) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_EXPOSURE"];
    }
    if ((a1 & 4) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_SELECT_AB"];
    }
    if ((a1 & 8) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_SELECT_C"];
    }
    if ((a1 & 0x10) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_SELECT_AB34"];
    }
    if ((a1 & 0x20) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT0"];
    }
    if ((a1 & 0x40) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT1"];
    }
    if ((a1 & 0x80) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT2"];
    }
    if ((a1 & 0x100) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT3"];
    }
    if ((a1 & 0x200) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT4"];
    }
    if ((a1 & 0x400) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_NOT_ACTIVE"];
    }
    if ((a1 & 0x800) != 0) {
      [v4 setValue:@"FAIL" forKey:@"MB_NO_ENABLE"];
    }
    if ((a1 & 0x1000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"MB_BRICK"];
    }
    if ((a1 & 0x2000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"YG"];
    }
    if ((a1 & 0x4000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_CC"];
    }
    if ((a1 & 0x8000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_FAULT"];
    }
    if ((a1 & 0x10000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_STROBECOUNT"];
    }
    if ((a1 & 0x20000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SW_SAFETY"];
    }
    if ((a1 & 0x40000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"OVERHEAT"];
    }
    if ((a1 & 0x80000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"POWERSUPPLY"];
    }
    if ((a1 & 0x100000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_STATUS"];
    }
    if ((a1 & 0x200000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_MONITOR"];
    }
    if ((a1 & 0x400000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTORON_NOT_ALLOWED"];
    }
    [*a2 setValue:v4 forKey:@"FW VALIDATION FAIL INFO"];
  }
}

void sub_10000C8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t isYGErrorDetected(unint64_t a1)
{
  return (a1 >> 13) & 1;
}

CFStringRef getJasperStatusValueString(int a1)
{
  CFStringRef result = @"JASPER_PASS_OK";
  if (a1 > 100)
  {
    CFStringRef v3 = @"JASPER_VC_REAL_POWERSUPPLY";
    if (a1 != 525312) {
      CFStringRef v3 = @"JASPER_PASS_OK";
    }
    if (a1 == 101) {
      return @"JASPER_GENERIC_ERROR";
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 10:
        CFStringRef result = @"JASPER_MODULE_IS_MISSING";
        break;
      case 11:
        CFStringRef result = @"JASPER_INTERFACE_ERROR";
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        return result;
      case 20:
        CFStringRef result = @"JASPER_FAILED_TO_START_STREAMING";
        break;
      case 21:
        CFStringRef result = @"JASPER_FAILED_TO_STOP_STREAMING";
        break;
      case 22:
        CFStringRef result = @"JASPER_FAILED_STREAM_CONTROL";
        break;
      case 30:
        CFStringRef result = @"JASPER_FPS_ERROR";
        break;
      case 31:
        CFStringRef result = @"JASPER_POINTS_ERROR";
        break;
      case 40:
        CFStringRef result = @"JASPER_VC_PROJECTOR_NOT_ACTIVE";
        break;
      case 41:
        CFStringRef result = @"JASPER_VC_BRICK";
        break;
      case 42:
        CFStringRef result = @"JASPER_VC_PROJECTOR_FAULT";
        break;
      case 43:
        CFStringRef result = @"JASPER_VC_SW_SAFETY";
        break;
      case 44:
        CFStringRef result = @"JASPER_VC_OVERHEAT";
        break;
      case 45:
        CFStringRef result = @"JASPER_VC_POWERSUPPLY";
        break;
      case 46:
        CFStringRef result = @"JASPER_VC_SENSOR_STATUS";
        break;
      case 47:
        CFStringRef result = @"JASPER_VC_SENSOR_MONITOR";
        break;
      case 48:
        CFStringRef result = @"JASPER_VC_PROJECTORON_NOT_ALLOWED";
        break;
      case 49:
        CFStringRef result = @"JASPER_VC_ANY_VALIDATION_ERROR";
        break;
      default:
        if (a1 == -2) {
          CFStringRef result = @"JASPER_UNSEALED_STATUS";
        }
        break;
    }
  }
  return result;
}

void sub_10000CAEC()
{
}

void sub_10000CB04(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000CB60(exception, a1);
}

void sub_10000CB4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000CB60(std::logic_error *a1, const char *a2)
{
  CFStringRef result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000CB94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000CBCC();
  }
  return operator new(8 * a2);
}

void sub_10000CBCC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_10000CC00(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_10000CC54(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_10000CCB8(uint64_t a1)
{
  return a1;
}

void PearlDiagnosticInteractor::primaryScalerHxISPFrameAvailableCallback(PearlDiagnosticInteractor *a1, CVPixelBufferRef pixelBuffer, uint64_t a3, int a4)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  if (CVPixelBufferGetDataSize(pixelBuffer)) {
    BOOL v9 = Height * Width == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (pixelBuffer)
  {
    if (a4 == 2)
    {
      a1->m_isPearlRgbFramesArrived = v10;
      if (v10) {
        ++a1->m_rgbPearlFramesCount;
      }
    }
    else if (a4 == 1)
    {
      a1->m_isPearlIrFramesArrived = v10;
      if (v10) {
        ++a1->m_irPearlFramesCount;
      }
      if (a1->m_currentPearlConfiguration.irType == 3 && a1->m_currentPearlConfiguration.isDepthOn)
      {
        CFDictionaryRef v11 = (const __CFDictionary *)CVBufferCopyAttachment(pixelBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
        if (v11)
        {
          CFDictionaryRef v12 = v11;
          unsigned int v16 = -2;
          unsigned int valuePtr = 0xFFFF;
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v11, @"GMC-Result");
          CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v12, @"GMC-NumOfPoints");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            CFRelease(Value);
          }
          if (v14)
          {
            CFNumberGetValue(v14, kCFNumberSInt32Type, &v16);
            CFRelease(v14);
            uint64_t v15 = v16;
          }
          else
          {
            uint64_t v15 = 4294967294;
          }
          PearlDiagnosticInteractor::updateGmcMetaData(a1, v15, valuePtr);
          CFRelease(v12);
        }
      }
    }
  }
}

PearlDiagnosticInteractor *PearlDiagnosticInteractor::setIsPearlIrframeArrived(PearlDiagnosticInteractor *this, BOOL a2)
{
  this->m_isPearlIrFramesArrived = a2;
  if (a2) {
    ++this->m_irPearlFramesCount;
  }
  return this;
}

uint64_t PearlDiagnosticInteractor::updateGmcMetaData(PearlDiagnosticInteractor *this, uint64_t a2, uint64_t a3)
{
  id v5 = +[NSNumber numberWithInt:a2];
  m_gmcPointCount = this->m_gmcPointCount;
  this->m_gmcPointCount = v5;

  uint64_t v7 = +[NSNumber numberWithInt:a3];
  m_gmcResult = this->m_gmcResult;
  this->m_gmcResult = v7;

  return _objc_release_x1(v7, m_gmcResult);
}

PearlDiagnosticInteractor *PearlDiagnosticInteractor::setIsPearlRgbframeArrived(PearlDiagnosticInteractor *this, BOOL a2)
{
  this->m_isPearlRgbFramesArrived = a2;
  if (a2) {
    ++this->m_rgbPearlFramesCount;
  }
  return this;
}

void PearlDiagnosticInteractor::PearlDiagnosticInteractor(PearlDiagnosticInteractor *this)
{
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.int bitMaskID = 0;
  this->m_irPearlFramesCount = 0;
  this->m_gmcResult = 0;
  this->m_gmcPointCount = 0;
  this->_vptr$StreamingClient = (void **)&off_100030768;
  *(_DWORD *)((char *)&this->m_gmcPointCount + 7) = 0;
  this->m_currentPearlConfiguration.deviceName = 0;
  *(NSString **)((char *)&this->m_currentPearlConfiguration.deviceName + 6) = 0;
  PearlDiagnosticInteractor::resetMembers(this);
}

{
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.int bitMaskID = 0;
  this->m_irPearlFramesCount = 0;
  this->m_gmcResult = 0;
  this->m_gmcPointCount = 0;
  this->_vptr$StreamingClient = (void **)&off_100030768;
  *(_DWORD *)((char *)&this->m_gmcPointCount + 7) = 0;
  this->m_currentPearlConfiguration.deviceName = 0;
  *(NSString **)((char *)&this->m_currentPearlConfiguration.deviceName + 6) = 0;
  PearlDiagnosticInteractor::resetMembers(this);
}

void PearlDiagnosticInteractor::resetMembers(PearlDiagnosticInteractor *this)
{
  this->m_irPearlFramesCount = 0;
  *(_WORD *)&this->m_currentPearlConfiguration.BOOL isIrOn = 0;
  this->m_currentPearlConfiguration.BOOL isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.int bitMaskID = 0;
  this->m_rgbPearlFramesCount = 0;
  *(_WORD *)&this->m_isPearlRgbFramesArrived = 0;
  m_gmcResult = this->m_gmcResult;
  this->m_gmcResult = 0;

  m_gmcPointCount = this->m_gmcPointCount;
  this->m_gmcPointCount = 0;
}

uint64_t PearlDiagnosticInteractor::isGmcOk(PearlDiagnosticInteractor *this)
{
  if (!this->m_currentPearlConfiguration.isDepthOn || this->m_currentPearlConfiguration.irType != 3) {
    return 1;
  }
  uint64_t result = (uint64_t)this->m_gmcPointCount;
  if (result)
  {
    if ((int)[(id)result intValue] >= 700)
    {
      uint64_t v6 = 0;
      while ([(NSNumber *)this->m_gmcResult intValue] != word_1000287D0[v6])
      {
        if (++v6 == 8) {
          return 1;
        }
      }
      uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/PearlDiagnosticInteractor.mm"];
      id v4 = [v3 lastPathComponent];
      id v5 = +[NSString stringWithFormat:@"gmc result code %d detected", [(NSNumber *)this->m_gmcResult intValue]];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 208, v5);
    }
    else
    {
      uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/PearlDiagnosticInteractor.mm"];
      id v4 = [v3 lastPathComponent];
      id v5 = +[NSString stringWithFormat:@"gmc point count  %d < %d detected", [(NSNumber *)this->m_gmcPointCount intValue], 700];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 198, v5);
    }

    return 0;
  }
  return result;
}

void sub_10000D18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PearlDiagnosticInteractor::getGmcMetaData(uint64_t a1, void *a2, void *a3)
{
  *a2 = *(id *)(a1 + 16);
  id result = *(id *)(a1 + 8);
  *a3 = result;
  return result;
}

void PearlDiagnosticInteractor::getGmcResultInformation(PearlDiagnosticInteractor *a1, int a2, void *a3, void *a4, void *a5)
{
  int v33 = a2;
  int isGmcOk = PearlDiagnosticInteractor::isGmcOk(a1);
  uint64_t v10 = qword_100038D00;
  if (!qword_100038D00) {
    goto LABEL_11;
  }
  int v11 = isGmcOk;
  CFDictionaryRef v12 = &qword_100038D00;
  do
  {
    int v13 = *(_DWORD *)(v10 + 32);
    BOOL v14 = v13 < a2;
    if (v13 >= a2) {
      uint64_t v15 = (uint64_t *)v10;
    }
    else {
      uint64_t v15 = (uint64_t *)(v10 + 8);
    }
    if (!v14) {
      CFDictionaryRef v12 = (uint64_t *)v10;
    }
    uint64_t v10 = *v15;
  }
  while (*v15);
  if (v12 != &qword_100038D00 && *((_DWORD *)v12 + 8) <= a2)
  {
    long long v34 = &v33;
    unsigned int v16 = sub_10000DDCC(&qword_100038CF8, &v33, (uint64_t)&unk_10002880E, &v34);
    sub_10000D4DC((char *)__dst, (long long *)(v16 + 5));
    if (v26 >= 0) {
      uint64_t v17 = __dst;
    }
    else {
      uint64_t v17 = (void **)__dst[0];
    }
    *a3 = +[NSString stringWithFormat:@"%s", v17];
    double v18 = &v27;
    if (v28 < 0) {
      double v18 = v27;
    }
    *a4 = +[NSString stringWithFormat:@"%s", v18];
    id v19 = &v29;
    if (v30 < 0) {
      id v19 = v29;
    }
    uint64_t v20 = +[NSString stringWithFormat:@"%s", v19];
    uint64_t v21 = v20;
    if (v33) {
      int v22 = v11;
    }
    else {
      int v22 = 0;
    }
    if (v22 == 1)
    {
      uint64_t v23 = [v20 stringByAppendingFormat:@"%@", @" (NOT A FAILURE)"];

      uint64_t v21 = (void *)v23;
    }
    id v24 = v21;
    *a5 = v24;

    if (v32 < 0) {
      operator delete(__p);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
    if (v26 < 0) {
      operator delete(__dst[0]);
    }
  }
  else
  {
LABEL_11:
    *a3 = @"N/A";
    *a5 = @"N/A";
    *a4 = @"N/A";
  }
}

void sub_10000D41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  sub_10000CC54((uint64_t)va);
  _Unwind_Resume(a1);
}

id *sub_10000D444(id *a1)
{
  return a1;
}

void sub_10000D480(id *a1)
{
  operator delete();
}

char *sub_10000D4DC(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000D60C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    sub_10000D60C(__dst + 24, *((void **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v5 = *(long long *)((char *)a2 + 24);
    *((void *)__dst + 5) = *((void *)a2 + 5);
    *(_OWORD *)(__dst + 24) = v5;
  }
  if (*((char *)a2 + 71) < 0)
  {
    sub_10000D60C(__dst + 48, *((void **)a2 + 6), *((void *)a2 + 7));
  }
  else
  {
    long long v6 = a2[3];
    *((void *)__dst + 8) = *((void *)a2 + 8);
    *((_OWORD *)__dst + 3) = v6;
  }
  uint64_t v7 = __dst + 72;
  if (*((char *)a2 + 95) < 0)
  {
    sub_10000D60C(v7, *((void **)a2 + 9), *((void *)a2 + 10));
  }
  else
  {
    long long v8 = *(long long *)((char *)a2 + 72);
    *((void *)__dst + 11) = *((void *)a2 + 11);
    *(_OWORD *)uint64_t v7 = v8;
  }
  return __dst;
}

void sub_10000D5C0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 71) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000D60C(unsigned char *__dst, void *__src, unint64_t a3)
{
  long long v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_10000D6AC();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    long long v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *long long v5 = v8;
    long long v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_10000D6AC()
{
}

void *sub_10000D6C4(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000D6AC();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t sub_10000D778(uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  size_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 104 * a3;
    do
    {
      sub_10000D7FC((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 26;
      v6 -= 104;
    }
    while (v6);
  }
  return a1;
}

void sub_10000D7E4(_Unwind_Exception *a1)
{
  sub_10000DD70(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_10000D7FC(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t v6 = sub_10000D894(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    sub_10000DA3C((uint64_t)a1, a4, (uint64_t)v10);
    sub_10000DAB0(a1, (uint64_t)v12, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    sub_10000DCA0((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t *sub_10000D894(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  size_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    uint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          size_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        size_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    CFDictionaryRef v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      CFDictionaryRef v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    id v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      id v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          size_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        size_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

char *sub_10000DA3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = operator new(0x88uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *(_DWORD *)a2;
  id result = sub_10000D4DC((char *)v6 + 40, (long long *)(a2 + 8));
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_10000DA98(_Unwind_Exception *a1)
{
  sub_10000DCA0(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000DAB0(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  id result = sub_10000DB08(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_10000DB08(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unsigned int v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }
          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            unsigned int v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        unsigned int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_10000DCA0(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_10000DCF8((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void sub_10000DCF8(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0)
  {
    unsigned int v2 = *(void **)(a1 + 8);
    operator delete(v2);
  }
}

void sub_10000DD70(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000DD70(a1, *a2);
    sub_10000DD70(a1, a2[1]);
    sub_10000DCF8((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t **sub_10000DDCC(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  int v8 = a1 + 1;
  BOOL v9 = a1 + 1;
  if (v6)
  {
    int v10 = *a2;
    while (1)
    {
      while (1)
      {
        BOOL v9 = (uint64_t **)v6;
        int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        int v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v12 = (char *)operator new(0x88uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + 8) = **a4;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 88) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    char v15 = 1;
    sub_10000DAB0(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    sub_10000DCA0((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void sub_10000DECC()
{
  sub_10000D6C4(&v116, "GMC_SUCCESS");
  sub_10000D6C4(&v118, "End");
  sub_10000D6C4(v120, "GMC completed successfully");
  sub_10000D6C4(&v122, "N/A");
  v124[0] = 0;
  sub_10000D4DC(v125, &v116);
  sub_10000D6C4(&v108, "GMC_FAIL_SPATIAL_COVERAGE");
  sub_10000D6C4(&v110, "Start");
  sub_10000D6C4(&v112, "No depth. Points do not cover a sufficient part of the FOV");
  sub_10000D6C4(&v114, "coverageRateThresh");
  int v126 = -1;
  sub_10000D4DC(v127, &v108);
  sub_10000D6C4(&v100, "GMC_FAIL_NOT_ENOUGH_POINTS");
  sub_10000D6C4(&v102, "Start");
  sub_10000D6C4(&v104, "No depth. Not enough points to run GMC");
  sub_10000D6C4(&v106, "corrNumThresh");
  int v128 = -2;
  sub_10000D4DC(v129, &v100);
  sub_10000D6C4(&v92, "GMC_FAIL_NOT_ENOUGH_INLIERS_PHASE1");
  sub_10000D6C4(&v94, "After RANSAC");
  sub_10000D6C4(&v96, "Not enough points following outlier removal by RANSAC");
  sub_10000D6C4(&v98, "inliersNumThresh");
  int v130 = -3;
  sub_10000D4DC(v131, &v92);
  sub_10000D6C4(&v84, "GMC_FAIL_NOT_ENOUGH_INLIERS_PHASE2");
  sub_10000D6C4(&v86, "Before BA");
  sub_10000D6C4(&v88, "Not enough points following outlier removal by 3D constraints");
  sub_10000D6C4(&v90, "inliersNumThresh");
  int v132 = -4;
  sub_10000D4DC(v133, &v84);
  sub_10000D6C4(&v76, "GMC_FAIL_AMBIGUITY");
  sub_10000D6C4(&v78, "Before BA");
  sub_10000D6C4(&v80, "EPD values in test set are larger than in the work set used to compute F");
  sub_10000D6C4(&v82, "ambiguityThresh, ambiguityInlierMargin");
  int v134 = -5;
  sub_10000D4DC(v135, &v76);
  sub_10000D6C4(&v68, "GMC_FAIL_ROTATION_OUT_OF_TOLERANCES");
  sub_10000D6C4(&v70, "Before BA");
  sub_10000D6C4(&v72, "Rotations computed from the essential matrix are out of tolerances");
  sub_10000D6C4(&v74, "rotationTolerances");
  int v136 = -6;
  sub_10000D4DC(v137, &v68);
  sub_10000D6C4(&v60, "GMC_FAIL_FINAL_ROTATION_OUT_OF_TOLERANCES");
  sub_10000D6C4(&v62, "End");
  sub_10000D6C4(&v64, "Rotations estimated by BA are out of tolerances");
  sub_10000D6C4(&v66, "rotationTolerances");
  int v138 = -7;
  sub_10000D4DC(v139, &v60);
  sub_10000D6C4(&v52, "GMC_FAIL_FINAL_EFL_OUT_OF_TOLERANCES");
  sub_10000D6C4(&v54, "End");
  sub_10000D6C4(&v56, "Scale estimated by BA is out of tolerances");
  sub_10000D6C4(&v58, "scaleTolerance");
  int v140 = -8;
  sub_10000D4DC(v141, &v52);
  sub_10000D6C4(&v44, "GMC_FAIL_BUNDLE_ADJUSTMENT_DIDNT_CONVERGE");
  sub_10000D6C4(&v46, "End");
  sub_10000D6C4(&v48, "BA ran to the maximal number of iterations and so did not converge");
  sub_10000D6C4(&v50, "ba.maxItr");
  int v142 = -9;
  sub_10000D4DC(v143, &v44);
  sub_10000D6C4(&v36, "GMC_FAIL_MEDIAN_REPROJECTION_ERROR_INCREASED");
  sub_10000D6C4(&v38, "End");
  sub_10000D6C4(&v40, "No change. PDM on test set is larger than before GMC but still passes threshold");
  sub_10000D6C4(&v42, "pdmMedianThresh");
  int v144 = -10;
  sub_10000D4DC(v145, &v36);
  sub_10000D6C4(&v28, "GMC_FAIL_INLIERS_SPATIAL_COVERAGE");
  sub_10000D6C4(&v30, "Before BA");
  sub_10000D6C4(&v32, "Not enough spatial coverage after outlier removal");
  sub_10000D6C4(&v34, "coverageRateThresh");
  int v146 = -11;
  sub_10000D4DC(v147, &v28);
  sub_10000D6C4(&v20, "GMC_FAIL_FACE_COVERAGE");
  sub_10000D6C4(&v22, "Start");
  sub_10000D6C4(&v24, "Not enough points in the face ROI or not enough coverage inside it");
  sub_10000D6C4(&v26, "faceCoverageRateThresh, faceCorrNumThresh");
  int v148 = -12;
  sub_10000D4DC(v149, &v20);
  sub_10000D6C4(v12, "GMC_FAIL_RANSAC");
  sub_10000D6C4(&v14, "RANSAC");
  sub_10000D6C4(&v16, "Unforeseen error in RANSAC. Should not happen and is cause for investigation");
  sub_10000D6C4(&v18, "N/A");
  int v150 = -13;
  sub_10000D4DC(v151, (long long *)v12);
  sub_10000D6C4(v4, "GMC_FAIL_MEDIAN_REPROJECTION_ERROR_LARGE");
  sub_10000D6C4(&v6, "End");
  sub_10000D6C4(&v8, "PDM on test set is larger than threshold");
  sub_10000D6C4(&__p, "pdmMedianThresh");
  int v152 = -14;
  sub_10000D4DC(v153, (long long *)v4);
  sub_10000D778((uint64_t)&unk_100038CF8, v124, 15);
  unint64_t v1 = 1560;
  do
  {
    unsigned int v2 = &v124[v1 / 4];
    if (SHIBYTE(v124[v1 / 4 - 1]) < 0) {
      operator delete(*((void **)v2 - 3));
    }
    if (*((char *)v2 - 25) < 0) {
      operator delete(v120[v1 / 8]);
    }
    uint64_t v3 = &v124[v1 / 4];
    if (*(&v119 + v1) < 0) {
      operator delete(*((void **)v3 - 9));
    }
    if (*((char *)v3 - 73) < 0) {
      operator delete(*((void **)v2 - 12));
    }
    v1 -= 104;
  }
  while (v1);
  if (v11 < 0) {
    operator delete(__p);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  if (v5 < 0) {
    operator delete(v4[0]);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  if (v27 < 0) {
    operator delete(v26);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  if (v21 < 0) {
    operator delete((void *)v20);
  }
  if (v35 < 0) {
    operator delete(v34);
  }
  if (v33 < 0) {
    operator delete(v32);
  }
  if (v31 < 0) {
    operator delete(v30);
  }
  if (v29 < 0) {
    operator delete((void *)v28);
  }
  if (v43 < 0) {
    operator delete(v42);
  }
  if (v41 < 0) {
    operator delete(v40);
  }
  if (v39 < 0) {
    operator delete(v38);
  }
  if (v37 < 0) {
    operator delete((void *)v36);
  }
  if (v51 < 0) {
    operator delete(v50);
  }
  if (v49 < 0) {
    operator delete(v48);
  }
  if (v47 < 0) {
    operator delete(v46);
  }
  if (v45 < 0) {
    operator delete((void *)v44);
  }
  if (v59 < 0) {
    operator delete(v58);
  }
  if (v57 < 0) {
    operator delete(v56);
  }
  if (v55 < 0) {
    operator delete(v54);
  }
  if (v53 < 0) {
    operator delete((void *)v52);
  }
  if (v67 < 0) {
    operator delete(v66);
  }
  if (v65 < 0) {
    operator delete(v64);
  }
  if (v63 < 0) {
    operator delete(v62);
  }
  if (v61 < 0) {
    operator delete((void *)v60);
  }
  if (v75 < 0) {
    operator delete(v74);
  }
  if (v73 < 0) {
    operator delete(v72);
  }
  if (v71 < 0) {
    operator delete(v70);
  }
  if (v69 < 0) {
    operator delete((void *)v68);
  }
  if (v83 < 0) {
    operator delete(v82);
  }
  if (v81 < 0) {
    operator delete(v80);
  }
  if (v79 < 0) {
    operator delete(v78);
  }
  if (v77 < 0) {
    operator delete((void *)v76);
  }
  if (v91 < 0) {
    operator delete(v90);
  }
  if (v89 < 0) {
    operator delete(v88);
  }
  if (v87 < 0) {
    operator delete(v86);
  }
  if (v85 < 0) {
    operator delete((void *)v84);
  }
  if (v99 < 0) {
    operator delete(v98);
  }
  if (v97 < 0) {
    operator delete(v96);
  }
  if (v95 < 0) {
    operator delete(v94);
  }
  if (v93 < 0) {
    operator delete((void *)v92);
  }
  if (v107 < 0) {
    operator delete(v106);
  }
  if (v105 < 0) {
    operator delete(v104);
  }
  if (v103 < 0) {
    operator delete(v102);
  }
  if (v101 < 0) {
    operator delete((void *)v100);
  }
  if (v115 < 0) {
    operator delete(v114);
  }
  if (v113 < 0) {
    operator delete(v112);
  }
  if (v111 < 0) {
    operator delete(v110);
  }
  if (v109 < 0) {
    operator delete((void *)v108);
  }
  if (v123 < 0) {
    operator delete(v122);
  }
  if (v121 < 0) {
    operator delete(v120[0]);
  }
  if (v119 < 0) {
    operator delete(v118);
  }
  if (v117 < 0) {
    operator delete((void *)v116);
  }
  __cxa_atexit((void (*)(void *))sub_10000CCB8, &unk_100038CF8, (void *)&_mh_execute_header);
}

void sub_10000E978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,uint64_t a59,uint64_t a60,int a61,__int16 a62,char a63)
{
  sub_100024ECC(v81 + 1560, (uint64_t)&STACK[0x5B0]);
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (a16 < 0) {
    operator delete(a11);
  }
  if (a58 < 0) {
    operator delete(v82[9]);
  }
  if (a52 < 0) {
    operator delete(v82[6]);
  }
  if (a46 < 0) {
    operator delete(a41);
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  if (a73 < 0) {
    operator delete(v82[21]);
  }
  if (a72 < 0) {
    operator delete(v82[18]);
  }
  if (a70 < 0) {
    operator delete(v82[15]);
  }
  if (a64 < 0) {
    operator delete(v82[12]);
  }
  if (a77 < 0) {
    operator delete(v82[33]);
  }
  if (a76 < 0) {
    operator delete(v82[30]);
  }
  if (a75 < 0) {
    operator delete(v82[27]);
  }
  if (a74 < 0) {
    operator delete(v82[24]);
  }
  if (a81 < 0) {
    operator delete(v82[45]);
  }
  if (a80 < 0) {
    operator delete(v82[42]);
  }
  if (a79 < 0) {
    operator delete(v82[39]);
  }
  if (a78 < 0) {
    operator delete(v82[36]);
  }
  if (SLOBYTE(STACK[0x24F]) < 0) {
    operator delete(v82[57]);
  }
  if (SLOBYTE(STACK[0x237]) < 0) {
    operator delete(v82[54]);
  }
  if (SLOBYTE(STACK[0x21F]) < 0) {
    operator delete(v82[51]);
  }
  if (SLOBYTE(STACK[0x207]) < 0) {
    operator delete(v82[48]);
  }
  if (SLOBYTE(STACK[0x2AF]) < 0) {
    operator delete(v82[69]);
  }
  if (SLOBYTE(STACK[0x297]) < 0) {
    operator delete(v82[66]);
  }
  if (SLOBYTE(STACK[0x27F]) < 0) {
    operator delete(v82[63]);
  }
  if (SLOBYTE(STACK[0x267]) < 0) {
    operator delete(v82[60]);
  }
  if (SLOBYTE(STACK[0x30F]) < 0) {
    operator delete(v82[81]);
  }
  if (SLOBYTE(STACK[0x2F7]) < 0) {
    operator delete(v82[78]);
  }
  if (SLOBYTE(STACK[0x2DF]) < 0) {
    operator delete(v82[75]);
  }
  if (SLOBYTE(STACK[0x2C7]) < 0) {
    operator delete(v82[72]);
  }
  if (SLOBYTE(STACK[0x36F]) < 0) {
    operator delete(v82[93]);
  }
  if (SLOBYTE(STACK[0x357]) < 0) {
    operator delete(v82[90]);
  }
  if (SLOBYTE(STACK[0x33F]) < 0) {
    operator delete(v82[87]);
  }
  if (SLOBYTE(STACK[0x327]) < 0) {
    operator delete(v82[84]);
  }
  if (SLOBYTE(STACK[0x3CF]) < 0) {
    operator delete(v82[105]);
  }
  if (SLOBYTE(STACK[0x3B7]) < 0) {
    operator delete(v82[102]);
  }
  if (SLOBYTE(STACK[0x39F]) < 0) {
    operator delete(v82[99]);
  }
  if (SLOBYTE(STACK[0x387]) < 0) {
    operator delete(v82[96]);
  }
  if (SLOBYTE(STACK[0x42F]) < 0) {
    operator delete(v82[117]);
  }
  if (SLOBYTE(STACK[0x417]) < 0) {
    operator delete(v82[114]);
  }
  if (SLOBYTE(STACK[0x3FF]) < 0) {
    operator delete(v82[111]);
  }
  if (SLOBYTE(STACK[0x3E7]) < 0) {
    operator delete(v82[108]);
  }
  if (SLOBYTE(STACK[0x48F]) < 0) {
    operator delete(v82[129]);
  }
  if (SLOBYTE(STACK[0x477]) < 0) {
    operator delete(v82[126]);
  }
  if (SLOBYTE(STACK[0x45F]) < 0) {
    operator delete(v82[123]);
  }
  if (SLOBYTE(STACK[0x447]) < 0) {
    operator delete(v82[120]);
  }
  if (SLOBYTE(STACK[0x4EF]) < 0) {
    operator delete(v82[141]);
  }
  if (SLOBYTE(STACK[0x4D7]) < 0) {
    operator delete(v82[138]);
  }
  if (SLOBYTE(STACK[0x4BF]) < 0) {
    operator delete(v82[135]);
  }
  if (SLOBYTE(STACK[0x4A7]) < 0) {
    operator delete(v82[132]);
  }
  if (SLOBYTE(STACK[0x54F]) < 0) {
    operator delete(v82[153]);
  }
  if (SLOBYTE(STACK[0x537]) < 0) {
    operator delete(v82[150]);
  }
  if (SLOBYTE(STACK[0x51F]) < 0) {
    operator delete(v82[147]);
  }
  if (SLOBYTE(STACK[0x507]) < 0) {
    operator delete(v82[144]);
  }
  if (SLOBYTE(STACK[0x5AF]) < 0) {
    operator delete(v82[165]);
  }
  if (SLOBYTE(STACK[0x597]) < 0) {
    operator delete(v82[162]);
  }
  if (SLOBYTE(STACK[0x57F]) < 0) {
    operator delete(v82[159]);
  }
  if (SLOBYTE(STACK[0x567]) < 0) {
    operator delete(v82[156]);
  }
  _Unwind_Resume(a1);
}

void sub_10000F08C()
{
  if (SLOBYTE(STACK[0x357]) < 0) {
    operator delete(v0[90]);
  }
  if (SLOBYTE(STACK[0x33F]) < 0) {
    operator delete(v0[87]);
  }
  if (SLOBYTE(STACK[0x327]) < 0) {
    operator delete(v0[84]);
  }
  JUMPOUT(0x10000EEA4);
}

void sub_10000F0E4()
{
  if (SLOBYTE(STACK[0x3B7]) < 0) {
    operator delete(v0[102]);
  }
  if (SLOBYTE(STACK[0x39F]) < 0) {
    operator delete(v0[99]);
  }
  if (SLOBYTE(STACK[0x387]) < 0) {
    operator delete(v0[96]);
  }
  JUMPOUT(0x10000EEE4);
}

void sub_10000F13C()
{
  if (SLOBYTE(STACK[0x417]) < 0) {
    operator delete(v0[114]);
  }
  if (SLOBYTE(STACK[0x3FF]) < 0) {
    operator delete(v0[111]);
  }
  if (SLOBYTE(STACK[0x3E7]) < 0) {
    operator delete(v0[108]);
  }
  JUMPOUT(0x10000EF24);
}

void sub_10000F194()
{
  if (SLOBYTE(STACK[0x477]) < 0) {
    operator delete(v0[126]);
  }
  if (SLOBYTE(STACK[0x45F]) < 0) {
    operator delete(v0[123]);
  }
  if (SLOBYTE(STACK[0x447]) < 0) {
    operator delete(v0[120]);
  }
  JUMPOUT(0x10000EF64);
}

void sub_10000F1EC()
{
  if (SLOBYTE(STACK[0x4D7]) < 0) {
    operator delete(v0[138]);
  }
  if (SLOBYTE(STACK[0x4BF]) < 0) {
    operator delete(v0[135]);
  }
  if (SLOBYTE(STACK[0x4A7]) < 0) {
    operator delete(v0[132]);
  }
  JUMPOUT(0x10000EFA4);
}

void sub_10000F244()
{
  if (SLOBYTE(STACK[0x537]) < 0) {
    operator delete(v0[150]);
  }
  if (SLOBYTE(STACK[0x51F]) < 0) {
    operator delete(v0[147]);
  }
  if (SLOBYTE(STACK[0x507]) < 0) {
    operator delete(v0[144]);
  }
  JUMPOUT(0x10000EFE4);
}

void sub_10000F298()
{
  if (SLOBYTE(STACK[0x5AF]) < 0) {
    operator delete(*(void **)(v2 + 1320));
  }
  sub_100024F3C((uint64_t)&STACK[0x550], v1, v0);
  JUMPOUT(0x10000F084);
}

void sub_10000F2C0()
{
  if (SLOBYTE(STACK[0x597]) < 0) {
    operator delete(v0[162]);
  }
  if (SLOBYTE(STACK[0x57F]) < 0) {
    operator delete(v0[159]);
  }
  if (SLOBYTE(STACK[0x567]) < 0) {
    operator delete(v0[156]);
  }
  JUMPOUT(0x10000F084);
}

void sub_10000F308()
{
}

uint64_t HxISPCaptureDeviceController::FindGroup(HxISPCaptureDeviceController *this, unsigned int a2)
{
  if (!*((_DWORD *)this + 536)) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
  int v6 = (const void **)((char *)this + 8 * a2 + 16);
  char v7 = (char *)this + 2080;
  do
  {
    CFArrayRef theArray = 0;
    uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    char v11 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v10 + 48);
    if (!v11 || v11(FigBaseObject, v5, kCFAllocatorDefault, &theArray)) {
      break;
    }
    CFArrayRef v12 = theArray;
    v15.length = CFArrayGetCount(theArray);
    v15.location = 0;
    if (CFArrayContainsValue(v12, v15, *v6)) {
      uint64_t v4 = *(void *)&v7[8 * v3];
    }
    CFRelease(theArray);
    ++v3;
  }
  while (v3 < *((unsigned int *)this + 536));
  return v4;
}

void HxISPCaptureDeviceController::HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  for (uint64_t i = 296; i != 2280; i += 248)
    *((unsigned char *)this + i) = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  *((_DWORD *)this + 538) = -1;
  *((void *)this + 259) = 0;
  *((_DWORD *)this + 536) = 0;
  *((unsigned char *)this + 2148) = 0;
  *((_DWORD *)this + 516) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  do
  {
    uint64_t v5 = (char *)this + 8 * v4;
    *((void *)v5 + 2) = 0;
    *((void *)v5 + 260) = 0;
    int v6 = (char *)this + v3;
    pthread_mutex_init((pthread_mutex_t *)((char *)this + v3 + 96), 0);
    pthread_cond_init((pthread_cond_t *)((char *)this + v3 + 160), 0);
    *((_WORD *)v6 + 136) = 0;
    *((void *)v6 + 33) = 0;
    *((_DWORD *)v6 + 52) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    *(_OWORD *)(v6 + 241) = 0u;
    *((void *)v6 + 10) = this;
    *((_DWORD *)v6 + 22) = v4;
    *(void *)(v6 + 276) = 0xFFFFLL;
    *((void *)v6 + 36) = 0;
    ++v4;
    v3 += 248;
    *((_WORD *)v6 + 142) = 0;
  }
  while (v3 != 1984);
}

void HxISPCaptureDeviceController::~HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t v2 = 0;
  uint64_t v3 = 256;
  do
  {
    if (*((unsigned char *)this + v3)) {
      HxISPCaptureDeviceController::stopReceive(this, v2);
    }
    ++v2;
    v3 += 248;
  }
  while (v2 != 8);
  if (*((unsigned char *)this + 2148)) {
    HxISPCaptureDeviceController::deactivate(this);
  }
  uint64_t v4 = -1984;
  do
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)this + v4 + 2144));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + v4 + 2080));
    v4 += 248;
  }
  while (v4);
}

uint64_t HxISPCaptureDeviceController::stopReceive(HxISPCaptureDeviceController *this, unsigned int a2)
{
  if (*((unsigned char *)this + 248 * a2 + 256))
  {
    if (*((_DWORD *)this + 516) <= a2)
    {
      uint64_t v7 = 3758097084;
      printf("Error: HxISPCaptureDeviceController::stopReceive - Invalid streamIndex %d\n", a2);
    }
    else
    {
      *((unsigned char *)this + 248 * a2 + 272) = 1;
      uint64_t v4 = *((void *)this + a2 + 2);
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      int v8 = *(uint64_t (**)(uint64_t))(v6 + 16);
      if (v8) {
        uint64_t v7 = v8(v4);
      }
      else {
        uint64_t v7 = 4294954514;
      }
      uint64_t v9 = (char *)this + 248 * a2;
      CFArrayRef v12 = (opaqueCMBufferQueue *)*((void *)v9 + 27);
      char v11 = (CMBufferQueueRef *)(v9 + 216);
      uint64_t v10 = v12;
      if (v12)
      {
        CMBufferQueueRemoveTrigger(v10, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
        while (1)
        {
          CMBufferRef v13 = CMBufferQueueDequeueAndRetain(*v11);
          if (!v13) {
            break;
          }
          CFRelease(v13);
        }
        BOOL v14 = (char *)this + 248 * a2;
        char v17 = (opaqueCMBufferQueue *)*((void *)v14 + 29);
        uint64_t v16 = (opaqueCMBufferQueue **)(v14 + 232);
        for (uint64_t i = v17; ; uint64_t i = *v16)
        {
          CMBufferRef v18 = CMBufferQueueDequeueAndRetain(i);
          if (!v18) {
            break;
          }
          CFRelease(v18);
        }
      }
      char v19 = (char *)this + 248 * a2;
      if (*((void *)v19 + 33))
      {
        long long v20 = (pthread_t *)(v19 + 264);
        char v21 = (char *)this + 248 * a2;
        int v22 = (pthread_mutex_t *)(v21 + 96);
        pthread_mutex_lock((pthread_mutex_t *)(v21 + 96));
        int v25 = *((_DWORD *)v21 + 52);
        id v24 = (int *)(v21 + 208);
        for (int j = v25; j == 1; int j = *v24)
        {
          pthread_mutex_unlock(v22);
          usleep(0x2710u);
          pthread_mutex_lock(v22);
        }
        long long v28 = 0;
        *id v24 = 2;
        pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
        pthread_mutex_unlock(v22);
        pthread_join(*v20, &v28);
        pthread_t *v20 = 0;
      }
      char v26 = (char *)this + 248 * a2;
      *((void *)v26 + 30) = 0;
      *((void *)v26 + 31) = 0;
      v26[256] = 0;
    }
  }
  else
  {
    uint64_t v7 = 3758097084;
    puts("Error: HxISPCaptureDeviceController::startReceive - not already streaming");
  }
  return v7;
}

uint64_t HxISPCaptureDeviceController::deactivate(HxISPCaptureDeviceController *this)
{
  if (*((unsigned char *)this + 2148))
  {
    for (uint64_t i = 16; i != 80; i += 8)
    {
      if (*(void *)((char *)this + i))
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener();
      }
    }
    for (uint64_t j = 0; j != 1984; j += 248)
    {
      uint64_t v4 = *(const void **)((char *)this + j + 216);
      if (v4) {
        CFRelease(v4);
      }
      uint64_t v5 = *(const void **)((char *)this + j + 232);
      if (v5) {
        CFRelease(v5);
      }
    }
    uint64_t v6 = 0;
    uint64_t v7 = -1984;
    do
    {
      int v8 = (char *)this + v6;
      *((void *)v8 + 2) = 0;
      *((void *)v8 + 260) = 0;
      uint64_t v9 = (char *)this + v7;
      pthread_mutex_init((pthread_mutex_t *)((char *)this + v7 + 2080), 0);
      pthread_cond_init((pthread_cond_t *)((char *)this + v7 + 2144), 0);
      *((_WORD *)v9 + 1128) = 0;
      *((void *)v9 + 281) = 0;
      *((_DWORD *)v9 + 548) = 0;
      *(_OWORD *)(v9 + 2200) = 0u;
      *(_OWORD *)(v9 + 2216) = 0u;
      *(_OWORD *)(v9 + 2225) = 0u;
      *((void *)v9 + 258) = this;
      v6 += 8;
      *((_DWORD *)v9 + 518) = 0;
      v7 += 248;
    }
    while (v7);
    uint64_t v10 = (const void *)*((void *)this + 259);
    if (v10) {
      CFRelease(v10);
    }
    char v11 = (const void *)*((void *)this + 1);
    if (v11) {
      CFRelease(v11);
    }
    if (*(void *)this)
    {
      uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v13 = FigBaseObject;
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v16 = *(void (**)(uint64_t))(v15 + 24);
        if (v16) {
          v16(v13);
        }
      }
      CFRelease(*(CFTypeRef *)this);
    }
    *((unsigned char *)this + 2148) = 0;
    *((_DWORD *)this + 516) = 0;
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t HxISPCaptureDeviceController::activate(HxISPCaptureDeviceController *this)
{
  uint64_t v1 = 0xFFFFFFFFLL;
  if (*((unsigned char *)this + 2148)) {
    return v1;
  }
  *((_DWORD *)this + 538) = -1;
  int v25 = 0;
  uint64_t v1 = sub_100011E54("/System/Library/MediaCapture/VirtualCameraDevice.mediacapture", "FigVirtualCameraDeviceCreate", (uint64_t)&v25);
  if (v25)
  {
    fprintf(__stderrp, "+++ Found and loaded %s\n", "/System/Library/MediaCapture/VirtualCameraDevice.mediacapture");
    uint64_t v3 = v25;
    if (v25)
    {
LABEL_13:
      *(void *)this = v3;
      goto LABEL_14;
    }
  }
  uint64_t v4 = &dword_100030BA8;
  unint64_t v5 = 1;
  do
  {
    CFDictionaryRef v6 = IOServiceMatching(*((const char **)v4 - 3));
    if (IOServiceGetMatchingService(kIOMainPortDefault, v6))
    {
      uint64_t v7 = (const char *)*((void *)v4 - 2);
      uint64_t v1 = sub_100011E54(v7, *((const char **)v4 - 1), (uint64_t)&v25);
      if (!v25)
      {
        uint64_t v3 = 0;
        goto LABEL_10;
      }
      fprintf(__stderrp, "+++ Found and loaded  %s\n", v7);
      *((_DWORD *)this + 538) = *v4;
    }
    uint64_t v3 = v25;
LABEL_10:
    if (v5 > 4) {
      break;
    }
    ++v5;
    v4 += 8;
  }
  while (!v3);
  if (this) {
    goto LABEL_13;
  }
  if (v3) {
    CFRelease(v3);
  }
LABEL_14:
  if (v1 || !*(void *)this)
  {
    puts("HxISPCaptureDeviceController::activate - Error: Could not create CaptureDevice");
  }
  else
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    CFArrayRef v12 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v11 + 48);
    if (!v12) {
      return 4294954514;
    }
    uint64_t v1 = v12(FigBaseObject, kFigCaptureDeviceProperty_StreamArray, kCFAllocatorDefault, (char *)this + 8);
    if (v1) {
      return v1;
    }
    unsigned int Count = CFArrayGetCount(*((CFArrayRef *)this + 1));
    if (Count >= 8) {
      int v14 = 8;
    }
    else {
      int v14 = Count;
    }
    *((_DWORD *)this + 516) = v14;
    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        *((void *)this + v15 + 2) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 1), v15);
        ++v15;
        unint64_t v16 = *((unsigned int *)this + 516);
      }
      while (v15 < v16);
      if (v16)
      {
        unint64_t v17 = 0;
        do
        {
          if (*((void *)this + v17 + 2))
          {
            CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterAddListener();
          }
          else
          {
            printf("HxISPCaptureDeviceController::activate - CaptureStream %d not found\n", v17);
          }
          ++v17;
        }
        while (v17 < *((unsigned int *)this + 516));
      }
    }
    uint64_t v18 = FigCaptureDeviceGetFigBaseObject();
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v20 = v19 ? v19 : 0;
    char v21 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v20 + 48);
    if (!v21) {
      return 4294954514;
    }
    uint64_t v1 = v21(v18, kFigCaptureDeviceProperty_SupportedSynchronizedStreamsGroups, kCFAllocatorDefault, (char *)this + 2072);
    if (!v1)
    {
      unsigned int v22 = CFArrayGetCount(*((CFArrayRef *)this + 259));
      if (v22 >= 8) {
        int v23 = 8;
      }
      else {
        int v23 = v22;
      }
      *((_DWORD *)this + 536) = v23;
      if (v23)
      {
        unint64_t v24 = 0;
        do
        {
          *((void *)this + v24 + 260) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 259), v24);
          ++v24;
        }
        while (v24 < *((unsigned int *)this + 536));
      }
      uint64_t v1 = 0;
      *((unsigned char *)this + 2148) = 1;
    }
  }
  return v1;
}

size_t sub_10000FD64(int a1, uint64_t a2, const __CFString *a3, CFTypeRef cf1)
{
  if (a2 && cf1)
  {
    if (*(_DWORD *)(a2 + 2064))
    {
      unint64_t v7 = 0;
      do
      {
        if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16 + 8 * v7))) {
          break;
        }
        ++v7;
      }
      while (v7 < *(unsigned int *)(a2 + 2064));
      unsigned int v8 = v7;
    }
    else
    {
      unsigned int v8 = 0;
    }
    uint64_t v11 = __stdoutp;
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    fprintf(v11, "HxISPCaptureDeviceController::handleStreamNotification: %s (streamIndex %d)\n", CStringPtr, v8);
    fflush(__stdoutp);
    size_t result = CFEqual(a3, kFigCaptureStreamNotification_StreamControlTakenByAnotherClient);
    if (result && *(unsigned char *)(a2 + 248 * v8 + 256))
    {
      return HxISPCaptureDeviceController::stopReceive((HxISPCaptureDeviceController *)a2, v8);
    }
  }
  else
  {
    uint64_t v9 = __stdoutp;
    return fwrite("Diagnostic_FW Device controller recievd null notification info objects\n", 0x47uLL, 1uLL, v9);
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::RequestStreams(HxISPCaptureDeviceController *this, const __CFArray *a2, const __CFDictionary *a3)
{
  if (!a2) {
    return 4294954516;
  }
  uint64_t v5 = *(void *)this;
  CFDictionaryRef v6 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  if (*v7 < 2uLL) {
    return 4294954514;
  }
  uint64_t v9 = (uint64_t (*)(uint64_t, const __CFArray *, const __CFDictionary *))v7[2];
  if (!v9) {
    return 4294954514;
  }

  return v9(v5, a2, a3);
}

uint64_t HxISPCaptureDeviceController::RelinquishStreams(HxISPCaptureDeviceController *this, const __CFArray *a2)
{
  if (!a2) {
    return 4294954516;
  }
  uint64_t v3 = *(void *)this;
  uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (*v5 < 2uLL) {
    return 4294954514;
  }
  unint64_t v7 = (uint64_t (*)(uint64_t, const __CFArray *, void))v5[3];
  if (!v7) {
    return 4294954514;
  }

  return v7(v3, a2, 0);
}

uint64_t HxISPCaptureDeviceController::startReceive(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(opaqueCMSampleBuffer *, unsigned int, void *), void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = (char *)this + 248 * a2;
  if (v5[256])
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = (char *)this + 248 * a2;
  *((void *)v9 + 30) = a3;
  *((void *)v9 + 31) = a4;
  CFTypeRef obj = 0;
  uint64_t v10 = (uint64_t *)((char *)this + 8 * a2 + 16);
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  int v14 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v13 + 48);
  if (v14 && !v14(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj))
  {
    CFShow(obj);
    CFRelease(obj);
    CFTypeRef obj = 0;
  }
  unint64_t v15 = (char *)this + 248 * a2;
  uint64_t v17 = *((void *)v15 + 27);
  unint64_t v16 = (CMBufferQueueRef *)(v15 + 216);
  if (!v17)
  {
    uint64_t v22 = FigCaptureStreamGetFigBaseObject();
    uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v23) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    long long v34 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CMBufferQueueRef *))(v24 + 48);
    if (!v34) {
      return 4294954514;
    }
    uint64_t v6 = v34(v22, kFigCaptureStreamProperty_BufferQueue, kCFAllocatorDefault, v16);
    if (v6) {
      return v6;
    }
  }
  uint64_t v18 = (char *)this + 248 * a2;
  uint64_t v20 = *((void *)v18 + 29);
  uint64_t v19 = v18 + 232;
  if (!v20)
  {
    uint64_t v25 = FigCaptureStreamGetFigBaseObject();
    uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    char v35 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v27 + 48);
    if (v35)
    {
      uint64_t v6 = v35(v25, kFigCaptureStreamProperty_StillImageBufferQueue, kCFAllocatorDefault, v19);
      if (v6) {
        return v6;
      }
      goto LABEL_17;
    }
    return 4294954514;
  }
LABEL_17:
  char v21 = *v16;
  CMTime time = kCMTimeZero;
  if (CMBufferQueueInstallTrigger(v21, (CMBufferQueueTriggerCallback)sub_100010580, v5 + 80, 7, &time, (CMBufferQueueTriggerToken *)this + 31 * a2 + 28))
  {
    return 3758097084;
  }
  long long v28 = (char *)this + 248 * a2;
  char v29 = (pthread_mutex_t *)(v28 + 96);
  pthread_mutex_lock((pthread_mutex_t *)(v28 + 96));
  *((_DWORD *)v28 + 52) = 0;
  char v30 = v28 + 208;
  v30[64] = 0;
  pthread_attr_init(&v40);
  pthread_attr_setdetachstate(&v40, 1);
  pthread_create((pthread_t *)v30 + 7, &v40, (void *(__cdecl *)(void *))sub_1000105F0, v5 + 80);
  pthread_attr_destroy(&v40);
  pthread_mutex_unlock(v29);
  uint64_t v31 = *v10;
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  long long v36 = v5 + 256;
  char v37 = *(uint64_t (**)(uint64_t))(v33 + 8);
  if (v37)
  {
    uint64_t v6 = v37(v31);
    if (!v6)
    {
      uint64_t v6 = 0;
      *long long v36 = 1;
      return v6;
    }
  }
  else
  {
    uint64_t v6 = 4294954514;
  }
  CMBufferQueueRemoveTrigger(*v16, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
  while (1)
  {
    usleep(0x2710u);
    v40.__sig = 0;
    pthread_mutex_lock(v29);
    if (*(_DWORD *)v30 != 1) {
      break;
    }
    pthread_mutex_unlock(v29);
  }
  *(_DWORD *)char v30 = 2;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
  pthread_mutex_unlock(v29);
  pthread_join(*((pthread_t *)v30 + 7), (void **)&v40);
  *long long v36 = 0;
  return v6;
}

uint64_t sub_100010580(uint64_t result)
{
  if (!*(unsigned char *)(result + 192))
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 128) != 1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 16));
      *(_DWORD *)(v1 + 128) = 1;
      pthread_cond_signal((pthread_cond_t *)(v1 + 80));
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 16));
    }
  }
  return result;
}

uint64_t sub_1000105F0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    uint64_t v2 = "HxISPCaptureDeviceStreamFrameReceiveThread1";
  }
  else {
    uint64_t v2 = "HxISPCaptureDeviceStreamFrameReceiveThread0";
  }
  pthread_setname_np(v2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (1)
  {
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    if (*(_DWORD *)(a1 + 128) == 2) {
      break;
    }
    CMBufferRef v3 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
    if (v3)
    {
      CMBufferRef v4 = v3;
      do
      {
        uint64_t v5 = *(void (**)(CMBufferRef, void, void))(a1 + 160);
        if (v5) {
          v5(v4, *(unsigned int *)(a1 + 8), *(void *)(a1 + 168));
        }
        CFRelease(v4);
        CMBufferRef v4 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 128) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a4, void (*a5)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a6, void (*a7)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a8, void (*a9)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a10, void (*a11)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a12, void (*a13)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a14, void (*a15)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a16, void (*a17)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a18, void (*a19)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a20,void (*a21)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *),void *a22)
{
  if (!*((unsigned char *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*((unsigned char *)this + 248 * a2 + 256))
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  char v65 = (char *)this + 248 * a2;
  uint64_t v31 = a2;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    uint64_t v33 = Mutable;
    long long v34 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v34)
    {
      char v35 = v34;
      value[0] = _NSConcreteStackBlock;
      value[1] = 0x40000000;
      value[2] = sub_1000110AC;
      value[3] = &unk_1000307B0;
      unsigned int v86 = a2;
      value[4] = a3;
      value[5] = a4;
      CFDictionarySetValue(v34, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, value);
      CFDictionarySetValue(v35, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000307F0);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PrimaryScaler, v35);
      CFRelease(v35);
    }
    long long v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v36)
    {
      char v37 = v36;
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 0x40000000;
      v83[2] = sub_100011124;
      v83[3] = &unk_100030810;
      unsigned int v84 = a2;
      v83[4] = a5;
      v83[5] = a6;
      CFDictionarySetValue(v36, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v83);
      CFDictionarySetValue(v37, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030850);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_SecondaryScaler, v37);
      CFRelease(v37);
    }
    uint64_t v38 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v38)
    {
      char v39 = v38;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 0x40000000;
      v81[2] = sub_10001119C;
      v81[3] = &unk_100030870;
      unsigned int v82 = a2;
      v81[4] = a7;
      v81[5] = a8;
      CFDictionarySetValue(v38, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v81);
      CFDictionarySetValue(v39, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000308B0);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_IntermediateTap, v39);
      CFRelease(v39);
    }
    if (a9)
    {
      pthread_attr_t v40 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v40)
      {
        char v41 = v40;
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 0x40000000;
        v79[2] = sub_100011214;
        v79[3] = &unk_1000308D0;
        unsigned int v80 = a2;
        v79[4] = a9;
        v79[5] = a10;
        CFDictionarySetValue(v40, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v79);
        CFDictionarySetValue(v41, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030910);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImage, v41);
        CFRelease(v41);
      }
    }
    if (a11)
    {
      uint64_t v42 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v42)
      {
        char v43 = v42;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 0x40000000;
        v77[2] = sub_10001128C;
        v77[3] = &unk_100030930;
        unsigned int v78 = a2;
        v77[4] = a11;
        v77[5] = a12;
        CFDictionarySetValue(v42, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v77);
        CFDictionarySetValue(v43, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030970);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageIntermediateTap, v43);
        CFRelease(v43);
      }
    }
    if (a13)
    {
      long long v44 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v44)
      {
        char v45 = v44;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 0x40000000;
        v75[2] = sub_100011304;
        v75[3] = &unk_100030990;
        unsigned int v76 = a2;
        v75[4] = a13;
        v75[5] = a14;
        CFDictionarySetValue(v44, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v75);
        CFDictionarySetValue(v45, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000309D0);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Depth, v45);
        CFRelease(v45);
      }
    }
    if (a15)
    {
      float v46 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        char v47 = v46;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 0x40000000;
        v73[2] = sub_10001137C;
        v73[3] = &unk_1000309F0;
        unsigned int v74 = a2;
        v73[4] = a15;
        v73[5] = a16;
        CFDictionarySetValue(v46, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v73);
        CFDictionarySetValue(v47, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030A30);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Raw, v47);
        CFRelease(v47);
      }
    }
    if (a17)
    {
      float v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v48)
      {
        char v49 = v48;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 0x40000000;
        v71[2] = sub_1000113F4;
        v71[3] = &unk_100030A50;
        unsigned int v72 = a2;
        v71[4] = a17;
        v71[5] = a18;
        CFDictionarySetValue(v48, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v71);
        CFDictionarySetValue(v49, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030A90);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageRaw, v49);
        CFRelease(v49);
      }
    }
    if (a19)
    {
      v50 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v50)
      {
        char v51 = v50;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 0x40000000;
        v69[2] = sub_10001146C;
        v69[3] = &unk_100030AB0;
        unsigned int v70 = a2;
        v69[4] = a19;
        v69[5] = a20;
        CFDictionarySetValue(v50, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v69);
        CFDictionarySetValue(v51, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030AF0);
        CFDictionarySetValue(v33, @"VisPipe", v51);
        CFRelease(v51);
      }
    }
    if (a21)
    {
      long long v52 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v52)
      {
        char v53 = v52;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 0x40000000;
        v67[2] = sub_1000114E4;
        v67[3] = &unk_100030B10;
        unsigned int v68 = a2;
        v67[4] = a21;
        v67[5] = a22;
        CFDictionarySetValue(v52, kFigCaptureStreamVideoOutputHandlerKey_DataBufferHandler, v67);
        CFDictionarySetValue(v53, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030B50);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PointCloud, v53);
        CFRelease(v53);
      }
    }
    int v54 = HxISPCaptureDeviceController::SetStreamProperty(this, a2, kFigCaptureStreamProperty_VideoOutputHandlers, v33);
    if (v54) {
      printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - error setting VideoOutputHandlers: %d\n", v54);
    }
    CFRelease(v33);
    uint64_t v31 = a2;
  }
  char v55 = (char *)this + 248 * v31;
  *((void *)v55 + 30) = 0;
  *((void *)v55 + 31) = 0;
  CFTypeRef obj = 0;
  v56 = (uint64_t *)((char *)this + 8 * v31 + 16);
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v58 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v58) {
    uint64_t v59 = v58;
  }
  else {
    uint64_t v59 = 0;
  }
  long long v60 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v59 + 48);
  if (!v60) {
    return 4294954514;
  }
  uint64_t result = v60(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj);
  if (result) {
    return result;
  }
  CFShow(obj);
  CFRelease(obj);
  CFTypeRef obj = 0;
  uint64_t v61 = *v56;
  uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v63 = v62 ? v62 : 0;
  v64 = *(uint64_t (**)(uint64_t))(v63 + 8);
  if (!v64) {
    return 4294954514;
  }
  uint64_t result = v64(v61);
  if (!result) {
    v65[256] = 1;
  }
  return result;
}

uint64_t sub_1000110AC(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000110F8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (primaryScaler), event=%d\n", a2);
}

uint64_t sub_100011124(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100011170(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (secondaryScaler), event=%d\n", a2);
}

uint64_t sub_10001119C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000111E8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (intermediateTap), event=%d\n", a2);
}

uint64_t sub_100011214(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100011260(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImage), event=%d\n", a2);
}

uint64_t sub_10001128C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000112D8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageIntermediateTap), event=%d\n", a2);
}

uint64_t sub_100011304(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100011350(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (depth), event=%d\n", a2);
}

uint64_t sub_10001137C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000113C8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (raw), event=%d\n", a2);
}

uint64_t sub_1000113F4(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100011440(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageRaw), event=%d\n", a2);
}

uint64_t sub_10001146C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000114B8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (visPipe), event=%d\n", a2);
}

uint64_t sub_1000114E4(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100011530(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (data), event=%d\n", a2);
}

uint64_t HxISPCaptureDeviceController::SetStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const __CFBoolean *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    uint64_t v11 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v11);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    uint64_t v11 = "Error: HxISPCaptureDeviceController::SetStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFBoolean *))(v10 + 56);
  if (!v13) {
    return 4294954514;
  }
  uint64_t result = v13(FigBaseObject, a3, a4);
  if (!result)
  {
    uint64_t result = CFEqual(a3, kFigCaptureStreamProperty_MultipleOutputSupportEnabled);
    if (result)
    {
      uint64_t result = CFBooleanGetValue(a4);
      int v14 = (char *)this + 248 * a2 + 273;
      if (result)
      {
        uint64_t result = 0;
        unsigned char *v14 = 1;
      }
      else
      {
        unsigned char *v14 = 0;
      }
    }
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::SetDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, const void *a3)
{
  if (*((unsigned char *)this + 2148))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(v7 + 56);
    if (v9)
    {
      return v9(FigBaseObject, a2, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, void *a3)
{
  if (*((unsigned char *)this + 2148))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v7 + 48);
    if (v9)
    {
      return v9(FigBaseObject, a2, kCFAllocatorDefault, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    uint64_t v9 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v9);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    uint64_t v9 = "Error: HxISPCaptureDeviceController::CopyStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v8 + 48);
  if (!v11) {
    return 4294954514;
  }

  return v11(FigBaseObject, a3, kCFAllocatorDefault, a4);
}

uint64_t HxISPCaptureDeviceController::SetGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - No CM plug-in";
LABEL_15:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Invalid stream index";
    goto LABEL_15;
  }
  if (*((_DWORD *)this + 536))
  {
    uint64_t v7 = 0;
    uint64_t v8 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    uint64_t v9 = (const void **)((char *)this + 8 * a2 + 16);
    while (1)
    {
      CFArrayRef theArray = 0;
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v12 + 48);
      if (!v13 || v13(FigBaseObject, v8, kCFAllocatorDefault, &theArray)) {
        break;
      }
      CFArrayRef v14 = theArray;
      v22.length = CFArrayGetCount(theArray);
      v22.location = 0;
      CFArrayContainsValue(v14, v22, *v9);
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536)) {
        goto LABEL_16;
      }
    }
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(v19 + 56);
  if (v20) {
    return v20(v17, a3, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t HxISPCaptureDeviceController::CopyGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - No CM plug-in";
LABEL_15:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Invalid stream index";
    goto LABEL_15;
  }
  if (*((_DWORD *)this + 536))
  {
    uint64_t v7 = 0;
    uint64_t v8 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    uint64_t v9 = (const void **)((char *)this + 8 * a2 + 16);
    while (1)
    {
      CFArrayRef theArray = 0;
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v12 + 48);
      if (!v13 || v13(FigBaseObject, v8, kCFAllocatorDefault, &theArray)) {
        break;
      }
      CFArrayRef v14 = theArray;
      v22.length = CFArrayGetCount(theArray);
      v22.location = 0;
      CFArrayContainsValue(v14, v22, *v9);
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536)) {
        goto LABEL_16;
      }
    }
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v19 + 48);
  if (v20) {
    return v20(v17, a3, kCFAllocatorDefault, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t sub_100011E54(const char *a1, const char *a2, uint64_t a3)
{
  uint64_t v5 = dlopen(a1, 4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t (*)(const CFAllocatorRef, void, uint64_t))dlsym(v5, a2);
  if (!v6) {
    return 0;
  }

  return v6(kCFAllocatorDefault, 0, a3);
}

void sub_1000122B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000125F0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000128B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  unint64_t v16 = v15;

  _Unwind_Resume(a1);
}

void sub_100012B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  unint64_t v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1000138C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,void *a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_100013C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, DeviceCMInterface *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a14);
  _Unwind_Resume(a1);
}

void sub_1000140C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, DeviceCMInterface *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a14);
  _Unwind_Resume(a1);
}

void sub_1000142EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, DeviceCMInterface *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a14);
  _Unwind_Resume(a1);
}

void sub_100014FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1000152D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000154DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000157A8(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_100015814(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_100016484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000168D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100016FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void *sub_1000171B0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_10000CBCC();
  }
  return operator new(24 * a2);
}

uint64_t sub_1000171F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10001724C(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (id *)**a1;
  if (v2)
  {
    long long v4 = (id *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 3;

        long long v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t encryptFDRData(const char *a1, size_t a2, char *a3, char *a4)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v8 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v17 = a1;
    __int16 v18 = 2048;
    size_t v19 = a2;
    __int16 v20 = 2048;
    char v21 = a3;
    __int16 v22 = 2048;
    uint64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "encryptFDRData %p %zu %p %p\n", buf, 0x2Au);
  }
  uint64_t v9 = encryptFDRDataInternal(a1, a2, a3, a4, 0);
  if (v9)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 161);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      CFArrayRef v14 = __osLogPearlLib;
    }
    else {
      CFArrayRef v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "err == 0 ";
      __int16 v18 = 2048;
      size_t v19 = (int)v9;
      __int16 v20 = 2080;
      char v21 = "";
      __int16 v22 = 2080;
      uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v24 = 1024;
      int v25 = 161;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      unint64_t v15 = __osLogPearlLibTrace;
    }
    else {
      unint64_t v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v9;
      uint64_t v11 = v15;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v10 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      uint64_t v11 = v10;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "encryptFDRData -> %d\n", buf, 8u);
    }
  }
  return v9;
}

uint64_t encryptFDRDataInternal(const char *a1, size_t a2, char *a3, char *a4, int a5)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v10 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    __int16 v24 = a1;
    __int16 v25 = 2048;
    size_t v26 = a2;
    __int16 v27 = 2048;
    long long v28 = a3;
    __int16 v29 = 2048;
    char v30 = a4;
    __int16 v31 = 1024;
    int v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "encryptFDRDataInternal %p %zu %p %p %d\n", buf, 0x30u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 209);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "data";
    __int16 v25 = 2048;
    size_t v26 = 0;
    __int16 v27 = 2080;
    long long v28 = "";
    __int16 v29 = 2080;
    char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 209;
LABEL_77:
    __int16 v20 = v18;
LABEL_78:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_79:
    uint64_t v12 = 258;
    goto LABEL_16;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 210);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "dataLength > 0";
    __int16 v25 = 2048;
    size_t v26 = 0;
    __int16 v27 = 2080;
    long long v28 = "";
    __int16 v29 = 2080;
    char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 210;
    goto LABEL_77;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "encryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 211);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "encryptedDataBuffer";
    __int16 v25 = 2048;
    size_t v26 = 0;
    __int16 v27 = 2080;
    long long v28 = "";
    __int16 v29 = 2080;
    char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 211;
    goto LABEL_77;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 212);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "outLength";
    __int16 v25 = 2048;
    size_t v26 = 0;
    __int16 v27 = 2080;
    long long v28 = "";
    __int16 v29 = 2080;
    char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 212;
    goto LABEL_77;
  }
  if (a2 >= 0xFFFFFFFFFFFFFFACLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encryptedData)), (&minimalOutputBufferLength))) == 0 ", a2 >= 0xFFFFFFFFFFFFFFACLL, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 215);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      size_t v19 = __osLogPearlLib;
    }
    else {
      size_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encrypted"
          "Data)), (&minimalOutputBufferLength))) == 0 ";
    __int16 v25 = 2048;
    size_t v26 = a2 >= 0xFFFFFFFFFFFFFFACLL;
    __int16 v27 = 2080;
    long long v28 = "";
    __int16 v29 = 2080;
    char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 215;
    __int16 v20 = v19;
    goto LABEL_78;
  }
  if (*(void *)a4 < a2 + 84)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*outLength >= minimalOutputBufferLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 217);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_79;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "*outLength >= minimalOutputBufferLength";
    __int16 v25 = 2048;
    size_t v26 = 0;
    __int16 v27 = 2080;
    long long v28 = "";
    __int16 v29 = 2080;
    char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 217;
    goto LABEL_77;
  }
  uint64_t v11 = sub_100018554();
  if (v11)
  {
    uint64_t v12 = v11;
    size_t v21 = (int)v11;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 220);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v22 = __osLogPearlLib;
    }
    else {
      __int16 v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v24 = "err == 0 ";
      __int16 v25 = 2048;
      size_t v26 = v21;
      __int16 v27 = 2080;
      long long v28 = "";
      __int16 v29 = 2080;
      char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v31 = 1024;
      int v32 = 220;
LABEL_94:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v12 = sub_100018814(dword_100038D10, 9, a5, a1, a2, a3, a4);
    if (v12)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 223);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      __int16 v22 = __osLogPearlLib ? __osLogPearlLib : &_os_log_default;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v24 = "err == 0 ";
        __int16 v25 = 2048;
        size_t v26 = (int)v12;
        __int16 v27 = 2080;
        long long v28 = "";
        __int16 v29 = 2080;
        char v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v31 = 1024;
        int v32 = 223;
        goto LABEL_94;
      }
    }
  }
LABEL_16:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v12)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v13 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v12;
      CFArrayRef v14 = v13;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "encryptFDRDataInternal -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      unint64_t v16 = __osLogPearlLibTrace;
    }
    else {
      unint64_t v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0;
      CFArrayRef v14 = v16;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_33;
    }
  }
  return v12;
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    long long v4 = __osLogPearlLibTrace;
  }
  else {
    long long v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    __int16 v18 = a1;
    __int16 v19 = 2048;
    size_t v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v12 = __osLogPearlLib;
    }
    else {
      uint64_t v12 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v18 = "data";
    __int16 v19 = 2048;
    size_t v20 = 0;
    __int16 v21 = 2080;
    __int16 v22 = "";
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v12 = __osLogPearlLib;
    }
    else {
      uint64_t v12 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v18 = "dataLength > 0";
    __int16 v19 = 2048;
    size_t v20 = 0;
    __int16 v21 = 2080;
    __int16 v22 = "";
    __int16 v23 = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 180;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    uint64_t v5 = 258;
    goto LABEL_12;
  }
  uint64_t v5 = sub_100018554();
  if (v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v13 = __osLogPearlLib;
    }
    else {
      uint64_t v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v18 = "err == 0 ";
      __int16 v19 = 2048;
      size_t v20 = (int)v5;
      __int16 v21 = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 183;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = sub_100018814(dword_100038D10, 10, 0, a1, a2, 0, 0);
    if (v6)
    {
      uint64_t v14 = v6;
      size_t v15 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        unint64_t v16 = __osLogPearlLib;
      }
      else {
        unint64_t v16 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v18 = "err == 0 ";
        __int16 v19 = 2048;
        size_t v20 = v15;
        __int16 v21 = 2080;
        __int16 v22 = "";
        __int16 v23 = 2080;
        __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v25 = 1024;
        int v26 = 186;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v5 = v14;
    }
  }
LABEL_12:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v5)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v7 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v5;
      uint64_t v8 = v7;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v10 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      uint64_t v8 = v10;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v5;
}

uint64_t sub_100018554()
{
  CFDictionaryRef v0 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v2 = MatchingService;
    uint64_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100038D10);
    if (v3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v6 = __osLogPearlLib;
      }
      else {
        uint64_t v6 = &_os_log_default;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v8 = "err == 0 ";
        __int16 v9 = 2048;
        uint64_t v10 = (int)v3;
        __int16 v11 = 2080;
        uint64_t v12 = "";
        __int16 v13 = 2080;
        uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v15 = 1024;
        int v16 = 129;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v2);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v3 = 3758097084;
    if (__osLogPearlLib) {
      uint64_t v5 = __osLogPearlLib;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = "service";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      uint64_t v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v15 = 1024;
      int v16 = 126;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

uint64_t sub_100018814(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  size_t v14 = a5 + 8;
  __int16 v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    int v16 = v15;
    _WORD *v15 = 21072;
    v15[1] = a2;
    void v15[2] = 1;
    v15[3] = a3;
    if (a5) {
      memmove(v15 + 4, a4, a5);
    }
    if (a7)
    {
      *(void *)outputStructCnt = *a7;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(void *)outputStructCnt;
    }
    else
    {
      *(void *)outputStructCnt = 0;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(void *)&outputStructCnt[4] = "cmd";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = "";
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v27 = 1024;
      int v28 = 99;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t decryptFDRData(const void *a1, size_t a2, void *a3, size_t *a4)
{
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 241);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v11 = __osLogPearlLib;
    }
    else {
      __int16 v11 = &_os_log_default;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "data";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 241;
    goto LABEL_46;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 242);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v11 = __osLogPearlLib;
    }
    else {
      __int16 v11 = &_os_log_default;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "dataLength > 0";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 242;
    goto LABEL_46;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "decryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 243);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v11 = __osLogPearlLib;
    }
    else {
      __int16 v11 = &_os_log_default;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "decryptedDataBuffer";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 243;
    goto LABEL_46;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 244);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v11 = __osLogPearlLib;
    }
    else {
      __int16 v11 = &_os_log_default;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "outLength";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 244;
    goto LABEL_46;
  }
  if (*a4 < a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(*outLength > 0) && (*outLength >= dataLength)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 245);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v11 = __osLogPearlLib;
    }
    else {
      __int16 v11 = &_os_log_default;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "(*outLength > 0) && (*outLength >= dataLength)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 245;
LABEL_46:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_47:
    uint64_t v8 = 258;
    goto LABEL_8;
  }
  uint64_t v8 = sub_100018554();
  if (v8)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 248);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v12 = __osLogPearlLib;
    }
    else {
      uint64_t v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = (int)v8;
      __int16 v20 = 2080;
      __int16 v21 = "";
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v24 = 1024;
      int v25 = 248;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v9 = sub_100018814(dword_100038D10, 30, 0, a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v13 = v9;
      uint64_t v14 = (int)v9;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 251);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        __int16 v15 = __osLogPearlLib;
      }
      else {
        __int16 v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = "err == 0 ";
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        __int16 v21 = "";
        __int16 v22 = 2080;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v24 = 1024;
        int v25 = 251;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v8 = v13;
    }
  }
LABEL_8:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v8;
}

uint64_t overridePCECalibration(const void *a1, size_t a2)
{
  if (a1 && a2)
  {
    uint64_t v4 = sub_100018554();
    if (v4)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 269);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v8 = __osLogPearlLib;
      }
      else {
        uint64_t v8 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = "err == 0 ";
        __int16 v14 = 2048;
        uint64_t v15 = (int)v4;
        __int16 v16 = 2080;
        uint64_t v17 = "";
        __int16 v18 = 2080;
        uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v20 = 1024;
        int v21 = 269;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      uint64_t v5 = sub_100018814(dword_100038D10, 34, 0, a1, a2, 0, 0);
      if (v5)
      {
        uint64_t v9 = v5;
        uint64_t v10 = (int)v5;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 272);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          __int16 v11 = __osLogPearlLib;
        }
        else {
          __int16 v11 = &_os_log_default;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v13 = "err == 0 ";
          __int16 v14 = 2048;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          uint64_t v17 = "";
          __int16 v18 = 2080;
          uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v20 = 1024;
          int v21 = 272;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v4 = v9;
      }
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "calibration && (calibrationSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 266);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v7 = __osLogPearlLib;
    }
    else {
      uint64_t v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = "calibration && (calibrationSize > 0)";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      uint64_t v17 = "";
      __int16 v18 = 2080;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v20 = 1024;
      int v21 = 266;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v4 = 258;
  }
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v4;
}

uint64_t decompressReferenceFrames(const void *a1, size_t a2, uint64_t a3)
{
  size_t v123 = 0;
  *(_OWORD *)__str = 0u;
  long long v131 = 0u;
  if (!a1 || !a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v99 = __osLogPearlLib;
    }
    else {
      char v99 = &_os_log_default;
    }
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v99 = __osLogPearlLib;
    }
    else {
      char v99 = &_os_log_default;
    }
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "systemRootPath";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 310;
LABEL_190:
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    uint64_t v12 = 258;
LABEL_263:
    char v35 = &OBJC_INSTANCE_METHODS_NSObject;
    goto LABEL_124;
  }
  uint64_t v6 = sub_100018554();
  if (v6)
  {
    uint64_t v12 = v6;
    uint64_t v100 = (int)v6;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v101 = __osLogPearlLib;
    }
    else {
      char v101 = &_os_log_default;
    }
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = v100;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 313;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  uint64_t v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      v102 = __osLogPearlLib;
    }
    else {
      v102 = &_os_log_default;
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "fdrInput";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 317;
    goto LABEL_221;
  }
  uint64_t v8 = v7;
  *(_DWORD *)uint64_t v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  uint64_t v9 = sub_100018814(dword_100038D10, 36, 0, v8, a2 + 9, 0, 0);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v103 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      v104 = __osLogPearlLib;
    }
    else {
      v104 = &_os_log_default;
    }
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = v103;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 327;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  size_t v123 = 52;
  uint64_t v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      v102 = __osLogPearlLib;
    }
    else {
      v102 = &_os_log_default;
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v127 = "dataInfo";
    *(_WORD *)&v127[8] = 2048;
    uint64_t v128 = 0;
    *(_WORD *)v129 = 2080;
    *(void *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 334;
LABEL_221:
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    uint64_t v12 = 260;
    goto LABEL_263;
  }
  __int16 v11 = v10;
  uint64_t v12 = sub_100018814(dword_100038D10, 45, 0, 0, 0, v10, &v123);
  if (v12)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v105 = __osLogPearlLib;
    }
    else {
      char v105 = &_os_log_default;
    }
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = (int)v12;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 338;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(__stderrp, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v13 = __osLogPearlLib;
  }
  else {
    uint64_t v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v127 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      v106 = __osLogPearlLib;
    }
    else {
      v106 = &_os_log_default;
    }
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "dataInfo->setCount > 0";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = 0;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 342;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 259;
    goto LABEL_262;
  }
  uint64_t v15 = +[NSString stringWithFormat:@"%s%s", a3, "/System/Library/Pearl/ReferenceFrames"];
  __int16 v16 = __stderrp;
  if (!v15)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v107 = __osLogPearlLib;
    }
    else {
      char v107 = &_os_log_default;
    }
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "path";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = 0;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 345;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 261;
    goto LABEL_262;
  }
  uint64_t v17 = v15;
  fprintf(v16, "ReferenceFramesPath: %s\n", [(NSString *)v17 UTF8String]);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    __int16 v18 = __osLogPearlLib;
  }
  else {
    __int16 v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v17;
    __int16 v20 = v18;
    int v21 = [(NSString *)v19 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)v127 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);
  }
  __int16 v22 = +[NSFileManager defaultManager];
  unsigned int v23 = [(NSFileManager *)v22 fileExistsAtPath:v17];

  if (v23)
  {
    __int16 v24 = +[NSFileManager defaultManager];
    unsigned int v25 = [(NSFileManager *)v24 removeItemAtPath:v17 error:0];

    if ((v25 & 1) == 0)
    {
      uint64_t v12 = v25 ^ 1;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        long long v108 = __osLogPearlLib;
      }
      else {
        long long v108 = &_os_log_default;
      }
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v127 = "err == 0 ";
        *(_WORD *)&v127[8] = 2048;
        uint64_t v128 = v12;
        *(_WORD *)v129 = 2080;
        *(void *)&v129[2] = "";
        *(_WORD *)&v129[10] = 2080;
        *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v129[20] = 1024;
        *(_DWORD *)&v129[22] = 353;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v26 = __osLogPearlLib;
    }
    else {
      int v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v127 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  __int16 v27 = +[NSFileManager defaultManager];
  unsigned __int8 v28 = [(NSFileManager *)v27 fileExistsAtPath:v17];

  if (v28) {
    goto LABEL_37;
  }
  NSFileAttributeKey v124 = NSFilePosixPermissions;
  v125 = &off_100034738;
  __int16 v29 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
  char v30 = +[NSFileManager defaultManager];
  uint64_t v12 = [(NSFileManager *)v30 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:v29 error:0] ^ 1;

  if (v12)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v109 = __osLogPearlLib;
    }
    else {
      char v109 = &_os_log_default;
    }
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = v12;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 362;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    uint64_t v31 = 0;
    char v119 = 0;
    v120 = 0;
    uint64_t v114 = 0;
    int v32 = 0;
    uint64_t v33 = 0;
    id v116 = 0;
    long long v34 = 0;
    char v35 = &OBJC_INSTANCE_METHODS_NSObject;
    v110 = v11;
    while (1)
    {
      long long v36 = &v11[3 * v31];
      int v37 = v36[1];
      char v115 = (unsigned int *)(++v36 + 1);
      char v117 = v36;
      char v113 = (unsigned int *)(v36 + 2);
      fprintf(__stderrp, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v31, v37, v36[1], v36[2]);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      int v121 = v31;
      if (__osLogPearlLib) {
        uint64_t v38 = __osLogPearlLib;
      }
      else {
        uint64_t v38 = &_os_log_default;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = *v117;
        unsigned int v40 = *v115;
        int v41 = *v113;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v127 = v31;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v39;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v40;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      uint64_t v42 = *v117;
      if (v42 <= 3) {
        uint64_t v114 = (uint64_t)*(&off_100030C70 + v42);
      }
      id v43 = +[NSMutableDictionary dictionary];

      if (!v43)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        char v93 = v32;
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          v94 = __osLogPearlLib;
        }
        else {
          v94 = &_os_log_default;
        }
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "setDictionary";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 383;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        __int16 v11 = v110;
        char v77 = v119;
        int v32 = v93;
        unsigned int v76 = v33;
        goto LABEL_79;
      }
      uint64_t v111 = v31;
      id v116 = v43;
      [v43 setObject:&off_100034750 forKeyedSubscript:@"FormatDR"];
      long long v44 = +[NSString stringWithFormat:@"%@/reference-%@.plist", v17, v114];

      if (!v44)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        char v77 = v119;
        char v95 = v32;
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          v96 = __osLogPearlLib;
        }
        else {
          v96 = &_os_log_default;
        }
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "dictFileName";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 388;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        unsigned int v76 = (NSString *)v43;
        __int16 v11 = v110;
        int v32 = v95;
        goto LABEL_79;
      }
      v112 = v44;
      if (*v115) {
        break;
      }
LABEL_68:
      unsigned __int8 v69 = [v116 writeToFile:v112 atomically:0];
      unsigned int v70 = __stderrp;
      if ((v69 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        char v97 = v32;
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        char v77 = v119;
        if (__osLogPearlLib) {
          v98 = __osLogPearlLib;
        }
        else {
          v98 = &_os_log_default;
        }
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 1;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 438;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        uint64_t v12 = 1;
        __int16 v11 = v110;
        int v32 = v97;
        unsigned int v76 = v112;
        goto LABEL_79;
      }
      uint64_t v33 = v112;
      fprintf(v70, "Reference set dictionary written to %s\n", [(NSString *)v33 UTF8String]);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      __int16 v11 = v110;
      if (__osLogPearlLib) {
        char v71 = __osLogPearlLib;
      }
      else {
        char v71 = &_os_log_default;
      }
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v72 = v33;
        char v73 = v71;
        unsigned int v74 = [(NSString *)v72 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v127 = v74;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);
      }
      uint64_t v31 = v111 + 1;
      if (v111 + 1 >= (unint64_t)*v110)
      {

        uint64_t v12 = 0;
        unsigned int v76 = v33;
        char v77 = v119;
LABEL_79:

        char v75 = v120;
        goto LABEL_80;
      }
    }
    unsigned int v45 = 0;
    while (1)
    {
      v122[0] = v121;
      v122[1] = v45;
      size_t v123 = *v113 + 524;
      float v46 = (unsigned int *)calloc(v123, 1uLL);
      if (!v46) {
        break;
      }
      char v47 = v46;
      uint64_t v48 = sub_100018814(v35[418].entrysize, 46, 0, v122, 8uLL, v46, &v123);
      if (v48)
      {
        uint64_t v12 = v48;
        uint64_t v81 = v34;
        uint64_t v82 = (int)v48;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v48, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        v118 = v32;
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          char v83 = __osLogPearlLib;
        }
        else {
          char v83 = &_os_log_default;
        }
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = v82;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 403;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v47) - 32) <= 0xFFFFFFE0)
      {
        uint64_t v81 = v34;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        v118 = v32;
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          unsigned int v84 = __osLogPearlLib;
        }
        else {
          unsigned int v84 = &_os_log_default;
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 406;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
LABEL_104:
        char v85 = v110;
        v50 = v81;
LABEL_121:
        char v53 = v120;
LABEL_122:
        free(v85);
        free(v47);

        unsigned int v78 = v119;
        goto LABEL_123;
      }
      char v49 = +[NSString stringWithUTF8String:__str];

      if (!v49)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        v118 = v32;
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        char v85 = v110;
        if (__osLogPearlLib) {
          unsigned int v86 = __osLogPearlLib;
        }
        else {
          unsigned int v86 = &_os_log_default;
        }
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "tempString";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 409;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v50 = 0;
        uint64_t v12 = 261;
        char v35 = &OBJC_INSTANCE_METHODS_NSObject;
        goto LABEL_121;
      }
      v50 = v49;
      char v51 = +[NSString stringWithFormat:@"reference-%@__T_%@.bin", v114, v49];

      if (!v51)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        char v85 = v110;
        if (__osLogPearlLib) {
          char v87 = __osLogPearlLib;
        }
        else {
          char v87 = &_os_log_default;
        }
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "refFileName";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 412;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v118 = 0;
        uint64_t v12 = 261;
        goto LABEL_121;
      }
      long long v52 = v51;
      char v53 = +[NSString stringWithFormat:@"%@/%@", v17, v51];

      v118 = v52;
      if (!v53)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          v90 = __osLogPearlLib;
        }
        else {
          v90 = &_os_log_default;
        }
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "refPath";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 415;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        char v53 = 0;
        uint64_t v12 = 261;
        char v85 = v110;
        goto LABEL_122;
      }
      int v54 = v17;
      [v116 setObject:v52 forKeyedSubscript:v50];
      char v55 = +[NSData dataWithBytesNoCopy:v47 + 3 length:v47[2] freeWhenDone:0];

      if (!v55)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        uint64_t v17 = v54;
        if (__osLogPearlLib) {
          char v91 = __osLogPearlLib;
        }
        else {
          char v91 = &_os_log_default;
        }
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "refFrameData";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v128 = 0;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 423;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        char v119 = 0;
        uint64_t v12 = 261;
        char v85 = v110;
        goto LABEL_122;
      }
      v56 = v50;
      char v119 = v55;
      unsigned __int8 v57 = [(NSData *)v55 writeToFile:v53 atomically:0];
      uint64_t v58 = __stderrp;
      if ((v57 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        uint64_t v17 = v54;
        if (__osLogPearlLib) {
          long long v92 = __osLogPearlLib;
        }
        else {
          long long v92 = &_os_log_default;
        }
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          uint64_t v12 = 1;
          uint64_t v128 = 1;
          *(_WORD *)v129 = 2080;
          *(void *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 426;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          uint64_t v12 = 1;
        }
        char v85 = v110;
        goto LABEL_122;
      }
      double v59 = *(double *)v47;
      unsigned int v60 = v47[2];
      int v61 = *v117;
      v120 = v53;
      fprintf(v58, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v121, v45, v60, v61, v59, [(NSString *)v120 UTF8String]);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v62 = __osLogPearlLib;
      }
      else {
        uint64_t v62 = &_os_log_default;
      }
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v63 = v47[2];
        int v64 = *v117;
        double v65 = *(double *)v47;
        v66 = v120;
        char v67 = v62;
        unsigned int v68 = [(NSString *)v66 UTF8String];
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v127 = v121;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v45;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v63;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v64;
        *(_WORD *)&v129[4] = 2048;
        *(double *)&v129[6] = v65;
        char v35 = &OBJC_INSTANCE_METHODS_NSObject;
        *(_WORD *)&v129[14] = 2080;
        *(void *)&v129[16] = v68;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);
      }
      free(v47);
      ++v45;
      uint64_t v17 = v54;
      long long v34 = v56;
      int v32 = v118;
      if (v45 >= *v115) {
        goto LABEL_68;
      }
    }
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    char v79 = v32;
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      unsigned int v80 = __osLogPearlLib;
    }
    else {
      unsigned int v80 = &_os_log_default;
    }
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v127 = "refFrame";
      *(_WORD *)&v127[8] = 2048;
      uint64_t v128 = 0;
      *(_WORD *)v129 = 2080;
      *(void *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(void *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 400;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v110);

    uint64_t v12 = 260;
  }
  else
  {
    char v75 = 0;
    int v32 = 0;
    long long v34 = 0;
    char v77 = 0;
    uint64_t v12 = 0;
    char v35 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_80:
    free(v11);

    unsigned int v78 = v77;
LABEL_123:
  }
LABEL_124:
  io_connect_t entrysize = v35[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v35[418].io_connect_t entrysize = 0;
  }
  return v12;
}

uint64_t getSavageProvisioningData(uint64_t a1, long long *a2, uint64_t a3, _OWORD *a4, uint64_t a5, const void *a6, size_t a7, uint64_t a8, void *a9, _OWORD *a10, void *a11, uint64_t a12, void *a13)
{
  long long v74 = 0u;
  memset(v75, 0, 27);
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v59 = 75;
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savagePubKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 480);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      unsigned int v45 = __osLogPearlLib;
    }
    else {
      unsigned int v45 = &_os_log_default;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "savagePubKey";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 480;
    goto LABEL_125;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageUID", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 482);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      unsigned int v45 = __osLogPearlLib;
    }
    else {
      unsigned int v45 = &_os_log_default;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "savageUID";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 482;
    goto LABEL_125;
  }
  if (!a6 || !a7)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageFWCert && savageFWCertLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 484);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      unsigned int v45 = __osLogPearlLib;
    }
    else {
      unsigned int v45 = &_os_log_default;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "savageFWCert && savageFWCertLength";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 484;
    goto LABEL_125;
  }
  if (!a8)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "hostPubKeyBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 485);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      unsigned int v45 = __osLogPearlLib;
    }
    else {
      unsigned int v45 = &_os_log_default;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "hostPubKeyBuffer";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 485;
    goto LABEL_125;
  }
  if (!a9 || *a9 <= 0x37uLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 486);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      long long v44 = __osLogPearlLib;
    }
    else {
      long long v44 = &_os_log_default;
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 486;
    goto LABEL_81;
  }
  if (!a10)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ngidDEBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 487);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      unsigned int v45 = __osLogPearlLib;
    }
    else {
      unsigned int v45 = &_os_log_default;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "ngidDEBuffer";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 487;
    goto LABEL_125;
  }
  if (!a11 || *a11 <= 0xFuLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outNGIDDELength && (*outNGIDDELength >= 16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 488);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      long long v44 = __osLogPearlLib;
    }
    else {
      long long v44 = &_os_log_default;
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "outNGIDDELength && (*outNGIDDELength >= 16)";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 488;
    goto LABEL_81;
  }
  if (!a12)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "kcvBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 489);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      unsigned int v45 = __osLogPearlLib;
    }
    else {
      unsigned int v45 = &_os_log_default;
    }
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_126;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "kcvBuffer";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 489;
LABEL_125:
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_126:
    uint64_t v31 = 258;
    goto LABEL_57;
  }
  if (!a13 || *a13 <= 2uLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outKCVLength && (*outKCVLength >= 3)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 490);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      long long v44 = __osLogPearlLib;
    }
    else {
      long long v44 = &_os_log_default;
    }
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v63 = "outKCVLength && (*outKCVLength >= 3)";
    __int16 v64 = 2048;
    uint64_t v65 = 0;
    __int16 v66 = 2080;
    char v67 = "";
    __int16 v68 = 2080;
    unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v70 = 1024;
    int v71 = 490;
LABEL_81:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_82:
    uint64_t v31 = 265;
    goto LABEL_57;
  }
  uint64_t v18 = sub_100018554();
  if (v18)
  {
    uint64_t v31 = v18;
    uint64_t v46 = (int)v18;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v18, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 494);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      char v47 = __osLogPearlLib;
    }
    else {
      char v47 = &_os_log_default;
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unsigned int v63 = "err == 0 ";
      __int16 v64 = 2048;
      uint64_t v65 = v46;
      __int16 v66 = 2080;
      char v67 = "";
      __int16 v68 = 2080;
      unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v70 = 1024;
      int v71 = 494;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_57;
  }
  v60[0] = @"GetCombined";
  v60[1] = @"StripImg4";
  v61[0] = &__kCFBooleanTrue;
  v61[1] = &__kCFBooleanFalse;
  v60[2] = @"VerifyData";
  v61[2] = &__kCFBooleanFalse;
  uint64_t v19 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];
  __int16 v20 = +[NSMutableDictionary dictionaryWithDictionary:v19];

  if (a1)
  {
    int v21 = +[NSString stringWithFormat:@"%s/%@", a1, @"/System/Library/Caches/com.apple.factorydata"];
    if (v21)
    {
      __int16 v22 = +[NSURL URLWithString:v21];
      if (v22)
      {
        unsigned int v23 = v22;
        [(NSMutableDictionary *)v20 setObject:v22 forKeyedSubscript:@"DataDirectory"];

        goto LABEL_19;
      }
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fileURL", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 511);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib) {
        v56 = __osLogPearlLib;
      }
      else {
        v56 = &_os_log_default;
      }
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
LABEL_203:

        uint64_t v31 = 261;
        goto LABEL_57;
      }
      *(_DWORD *)buf = 136316162;
      unsigned int v63 = "fileURL";
      __int16 v64 = 2048;
      uint64_t v65 = 0;
      __int16 v66 = 2080;
      char v67 = "";
      __int16 v68 = 2080;
      unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v70 = 1024;
      int v71 = 511;
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pathString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 509);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib) {
        v56 = __osLogPearlLib;
      }
      else {
        v56 = &_os_log_default;
      }
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_203;
      }
      *(_DWORD *)buf = 136316162;
      unsigned int v63 = "pathString";
      __int16 v64 = 2048;
      uint64_t v65 = 0;
      __int16 v66 = 2080;
      char v67 = "";
      __int16 v68 = 2080;
      unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v70 = 1024;
      int v71 = 509;
    }
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_203;
  }
LABEL_19:
  __int16 v24 = (void *)AMFDRSealingMapCopyLocalDataForClass();
  fprintf(__stderrp, "%s: Loading PSPC from FDR.\n", "getSavageProvisioningData");
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    unsigned int v25 = __osLogPearlLib;
  }
  else {
    unsigned int v25 = &_os_log_default;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v63 = "getSavageProvisioningData";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Loading PSPC from FDR.\n", buf, 0xCu);
  }
  if (v24)
  {
    fprintf(__stderrp, "%s: PSPC data found.\n", "getSavageProvisioningData");
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v26 = __osLogPearlLib;
    }
    else {
      int v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v63 = "getSavageProvisioningData";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: PSPC data found.\n", buf, 0xCu);
    }
    __int16 v27 = (char *)[v24 length] + 9;
    unsigned __int8 v28 = (char *)calloc((size_t)v27, 1uLL);
    if (v28)
    {
      __int16 v29 = v28;
      unsigned __int8 v57 = v20;
      bzero(v28, (size_t)v27);
      *(_DWORD *)__int16 v29 = 1048579;
      v29[4] = 0;
      *(_DWORD *)(v29 + 5) = [v24 length];
      id v30 = v24;
      memcpy(v29 + 9, [v30 bytes], *(unsigned int *)(v29 + 5));
      uint64_t v31 = sub_100018814(dword_100038D10, 36, 0, v29, (size_t)v27, 0, 0);
      if (v31)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v31, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 535);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
        if (__osLogPearlLib) {
          v50 = __osLogPearlLib;
        }
        else {
          v50 = &_os_log_default;
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          unsigned int v63 = "err == 0 ";
          __int16 v64 = 2048;
          uint64_t v65 = (int)v31;
          __int16 v66 = 2080;
          char v67 = "";
          __int16 v68 = 2080;
          unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v70 = 1024;
          int v71 = 535;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_56;
      }
      fprintf(__stderrp, "%s: PSPC data loaded to SEP.\n", "getSavageProvisioningData");
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        int v32 = __osLogPearlLib;
      }
      else {
        int v32 = &_os_log_default;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        unsigned int v63 = "getSavageProvisioningData";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: PSPC data loaded to SEP.\n", buf, 0xCu);
      }
      if (a7 >= 0xFFFFFFFFFFFFFFB4)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a7 >= 0xFFFFFFFFFFFFFFB4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 541);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
        if (__osLogPearlLib) {
          char v51 = __osLogPearlLib;
        }
        else {
          char v51 = &_os_log_default;
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          unsigned int v63 = "err == 0 ";
          __int16 v64 = 2048;
          uint64_t v65 = a7 >= 0xFFFFFFFFFFFFFFB4;
          __int16 v66 = 2080;
          char v67 = "";
          __int16 v68 = 2080;
          unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v70 = 1024;
          int v71 = 541;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v31 = 1;
      }
      else
      {
        uint64_t v33 = (char *)calloc(a7 + 76, 1uLL);
        if (!v33)
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 544);
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
          if (__osLogPearlLib) {
            long long v52 = __osLogPearlLib;
          }
          else {
            long long v52 = &_os_log_default;
          }
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            unsigned int v63 = "inData";
            __int16 v64 = 2048;
            uint64_t v65 = 0;
            __int16 v66 = 2080;
            char v67 = "";
            __int16 v68 = 2080;
            unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v70 = 1024;
            int v71 = 544;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          uint64_t v31 = 260;
          goto LABEL_56;
        }
        long long v34 = v33;
        long long v35 = *a2;
        long long v36 = a2[1];
        long long v37 = a2[2];
        *((void *)v33 + 6) = *((void *)a2 + 6);
        *((_OWORD *)v33 + 1) = v36;
        *((_OWORD *)v33 + 2) = v37;
        *(_OWORD *)uint64_t v33 = v35;
        *(_OWORD *)(v33 + 56) = *a4;
        memcpy(v33 + 76, a6, a7);
        v34[18] = a7;
        uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
        uint64_t v39 = sub_100018814(dword_100038D10, 2, 0, v34, a7 + 76, &v72, &v59);
        if (v39)
        {
          uint64_t v31 = v39;
          uint64_t v53 = (int)v39;
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v39, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 556);
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          if (__osLogPearlLib) {
            int v54 = __osLogPearlLib;
          }
          else {
            int v54 = &_os_log_default;
          }
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            unsigned int v63 = "err == 0 ";
            __int16 v64 = 2048;
            uint64_t v65 = v53;
            __int16 v66 = 2080;
            char v67 = "";
            __int16 v68 = 2080;
            unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v70 = 1024;
            int v71 = 556;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else if (v59 == 75)
        {
          *a9 = 56;
          long long v40 = v73;
          *(_OWORD *)a8 = v72;
          *(_OWORD *)(a8 + 16) = v40;
          *(_OWORD *)(a8 + 32) = v74;
          *(void *)(a8 + 48) = *(void *)&v75[0];
          *a11 = 16;
          *a10 = *(_OWORD *)((char *)v75 + 8);
          *a13 = 3;
          *(_WORD *)a12 = WORD4(v75[1]);
          *(unsigned char *)(a12 + 2) = BYTE10(v75[1]);
          fprintf(__stderrp, "%s: Successfully got provisioning data.\n", "getSavageProvisioningData");
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          if (__osLogPearlLib) {
            int v41 = __osLogPearlLib;
          }
          else {
            int v41 = &_os_log_default;
          }
          uint64_t v31 = 0;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            unsigned int v63 = "getSavageProvisioningData";
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: Successfully got provisioning data.\n", buf, 0xCu);
            uint64_t v31 = 0;
          }
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(outData)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 557);
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          if (__osLogPearlLib) {
            char v55 = __osLogPearlLib;
          }
          else {
            char v55 = &_os_log_default;
          }
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            unsigned int v63 = "replySize == sizeof(outData)";
            __int16 v64 = 2048;
            uint64_t v65 = 0;
            __int16 v66 = 2080;
            char v67 = "";
            __int16 v68 = 2080;
            unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v70 = 1024;
            int v71 = 557;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          uint64_t v31 = 261;
        }
        free(v34);
      }
      __int16 v20 = v57;
LABEL_56:
      free(v29);

      goto LABEL_57;
    }
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 525);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      char v49 = __osLogPearlLib;
    }
    else {
      char v49 = &_os_log_default;
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unsigned int v63 = "fdrInput";
      __int16 v64 = 2048;
      uint64_t v65 = 0;
      __int16 v66 = 2080;
      char v67 = "";
      __int16 v68 = 2080;
      unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v70 = 1024;
      int v71 = 525;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    uint64_t v31 = 260;
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pspcData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 519);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      uint64_t v48 = __osLogPearlLib;
    }
    else {
      uint64_t v48 = &_os_log_default;
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unsigned int v63 = "pspcData";
      __int16 v64 = 2048;
      uint64_t v65 = 0;
      __int16 v66 = 2080;
      char v67 = "";
      __int16 v68 = 2080;
      unsigned __int8 v69 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v70 = 1024;
      int v71 = 519;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    uint64_t v31 = 259;
  }
LABEL_57:
  io_connect_t entrysize = v38[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v38[418].io_connect_t entrysize = 0;
  }
  return v31;
}

uint64_t checkSavageProvisioning(_DWORD *a1)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning\n", buf, 2u);
  }
  unsigned __int8 v15 = 0;
  uint64_t v14 = 1;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "provisioningStatus", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 598);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v8 = __osLogPearlLib;
    }
    else {
      uint64_t v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "provisioningStatus";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      int v21 = "";
      __int16 v22 = 2080;
      unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v24 = 1024;
      int v25 = 598;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v6 = 258;
    goto LABEL_53;
  }
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v9 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 601);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    int v21 = "";
    __int16 v22 = 2080;
    unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 601;
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  uint64_t v4 = sub_100018814(dword_100038D10, 11, 0, 0, 0, &v15, &v14);
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v11 = (int)v4;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 604);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    int v21 = "";
    __int16 v22 = 2080;
    unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 604;
    goto LABEL_44;
  }
  if (v14 == 1)
  {
    *a1 = v15;
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning -> %d\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_19;
  }
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(status)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 605);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v12 = __osLogPearlLib;
  }
  else {
    uint64_t v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "replySize == sizeof(status)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    int v21 = "";
    __int16 v22 = 2080;
    unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 605;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  uint64_t v6 = 261;
LABEL_53:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v13 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "checkSavageProvisioning -> %d\n", buf, 8u);
  }
LABEL_19:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t getPearlSelfTestResult(void *a1)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult\n", buf, 2u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outResult", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 626);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v8 = __osLogPearlLib;
    }
    else {
      uint64_t v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "outResult";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      int v21 = "";
      __int16 v22 = 2080;
      unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v24 = 1024;
      int v25 = 626;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v6 = 258;
    goto LABEL_53;
  }
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v9 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 629);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    int v21 = "";
    __int16 v22 = 2080;
    unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 629;
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  uint64_t v14 = 8;
  uint64_t v15 = 0;
  uint64_t v4 = sub_100018814(dword_100038D10, 58, 0, 0, 0, &v15, &v14);
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v11 = (int)v4;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 635);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v10 = __osLogPearlLib;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "err == 0 ";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    int v21 = "";
    __int16 v22 = 2080;
    unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 635;
    goto LABEL_44;
  }
  if (v14 == 8)
  {
    *a1 = v15;
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult -> %d\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_19;
  }
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "size == sizeof(response)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 636);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v12 = __osLogPearlLib;
  }
  else {
    uint64_t v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "size == sizeof(response)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    int v21 = "";
    __int16 v22 = 2080;
    unsigned int v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v24 = 1024;
    int v25 = 636;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  uint64_t v6 = 263;
LABEL_53:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v13 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "getPearlSelfTestResult -> %d\n", buf, 8u);
  }
LABEL_19:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t simulateSelfTestFailure(int a1)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure\n", buf, 2u);
  }
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 658);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = &_os_log_default;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v16 = "err == 0 ";
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2080;
    __int16 v20 = "";
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v23 = 1024;
    int v24 = 658;
    goto LABEL_34;
  }
  v12[0] = -1;
  v12[1] = -1;
  int v13 = -1;
  int v14 = a1;
  uint64_t v4 = sub_100018814(dword_100038D10, 44, 0, v12, 0x18uLL, 0, 0);
  if (!v4)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure -> %d\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  uint64_t v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 664);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v9 = __osLogPearlLib;
  }
  else {
    uint64_t v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v16 = "err == 0 ";
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2080;
    __int16 v20 = "";
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v23 = 1024;
    int v24 = 664;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v11 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "simulateSelfTestFailure -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t checkSecureStreaming()
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    CFDictionaryRef v0 = __osLogPearlLibTrace;
  }
  else {
    CFDictionaryRef v0 = &_os_log_default;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "checkSecureStreaming\n", buf, 2u);
  }
  uint64_t v1 = checkSecureStreamingAndVerifySignatures(0);
  if (v1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 684);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v6 = __osLogPearlLib;
    }
    else {
      uint64_t v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v9 = "err == 0 ";
      __int16 v10 = 2048;
      uint64_t v11 = (int)v1;
      __int16 v12 = 2080;
      int v13 = "";
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v16 = 1024;
      int v17 = 684;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v7 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v9) = v1;
      uint64_t v3 = v7;
      os_log_type_t v4 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      io_object_t v2 = __osLogPearlLibTrace;
    }
    else {
      io_object_t v2 = &_os_log_default;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v9) = 0;
      uint64_t v3 = v2;
      os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "checkSecureStreaming -> %d\n", buf, 8u);
    }
  }
  return v1;
}

uint64_t checkSecureStreamingAndVerifySignatures(int a1)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures (%u)\n", buf, 8u);
  }
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 703);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = &_os_log_default;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    int v13 = "err == 0 ";
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2080;
    int v17 = "";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v20 = 1024;
    int v21 = 703;
    goto LABEL_34;
  }
  uint64_t v4 = sub_100018814(dword_100038D10, 59, a1, 0, 0, 0, 0);
  if (!v4)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  uint64_t v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 706);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v9 = __osLogPearlLib;
  }
  else {
    uint64_t v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    int v13 = "err == 0 ";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2080;
    int v17 = "";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v20 = 1024;
    int v21 = 706;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v11 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t prewarmCamera(int a1)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "prewarmCamera (%u)\n", buf, 8u);
  }
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 726);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = &_os_log_default;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    int v13 = "err == 0 ";
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2080;
    int v17 = "";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v20 = 1024;
    int v21 = 726;
    goto LABEL_34;
  }
  uint64_t v4 = sub_100018814(dword_100038D10, 43, a1, 0, 0, 0, 0);
  if (!v4)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prewarmCamera -> %d\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  uint64_t v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 729);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v9 = __osLogPearlLib;
  }
  else {
    uint64_t v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    int v13 = "err == 0 ";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2080;
    int v17 = "";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v20 = 1024;
    int v21 = 729;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v11 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "prewarmCamera -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t setEntitlementOverride(int a1)
{
  int v12 = a1;
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig (0x%x)\n", buf, 8u);
  }
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 749);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = &_os_log_default;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 749;
    goto LABEL_34;
  }
  uint64_t v4 = sub_100018814(dword_100038D10, 64, 0, &v12, 4uLL, 0, 0);
  if (!v4)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  uint64_t v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 752);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v9 = __osLogPearlLib;
  }
  else {
    uint64_t v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v14 = "err == 0 ";
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2080;
    __int16 v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v21 = 1024;
    int v22 = 752;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v11 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t pearlSeaCookieHandleMessage(int a1, const void *a2, size_t a3, void *a4, void *a5, id a6)
{
  id v41 = a6;
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  uint64_t v11 = &OBJC_INSTANCE_METHODS_NSObject;
  if (__osLogPearlLibTrace) {
    int v12 = __osLogPearlLibTrace;
  }
  else {
    int v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)id v43 = a1;
    *(_WORD *)&v43[4] = 2048;
    *(void *)&v43[6] = a2;
    *(_WORD *)&v43[14] = 2048;
    *(void *)&v43[16] = a3;
    *(_WORD *)&v43[24] = 2048;
    *(void *)&v43[26] = a4;
    *(_WORD *)&v43[34] = 2048;
    *(void *)&v43[36] = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  if (a1 && a1 != 7)
  {
    if (!a2)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 776);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
      __int16 v20 = v41;
      if (__osLogPearlLib) {
        __int16 v29 = __osLogPearlLib;
      }
      else {
        __int16 v29 = &_os_log_default;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_110;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)id v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 776;
      goto LABEL_109;
    }
    if (!a3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 777);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        long long v40 = __osLogPearlLib;
      }
      else {
        long long v40 = &_os_log_default;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)id v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize";
        *(_WORD *)&v43[8] = 2048;
        *(void *)&v43[10] = 0;
        *(_WORD *)&v43[18] = 2080;
        *(void *)&v43[20] = "";
        *(_WORD *)&v43[28] = 2080;
        *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v43[38] = 1024;
        *(_DWORD *)&v43[40] = 777;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      __int16 v17 = 0;
      uint64_t v26 = 258;
      goto LABEL_71;
    }
  }
  if (a1 != 8 && !a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 778);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
    __int16 v20 = v41;
    if (__osLogPearlLib) {
      __int16 v29 = __osLogPearlLib;
    }
    else {
      __int16 v29 = &_os_log_default;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 778;
    goto LABEL_109;
  }
  if (a1 != 8 && !a5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 779);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
    __int16 v20 = v41;
    if (__osLogPearlLib) {
      __int16 v29 = __osLogPearlLib;
    }
    else {
      __int16 v29 = &_os_log_default;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 779;
LABEL_109:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_110:
    __int16 v17 = 0;
    uint64_t v26 = 258;
    goto LABEL_129;
  }
  if (a5) {
    uint64_t v13 = *a5;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_100018554();
  if (v14)
  {
    uint64_t v26 = v14;
    uint64_t v30 = (int)v14;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 786);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v31 = __osLogPearlLib;
    }
    else {
      uint64_t v31 = &_os_log_default;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = v30;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 786;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v17 = 0;
LABEL_71:
    __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_119:
    __int16 v20 = v41;
    goto LABEL_129;
  }
  size_t v15 = a3 + 13;
  if (a3 >= 0xFFFFFFFFFFFFFFF3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a3 >= 0xFFFFFFFFFFFFFFF3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 789);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
    uint64_t v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      int v32 = __osLogPearlLib;
    }
    else {
      int v32 = &_os_log_default;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = a3 >= 0xFFFFFFFFFFFFFFF3;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 789;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v17 = 0;
    uint64_t v26 = 1;
    goto LABEL_119;
  }
  uint64_t v16 = (char *)malloc(a3 + 13);
  if (!v16)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 792);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
    uint64_t v11 = &OBJC_INSTANCE_METHODS_NSObject;
    uint64_t v26 = 3758097085;
    if (__osLogPearlLib) {
      uint64_t v33 = __osLogPearlLib;
    }
    else {
      uint64_t v33 = &_os_log_default;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v43 = "inData";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 792;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    __int16 v17 = 0;
    goto LABEL_119;
  }
  __int16 v17 = v16;
  *(_DWORD *)uint64_t v16 = a1;
  v16[4] = 1;
  *(void *)(v16 + 5) = a3;
  memcpy(v16 + 13, a2, a3);
  __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
  uint64_t v19 = sub_100018814(dword_100038D10, 70, 0, v17, a3 + 13, a4, a5);
  if (v19)
  {
    uint64_t v26 = v19;
    uint64_t v34 = (int)v19;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v19, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 800);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      long long v35 = __osLogPearlLib;
    }
    else {
      long long v35 = &_os_log_default;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = v34;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 800;
    goto LABEL_127;
  }
  __int16 v20 = v41;
  if (a1 == 2) {
    goto LABEL_27;
  }
  if (a1 != 5) {
    goto LABEL_28;
  }
  if (!v41)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "callback", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 804);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    uint64_t v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      long long v37 = __osLogPearlLib;
    }
    else {
      long long v37 = &_os_log_default;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v43 = "callback";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 804;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v26 = 258;
    goto LABEL_119;
  }
  uint64_t v21 = (*((uint64_t (**)(id, void, void *, void))v41 + 2))(v41, 0, a4, *a5);
  if (!v21)
  {
LABEL_27:
    v17[4] = 0;
    *a5 = v13;
    uint64_t v22 = sub_100018814(dword_100038D10, 70, 0, v17, v15, a4, a5);
    if (!v22)
    {
LABEL_28:
      if (a4 && a5)
      {
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          __int16 v23 = __osLogPearlLib;
        }
        else {
          __int16 v23 = &_os_log_default;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *a5;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)id v43 = a1;
          *(_WORD *)&v43[4] = 2048;
          *(void *)&v43[6] = v24;
          *(_WORD *)&v43[14] = 1040;
          *(_DWORD *)&v43[16] = v24;
          *(_WORD *)&v43[20] = 2096;
          *(void *)&v43[22] = a4;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
        }
      }
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLibTrace) {
        int v25 = __osLogPearlLibTrace;
      }
      else {
        int v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v43 = a1;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
      }
      uint64_t v26 = 0;
LABEL_45:
      free(v17);
      goto LABEL_46;
    }
    uint64_t v26 = v22;
    uint64_t v36 = (int)v22;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v22, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 814);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      long long v35 = __osLogPearlLib;
    }
    else {
      long long v35 = &_os_log_default;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)id v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = v36;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 814;
    goto LABEL_127;
  }
  uint64_t v26 = v21;
  uint64_t v38 = (int)v21;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v21, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 807);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    long long v35 = __osLogPearlLib;
  }
  else {
    long long v35 = &_os_log_default;
  }
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_128;
  }
  *(_DWORD *)buf = 136316162;
  *(void *)id v43 = "err == 0 ";
  *(_WORD *)&v43[8] = 2048;
  *(void *)&v43[10] = v38;
  *(_WORD *)&v43[18] = 2080;
  *(void *)&v43[20] = "";
  *(_WORD *)&v43[28] = 2080;
  *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
  *(_WORD *)&v43[38] = 1024;
  *(_DWORD *)&v43[40] = 807;
LABEL_127:
  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_128:
  __int16 v18 = &OBJC_INSTANCE_METHODS_NSObject;
  __int16 v20 = v41;
  uint64_t v11 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_129:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (v11[420]) {
    uint64_t v39 = v11[420];
  }
  else {
    uint64_t v39 = &_os_log_default;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v43 = a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
  }
  if (v17) {
    goto LABEL_45;
  }
LABEL_46:
  io_connect_t entrysize = v18[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v18[418].io_connect_t entrysize = 0;
  }

  return v26;
}

uint64_t mapScheme3ObjectToISPANE(int *a1)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    io_object_t v2 = __osLogPearlLibTrace;
  }
  else {
    io_object_t v2 = &_os_log_default;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)size_t v15 = 4;
    *(_WORD *)&v15[4] = 2080;
    *(void *)&v15[6] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "mapScheme3Object: fourcc:%.4s\n\n", buf, 0x12u);
  }
  int v12 = *a1;
  char v13 = *((unsigned char *)a1 + 4);
  uint64_t v3 = sub_100018554();
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 842);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v9 = __osLogPearlLib;
    }
    else {
      uint64_t v9 = &_os_log_default;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)size_t v15 = "err == 0 ";
    *(_WORD *)&v15[8] = 2048;
    *(void *)&v15[10] = v8;
    __int16 v16 = 2080;
    __int16 v17 = "";
    __int16 v18 = 2080;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v20 = 1024;
    int v21 = 842;
    goto LABEL_34;
  }
  uint64_t v4 = sub_100018814(dword_100038D10, 72, 0, &v12, 5uLL, 0, 0);
  if (!v4)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v5 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    uint64_t v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)size_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mapScheme3Object -> 0x%x\n", buf, 8u);
      uint64_t v6 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  uint64_t v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 845);
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLib) {
    uint64_t v9 = __osLogPearlLib;
  }
  else {
    uint64_t v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)size_t v15 = "err == 0 ";
    *(_WORD *)&v15[8] = 2048;
    *(void *)&v15[10] = v10;
    __int16 v16 = 2080;
    __int16 v17 = "";
    __int16 v18 = 2080;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v20 = 1024;
    int v21 = 845;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v11 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v11 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)size_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "mapScheme3Object -> 0x%x\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t allocateAndMapObjectS3C1(int *a1, int a2, int a3)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  uint64_t v6 = &OBJC_INSTANCE_METHODS_NSObject;
  if (__osLogPearlLibTrace) {
    uint64_t v7 = (void *)__osLogPearlLibTrace;
  }
  else {
    uint64_t v7 = &_os_log_default;
  }
  uint64_t v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68158466;
    *(_DWORD *)v90 = 4;
    *(_WORD *)&v90[4] = 2080;
    *(void *)&v90[6] = a1;
    *(_WORD *)&v90[14] = 1024;
    *(_DWORD *)&v90[16] = a2;
    LOWORD(v91) = 1024;
    *(_DWORD *)((char *)&v91 + 2) = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1: fourcc:%.4s mapObj:%d unmapObj:%d\n\n", buf, 0x1Eu);
  }

  *(void *)v88 = 0;
  *(void *)&v88[8] = 0;
  *(_DWORD *)&v88[15] = 0;
  int v84 = *a1;
  char v85 = *((unsigned char *)a1 + 4);
  char v86 = a2;
  char v87 = a3;
  unint64_t v83 = 19;
  uint64_t v9 = sub_100018554();
  uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v78 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 873);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      char v79 = __osLogPearlLib;
    }
    else {
      char v79 = &_os_log_default;
    }
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v90 = "err == 0 ";
      *(_WORD *)&v90[8] = 2048;
      *(void *)&v90[10] = v78;
      *(_WORD *)&v90[18] = 2080;
      char v91 = "";
      __int16 v92 = 2080;
      char v93 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v94 = 1024;
      int v95 = 873;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_177;
  }
  uint64_t v11 = sub_100018814(dword_100038D10, 82, 0, &v84, 7uLL, v88, &v83);
  if (v11 != -536870201)
  {
    uint64_t v12 = v11;
    if (v11)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 877);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        unsigned int v80 = (void *)__osLogPearlLib;
      }
      else {
        unsigned int v80 = &_os_log_default;
      }
      uint64_t v81 = v80;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v90 = "err == 0 ";
        *(_WORD *)&v90[8] = 2048;
        *(void *)&v90[10] = (int)v12;
        *(_WORD *)&v90[18] = 2080;
        char v91 = "";
        __int16 v92 = 2080;
        char v93 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v94 = 1024;
        int v95 = 877;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      uint64_t v6 = &OBJC_INSTANCE_METHODS_NSObject;
    }
    if (v83 <= 0x12)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 879);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib) {
        uint64_t v82 = __osLogPearlLib;
      }
      else {
        uint64_t v82 = &_os_log_default;
      }
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v90 = "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)";
        *(_WORD *)&v90[8] = 2048;
        *(void *)&v90[10] = 0;
        *(_WORD *)&v90[18] = 2080;
        char v91 = "";
        __int16 v92 = 2080;
        char v93 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v94 = 1024;
        int v95 = 879;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v12 = 3758097090;
    }
    else
    {
      fwrite("Results of Allocation and Mapping Object Scheme3 Context1:\n", 0x3BuLL, 1uLL, __stderrp);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        char v13 = (void *)__osLogPearlLib;
      }
      else {
        char v13 = &_os_log_default;
      }
      uint64_t v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Results of Allocation and Mapping Object Scheme3 Context1:\n", buf, 2u);
      }

      if (v88[0]) {
        size_t v15 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        size_t v15 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "objectFound:\t\t%s\n", v15);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        __int16 v16 = (void *)__osLogPearlLib;
      }
      else {
        __int16 v16 = &_os_log_default;
      }
      __int16 v17 = v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[0]) {
          __int16 v18 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          __int16 v18 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "objectFound:\t\t%s\n", buf, 0xCu);
      }

      fprintf(__stderrp, "dvaOffset:\t\t0x%X\n", *(_DWORD *)&v88[1]);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v19 = (void *)__osLogPearlLib;
      }
      else {
        uint64_t v19 = &_os_log_default;
      }
      __int16 v20 = v19;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v90 = *(_DWORD *)&v88[1];
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "dvaOffset:\t\t0x%X\n", buf, 8u);
      }

      fprintf(__stderrp, "objectSize:\t\t%d\n", *(_DWORD *)&v88[5]);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        int v21 = (void *)__osLogPearlLib;
      }
      else {
        int v21 = &_os_log_default;
      }
      uint64_t v22 = v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v90 = *(_DWORD *)&v88[5];
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "objectSize:\t\t%d\n", buf, 8u);
      }

      if (v88[9]) {
        __int16 v23 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        __int16 v23 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "aneMapFunction:\t\t%s\n", v23);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v24 = (void *)__osLogPearlLib;
      }
      else {
        uint64_t v24 = &_os_log_default;
      }
      int v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[9]) {
          uint64_t v26 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v26 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "aneMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v88[10]) {
        __int16 v27 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        __int16 v27 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "ispMapFunction:\t\t%s\n", v27);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        unsigned __int8 v28 = (void *)__osLogPearlLib;
      }
      else {
        unsigned __int8 v28 = &_os_log_default;
      }
      __int16 v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[10]) {
          uint64_t v30 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v30 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "ispMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v88[11]) {
        uint64_t v31 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        uint64_t v31 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "aneUnmapFunction:\t%s\n", v31);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        int v32 = (void *)__osLogPearlLib;
      }
      else {
        int v32 = &_os_log_default;
      }
      uint64_t v33 = v32;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[11]) {
          uint64_t v34 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v34 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "aneUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v88[12]) {
        long long v35 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        long long v35 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "ispUnmapFunction:\t%s\n", v35);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v36 = (void *)__osLogPearlLib;
      }
      else {
        uint64_t v36 = &_os_log_default;
      }
      long long v37 = v36;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[12]) {
          uint64_t v38 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v38 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "ispUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v88[13]) {
        uint64_t v39 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        uint64_t v39 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "mappedToSEP:\t\t%s\n", v39);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        long long v40 = (void *)__osLogPearlLib;
      }
      else {
        long long v40 = &_os_log_default;
      }
      id v41 = v40;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[13]) {
          uint64_t v42 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v42 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "mappedToSEP:\t\t%s\n", buf, 0xCu);
      }

      if (v88[14]) {
        id v43 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        id v43 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "mappedToANE:\t\t%s\n", v43);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        long long v44 = (void *)__osLogPearlLib;
      }
      else {
        long long v44 = &_os_log_default;
      }
      unsigned int v45 = v44;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[14]) {
          uint64_t v46 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v46 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "mappedToANE:\t\t%s\n", buf, 0xCu);
      }

      if (v88[15]) {
        char v47 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        char v47 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "mappedToISP:\t\t%s\n", v47);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v48 = (void *)__osLogPearlLib;
      }
      else {
        uint64_t v48 = &_os_log_default;
      }
      char v49 = v48;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[15]) {
          v50 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          v50 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "mappedToISP:\t\t%s\n", buf, 0xCu);
      }

      if (v88[18]) {
        char v51 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        char v51 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "unmappedFromISP:\t%s\n", v51);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        long long v52 = (void *)__osLogPearlLib;
      }
      else {
        long long v52 = &_os_log_default;
      }
      uint64_t v53 = v52;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[18]) {
          int v54 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          int v54 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "unmappedFromISP:\t%s\n", buf, 0xCu);
      }

      if (v88[17]) {
        char v55 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        char v55 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "unmappedFromANE:\t%s\n", v55);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        v56 = (void *)__osLogPearlLib;
      }
      else {
        v56 = &_os_log_default;
      }
      unsigned __int8 v57 = v56;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[17]) {
          uint64_t v58 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v58 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v58;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "unmappedFromANE:\t%s\n", buf, 0xCu);
      }

      if (v88[16]) {
        uint64_t v59 = "\x1B[32mSUCCESS\x1B[0m";
      }
      else {
        uint64_t v59 = "\x1B[31mFAIL\x1B[0m";
      }
      fprintf(__stderrp, "unmappedFromSEP:\t%s\n", v59);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib) {
        unsigned int v60 = (void *)__osLogPearlLib;
      }
      else {
        unsigned int v60 = &_os_log_default;
      }
      int v61 = v60;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[16]) {
          uint64_t v62 = "\x1B[32mSUCCESS\x1B[0m";
        }
        else {
          uint64_t v62 = "\x1B[31mFAIL\x1B[0m";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v90 = v62;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "unmappedFromSEP:\t%s\n", buf, 0xCu);
      }

      uint64_t v6 = &OBJC_INSTANCE_METHODS_NSObject;
      if (!v12)
      {
        if (v88[9]) {
          BOOL v65 = v88[10] == 0;
        }
        else {
          BOOL v65 = 1;
        }
        BOOL v68 = v65 || v88[13] == 0 || v88[14] == 0 || v88[15] == 0;
        int v69 = a2 ^ 1;
        if (!v68) {
          int v69 = 1;
        }
        if (v88[11]) {
          BOOL v70 = v88[12] == 0;
        }
        else {
          BOOL v70 = 1;
        }
        BOOL v73 = v70 || v88[16] == 0 || v88[17] == 0 || v88[18] == 0;
        char v74 = a3 ^ 1;
        if (!v73) {
          char v74 = 1;
        }
        uint64_t v12 = 261;
        if (v69 == 1 && (v74 & 1) != 0) {
          goto LABEL_214;
        }
      }
    }
LABEL_177:
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (v6[420]) {
      unsigned int v63 = (void *)v6[420];
    }
    else {
      unsigned int v63 = &_os_log_default;
    }
    __int16 v64 = v63;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v90 = v12;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
    }
    goto LABEL_222;
  }
LABEL_214:
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    char v75 = (void *)__osLogPearlLibTrace;
  }
  else {
    char v75 = &_os_log_default;
  }
  __int16 v64 = v75;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v90 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
  }
  uint64_t v12 = 0;
LABEL_222:

  io_connect_t entrysize = v10[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v10[418].io_connect_t entrysize = 0;
  }
  return v12;
}

uint64_t getBrunorCollectionKey(void *a1, void *a2)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v4 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getBrunorCollectionKey\n", buf, 2u);
  }
  uint64_t v22 = 65;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 928);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      size_t v15 = __osLogPearlLib;
    }
    else {
      size_t v15 = &_os_log_default;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v24 = "collectionKey";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2080;
    unsigned __int8 v28 = "";
    __int16 v29 = 2080;
    uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 928;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 929);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      size_t v15 = __osLogPearlLib;
    }
    else {
      size_t v15 = &_os_log_default;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v24 = "collectionKeyLength";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2080;
    unsigned __int8 v28 = "";
    __int16 v29 = 2080;
    uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v31 = 1024;
    int v32 = 929;
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    uint64_t v9 = 258;
    goto LABEL_15;
  }
  uint64_t v5 = sub_100018554();
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v16 = (int)v5;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 932);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v17 = __osLogPearlLib;
    }
    else {
      __int16 v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = "err == 0 ";
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2080;
      unsigned __int8 v28 = "";
      __int16 v29 = 2080;
      uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v31 = 1024;
      int v32 = 932;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = calloc(1uLL, 0x41uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100018814(dword_100038D10, 73, 0, 0, 0, v6, &v22);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v19 = (int)v8;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 938);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          __int16 v20 = __osLogPearlLib;
        }
        else {
          __int16 v20 = &_os_log_default;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = "err == 0 ";
          __int16 v25 = 2048;
          uint64_t v26 = v19;
          __int16 v27 = 2080;
          unsigned __int8 v28 = "";
          __int16 v29 = 2080;
          uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v31 = 1024;
          int v32 = 938;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        if (v22 == 65)
        {
          uint64_t v9 = 0;
          *a1 = v7;
          *a2 = 65;
          goto LABEL_15;
        }
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 939);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          int v21 = __osLogPearlLib;
        }
        else {
          int v21 = &_os_log_default;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)";
          __int16 v25 = 2048;
          uint64_t v26 = 0;
          __int16 v27 = 2080;
          unsigned __int8 v28 = "";
          __int16 v29 = 2080;
          uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v31 = 1024;
          int v32 = 939;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v9 = 261;
      }
      free(v7);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 935);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        __int16 v18 = __osLogPearlLib;
      }
      else {
        __int16 v18 = &_os_log_default;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = "reply";
        __int16 v25 = 2048;
        uint64_t v26 = 0;
        __int16 v27 = 2080;
        unsigned __int8 v28 = "";
        __int16 v29 = 2080;
        uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v31 = 1024;
        int v32 = 935;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v9 = 260;
    }
  }
LABEL_15:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v9)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v10 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v9;
      uint64_t v11 = v10;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "getBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      char v13 = __osLogPearlLibTrace;
    }
    else {
      char v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0;
      uint64_t v11 = v13;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v9;
}

uint64_t getAttestationToBrunorCollectionKey(void *a1, size_t *a2)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v4 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAttestationToBrunorCollectionKey\n", buf, 2u);
  }
  size_t __size = 0x4000;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 966);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v16 = __osLogPearlLib;
    }
    else {
      uint64_t v16 = &_os_log_default;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = "attestation";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    uint64_t v30 = "";
    __int16 v31 = 2080;
    int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    int v34 = 966;
    goto LABEL_50;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestationLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 967);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v16 = __osLogPearlLib;
    }
    else {
      uint64_t v16 = &_os_log_default;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = "attestationLength";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    uint64_t v30 = "";
    __int16 v31 = 2080;
    int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    int v34 = 967;
LABEL_50:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_51:
    uint64_t v10 = 258;
    goto LABEL_17;
  }
  uint64_t v5 = sub_100018554();
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v17 = (int)v5;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 970);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = "err == 0 ";
      __int16 v27 = 2048;
      uint64_t v28 = v17;
      __int16 v29 = 2080;
      uint64_t v30 = "";
      __int16 v31 = 2080;
      int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v33 = 1024;
      int v34 = 970;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = calloc(1uLL, 0x4000uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100018814(dword_100038D10, 74, 0, 0, 0, v6, &__size);
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v20 = (int)v8;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 976);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          int v21 = __osLogPearlLib;
        }
        else {
          int v21 = &_os_log_default;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v26 = "err == 0 ";
          __int16 v27 = 2048;
          uint64_t v28 = v20;
          __int16 v29 = 2080;
          uint64_t v30 = "";
          __int16 v31 = 2080;
          int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v33 = 1024;
          int v34 = 976;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else if (__size > 0x4000)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= (16 * 1024)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 977);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          uint64_t v22 = __osLogPearlLib;
        }
        else {
          uint64_t v22 = &_os_log_default;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v26 = "replySize <= (16 * 1024)";
          __int16 v27 = 2048;
          uint64_t v28 = 0;
          __int16 v29 = 2080;
          uint64_t v30 = "";
          __int16 v31 = 2080;
          int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v33 = 1024;
          int v34 = 977;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v10 = 261;
      }
      else
      {
        uint64_t v9 = calloc(1uLL, __size);
        *a1 = v9;
        if (v9)
        {
          memcpy(v9, v7, __size);
          uint64_t v10 = 0;
          *a2 = __size;
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 980);
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          if (__osLogPearlLib) {
            __int16 v23 = __osLogPearlLib;
          }
          else {
            __int16 v23 = &_os_log_default;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v26 = "*attestation";
            __int16 v27 = 2048;
            uint64_t v28 = 0;
            __int16 v29 = 2080;
            uint64_t v30 = "";
            __int16 v31 = 2080;
            int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v33 = 1024;
            int v34 = 980;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          uint64_t v10 = 260;
        }
      }
      free(v7);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 973);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v19 = __osLogPearlLib;
      }
      else {
        uint64_t v19 = &_os_log_default;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = "reply";
        __int16 v27 = 2048;
        uint64_t v28 = 0;
        __int16 v29 = 2080;
        uint64_t v30 = "";
        __int16 v31 = 2080;
        int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v33 = 1024;
        int v34 = 973;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v10 = 260;
    }
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v10)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v11 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v10;
      os_log_type_t v12 = v11;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "getAttestationToBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v14 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 0;
      os_log_type_t v12 = v14;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v10;
}

uint64_t signDataWithBrunorCollectionKey(const void *a1, size_t a2, void *a3, size_t *a4)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v8 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorCollectionKey\n", buf, 2u);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  *(_OWORD *)buf = 0u;
  size_t __size = 128;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1005);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v26 = 136316162;
    __int16 v27 = "data";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1005;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1006);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v26 = 136316162;
    __int16 v27 = "dataLength";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1006;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1007);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v26 = 136316162;
    __int16 v27 = "signature";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1007;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1008);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)uint64_t v26 = 136316162;
    __int16 v27 = "signatureLength";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1008;
LABEL_64:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
LABEL_65:
    uint64_t v13 = 258;
    goto LABEL_17;
  }
  uint64_t v9 = sub_100018554();
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v20 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1011);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v26 = 136316162;
      __int16 v27 = "err == 0 ";
      __int16 v28 = 2048;
      uint64_t v29 = v20;
      __int16 v30 = 2080;
      __int16 v31 = "";
      __int16 v32 = 2080;
      __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      int v35 = 1011;
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
    }
  }
  else
  {
    uint64_t v10 = sub_100018814(dword_100038D10, 75, 0, a1, a2, buf, &__size);
    if (!v10)
    {
      if (__size >= 0x81)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1015);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          __int16 v23 = __osLogPearlLib;
        }
        else {
          __int16 v23 = &_os_log_default;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v26 = 136316162;
          __int16 v27 = "replySize <= sizeof(reply)";
          __int16 v28 = 2048;
          uint64_t v29 = 0;
          __int16 v30 = 2080;
          __int16 v31 = "";
          __int16 v32 = 2080;
          __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v34 = 1024;
          int v35 = 1015;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
        }
        uint64_t v13 = 261;
      }
      else
      {
        uint64_t v11 = calloc(1uLL, __size);
        *a3 = v11;
        if (v11)
        {
          size_t v12 = __size;
          *a4 = __size;
          memcpy(v11, buf, v12);
          uint64_t v13 = 0;
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1018);
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          if (__osLogPearlLib) {
            uint64_t v24 = __osLogPearlLib;
          }
          else {
            uint64_t v24 = &_os_log_default;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v26 = 136316162;
            __int16 v27 = "*signature";
            __int16 v28 = 2048;
            uint64_t v29 = 0;
            __int16 v30 = 2080;
            __int16 v31 = "";
            __int16 v32 = 2080;
            __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v34 = 1024;
            int v35 = 1018;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
          }
          uint64_t v13 = 260;
        }
      }
      goto LABEL_17;
    }
    uint64_t v13 = v10;
    uint64_t v22 = (int)v10;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1014);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v26 = 136316162;
      __int16 v27 = "err == 0 ";
      __int16 v28 = 2048;
      uint64_t v29 = v22;
      __int16 v30 = 2080;
      __int16 v31 = "";
      __int16 v32 = 2080;
      __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      int v35 = 1014;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v13)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v14 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v26 = 67109120;
      LODWORD(v27) = v13;
      size_t v15 = v14;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "signDataWithBrunorCollectionKey -> %d\n", v26, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v17 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v26 = 67109120;
      LODWORD(v27) = 0;
      size_t v15 = v17;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v13;
}

uint64_t getBrunorPermanentKey(void *a1, unint64_t *a2)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v4 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getBrunorPermanentKey\n", buf, 2u);
  }
  unint64_t v23 = 57;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1040);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      os_log_type_t v16 = __osLogPearlLib;
    }
    else {
      os_log_type_t v16 = &_os_log_default;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "permanentKey";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 1040;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1041);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      os_log_type_t v16 = __osLogPearlLib;
    }
    else {
      os_log_type_t v16 = &_os_log_default;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "permanentKeyLength";
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    uint64_t v29 = "";
    __int16 v30 = 2080;
    __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v32 = 1024;
    int v33 = 1041;
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    uint64_t v10 = 258;
    goto LABEL_15;
  }
  uint64_t v5 = sub_100018554();
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v17 = (int)v5;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1044);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      __int16 v18 = __osLogPearlLib;
    }
    else {
      __int16 v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v25 = "err == 0 ";
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      __int16 v28 = 2080;
      uint64_t v29 = "";
      __int16 v30 = 2080;
      __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v32 = 1024;
      int v33 = 1044;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = calloc(1uLL, 0x39uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100018814(dword_100038D10, 76, 0, 0, 0, v6, &v23);
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v20 = (int)v8;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1050);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          int v21 = __osLogPearlLib;
        }
        else {
          int v21 = &_os_log_default;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v25 = "err == 0 ";
          __int16 v26 = 2048;
          uint64_t v27 = v20;
          __int16 v28 = 2080;
          uint64_t v29 = "";
          __int16 v30 = 2080;
          __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v32 = 1024;
          int v33 = 1050;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        unint64_t v9 = v23;
        if (v23 < 0x3A)
        {
          uint64_t v10 = 0;
          *a1 = v7;
          *a2 = v9;
          goto LABEL_15;
        }
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1051);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          uint64_t v22 = __osLogPearlLib;
        }
        else {
          uint64_t v22 = &_os_log_default;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v25 = "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)";
          __int16 v26 = 2048;
          uint64_t v27 = 0;
          __int16 v28 = 2080;
          uint64_t v29 = "";
          __int16 v30 = 2080;
          __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v32 = 1024;
          int v33 = 1051;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v10 = 261;
      }
      free(v7);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1047);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v19 = __osLogPearlLib;
      }
      else {
        uint64_t v19 = &_os_log_default;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        __int16 v25 = "reply";
        __int16 v26 = 2048;
        uint64_t v27 = 0;
        __int16 v28 = 2080;
        uint64_t v29 = "";
        __int16 v30 = 2080;
        __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v32 = 1024;
        int v33 = 1047;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v10 = 260;
    }
  }
LABEL_15:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v10)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v11 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v10;
      size_t v12 = v11;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "getBrunorPermanentKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v14 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      size_t v12 = v14;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v10;
}

uint64_t signDataWithBrunorPermanentKey(const void *a1, size_t a2, void *a3, size_t *a4)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v8 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorPermanentKey\n", buf, 2u);
  }
  char v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)buf = 0u;
  long long v37 = 0u;
  size_t __size = 65;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1079);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v26 = 136316162;
    uint64_t v27 = "data";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1079;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1080);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v26 = 136316162;
    uint64_t v27 = "dataLength";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1080;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1081);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v26 = 136316162;
    uint64_t v27 = "signature";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1081;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1082);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v19 = __osLogPearlLib;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)__int16 v26 = 136316162;
    uint64_t v27 = "signatureLength";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    __int16 v31 = "";
    __int16 v32 = 2080;
    int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v34 = 1024;
    int v35 = 1082;
LABEL_64:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
LABEL_65:
    uint64_t v13 = 258;
    goto LABEL_17;
  }
  uint64_t v9 = sub_100018554();
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v20 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1085);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v26 = 136316162;
      uint64_t v27 = "err == 0 ";
      __int16 v28 = 2048;
      uint64_t v29 = v20;
      __int16 v30 = 2080;
      __int16 v31 = "";
      __int16 v32 = 2080;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      int v35 = 1085;
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
    }
  }
  else
  {
    uint64_t v10 = sub_100018814(dword_100038D10, 77, 0, a1, a2, buf, &__size);
    if (!v10)
    {
      if (__size >= 0x42)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1089);
        if (qword_100038D18 != -1) {
          dispatch_once(&qword_100038D18, &stru_100030C50);
        }
        if (__osLogPearlLib) {
          unint64_t v23 = __osLogPearlLib;
        }
        else {
          unint64_t v23 = &_os_log_default;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v26 = 136316162;
          uint64_t v27 = "replySize <= sizeof(reply)";
          __int16 v28 = 2048;
          uint64_t v29 = 0;
          __int16 v30 = 2080;
          __int16 v31 = "";
          __int16 v32 = 2080;
          int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          __int16 v34 = 1024;
          int v35 = 1089;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
        }
        uint64_t v13 = 261;
      }
      else
      {
        uint64_t v11 = calloc(1uLL, __size);
        *a3 = v11;
        if (v11)
        {
          size_t v12 = __size;
          *a4 = __size;
          memcpy(v11, buf, v12);
          uint64_t v13 = 0;
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1092);
          if (qword_100038D18 != -1) {
            dispatch_once(&qword_100038D18, &stru_100030C50);
          }
          if (__osLogPearlLib) {
            uint64_t v24 = __osLogPearlLib;
          }
          else {
            uint64_t v24 = &_os_log_default;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v26 = 136316162;
            uint64_t v27 = "*signature";
            __int16 v28 = 2048;
            uint64_t v29 = 0;
            __int16 v30 = 2080;
            __int16 v31 = "";
            __int16 v32 = 2080;
            int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            __int16 v34 = 1024;
            int v35 = 1092;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
          }
          uint64_t v13 = 260;
        }
      }
      goto LABEL_17;
    }
    uint64_t v13 = v10;
    uint64_t v22 = (int)v10;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1088);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v26 = 136316162;
      uint64_t v27 = "err == 0 ";
      __int16 v28 = 2048;
      uint64_t v29 = v22;
      __int16 v30 = 2080;
      __int16 v31 = "";
      __int16 v32 = 2080;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v34 = 1024;
      int v35 = 1088;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v13)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v14 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v26 = 67109120;
      LODWORD(v27) = v13;
      size_t v15 = v14;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "signDataWithBrunorPermanentKey -> %d\n", v26, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v17 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v26 = 67109120;
      LODWORD(v27) = 0;
      size_t v15 = v17;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v13;
}

uint64_t prepareFDRDataEncryptionKey()
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    CFDictionaryRef v0 = __osLogPearlLibTrace;
  }
  else {
    CFDictionaryRef v0 = &_os_log_default;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "prepareFDRDataEncryptionKey\n", buf, 2u);
  }
  uint64_t v1 = sub_100018554();
  if (v1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1112);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      uint64_t v8 = __osLogPearlLib;
    }
    else {
      uint64_t v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = "err == 0 ";
      __int16 v14 = 2048;
      uint64_t v15 = (int)v1;
      __int16 v16 = 2080;
      uint64_t v17 = "";
      __int16 v18 = 2080;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v20 = 1024;
      int v21 = 1112;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v2 = sub_100018814(dword_100038D10, 78, 0, 0, 0, 0, 0);
    if (v2)
    {
      uint64_t v9 = v2;
      uint64_t v10 = (int)v2;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v2, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1115);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v11 = __osLogPearlLib;
      }
      else {
        uint64_t v11 = &_os_log_default;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = "err == 0 ";
        __int16 v14 = 2048;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "";
        __int16 v18 = 2080;
        uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v20 = 1024;
        int v21 = 1115;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v1 = v9;
    }
  }
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v1)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v3 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v3 = &_os_log_default;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = v1;
      uint64_t v4 = v3;
      os_log_type_t v5 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "prepareFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v6 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      uint64_t v4 = v6;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v1;
}

uint64_t setDummyWrappedFDRDataEncryptionKey(const void *a1, size_t a2)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v4 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setDummyWrappedFDRDataEncryptionKey\n", buf, 2u);
  }
  uint64_t v5 = sub_100018554();
  if (v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1132);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      size_t v12 = __osLogPearlLib;
    }
    else {
      size_t v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = "err == 0 ";
      __int16 v18 = 2048;
      uint64_t v19 = (int)v5;
      __int16 v20 = 2080;
      int v21 = "";
      __int16 v22 = 2080;
      unint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v24 = 1024;
      int v25 = 1132;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = sub_100018814(dword_100038D10, 79, 0, a1, a2, 0, 0);
    if (v6)
    {
      uint64_t v13 = v6;
      uint64_t v14 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1135);
      if (qword_100038D18 != -1) {
        dispatch_once(&qword_100038D18, &stru_100030C50);
      }
      if (__osLogPearlLib) {
        uint64_t v15 = __osLogPearlLib;
      }
      else {
        uint64_t v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = "err == 0 ";
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        int v21 = "";
        __int16 v22 = 2080;
        unint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v24 = 1024;
        int v25 = 1135;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v5 = v13;
    }
  }
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v5)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v7 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v5;
      uint64_t v8 = v7;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "setDummyWrappedFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v10 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      uint64_t v8 = v10;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v5;
}

uint64_t encryptFDRDataForBrunor(const char *a1, size_t a2, uint64_t a3, char *a4, _OWORD *a5, uint64_t a6)
{
  if (qword_100038D18 != -1) {
    dispatch_once(&qword_100038D18, &stru_100030C50);
  }
  if (__osLogPearlLibTrace) {
    size_t v12 = __osLogPearlLibTrace;
  }
  else {
    size_t v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    __int16 v26 = a1;
    __int16 v27 = 2048;
    size_t v28 = a2;
    __int16 v29 = 2048;
    __int16 v30 = (const char *)a3;
    __int16 v31 = 2048;
    __int16 v32 = a4;
    __int16 v33 = 2048;
    __int16 v34 = a5;
    __int16 v35 = 2048;
    uint64_t v36 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "encryptFDRDataForBrunor %p %zu %p %p %p %zu\n", buf, 0x3Eu);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1152);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "PSD2";
    __int16 v27 = 2048;
    size_t v28 = 0;
    __int16 v29 = 2080;
    __int16 v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    LODWORD(v34) = 1152;
    goto LABEL_87;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1153);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "PSD2Length";
    __int16 v27 = 2048;
    size_t v28 = 0;
    __int16 v29 = 2080;
    __int16 v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    LODWORD(v34) = 1153;
    goto LABEL_87;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1154);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "PSD3";
    __int16 v27 = 2048;
    size_t v28 = 0;
    __int16 v29 = 2080;
    __int16 v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    LODWORD(v34) = 1154;
    goto LABEL_87;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outPSD3Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1155);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "outPSD3Length";
    __int16 v27 = 2048;
    size_t v28 = 0;
    __int16 v29 = 2080;
    __int16 v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    LODWORD(v34) = 1155;
    goto LABEL_87;
  }
  if (a5 && a6 != 16)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3MACLength == (16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1160);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      int v21 = __osLogPearlLib;
    }
    else {
      int v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_88;
    }
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "PSD3MACLength == (16)";
    __int16 v27 = 2048;
    size_t v28 = 0;
    __int16 v29 = 2080;
    __int16 v30 = "";
    __int16 v31 = 2080;
    __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v33 = 1024;
    LODWORD(v34) = 1160;
LABEL_87:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_88:
    uint64_t v15 = 258;
    goto LABEL_18;
  }
  uint64_t v13 = sub_100018554();
  if (v13)
  {
    uint64_t v15 = v13;
    size_t v22 = (int)v13;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v13, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1164);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      unint64_t v23 = __osLogPearlLib;
    }
    else {
      unint64_t v23 = &_os_log_default;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v26 = "err == 0 ";
      __int16 v27 = 2048;
      size_t v28 = v22;
      __int16 v29 = 2080;
      __int16 v30 = "";
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v33 = 1024;
      LODWORD(v34) = 1164;
LABEL_79:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v14 = sub_100018814(dword_100038D10, 80, 0, a1, a2, (void *)a3, a4);
    if (!v14)
    {
      uint64_t v15 = 0;
      if (a5) {
        *a5 = *(_OWORD *)(a3 + 108);
      }
      goto LABEL_18;
    }
    uint64_t v15 = v14;
    size_t v24 = (int)v14;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1167);
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLib) {
      unint64_t v23 = __osLogPearlLib;
    }
    else {
      unint64_t v23 = &_os_log_default;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v26 = "err == 0 ";
      __int16 v27 = 2048;
      size_t v28 = v24;
      __int16 v29 = 2080;
      __int16 v30 = "";
      __int16 v31 = 2080;
      __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v33 = 1024;
      LODWORD(v34) = 1167;
      goto LABEL_79;
    }
  }
LABEL_18:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if (v15)
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      __int16 v16 = __osLogPearlLibTrace;
    }
    else {
      __int16 v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v15;
      uint64_t v17 = v16;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "encryptFDRDataForBrunor -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1) {
      dispatch_once(&qword_100038D18, &stru_100030C50);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v19 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 0;
      uint64_t v17 = v19;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_35;
    }
  }
  return v15;
}

void sub_100024E00(id a1)
{
  os_log_t v1 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  uint64_t v2 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v1;

  uint64_t v3 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100024E84();
    }
    uint64_t v3 = (void *)__osLogPearlLib;
  }

  objc_storeStrong((id *)&__osLogPearlLibTrace, v3);
}

void sub_100024E84()
{
  *(_WORD *)CFDictionaryRef v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

void sub_100024ECC(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(char *)(a1 - 1) < 0) {
      operator delete(*(void **)(a1 - 24));
    }
    if (*(char *)(a1 - 25) < 0) {
      operator delete(*(void **)(a1 - 48));
    }
    if (*(char *)(a1 - 49) < 0) {
      operator delete(*(void **)(a1 - 72));
    }
    if (*(char *)(a1 - 73) < 0) {
      operator delete(*(void **)(a1 - 96));
    }
    a1 -= 104;
  }
  while (a1 != a2);
}

void sub_100024F3C(uint64_t a1, void **a2, void **a3)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*a2);
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*a3);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return _AMFDRSealingMapCopyLocalDataForClass();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return _CMBufferQueueDequeueAndRetain(queue);
}

OSStatus CMBufferQueueInstallTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerCallback callback, void *refcon, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut)
{
  return _CMBufferQueueInstallTrigger(queue, callback, refcon, condition, time, triggerTokenOut);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return _CMBufferQueueRemoveTrigger(queue, triggerToken);
}

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return _CVBufferCopyAttachment(buffer, key, attachmentMode);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetDataSize(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

uint64_t FigCFNumberGetSInt32()
{
  return _FigCFNumberGetSInt32();
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return _FigCaptureDeviceGetFigBaseObject();
}

uint64_t FigCaptureStreamGetFigBaseObject()
{
  return _FigCaptureStreamGetFigBaseObject();
}

uint64_t FigCaptureSynchronizedStreamsGroupGetFigBaseObject()
{
  return _FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return __AXSAttentionAwarenessFeaturesEnabled();
}

uint64_t _AXSSetAttentionAwarenessFeaturesEnabled()
{
  return __AXSSetAttentionAwarenessFeaturesEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_checkConnectivity(void *a1, const char *a2, ...)
{
  return [a1 checkConnectivity];
}

id objc_msgSend_configurationTimeForStreamInSec(void *a1, const char *a2, ...)
{
  return [a1 configurationTimeForStreamInSec];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_diagnosticCasesMask(void *a1, const char *a2, ...)
{
  return [a1 diagnosticCasesMask];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableAttentionDetection(void *a1, const char *a2, ...)
{
  return [a1 disableAttentionDetection];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isPortTypeFrontIRDetected(void *a1, const char *a2, ...)
{
  return [a1 isPortTypeFrontIRDetected];
}

id objc_msgSend_isPortTypeFrontRgbDetected(void *a1, const char *a2, ...)
{
  return [a1 isPortTypeFrontRgbDetected];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_preemtingWaitInMicroSec(void *a1, const char *a2, ...)
{
  return [a1 preemtingWaitInMicroSec];
}

id objc_msgSend_restoreAttentionDetection(void *a1, const char *a2, ...)
{
  return [a1 restoreAttentionDetection];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return [a1 startStreaming];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopStreaming(void *a1, const char *a2, ...)
{
  return [a1 stopStreaming];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_terminateComunication(void *a1, const char *a2, ...)
{
  return [a1 terminateComunication];
}

id objc_msgSend_useADControl(void *a1, const char *a2, ...)
{
  return [a1 useADControl];
}

id objc_msgSend_useHighPriority(void *a1, const char *a2, ...)
{
  return [a1 useHighPriority];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:];
}