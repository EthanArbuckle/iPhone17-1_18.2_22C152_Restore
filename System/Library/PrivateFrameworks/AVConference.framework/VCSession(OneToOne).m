@interface VCSession(OneToOne)
- (void)multiwayToOneToOneSwitchConfigure;
- (void)setIsOneToOneRemoteMediaStalling:()OneToOne;
- (void)setupOneToOne;
- (void)setupOneToOneMediaQueue;
- (void)setupRateControllerOneToOne;
- (void)switchFromMultiwayToOneToOne;
@end

@implementation VCSession(OneToOne)

- (void)setIsOneToOneRemoteMediaStalling:()OneToOne
{
  BOOL v3 = a3;
  v7[5] = *MEMORY[0x1E4F143B8];
  id v5 = [(NSArray *)[(VCSession *)self remoteParticipants] firstObject];
  self->_isOneToOneRemoteMediaStalling = v3;
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteMediaDidStall:streamToken:", v3, objc_msgSend(v5, "participantVideoToken"));
  if (v3)
  {
    notificationQueue = self->_notificationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__VCSession_OneToOne__setIsOneToOneRemoteMediaStalling___block_invoke;
    v7[3] = &unk_1E6DB3DC8;
    v7[4] = self;
    dispatch_async(notificationQueue, v7);
    self->_isReconnectPending = 1;
    reportingGenericEvent();
  }
}

- (void)setupOneToOne
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSession(OneToOne) setupOneToOne]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rate controller. error=%x", v2, *(const char **)v3, (unint64_t)"-[VCSession(OneToOne) setupOneToOne]" >> 16, v4);
}

- (void)setupOneToOneMediaQueue
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the media queue. error=%x", v2, *(const char **)v3, (unint64_t)"-[VCSession(OneToOne) setupOneToOneMediaQueue]" >> 16, v4);
}

- (void)newNegotiatorForOneToOneWithRemoteParticipant:()OneToOne .cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  BOOL v3 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
  OUTLINED_FUNCTION_3();
  int v4 = 109;
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to negotiate oneToOne data with participant=%p", v2, 0x26u);
}

- (void)newNegotiatorForOneToOneWithRemoteParticipant:()OneToOne .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to copy the local configuration", v2, v3, v4, v5, v6);
}

- (void)newNegotiatorForOneToOneWithRemoteParticipant:()OneToOne .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reinitialize the 1:1 media negotiator", v2, v3, v4, v5, v6);
}

- (void)newNegotiatorForOneToOneWithRemoteParticipant:()OneToOne .cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract media blob from remote participant info", v2, v3, v4, v5, v6);
}

- (void)newNegotiatorForOneToOneWithRemoteParticipant:()OneToOne .cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate one to one settings with remote media blob", v2, v3, v4, v5, v6);
}

- (void)setOneToOneConfigOnRemoteParticipant:()OneToOne .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d OneToOne config was nil", v2, v3, v4, v5, v6);
}

- (void)setupRateControllerOneToOne
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 1:1 rate controller already configured", v2, v3, v4, v5, v6);
}

- (void)configureLocalParticipantWithOneToOneRemoteParticipant:()OneToOne isInitialConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate local 1:1 config!", v2, v3, v4, v5, v6);
}

- (void)configureLocalParticipantWithOneToOneRemoteParticipant:()OneToOne isInitialConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure local participant for 1:1!", v2, v3, v4, v5, v6);
}

- (void)setupOneToOneMediaControlInfoGeneratorsWithVersion:()OneToOne oneToOneConfig:videoEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate 1:1 audio media control info generator", v2, v3, v4, v5, v6);
}

- (void)setupOneToOneMediaControlInfoGeneratorsWithVersion:()OneToOne oneToOneConfig:videoEnabled:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate 1:1 video media control info generator", v2, v3, v4, v5, v6);
}

- (void)newParticipantOneToOneConfigWithIDSParticipantID:()OneToOne isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate one to one participant configuration", v2, v3, v4, v5, v6);
}

- (void)newParticipantOneToOneConfigWithIDSParticipantID:()OneToOne isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the OneToOne MCIG", v2, v3, v4, v5, v6);
}

- (void)configureRemoteParticipantForOneToOne:()OneToOne .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate local 1:1 config!", v2, v3, v4, v5, v6);
}

- (void)configureRemoteParticipantForOneToOne:()OneToOne .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure remote participant for 1:1!", v2, v3, v4, v5, v6);
}

- (void)multiwayToOneToOneSwitchConfigure
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate with devices that do not support one to one mode", v2, v3, v4, v5, v6);
}

- (void)switchFromMultiwayToOneToOne
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reconfigure session for switch to OneToOne", v2, v3, v4, v5, v6);
}

- (void)negotiateOneToOneWithRemoteParticipant:()OneToOne .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate one to one settings!", v2, v3, v4, v5, v6);
}

- (void)addOneToOneParticipant:()OneToOne .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the remote participant in OneToOneMode", v2, v3, v4, v5, v6);
}

- (void)addOneToOneParticipant:()OneToOne .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure the remoteParticipant for OneToOne", v2, v3, v4, v5, v6);
}

- (void)addOneToOneParticipant:()OneToOne .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate with the remoteParticipant", v2, v3, v4, v5, v6);
}

- (void)addOneToOneParticipant:()OneToOne .cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Trying to add a oneToOne participant even though we do not support OneToOne mode", v2, v3, v4, v5, v6);
}

- (void)dispatchedSetOneToOneModeEnabled:()OneToOne isLocal:configurationDict:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  __int16 v4 = v0;
  int v5 = 1;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to send the oneToOneEnabledState message oneToOneEnabled=%d isLocal=%d", v2, 0x28u);
}

@end