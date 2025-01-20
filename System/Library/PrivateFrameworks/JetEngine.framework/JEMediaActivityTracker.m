@interface JEMediaActivityTracker
+ (id)playlistItemComparator;
- (BOOL)shouldGenerateTransitions;
- (JEMediaActivity)playActivity;
- (JEMediaActivity)seekActivity;
- (JEMediaActivityTracker)initWithPipeline:(id)a3 playlist:(id)a4 eventData:(id)a5 topic:(id)a6;
- (JEMediaPlaylist)playlist;
- (JEMediaTimeTracker)timeTracker;
- (NSMutableArray)eventData;
- (NSObject)pipeline;
- (NSString)topic;
- (id)combineEventData:(id)a3 withPlaylistDataForItem:(id)a4;
- (id)startActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7 transitioningEventData:(id)a8;
- (void)generatePlaylistTransitionsIfNecessary:(unint64_t)a3;
- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playTransitionedAtOverallPosition:(unint64_t)a3 eventData:(id)a4;
- (void)resetEventData:(id)a3;
- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)setEventData:(id)a3;
- (void)setPipeline:(id)a3;
- (void)setPlayActivity:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setSeekActivity:(id)a3;
- (void)setShouldGenerateTransitions:(BOOL)a3;
- (void)setTimeTracker:(id)a3;
- (void)setTopic:(id)a3;
- (void)stopActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7 transitioningEventData:(id)a8;
- (void)synchronizeAtOverallPosition:(unint64_t)a3;
- (void)synchronizePlaybackRate:(float)a3 overallPosition:(unint64_t)a4;
- (void)updateEventData:(id)a3;
@end

@implementation JEMediaActivityTracker

- (JEMediaActivityTracker)initWithPipeline:(id)a3 playlist:(id)a4 eventData:(id)a5 topic:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)JEMediaActivityTracker;
  v14 = [(JEMediaActivityTracker *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(JEMediaActivityTracker *)v14 setTopic:v13];
    [(JEMediaActivityTracker *)v15 setPipeline:v10];
    [(JEMediaActivityTracker *)v15 setPlaylist:v11];
    v16 = (void *)[v12 mutableCopy];
    [(JEMediaActivityTracker *)v15 setEventData:v16];

    [(JEMediaActivityTracker *)v15 setShouldGenerateTransitions:1];
  }

  return v15;
}

- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v10 = [(JEMediaActivityTracker *)self startActivity:0 overallPosition:a4 type:a5 reason:a6 eventData:a7 transitioningEventData:0];
  if ([(JEMediaActivityTracker *)self shouldGenerateTransitions])
  {
    id v11 = [JEMediaTimeTracker alloc];
    *(float *)&double v12 = a3;
    id v13 = [(JEMediaTimeTracker *)v11 initWithPosition:a4 playbackRate:v12];
    [(JEMediaActivityTracker *)self setTimeTracker:v13];
  }
}

- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  LODWORD(v6) = 1.0;
  [(JEMediaActivityTracker *)self playStartedWithPlaybackRate:a3 overallPosition:a4 type:a5 reason:a6 eventData:v6];
}

- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(JEMediaActivityTracker *)self generatePlaylistTransitionsIfNecessary:a3];
  [(JEMediaActivityTracker *)self stopActivity:0 overallPosition:a3 type:v12 reason:v11 eventData:v10 transitioningEventData:0];

  [(JEMediaActivityTracker *)self setTimeTracker:0];
}

- (void)playTransitionedAtOverallPosition:(unint64_t)a3 eventData:(id)a4
{
  id v7 = a4;
  [(JEMediaActivityTracker *)self stopActivity:0 overallPosition:a3 type:@"automatic" reason:@"transition" eventData:v7 transitioningEventData:0];
  id v6 = [(JEMediaActivityTracker *)self startActivity:0 overallPosition:a3 type:@"automatic" reason:@"transition" eventData:v7 transitioningEventData:0];
}

- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v6 = [(JEMediaActivityTracker *)self startActivity:1 overallPosition:a3 type:a4 reason:a5 eventData:a6 transitioningEventData:0];
}

- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
}

- (void)synchronizePlaybackRate:(float)a3 overallPosition:(unint64_t)a4
{
  id v7 = [(JEMediaActivityTracker *)self playActivity];
  v8 = v7;
  if (v7 && ![v7 type])
  {
    BOOL v9 = a3 <= 0.0;
    int v12 = [v8 isStopped];
    if ((v12 & 1) == 0 && a3 > 0.0)
    {
      [(JEMediaActivityTracker *)self generatePlaylistTransitionsIfNecessary:a4];
      id v13 = [(JEMediaActivityTracker *)self timeTracker];
      *(float *)&double v14 = a3;
      [v13 updatePosition:a4 playbackRate:v14];

      goto LABEL_9;
    }
    if (a3 > 0.0) {
      char v15 = 1;
    }
    else {
      char v15 = v12;
    }
    if ((v15 & 1) == 0)
    {
      id v10 = JEMetricsOSLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      __int16 v17 = 0;
      id v11 = (uint8_t *)&v17;
      goto LABEL_7;
    }
    if ((v12 ^ 1)) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v9 = a3 <= 0.0;
  }
  if (!v9)
  {
    id v10 = JEMetricsOSLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    __int16 v16 = 0;
    id v11 = (uint8_t *)&v16;
LABEL_7:
    _os_log_impl(&dword_19EE14000, v10, OS_LOG_TYPE_ERROR, "JetEngine: Inconsistent state: did you forget to call playStopped?", v11, 2u);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)synchronizeAtOverallPosition:(unint64_t)a3
{
  id v5 = [(JEMediaActivityTracker *)self timeTracker];
  [v5 playbackRate];
  -[JEMediaActivityTracker synchronizePlaybackRate:overallPosition:](self, "synchronizePlaybackRate:overallPosition:", a3);
}

- (void)updateEventData:(id)a3
{
  id v4 = a3;
  id v5 = [(JEMediaActivityTracker *)self eventData];
  [v5 addObjectsFromArray:v4];
}

- (void)resetEventData:(id)a3
{
  if (a3)
  {
    id v4 = (NSMutableArray *)[a3 mutableCopy];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
  }
  self->_eventData = v4;
  MEMORY[0x1F41817F8]();
}

- (NSMutableArray)eventData
{
  eventData = self->_eventData;
  if (!eventData)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_eventData;
    self->_eventData = v4;

    eventData = self->_eventData;
  }
  return eventData;
}

- (id)combineEventData:(id)a3 withPlaylistDataForItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  BOOL v9 = [(JEMediaActivityTracker *)self playlist];
  if (objc_opt_respondsToSelector())
  {
    id v10 = [(JEMediaActivityTracker *)self playlist];
    id v11 = [v10 eventData];
  }
  else
  {
    id v11 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v12 = 0;
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v12 = [v7 eventData];
  if (v11) {
LABEL_8:
  }
    [v8 addObjectsFromArray:v11];
LABEL_9:
  if (v12) {
    [v8 addObjectsFromArray:v12];
  }
  id v13 = [(JEMediaActivityTracker *)self eventData];
  [v8 addObjectsFromArray:v13];

  if (v6) {
    [v8 addObjectsFromArray:v6];
  }
  double v14 = (void *)[v8 copy];

  return v14;
}

- (id)startActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7 transitioningEventData:(id)a8
{
  id v25 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  __int16 v17 = [(JEMediaActivityTracker *)self playlist];
  objc_super v18 = [v17 itemAtOverallPosition:a4 rangeOptions:1];

  v19 = [JEMediaActivity alloc];
  v20 = [(JEMediaActivityTracker *)self pipeline];
  v21 = [(JEMediaActivityTracker *)self topic];
  v22 = [(JEMediaActivity *)v19 initWithType:a3 playlistItem:v18 pipeline:v20 topic:v21];

  v23 = [(JEMediaActivityTracker *)self combineEventData:v14 withPlaylistDataForItem:v18];

  [(JEMediaActivity *)v22 startedAtOverallPosition:a4 type:v16 reason:v15 eventData:v23 transitioningEventData:v25];
  if (a3 == 1)
  {
    [(JEMediaActivityTracker *)self setSeekActivity:v22];
  }
  else if (!a3)
  {
    [(JEMediaActivityTracker *)self setPlayActivity:v22];
  }

  return v22;
}

- (void)stopActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7 transitioningEventData:(id)a8
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a3 == 1)
  {
    objc_super v18 = [(JEMediaActivityTracker *)self seekActivity];
    [(JEMediaActivityTracker *)self setSeekActivity:0];
    v19 = [(JEMediaActivityTracker *)self playlist];
    v20 = [v19 itemAtOverallPosition:a4 rangeOptions:2];
    [v18 setPlaylistItem:v20];

    if (!v18) {
      goto LABEL_9;
    }
  }
  else
  {
    if (a3)
    {
      objc_super v18 = 0;
      goto LABEL_9;
    }
    objc_super v18 = [(JEMediaActivityTracker *)self playActivity];
    [(JEMediaActivityTracker *)self setPlayActivity:0];
    if (!v18) {
      goto LABEL_9;
    }
  }
  if (![v18 isStopped])
  {
    v21 = [v18 playlistItem];
    v22 = [(JEMediaActivityTracker *)self combineEventData:v16 withPlaylistDataForItem:v21];
    [v18 stoppedAtOverallPosition:a4 type:v14 reason:v15 eventData:v22 transitioningEventData:v17];

    goto LABEL_12;
  }
LABEL_9:
  v23 = JEMetricsOSLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v24 = 134217984;
    int64_t v25 = a3;
    _os_log_impl(&dword_19EE14000, v23, OS_LOG_TYPE_ERROR, "JetEngine: There is no %ld activity to stop.", (uint8_t *)&v24, 0xCu);
  }

LABEL_12:
}

- (void)generatePlaylistTransitionsIfNecessary:(unint64_t)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if ([(JEMediaActivityTracker *)self shouldGenerateTransitions])
  {
    id v5 = [(JEMediaActivityTracker *)self playActivity];
    id v6 = v5;
    if (v5 && ![v5 type] && (objc_msgSend(v6, "isStopped") & 1) == 0)
    {
      v27 = [v6 eventDataForTransitioningEvents];
      id v7 = [(JEMediaActivityTracker *)self playlist];
      uint64_t v8 = [v6 playlistItem];
      BOOL v9 = objc_msgSend(v7, "itemsBetweenStartOverallPosition:endOverallPosition:", objc_msgSend((id)v8, "startOverallPosition"), a3);

      id v10 = [(JEMediaActivityTracker *)self playlist];
      objc_opt_class();
      LOBYTE(v8) = objc_opt_isKindOfClass();

      if ((v8 & 1) == 0)
      {
        id v11 = +[JEMediaActivityTracker playlistItemComparator];
        uint64_t v12 = [v9 sortedArrayUsingComparator:v11];

        BOOL v9 = (void *)v12;
      }
      if ((unint64_t)[v9 count] >= 2)
      {
        unint64_t v13 = 1;
        uint64_t v26 = v9;
        do
        {
          id v14 = [v9 objectAtIndexedSubscript:v13];
          unint64_t v15 = [v14 startOverallPosition];
          id v16 = [v6 playlistItem];
          unint64_t v17 = [v16 startOverallPosition];

          if (v15 > v17)
          {
            if (v15 >= a3)
            {

              break;
            }
            objc_super v18 = [(JEMediaActivityTracker *)self timeTracker];
            v28 = [v18 estimatedTimeAtPosition:v15];

            v19 = (void *)MEMORY[0x1E4F28ED0];
            [v28 timeIntervalSince1970];
            v21 = [v19 numberWithLongLong:(uint64_t)(v20 * 1000.0)];
            v29 = @"eventTime";
            v30 = v21;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
            v31[0] = v22;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
            int v24 = v23 = a3;

            [(JEMediaActivityTracker *)self stopActivity:0 overallPosition:v15 type:@"automatic" reason:@"transition" eventData:v24 transitioningEventData:v27];
            uint64_t v25 = [(JEMediaActivityTracker *)self startActivity:0 overallPosition:v15 type:@"automatic" reason:@"transition" eventData:v24 transitioningEventData:v27];

            a3 = v23;
            BOOL v9 = v26;

            id v6 = (void *)v25;
          }

          ++v13;
        }
        while ([v9 count] > v13);
      }
    }
  }
}

+ (id)playlistItemComparator
{
  return &__block_literal_global_2;
}

uint64_t __48__JEMediaActivityTracker_playlistItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 startOverallPosition];
  unint64_t v6 = [v4 startOverallPosition];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (BOOL)shouldGenerateTransitions
{
  return self->_shouldGenerateTransitions;
}

- (void)setShouldGenerateTransitions:(BOOL)a3
{
  self->_shouldGenerateTransitions = a3;
}

- (NSObject)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
}

- (JEMediaPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (JEMediaActivity)playActivity
{
  return self->_playActivity;
}

- (void)setPlayActivity:(id)a3
{
}

- (JEMediaActivity)seekActivity
{
  return self->_seekActivity;
}

- (void)setSeekActivity:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (void)setEventData:(id)a3
{
}

- (JEMediaTimeTracker)timeTracker
{
  return self->_timeTracker;
}

- (void)setTimeTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTracker, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_seekActivity, 0);
  objc_storeStrong((id *)&self->_playActivity, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end