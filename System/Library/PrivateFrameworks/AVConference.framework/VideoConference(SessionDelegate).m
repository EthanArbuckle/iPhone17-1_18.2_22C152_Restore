@interface VideoConference(SessionDelegate)
@end

@implementation VideoConference(SessionDelegate)

- (void)session:()SessionDelegate didStart:connectionType:localInterfaceType:remoteInterfaceType:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  if (v0) {
    objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VideoConference [%s] %s:%d VideoConference: didStart when call is not running? session %s", v3, v4, v5, v6, 2u);
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoRelay enqueueFrame failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v5[6] = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAt"
                      "tributes:isFirstFrame:isVideoPaused:]";
  LODWORD(v6) = 3514;
  WORD2(v6) = v0;
  HIWORD(v6) = v1;
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v2, v3, "VideoConference [%s] %s:%d FigImageQueueEnqueueImage skipped [remote - %s] queue full!", v4, *(const char **)v5, (unint64_t)"-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]" >> 16, v6);
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VideoConference: no image queue/layer to draw to... This should be reported!", v2, v3, v4, v5, v6);
}

- (void)session:()SessionDelegate receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v5[6] = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAt"
                      "tributes:isFirstFrame:isVideoPaused:]";
  LODWORD(v6) = 3494;
  WORD2(v6) = v0;
  HIWORD(v6) = v1;
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v2, v3, "VideoConference [%s] %s:%d FigImageQueueEnqueueImage [remote - %s] queue", v4, *(const char **)v5, (unint64_t)"-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]" >> 16, v6);
}

- (void)session:()SessionDelegate startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d registerForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)registerForVideoFramesWithDeviceRole:()SessionDelegate captureRule:isUnpausing:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoRelay registerForVideoFrames failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)registerForVideoFramesWithDeviceRole:()SessionDelegate captureRule:isUnpausing:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer registerForVideoFramesFromSource (VCCaptureSourceCamera) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)registerForVideoFramesWithDeviceRole:()SessionDelegate captureRule:isUnpausing:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer registerForVideoFramesFromSource (VCCaptureSourceScreen) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)stopVideoSend:()SessionDelegate error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d deregisterForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)deregisterForVideoFramesWithDeviceRole:()SessionDelegate .cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoRelay deregisterForVideoFrames failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)deregisterForVideoFramesWithDeviceRole:()SessionDelegate .cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer deregisterForVideoFramesFromSource (VCCaptureSourceScreen) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)deregisterForVideoFramesWithDeviceRole:()SessionDelegate .cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VCVideoCaptureServer deregisterForVideoFramesFromSource (VCCaptureSourceCamera) failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

@end