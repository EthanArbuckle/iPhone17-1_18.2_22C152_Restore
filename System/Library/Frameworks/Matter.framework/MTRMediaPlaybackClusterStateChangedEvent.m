@interface MTRMediaPlaybackClusterStateChangedEvent
- (MTRMediaPlaybackClusterPlaybackPositionStruct)sampledPosition;
- (MTRMediaPlaybackClusterStateChangedEvent)init;
- (NSData)data;
- (NSNumber)audioAdvanceUnmuted;
- (NSNumber)currentState;
- (NSNumber)duration;
- (NSNumber)playbackSpeed;
- (NSNumber)seekRangeEnd;
- (NSNumber)seekRangeStart;
- (NSNumber)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioAdvanceUnmuted:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setData:(id)a3;
- (void)setDuration:(id)a3;
- (void)setPlaybackSpeed:(id)a3;
- (void)setSampledPosition:(id)a3;
- (void)setSeekRangeEnd:(id)a3;
- (void)setSeekRangeStart:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation MTRMediaPlaybackClusterStateChangedEvent

- (MTRMediaPlaybackClusterStateChangedEvent)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRMediaPlaybackClusterStateChangedEvent;
  v2 = [(MTRMediaPlaybackClusterStateChangedEvent *)&v15 init];
  v3 = v2;
  if (v2)
  {
    currentState = v2->_currentState;
    v2->_currentState = (NSNumber *)&unk_26F9C8620;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_26F9C8620;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_opt_new();
    sampledPosition = v3->_sampledPosition;
    v3->_sampledPosition = (MTRMediaPlaybackClusterPlaybackPositionStruct *)v7;

    playbackSpeed = v3->_playbackSpeed;
    v3->_playbackSpeed = (NSNumber *)&unk_26F9C8620;

    seekRangeEnd = v3->_seekRangeEnd;
    v3->_seekRangeEnd = (NSNumber *)&unk_26F9C8620;

    seekRangeStart = v3->_seekRangeStart;
    v3->_seekRangeStart = (NSNumber *)&unk_26F9C8620;

    data = v3->_data;
    v3->_data = 0;

    audioAdvanceUnmuted = v3->_audioAdvanceUnmuted;
    v3->_audioAdvanceUnmuted = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMediaPlaybackClusterStateChangedEvent);
  uint64_t v7 = objc_msgSend_currentState(self, v5, v6);
  objc_msgSend_setCurrentState_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_startTime(self, v9, v10);
  objc_msgSend_setStartTime_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_duration(self, v13, v14);
  objc_msgSend_setDuration_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_sampledPosition(self, v17, v18);
  objc_msgSend_setSampledPosition_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_playbackSpeed(self, v21, v22);
  objc_msgSend_setPlaybackSpeed_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_seekRangeEnd(self, v25, v26);
  objc_msgSend_setSeekRangeEnd_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_seekRangeStart(self, v29, v30);
  objc_msgSend_setSeekRangeStart_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_data(self, v33, v34);
  objc_msgSend_setData_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_audioAdvanceUnmuted(self, v37, v38);
  objc_msgSend_setAudioAdvanceUnmuted_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v17 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  currentState = self->_currentState;
  startTime = self->_startTime;
  duration = self->_duration;
  sampledPosition = self->_sampledPosition;
  playbackSpeed = self->_playbackSpeed;
  seekRangeEnd = self->_seekRangeEnd;
  seekRangeStart = self->_seekRangeStart;
  v13 = objc_msgSend_base64EncodedStringWithOptions_(self->_data, v12, 0);
  objc_msgSend_stringWithFormat_(v17, v14, @"<%@: currentState:%@; startTime:%@; duration:%@; sampledPosition:%@; playbackSpeed:%@; seekRangeEnd:%@; seekRangeStart:%@; data:%@; audioAdvanceUnmuted:%@; >",
    v4,
    currentState,
    startTime,
    duration,
    sampledPosition,
    playbackSpeed,
    seekRangeEnd,
    seekRangeStart,
    v13,
  objc_super v15 = self->_audioAdvanceUnmuted);

  return v15;
}

- (NSNumber)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (MTRMediaPlaybackClusterPlaybackPositionStruct)sampledPosition
{
  return self->_sampledPosition;
}

- (void)setSampledPosition:(id)a3
{
}

- (NSNumber)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(id)a3
{
}

- (NSNumber)seekRangeEnd
{
  return self->_seekRangeEnd;
}

- (void)setSeekRangeEnd:(id)a3
{
}

- (NSNumber)seekRangeStart
{
  return self->_seekRangeStart;
}

- (void)setSeekRangeStart:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSNumber)audioAdvanceUnmuted
{
  return self->_audioAdvanceUnmuted;
}

- (void)setAudioAdvanceUnmuted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAdvanceUnmuted, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_seekRangeStart, 0);
  objc_storeStrong((id *)&self->_seekRangeEnd, 0);
  objc_storeStrong((id *)&self->_playbackSpeed, 0);
  objc_storeStrong((id *)&self->_sampledPosition, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_currentState, 0);
}

@end