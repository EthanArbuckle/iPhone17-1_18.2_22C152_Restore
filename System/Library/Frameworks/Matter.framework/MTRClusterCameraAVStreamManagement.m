@interface MTRClusterCameraAVStreamManagement
- (id)readAttributeAWBEnabledWithParams:(id)a3;
- (id)readAttributeAcceptedCommandListWithParams:(id)a3;
- (id)readAttributeAllocatedAudioStreamsWithParams:(id)a3;
- (id)readAttributeAllocatedSnapshotStreamsWithParams:(id)a3;
- (id)readAttributeAllocatedVideoStreamsWithParams:(id)a3;
- (id)readAttributeAttributeListWithParams:(id)a3;
- (id)readAttributeAutoISOEnabledWithParams:(id)a3;
- (id)readAttributeAutoShutterSpeedEnabledWithParams:(id)a3;
- (id)readAttributeClusterRevisionWithParams:(id)a3;
- (id)readAttributeCurrentFrameRateWithParams:(id)a3;
- (id)readAttributeCurrentSnapshotConfigWithParams:(id)a3;
- (id)readAttributeCurrentVideoCodecsWithParams:(id)a3;
- (id)readAttributeDepthSensorStatusWithParams:(id)a3;
- (id)readAttributeEventListWithParams:(id)a3;
- (id)readAttributeFabricsUsingCameraWithParams:(id)a3;
- (id)readAttributeFeatureMapWithParams:(id)a3;
- (id)readAttributeGeneratedCommandListWithParams:(id)a3;
- (id)readAttributeHDRModeEnabledWithParams:(id)a3;
- (id)readAttributeHardPrivacyModeOnWithParams:(id)a3;
- (id)readAttributeImageFlipHorizontalWithParams:(id)a3;
- (id)readAttributeImageFlipVerticalWithParams:(id)a3;
- (id)readAttributeImageRotationWithParams:(id)a3;
- (id)readAttributeLocalSnapshotRecordingEnabledWithParams:(id)a3;
- (id)readAttributeLocalVideoRecordingEnabledWithParams:(id)a3;
- (id)readAttributeMaxConcurrentVideoEncodersWithParams:(id)a3;
- (id)readAttributeMaxEncodedPixelRateWithParams:(id)a3;
- (id)readAttributeMaxNetworkBandwidthWithParams:(id)a3;
- (id)readAttributeMaxPreRollBufferSizeWithParams:(id)a3;
- (id)readAttributeMicrophoneAGCEnabledWithParams:(id)a3;
- (id)readAttributeMicrophoneCapabilitiesWithParams:(id)a3;
- (id)readAttributeMicrophoneMaxLevelWithParams:(id)a3;
- (id)readAttributeMicrophoneMinLevelWithParams:(id)a3;
- (id)readAttributeMicrophoneMutedWithParams:(id)a3;
- (id)readAttributeMicrophoneVolumeLevelWithParams:(id)a3;
- (id)readAttributeMinViewportWithParams:(id)a3;
- (id)readAttributeNightVisionCapableWithParams:(id)a3;
- (id)readAttributeNightVisionIllumWithParams:(id)a3;
- (id)readAttributeNightVisionWithParams:(id)a3;
- (id)readAttributeRankedVideoStreamPrioritiesListWithParams:(id)a3;
- (id)readAttributeRateDistortionTradeOffPointsWithParams:(id)a3;
- (id)readAttributeSoftLivestreamPrivacyModeEnabledWithParams:(id)a3;
- (id)readAttributeSoftRecordingPrivacyModeEnabledWithParams:(id)a3;
- (id)readAttributeSpeakerCapabilitiesWithParams:(id)a3;
- (id)readAttributeSpeakerMaxLevelWithParams:(id)a3;
- (id)readAttributeSpeakerMinLevelWithParams:(id)a3;
- (id)readAttributeSpeakerMutedWithParams:(id)a3;
- (id)readAttributeSpeakerVolumeLevelWithParams:(id)a3;
- (id)readAttributeStatusLightBrightnessWithParams:(id)a3;
- (id)readAttributeStatusLightEnabledWithParams:(id)a3;
- (id)readAttributeSupportedSnapshotParamsWithParams:(id)a3;
- (id)readAttributeTwoWayTalkSupportWithParams:(id)a3;
- (id)readAttributeVideoSensorParamsWithParams:(id)a3;
- (id)readAttributeViewportWithParams:(id)a3;
- (void)audioStreamAllocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)audioStreamDeallocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)captureSnapshotWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setImageFlipHorizontalWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setImageFlipVerticalWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setImageRotationWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setStreamPrioritiesWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setViewportWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)snapshotStreamAllocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)snapshotStreamDeallocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)videoStreamAllocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)videoStreamDeallocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)videoStreamModifyWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)writeAttributeAWBEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeAWBEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeAutoISOEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeAutoISOEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeAutoShutterSpeedEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeAutoShutterSpeedEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeDepthSensorStatusWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeDepthSensorStatusWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeHDRModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeHDRModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeLocalSnapshotRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeLocalSnapshotRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeLocalVideoRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeLocalVideoRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeMicrophoneAGCEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeMicrophoneAGCEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeMicrophoneMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeMicrophoneMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeMicrophoneMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeMicrophoneMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeMicrophoneMutedWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeMicrophoneMutedWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeMicrophoneVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeMicrophoneVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeNightVisionIllumWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeNightVisionIllumWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeNightVisionWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeNightVisionWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeRankedVideoStreamPrioritiesListWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeRankedVideoStreamPrioritiesListWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeSoftLivestreamPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeSoftLivestreamPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeSoftRecordingPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeSoftRecordingPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeSpeakerMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeSpeakerMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeSpeakerMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeSpeakerMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeSpeakerMutedWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeSpeakerMutedWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeSpeakerVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeSpeakerVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeStatusLightBrightnessWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeStatusLightBrightnessWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeStatusLightEnabledWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeStatusLightEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
@end

@implementation MTRClusterCameraAVStreamManagement

- (void)audioStreamAllocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterAudioStreamAllocateParams *)a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterAudioStreamAllocateParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C6192C;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  v14 = (void *)MEMORY[0x2456969D0](v34);
  v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v20 = objc_msgSend_device(self, v18, v19);
  v23 = objc_msgSend_endpointID(self, v21, v22);
  v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CD150, &unk_26F9CB500, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)audioStreamDeallocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterAudioStreamDeallocateParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterAudioStreamDeallocateParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C61B48;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CB5A8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)videoStreamAllocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterVideoStreamAllocateParams *)a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoStreamAllocateParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C61D80;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CD150, &unk_26F9CB5C0, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)videoStreamModifyWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterVideoStreamModifyParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoStreamModifyParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C61F9C;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CB5F0, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)videoStreamDeallocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterVideoStreamDeallocateParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoStreamDeallocateParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C621BC;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CB6F8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)snapshotStreamAllocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams *)a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C623F4;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CD150, &unk_26F9CB710, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)snapshotStreamDeallocateWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSnapshotStreamDeallocateParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSnapshotStreamDeallocateParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C62610;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CB8A8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setStreamPrioritiesWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSetStreamPrioritiesParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSetStreamPrioritiesParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C62830;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CB8C0, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)captureSnapshotWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterCaptureSnapshotParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterCaptureSnapshotParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C62A50;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CB8D8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setViewportWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSetViewportParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSetViewportParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C62C70;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CC5F8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setImageRotationWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSetImageRotationParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSetImageRotationParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C62E90;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CC610, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setImageFlipHorizontalWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSetImageFlipHorizontalParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSetImageFlipHorizontalParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C630B0;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CC628, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)setImageFlipVerticalWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRCameraAVStreamManagementClusterSetImageFlipVerticalParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRCameraAVStreamManagementClusterSetImageFlipVerticalParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C632D0;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CD150, &unk_26F9CC640, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (id)readAttributeMaxConcurrentVideoEncodersWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB440, v4);

  return v12;
}

- (id)readAttributeMaxEncodedPixelRateWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB548, v4);

  return v12;
}

- (id)readAttributeVideoSensorParamsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB758, v4);

  return v12;
}

- (id)readAttributeNightVisionCapableWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB530, v4);

  return v12;
}

- (id)readAttributeMinViewportWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB608, v4);

  return v12;
}

- (id)readAttributeRateDistortionTradeOffPointsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB770, v4);

  return v12;
}

- (id)readAttributeMaxPreRollBufferSizeWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB668, v4);

  return v12;
}

- (id)readAttributeMicrophoneCapabilitiesWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB950, v4);

  return v12;
}

- (id)readAttributeSpeakerCapabilitiesWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB740, v4);

  return v12;
}

- (id)readAttributeTwoWayTalkSupportWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB968, v4);

  return v12;
}

- (id)readAttributeSupportedSnapshotParamsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB980, v4);

  return v12;
}

- (id)readAttributeMaxNetworkBandwidthWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB998, v4);

  return v12;
}

- (id)readAttributeCurrentFrameRateWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB9B0, v4);

  return v12;
}

- (id)readAttributeHDRModeEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB9C8, v4);

  return v12;
}

- (void)writeAttributeHDRModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeHDRModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB9C8, v19, v8, v11);
}

- (id)readAttributeCurrentVideoCodecsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB9E0, v4);

  return v12;
}

- (id)readAttributeCurrentSnapshotConfigWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB788, v4);

  return v12;
}

- (id)readAttributeFabricsUsingCameraWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB7A0, v4);

  return v12;
}

- (id)readAttributeAllocatedVideoStreamsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB7B8, v4);

  return v12;
}

- (id)readAttributeAllocatedAudioStreamsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB7D0, v4);

  return v12;
}

- (id)readAttributeAllocatedSnapshotStreamsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB7E8, v4);

  return v12;
}

- (id)readAttributeRankedVideoStreamPrioritiesListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB800, v4);

  return v12;
}

- (void)writeAttributeRankedVideoStreamPrioritiesListWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeRankedVideoStreamPrioritiesListWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB800, v19, v8, v11);
}

- (id)readAttributeSoftRecordingPrivacyModeEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB9F8, v4);

  return v12;
}

- (void)writeAttributeSoftRecordingPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeSoftRecordingPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB9F8, v19, v8, v11);
}

- (id)readAttributeSoftLivestreamPrivacyModeEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBA10, v4);

  return v12;
}

- (void)writeAttributeSoftLivestreamPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeSoftLivestreamPrivacyModeEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBA10, v19, v8, v11);
}

- (id)readAttributeHardPrivacyModeOnWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBB00, v4);

  return v12;
}

- (id)readAttributeNightVisionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBB18, v4);

  return v12;
}

- (void)writeAttributeNightVisionWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeNightVisionWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBB18, v19, v8, v11);
}

- (id)readAttributeNightVisionIllumWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBB30, v4);

  return v12;
}

- (void)writeAttributeNightVisionIllumWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeNightVisionIllumWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBB30, v19, v8, v11);
}

- (id)readAttributeAWBEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBB48, v4);

  return v12;
}

- (void)writeAttributeAWBEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeAWBEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBB48, v19, v8, v11);
}

- (id)readAttributeAutoShutterSpeedEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBB60, v4);

  return v12;
}

- (void)writeAttributeAutoShutterSpeedEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeAutoShutterSpeedEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBB60, v19, v8, v11);
}

- (id)readAttributeAutoISOEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB818, v4);

  return v12;
}

- (void)writeAttributeAutoISOEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeAutoISOEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB818, v19, v8, v11);
}

- (id)readAttributeViewportWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB830, v4);

  return v12;
}

- (id)readAttributeSpeakerMutedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB848, v4);

  return v12;
}

- (void)writeAttributeSpeakerMutedWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeSpeakerMutedWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB848, v19, v8, v11);
}

- (id)readAttributeSpeakerVolumeLevelWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB878, v4);

  return v12;
}

- (void)writeAttributeSpeakerVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeSpeakerVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB878, v19, v8, v11);
}

- (id)readAttributeSpeakerMaxLevelWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBC98, v4);

  return v12;
}

- (void)writeAttributeSpeakerMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeSpeakerMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBC98, v19, v8, v11);
}

- (id)readAttributeSpeakerMinLevelWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBCB0, v4);

  return v12;
}

- (void)writeAttributeSpeakerMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeSpeakerMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBCB0, v19, v8, v11);
}

- (id)readAttributeMicrophoneMutedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBCC8, v4);

  return v12;
}

- (void)writeAttributeMicrophoneMutedWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeMicrophoneMutedWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBCC8, v19, v8, v11);
}

- (id)readAttributeMicrophoneVolumeLevelWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBCE0, v4);

  return v12;
}

- (void)writeAttributeMicrophoneVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeMicrophoneVolumeLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBCE0, v19, v8, v11);
}

- (id)readAttributeMicrophoneMaxLevelWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBCF8, v4);

  return v12;
}

- (void)writeAttributeMicrophoneMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeMicrophoneMaxLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBCF8, v19, v8, v11);
}

- (id)readAttributeMicrophoneMinLevelWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB8F0, v4);

  return v12;
}

- (void)writeAttributeMicrophoneMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeMicrophoneMinLevelWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CB8F0, v19, v8, v11);
}

- (id)readAttributeMicrophoneAGCEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBD10, v4);

  return v12;
}

- (void)writeAttributeMicrophoneAGCEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeMicrophoneAGCEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBD10, v19, v8, v11);
}

- (id)readAttributeImageRotationWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBD28, v4);

  return v12;
}

- (id)readAttributeImageFlipHorizontalWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB938, v4);

  return v12;
}

- (id)readAttributeImageFlipVerticalWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBA40, v4);

  return v12;
}

- (id)readAttributeLocalVideoRecordingEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBA70, v4);

  return v12;
}

- (void)writeAttributeLocalVideoRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeLocalVideoRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBA70, v19, v8, v11);
}

- (id)readAttributeLocalSnapshotRecordingEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBA88, v4);

  return v12;
}

- (void)writeAttributeLocalSnapshotRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeLocalSnapshotRecordingEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBA88, v19, v8, v11);
}

- (id)readAttributeStatusLightEnabledWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBAA0, v4);

  return v12;
}

- (void)writeAttributeStatusLightEnabledWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeStatusLightEnabledWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBAA0, v19, v8, v11);
}

- (id)readAttributeStatusLightBrightnessWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBAB8, v4);

  return v12;
}

- (void)writeAttributeStatusLightBrightnessWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeStatusLightBrightnessWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBAB8, v19, v8, v11);
}

- (id)readAttributeDepthSensorStatusWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CBAD0, v4);

  return v12;
}

- (void)writeAttributeDepthSensorStatusWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeDepthSensorStatusWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD168, &unk_26F9CBAD0, v19, v8, v11);
}

- (id)readAttributeGeneratedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB458, v4);

  return v12;
}

- (id)readAttributeAcceptedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB470, v4);

  return v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB560, v4);

  return v12;
}

- (id)readAttributeAttributeListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB488, v4);

  return v12;
}

- (id)readAttributeFeatureMapWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB4A0, v4);

  return v12;
}

- (id)readAttributeClusterRevisionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD168, &unk_26F9CB4B8, v4);

  return v12;
}

@end