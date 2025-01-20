@interface VCRemoteVideoState
- (BOOL)hasReceivedFirstFrame;
- (BOOL)isLocalNetworkDegraded;
- (BOOL)isMediaStalled;
- (BOOL)isNetworkDegraded;
- (BOOL)isVideoDegraded;
- (BOOL)isVideoPaused;
- (BOOL)isVideoSuspended;
- (NSString)localInterfaceType;
- (NSString)remoteInterfaceType;
- (VideoAttributes)remoteScreenAttributes;
- (VideoAttributes)remoteVideoAttributes;
- (id)description;
- (void)dealloc;
- (void)setHasReceivedFirstFrame:(BOOL)a3;
- (void)setIsLocalNetworkDegraded:(BOOL)a3;
- (void)setIsMediaStalled:(BOOL)a3;
- (void)setIsNetworkDegraded:(BOOL)a3;
- (void)setIsVideoDegraded:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setIsVideoSuspended:(BOOL)a3;
- (void)setLocalInterfaceType:(id)a3;
- (void)setRemoteInterfaceType:(id)a3;
- (void)setRemoteScreenAttributes:(id)a3;
- (void)setRemoteVideoAttributes:(id)a3;
@end

@implementation VCRemoteVideoState

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCRemoteVideoState;
  [(VCRemoteVideoState *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"hasReceivedFirstFrame=%d isVideoPaused=%d isMediaStalled=%d isVideoDegraded=%d isVideoSuspended=%d isNetworkDegraded=%d isLocalNetworkDegraded=%d localInterfaceType=%@ remoteInterfaceType=%@", self->_hasReceivedFirstFrame, self->_isVideoPaused, self->_isMediaStalled, self->_isVideoDegraded, self->_isVideoSuspended, self->_isNetworkDegraded, self->_isLocalNetworkDegraded, self->_localInterfaceType, self->_remoteInterfaceType];
}

- (BOOL)hasReceivedFirstFrame
{
  return self->_hasReceivedFirstFrame;
}

- (void)setHasReceivedFirstFrame:(BOOL)a3
{
  self->_hasReceivedFirstFrame = a3;
}

- (BOOL)isVideoDegraded
{
  return self->_isVideoDegraded;
}

- (void)setIsVideoDegraded:(BOOL)a3
{
  self->_isVideoDegraded = a3;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (BOOL)isMediaStalled
{
  return self->_isMediaStalled;
}

- (void)setIsMediaStalled:(BOOL)a3
{
  self->_isMediaStalled = a3;
}

- (VideoAttributes)remoteScreenAttributes
{
  return (VideoAttributes *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteScreenAttributes:(id)a3
{
}

- (VideoAttributes)remoteVideoAttributes
{
  return (VideoAttributes *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoteVideoAttributes:(id)a3
{
}

- (NSString)localInterfaceType
{
  return self->_localInterfaceType;
}

- (void)setLocalInterfaceType:(id)a3
{
}

- (NSString)remoteInterfaceType
{
  return self->_remoteInterfaceType;
}

- (void)setRemoteInterfaceType:(id)a3
{
}

- (BOOL)isVideoSuspended
{
  return self->_isVideoSuspended;
}

- (void)setIsVideoSuspended:(BOOL)a3
{
  self->_isVideoSuspended = a3;
}

- (BOOL)isNetworkDegraded
{
  return self->_isNetworkDegraded;
}

- (void)setIsNetworkDegraded:(BOOL)a3
{
  self->_isNetworkDegraded = a3;
}

- (BOOL)isLocalNetworkDegraded
{
  return self->_isLocalNetworkDegraded;
}

- (void)setIsLocalNetworkDegraded:(BOOL)a3
{
  self->_isLocalNetworkDegraded = a3;
}

@end