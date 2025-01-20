void FTAWDLogRegistrationGetHandles(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void block[7];
  int v9;
  int v10;
  int v11;
  char v12;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A82504;
  block[3] = &unk_264188EB0;
  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_210A824A0(block);
}

__CFString *sub_210A820E4(int a1)
{
  result = @"Unknown";
  if (!v2 & v1)
  {
    switch(a1)
    {
      case 5308417:
        result = @"AWDMetricTypeIMessageAttachmentDownload";
        break;
      case 5308418:
        result = @"AWDMetricTypeIMessageAttachmentUpload";
        break;
      case 5308419:
        result = @"AWDMetricTypeIMessageSent";
        break;
      case 5308420:
        result = @"AWDMetricTypeIMessageDelivered";
        break;
      case 5308421:
      case 5308422:
      case 5308423:
      case 5308424:
      case 5308425:
      case 5308426:
      case 5308427:
      case 5308428:
      case 5308429:
      case 5308430:
      case 5308431:
      case 5308432:
      case 5308436:
      case 5308437:
      case 5308438:
      case 5308439:
      case 5308443:
      case 5308444:
      case 5308445:
      case 5308446:
      case 5308447:
      case 5308448:
        return result;
      case 5308433:
        result = @"AWDMetricTypeSMSReceived";
        break;
      case 5308434:
        result = @"AWDMetricTypeSMSSent";
        break;
      case 5308435:
        result = @"AWDMetricTypeIMessageReceived";
        break;
      case 5308440:
        result = @"AWDMetricTypeIMessageDowngrade";
        break;
      case 5308441:
        result = @"AWDMetricTypeIMessageQueryFinished";
        break;
      case 5308442:
        result = @"AWDMetricTypeIMessageDeduplicated";
        break;
      case 5308449:
        result = @"AWDMetricTypeSMSReceivedHotShip";
        break;
      case 5308450:
        result = @"AWDMetricTypeSMSSentHotShip";
        break;
      case 5308451:
        result = @"AWDMetricTypeIMessageReceivedHotShip";
        break;
      case 5308452:
        result = @"AWDMetricTypeIMessageSentHotShip";
        break;
      case 5308453:
        result = @"AWDMetricTypeIMessageAttachmentDownloadHotShip";
        break;
      case 5308454:
        result = @"AWDMetricTypeIMessageAttachmentUploadHotShip";
        break;
      case 5308455:
        result = @"AWDMetricTypeIMessageDeliveredHotShip";
        break;
      case 5308456:
        result = @"AWDMetricTypeIMessageDowngradeHotShip";
        break;
      case 5308457:
        result = @"AWDMetricTypeIMessageQueryFinishedHotShip";
        break;
      case 5308458:
        result = @"AWDMetricTypeIMessageDeduplicatedHotShip";
        break;
      case 5308459:
        result = @"AWDMetricTypeIMessageHealthCheckPerformed";
        break;
      case 5308460:
        result = @"AWDIMessageCloudKitSyncFailed";
        break;
      case 5308461:
        result = @"AWDIMessageCloudKitValidatePurgeableAttachment";
        break;
      default:
        switch(a1)
        {
          case 5316608:
            result = @"AWDMetricTypeRegistrationPhoneNumberValidationFinished";
            break;
          case 5316609:
            result = @"AWDMetricTypeRegistrationPhoneNumberReceivedSMS";
            break;
          case 5316610:
            result = @"AWDMetricTypeRegistrationProfileAuthenticate";
            break;
          case 5316611:
            result = @"AWDMetricTypeRegistrationProfileLinkHandles";
            break;
          case 5316612:
            result = @"AWDMetricTypeRegistrationProfileUnLinkHandles";
            break;
          case 5316613:
            result = @"AWDMetricTypeRegistrationProfileValidateHandle";
            break;
          case 5316614:
            result = @"AWDMetricTypeRegistrationProfileValidateInvitationContext";
            break;
          case 5316615:
            result = @"AWDMetricTypeRegistrationAuthenticate";
            break;
          case 5316616:
            result = @"AWDMetricTypeRegistrationRegister";
            break;
          case 5316617:
            result = @"AWDMetricTypeRegistrationGetHandles";
            break;
          case 5316618:
            result = @"AWDMetricTypeRegistrationGetDependentRegistrations";
            break;
          case 5316622:
            result = @"AWDMetricTypeRegistrationRenewCredentialsCompleted";
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 5312513:
        result = @"AWDMetricTypeFaceTimeCallStarted";
        break;
      case 5312514:
        result = @"AWDMetricTypeFaceTimeCallConnected";
        break;
      case 5312515:
        result = @"AWDMetricTypeFaceTimeCallEnded";
        break;
      case 5312516:
        result = @"AWDMetricTypeFaceTimeCallInterruptionBegan";
        break;
      case 5312517:
        result = @"AWDMetricTypeFaceTimeCallInterruptionEnded";
        break;
      case 5312518:
        result = @"AWDMetricTypeFaceTimeCallInvitationSent";
        break;
      case 5312519:
        result = @"AWDMetricTypeFaceTimeCallInvitationReceived";
        break;
      case 5312520:
        result = @"AWDMetricTypeFaceTimeCallCancelSent";
        break;
      case 5312521:
        result = @"AWDMetricTypeFaceTimeCallAcceptReceived";
        break;
      case 5312522:
        result = @"AWDMetricTypeFaceTimeCallDeclineSent";
        break;
      case 5312523:
        result = @"AWDMetricTypeFaceTimeCallRelayInitiateSent";
        break;
      case 5312524:
        result = @"AWDMetricTypeFaceTimeCallRelayInitiateReceived";
        break;
      case 5312525:
        result = @"AWDMetricTypeFaceTimeCallRelayUpdateSent";
        break;
      case 5312526:
        result = @"AWDMetricTypeFaceTimeCallRelayUpdateReceived";
        break;
      case 5312527:
        result = @"AWDMetricTypeFaceTimeCallAcceptSent";
        break;
      case 5312528:
      case 5312545:
      case 5312546:
      case 5312547:
      case 5312548:
      case 5312549:
      case 5312550:
      case 5312551:
      case 5312552:
      case 5312553:
      case 5312554:
      case 5312555:
      case 5312556:
      case 5312557:
      case 5312558:
      case 5312559:
        return result;
      case 5312529:
        result = @"AWDMetricTypeFaceTimeCallStartedHotShip";
        break;
      case 5312530:
        result = @"AWDMetricTypeFaceTimeCallConnectedHotShip";
        break;
      case 5312531:
        result = @"AWDMetricTypeFaceTimeCallEndedHotShip";
        break;
      case 5312532:
        result = @"AWDMetricTypeFaceTimeCallInterruptionBeganHotShip";
        break;
      case 5312533:
        result = @"AWDMetricTypeFaceTimeCallInterruptionEndedHotShip";
        break;
      case 5312534:
        result = @"AWDMetricTypeFaceTimeCallInvitationSentHotShip";
        break;
      case 5312535:
        result = @"AWDMetricTypeFaceTimeCallInvitationReceivedHotShip";
        break;
      case 5312536:
        result = @"AWDMetricTypeFaceTimeCallCancelSentHotShip";
        break;
      case 5312537:
        result = @"AWDMetricTypeFaceTimeCallAcceptSentHotShip";
        break;
      case 5312538:
        result = @"AWDMetricTypeFaceTimeCallAcceptReceivedHotShip";
        break;
      case 5312539:
        result = @"AWDMetricTypeFaceTimeCallDeclineSentHotShip";
        break;
      case 5312540:
        result = @"AWDMetricTypeFaceTimeCallRelayInitiateSentHotShip";
        break;
      case 5312541:
        result = @"AWDMetricTypeFaceTimeCallRelayInitiateReceivedHotShip";
        break;
      case 5312542:
        result = @"AWDMetricTypeFaceTimeCallRelayUpdateSentHotShip";
        break;
      case 5312543:
        result = @"AWDMetricTypeFaceTimeCallRelayUpdateReceivedHotShip";
        break;
      case 5312544:
        result = @"AWDMetricTypeFaceTimeCallFailed";
        break;
      case 5312560:
        result = @"AWDMetricTypeFaceTimeCallFailedHotShip";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

void sub_210A824A0(dispatch_block_t block)
{
  if (qword_26AC05368 != -1) {
    dispatch_once(&qword_26AC05368, &unk_26C30E8C8);
  }
  char v2 = qword_26AC05380;

  dispatch_async(v2, block);
}

void sub_210A82504(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  char v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136446210;
    v29 = "void FTAWDLogRegistrationGetHandles(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessageResult"
          "Code, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  id v3 = sub_210A82B44(5316617);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    v6 = v5;
    if (*(unsigned char *)(a1 + 68)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      v15 = @"YES";
      if (!v14) {
        v15 = @"NO";
      }
      int v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 registrationError];
      int v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 resultCode];
      int v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 genericError];
      int v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 uRLError];
      int v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 pOSIXError];
      int v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void FTAWDLogIMessageQueryFinished(uint64_t a1, char a2, int a3, uint64_t a4, char a5, char a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_210A87FD4;
  v11[3] = &unk_264188CB8;
  char v14 = a2;
  char v15 = a5;
  char v16 = a6;
  int v12 = a3;
  int v13 = a7;
  v11[4] = a4;
  v11[5] = a8;
  v11[6] = a9;
  v11[7] = a10;
  char v17 = a11;
  sub_210A824A0(v11);
}

id sub_210A82B44(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  char v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "FTAWDMetricContainerForMetricType", (uint8_t *)&v14, 2u);
  }
  if (!qword_26AC05388) {
    sub_210A8394C();
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v4 = [(id)qword_26AC05388 newMetricContainerWithIdentifier:a1];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init(MEMORY[0x263EFF910]);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      [v6 timeIntervalSinceDate:v3];
      int v14 = 134217984;
      char v15 = v8;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, "It took %f seconds to get a metric container", (uint8_t *)&v14, 0xCu);
    }

    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sub_210A820E4(a1);
      int v14 = 138412290;
      char v15 = v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "%@ is enabled on this config", (uint8_t *)&v14, 0xCu);
    }
    return v5;
  }
  else
  {

    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = sub_210A820E4(a1);
      int v14 = 138412290;
      char v15 = v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "Configuration doesn't allow for %@ to be submitted to AWD", (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
}

void FTAWDLogRegistrationProfileAuthenticate(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A831BC;
  block[3] = &unk_264188EB0;
  char v12 = a2;
  int v9 = a3;
  int v10 = a4;
  int v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_210A824A0(block);
}

void sub_210A82E50(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v4 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    int v11 = a1;
    __int16 v12 = 2048;
    int v13 = a2;
    _os_log_impl(&dword_210A81000, v4, OS_LOG_TYPE_DEFAULT, "__SubmitMetricToAWDWithContainer -- metric %p   metric container %p", (uint8_t *)&v10, 0x16u);
  }
  if (a1)
  {
    if (a2)
    {
      if (!qword_26AC05388) {
        sub_210A8394C();
      }
      [a2 setMetric:a1];
      if ([(id)qword_26AC05388 submitMetric:a2])
      {
        if (qword_26AC05378 != -1) {
          dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
        }
        uint64_t v5 = qword_26AC05370;
        if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v10) = 0;
          id v6 = "***** Metric was submitted !! *****";
LABEL_22:
          v7 = v5;
          uint32_t v8 = 2;
LABEL_23:
          _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
        }
      }
      else
      {
        if (qword_26AC05378 != -1) {
          dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
        }
        uint64_t v9 = qword_26AC05370;
        if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          int v11 = a2;
          id v6 = "Failed to submit AWD metric %@";
          v7 = v9;
          uint32_t v8 = 12;
          goto LABEL_23;
        }
      }
    }
    else
    {
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
      uint64_t v5 = qword_26AC05370;
      if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        id v6 = "No metric container";
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    uint64_t v5 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      id v6 = "No metric to submit";
      goto LABEL_22;
    }
  }
}

void FTAWDLogRegistrationGetDependentRegistrations(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A96B8C;
  block[3] = &unk_264188EB0;
  char v12 = a2;
  int v9 = a3;
  int v10 = a4;
  int v11 = a5;
  block[4] = a6;
  block[5] = a7;
  block[6] = a8;
  sub_210A824A0(block);
}

void FTAWDLogRegistrationRenewCredentialsCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A97140;
  block[3] = &unk_264188F50;
  block[4] = a2;
  block[5] = a1;
  block[6] = a3;
  sub_210A824A0(block);
}

void sub_210A831BC(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  char v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136446210;
    v29 = "void FTAWDLogRegistrationProfileAuthenticate(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMess"
          "ageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  id v3 = sub_210A82B44(5316610);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 68)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    uint32_t v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v28 = 138412290;
      v29 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      char v15 = @"YES";
      if (!v14) {
        char v15 = @"NO";
      }
      int v28 = 138412290;
      v29 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 genericError];
      int v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 uRLError];
      int v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 pOSIXError];
      int v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void sub_210A83770()
{
  if (qword_26AC05360 != -1) {
    dispatch_once(&qword_26AC05360, &unk_26C30E888);
  }
}

uint64_t sub_210A83798()
{
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  v0 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v2 = 0;
    _os_log_impl(&dword_210A81000, v0, OS_LOG_TYPE_DEFAULT, "Registering submission date notify token", v2, 2u);
  }
  return notify_register_check("kFTAWDDateChanged", &dword_26AC05390);
}

void FTAWDSetSubmissionDate()
{
}

uint64_t sub_210A83844()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)qword_26AC05388;
  if (!qword_26AC05388)
  {
    sub_210A8394C();
    v0 = (void *)qword_26AC05388;
  }
  unint64_t v1 = (((unint64_t)[v0 getAWDTimestamp] >> 3) * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64;
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = v1 >> 4;
  id v3 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = v2;
    _os_log_impl(&dword_210A81000, v3, OS_LOG_TYPE_DEFAULT, "Setting submission date -- Timestamp %llu", (uint8_t *)&v5, 0xCu);
  }
  return notify_set_state(dword_26AC05390, v2);
}

void sub_210A8394C()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!qword_26AC05388)
  {
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    v0 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      uint64_t v5 = CUTGetMainBundleIdentifier();
      _os_log_impl(&dword_210A81000, v0, OS_LOG_TYPE_DEFAULT, "Creating server connection for bundle %@", (uint8_t *)&v4, 0xCu);
    }
    qword_26AC05388 = [objc_alloc((Class)CUTWeakLinkClass()) initWithComponentId:81 andBlockOnConfiguration:1];
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    unint64_t v1 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = 81;
      _os_log_impl(&dword_210A81000, v1, OS_LOG_TYPE_DEFAULT, "Creating AWD server connection with component ID 0x%lx", (uint8_t *)&v4, 0xCu);
    }
    if (!qword_26AC05380)
    {
      uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      global_queue = dispatch_get_global_queue(-32768, 0);
      qword_26AC05380 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.ftawd.awd-queue", v2, global_queue);
    }
    if (qword_26AC05360 != -1) {
      dispatch_once(&qword_26AC05360, &unk_26C30E888);
    }
  }
}

id sub_210A83B28()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(dword_26AC05390, &state64);
  id v0 = objc_alloc(MEMORY[0x263EFF910]);
  unint64_t v1 = (void *)[v0 initWithTimeIntervalSince1970:(double)state64];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v6 = state64;
    __int16 v7 = 2112;
    uint32_t v8 = v1;
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "Getting submission date -- Timestamp %llu, submission Date: %@", buf, 0x16u);
  }
  return v1;
}

dispatch_queue_t sub_210A83C34()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  global_queue = dispatch_get_global_queue(-32768, 0);
  dispatch_queue_t result = dispatch_queue_create_with_target_V2("com.apple.ftawd.awd-queue", v0, global_queue);
  qword_26AC05380 = (uint64_t)result;
  return result;
}

void FTAWDLogSMSReceived(uint64_t a1, int a2, uint64_t a3, char a4, char a5, char a6, char a7)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_210A83EB8;
  v7[3] = &unk_264188B80;
  int v8 = a2;
  v7[4] = a3;
  char v9 = a4;
  char v10 = a5;
  char v11 = a6;
  char v12 = a7;
  sub_210A824A0(v7);
}

void sub_210A83EB8(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "FTAWDLogSMSReceved", (uint8_t *)&v25, 2u);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308433);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308449);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setFzError:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setCtError:", objc_msgSend(v7, "intValue"));
    }
    if (*(unsigned char *)(a1 + 44)) {
      [v6 setIsGroupMessage:1];
    }
    if (*(unsigned char *)(a1 + 45)) {
      [v6 setIsFromPhoneNumber:1];
    }
    if (*(unsigned char *)(a1 + 46)) {
      [v6 setIsFromEmail:1];
    }
    if (*(unsigned char *)(a1 + 47)) {
      [v6 setHasAttachments:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 134217984;
      uint64_t v26 = (uint64_t)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v25, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v25 = 138412290;
      uint64_t v26 = v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v25, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v25 = 134217984;
      uint64_t v26 = v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v25, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 fzError];
      int v25 = 67109120;
      LODWORD(v26) = v14;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v25, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v15 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v6 ctError];
      int v25 = 67109120;
      LODWORD(v26) = v16;
      _os_log_impl(&dword_210A81000, v15, OS_LOG_TYPE_DEFAULT, "           ctError: %d", (uint8_t *)&v25, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v6 isGroupMessage] ? @"YES" : @"NO";
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v25, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v6 isFromPhoneNumber] ? @"YES" : @"NO";
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, " isFromPhoneNumber: %@", (uint8_t *)&v25, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v6 isFromEmail] ? @"YES" : @"NO";
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "       isFromEmail: %@", (uint8_t *)&v25, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 hasAttachments]) {
        v24 = @"YES";
      }
      else {
        v24 = @"NO";
      }
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v25, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

BOOL sub_210A844F0()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableAWDHotShip", @"com.apple.Messages", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1 || arc4random_uniform(0x64u) == 1;
}

void FTAWDLogSMSSent(uint64_t a1, int a2, uint64_t a3, char a4, char a5, char a6, char a7, uint64_t a8)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A845D0;
  block[3] = &unk_264188BA8;
  int v9 = a2;
  char v10 = a4;
  char v11 = a5;
  char v12 = a6;
  char v13 = a7;
  block[4] = a3;
  block[5] = a8;
  sub_210A824A0(block);
}

void sub_210A845D0(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136446210;
    v29 = "void FTAWDLogSMSSent(NSString *, FTAWDFZError, NSNumber *, BOOL, BOOL, BOOL, BOOL, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308434);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308450);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 48)) {
      objc_msgSend(v6, "setFzError:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setCtError:", objc_msgSend(v7, "intValue"));
    }
    if (*(unsigned char *)(a1 + 52)) {
      [v6 setIsGroupMessage:1];
    }
    if (*(unsigned char *)(a1 + 53)) {
      [v6 setIsToPhoneNumber:1];
    }
    if (*(unsigned char *)(a1 + 54)) {
      [v6 setIsToEmail:1];
    }
    if (*(unsigned char *)(a1 + 55)) {
      [v6 setHasAttachments:1];
    }
    int v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v8, "unsignedIntValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      v29 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 guid];
      int v28 = 138412290;
      v29 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 timestamp];
      int v28 = 134217984;
      v29 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 fzError];
      int v28 = 67109120;
      LODWORD(v29) = v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 ctError];
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "           ctError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 isGroupMessage] ? @"YES" : @"NO";
      int v28 = 138412290;
      v29 = (const char *)v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 isToPhoneNumber] ? @"YES" : @"NO";
      int v28 = 138412290;
      v29 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "   isToPhoneNumber: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 isToEmail] ? @"YES" : @"NO";
      int v28 = 138412290;
      v29 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "         isToEmail: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 hasAttachments] ? @"YES" : @"NO";
      int v28 = 138412290;
      v29 = (const char *)v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 sendDuration];
      int v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "      sendDuration: %d", (uint8_t *)&v28, 8u);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageReceived(uint64_t a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_210A84D24;
  v8[3] = &unk_264188BC8;
  int v9 = a2;
  int v10 = a3;
  char v11 = a4;
  char v12 = a5;
  char v13 = a6;
  char v14 = a7;
  char v15 = a8;
  sub_210A824A0(v8);
}

void sub_210A84D24(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136446210;
    int v27 = "void FTAWDLogIMessageReceived(NSString *, FTAWDFZError, FTAWDMessageError, BOOL, BOOL, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308435);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308451);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 32)) {
      objc_msgSend(v6, "setFzError:");
    }
    if (*(_DWORD *)(a1 + 36)) {
      objc_msgSend(v6, "setMessageError:");
    }
    if (*(unsigned char *)(a1 + 40)) {
      [v6 setIsTypingIndicator:1];
    }
    if (*(unsigned char *)(a1 + 41)) {
      [v6 setIsGroupMessage:1];
    }
    if (*(unsigned char *)(a1 + 42)) {
      [v6 setIsFromPhoneNumber:1];
    }
    if (*(unsigned char *)(a1 + 43)) {
      [v6 setIsFromEmail:1];
    }
    if (*(unsigned char *)(a1 + 44)) {
      [v6 setHasAttachments:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    __int16 v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134217984;
      int v27 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 guid];
      int v26 = 138412290;
      int v27 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 timestamp];
      int v26 = 134217984;
      int v27 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v6 fzError];
      int v26 = 67109120;
      LODWORD(v27) = v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 messageError];
      int v26 = 67109120;
      LODWORD(v27) = v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "      messageError: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 isTypingIndicator] ? @"YES" : @"NO";
      int v26 = 138412290;
      int v27 = (const char *)v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, " isTypingIndicator: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 isGroupMessage] ? @"YES" : @"NO";
      int v26 = 138412290;
      int v27 = (const char *)v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 isFromPhoneNumber] ? @"YES" : @"NO";
      int v26 = 138412290;
      int v27 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " isFromPhoneNumber: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 isFromEmail] ? @"YES" : @"NO";
      int v26 = 138412290;
      int v27 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "       isFromEmail: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 hasAttachments]) {
        int v25 = @"YES";
      }
      else {
        int v25 = @"NO";
      }
      int v26 = 138412290;
      int v27 = (const char *)v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageSentWithConnectionType(uint64_t a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8, uint64_t a9, int a10)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_210A85484;
  v10[3] = &unk_264188BF0;
  int v11 = a2;
  int v12 = a3;
  char v14 = a4;
  char v15 = a5;
  char v16 = a6;
  char v17 = a7;
  char v18 = a8;
  v10[4] = a9;
  int v13 = a10;
  sub_210A824A0(v10);
}

void sub_210A85484(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136446210;
    v33 = "void FTAWDLogIMessageSentWithConnectionType(NSString *, FTAWDFZError, FTAWDMessageError, BOOL, BOOL, BOOL, BOO"
          "L, BOOL, NSNumber *, FTAWDiMessageConnectionType)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v32, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308419);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308452);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setFzError:");
    }
    if (*(_DWORD *)(a1 + 44)) {
      objc_msgSend(v6, "setMessageError:");
    }
    if (*(unsigned char *)(a1 + 52)) {
      [v6 setIsTypingIndicator:1];
    }
    if (*(unsigned char *)(a1 + 53)) {
      [v6 setIsGroupMessage:1];
    }
    if (*(unsigned char *)(a1 + 54)) {
      [v6 setIsToPhoneNumber:1];
    }
    if (*(unsigned char *)(a1 + 55)) {
      [v6 setIsToEmail:1];
    }
    if (*(unsigned char *)(a1 + 56)) {
      [v6 setHasAttachments:1];
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(_DWORD *)(a1 + 48)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 134217984;
      v33 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v32 = 138412290;
      v33 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v32 = 134217984;
      v33 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 fzError];
      int v32 = 67109120;
      LODWORD(v33) = v14;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v15 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v6 messageError];
      int v32 = 67109120;
      LODWORD(v33) = v16;
      _os_log_impl(&dword_210A81000, v15, OS_LOG_TYPE_DEFAULT, "      messageError: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = [v6 isTypingIndicator] ? @"YES" : @"NO";
      int v32 = 138412290;
      v33 = (const char *)v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, " isTypingIndicator: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v6 isGroupMessage] ? @"YES" : @"NO";
      int v32 = 138412290;
      v33 = (const char *)v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, "    isGroupMessage: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v6 isToPhoneNumber] ? @"YES" : @"NO";
      int v32 = 138412290;
      v33 = (const char *)v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "   isToPhoneNumber: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v6 isToEmail] ? @"YES" : @"NO";
      int v32 = 138412290;
      v33 = (const char *)v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, "         isToEmail: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v6 hasAttachments] ? @"YES" : @"NO";
      int v32 = 138412290;
      v33 = (const char *)v26;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "    hasAttachments: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v27 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v6 sendDuration];
      int v32 = 67109120;
      LODWORD(v33) = v28;
      _os_log_impl(&dword_210A81000, v27, OS_LOG_TYPE_DEFAULT, "      sendDuration: %d", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v29 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v30 = [v6 connectionType];
      if (v30 > 9) {
        v31 = @"Unknown";
      }
      else {
        v31 = off_264188F70[v30];
      }
      int v32 = 138412290;
      v33 = (const char *)v31;
      _os_log_impl(&dword_210A81000, v29, OS_LOG_TYPE_DEFAULT, "      connectionType: %@", (uint8_t *)&v32, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

__CFString *sub_210A85C7C(unsigned int a1)
{
  if (a1 > 9) {
    return @"Unknown";
  }
  else {
    return off_264188F70[a1];
  }
}

void FTAWDLogIMessageSent(uint64_t a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8, uint64_t a9)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_210A85484;
  v9[3] = &unk_264188BF0;
  int v10 = a2;
  int v11 = a3;
  char v13 = a4;
  char v14 = a5;
  char v15 = a6;
  char v16 = a7;
  char v17 = a8;
  v9[4] = a9;
  int v12 = 0;
  sub_210A824A0(v9);
}

void FTAWDLogIMessageAttachmentDownload(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_210A85E58;
  v9[3] = &unk_264188C18;
  int v14 = a2;
  int v15 = a3;
  v9[4] = a5;
  void v9[5] = a6;
  int v16 = a4;
  int v17 = a8;
  v9[6] = a7;
  v9[7] = a9;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  sub_210A824A0(v9);
}

void FTAWDLogIMessageAttachmentDownloadNew(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_210A85E58;
  v17[3] = &unk_264188C18;
  int v18 = a2;
  int v19 = a3;
  v17[4] = a5;
  v17[5] = a6;
  int v20 = a4;
  int v21 = a8;
  v17[6] = a7;
  v17[7] = a9;
  v17[8] = a11;
  v17[9] = a13;
  v17[10] = a15;
  v17[11] = a17;
  v17[12] = a10;
  v17[13] = a12;
  v17[14] = a14;
  v17[15] = a16;
  sub_210A824A0(v17);
}

void sub_210A85E58(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = 136446210;
    v53 = "void FTAWDLogIMessageAttachmentDownloadNew(NSString *, FTAWDFZError, FTAWDMessageError, FTAWDMMCSError, NSNumb"
          "er *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, NSNumber *, NSString *, NSNumber *, NSString *, NSNu"
          "mber *, NSString *, NSNumber *, NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v52, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308417);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308453);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 128)) {
      objc_msgSend(v6, "setFzError:");
    }
    if (*(_DWORD *)(a1 + 132)) {
      objc_msgSend(v6, "setMessageError:");
    }
    if (*(_DWORD *)(a1 + 136)) {
      objc_msgSend(v6, "setTokenError:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    int v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setDownloadDuration:", objc_msgSend(v8, "unsignedIntValue"));
    }
    uint64_t v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v9, "intValue"));
    }
    if (*(_DWORD *)(a1 + 140)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    long long v10 = *(void **)(a1 + 56);
    if (v10) {
      objc_msgSend(v6, "setAttachmentSize:", objc_msgSend(v10, "unsignedIntValue") / 0x3E8uLL);
    }
    long long v11 = *(void **)(a1 + 64);
    if (v11) {
      objc_msgSend(v6, "setFirstLevelMMCSError:", objc_msgSend(v11, "intValue"));
    }
    long long v12 = *(void **)(a1 + 72);
    if (v12) {
      objc_msgSend(v6, "setSecondLevelMMCSError:", objc_msgSend(v12, "intValue"));
    }
    long long v13 = *(void **)(a1 + 80);
    if (v13) {
      objc_msgSend(v6, "setThirdLevelMMCSError:", objc_msgSend(v13, "intValue"));
    }
    int v14 = *(void **)(a1 + 88);
    if (v14) {
      objc_msgSend(v6, "setFourthLevelMMCSError:", objc_msgSend(v14, "intValue"));
    }
    if (*(void *)(a1 + 96)) {
      objc_msgSend(v6, "setFirstLevelMMCSErrorDomain:");
    }
    if (*(void *)(a1 + 104)) {
      objc_msgSend(v6, "setSecondLevelMMCSErrorDomain:");
    }
    if (*(void *)(a1 + 112)) {
      objc_msgSend(v6, "setThirdLevelMMCSErrorDomain:");
    }
    if (*(void *)(a1 + 120)) {
      objc_msgSend(v6, "setFourthLevelMMCSErrorDomain:");
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v15 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v6 firstLevelMMCSError];
      int v52 = 67109120;
      LODWORD(v53) = v16;
      _os_log_impl(&dword_210A81000, v15, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v6 firstLevelMMCSErrorDomain];
      int v52 = 138412290;
      v53 = (const char *)v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [v6 secondLevelMMCSError];
      int v52 = 67109120;
      LODWORD(v53) = v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v6 secondLevelMMCSErrorDomain];
      int v52 = 138412290;
      v53 = (const char *)v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v6 thirdLevelMMCSError];
      int v52 = 67109120;
      LODWORD(v53) = v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v6 thirdLevelMMCSErrorDomain];
      int v52 = 138412290;
      v53 = (const char *)v26;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v27 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v6 fourthLevelMMCSError];
      int v52 = 67109120;
      LODWORD(v53) = v28;
      _os_log_impl(&dword_210A81000, v27, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorCode: %d", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v29 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v6 fourthLevelMMCSErrorDomain];
      int v52 = 138412290;
      v53 = (const char *)v30;
      _os_log_impl(&dword_210A81000, v29, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorDomain: %@", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v31 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = 134217984;
      v53 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v31, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v32 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v6 guid];
      int v52 = 138412290;
      v53 = (const char *)v33;
      _os_log_impl(&dword_210A81000, v32, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v34 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v6 timestamp];
      int v52 = 134217984;
      v53 = (const char *)v35;
      _os_log_impl(&dword_210A81000, v34, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v52, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v36 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = [v6 fzError];
      int v52 = 67109120;
      LODWORD(v53) = v37;
      _os_log_impl(&dword_210A81000, v36, OS_LOG_TYPE_DEFAULT, "           fzError: %u", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v38 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = [v6 messageError];
      int v52 = 67109120;
      LODWORD(v53) = v39;
      _os_log_impl(&dword_210A81000, v38, OS_LOG_TYPE_DEFAULT, "      messageError: %u", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v40 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = [v6 tokenError];
      int v52 = 67109120;
      LODWORD(v53) = v41;
      _os_log_impl(&dword_210A81000, v40, OS_LOG_TYPE_DEFAULT, "        tokenError: %u", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v42 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = [v6 genericError];
      int v52 = 67109120;
      LODWORD(v53) = v43;
      _os_log_impl(&dword_210A81000, v42, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v44 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = [v6 downloadDuration];
      int v52 = 67109120;
      LODWORD(v53) = v45;
      _os_log_impl(&dword_210A81000, v44, OS_LOG_TYPE_DEFAULT, "  downloadDuration: %u", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v46 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = [v6 linkQuality];
      int v52 = 67109120;
      LODWORD(v53) = v47;
      _os_log_impl(&dword_210A81000, v46, OS_LOG_TYPE_DEFAULT, "       linkQuality: %d", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v48 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = [v6 connectionType];
      int v52 = 67109120;
      LODWORD(v53) = v49;
      _os_log_impl(&dword_210A81000, v48, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v52, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v50 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = [v6 attachmentSize];
      int v52 = 67109120;
      LODWORD(v53) = v51;
      _os_log_impl(&dword_210A81000, v50, OS_LOG_TYPE_DEFAULT, "    attachmentSize: %u", (uint8_t *)&v52, 8u);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageAttachmentUpload(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_210A86AE8;
  v9[3] = &unk_264188C40;
  int v15 = a2;
  int v16 = a3;
  v9[4] = a5;
  void v9[5] = a6;
  int v17 = a4;
  int v18 = a8;
  v9[6] = a7;
  v9[7] = a9;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sub_210A824A0(v9);
}

__n128 FTAWDLogIMessageAttachmentUploadNew(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_210A86AE8;
  v19[3] = &unk_264188C40;
  int v30 = a2;
  int v31 = a3;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  int v32 = a4;
  int v33 = a8;
  long long v20 = a9;
  uint64_t v21 = a10;
  uint64_t v22 = a12;
  uint64_t v23 = a14;
  uint64_t v24 = a16;
  uint64_t v25 = a18;
  uint64_t v26 = a11;
  uint64_t v27 = a13;
  uint64_t v28 = a15;
  uint64_t v29 = a17;
  sub_210A824A0(v19);
  return result;
}

void sub_210A86AE8(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v58 = 136446210;
    v59 = "void FTAWDLogIMessageAttachmentUploadNew(NSString *, FTAWDFZError, FTAWDMessageError, FTAWDMMCSError, NSNumber"
          " *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, NSNumber *, NSNumber *, NSNumber *, NSString *, NSNumb"
          "er *, NSString *, NSNumber *, NSString *, NSNumber *, NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v58, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308418);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308454);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(_DWORD *)(a1 + 144)) {
      objc_msgSend(v6, "setFzError:");
    }
    if (*(_DWORD *)(a1 + 148)) {
      objc_msgSend(v6, "setMessageError:");
    }
    if (*(_DWORD *)(a1 + 152)) {
      objc_msgSend(v6, "setTokenError:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    int v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setUploadDuration:", objc_msgSend(v8, "unsignedIntValue"));
    }
    uint64_t v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v9, "intValue"));
    }
    if (*(_DWORD *)(a1 + 156)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    long long v10 = *(void **)(a1 + 56);
    if (v10) {
      objc_msgSend(v6, "setAttachmentSize:", objc_msgSend(v10, "unsignedIntValue") / 0x3E8uLL);
    }
    long long v11 = *(void **)(a1 + 64);
    if (v11) {
      objc_msgSend(v6, "setTimeFromLastPrewarm:", objc_msgSend(v11, "unsignedIntValue"));
    }
    long long v12 = *(void **)(a1 + 72);
    if (v12) {
      objc_msgSend(v6, "setLastPrewarmDuration:", objc_msgSend(v12, "unsignedIntValue"));
    }
    long long v13 = *(void **)(a1 + 80);
    if (v13) {
      objc_msgSend(v6, "setFirstLevelMMCSError:", objc_msgSend(v13, "intValue"));
    }
    long long v14 = *(void **)(a1 + 88);
    if (v14) {
      objc_msgSend(v6, "setSecondLevelMMCSError:", objc_msgSend(v14, "intValue"));
    }
    int v15 = *(void **)(a1 + 96);
    if (v15) {
      objc_msgSend(v6, "setThirdLevelMMCSError:", objc_msgSend(v15, "intValue"));
    }
    int v16 = *(void **)(a1 + 104);
    if (v16) {
      objc_msgSend(v6, "setFourthLevelMMCSError:", objc_msgSend(v16, "intValue"));
    }
    if (*(void *)(a1 + 112)) {
      objc_msgSend(v6, "setFirstLevelMMCSErrorDomain:");
    }
    if (*(void *)(a1 + 120)) {
      objc_msgSend(v6, "setSecondLevelMMCSErrorDomain:");
    }
    if (*(void *)(a1 + 128)) {
      objc_msgSend(v6, "setThirdLevelMMCSErrorDomain:");
    }
    if (*(void *)(a1 + 136)) {
      objc_msgSend(v6, "setFourthLevelMMCSErrorDomain:");
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v6 firstLevelMMCSError];
      int v58 = 67109120;
      LODWORD(v59) = v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v6 firstLevelMMCSErrorDomain];
      int v58 = 138412290;
      v59 = (const char *)v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, "   firstLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v6 secondLevelMMCSError];
      int v58 = 67109120;
      LODWORD(v59) = v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v6 secondLevelMMCSErrorDomain];
      int v58 = 138412290;
      v59 = (const char *)v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, "   secondLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v6 thirdLevelMMCSError];
      int v58 = 67109120;
      LODWORD(v59) = v26;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v27 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v6 thirdLevelMMCSErrorDomain];
      int v58 = 138412290;
      v59 = (const char *)v28;
      _os_log_impl(&dword_210A81000, v27, OS_LOG_TYPE_DEFAULT, "   thirdLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v29 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [v6 fourthLevelMMCSError];
      int v58 = 67109120;
      LODWORD(v59) = v30;
      _os_log_impl(&dword_210A81000, v29, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorCode: %d", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v31 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v6 fourthLevelMMCSErrorDomain];
      int v58 = 138412290;
      v59 = (const char *)v32;
      _os_log_impl(&dword_210A81000, v31, OS_LOG_TYPE_DEFAULT, "   fourthLevelMMCSErrorDomain: %@", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v33 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v58 = 134217984;
      v59 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v33, OS_LOG_TYPE_DEFAULT, "      Metric Object: %p", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v34 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v6 guid];
      int v58 = 138412290;
      v59 = (const char *)v35;
      _os_log_impl(&dword_210A81000, v34, OS_LOG_TYPE_DEFAULT, "               GUID: %@", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v36 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [v6 timestamp];
      int v58 = 134217984;
      v59 = (const char *)v37;
      _os_log_impl(&dword_210A81000, v36, OS_LOG_TYPE_DEFAULT, "          Timestamp: %llu", (uint8_t *)&v58, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v38 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = [v6 fzError];
      int v58 = 67109120;
      LODWORD(v59) = v39;
      _os_log_impl(&dword_210A81000, v38, OS_LOG_TYPE_DEFAULT, "            fzError: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v40 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = [v6 messageError];
      int v58 = 67109120;
      LODWORD(v59) = v41;
      _os_log_impl(&dword_210A81000, v40, OS_LOG_TYPE_DEFAULT, "       messageError: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v42 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = [v6 tokenError];
      int v58 = 67109120;
      LODWORD(v59) = v43;
      _os_log_impl(&dword_210A81000, v42, OS_LOG_TYPE_DEFAULT, "         tokenError: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v44 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = [v6 genericError];
      int v58 = 67109120;
      LODWORD(v59) = v45;
      _os_log_impl(&dword_210A81000, v44, OS_LOG_TYPE_DEFAULT, "       genericError: %d", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v46 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = [v6 uploadDuration];
      int v58 = 67109120;
      LODWORD(v59) = v47;
      _os_log_impl(&dword_210A81000, v46, OS_LOG_TYPE_DEFAULT, "     uploadDuration: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v48 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = [v6 linkQuality];
      int v58 = 67109120;
      LODWORD(v59) = v49;
      _os_log_impl(&dword_210A81000, v48, OS_LOG_TYPE_DEFAULT, "        linkQuality: %d", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v50 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = [v6 connectionType];
      int v58 = 67109120;
      LODWORD(v59) = v51;
      _os_log_impl(&dword_210A81000, v50, OS_LOG_TYPE_DEFAULT, "     connectionType: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v52 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = [v6 attachmentSize];
      int v58 = 67109120;
      LODWORD(v59) = v53;
      _os_log_impl(&dword_210A81000, v52, OS_LOG_TYPE_DEFAULT, "     attachmentSize: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v54 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v55 = [v6 timeFromLastPrewarm];
      int v58 = 67109120;
      LODWORD(v59) = v55;
      _os_log_impl(&dword_210A81000, v54, OS_LOG_TYPE_DEFAULT, "timeFromLastPrewarm: %u", (uint8_t *)&v58, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v56 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = [v6 lastPrewarmDuration];
      int v58 = 67109120;
      LODWORD(v59) = v57;
      _os_log_impl(&dword_210A81000, v56, OS_LOG_TYPE_DEFAULT, "lastPrewarmDuration: %u", (uint8_t *)&v58, 8u);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageDelivered(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A877B8;
  block[3] = &unk_264188C68;
  block[4] = a2;
  sub_210A824A0(block);
}

void sub_210A877B8(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446210;
    int v16 = "void FTAWDLogIMessageDelivered(NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v15, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308420);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308455);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setDeliveryDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      int v16 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v15, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v15 = 138412290;
      int v16 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v15, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v15 = 134217984;
      int v16 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v15, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 deliveryDuration];
      int v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "  deliveryDuration: %u", (uint8_t *)&v15, 8u);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageDowngrade(uint64_t a1, uint64_t a2, char a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_210A87BB0;
  v3[3] = &unk_264188C90;
  v3[4] = a2;
  char v4 = a3;
  sub_210A824A0(v3);
}

void sub_210A87BB0(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446210;
    int v18 = "void FTAWDLogIMessageDowngrade(NSString *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v17, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308440);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308456);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setDurationBeforeDowngrade:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 40)) {
      [v6 setIsManualDowngrade:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      int v18 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "          Metric Object: %p", (uint8_t *)&v17, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v17 = 138412290;
      int v18 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "                   GUID: %@", (uint8_t *)&v17, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v17 = 134217984;
      int v18 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              Timestamp: %llu", (uint8_t *)&v17, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 durationBeforeDowngrade];
      int v17 = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "durationBeforeDowngrade: %u", (uint8_t *)&v17, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v15 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = @"YES";
      if (!*(unsigned char *)(a1 + 40)) {
        int v16 = @"NO";
      }
      int v17 = 138412290;
      int v18 = (const char *)v16;
      _os_log_impl(&dword_210A81000, v15, OS_LOG_TYPE_DEFAULT, "      isManualDowngrade: %@", (uint8_t *)&v17, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void sub_210A87FD4(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136446210;
    uint64_t v35 = "void FTAWDLogIMessageQueryFinished(NSString *, BOOL, FTAWDNetworkConnectionType, NSNumber *, BOOL, BOOL, FTAWD"
          "ConferenceMessageResultCode, NSNumber *, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v34, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308441);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308457);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 72)) {
      [v6 setSuccess:1];
    }
    if (*(_DWORD *)(a1 + 64)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setQueryDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 73)) {
      [v6 setIsPhoneNumber:1];
    }
    if (*(unsigned char *)(a1 + 74)) {
      [v6 setIsEmail:1];
    }
    if (*(_DWORD *)(a1 + 68)) {
      objc_msgSend(v6, "setResultCode:");
    }
    int v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v8, "intValue"));
    }
    uint64_t v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v9, "intValue"));
    }
    uint64_t v10 = *(void **)(a1 + 56);
    if (v10) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v10, "intValue"));
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && *(unsigned char *)(a1 + 75)) {
      [v6 setWasReversePushAttempted:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    long long v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 134217984;
      uint64_t v35 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v34, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 guid];
      int v34 = 138412290;
      uint64_t v35 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v34, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 timestamp];
      int v34 = 134217984;
      uint64_t v35 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v34, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 success] ? @"YES" : @"NO";
      int v34 = 138412290;
      uint64_t v35 = (const char *)v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v34, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 connectionType];
      int v34 = 67109120;
      LODWORD(v35) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v34, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 queryDuration];
      int v34 = 67109120;
      LODWORD(v35) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "     queryDuration: %u", (uint8_t *)&v34, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v6 isPhoneNumber] ? @"YES" : @"NO";
      int v34 = 138412290;
      uint64_t v35 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "     isPhoneNumber: %@", (uint8_t *)&v34, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v6 isEmail] ? @"YES" : @"NO";
      int v34 = 138412290;
      uint64_t v35 = (const char *)v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "           isEmail: %@", (uint8_t *)&v34, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 resultCode];
      int v34 = 67109120;
      LODWORD(v35) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v34, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [v6 genericError];
      int v34 = 67109120;
      LODWORD(v35) = v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v34, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v30 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = [v6 uRLError];
      int v34 = 67109120;
      LODWORD(v35) = v31;
      _os_log_impl(&dword_210A81000, v30, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v34, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v32 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = [v6 pOSIXError];
      int v34 = 67109120;
      LODWORD(v35) = v33;
      _os_log_impl(&dword_210A81000, v32, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v34, 8u);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageDeduplicated(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A88840;
  block[3] = &unk_264188C68;
  block[4] = a2;
  sub_210A824A0(block);
}

void sub_210A88840(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446210;
    int v16 = "void FTAWDLogIMessageDeduplicated(NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v15, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5308442);
  unint64_t v4 = (unint64_t)sub_210A82B44(5308458);
  if (v3 | v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setDeduplicationInterval:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      int v16 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "        Metric Object: %p", (uint8_t *)&v15, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v15 = 138412290;
      int v16 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "                 GUID: %@", (uint8_t *)&v15, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v15 = 134217984;
      int v16 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "            Timestamp: %llu", (uint8_t *)&v15, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 deduplicationInterval];
      int v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "deduplicationInterval: %u", (uint8_t *)&v15, 8u);
    }
    sub_210A82E50(v6, (void *)v3);
    if (sub_210A844F0())
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogIMessageHealthCheckPerformed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A88C3C;
  block[3] = &unk_264188CE0;
  block[4] = a1;
  void block[5] = a2;
  void block[6] = a3;
  void block[7] = a4;
  block[8] = a5;
  block[9] = a6;
  block[10] = a7;
  sub_210A824A0(block);
}

void sub_210A88C3C(void *a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v53 = "void FTAWDLogIMessageHealthCheckPerformed(NSNumber *, NSNumber *, NSNumber *, NSArray<NSNumber *> *, NSArray<N"
          "SNumber *> *, NSArray<NSNumber *> *, NSArray<NSNumber *> *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v3 = sub_210A82B44(5308459);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    id v6 = (void *)a1[4];
    if (v6) {
      objc_msgSend(v5, "setNumberOfRequests:", objc_msgSend(v6, "unsignedIntValue"));
    }
    __int16 v7 = (void *)a1[5];
    if (v7) {
      objc_msgSend(v5, "setNumberOfResponses:", objc_msgSend(v7, "unsignedIntValue"));
    }
    int v8 = (void *)a1[6];
    if (v8) {
      objc_msgSend(v5, "setNumMessages:", objc_msgSend(v8, "unsignedIntValue"));
    }
    uint64_t v9 = (void *)a1[7];
    if (v9)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v45 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(v5, "addNumOutOfOrder:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "unsignedIntValue"));
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v51 count:16];
        }
        while (v11);
      }
    }
    int v14 = (void *)a1[8];
    if (v14)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(v5, "addNumMissed:", objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * j), "unsignedIntValue"));
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v16);
      }
    }
    int v19 = (void *)a1[9];
    if (v19)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v37;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(v5, "addAliasesMatched:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * k), "unsignedIntValue"));
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v49 count:16];
        }
        while (v21);
      }
    }
    uint64_t v24 = (void *)a1[10];
    if (v24)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v48 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v33;
        do
        {
          for (uint64_t m = 0; m != v26; ++m)
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(v24);
            }
            objc_msgSend(v5, "addCoarseMatched:", objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * m), "unsignedIntValue"));
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v48 count:16];
        }
        while (v26);
      }
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v29 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v53 = (const char *)v5;
      _os_log_impl(&dword_210A81000, v29, OS_LOG_TYPE_DEFAULT, "        Metric Object: %p", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v30 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v5 timestamp];
      *(_DWORD *)buf = 134217984;
      int v53 = (const char *)v31;
      _os_log_impl(&dword_210A81000, v30, OS_LOG_TYPE_DEFAULT, "            Timestamp: %llu", buf, 0xCu);
    }
    sub_210A82E50(v5, v4);
  }
}

void FTAWDLogIMessageCloudKitSyncFailed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_210A89178;
  v6[3] = &unk_264188D08;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = a4;
  v6[8] = a5;
  v6[9] = a6;
  sub_210A824A0(v6);
}

void sub_210A89178(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    uint64_t v13 = "void FTAWDLogIMessageCloudKitSyncFailed(NSString *, NSString *, NSNumber *, NSString *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }
  id v3 = sub_210A82B44(5308460);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (a1[4]) {
      objc_msgSend(v5, "setSyncType:");
    }
    if (a1[5]) {
      objc_msgSend(v5, "setTopLevelErrorDomain:");
    }
    id v6 = (void *)a1[6];
    if (v6) {
      objc_msgSend(v5, "setTopLevelErrorCode:", objc_msgSend(v6, "intValue"));
    }
    if (a1[7]) {
      objc_msgSend(v5, "setNestedErrorDomain:");
    }
    __int16 v7 = (void *)a1[8];
    if (v7) {
      objc_msgSend(v5, "setNestedErrorCode:", objc_msgSend(v7, "intValue"));
    }
    int v8 = (void *)a1[9];
    if (v8) {
      objc_msgSend(v5, "setLinkQuality:", objc_msgSend(v8, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    uint64_t v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = (const char *)v5;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "        Metric Object: %p", (uint8_t *)&v12, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 timestamp];
      int v12 = 134217984;
      uint64_t v13 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "            Timestamp: %llu", (uint8_t *)&v12, 0xCu);
    }
    sub_210A82E50(v5, v4);
  }
}

void FTAWDLogIMessageCloudKitValidatePurgeableAttachment(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_210A89488;
  v8[3] = &unk_264188D30;
  char v9 = a1;
  void v8[4] = a2;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  v8[8] = a6;
  v8[9] = a7;
  v8[10] = a8;
  sub_210A824A0(v8);
}

void sub_210A89488(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136446210;
    uint64_t v31 = "void FTAWDLogIMessageCloudKitValidatePurgeableAttachment(BOOL, NSNumber *, NSString *, NSNumber *, NSString *,"
          " NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }
  id v3 = sub_210A82B44(5308461);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v5, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 88)) {
      [v5 setValidatedAttachment:1];
    }
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      objc_msgSend(v5, "setAttachmentSize:", objc_msgSend(v6, "unsignedIntValue"));
    }
    if (*(void *)(a1 + 40)) {
      objc_msgSend(v5, "setOperationalErrorDomain:");
    }
    __int16 v7 = *(void **)(a1 + 48);
    if (v7) {
      objc_msgSend(v5, "setOperationalErrorCode:", objc_msgSend(v7, "intValue"));
    }
    if (*(void *)(a1 + 56)) {
      objc_msgSend(v5, "setValidationErrorDomain:");
    }
    int v8 = *(void **)(a1 + 64);
    if (v8) {
      objc_msgSend(v5, "setValidationErrorCode:", objc_msgSend(v8, "intValue"));
    }
    char v9 = *(void **)(a1 + 72);
    if (v9) {
      objc_msgSend(v5, "setLinkQuality:", objc_msgSend(v9, "intValue"));
    }
    uint64_t v10 = *(void **)(a1 + 80);
    if (v10) {
      objc_msgSend(v5, "setConnectionType:", objc_msgSend(v10, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    uint64_t v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134217984;
      uint64_t v31 = (const char *)v5;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "          Metric Object: %p", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v5 timestamp];
      int v30 = 134217984;
      uint64_t v31 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "              Timestamp: %llu", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v5 validatedAttachment];
      int v30 = 67109120;
      LODWORD(v31) = v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "    validatedAttachment: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v5 attachmentSize];
      int v30 = 67109120;
      LODWORD(v31) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "         attachmentSize: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v5 validationErrorDomain];
      int v30 = 138412290;
      uint64_t v31 = (const char *)v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, " operationalErrorDomain: %@", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v5 validationErrorCode];
      int v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "   operationalErrorCode: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v5 operationalErrorDomain];
      int v30 = 138412290;
      uint64_t v31 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "  validationErrorDomain: %@", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v5 operationalErrorCode];
      int v30 = 67109120;
      LODWORD(v31) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "    validationErrorCode: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v5 linkQuality];
      int v30 = 67109120;
      LODWORD(v31) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "            linkQuality: %d", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [v5 connectionType];
      int v30 = 67109120;
      LODWORD(v31) = v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "         connectionType: %u", (uint8_t *)&v30, 8u);
    }
    sub_210A82E50(v5, v4);
  }
}

void FTAWDLogCallStarted(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A89B60;
  block[3] = &unk_264188D50;
  char v8 = a3;
  char v9 = a4;
  char v10 = a5;
  char v11 = a6;
  char v12 = a7;
  char v13 = a2;
  sub_210A824A0(block);
}

void sub_210A89B60(unsigned char *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136446210;
    int v25 = "void FTAWDLogCallStarted(NSString *, BOOL, BOOL, BOOL, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v24, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312513);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312529);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (a1[32]) {
      [v6 setIsVideo:1];
    }
    if (a1[33]) {
      [v6 setIsToPhoneNumber:1];
    }
    if (a1[34]) {
      [v6 setIsToEmail:1];
    }
    if (a1[35]) {
      [v6 setIsCallUpgrade:1];
    }
    if (a1[36]) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    __int16 v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      int v25 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 guid];
      int v24 = 138412290;
      int v25 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 timestamp];
      int v24 = 134217984;
      int v25 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "         Timestamp: %llu", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = [v6 isVideo] ? @"YES" : @"NO";
      int v24 = 138412290;
      int v25 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "           isVideo: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 isToPhoneNumber] ? @"YES" : @"NO";
      int v24 = 138412290;
      int v25 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "   isToPhoneNumber: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 isToEmail] ? @"YES" : @"NO";
      int v24 = 138412290;
      int v25 = (const char *)v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "         isToEmail: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v6 isCallUpgrade] ? @"YES" : @"NO";
      int v24 = 138412290;
      int v25 = (const char *)v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "     isCallUpgrade: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v21 = @"YES";
      }
      else {
        int v21 = @"NO";
      }
      int v24 = 138412290;
      int v25 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "      onLockScreen: %@", (uint8_t *)&v24, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v22 = a1[37];
    id v23 = sub_210A83B28();
    if (sub_210A8A13C(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

BOOL sub_210A8A13C(int a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"GMT"];
  [v5 setTimeZone:v6];
  __int16 v7 = (void *)[v5 components:112 fromDate:a2];
  uint64_t v8 = [v7 day];
  uint64_t v9 = [v7 hour];
  uint64_t v10 = [v7 minute];

  if (v9 == 23 && v10 > 54) {
    return 0;
  }
  if (!v9 && v10 < 6) {
    return 0;
  }
  if (a1) {
    return (v8 & 0x8000000000000001) == 1;
  }
  else {
    return (v8 & 1) == 0;
  }
}

__n128 FTAWDLogCallConnected(uint64_t a1, char a2, char a3, uint64_t a4, int a5, int a6, int a7, char a8, long long a9, uint64_t a10, char a11)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_210A8A2C8;
  v12[3] = &unk_264188D78;
  char v18 = a3;
  v12[4] = a4;
  int v15 = a5;
  int v16 = a6;
  int v17 = a7;
  char v19 = a8;
  long long v13 = a9;
  uint64_t v14 = a10;
  char v20 = a11;
  char v21 = a2;
  sub_210A824A0(v12);
  return result;
}

void sub_210A8A2C8(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 136446210;
    long long v40 = "void FTAWDLogCallConnected(NSString *, BOOL, BOOL, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnect"
          "ionType, FTAWDConnectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v39, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312514);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312530);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 76)) {
      [v6 setIsVideo:1];
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setConnectDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(_DWORD *)(a1 + 64)) {
      objc_msgSend(v6, "setRemoteNetworkConnection:");
    }
    if (*(_DWORD *)(a1 + 68)) {
      objc_msgSend(v6, "setLocalNetworkConnection:");
    }
    if (*(_DWORD *)(a1 + 72)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    if (*(unsigned char *)(a1 + 77)) {
      [v6 setUsesRelay:1];
    }
    uint64_t v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setCurrentNatType:", objc_msgSend(v8, "unsignedIntValue"));
    }
    uint64_t v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setRemoteNatType:", objc_msgSend(v9, "unsignedIntValue"));
    }
    uint64_t v10 = *(void **)(a1 + 56);
    if (v10) {
      objc_msgSend(v6, "setRelayConnectDuration:", objc_msgSend(v10, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 78)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    uint64_t v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 134217984;
      long long v40 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              Metric Object: %p", (uint8_t *)&v39, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 guid];
      int v39 = 138412290;
      long long v40 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "                       GUID: %@", (uint8_t *)&v39, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 timestamp];
      int v39 = 134217984;
      long long v40 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "                  Timestamp: %llu", (uint8_t *)&v39, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "                      ", (uint8_t *)&v39, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = [v6 isVideo] ? @"YES" : @"NO";
      int v39 = 138412290;
      long long v40 = (const char *)v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, "                    isVideo: %@", (uint8_t *)&v39, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [v6 connectDuration];
      int v39 = 67109120;
      LODWORD(v40) = v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, "            connectDuration: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v6 remoteNetworkConnection];
      int v39 = 67109120;
      LODWORD(v40) = v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "remoteNetworkConnectionType: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    id v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v6 localNetworkConnection];
      int v39 = 67109120;
      LODWORD(v40) = v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, " localNetworkConnectionType: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v6 connectionType];
      int v39 = 67109120;
      LODWORD(v40) = v26;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "             connectionType: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v27 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v6 usesRelay] ? @"YES" : @"NO";
      int v39 = 138412290;
      long long v40 = (const char *)v28;
      _os_log_impl(&dword_210A81000, v27, OS_LOG_TYPE_DEFAULT, "                  usesRelay: %@", (uint8_t *)&v39, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v29 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [v6 currentNatType];
      int v39 = 67109120;
      LODWORD(v40) = v30;
      _os_log_impl(&dword_210A81000, v29, OS_LOG_TYPE_DEFAULT, "             currentNatType: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v31 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = [v6 remoteNatType];
      int v39 = 67109120;
      LODWORD(v40) = v32;
      _os_log_impl(&dword_210A81000, v31, OS_LOG_TYPE_DEFAULT, "              remoteNatType: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v33 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = [v6 relayConnectDuration];
      int v39 = 67109120;
      LODWORD(v40) = v34;
      _os_log_impl(&dword_210A81000, v33, OS_LOG_TYPE_DEFAULT, "       relayConnectDuration: %u", (uint8_t *)&v39, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v35 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        long long v36 = @"YES";
      }
      else {
        long long v36 = @"NO";
      }
      int v39 = 138412290;
      long long v40 = (const char *)v36;
      _os_log_impl(&dword_210A81000, v35, OS_LOG_TYPE_DEFAULT, "               onLockScreen: %@", (uint8_t *)&v39, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v37 = *(unsigned __int8 *)(a1 + 79);
    id v38 = sub_210A83B28();
    if (sub_210A8A13C(v37, (uint64_t)v38))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

__n128 FTAWDLogCallEnded(uint64_t a1, char a2, char a3, int a4, int a5, int a6, int a7, int a8, long long a9, long long a10, long long a11, uint64_t a12, char a13, char a14, char a15, int a16, long long a17, long long a18, uint64_t a19, uint64_t a20,int a21,char a22,long long a23,uint64_t a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A8ACD8;
  block[3] = &unk_264188DA0;
  char v51 = a3;
  int v42 = a4;
  int v43 = a5;
  int v44 = a6;
  int v45 = a7;
  int v46 = a8;
  long long v47 = a9;
  long long v32 = a10;
  long long v33 = a11;
  uint64_t v34 = a12;
  char v52 = a13;
  char v53 = a14;
  char v54 = a15;
  int v48 = a16;
  long long v35 = a17;
  long long v36 = a18;
  uint64_t v37 = a19;
  uint64_t v49 = a20;
  int v50 = a21;
  char v55 = a22;
  long long v38 = a23;
  char v56 = a2;
  char v57 = a25;
  char v58 = a26;
  char v59 = a27;
  uint64_t v39 = a24;
  uint64_t v40 = a28;
  uint64_t v41 = a29;
  char v60 = a30;
  sub_210A824A0(block);
  return result;
}

void sub_210A8ACD8(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v119 = 136446210;
    v120 = "void FTAWDLogCallEnded(NSString *, BOOL, BOOL, FTAWDConferenceEndedReason, FTAWDConferenceError, FTAWDConfere"
           "nceViceroyError, FTAWDConferenceGameKitError, FTAWDConferenceMessageDeliveryError, FTAWDConferenceMiscError, "
           "FTAWDConferenceRegistrationError, FTAWDConferenceRelayError, FTAWDConferenceInvitationServiceError, NSNumber "
           "*, NSNumber *, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, FTAWDNetworkCheckResult, NSNumber *, NSN"
           "umber *, NSNumber *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnectionType, FTAWDCon"
           "nectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v119, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312515);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312531);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 204)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 152)) {
      objc_msgSend(v6, "setEndedReason:");
    }
    if (*(_DWORD *)(a1 + 156)) {
      objc_msgSend(v6, "setGenericError:");
    }
    if (*(_DWORD *)(a1 + 160)) {
      objc_msgSend(v6, "setViceroyError:");
    }
    if (*(_DWORD *)(a1 + 164)) {
      objc_msgSend(v6, "setGameKitError:");
    }
    if (*(_DWORD *)(a1 + 168)) {
      objc_msgSend(v6, "setMessageDeliveryError:");
    }
    if (*(_DWORD *)(a1 + 172)) {
      objc_msgSend(v6, "setConferenceMiscError:");
    }
    if (*(_DWORD *)(a1 + 176)) {
      objc_msgSend(v6, "setRegistrationError:");
    }
    if (*(_DWORD *)(a1 + 180)) {
      objc_msgSend(v6, "setRelayError:");
    }
    if (*(_DWORD *)(a1 + 184)) {
      objc_msgSend(v6, "setInvitationServiceError:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 doubleValue];
      [v6 setCallDuration:(ceil(v8 / 10.0) * 10.0)];
    }
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9) {
      objc_msgSend(v6, "setDiagnosticPingMin:", objc_msgSend(v9, "unsignedIntValue"));
    }
    uint64_t v10 = *(void **)(a1 + 48);
    if (v10) {
      objc_msgSend(v6, "setDiagnosticPingAvg:", objc_msgSend(v10, "unsignedIntValue"));
    }
    uint64_t v11 = *(void **)(a1 + 56);
    if (v11) {
      objc_msgSend(v6, "setDiagnosticPingMax:", objc_msgSend(v11, "unsignedIntValue"));
    }
    char v12 = *(void **)(a1 + 64);
    if (v12) {
      objc_msgSend(v6, "setDiagnosticPingPacketLoss:", objc_msgSend(v12, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 205)) {
      [v6 setIsNetworkEnabled:1];
    }
    if (*(unsigned char *)(a1 + 206)) {
      [v6 setIsNetworkActive:1];
    }
    if (*(unsigned char *)(a1 + 207)) {
      [v6 setIsNetworkReachable:1];
    }
    if (*(_DWORD *)(a1 + 188)) {
      objc_msgSend(v6, "setNetworkCheckResult:");
    }
    uint64_t v13 = *(void **)(a1 + 72);
    if (v13)
    {
      [v13 doubleValue];
      [v6 setFrontCameraCaptureDuration:(ceil(v14 / 10.0) * 10.0)];
    }
    uint64_t v15 = *(void **)(a1 + 80);
    if (v15)
    {
      [v15 doubleValue];
      [v6 setBackCameraCaptureDuration:(ceil(v16 / 10.0) * 10.0)];
    }
    int v17 = *(void **)(a1 + 88);
    if (v17) {
      objc_msgSend(v6, "setDataRate:", 7 * objc_msgSend(v17, "unsignedIntValue") + 931);
    }
    char v18 = *(void **)(a1 + 96);
    if (v18) {
      objc_msgSend(v6, "setGksError:", objc_msgSend(v18, "intValue"));
    }
    char v19 = *(void **)(a1 + 104);
    if (v19) {
      objc_msgSend(v6, "setConnectDuration:", objc_msgSend(v19, "unsignedIntValue"));
    }
    if (*(_DWORD *)(a1 + 192)) {
      objc_msgSend(v6, "setRemoteNetworkConnection:");
    }
    if (*(_DWORD *)(a1 + 196)) {
      objc_msgSend(v6, "setLocalNetworkConnection:");
    }
    if (*(_DWORD *)(a1 + 200)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    if (*(unsigned char *)(a1 + 208)) {
      [v6 setUsesRelay:1];
    }
    int v20 = *(void **)(a1 + 112);
    if (v20) {
      objc_msgSend(v6, "setCurrentNatType:", objc_msgSend(v20, "unsignedIntValue"));
    }
    char v21 = *(void **)(a1 + 120);
    if (v21) {
      objc_msgSend(v6, "setRemoteNatType:", objc_msgSend(v21, "unsignedIntValue"));
    }
    int v22 = *(void **)(a1 + 128);
    if (v22) {
      objc_msgSend(v6, "setRelayConnectDuration:", objc_msgSend(v22, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 209)) {
      [v6 setIsInitiator:1];
    }
    if (*(unsigned char *)(a1 + 210)) {
      [v6 setIsVideoInterrupted:1];
    }
    if (*(unsigned char *)(a1 + 211)) {
      [v6 setIsAudioInterrupted:1];
    }
    if (*(unsigned char *)(a1 + 212)) {
      [v6 setIsCallUpgrade:1];
    }
    id v23 = *(void **)(a1 + 136);
    if (v23) {
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v23, "intValue"));
    }
    int v24 = *(void **)(a1 + 144);
    if (v24) {
      objc_msgSend(v6, "setGksReturnCode:", objc_msgSend(v24, "intValue"));
    }
    if (*(unsigned char *)(a1 + 213)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v119 = 134217984;
      v120 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "             Metric Object: %p", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v6 guid];
      int v119 = 138412290;
      v120 = (const char *)v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "                      GUID: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [v6 timestamp];
      int v119 = 134217984;
      v120 = (const char *)v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "                 Timestamp: %llu", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v30 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v119) = 0;
      _os_log_impl(&dword_210A81000, v30, OS_LOG_TYPE_DEFAULT, "                             ", (uint8_t *)&v119, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v31 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = [v6 isVideo];
      long long v33 = @"YES";
      if (!v32) {
        long long v33 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v33;
      _os_log_impl(&dword_210A81000, v31, OS_LOG_TYPE_DEFAULT, "                   isVideo: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v34 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = [v6 endedReason];
      int v119 = 67109120;
      LODWORD(v120) = v35;
      _os_log_impl(&dword_210A81000, v34, OS_LOG_TYPE_DEFAULT, "               endedReason: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v36 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = [v6 genericError];
      int v119 = 67109120;
      LODWORD(v120) = v37;
      _os_log_impl(&dword_210A81000, v36, OS_LOG_TYPE_DEFAULT, "              genericError: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v38 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = [v6 viceroyError];
      int v119 = 67109120;
      LODWORD(v120) = v39;
      _os_log_impl(&dword_210A81000, v38, OS_LOG_TYPE_DEFAULT, "              viceroyError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v40 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = [v6 gameKitError];
      int v119 = 67109120;
      LODWORD(v120) = v41;
      _os_log_impl(&dword_210A81000, v40, OS_LOG_TYPE_DEFAULT, "              gameKitError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v42 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = [v6 messageDeliveryError];
      int v119 = 67109120;
      LODWORD(v120) = v43;
      _os_log_impl(&dword_210A81000, v42, OS_LOG_TYPE_DEFAULT, "      messageDeliveryError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v44 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = [v6 conferenceMiscError];
      int v119 = 67109120;
      LODWORD(v120) = v45;
      _os_log_impl(&dword_210A81000, v44, OS_LOG_TYPE_DEFAULT, "       conferenceMiscError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v46 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = [v6 registrationError];
      int v119 = 67109120;
      LODWORD(v120) = v47;
      _os_log_impl(&dword_210A81000, v46, OS_LOG_TYPE_DEFAULT, "         registrationError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v48 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = [v6 relayError];
      int v119 = 67109120;
      LODWORD(v120) = v49;
      _os_log_impl(&dword_210A81000, v48, OS_LOG_TYPE_DEFAULT, "                relayError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v50 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = [v6 invitationServiceError];
      int v119 = 67109120;
      LODWORD(v120) = v51;
      _os_log_impl(&dword_210A81000, v50, OS_LOG_TYPE_DEFAULT, "    invitationServiceError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v52 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = [v6 callDuration];
      int v119 = 67109120;
      LODWORD(v120) = v53;
      _os_log_impl(&dword_210A81000, v52, OS_LOG_TYPE_DEFAULT, "              callDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v54 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v55 = [v6 diagnosticPingMin];
      int v119 = 67109120;
      LODWORD(v120) = v55;
      _os_log_impl(&dword_210A81000, v54, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMin: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v56 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = [v6 diagnosticPingAvg];
      int v119 = 67109120;
      LODWORD(v120) = v57;
      _os_log_impl(&dword_210A81000, v56, OS_LOG_TYPE_DEFAULT, "         diagnosticPingAvg: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v58 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v59 = [v6 diagnosticPingMax];
      int v119 = 67109120;
      LODWORD(v120) = v59;
      _os_log_impl(&dword_210A81000, v58, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMax: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v60 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v61 = [v6 diagnosticPingPacketLoss];
      int v119 = 67109120;
      LODWORD(v120) = v61;
      _os_log_impl(&dword_210A81000, v60, OS_LOG_TYPE_DEFAULT, "  diagnosticPingPacketLoss: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v62 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v63 = [v6 isNetworkEnabled];
      v64 = @"YES";
      if (!v63) {
        v64 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v64;
      _os_log_impl(&dword_210A81000, v62, OS_LOG_TYPE_DEFAULT, "          isNetworkEnabled: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v65 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v66 = [v6 isNetworkActive];
      v67 = @"YES";
      if (!v66) {
        v67 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v67;
      _os_log_impl(&dword_210A81000, v65, OS_LOG_TYPE_DEFAULT, "           isNetworkActive: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v68 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v69 = [v6 isNetworkReachable];
      v70 = @"YES";
      if (!v69) {
        v70 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v70;
      _os_log_impl(&dword_210A81000, v68, OS_LOG_TYPE_DEFAULT, "        isNetworkReachable: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v71 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = [v6 networkCheckResult];
      int v119 = 67109120;
      LODWORD(v120) = v72;
      _os_log_impl(&dword_210A81000, v71, OS_LOG_TYPE_DEFAULT, "        networkCheckResult: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v73 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v74 = [v6 frontCameraCaptureDuration];
      int v119 = 67109120;
      LODWORD(v120) = v74;
      _os_log_impl(&dword_210A81000, v73, OS_LOG_TYPE_DEFAULT, "frontCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v75 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v76 = [v6 backCameraCaptureDuration];
      int v119 = 67109120;
      LODWORD(v120) = v76;
      _os_log_impl(&dword_210A81000, v75, OS_LOG_TYPE_DEFAULT, " backCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v77 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v78 = [v6 dataRate];
      int v119 = 67109120;
      LODWORD(v120) = v78;
      _os_log_impl(&dword_210A81000, v77, OS_LOG_TYPE_DEFAULT, "                  dataRate: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v79 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v80 = [v6 gksError];
      int v119 = 67109120;
      LODWORD(v120) = v80;
      _os_log_impl(&dword_210A81000, v79, OS_LOG_TYPE_DEFAULT, "                  gksError: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v81 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v82 = [v6 connectDuration];
      int v119 = 67109120;
      LODWORD(v120) = v82;
      _os_log_impl(&dword_210A81000, v81, OS_LOG_TYPE_DEFAULT, "           connectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v83 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v84 = [v6 remoteNetworkConnection];
      int v119 = 67109120;
      LODWORD(v120) = v84;
      _os_log_impl(&dword_210A81000, v83, OS_LOG_TYPE_DEFAULT, "   remoteNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v85 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v86 = [v6 localNetworkConnection];
      int v119 = 67109120;
      LODWORD(v120) = v86;
      _os_log_impl(&dword_210A81000, v85, OS_LOG_TYPE_DEFAULT, "    localNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v87 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v88 = [v6 connectionType];
      int v119 = 67109120;
      LODWORD(v120) = v88;
      _os_log_impl(&dword_210A81000, v87, OS_LOG_TYPE_DEFAULT, "            connectionType: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v89 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v90 = [v6 usesRelay];
      v91 = @"YES";
      if (!v90) {
        v91 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v91;
      _os_log_impl(&dword_210A81000, v89, OS_LOG_TYPE_DEFAULT, "                 usesRelay: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v92 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v93 = [v6 currentNatType];
      int v119 = 67109120;
      LODWORD(v120) = v93;
      _os_log_impl(&dword_210A81000, v92, OS_LOG_TYPE_DEFAULT, "            currentNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v94 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v95 = [v6 remoteNatType];
      int v119 = 67109120;
      LODWORD(v120) = v95;
      _os_log_impl(&dword_210A81000, v94, OS_LOG_TYPE_DEFAULT, "             remoteNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v96 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v97 = [v6 relayConnectDuration];
      int v119 = 67109120;
      LODWORD(v120) = v97;
      _os_log_impl(&dword_210A81000, v96, OS_LOG_TYPE_DEFAULT, "      relayConnectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v98 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v99 = [v6 isInitiator];
      v100 = @"YES";
      if (!v99) {
        v100 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v100;
      _os_log_impl(&dword_210A81000, v98, OS_LOG_TYPE_DEFAULT, "                  isCaller: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v101 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v102 = [v6 isVideoInterrupted];
      v103 = @"YES";
      if (!v102) {
        v103 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v103;
      _os_log_impl(&dword_210A81000, v101, OS_LOG_TYPE_DEFAULT, "        isVideoInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v104 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v105 = [v6 isAudioInterrupted];
      v106 = @"YES";
      if (!v105) {
        v106 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v106;
      _os_log_impl(&dword_210A81000, v104, OS_LOG_TYPE_DEFAULT, "        isAudioInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v107 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v108 = [v6 isCallUpgrade];
      v109 = @"YES";
      if (!v108) {
        v109 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v109;
      _os_log_impl(&dword_210A81000, v107, OS_LOG_TYPE_DEFAULT, "             isCallUpgrade: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v110 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v111 = [v6 linkQuality];
      int v119 = 67109120;
      LODWORD(v120) = v111;
      _os_log_impl(&dword_210A81000, v110, OS_LOG_TYPE_DEFAULT, "               linkQuality: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v112 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v113 = [v6 gksReturnCode];
      int v119 = 67109120;
      LODWORD(v120) = v113;
      _os_log_impl(&dword_210A81000, v112, OS_LOG_TYPE_DEFAULT, "             gksReturnCode: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v114 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v115 = [v6 onLockScreen];
      v116 = @"YES";
      if (!v115) {
        v116 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v116;
      _os_log_impl(&dword_210A81000, v114, OS_LOG_TYPE_DEFAULT, "              onLockScreen: %@", (uint8_t *)&v119, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v117 = *(unsigned __int8 *)(a1 + 209);
    id v118 = sub_210A83B28();
    if (sub_210A8A13C(v117, (uint64_t)v118))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

__n128 FTAWDLogCallFailed(uint64_t a1, char a2, char a3, int a4, int a5, int a6, int a7, int a8, long long a9, long long a10, long long a11, uint64_t a12, char a13, char a14, char a15, int a16, long long a17, long long a18, uint64_t a19, uint64_t a20,int a21,char a22,long long a23,uint64_t a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A8C608;
  block[3] = &unk_264188DA0;
  char v51 = a3;
  int v42 = a4;
  int v43 = a5;
  int v44 = a6;
  int v45 = a7;
  int v46 = a8;
  long long v47 = a9;
  long long v32 = a10;
  long long v33 = a11;
  uint64_t v34 = a12;
  char v52 = a13;
  char v53 = a14;
  char v54 = a15;
  int v48 = a16;
  long long v35 = a17;
  long long v36 = a18;
  uint64_t v37 = a19;
  uint64_t v49 = a20;
  int v50 = a21;
  char v55 = a22;
  long long v38 = a23;
  char v56 = a2;
  char v57 = a25;
  char v58 = a26;
  char v59 = a27;
  uint64_t v39 = a24;
  uint64_t v40 = a28;
  uint64_t v41 = a29;
  char v60 = a30;
  sub_210A824A0(block);
  return result;
}

void sub_210A8C608(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v119 = 136446210;
    v120 = "void FTAWDLogCallFailed(NSString *, BOOL, BOOL, FTAWDConferenceEndedReason, FTAWDConferenceError, FTAWDConfer"
           "enceViceroyError, FTAWDConferenceGameKitError, FTAWDConferenceMessageDeliveryError, FTAWDConferenceMiscError,"
           " FTAWDConferenceRegistrationError, FTAWDConferenceRelayError, FTAWDConferenceInvitationServiceError, NSNumber"
           " *, NSNumber *, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, FTAWDNetworkCheckResult, NSNumber *, NS"
           "Number *, NSNumber *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnectionType, FTAWDCo"
           "nnectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, NSNumber *, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v119, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312544);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312560);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 204)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 152)) {
      objc_msgSend(v6, "setEndedReason:");
    }
    if (*(_DWORD *)(a1 + 156)) {
      objc_msgSend(v6, "setGenericError:");
    }
    if (*(_DWORD *)(a1 + 160)) {
      objc_msgSend(v6, "setViceroyError:");
    }
    if (*(_DWORD *)(a1 + 164)) {
      objc_msgSend(v6, "setGameKitError:");
    }
    if (*(_DWORD *)(a1 + 168)) {
      objc_msgSend(v6, "setMessageDeliveryError:");
    }
    if (*(_DWORD *)(a1 + 172)) {
      objc_msgSend(v6, "setConferenceMiscError:");
    }
    if (*(_DWORD *)(a1 + 176)) {
      objc_msgSend(v6, "setRegistrationError:");
    }
    if (*(_DWORD *)(a1 + 180)) {
      objc_msgSend(v6, "setRelayError:");
    }
    if (*(_DWORD *)(a1 + 184)) {
      objc_msgSend(v6, "setInvitationServiceError:");
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 doubleValue];
      [v6 setCallDuration:(ceil(v8 / 10.0) * 10.0)];
    }
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9) {
      objc_msgSend(v6, "setDiagnosticPingMin:", objc_msgSend(v9, "unsignedIntValue"));
    }
    uint64_t v10 = *(void **)(a1 + 48);
    if (v10) {
      objc_msgSend(v6, "setDiagnosticPingAvg:", objc_msgSend(v10, "unsignedIntValue"));
    }
    uint64_t v11 = *(void **)(a1 + 56);
    if (v11) {
      objc_msgSend(v6, "setDiagnosticPingMax:", objc_msgSend(v11, "unsignedIntValue"));
    }
    char v12 = *(void **)(a1 + 64);
    if (v12) {
      objc_msgSend(v6, "setDiagnosticPingPacketLoss:", objc_msgSend(v12, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 205)) {
      [v6 setIsNetworkEnabled:1];
    }
    if (*(unsigned char *)(a1 + 206)) {
      [v6 setIsNetworkActive:1];
    }
    if (*(unsigned char *)(a1 + 207)) {
      [v6 setIsNetworkReachable:1];
    }
    if (*(_DWORD *)(a1 + 188)) {
      objc_msgSend(v6, "setNetworkCheckResult:");
    }
    uint64_t v13 = *(void **)(a1 + 72);
    if (v13)
    {
      [v13 doubleValue];
      [v6 setFrontCameraCaptureDuration:(ceil(v14 / 10.0) * 10.0)];
    }
    uint64_t v15 = *(void **)(a1 + 80);
    if (v15)
    {
      [v15 doubleValue];
      [v6 setBackCameraCaptureDuration:(ceil(v16 / 10.0) * 10.0)];
    }
    int v17 = *(void **)(a1 + 88);
    if (v17) {
      objc_msgSend(v6, "setDataRate:", 7 * objc_msgSend(v17, "unsignedIntValue") + 931);
    }
    char v18 = *(void **)(a1 + 96);
    if (v18) {
      objc_msgSend(v6, "setGksError:", objc_msgSend(v18, "intValue"));
    }
    char v19 = *(void **)(a1 + 104);
    if (v19) {
      objc_msgSend(v6, "setConnectDuration:", objc_msgSend(v19, "unsignedIntValue"));
    }
    if (*(_DWORD *)(a1 + 192)) {
      objc_msgSend(v6, "setRemoteNetworkConnection:");
    }
    if (*(_DWORD *)(a1 + 196)) {
      objc_msgSend(v6, "setLocalNetworkConnection:");
    }
    if (*(_DWORD *)(a1 + 200)) {
      objc_msgSend(v6, "setConnectionType:");
    }
    if (*(unsigned char *)(a1 + 208)) {
      [v6 setUsesRelay:1];
    }
    int v20 = *(void **)(a1 + 112);
    if (v20) {
      objc_msgSend(v6, "setCurrentNatType:", objc_msgSend(v20, "unsignedIntValue"));
    }
    char v21 = *(void **)(a1 + 120);
    if (v21) {
      objc_msgSend(v6, "setRemoteNatType:", objc_msgSend(v21, "unsignedIntValue"));
    }
    int v22 = *(void **)(a1 + 128);
    if (v22) {
      objc_msgSend(v6, "setRelayConnectDuration:", objc_msgSend(v22, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 209)) {
      [v6 setIsInitiator:1];
    }
    if (*(unsigned char *)(a1 + 210)) {
      [v6 setIsVideoInterrupted:1];
    }
    if (*(unsigned char *)(a1 + 211)) {
      [v6 setIsAudioInterrupted:1];
    }
    if (*(unsigned char *)(a1 + 212)) {
      [v6 setIsCallUpgrade:1];
    }
    id v23 = *(void **)(a1 + 136);
    if (v23) {
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v23, "intValue"));
    }
    int v24 = *(void **)(a1 + 144);
    if (v24) {
      objc_msgSend(v6, "setGksReturnCode:", objc_msgSend(v24, "intValue"));
    }
    if (*(unsigned char *)(a1 + 213)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v119 = 134217984;
      v120 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "             Metric Object: %p", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v6 guid];
      int v119 = 138412290;
      v120 = (const char *)v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "                      GUID: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [v6 timestamp];
      int v119 = 134217984;
      v120 = (const char *)v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "                 Timestamp: %llu", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v30 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v119) = 0;
      _os_log_impl(&dword_210A81000, v30, OS_LOG_TYPE_DEFAULT, "                             ", (uint8_t *)&v119, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v31 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = [v6 isVideo];
      long long v33 = @"YES";
      if (!v32) {
        long long v33 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v33;
      _os_log_impl(&dword_210A81000, v31, OS_LOG_TYPE_DEFAULT, "                   isVideo: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v34 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = [v6 endedReason];
      int v119 = 67109120;
      LODWORD(v120) = v35;
      _os_log_impl(&dword_210A81000, v34, OS_LOG_TYPE_DEFAULT, "               endedReason: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v36 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = [v6 genericError];
      int v119 = 67109120;
      LODWORD(v120) = v37;
      _os_log_impl(&dword_210A81000, v36, OS_LOG_TYPE_DEFAULT, "              genericError: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    long long v38 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = [v6 viceroyError];
      int v119 = 67109120;
      LODWORD(v120) = v39;
      _os_log_impl(&dword_210A81000, v38, OS_LOG_TYPE_DEFAULT, "              viceroyError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v40 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = [v6 gameKitError];
      int v119 = 67109120;
      LODWORD(v120) = v41;
      _os_log_impl(&dword_210A81000, v40, OS_LOG_TYPE_DEFAULT, "              gameKitError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v42 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = [v6 messageDeliveryError];
      int v119 = 67109120;
      LODWORD(v120) = v43;
      _os_log_impl(&dword_210A81000, v42, OS_LOG_TYPE_DEFAULT, "      messageDeliveryError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v44 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = [v6 conferenceMiscError];
      int v119 = 67109120;
      LODWORD(v120) = v45;
      _os_log_impl(&dword_210A81000, v44, OS_LOG_TYPE_DEFAULT, "       conferenceMiscError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v46 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = [v6 registrationError];
      int v119 = 67109120;
      LODWORD(v120) = v47;
      _os_log_impl(&dword_210A81000, v46, OS_LOG_TYPE_DEFAULT, "         registrationError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v48 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = [v6 relayError];
      int v119 = 67109120;
      LODWORD(v120) = v49;
      _os_log_impl(&dword_210A81000, v48, OS_LOG_TYPE_DEFAULT, "                relayError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v50 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = [v6 invitationServiceError];
      int v119 = 67109120;
      LODWORD(v120) = v51;
      _os_log_impl(&dword_210A81000, v50, OS_LOG_TYPE_DEFAULT, "    invitationServiceError: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v52 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = [v6 callDuration];
      int v119 = 67109120;
      LODWORD(v120) = v53;
      _os_log_impl(&dword_210A81000, v52, OS_LOG_TYPE_DEFAULT, "              callDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v54 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v55 = [v6 diagnosticPingMin];
      int v119 = 67109120;
      LODWORD(v120) = v55;
      _os_log_impl(&dword_210A81000, v54, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMin: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v56 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = [v6 diagnosticPingAvg];
      int v119 = 67109120;
      LODWORD(v120) = v57;
      _os_log_impl(&dword_210A81000, v56, OS_LOG_TYPE_DEFAULT, "         diagnosticPingAvg: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v58 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v59 = [v6 diagnosticPingMax];
      int v119 = 67109120;
      LODWORD(v120) = v59;
      _os_log_impl(&dword_210A81000, v58, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMax: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v60 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v61 = [v6 diagnosticPingPacketLoss];
      int v119 = 67109120;
      LODWORD(v120) = v61;
      _os_log_impl(&dword_210A81000, v60, OS_LOG_TYPE_DEFAULT, "  diagnosticPingPacketLoss: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v62 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v63 = [v6 isNetworkEnabled];
      v64 = @"YES";
      if (!v63) {
        v64 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v64;
      _os_log_impl(&dword_210A81000, v62, OS_LOG_TYPE_DEFAULT, "          isNetworkEnabled: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v65 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v66 = [v6 isNetworkActive];
      v67 = @"YES";
      if (!v66) {
        v67 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v67;
      _os_log_impl(&dword_210A81000, v65, OS_LOG_TYPE_DEFAULT, "           isNetworkActive: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v68 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v69 = [v6 isNetworkReachable];
      v70 = @"YES";
      if (!v69) {
        v70 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v70;
      _os_log_impl(&dword_210A81000, v68, OS_LOG_TYPE_DEFAULT, "        isNetworkReachable: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v71 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = [v6 networkCheckResult];
      int v119 = 67109120;
      LODWORD(v120) = v72;
      _os_log_impl(&dword_210A81000, v71, OS_LOG_TYPE_DEFAULT, "        networkCheckResult: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v73 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v74 = [v6 frontCameraCaptureDuration];
      int v119 = 67109120;
      LODWORD(v120) = v74;
      _os_log_impl(&dword_210A81000, v73, OS_LOG_TYPE_DEFAULT, "frontCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v75 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v76 = [v6 backCameraCaptureDuration];
      int v119 = 67109120;
      LODWORD(v120) = v76;
      _os_log_impl(&dword_210A81000, v75, OS_LOG_TYPE_DEFAULT, " backCameraCaptureDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v77 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v78 = [v6 dataRate];
      int v119 = 67109120;
      LODWORD(v120) = v78;
      _os_log_impl(&dword_210A81000, v77, OS_LOG_TYPE_DEFAULT, "                  dataRate: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v79 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v80 = [v6 gksError];
      int v119 = 67109120;
      LODWORD(v120) = v80;
      _os_log_impl(&dword_210A81000, v79, OS_LOG_TYPE_DEFAULT, "                  gksError: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v81 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v82 = [v6 connectDuration];
      int v119 = 67109120;
      LODWORD(v120) = v82;
      _os_log_impl(&dword_210A81000, v81, OS_LOG_TYPE_DEFAULT, "           connectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v83 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v84 = [v6 remoteNetworkConnection];
      int v119 = 67109120;
      LODWORD(v120) = v84;
      _os_log_impl(&dword_210A81000, v83, OS_LOG_TYPE_DEFAULT, "   remoteNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v85 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v86 = [v6 localNetworkConnection];
      int v119 = 67109120;
      LODWORD(v120) = v86;
      _os_log_impl(&dword_210A81000, v85, OS_LOG_TYPE_DEFAULT, "    localNetworkConnection: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v87 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v88 = [v6 connectionType];
      int v119 = 67109120;
      LODWORD(v120) = v88;
      _os_log_impl(&dword_210A81000, v87, OS_LOG_TYPE_DEFAULT, "            connectionType: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v89 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v90 = [v6 usesRelay];
      v91 = @"YES";
      if (!v90) {
        v91 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v91;
      _os_log_impl(&dword_210A81000, v89, OS_LOG_TYPE_DEFAULT, "                 usesRelay: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v92 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v93 = [v6 currentNatType];
      int v119 = 67109120;
      LODWORD(v120) = v93;
      _os_log_impl(&dword_210A81000, v92, OS_LOG_TYPE_DEFAULT, "            currentNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v94 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v95 = [v6 remoteNatType];
      int v119 = 67109120;
      LODWORD(v120) = v95;
      _os_log_impl(&dword_210A81000, v94, OS_LOG_TYPE_DEFAULT, "             remoteNatType: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v96 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v97 = [v6 relayConnectDuration];
      int v119 = 67109120;
      LODWORD(v120) = v97;
      _os_log_impl(&dword_210A81000, v96, OS_LOG_TYPE_DEFAULT, "      relayConnectDuration: %u", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v98 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v99 = [v6 isInitiator];
      v100 = @"YES";
      if (!v99) {
        v100 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v100;
      _os_log_impl(&dword_210A81000, v98, OS_LOG_TYPE_DEFAULT, "                  isCaller: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v101 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v102 = [v6 isVideoInterrupted];
      v103 = @"YES";
      if (!v102) {
        v103 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v103;
      _os_log_impl(&dword_210A81000, v101, OS_LOG_TYPE_DEFAULT, "        isVideoInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v104 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v105 = [v6 isAudioInterrupted];
      v106 = @"YES";
      if (!v105) {
        v106 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v106;
      _os_log_impl(&dword_210A81000, v104, OS_LOG_TYPE_DEFAULT, "        isAudioInterrupted: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v107 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v108 = [v6 isCallUpgrade];
      v109 = @"YES";
      if (!v108) {
        v109 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v109;
      _os_log_impl(&dword_210A81000, v107, OS_LOG_TYPE_DEFAULT, "             isCallUpgrade: %@", (uint8_t *)&v119, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v110 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v111 = [v6 linkQuality];
      int v119 = 67109120;
      LODWORD(v120) = v111;
      _os_log_impl(&dword_210A81000, v110, OS_LOG_TYPE_DEFAULT, "               linkQuality: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v112 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v113 = [v6 gksReturnCode];
      int v119 = 67109120;
      LODWORD(v120) = v113;
      _os_log_impl(&dword_210A81000, v112, OS_LOG_TYPE_DEFAULT, "             gksReturnCode: %d", (uint8_t *)&v119, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    v114 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v115 = [v6 onLockScreen];
      v116 = @"YES";
      if (!v115) {
        v116 = @"NO";
      }
      int v119 = 138412290;
      v120 = (const char *)v116;
      _os_log_impl(&dword_210A81000, v114, OS_LOG_TYPE_DEFAULT, "              onLockScreen: %@", (uint8_t *)&v119, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v117 = *(unsigned __int8 *)(a1 + 209);
    id v118 = sub_210A83B28();
    if (sub_210A8A13C(v117, (uint64_t)v118))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

id FTAWDLogCallEndedViceroy(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, unsigned int a10, unsigned int a11, unsigned int a12, void *a13, void *a14, void *a15, void *a16, void *a17, char a18, char a19, char a20,unsigned int a21,void *a22,void *a23,void *a24,void *a25,void *a26,unsigned int a27,unsigned int a28,unsigned int a29,char a30,void *a31,void *a32,void *a33,char a34,char a35,char a36,void *a37,void *a38,char a39)
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  int v46 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v134 = 136446210;
    v135 = "id FTAWDLogCallEndedViceroy(NSString *, BOOL, BOOL, FTAWDConferenceEndedReason, FTAWDConferenceError, FTAWDCo"
           "nferenceViceroyError, FTAWDConferenceGameKitError, FTAWDConferenceMessageDeliveryError, FTAWDConferenceMiscEr"
           "ror, FTAWDConferenceRegistrationError, FTAWDConferenceRelayError, FTAWDConferenceInvitationServiceError, NSNu"
           "mber *, NSNumber *, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, FTAWDNetworkCheckResult, NSNumber *"
           ", NSNumber *, NSNumber *, NSNumber *, NSNumber *, FTAWDNetworkConnectionType, FTAWDNetworkConnectionType, FTA"
           "WDConnectionType, BOOL, NSNumber *, NSNumber *, NSNumber *, BOOL, BOOL, BOOL, NSNumber *, NSNumber *, BOOL)";
    _os_log_impl(&dword_210A81000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v134, 0xCu);
  }
  id v47 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v47, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
  if (a3) {
    [v47 setIsVideo:1];
  }
  if (a4) {
    [v47 setEndedReason:a4];
  }
  if (a5) {
    [v47 setGenericError:a5];
  }
  if (a6) {
    [v47 setViceroyError:a6];
  }
  if (a7) {
    [v47 setGameKitError:a7];
  }
  if (a8) {
    [v47 setMessageDeliveryError:a8];
  }
  if (a9) {
    [v47 setConferenceMiscError:a9];
  }
  if (a10) {
    [v47 setRegistrationError:a10];
  }
  if (a11) {
    [v47 setRelayError:a11];
  }
  if (a12) {
    [v47 setInvitationServiceError:a12];
  }
  if (a13)
  {
    [a13 doubleValue];
    [v47 setCallDuration:(ceil(v48 / 10.0) * 10.0)];
  }
  if (a14) {
    objc_msgSend(v47, "setDiagnosticPingMin:", objc_msgSend(a14, "unsignedIntValue"));
  }
  if (a15) {
    objc_msgSend(v47, "setDiagnosticPingAvg:", objc_msgSend(a15, "unsignedIntValue"));
  }
  if (a16) {
    objc_msgSend(v47, "setDiagnosticPingMax:", objc_msgSend(a16, "unsignedIntValue"));
  }
  if (a17) {
    objc_msgSend(v47, "setDiagnosticPingPacketLoss:", objc_msgSend(a17, "unsignedIntValue"));
  }
  if (a18) {
    [v47 setIsNetworkEnabled:1];
  }
  if (a19) {
    [v47 setIsNetworkActive:1];
  }
  if (a20) {
    [v47 setIsNetworkReachable:1];
  }
  if (a21) {
    [v47 setNetworkCheckResult:a21];
  }
  if (a22)
  {
    [a22 doubleValue];
    [v47 setFrontCameraCaptureDuration:(ceil(v49 / 10.0) * 10.0)];
  }
  if (a23)
  {
    [a23 doubleValue];
    [v47 setBackCameraCaptureDuration:(ceil(v50 / 10.0) * 10.0)];
  }
  if (a24) {
    objc_msgSend(v47, "setDataRate:", 7 * objc_msgSend(a24, "unsignedIntValue") + 931);
  }
  if (a25) {
    objc_msgSend(v47, "setGksError:", objc_msgSend(a25, "intValue"));
  }
  if (a26) {
    objc_msgSend(v47, "setConnectDuration:", objc_msgSend(a26, "unsignedIntValue"));
  }
  if (a27) {
    [v47 setRemoteNetworkConnection:a27];
  }
  if (a28) {
    [v47 setLocalNetworkConnection:a28];
  }
  if (a29) {
    [v47 setConnectionType:a29];
  }
  if (a30) {
    [v47 setUsesRelay:1];
  }
  if (a31) {
    objc_msgSend(v47, "setCurrentNatType:", objc_msgSend(a31, "unsignedIntValue"));
  }
  if (a32) {
    objc_msgSend(v47, "setRemoteNatType:", objc_msgSend(a32, "unsignedIntValue"));
  }
  if (a33) {
    objc_msgSend(v47, "setRelayConnectDuration:", objc_msgSend(a33, "unsignedIntValue"));
  }
  if (a2) {
    [v47 setIsInitiator:1];
  }
  if (a34) {
    [v47 setIsVideoInterrupted:1];
  }
  if (a35) {
    [v47 setIsAudioInterrupted:1];
  }
  if (a36) {
    [v47 setIsCallUpgrade:1];
  }
  if (a37) {
    objc_msgSend(v47, "setLinkQuality:", objc_msgSend(a37, "intValue"));
  }
  if (a38) {
    objc_msgSend(v47, "setGksReturnCode:", objc_msgSend(a38, "intValue"));
  }
  if (a39) {
    [v47 setOnLockScreen:1];
  }
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  int v51 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v134 = 134217984;
    v135 = (const char *)v47;
    _os_log_impl(&dword_210A81000, v51, OS_LOG_TYPE_DEFAULT, "             Metric Object: %p", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v52 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v53 = [v47 guid];
    int v134 = 138412290;
    v135 = (const char *)v53;
    _os_log_impl(&dword_210A81000, v52, OS_LOG_TYPE_DEFAULT, "                      GUID: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v54 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = [v47 timestamp];
    int v134 = 134217984;
    v135 = (const char *)v55;
    _os_log_impl(&dword_210A81000, v54, OS_LOG_TYPE_DEFAULT, "                 Timestamp: %llu", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v56 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v134) = 0;
    _os_log_impl(&dword_210A81000, v56, OS_LOG_TYPE_DEFAULT, "                             ", (uint8_t *)&v134, 2u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v57 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    char v58 = [v47 isVideo] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v58;
    _os_log_impl(&dword_210A81000, v57, OS_LOG_TYPE_DEFAULT, "                   isVideo: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v59 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v60 = [v47 endedReason];
    int v134 = 67109120;
    LODWORD(v135) = v60;
    _os_log_impl(&dword_210A81000, v59, OS_LOG_TYPE_DEFAULT, "               endedReason: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v61 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v62 = [v47 genericError];
    int v134 = 67109120;
    LODWORD(v135) = v62;
    _os_log_impl(&dword_210A81000, v61, OS_LOG_TYPE_DEFAULT, "              genericError: %d", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v63 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v64 = [v47 viceroyError];
    int v134 = 67109120;
    LODWORD(v135) = v64;
    _os_log_impl(&dword_210A81000, v63, OS_LOG_TYPE_DEFAULT, "              viceroyError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v65 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v66 = [v47 gameKitError];
    int v134 = 67109120;
    LODWORD(v135) = v66;
    _os_log_impl(&dword_210A81000, v65, OS_LOG_TYPE_DEFAULT, "              gameKitError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v67 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v68 = [v47 messageDeliveryError];
    int v134 = 67109120;
    LODWORD(v135) = v68;
    _os_log_impl(&dword_210A81000, v67, OS_LOG_TYPE_DEFAULT, "      messageDeliveryError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v69 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v70 = [v47 conferenceMiscError];
    int v134 = 67109120;
    LODWORD(v135) = v70;
    _os_log_impl(&dword_210A81000, v69, OS_LOG_TYPE_DEFAULT, "       conferenceMiscError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v71 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v72 = [v47 registrationError];
    int v134 = 67109120;
    LODWORD(v135) = v72;
    _os_log_impl(&dword_210A81000, v71, OS_LOG_TYPE_DEFAULT, "         registrationError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v73 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v74 = [v47 relayError];
    int v134 = 67109120;
    LODWORD(v135) = v74;
    _os_log_impl(&dword_210A81000, v73, OS_LOG_TYPE_DEFAULT, "                relayError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v75 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v76 = [v47 invitationServiceError];
    int v134 = 67109120;
    LODWORD(v135) = v76;
    _os_log_impl(&dword_210A81000, v75, OS_LOG_TYPE_DEFAULT, "    invitationServiceError: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v77 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v78 = [v47 callDuration];
    int v134 = 67109120;
    LODWORD(v135) = v78;
    _os_log_impl(&dword_210A81000, v77, OS_LOG_TYPE_DEFAULT, "              callDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v79 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v80 = [v47 diagnosticPingMin];
    int v134 = 67109120;
    LODWORD(v135) = v80;
    _os_log_impl(&dword_210A81000, v79, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMin: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v81 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v82 = [v47 diagnosticPingAvg];
    int v134 = 67109120;
    LODWORD(v135) = v82;
    _os_log_impl(&dword_210A81000, v81, OS_LOG_TYPE_DEFAULT, "         diagnosticPingAvg: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v83 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v84 = [v47 diagnosticPingMax];
    int v134 = 67109120;
    LODWORD(v135) = v84;
    _os_log_impl(&dword_210A81000, v83, OS_LOG_TYPE_DEFAULT, "         diagnosticPingMax: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v85 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v86 = [v47 diagnosticPingPacketLoss];
    int v134 = 67109120;
    LODWORD(v135) = v86;
    _os_log_impl(&dword_210A81000, v85, OS_LOG_TYPE_DEFAULT, "  diagnosticPingPacketLoss: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v87 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v88 = [v47 isNetworkEnabled] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v88;
    _os_log_impl(&dword_210A81000, v87, OS_LOG_TYPE_DEFAULT, "          isNetworkEnabled: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v89 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v90 = [v47 isNetworkActive] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v90;
    _os_log_impl(&dword_210A81000, v89, OS_LOG_TYPE_DEFAULT, "           isNetworkActive: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v91 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v92 = [v47 isNetworkReachable] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v92;
    _os_log_impl(&dword_210A81000, v91, OS_LOG_TYPE_DEFAULT, "        isNetworkReachable: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v93 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v94 = [v47 networkCheckResult];
    int v134 = 67109120;
    LODWORD(v135) = v94;
    _os_log_impl(&dword_210A81000, v93, OS_LOG_TYPE_DEFAULT, "        networkCheckResult: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v95 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v96 = [v47 frontCameraCaptureDuration];
    int v134 = 67109120;
    LODWORD(v135) = v96;
    _os_log_impl(&dword_210A81000, v95, OS_LOG_TYPE_DEFAULT, "frontCameraCaptureDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v97 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v98 = [v47 backCameraCaptureDuration];
    int v134 = 67109120;
    LODWORD(v135) = v98;
    _os_log_impl(&dword_210A81000, v97, OS_LOG_TYPE_DEFAULT, " backCameraCaptureDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v99 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v100 = [v47 dataRate];
    int v134 = 67109120;
    LODWORD(v135) = v100;
    _os_log_impl(&dword_210A81000, v99, OS_LOG_TYPE_DEFAULT, "                  dataRate: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v101 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v102 = [v47 gksError];
    int v134 = 67109120;
    LODWORD(v135) = v102;
    _os_log_impl(&dword_210A81000, v101, OS_LOG_TYPE_DEFAULT, "                  gksError: %d", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v103 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v104 = [v47 connectDuration];
    int v134 = 67109120;
    LODWORD(v135) = v104;
    _os_log_impl(&dword_210A81000, v103, OS_LOG_TYPE_DEFAULT, "           connectDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v105 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v106 = [v47 remoteNetworkConnection];
    int v134 = 67109120;
    LODWORD(v135) = v106;
    _os_log_impl(&dword_210A81000, v105, OS_LOG_TYPE_DEFAULT, "   remoteNetworkConnection: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v107 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v108 = [v47 localNetworkConnection];
    int v134 = 67109120;
    LODWORD(v135) = v108;
    _os_log_impl(&dword_210A81000, v107, OS_LOG_TYPE_DEFAULT, "    localNetworkConnection: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v109 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v110 = [v47 connectionType];
    int v134 = 67109120;
    LODWORD(v135) = v110;
    _os_log_impl(&dword_210A81000, v109, OS_LOG_TYPE_DEFAULT, "            connectionType: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v111 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v112 = [v47 usesRelay] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v112;
    _os_log_impl(&dword_210A81000, v111, OS_LOG_TYPE_DEFAULT, "                 usesRelay: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v113 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v114 = [v47 currentNatType];
    int v134 = 67109120;
    LODWORD(v135) = v114;
    _os_log_impl(&dword_210A81000, v113, OS_LOG_TYPE_DEFAULT, "            currentNatType: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v115 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v116 = [v47 remoteNatType];
    int v134 = 67109120;
    LODWORD(v135) = v116;
    _os_log_impl(&dword_210A81000, v115, OS_LOG_TYPE_DEFAULT, "             remoteNatType: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v117 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v118 = [v47 relayConnectDuration];
    int v134 = 67109120;
    LODWORD(v135) = v118;
    _os_log_impl(&dword_210A81000, v117, OS_LOG_TYPE_DEFAULT, "      relayConnectDuration: %u", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v119 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v120 = [v47 isInitiator] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v120;
    _os_log_impl(&dword_210A81000, v119, OS_LOG_TYPE_DEFAULT, "                  isCaller: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v121 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v122 = [v47 isVideoInterrupted] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v122;
    _os_log_impl(&dword_210A81000, v121, OS_LOG_TYPE_DEFAULT, "        isVideoInterrupted: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v123 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v124 = [v47 isAudioInterrupted] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v124;
    _os_log_impl(&dword_210A81000, v123, OS_LOG_TYPE_DEFAULT, "        isAudioInterrupted: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v125 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v126 = [v47 isCallUpgrade] ? @"YES" : @"NO";
    int v134 = 138412290;
    v135 = (const char *)v126;
    _os_log_impl(&dword_210A81000, v125, OS_LOG_TYPE_DEFAULT, "             isCallUpgrade: %@", (uint8_t *)&v134, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v127 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v128 = [v47 linkQuality];
    int v134 = 67109120;
    LODWORD(v135) = v128;
    _os_log_impl(&dword_210A81000, v127, OS_LOG_TYPE_DEFAULT, "               linkQuality: %d", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v129 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v130 = [v47 gksReturnCode];
    int v134 = 67109120;
    LODWORD(v135) = v130;
    _os_log_impl(&dword_210A81000, v129, OS_LOG_TYPE_DEFAULT, "             gksReturnCode: %d", (uint8_t *)&v134, 8u);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v131 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    if ([v47 onLockScreen]) {
      v132 = @"YES";
    }
    else {
      v132 = @"NO";
    }
    int v134 = 138412290;
    v135 = (const char *)v132;
    _os_log_impl(&dword_210A81000, v131, OS_LOG_TYPE_DEFAULT, "              onLockScreen: %@", (uint8_t *)&v134, 0xCu);
  }
  return v47;
}

void FTAWDLogCallInterruptionBegan(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, char a7)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_210A8F600;
  v7[3] = &unk_264188DC8;
  char v8 = a3;
  char v9 = a4;
  char v10 = a5;
  v7[4] = a6;
  char v11 = a7;
  char v12 = a2;
  sub_210A824A0(v7);
}

void sub_210A8F600(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136446210;
    uint64_t v27 = "void FTAWDLogCallInterruptionBegan(NSString *, BOOL, BOOL, BOOL, BOOL, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312516);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312532);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 40)) {
      [v6 setIsVideo:1];
    }
    if (*(unsigned char *)(a1 + 41)) {
      [v6 setIsVideoInterrupted:1];
    }
    if (*(unsigned char *)(a1 + 42)) {
      [v6 setIsAudioInterrupted:1];
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v7, "intValue"));
    }
    if (*(unsigned char *)(a1 + 43)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134217984;
      uint64_t v27 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v26 = 138412290;
      uint64_t v27 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "             GUID : %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v26 = 134217984;
      uint64_t v27 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "        Timestamp : %llu", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v26, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 isVideo] ? @"YES" : @"NO";
      int v26 = 138412290;
      uint64_t v27 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "           isVideo: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 isVideoInterrupted] ? @"YES" : @"NO";
      int v26 = 138412290;
      uint64_t v27 = (const char *)v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "isVideoInterrupted: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      char v19 = [v6 isAudioInterrupted] ? @"YES" : @"NO";
      int v26 = 138412290;
      uint64_t v27 = (const char *)v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "isAudioInterrupted: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 linkQuality];
      int v26 = 67109120;
      LODWORD(v27) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "       linkQuality: %d", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        id v23 = @"YES";
      }
      else {
        id v23 = @"NO";
      }
      int v26 = 138412290;
      uint64_t v27 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "      onLockScreen: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v24 = *(unsigned __int8 *)(a1 + 44);
    id v25 = sub_210A83B28();
    if (sub_210A8A13C(v24, (uint64_t)v25))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallInterruptionEnded(uint64_t a1, char a2, char a3, uint64_t a4, char a5, char a6, uint64_t a7, char a8)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A8FCBC;
  block[3] = &unk_264188DF0;
  char v9 = a3;
  char v10 = a5;
  char v11 = a6;
  void block[4] = a4;
  void block[5] = a7;
  char v12 = a8;
  char v13 = a2;
  sub_210A824A0(block);
}

void sub_210A8FCBC(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136446210;
    int v30 = "void FTAWDLogCallInterruptionEnded(NSString *, BOOL, BOOL, NSNumber *, BOOL, BOOL, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v29, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312517);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312533);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 48)) {
      [v6 setIsVideo:1];
    }
    __int16 v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setInterruptionDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 49)) {
      [v6 setIsVideoResumed:1];
    }
    if (*(unsigned char *)(a1 + 50)) {
      [v6 setIsAudioResumed:1];
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setLinkQuality:", objc_msgSend(v8, "intValue"));
    }
    if (*(unsigned char *)(a1 + 51)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 134217984;
      int v30 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "       Metric Object: %p", (uint8_t *)&v29, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 guid];
      int v29 = 138412290;
      int v30 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "                GUID: %@", (uint8_t *)&v29, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 timestamp];
      int v29 = 134217984;
      int v30 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "           Timestamp: %llu", (uint8_t *)&v29, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "                         ", (uint8_t *)&v29, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v15 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [v6 isVideo] ? @"YES" : @"NO";
      int v29 = 138412290;
      int v30 = (const char *)v16;
      _os_log_impl(&dword_210A81000, v15, OS_LOG_TYPE_DEFAULT, "             isVideo: %@", (uint8_t *)&v29, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v6 interruptionDuration];
      int v29 = 67109120;
      LODWORD(v30) = v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, "interruptionDuration: %u", (uint8_t *)&v29, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [v6 isVideoResumed] ? @"YES" : @"NO";
      int v29 = 138412290;
      int v30 = (const char *)v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, "      isVideoResumed: %@", (uint8_t *)&v29, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v6 isAudioResumed] ? @"YES" : @"NO";
      int v29 = 138412290;
      int v30 = (const char *)v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "      isAudioResumed: %@", (uint8_t *)&v29, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    id v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v6 linkQuality];
      int v29 = 67109120;
      LODWORD(v30) = v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, "         linkQuality: %d", (uint8_t *)&v29, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    id v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v26 = @"YES";
      }
      else {
        int v26 = @"NO";
      }
      int v29 = 138412290;
      int v30 = (const char *)v26;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "        onLockScreen: %@", (uint8_t *)&v29, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v27 = *(unsigned __int8 *)(a1 + 52);
    id v28 = sub_210A83B28();
    if (sub_210A8A13C(v27, (uint64_t)v28))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallInvitationSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_210A9040C;
  v6[3] = &unk_264188E18;
  char v8 = a3;
  int v7 = a4;
  v6[4] = a5;
  char v9 = a6;
  char v10 = a2;
  sub_210A824A0(v6);
}

void sub_210A9040C(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v25 = "void FTAWDLogCallInvitationSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312518);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312534);
  if (v3 | v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 44)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setErrorCode:");
    }
    int v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 45)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", buf, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 isVideo] ? @"YES" : @"NO";
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 errorCode];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", buf, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 sendDuration];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", buf, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v21 = @"YES";
      }
      else {
        int v21 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", buf, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v22 = *(unsigned __int8 *)(a1 + 46);
    id v23 = sub_210A83B28();
    if (sub_210A8A13C(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallInvitationReceived(uint64_t a1, char a2, char a3, char a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A90A34;
  block[3] = &unk_264188E38;
  char v5 = a3;
  char v6 = a4;
  char v7 = a2;
  sub_210A824A0(block);
}

void sub_210A90A34(unsigned char *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136446210;
    int v19 = "void FTAWDLogCallInvitationReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312519);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312535);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (a1[32]) {
      [v6 setIsVideo:1];
    }
    if (a1[33]) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      int v19 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 guid];
      int v18 = 138412290;
      int v19 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 timestamp];
      int v18 = 134217984;
      int v19 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 isVideo] ? @"YES" : @"NO";
      int v18 = 138412290;
      int v19 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      int v18 = 138412290;
      int v19 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v16 = a1[34];
    id v17 = sub_210A83B28();
    if (sub_210A8A13C(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallCancelSent(uint64_t a1, char a2, char a3, int a4, int a5, uint64_t a6, char a7)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A90EE8;
  block[3] = &unk_264188E60;
  char v10 = a3;
  int v8 = a4;
  int v9 = a5;
  void block[4] = a6;
  char v11 = a7;
  char v12 = a2;
  sub_210A824A0(block);
}

void sub_210A90EE8(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136446210;
    int v27 = "void FTAWDLogCallCancelSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, FTAWDConferenceMessageRe"
          "ason, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312520);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312536);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 48)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setErrorCode:");
    }
    if (*(_DWORD *)(a1 + 44)) {
      objc_msgSend(v6, "setCancelCode:");
    }
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 49)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134217984;
      int v27 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v26 = 138412290;
      int v27 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "         GUID : %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v26 = 134217984;
      int v27 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "    Timestamp : %llu", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v26, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 isVideo] ? @"YES" : @"NO";
      int v26 = 138412290;
      int v27 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 errorCode];
      int v26 = 67109120;
      LODWORD(v27) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 cancelCode];
      int v26 = 67109120;
      LODWORD(v27) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "    cancelCode: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 sendDuration];
      int v26 = 67109120;
      LODWORD(v27) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        id v23 = @"YES";
      }
      else {
        id v23 = @"NO";
      }
      int v26 = 138412290;
      int v27 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v24 = *(unsigned __int8 *)(a1 + 50);
    id v25 = sub_210A83B28();
    if (sub_210A8A13C(v24, (uint64_t)v25))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallAcceptSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_210A91598;
  v6[3] = &unk_264188E18;
  char v8 = a3;
  int v7 = a4;
  v6[4] = a5;
  char v9 = a6;
  char v10 = a2;
  sub_210A824A0(v6);
}

void sub_210A91598(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v25 = "void FTAWDLogCallAcceptSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312527);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312537);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 44)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setErrorCode:");
    }
    int v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 45)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", buf, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 isVideo] ? @"YES" : @"NO";
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 errorCode];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", buf, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 sendDuration];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", buf, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v21 = @"YES";
      }
      else {
        int v21 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", buf, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v22 = *(unsigned __int8 *)(a1 + 46);
    id v23 = sub_210A83B28();
    if (sub_210A8A13C(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallAcceptReceived(uint64_t a1, char a2, char a3, char a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A91BC0;
  block[3] = &unk_264188E38;
  char v5 = a4;
  char v6 = a3;
  char v7 = a2;
  sub_210A824A0(block);
}

void sub_210A91BC0(unsigned char *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136446210;
    int v19 = "void FTAWDLogCallAcceptReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312521);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312538);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (a1[32]) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      int v19 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 guid];
      int v18 = 138412290;
      int v19 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 timestamp];
      int v18 = 134217984;
      int v19 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = a1[33] ? @"YES" : @"NO";
      int v18 = 138412290;
      int v19 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if (a1[32]) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      int v18 = 138412290;
      int v19 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v16 = a1[34];
    id v17 = sub_210A83B28();
    if (sub_210A8A13C(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallDeclineSent(uint64_t a1, char a2, char a3, int a4, int a5, uint64_t a6, char a7)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A92058;
  block[3] = &unk_264188E60;
  char v10 = a3;
  int v8 = a4;
  int v9 = a5;
  void block[4] = a6;
  char v11 = a7;
  char v12 = a2;
  sub_210A824A0(block);
}

void sub_210A92058(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136446210;
    int v27 = "void FTAWDLogCallDeclineSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, FTAWDConferenceMessageR"
          "eason, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v26, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312522);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312539);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 48)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setErrorCode:");
    }
    if (*(_DWORD *)(a1 + 44)) {
      objc_msgSend(v6, "setDeclineCode:");
    }
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 49)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134217984;
      int v27 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v26 = 138412290;
      int v27 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "         GUID : %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v26 = 134217984;
      int v27 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "    Timestamp : %llu", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v26, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 isVideo] ? @"YES" : @"NO";
      int v26 = 138412290;
      int v27 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v26, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 errorCode];
      int v26 = 67109120;
      LODWORD(v27) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 declineCode];
      int v26 = 67109120;
      LODWORD(v27) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "   declineCode: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 sendDuration];
      int v26 = 67109120;
      LODWORD(v27) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", (uint8_t *)&v26, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        id v23 = @"YES";
      }
      else {
        id v23 = @"NO";
      }
      int v26 = 138412290;
      int v27 = (const char *)v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v26, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v24 = *(unsigned __int8 *)(a1 + 50);
    id v25 = sub_210A83B28();
    if (sub_210A8A13C(v24, (uint64_t)v25))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallRelayInitiateSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_210A9270C;
  v6[3] = &unk_264188E18;
  char v8 = a3;
  int v7 = a4;
  v6[4] = a5;
  char v9 = a6;
  char v10 = a2;
  sub_210A824A0(v6);
}

void sub_210A9270C(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v25 = "void FTAWDLogCallRelayInitiateSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312523);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312540);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 44)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setErrorCode:");
    }
    int v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 45)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", buf, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 isVideo] ? @"YES" : @"NO";
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", buf, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 errorCode];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", buf, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 sendDuration];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", buf, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v21 = @"YES";
      }
      else {
        int v21 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v25 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", buf, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v22 = *(unsigned __int8 *)(a1 + 46);
    id v23 = sub_210A83B28();
    if (sub_210A8A13C(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallRelayInitiateReceived(uint64_t a1, char a2, char a3, char a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A92D34;
  block[3] = &unk_264188E38;
  char v5 = a3;
  char v6 = a4;
  char v7 = a2;
  sub_210A824A0(block);
}

void sub_210A92D34(unsigned char *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136446210;
    int v19 = "void FTAWDLogCallRelayInitiateReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312524);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312541);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (a1[32]) {
      [v6 setIsVideo:1];
    }
    if (a1[33]) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      int v19 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 guid];
      int v18 = 138412290;
      int v19 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 timestamp];
      int v18 = 134217984;
      int v19 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 isVideo] ? @"YES" : @"NO";
      int v18 = 138412290;
      int v19 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      int v18 = 138412290;
      int v19 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v16 = a1[34];
    id v17 = sub_210A83B28();
    if (sub_210A8A13C(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallRelayUpdateSent(uint64_t a1, char a2, char a3, int a4, uint64_t a5, char a6)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_210A931EC;
  v6[3] = &unk_264188E18;
  char v8 = a3;
  int v7 = a4;
  v6[4] = a5;
  char v9 = a6;
  char v10 = a2;
  sub_210A824A0(v6);
}

void sub_210A931EC(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136446210;
    id v25 = "void FTAWDLogCallRelayUpdateSent(NSString *, BOOL, BOOL, FTAWDConferenceMessageResultCode, NSNumber *, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v24, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312525);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312542);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (*(unsigned char *)(a1 + 44)) {
      [v6 setIsVideo:1];
    }
    if (*(_DWORD *)(a1 + 40)) {
      objc_msgSend(v6, "setErrorCode:");
    }
    int v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setSendDuration:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (*(unsigned char *)(a1 + 45)) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      id v25 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 guid];
      int v24 = 138412290;
      id v25 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 timestamp];
      int v24 = 134217984;
      id v25 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "                  ", (uint8_t *)&v24, 2u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 errorCode];
      int v24 = 67109120;
      LODWORD(v25) = v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "     errorCode: %u", (uint8_t *)&v24, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 sendDuration];
      int v24 = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "  sendDuration: %u", (uint8_t *)&v24, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 isVideo] ? @"YES" : @"NO";
      int v24 = 138412290;
      id v25 = (const char *)v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v24, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v21 = @"YES";
      }
      else {
        int v21 = @"NO";
      }
      int v24 = 138412290;
      id v25 = (const char *)v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v24, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v22 = *(unsigned __int8 *)(a1 + 46);
    id v23 = sub_210A83B28();
    if (sub_210A8A13C(v22, (uint64_t)v23))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogCallRelayUpdatedReceived(uint64_t a1, char a2, char a3, char a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A93804;
  block[3] = &unk_264188E38;
  char v5 = a3;
  char v6 = a4;
  char v7 = a2;
  sub_210A824A0(block);
}

void sub_210A93804(unsigned char *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136446210;
    int v19 = "void FTAWDLogCallRelayUpdatedReceived(NSString *, BOOL, BOOL, BOOL)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }
  unint64_t v3 = (unint64_t)sub_210A82B44(5312526);
  unint64_t v4 = (unint64_t)sub_210A82B44(5312543);
  if (v3 | v4)
  {
    char v5 = (void *)v4;
    id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v6, "setTimestamp:", objc_msgSend((id)qword_26AC05388, "getAWDTimestamp"));
    if (a1[32]) {
      [v6 setIsVideo:1];
    }
    if (a1[33]) {
      [v6 setOnLockScreen:1];
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      int v19 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, " Metric Object: %p", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 guid];
      int v18 = 138412290;
      int v19 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "          GUID: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 timestamp];
      int v18 = 134217984;
      int v19 = (const char *)v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Timestamp: %llu", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 isVideo] ? @"YES" : @"NO";
      int v18 = 138412290;
      int v19 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "       isVideo: %@", (uint8_t *)&v18, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    double v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      if ([v6 onLockScreen]) {
        int v15 = @"YES";
      }
      else {
        int v15 = @"NO";
      }
      int v18 = 138412290;
      int v19 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "  onLockScreen: %@", (uint8_t *)&v18, 0xCu);
    }
    sub_210A82E50(v6, (void *)v3);
    int v16 = a1[34];
    id v17 = sub_210A83B28();
    if (sub_210A8A13C(v16, (uint64_t)v17))
    {
      objc_msgSend(v6, "setTimestamp:", (unint64_t)(floor((double)(unint64_t)objc_msgSend(v6, "timestamp") / 3600000.0) * 3600000.0));
      sub_210A82E50(v6, v5);
    }
  }
}

void FTAWDLogRegistrationPhoneNumberValidationFinished(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A93CB0;
  block[3] = &unk_264188E88;
  int v5 = a2;
  void block[4] = a3;
  void block[5] = a4;
  sub_210A824A0(block);
}

void sub_210A93CB0(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136446210;
    int v18 = "void FTAWDLogRegistrationPhoneNumberValidationFinished(NSString *, FTAWDIDSRegistrationError, NSNumber *, NSNu"
          "mber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v17, 0xCu);
  }
  id v3 = sub_210A82B44(5316608);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    [v5 setRegistrationError:*(unsigned int *)(a1 + 48)];
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      objc_msgSend(v5, "setValidationDuration:", objc_msgSend(v6, "unsignedIntValue"));
    }
    char v7 = *(void **)(a1 + 40);
    if (v7) {
      objc_msgSend(v5, "setNumberOfSMSSent:", objc_msgSend(v7, "unsignedIntValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      int v18 = (const char *)v5;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v17, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v5 guid];
      int v17 = 138412290;
      int v18 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v17, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v5 registrationError];
      int v17 = 67109120;
      LODWORD(v18) = v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, " registrationError: %d", (uint8_t *)&v17, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v5 validationDuration];
      int v17 = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "validationDuration: %u", (uint8_t *)&v17, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v15 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v5 numberOfSMSSent];
      int v17 = 67109120;
      LODWORD(v18) = v16;
      _os_log_impl(&dword_210A81000, v15, OS_LOG_TYPE_DEFAULT, "   numberOfSMSSent: %u", (uint8_t *)&v17, 8u);
    }
    sub_210A82E50(v5, v4);
  }
}

void FTAWDLogRegistrationPhoneNumberReceivedSMS(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A940B0;
  block[3] = &unk_264188C68;
  void block[4] = a2;
  sub_210A824A0(block);
}

void sub_210A940B0(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    uint64_t v13 = "void FTAWDLogRegistrationPhoneNumberReceivedSMS(NSString *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }
  id v3 = sub_210A82B44(5316609);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      objc_msgSend(v5, "setSmsRoundTripDuration:", objc_msgSend(v6, "unsignedIntValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    char v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = (const char *)v5;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, "       Metric Object: %p", (uint8_t *)&v12, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 guid];
      int v12 = 138412290;
      uint64_t v13 = (const char *)v9;
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "                GUID: %@", (uint8_t *)&v12, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v5 smsRoundTripDuration];
      int v12 = 67109120;
      LODWORD(v13) = v11;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "smsRoundTripDuration: %u", (uint8_t *)&v12, 8u);
    }
    sub_210A82E50(v5, v4);
  }
}

void FTAWDLogRegistrationProfileLinkHandles(uint64_t a1, char a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_210A943C4;
  v9[3] = &unk_264188ED8;
  char v14 = a2;
  int v10 = a3;
  int v11 = a4;
  int v12 = a5;
  int v13 = a6;
  v9[4] = a7;
  void v9[5] = a8;
  v9[6] = a9;
  sub_210A824A0(v9);
}

void sub_210A943C4(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136446210;
    uint64_t v31 = "void FTAWDLogRegistrationProfileLinkHandles(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessa"
          "geResultCode, FTAWDIDSRegistrationError, FTAWDIDSEmailVettingStatus, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }
  id v3 = sub_210A82B44(5316612);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 72)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    [v6 setVettingStatus:*(unsigned int *)(a1 + 68)];
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    uint64_t v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134217984;
      uint64_t v31 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v30 = 138412290;
      uint64_t v31 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      int v15 = @"YES";
      if (!v14) {
        int v15 = @"NO";
      }
      int v30 = 138412290;
      uint64_t v31 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v30 = 67109120;
      LODWORD(v31) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v30 = 67109120;
      LODWORD(v31) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 vettingStatus];
      int v30 = 67109120;
      LODWORD(v31) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "     vettingStatus: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 genericError];
      int v30 = 67109120;
      LODWORD(v31) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 uRLError];
      int v30 = 67109120;
      LODWORD(v31) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [v6 pOSIXError];
      int v30 = 67109120;
      LODWORD(v31) = v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v30, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void FTAWDLogRegistrationProfileUnLinkHandles(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A94A70;
  block[3] = &unk_264188EB0;
  char v12 = a2;
  int v9 = a3;
  int v10 = a4;
  int v11 = a5;
  void block[4] = a6;
  void block[5] = a7;
  void block[6] = a8;
  sub_210A824A0(block);
}

void sub_210A94A70(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136446210;
    int v29 = "void FTAWDLogRegistrationProfileUnLinkHandles(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMes"
          "sageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  id v3 = sub_210A82B44(5316612);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 68)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      int v29 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v28 = 138412290;
      int v29 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      int v15 = @"YES";
      if (!v14) {
        int v15 = @"NO";
      }
      int v28 = 138412290;
      int v29 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 genericError];
      int v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 uRLError];
      int v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 pOSIXError];
      int v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void FTAWDLogRegistrationProfileValidateHandle(uint64_t a1, char a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_210A950A4;
  v9[3] = &unk_264188ED8;
  char v14 = a2;
  int v10 = a3;
  int v11 = a4;
  int v12 = a5;
  int v13 = a6;
  v9[4] = a7;
  void v9[5] = a8;
  v9[6] = a9;
  sub_210A824A0(v9);
}

void sub_210A950A4(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136446210;
    uint64_t v31 = "void FTAWDLogRegistrationProfileValidateHandle(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMe"
          "ssageResultCode, FTAWDIDSRegistrationError, FTAWDIDSEmailVettingStatus, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v30, 0xCu);
  }
  id v3 = sub_210A82B44(5316613);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 72)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    [v6 setVettingStatus:*(unsigned int *)(a1 + 68)];
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134217984;
      uint64_t v31 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v30 = 138412290;
      uint64_t v31 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      int v15 = @"YES";
      if (!v14) {
        int v15 = @"NO";
      }
      int v30 = 138412290;
      uint64_t v31 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v30, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v30 = 67109120;
      LODWORD(v31) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v30 = 67109120;
      LODWORD(v31) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 vettingStatus];
      int v30 = 67109120;
      LODWORD(v31) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "     vettingStatus: %u", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 genericError];
      int v30 = 67109120;
      LODWORD(v31) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 uRLError];
      int v30 = 67109120;
      LODWORD(v31) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v30, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [v6 pOSIXError];
      int v30 = 67109120;
      LODWORD(v31) = v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v30, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void FTAWDLogRegistrationProfileValidateInvitationContext(uint64_t a1, char a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A95750;
  block[3] = &unk_264188EB0;
  char v12 = a2;
  int v9 = a3;
  int v10 = a4;
  int v11 = a5;
  void block[4] = a6;
  void block[5] = a7;
  void block[6] = a8;
  sub_210A824A0(block);
}

void sub_210A95750(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136446210;
    int v29 = "void FTAWDLogRegistrationProfileValidateInvitationContext(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDC"
          "onferenceMessageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  id v3 = sub_210A82B44(5316614);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 68)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      int v29 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v28 = 138412290;
      int v29 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      int v15 = @"YES";
      if (!v14) {
        int v15 = @"NO";
      }
      int v28 = 138412290;
      int v29 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 genericError];
      int v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 uRLError];
      int v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 pOSIXError];
      int v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void FTAWDLogRegistrationAuthenticate(uint64_t a1, char a2, int a3, int a4, int a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_210A95D8C;
  block[3] = &unk_264188F00;
  char v14 = a2;
  int v11 = a3;
  int v12 = a4;
  int v13 = a5;
  char v15 = a6;
  char v16 = a7;
  void block[4] = a8;
  void block[5] = a9;
  void block[6] = a10;
  sub_210A824A0(block);
}

void sub_210A95D8C(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136446210;
    long long v33 = "void FTAWDLogRegistrationAuthenticate(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessageResu"
          "ltCode, FTAWDIDSRegistrationError, BOOL, BOOL, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v32, 0xCu);
  }
  id v3 = sub_210A82B44(5316615);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 68)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    if (*(unsigned char *)(a1 + 69)) {
      [v6 setIsPhoneUser:1];
    }
    if (*(unsigned char *)(a1 + 70)) {
      [v6 setIsDSUser:1];
    }
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 134217984;
      long long v33 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v32 = 138412290;
      long long v33 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      char v15 = @"YES";
      if (!v14) {
        char v15 = @"NO";
      }
      int v32 = 138412290;
      long long v33 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v32, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v32 = 67109120;
      LODWORD(v33) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v32 = 67109120;
      LODWORD(v33) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v32 = 67109120;
      LODWORD(v33) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 isPhoneUser];
      int v32 = 67109120;
      LODWORD(v33) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "       isPhoneUser: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 isDSUser];
      int v32 = 67109120;
      LODWORD(v33) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "          isDSUser: %u", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 genericError];
      int v32 = 67109120;
      LODWORD(v33) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v28 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [v6 uRLError];
      int v32 = 67109120;
      LODWORD(v33) = v29;
      _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v32, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v30 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = [v6 pOSIXError];
      int v32 = 67109120;
      LODWORD(v33) = v31;
      _os_log_impl(&dword_210A81000, v30, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v32, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void FTAWDLogRegistrationRegister(uint64_t a1, char a2, int a3, int a4, int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_210A964CC;
  v10[3] = &unk_264188F28;
  char v14 = a2;
  int v11 = a3;
  int v12 = a4;
  int v13 = a5;
  char v15 = a6;
  v10[4] = a7;
  void v10[5] = a8;
  v10[6] = a9;
  v10[7] = a10;
  sub_210A824A0(v10);
}

void sub_210A964CC(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136446210;
    uint64_t v34 = "void FTAWDLogRegistrationRegister(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferenceMessageResultCo"
          "de, FTAWDIDSRegistrationError, BOOL, NSNumber *, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v33, 0xCu);
  }
  id v3 = sub_210A82B44(5316616);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 76)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 64)];
    [v6 setResultCode:*(unsigned int *)(a1 + 68)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 72)];
    if (*(unsigned char *)(a1 + 77)) {
      [v6 setHeartbeatRegister:1];
    }
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setHeartbeatDelay:", objc_msgSend(v7, "unsignedIntValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v9, "intValue"));
    }
    int v10 = *(void **)(a1 + 56);
    if (v10) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v10, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 134217984;
      uint64_t v34 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "      Metric Object: %p", (uint8_t *)&v33, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v12 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 guid];
      int v33 = 138412290;
      uint64_t v34 = (const char *)v13;
      _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "               GUID: %@", (uint8_t *)&v33, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v14 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 success];
      char v16 = @"YES";
      if (!v15) {
        char v16 = @"NO";
      }
      int v33 = 138412290;
      uint64_t v34 = (const char *)v16;
      _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "            success: %@", (uint8_t *)&v33, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v17 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v6 connectionType];
      int v33 = 67109120;
      LODWORD(v34) = v18;
      _os_log_impl(&dword_210A81000, v17, OS_LOG_TYPE_DEFAULT, "     connectionType: %u", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v19 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = [v6 resultCode];
      int v33 = 67109120;
      LODWORD(v34) = v20;
      _os_log_impl(&dword_210A81000, v19, OS_LOG_TYPE_DEFAULT, "         resultCode: %u", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v21 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v6 registrationError];
      int v33 = 67109120;
      LODWORD(v34) = v22;
      _os_log_impl(&dword_210A81000, v21, OS_LOG_TYPE_DEFAULT, "  registrationError: %u", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v23 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v6 heartbeatRegister];
      int v33 = 67109120;
      LODWORD(v34) = v24;
      _os_log_impl(&dword_210A81000, v23, OS_LOG_TYPE_DEFAULT, "isHeartbeatRegister: %u", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v25 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v6 heartbeatDelay];
      int v33 = 67109120;
      LODWORD(v34) = v26;
      _os_log_impl(&dword_210A81000, v25, OS_LOG_TYPE_DEFAULT, "     heartbeatDelay: %u", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v27 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v6 genericError];
      int v33 = 67109120;
      LODWORD(v34) = v28;
      _os_log_impl(&dword_210A81000, v27, OS_LOG_TYPE_DEFAULT, "       genericError: %d", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v29 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [v6 uRLError];
      int v33 = 67109120;
      LODWORD(v34) = v30;
      _os_log_impl(&dword_210A81000, v29, OS_LOG_TYPE_DEFAULT, "           URLError: %d", (uint8_t *)&v33, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v31 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = [v6 pOSIXError];
      int v33 = 67109120;
      LODWORD(v34) = v32;
      _os_log_impl(&dword_210A81000, v31, OS_LOG_TYPE_DEFAULT, "         POSIXError: %d", (uint8_t *)&v33, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void sub_210A96B8C(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136446210;
    int v29 = "void FTAWDLogRegistrationGetDependentRegistrations(NSString *, BOOL, FTAWDNetworkConnectionType, FTAWDConferen"
          "ceMessageResultCode, FTAWDIDSRegistrationError, NSNumber *, NSNumber *, NSNumber *)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v28, 0xCu);
  }
  id v3 = sub_210A82B44(5316618);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v6 = v5;
    if (*(unsigned char *)(a1 + 68)) {
      [v5 setSuccess:1];
    }
    [v6 setConnectionType:*(unsigned int *)(a1 + 56)];
    [v6 setResultCode:*(unsigned int *)(a1 + 60)];
    [v6 setRegistrationError:*(unsigned int *)(a1 + 64)];
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_msgSend(v6, "setGenericError:", objc_msgSend(v7, "intValue"));
    }
    char v8 = *(void **)(a1 + 40);
    if (v8) {
      objc_msgSend(v6, "setURLError:", objc_msgSend(v8, "intValue"));
    }
    int v9 = *(void **)(a1 + 48);
    if (v9) {
      objc_msgSend(v6, "setPOSIXError:", objc_msgSend(v9, "intValue"));
    }
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v10 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      int v29 = (const char *)v6;
      _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v6 guid];
      int v28 = 138412290;
      int v29 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "              GUID: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    uint64_t v13 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v6 success];
      int v15 = @"YES";
      if (!v14) {
        int v15 = @"NO";
      }
      int v28 = 138412290;
      int v29 = (const char *)v15;
      _os_log_impl(&dword_210A81000, v13, OS_LOG_TYPE_DEFAULT, "           success: %@", (uint8_t *)&v28, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v16 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v6 connectionType];
      int v28 = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "    connectionType: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v18 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v6 resultCode];
      int v28 = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "        resultCode: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v20 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v6 registrationError];
      int v28 = 67109120;
      LODWORD(v29) = v21;
      _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, " registrationError: %u", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v22 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v6 genericError];
      int v28 = 67109120;
      LODWORD(v29) = v23;
      _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "      genericError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v24 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [v6 uRLError];
      int v28 = 67109120;
      LODWORD(v29) = v25;
      _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "          URLError: %d", (uint8_t *)&v28, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v26 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v6 pOSIXError];
      int v28 = 67109120;
      LODWORD(v29) = v27;
      _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "        POSIXError: %d", (uint8_t *)&v28, 8u);
    }
    sub_210A82E50(v6, v4);
  }
}

void sub_210A97140(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446210;
    int v14 = "void FTAWDLogRegistrationRenewCredentialsCompleted(NSInteger, NSErrorDomain, NSInteger)_block_invoke";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v13, 0xCu);
  }
  id v3 = sub_210A82B44(5316622);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
    [v5 setRenewResult:*(unsigned int *)(a1 + 40)];
    [v5 setErrorDomain:*(void *)(a1 + 32)];
    [v5 setErrorCode:*(void *)(a1 + 48)];
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    id v6 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      int v14 = (const char *)v5;
      _os_log_impl(&dword_210A81000, v6, OS_LOG_TYPE_DEFAULT, "     Metric Object: %p", (uint8_t *)&v13, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    char v7 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v5 renewResult];
      int v13 = 67109120;
      LODWORD(v14) = v8;
      _os_log_impl(&dword_210A81000, v7, OS_LOG_TYPE_DEFAULT, "       renewResult: %u", (uint8_t *)&v13, 8u);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v9 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v5 errorDomain];
      int v13 = 138412290;
      int v14 = (const char *)v10;
      _os_log_impl(&dword_210A81000, v9, OS_LOG_TYPE_DEFAULT, "       errorDomain: %@", (uint8_t *)&v13, 0xCu);
      if (qword_26AC05378 != -1) {
        dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
      }
    }
    int v11 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v5 errorCode];
      int v13 = 134217984;
      int v14 = (const char *)v12;
      _os_log_impl(&dword_210A81000, v11, OS_LOG_TYPE_DEFAULT, "         errorCode: %lld", (uint8_t *)&v13, 0xCu);
    }
    sub_210A82E50(v5, v4);
  }
}

BOOL sub_210A9744C(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446210;
    int v14 = "BOOL __IsMetricEnabled(FTAWDMetricType)";
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v13, 0xCu);
  }
  if (!qword_26AC05388) {
    sub_210A8394C();
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
  unint64_t v4 = (void *)[(id)qword_26AC05388 newMetricContainerWithIdentifier:a1];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    id v6 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      [v5 timeIntervalSinceDate:v3];
      int v13 = 134217984;
      int v14 = v7;
      _os_log_impl(&dword_210A81000, v6, OS_LOG_TYPE_DEFAULT, "It took %f seconds to get a metric container", (uint8_t *)&v13, 0xCu);
    }

    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = sub_210A820E4(a1);
      int v13 = 138412290;
      int v14 = (const char *)v9;
      uint64_t v10 = "%@ is enabled on this config";
LABEL_20:
      _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {

    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
    int v8 = qword_26AC05370;
    if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = sub_210A820E4(a1);
      int v13 = 138412290;
      int v14 = (const char *)v11;
      uint64_t v10 = "Configuration doesn't allow for %@ to be submitted to AWD";
      goto LABEL_20;
    }
  }
  return v4 != 0;
}

void sub_210A976DC()
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  if (qword_26AC05378 != -1) {
    dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
  }
  id v0 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v1 = sub_210A9744C(5308433) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v1;
    _os_log_impl(&dword_210A81000, v0, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v2 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = sub_210A9744C(5308449) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v3;
    _os_log_impl(&dword_210A81000, v2, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  unint64_t v4 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_210A9744C(5308434) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v5;
    _os_log_impl(&dword_210A81000, v4, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  id v6 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = sub_210A9744C(5308450) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v7;
    _os_log_impl(&dword_210A81000, v6, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeSMSSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v8 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = sub_210A9744C(5308435) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v9;
    _os_log_impl(&dword_210A81000, v8, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v10 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = sub_210A9744C(5308451) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v11;
    _os_log_impl(&dword_210A81000, v10, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v12 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = sub_210A9744C(5308419) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v13;
    _os_log_impl(&dword_210A81000, v12, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v14 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = sub_210A9744C(5308452) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v15;
    _os_log_impl(&dword_210A81000, v14, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v16 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = sub_210A9744C(5308417) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v17;
    _os_log_impl(&dword_210A81000, v16, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentDownload is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v18 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = sub_210A9744C(5308453) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v19;
    _os_log_impl(&dword_210A81000, v18, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentDownloadHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v20 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = sub_210A9744C(5308418) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v21;
    _os_log_impl(&dword_210A81000, v20, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentUpload is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v22 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = sub_210A9744C(5308454) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v23;
    _os_log_impl(&dword_210A81000, v22, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageAttachmentUploadHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v24 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = sub_210A9744C(5308420) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v25;
    _os_log_impl(&dword_210A81000, v24, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDelivered is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v26 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = sub_210A9744C(5308455) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v27;
    _os_log_impl(&dword_210A81000, v26, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDeliveredHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v28 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = sub_210A9744C(5308440) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v29;
    _os_log_impl(&dword_210A81000, v28, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDowngrade is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v30 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = sub_210A9744C(5308456) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v31;
    _os_log_impl(&dword_210A81000, v30, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDowngradeHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v32 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = sub_210A9744C(5308441) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v33;
    _os_log_impl(&dword_210A81000, v32, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageQueryFinished is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v34 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = sub_210A9744C(5308457) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v35;
    _os_log_impl(&dword_210A81000, v34, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageQueryFinishedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  long long v36 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = sub_210A9744C(5308442) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v37;
    _os_log_impl(&dword_210A81000, v36, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDeduplicated is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  long long v38 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = sub_210A9744C(5308458) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v39;
    _os_log_impl(&dword_210A81000, v38, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeIMessageDeduplicatedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  uint64_t v40 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = sub_210A9744C(5312513) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v41;
    _os_log_impl(&dword_210A81000, v40, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallStarted is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v42 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = sub_210A9744C(5312529) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v43;
    _os_log_impl(&dword_210A81000, v42, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallStartedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v44 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = sub_210A9744C(5312514) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v45;
    _os_log_impl(&dword_210A81000, v44, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallConnected is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v46 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    id v47 = sub_210A9744C(5312530) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v47;
    _os_log_impl(&dword_210A81000, v46, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallConnectedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  double v48 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    double v49 = sub_210A9744C(5312515) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v49;
    _os_log_impl(&dword_210A81000, v48, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallEnded is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  double v50 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v51 = sub_210A9744C(5312531) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v51;
    _os_log_impl(&dword_210A81000, v50, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallEndedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v52 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v53 = sub_210A9744C(5312544) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v53;
    _os_log_impl(&dword_210A81000, v52, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallFailed is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v54 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = sub_210A9744C(5312560) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v55;
    _os_log_impl(&dword_210A81000, v54, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallFailedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v56 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v57 = sub_210A9744C(5312516) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v57;
    _os_log_impl(&dword_210A81000, v56, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionBegan is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  char v58 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v59 = sub_210A9744C(5312532) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v59;
    _os_log_impl(&dword_210A81000, v58, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionBeganHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v60 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v61 = sub_210A9744C(5312517) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v61;
    _os_log_impl(&dword_210A81000, v60, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionEnded is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v62 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v63 = sub_210A9744C(5312533) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v63;
    _os_log_impl(&dword_210A81000, v62, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInterruptionEndedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v64 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v65 = sub_210A9744C(5312518) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v65;
    _os_log_impl(&dword_210A81000, v64, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v66 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v67 = sub_210A9744C(5312534) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v67;
    _os_log_impl(&dword_210A81000, v66, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v68 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v69 = sub_210A9744C(5312519) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v69;
    _os_log_impl(&dword_210A81000, v68, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v70 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v71 = sub_210A9744C(5312535) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v71;
    _os_log_impl(&dword_210A81000, v70, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallInvitationReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v72 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v73 = sub_210A9744C(5312520) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v73;
    _os_log_impl(&dword_210A81000, v72, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallCancelSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v74 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v75 = sub_210A9744C(5312536) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v75;
    _os_log_impl(&dword_210A81000, v74, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallCancelSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v76 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v77 = sub_210A9744C(5312527) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v77;
    _os_log_impl(&dword_210A81000, v76, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v78 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v79 = sub_210A9744C(5312537) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v79;
    _os_log_impl(&dword_210A81000, v78, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v80 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v81 = sub_210A9744C(5312521) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v81;
    _os_log_impl(&dword_210A81000, v80, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v82 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v83 = sub_210A9744C(5312538) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v83;
    _os_log_impl(&dword_210A81000, v82, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallAcceptReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v84 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v85 = sub_210A9744C(5312522) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v85;
    _os_log_impl(&dword_210A81000, v84, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallDeclineSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v86 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v87 = sub_210A9744C(5312539) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v87;
    _os_log_impl(&dword_210A81000, v86, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallDeclineSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v88 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v89 = sub_210A9744C(5312523) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v89;
    _os_log_impl(&dword_210A81000, v88, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v90 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v91 = sub_210A9744C(5312540) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v91;
    _os_log_impl(&dword_210A81000, v90, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  v92 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v93 = sub_210A9744C(5312524) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v93;
    _os_log_impl(&dword_210A81000, v92, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v94 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v95 = sub_210A9744C(5312541) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v95;
    _os_log_impl(&dword_210A81000, v94, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayInitiateReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v96 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v97 = sub_210A9744C(5312525) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v97;
    _os_log_impl(&dword_210A81000, v96, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateSent is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v98 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    int v99 = sub_210A9744C(5312542) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v99;
    _os_log_impl(&dword_210A81000, v98, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateSentHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v100 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    v101 = sub_210A9744C(5312526) ? @"enabled" : @"NOT enabled";
    int v104 = 138412290;
    int v105 = v101;
    _os_log_impl(&dword_210A81000, v100, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateReceived is %@ on this config", (uint8_t *)&v104, 0xCu);
    if (qword_26AC05378 != -1) {
      dispatch_once(&qword_26AC05378, &unk_26C30E8E8);
    }
  }
  int v102 = qword_26AC05370;
  if (os_log_type_enabled((os_log_t)qword_26AC05370, OS_LOG_TYPE_DEFAULT))
  {
    if (sub_210A9744C(5312543)) {
      v103 = @"enabled";
    }
    else {
      v103 = @"NOT enabled";
    }
    int v104 = 138412290;
    int v105 = v103;
    _os_log_impl(&dword_210A81000, v102, OS_LOG_TYPE_DEFAULT, "FTAWDMetricTypeFaceTimeCallRelayUpdateReceivedHotShip is %@ on this config", (uint8_t *)&v104, 0xCu);
  }
}

os_log_t sub_210A98FD8()
{
  os_log_t result = os_log_create("com.apple.IMFoundation", "AWD");
  qword_26AC05370 = (uint64_t)result;
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t CUTGetMainBundleIdentifier()
{
  return MEMORY[0x270F183C8]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x270F183D8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}