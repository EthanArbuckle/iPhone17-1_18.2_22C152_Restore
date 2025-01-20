@interface VideoConference(VideoProcessing)
@end

@implementation VideoConference(VideoProcessing)

- (void)onVideoFrame:()VideoProcessing frameTime:attribute:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d VideoConference: onCaptureFrame failed to acquire rdlock, FRAME SKIPPED", v2, v3, v4, v5, v6);
}

- (void)avConferencePreviewError:()VideoProcessing .cold.1()
{
  OUTLINED_FUNCTION_11_0();
  if (v0) {
    objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VideoConference [%s] %s:%d VideoConference: received error from camera: %s", v3, v4, v5, v6, 2u);
}

- (void)avConferenceScreenCaptureError:()VideoProcessing .cold.1()
{
  OUTLINED_FUNCTION_11_0();
  if (v0) {
    objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VideoConference [%s] %s:%d VideoConference: received error from Screen Capture: %s", v3, v4, v5, v6, 2u);
}

- (void)avConferenceScreenCaptureError:()VideoProcessing .cold.2()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  int v3 = 136315906;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_9();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VideoConference [%s] %s:%d VideoConference: received error from Screen Capture: %s", (uint8_t *)&v3, 0x26u);
}

@end