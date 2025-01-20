@interface VCCALayerHost
- (VCCALayerHost)initWithRemoteVideoClient:(id)a3;
- (void)layoutSublayers;
@end

@implementation VCCALayerHost

- (VCCALayerHost)initWithRemoteVideoClient:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCCALayerHost;
  result = [(CALayerHost *)&v5 init];
  if (result) {
    result->remoteVideoClient = (AVCRemoteVideoClient *)a3;
  }
  return result;
}

- (void)layoutSublayers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid AVCRemoteVideoClient instance for the host layer", v2, v3, v4, v5, v6);
}

@end