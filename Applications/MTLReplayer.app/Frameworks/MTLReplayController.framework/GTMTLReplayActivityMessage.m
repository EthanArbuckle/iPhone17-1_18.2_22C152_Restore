@interface GTMTLReplayActivityMessage
- (GTMTLReplayActivityMessage)initWithMessage:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (unsigned)messageSerial;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityMessage

- (void).cxx_destruct
{
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    message = self->_message;
    v6 = a3;
    LODWORD(message) = [(GTTransportMessage_replayer *)message serial];
    activityType = self->super._activityType;
    unsigned int v8 = [(GTTransportMessage_replayer *)self->_message kind];
    v9 = [(GTTransportMessage_replayer *)self->_message attributes];
    v10[0] = 67109890;
    v10[1] = message;
    __int16 v11 = 2114;
    v12 = activityType;
    __int16 v13 = 1024;
    unsigned int v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl(&def_1C1270, v6, OS_LOG_TYPE_INFO, "%u. %{public}@(%u):\t%{public}@", (uint8_t *)v10, 0x22u);
  }
}

- (id)jsonObject
{
  v3 = [(GTTransportMessage_replayer *)self->_message payload];
  v4 = [v3 base64EncodedStringWithOptions:1];

  v5 = [(GTTransportMessage_replayer *)self->_message attributes];
  if (+[NSJSONSerialization isValidJSONObject:v5])
  {
    v6 = [(GTTransportMessage_replayer *)self->_message attributes];
  }
  else
  {
    v6 = 0;
  }

  v19[0] = self->super._activityType;
  v18[0] = @"activityType";
  v18[1] = @"message";
  v16[0] = @"kind";
  __int16 v15 = +[NSNumber numberWithUnsignedInt:[(GTTransportMessage_replayer *)self->_message kind]];
  v17[0] = v15;
  v16[1] = @"serial";
  v7 = +[NSNumber numberWithUnsignedInt:[(GTTransportMessage_replayer *)self->_message serial]];
  v17[1] = v7;
  v16[2] = @"attributes";
  unsigned int v8 = v6;
  if (!v6)
  {
    unsigned int v8 = +[NSNull null];
  }
  v17[2] = v8;
  v16[3] = @"payload";
  v9 = v4;
  if (!v4)
  {
    v9 = +[NSNull null];
  }
  v17[3] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  v19[1] = v10;
  v18[2] = @"activityStartTime";
  __int16 v11 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v19[2] = v11;
  v18[3] = @"activityEndTime";
  v12 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v19[3] = v12;
  __int16 v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

  if (v4)
  {
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v6) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v13;
}

- (id)summary
{
  int v2 = [(GTTransportMessage_replayer *)self->_message kind];
  if (v2 > 1791)
  {
    if (v2 <= 4095)
    {
      switch(v2)
      {
        case 2304:
          v3 = "kDYMessageFSStreamInitializeTransfer";
          break;
        case 2305:
          v3 = "kDYMessageFSStreamInitializeTransferAck";
          break;
        case 2306:
          v3 = "kDYMessageFSStreamItemData";
          break;
        case 2307:
          v3 = "kDYMessageFSStreamFinishedSending";
          break;
        case 2308:
          v3 = "kDYMessageFSStreamFinishedSendingAck";
          break;
        case 2309:
          v3 = "kDYMessageFSStreamAbort";
          break;
        default:
          switch(v2)
          {
            case 1792:
              v3 = "kDYMessageTraceBufferedFstreamData";
              break;
            case 1793:
              v3 = "kDYMessageTraceConfiguration";
              break;
            case 1794:
              v3 = "kDYMessageTraceOverridesConfiguration";
              break;
            case 1795:
              v3 = "kDYMessageTraceFlushBuffers";
              break;
            case 1796:
              v3 = "kDYMessageTraceModeChanged";
              break;
            default:
LABEL_109:
              GTMessageKindAsString_str();
              v3 = v4;
              snprintf(v4, 0x40uLL, "Unrecognized message: %d", v5);
              break;
          }
          break;
      }
    }
    else
    {
      switch(v2)
      {
        case 4096:
          v3 = "kDYMessageReplayerAppReady";
          break;
        case 4097:
        case 4123:
        case 4124:
        case 4125:
        case 4126:
        case 4127:
        case 4128:
          goto LABEL_109;
        case 4098:
          v3 = "kDYMessageReplayerReplayArchive";
          break;
        case 4099:
          v3 = "kDYMessageReplayerExperimentResult";
          break;
        case 4100:
          v3 = "kDYMessageReplayerReplayFinished";
          break;
        case 4101:
          v3 = "kDYMessageReplayerSetBackgroundImage";
          break;
        case 4102:
          v3 = "kDYMessageReplayerDeleteAllArchives";
          break;
        case 4103:
          v3 = "kDYMessageReplayerBeginDebugArchive";
          break;
        case 4104:
          v3 = "kDYMessageReplayerEndDebugArchive";
          break;
        case 4105:
          v3 = "kDYMessageReplayerDebugStatus";
          break;
        case 4106:
          v3 = "kDYMessageReplayerDebugFuncStop";
          break;
        case 4107:
          v3 = "kDYMessageReplayerDebugEnableWireframePresent";
          break;
        case 4108:
          v3 = "kDYMessageReplayerDebugEnableDrawCallPresent";
          break;
        case 4109:
          v3 = "kDYMessageReplayerDebugWireframeLineWidth";
          break;
        case 4110:
          v3 = "kDYMessageReplayerDebugWireframeLineColor";
          break;
        case 4111:
          v3 = "kDYMessageReplayerDebugDisableFunctions";
          break;
        case 4112:
          v3 = "kDYMessageReplayerDebugEnableFunctions";
          break;
        case 4113:
          v3 = "kDYMessageReplayerSetBackgroundImageData";
          break;
        case 4114:
          v3 = "kDYMessageReplayerLoadArchives";
          break;
        case 4115:
          v3 = "kDYMessageReplayerQueryLoadedArchivesInfo";
          break;
        case 4116:
          v3 = "kDYMessageReplayerArchivesDirectoryPath";
          break;
        case 4117:
          v3 = "kDYMessageReplayerQueryShaderInfo";
          break;
        case 4118:
          v3 = "kDYMessageReplayerDerivedCounterData";
          break;
        case 4119:
          v3 = "kDYMessageReplayerGenerateThumbnails";
          break;
        case 4120:
          v3 = "kDYMessageReplayerGenerateDependencyGraphThumbnails";
          break;
        case 4121:
          v3 = "kDYMessageFetchResourceObjectBatch";
          break;
        case 4122:
          v3 = "kDYMessageReplayerDebugEnableOutlinePresent";
          break;
        case 4129:
          v3 = "kGTMessageReplayerResourcesUsedForFunctionIndex";
          break;
        default:
          if (v2 == 4353)
          {
            v3 = "kGTMessageDiagnosticsReceivedData";
          }
          else
          {
            if (v2 != 4865) {
              goto LABEL_109;
            }
            v3 = "kGTMessageRunnablePID";
          }
          break;
      }
    }
  }
  else if (v2 <= 1279)
  {
    if (v2 > 511)
    {
      switch(v2)
      {
        case 1024:
          v3 = "kDYMessageCurrentDrawFramebufferImage";
          break;
        case 1025:
          v3 = "kDYMessageFetchResourceList";
          break;
        case 1026:
          v3 = "kDYMessageFetchResourceObject";
          break;
        case 1027:
          v3 = "kDYMessageFetchState";
          break;
        case 1028:
          v3 = "kDYMessageUpdateResourceObject";
          break;
        case 1029:
          v3 = "kDYMessageClearResourceOverrides";
          break;
        case 1030:
          v3 = "kDYGenerateShaderDebuggerTrace";
          break;
        default:
          if (v2 == 512)
          {
            v3 = "kDYMessageBreakpoint";
          }
          else
          {
            if (v2 != 513) {
              goto LABEL_109;
            }
            v3 = "kDYMessageBreakpointContinue";
          }
          break;
      }
    }
    else
    {
      v3 = "kDYMessageCaptureStart";
      switch(v2)
      {
        case 256:
          break;
        case 257:
          v3 = "kDYMessageCaptureStarted";
          break;
        case 258:
          v3 = "kDYMessageCaptureData";
          break;
        case 259:
          v3 = "kDYMessageCaptureCreateAlias";
          break;
        case 260:
          v3 = "kDYMessageCaptureStop";
          break;
        case 262:
          v3 = "kDYMessageCaptureDataReferenceCounts";
          break;
        case 263:
          v3 = "kDYMessageCaptureSentAllData";
          break;
        case 264:
          v3 = "kDYMessageCaptureActivateSession";
          break;
        case 265:
          v3 = "kDYMessageCaptureInvalidateSession";
          break;
        case 266:
          v3 = "kDYMessageCaptureSentUsedData";
          break;
        case 267:
          v3 = "kDYMessageCaptureSentAllMetadata";
          break;
        case 271:
          v3 = "kDYMessageCaptureDataChunk";
          break;
        default:
          goto LABEL_109;
      }
    }
  }
  else
  {
    switch(v2)
    {
      case 1280:
        v3 = "kDYMessageLaunchGuestApp";
        break;
      case 1281:
        v3 = "kDYMessageKillGuestApp";
        break;
      case 1282:
        v3 = "kDYMessageGuestAppTerminated";
        break;
      case 1283:
        v3 = "kDYMessageTerminateDaemon";
        break;
      case 1284:
        v3 = "kDYMessageApplicationList";
        break;
      case 1285:
        v3 = "kDYMessageApplicationIcon";
        break;
      case 1286:
        v3 = "kDYMessageDaemonCreateGuestAppTransport";
        break;
      case 1287:
        v3 = "kDYMessageMobileDaemonReloadUIServer";
        break;
      case 1288:
        v3 = "kDYMessageSendGuestAppToBackground";
        break;
      case 1289:
        v3 = "kDYMessageBringGuestAppToForeground";
        break;
      case 1290:
        v3 = "kDYMessageGPUToolsVersionQuery";
        break;
      case 1291:
        v3 = "kDYMessageMobileDaemonPosixSpawn";
        break;
      case 1292:
        v3 = "kDYMessageDaemonRegisterInferior";
        break;
      case 1293:
        v3 = "kDYDaemonResumeInferior";
        break;
      case 1294:
        v3 = "kDYMessageDaemonDeviceCapabilities";
        break;
      case 1295:
        v3 = "kDYMessageDaemonLaunchDebugServer";
        break;
      case 1296:
      case 1297:
        goto LABEL_109;
      case 1298:
        v3 = "kDYMessageDeviceCompatibilityCapabilities";
        break;
      default:
        switch(v2)
        {
          case 1536:
            v3 = "kDYMessageInferiorLaunched";
            break;
          case 1537:
            v3 = "kDYMessageInferiorSignalInterposeSemaphore";
            break;
          case 1538:
            v3 = "kDYMessageGuestAppCSSignature";
            break;
          case 1539:
            v3 = "kDYMessageGuestAppTimebase";
            break;
          case 1540:
            v3 = "kDYMessageGuestAppInvalidateSavePointerAliases";
            break;
          case 1541:
            v3 = "kDYMessageGuestAppProfilingData";
            break;
          case 1542:
            v3 = "kDYMessageGuestAppGLContextsInfo";
            break;
          case 1543:
            v3 = "kDYMessageGuestAppCADisplayLinkEvent";
            break;
          case 1544:
            v3 = "kDYMessageGuestAppMultitaskingSuspensionState";
            break;
          case 1545:
            v3 = "kDYMessageGuestAppLockGraphics";
            break;
          case 1546:
            v3 = "kDYMessageGuestAppUnlockGraphics";
            break;
          case 1547:
            v3 = "kDYMessageGuestAppMTLCommandQueuesInfo";
            break;
          case 1548:
            v3 = "kDYMessageGuestAppMTLCommandBuffersCaptured";
            break;
          case 1549:
            v3 = "kDYMessageGuestAppMTLCaptureScopesInfo";
            break;
          case 1550:
            v3 = "kDYMessageGuestAppCAMetalLayersInfo";
            break;
          case 1551:
            v3 = "kDYMessageGuestAppMTLDevicesInfo";
            break;
          default:
            goto LABEL_109;
        }
        break;
    }
  }
  v6 = +[NSString stringWithUTF8String:v3];
  v7 = +[NSString stringWithFormat:@"Responding to: %@", v6];

  return v7;
}

- (unsigned)messageSerial
{
  return [(GTTransportMessage_replayer *)self->_message serial];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityMessage;
  v4 = [(GTMTLReplayActivity *)&v7 copyWithZone:a3];
  int v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 5, self->_message);
  }
  return v5;
}

- (GTMTLReplayActivityMessage)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityMessage;
  v6 = [(GTMTLReplayActivity *)&v9 initWithType:@"message"];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

@end