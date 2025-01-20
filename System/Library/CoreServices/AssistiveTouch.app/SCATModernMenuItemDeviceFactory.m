@interface SCATModernMenuItemDeviceFactory
+ (id)_stringForRingerOn:(BOOL)a3;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
+ (void)_handleSpeakThis:(id)a3;
+ (void)_handleSysdiagnose:(id)a3;
@end

@implementation SCATModernMenuItemDeviceFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0);
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v19 + 1) + 8 * i) menu:v9 delegate:v10];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceAppSwitcher])
  {
    v124[0] = @"device_appSwitcher";
    v123[0] = @"identifier";
    v123[1] = @"title";
    id v8 = sub_100040EC8(@"Device-App-Switcher");
    v123[2] = @"activateBehavior";
    v124[1] = v8;
    v124[2] = &off_1001BC0C0;
    id v9 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:3];
    v125 = v9;
    id v10 = &v125;
LABEL_11:
    id v11 = +[NSArray arrayWithObjects:v10 count:1];
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceNotificationCenter])
  {
    v121[0] = @"device_notificationCenter";
    v120[0] = @"identifier";
    v120[1] = @"title";
    id v8 = sub_100040EC8(@"Device-Notification-Center");
    v120[2] = @"activateBehavior";
    v121[1] = v8;
    v121[2] = &off_1001BC0C0;
    id v9 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:3];
    v122 = v9;
    id v10 = &v122;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceControlCenter])
  {
    v118[0] = @"device_controlCenter";
    v117[0] = @"identifier";
    v117[1] = @"title";
    id v8 = sub_100040EC8(@"Device-Control-Center");
    v117[2] = @"activateBehavior";
    v118[1] = v8;
    v118[2] = &off_1001BC0C0;
    id v9 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:3];
    v119 = v9;
    id v10 = &v119;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceLockScreen])
  {
    v115[0] = @"device_lock";
    v114[0] = @"identifier";
    v114[1] = @"title";
    id v8 = sub_100040EC8(@"LOCK");
    v114[2] = @"activateBehavior";
    v115[1] = v8;
    v115[2] = &off_1001BC0D8;
    id v9 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:3];
    v116 = v9;
    id v10 = &v116;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceRotateScreen])
  {
    v112[0] = @"device_rotate";
    v111[0] = @"identifier";
    v111[1] = @"title";
    id v8 = sub_100040EC8(@"ORIENTATION");
    v111[2] = @"activateBehavior";
    v112[1] = v8;
    v112[2] = &off_1001BC0C0;
    id v9 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:3];
    v113 = v9;
    id v10 = &v113;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceMute])
  {
    v109[0] = @"device_mute";
    v108[0] = @"identifier";
    v108[1] = @"title";
    id v13 = [a1 _stringForRingerOn:sub_100040830()];
    v108[2] = @"activateBehavior";
    v109[1] = v13;
    v109[2] = &off_1001BC0F0;
    id v14 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:3];
    v110 = v14;
    id v8 = +[NSArray arrayWithObjects:&v110 count:1];

    if (AXDeviceHasStaccato())
    {
      v106[0] = @"device_mute";
      v105[0] = @"identifier";
      v105[1] = @"title";
      id v9 = sub_100041058(@"ACTION_BUTTON");
      v105[2] = @"activateBehavior";
      v106[1] = v9;
      v106[2] = &off_1001BC0F0;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:3];
      v107 = v15;
      v16 = &v107;
LABEL_20:
      id v11 = +[NSArray arrayWithObjects:v16 count:1];
LABEL_24:

      goto LABEL_12;
    }
LABEL_78:
    id v11 = v8;
    goto LABEL_13;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceVolumeUpDown])
  {
    v103[0] = @"device_volumeDown";
    v102[0] = @"identifier";
    v102[1] = @"title";
    id v8 = sub_100040EC8(@"VOLUME_DOWN");
    v103[1] = v8;
    v103[2] = &off_1001BC0F0;
    v102[2] = @"activateBehavior";
    v102[3] = @"menuItemGroup";
    v103[3] = @"menuItemGroupVolume";
    id v9 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:4];
    v104[0] = v9;
    v101[0] = @"device_volumeUp";
    v100[0] = @"identifier";
    v100[1] = @"title";
    uint64_t v15 = sub_100040EC8(@"VOLUME_UP");
    v101[1] = v15;
    v101[2] = &off_1001BC0F0;
    v100[2] = @"activateBehavior";
    v100[3] = @"menuItemGroup";
    v101[3] = @"menuItemGroupVolume";
    v17 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:4];
    v104[1] = v17;
    v18 = v104;
LABEL_23:
    id v11 = +[NSArray arrayWithObjects:v18 count:2];

    goto LABEL_24;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSpotlightSearch])
  {
    v98[0] = @"device_spotlightSearch";
    v97[0] = @"identifier";
    v97[1] = @"title";
    id v8 = sub_100040EC8(@"SPOTLIGHT_SEARCH");
    v97[2] = @"activateBehavior";
    v98[1] = v8;
    v98[2] = &off_1001BC0D8;
    id v9 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:3];
    v99 = v9;
    id v10 = &v99;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSiriVoiceControl])
  {
    if (j__AXDeviceIsSiriAvailable())
    {
      long long v19 = +[AXSystemAppServer server];
      unsigned __int8 v20 = [v19 isSiriVisible];

      if ((v20 & 1) == 0)
      {
        v92[0] = @"device_siri";
        v91[0] = @"identifier";
        v91[1] = @"title";
        id v8 = sub_100040EC8(@"SCAT_QUICK_ITEM_SIRI");
        v91[2] = @"activateBehavior";
        v92[1] = v8;
        v92[2] = &off_1001BC0C0;
        id v9 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
        v93 = v9;
        id v10 = &v93;
        goto LABEL_11;
      }
    }
    else if (j__AXDeviceIsVoiceControlAvailable())
    {
      v95[0] = @"device_voiceControl";
      v94[0] = @"identifier";
      v94[1] = @"title";
      id v8 = sub_100040EC8(@"SCAT_QUICK_ITEM_VOICE_CONTROL");
      v94[2] = @"activateBehavior";
      v95[1] = v8;
      v95[2] = &off_1001BC0C0;
      id v9 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:3];
      v96 = v9;
      id v10 = &v96;
      goto LABEL_11;
    }
  }
  else if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceTypeToSiri])
  {
    if (j__AXDeviceIsSiriAvailable())
    {
      v89[0] = @"device_type_to_siri";
      v88[0] = @"identifier";
      v88[1] = @"title";
      id v8 = sub_100040EC8(@"SCAT_TYPE_TO_SIRI");
      v88[2] = @"activateBehavior";
      v89[1] = v8;
      v89[2] = &off_1001BC0C0;
      id v9 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:3];
      v90 = v9;
      id v10 = &v90;
      goto LABEL_11;
    }
  }
  else
  {
    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceTripleClick])
    {
      v86[0] = @"device_tripleClick";
      v85[0] = @"identifier";
      v85[1] = @"title";
      id v8 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
      if ([v8 isClarityBoardEnabled]) {
        long long v21 = @"TRIPLE_CLICK_ASSISTIVE_ACCESS";
      }
      else {
        long long v21 = @"TRIPLE_CLICK";
      }
      id v9 = sub_100040EC8(v21);
      v86[1] = v9;
      v86[2] = &off_1001BC0D8;
      v85[2] = @"activateBehavior";
      v85[3] = @"assistiveAccess";
      v85[4] = @"guidedAccess";
      v86[3] = &__kCFBooleanTrue;
      v86[4] = &__kCFBooleanTrue;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:5];
      v87 = v15;
      v16 = &v87;
      goto LABEL_20;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceShake])
    {
      v83[0] = @"device_shake";
      v82[0] = @"identifier";
      v82[1] = @"imageName";
      id v8 = +[NSString sc_deviceIconNameForIdentifier:](NSString, "sc_deviceIconNameForIdentifier:");
      v83[1] = v8;
      v82[2] = @"title";
      id v9 = sub_100040EC8(@"SHAKE");
      v83[2] = v9;
      v83[3] = &off_1001BC0D8;
      v82[3] = @"activateBehavior";
      v82[4] = @"guidedAccess";
      v83[4] = &__kCFBooleanTrue;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:5];
      v84 = v15;
      v16 = &v84;
      goto LABEL_20;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceScreenshot])
    {
      v80[0] = @"device_screenshot";
      v79[0] = @"identifier";
      v79[1] = @"title";
      id v8 = sub_100040EC8(@"SCREENSHOT");
      v79[2] = @"activateBehavior";
      v80[1] = v8;
      v80[2] = &off_1001BC0D8;
      id v9 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:3];
      v81 = v9;
      id v10 = &v81;
      goto LABEL_11;
    }
    if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceIncreaseDecreaseZoom])
    {
      if (_AXSZoomTouchEnabled())
      {
        v77[0] = @"action_zoomOut";
        v76[0] = @"identifier";
        v76[1] = @"title";
        id v8 = sub_100040EC8(@"DECREASE_ZOOM");
        v77[1] = v8;
        v77[2] = &off_1001BC0F0;
        v76[2] = @"activateBehavior";
        v76[3] = @"guidedAccess";
        v76[4] = @"menuItemGroup";
        v77[3] = &__kCFBooleanTrue;
        v77[4] = @"menuItemGroupZoom";
        id v9 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:5];
        v78[0] = v9;
        v75[0] = @"action_zoomIn";
        v74[0] = @"identifier";
        v74[1] = @"title";
        uint64_t v15 = sub_100040EC8(@"INCREASE_ZOOM");
        v75[1] = v15;
        v75[2] = &off_1001BC0F0;
        v74[2] = @"activateBehavior";
        v74[3] = @"guidedAccess";
        v74[4] = @"menuItemGroup";
        v75[3] = &__kCFBooleanTrue;
        v75[4] = @"menuItemGroupZoom";
        v17 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:5];
        v78[1] = v17;
        v18 = v78;
        goto LABEL_23;
      }
    }
    else if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSpeakScreen])
    {
      if (_AXSSpeakThisEnabled())
      {
        long long v22 = +[AXSpringBoardServer server];
        unsigned __int8 v23 = [v22 isSpeakThisTemporarilyDisabled];

        if ((v23 & 1) == 0)
        {
          v72[0] = @"device_speakThis";
          v71[0] = @"identifier";
          v71[1] = @"title";
          id v8 = sub_100040EC8(@"SPEAK_SCREEN");
          v72[1] = v8;
          v72[2] = &off_1001BC0D8;
          v71[2] = @"activateBehavior";
          v71[3] = @"guidedAccess";
          v72[3] = &__kCFBooleanTrue;
          id v9 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];
          v73 = v9;
          id v10 = &v73;
          goto LABEL_11;
        }
      }
    }
    else if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSOS])
    {
      if (AXDeviceIsSOSAvailable())
      {
        v69[0] = @"device_SOS";
        v68[0] = @"identifier";
        v68[1] = @"title";
        id v8 = sub_100040EC8(@"SOS");
        v69[1] = v8;
        v69[2] = &off_1001BC0D8;
        v68[2] = @"activateBehavior";
        v68[3] = @"guidedAccess";
        v69[3] = &__kCFBooleanTrue;
        id v9 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
        v70 = v9;
        id v10 = &v70;
        goto LABEL_11;
      }
    }
    else if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceInterDevice])
    {
      v24 = [v7 delegate];
      unsigned int v25 = [v24 canSearchForControllableDevicesWithMenu:v7];

      if (v25)
      {
        v66[0] = @"device_multiDeviceSelectReceiver";
        v65[0] = @"identifier";
        v65[1] = @"title";
        id v8 = sub_100040EC8(@"CONNECT_TO_RECEIVER");
        v66[1] = v8;
        v66[2] = @"SCATIcon_interdevice_useOtherDevice";
        v65[2] = @"imageName";
        v65[3] = @"activateBehavior";
        v66[3] = &off_1001BC0C0;
        id v9 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
        v67 = v9;
        id v10 = &v67;
        goto LABEL_11;
      }
      v26 = [v7 delegate];
      unsigned int v27 = [v26 canReturnControlToForwarderDevice:v7];

      if (v27)
      {
        v63[0] = @"device_multiDeviceReturnToForwarder";
        v62[0] = @"identifier";
        v62[1] = @"title";
        id v8 = sub_100040EC8(@"DISCONNECT_FROM_FORWARDER");
        v63[1] = v8;
        v63[2] = @"SCATIcon_interdevice_cancel";
        v62[2] = @"imageName";
        v62[3] = @"activateBehavior";
        v63[3] = &off_1001BC108;
        id v9 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:4];
        v64 = v9;
        id v10 = &v64;
        goto LABEL_11;
      }
    }
    else
    {
      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSysdiagnose])
      {
        v60[0] = @"device_sysdiagnose";
        v59[0] = @"identifier";
        v59[1] = @"title";
        id v8 = sub_100040EC8(@"SYSDIAGNOSE");
        v60[1] = v8;
        v60[2] = &off_1001BC108;
        v59[2] = @"activateBehavior";
        v59[3] = @"guidedAccess";
        v60[3] = &__kCFBooleanTrue;
        id v9 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
        v61 = v9;
        id v10 = &v61;
        goto LABEL_11;
      }
      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceRebootDevice])
      {
        v57[0] = @"device_restart";
        v56[0] = @"identifier";
        v56[1] = @"title";
        id v8 = sub_100040EC8(@"REBOOT_DEVICE");
        v56[2] = @"activateBehavior";
        v57[1] = v8;
        v57[2] = &off_1001BC108;
        id v9 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];
        v58 = v9;
        id v10 = &v58;
        goto LABEL_11;
      }
      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceToggleDock])
      {
        if (AXDeviceSupportsSideApp())
        {
          v54[0] = @"device_dock";
          v53[0] = @"identifier";
          v53[1] = @"imageName";
          id v8 = +[NSString sc_deviceIconNameForIdentifier:](NSString, "sc_deviceIconNameForIdentifier:");
          v54[1] = v8;
          v53[2] = @"title";
          id v9 = sub_100040EC8(@"DOCK");
          v53[3] = @"activateBehavior";
          v54[2] = v9;
          v54[3] = &off_1001BC108;
          uint64_t v15 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
          v55 = v15;
          v16 = &v55;
          goto LABEL_20;
        }
      }
      else if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceArmApplePay])
      {
        if (sub_1000408D0())
        {
          v28 = +[SCATScannerManager sharedManager];
          unsigned int v29 = [v28 waitingForSecureIntent];
        }
        else
        {
          unsigned int v29 = 0;
        }
        if ((AXDeviceCanArmApplePay() & 1) != 0 || v29)
        {
          v51[0] = @"device_applePay";
          v50[0] = @"identifier";
          v50[1] = @"title";
          v30 = sub_100040EC8(@"APPLE_PAY");
          v50[2] = @"activateBehavior";
          v51[1] = v30;
          v51[2] = &off_1001BC108;
          v31 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
          v52 = v31;
          id v8 = +[NSArray arrayWithObjects:&v52 count:1];

          if (v29)
          {
            v48[0] = @"device_faceID";
            v47[0] = @"identifier";
            v47[1] = @"title";
            id v9 = sub_100040EC8(@"APPLE_PAY_CONFIRM");
            v47[2] = @"activateBehavior";
            v48[1] = v9;
            v48[2] = &off_1001BC108;
            uint64_t v15 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
            v49 = v15;
            v16 = &v49;
            goto LABEL_20;
          }
          goto LABEL_78;
        }
      }
      else
      {
        if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceToggleCommandAndControl])
        {
          v44[0] = @"identifier";
          v44[1] = @"imageName";
          v45[0] = @"device_commandAndControl";
          v45[1] = @"IconCommandAndControl";
          v44[2] = @"title";
          id v8 = sub_100040EC8(@"COMMAND_AND_CONTROL");
          v44[3] = @"activateBehavior";
          v45[2] = v8;
          v45[3] = &off_1001BC108;
          id v9 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
          v46 = v9;
          id v10 = &v46;
          goto LABEL_11;
        }
        if ([v6 isEqualToString:AXSSwitchControlMenuItemCameraButton])
        {
          if (AXDeviceSupportsCameraButton())
          {
            v42[0] = @"device_cameraButton";
            v41[0] = @"identifier";
            v41[1] = @"title";
            id v8 = sub_1000410D4(@"CAMERA_BUTTON");
            v42[1] = v8;
            v42[2] = @"SCATIcon_device_cameraButton";
            v41[2] = @"imageName";
            v41[3] = @"activateBehavior";
            v42[3] = &off_1001BC0D8;
            id v9 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
            v43 = v9;
            id v10 = &v43;
            goto LABEL_11;
          }
        }
        else if ([v6 isEqualToString:AXSSwitchControlMenuItemCameraButtonLightPress])
        {
          if (AXDeviceSupportsCameraButton())
          {
            v39[0] = @"device_cameraButtonLightPress";
            v38[0] = @"identifier";
            v38[1] = @"title";
            id v8 = sub_1000410D4(@"CAMERA_BUTTON_LIGHT_PRESS");
            v39[1] = v8;
            v39[2] = @"SCATIcon_device_cameraButton";
            v38[2] = @"imageName";
            v38[3] = @"activateBehavior";
            v39[3] = &off_1001BC0D8;
            id v9 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
            v40 = v9;
            id v10 = &v40;
            goto LABEL_11;
          }
        }
        else if ([v6 isEqualToString:AXSSwitchControlMenuItemCameraButtonDoubleLightPress])
        {
          if (AXDeviceSupportsCameraButton())
          {
            v36[0] = @"device_cameraButtonDoubleLightPress";
            v35[0] = @"identifier";
            v35[1] = @"title";
            id v8 = sub_1000410D4(@"CAMERA_BUTTON_DOUBLE_LIGHT_PRESS");
            v36[1] = v8;
            v36[2] = @"SCATIcon_device_cameraButton";
            v35[2] = @"imageName";
            v35[3] = @"activateBehavior";
            v36[3] = &off_1001BC0D8;
            id v9 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
            v37 = v9;
            id v10 = &v37;
            goto LABEL_11;
          }
        }
        else if ([v6 isEqualToString:AXSSwitchControlMenuItemVisualIntelligence])
        {
          if (AXDeviceSupportsCameraButton() && AXDeviceHasGreyMatterEnabled())
          {
            v33[0] = @"device_visualIntelligence";
            v32[0] = @"identifier";
            v32[1] = @"title";
            id v8 = sub_1000410D4(@"CAMERA_BUTTON_VISUAL_INTELLIGENCE");
            v32[2] = @"activateBehavior";
            v33[1] = v8;
            v33[2] = &off_1001BC0D8;
            id v9 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
            v34 = v9;
            id v10 = &v34;
            goto LABEL_11;
          }
        }
        else
        {
          _AXAssert();
        }
      }
    }
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 objectForKey:@"identifier"];
  v26 = [v7 objectForKey:@"title"];
  id v10 = [v7 objectForKey:@"imageName"];
  id v11 = [v7 objectForKey:@"activateBehavior"];
  id v25 = [v11 unsignedIntegerValue];

  v12 = [v7 objectForKey:@"guidedAccess"];
  id v13 = [v12 BOOLValue];

  id v14 = [v7 objectForKeyedSubscript:@"assistiveAccess"];
  uint64_t v15 = v14;
  unsigned __int8 v16 = v13;
  if (v14) {
    unsigned __int8 v16 = [v14 BOOLValue];
  }
  if ([v9 isEqualToString:@"device_siri"])
  {
    v17 = &stru_1001AE9C0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_type_to_siri"])
  {
    v17 = &stru_1001AE9E0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_voiceControl"])
  {
    v17 = &stru_1001AEA00;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_appSwitcher"])
  {
    v17 = &stru_1001AEA20;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_notificationCenter"])
  {
    v17 = &stru_1001AEA40;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_controlCenter"])
  {
    v17 = &stru_1001AEA60;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_lock"])
  {
    v17 = &stru_1001AEA80;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_rotate"])
  {
    v17 = &stru_1001AEAA0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_mute"])
  {
    v17 = &stru_1001AEAC0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_volumeDown"])
  {
    v17 = &stru_1001AEAE0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_volumeUp"])
  {
    v17 = &stru_1001AEB00;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_tripleClick"])
  {
    v17 = &stru_1001AEB20;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_shake"])
  {
    v17 = &stru_1001AEB40;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_screenshot"])
  {
    v17 = &stru_1001AEB60;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"action_zoomIn"])
  {
    v17 = &stru_1001AEBA0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"action_zoomOut"])
  {
    v17 = &stru_1001AEBC0;
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_speakThis"])
  {
    v18 = v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    long long v19 = sub_1000E7410;
LABEL_37:
    v18[2] = v19;
    v18[3] = &unk_1001AD620;
    v18[4] = a1;
    v17 = objc_retainBlock(v18);
    goto LABEL_67;
  }
  if ([v9 isEqualToString:@"device_spotlightSearch"])
  {
    v17 = &stru_1001AEBE0;
  }
  else if ([v9 isEqualToString:@"device_multiDeviceSelectReceiver"])
  {
    v17 = &stru_1001AEC00;
  }
  else if ([v9 isEqualToString:@"device_multiDeviceReturnToForwarder"])
  {
    v17 = &stru_1001AEC20;
  }
  else if ([v9 isEqualToString:@"device_SOS"])
  {
    v17 = &stru_1001AEC40;
  }
  else
  {
    if ([v9 isEqualToString:@"device_sysdiagnose"])
    {
      v18 = v27;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      long long v19 = sub_1000E75F4;
      goto LABEL_37;
    }
    if ([v9 isEqualToString:@"device_restart"])
    {
      v17 = &stru_1001AEC60;
    }
    else if ([v9 isEqualToString:@"device_dock"])
    {
      v17 = &stru_1001AEC80;
    }
    else if ([v9 isEqualToString:@"device_applePay"])
    {
      v17 = &stru_1001AECA0;
    }
    else if ([v9 isEqualToString:@"device_faceID"])
    {
      v17 = &stru_1001AECC0;
    }
    else if ([v9 isEqualToString:@"device_commandAndControl"])
    {
      v17 = &stru_1001AECE0;
    }
    else if ([v9 isEqualToString:@"device_cameraButton"])
    {
      v17 = &stru_1001AED00;
    }
    else if ([v9 isEqualToString:@"device_cameraButtonLightPress"])
    {
      v17 = &stru_1001AED20;
    }
    else if ([v9 isEqualToString:@"device_cameraButtonDoubleLightPress"])
    {
      v17 = &stru_1001AED40;
    }
    else if ([v9 isEqualToString:@"device_visualIntelligence"])
    {
      v17 = &stru_1001AED60;
    }
    else
    {
      v17 = 0;
    }
  }
LABEL_67:
  unsigned __int8 v20 = [(id)objc_opt_class() updateBlockForIdentifier:v9];
  LOBYTE(v24) = v16;
  long long v21 = +[SCATModernMenuItem itemWithIdentifier:v9 delegate:v8 title:v26 imageName:v10 activateBehavior:v25 allowedWithGuidedAccess:v13 allowedWithAssistiveAccess:v24 activateHandler:v17 updateHandler:v20];

  long long v22 = [v7 objectForKeyedSubscript:@"menuItemGroup"];
  [v21 setMenuItemGroupName:v22];

  return v21;
}

+ (void)_handleSpeakThis:(id)a3
{
  id v11 = a3;
  v3 = [v11 screenPoint];

  if (!v3) {
    _AXAssert();
  }
  v4 = [v11 screenPoint];

  if (v4)
  {
    v5 = [v11 screenPoint];
    [v5 CGPointValue];
    double x = v6;
    double y = v8;
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  id v10 = +[SpeakThisServices sharedInstance];
  objc_msgSend(v10, "speakThisWithOptions:useAppAtPoint:errorHandler:", 12, &stru_1001AED80, x, y);
}

+ (void)_handleSysdiagnose:(id)a3
{
  id v3 = a3;
  v4 = +[AXPISystemActionHelper sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E7B10;
  v6[3] = &unk_1001AAFB0;
  id v7 = v3;
  id v5 = v3;
  [v4 performSysdiagnoseWithStatusUpdateHandler:v6];
}

+ (id)_stringForRingerOn:(BOOL)a3
{
  if (a3) {
    id v3 = @"MUTE";
  }
  else {
    id v3 = @"UNMUTE";
  }
  v4 = sub_100040EC8(v3);

  return v4;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"device_mute"])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E7CBC;
    v7[3] = &unk_1001ABF58;
    v7[4] = a1;
    id v5 = objc_retainBlock(v7);
  }
  else if ([v4 isEqualToString:@"device_tripleClick"])
  {
    id v5 = &stru_1001AEDA0;
  }
  else if ([v4 isEqualToString:@"device_visualIntelligence"])
  {
    id v5 = &stru_1001AEDC0;
  }
  else
  {
    id v5 = &stru_1001AEDE0;
  }

  return v5;
}

@end