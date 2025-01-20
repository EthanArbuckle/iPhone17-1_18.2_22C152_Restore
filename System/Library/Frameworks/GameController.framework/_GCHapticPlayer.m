@interface _GCHapticPlayer
- (BOOL)hasProcessedActiveEventsAfterTime:(double)a3;
- (BOOL)hasProcessedActiveEventsThisSlice;
- (BOOL)hasScheduledCommands;
- (BOOL)hasScheduledEventsByTime:(double)a3;
- (BOOL)isActiveAtTime:(double)a3;
- (BOOL)isMuted;
- (BOOL)isMutedForReason:(unint64_t)a3;
- (BOOL)isRetainedByClient;
- (BOOL)transientsEnqueuedSinceLastQuery;
- (NSArray)actuators;
- (NSNumber)identifier;
- (_GCHapticLogicalDevice)hapticLogicalDevice;
- (_GCHapticPlayer)initWithIdentifier:(unint64_t)a3 actuators:(id)a4 client:(id)a5;
- (double)activeLifetimeInSeconds;
- (double)totalLifetimeInSeconds;
- (float)continuousIntensity;
- (float)continuousSharpness;
- (float)hapticStrength;
- (id)bundleIdentifier;
- (id)controllerProductCategory;
- (id)description;
- (int)continuousEventsProcessed;
- (int)parameterCurvesProcessed;
- (int)totalEventsProcessed;
- (int)transientEventsProcessed;
- (void)clearParameters;
- (void)dealloc;
- (void)handleCommand:(id)a3;
- (void)processSliceForLogicalDevice:(id)a3 startTime:(double)a4 endTime:(double)a5;
- (void)scheduleCommand:(const void *)a3;
- (void)setContinuousEventsProcessed:(int)a3;
- (void)setHapticLogicalDevice:(id)a3;
- (void)setMute:(BOOL)a3 forReason:(unint64_t)a4;
- (void)setParameterCurvesProcessed:(int)a3;
- (void)setRetainedByClient:(BOOL)a3;
- (void)setTotalEventsProcessed:(int)a3;
- (void)setTotalLifetimeInSeconds:(double)a3;
- (void)setTransientEventsProcessed:(int)a3;
- (void)teardown;
@end

@implementation _GCHapticPlayer

- (_GCHapticPlayer)initWithIdentifier:(unint64_t)a3 actuators:(id)a4 client:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_GCHapticPlayer;
  v10 = [(_GCHapticPlayer *)&v26 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    actuators = v10->_actuators;
    v10->_actuators = (NSArray *)v11;

    uint64_t v13 = +[NSMutableArray array];
    scheduledCommands = v10->_scheduledCommands;
    v10->_scheduledCommands = (NSMutableArray *)v13;

    uint64_t v15 = +[NSMutableArray array];
    activeHapticEvents = v10->_activeHapticEvents;
    v10->_activeHapticEvents = (NSMutableArray *)v15;

    uint64_t v17 = +[NSMutableArray array];
    eventsToRemove = v10->_eventsToRemove;
    v10->_eventsToRemove = (NSMutableArray *)v17;

    uint64_t v19 = +[NSMutableArray array];
    intensityParamCurve = v10->_intensityParamCurve;
    v10->_intensityParamCurve = (NSMutableArray *)v19;

    uint64_t v21 = +[NSMutableArray array];
    sharpnessParamCurve = v10->_sharpnessParamCurve;
    v10->_sharpnessParamCurve = (NSMutableArray *)v21;

    uint64_t v23 = +[NSNumber numberWithUnsignedInteger:a3];
    identifier = v10->_identifier;
    v10->_identifier = (NSNumber *)v23;

    objc_storeStrong((id *)&v10->_client, a5);
    v10->_retainedByClient = 1;
    v10->_initializationTime = (double)mach_absolute_time() * 0.0000000416666667;
    [(_GCHapticPlayer *)v10 clearParameters];
  }

  return v10;
}

- (BOOL)transientsEnqueuedSinceLastQuery
{
  BOOL transientsEnqueuedSinceLastQuery = self->_transientsEnqueuedSinceLastQuery;
  self->_BOOL transientsEnqueuedSinceLastQuery = 0;
  return transientsEnqueuedSinceLastQuery;
}

- (void)processSliceForLogicalDevice:(id)a3 startTime:(double)a4 endTime:(double)a5
{
  v6 = (id *)a3;
  self->_continuousIntensity = 0.0;
  self->_continuousSharpness = 0.0;
  self->_activeEventThisSlice = 0;
  if (![(NSMutableArray *)self->_activeHapticEvents count]) {
    goto LABEL_71;
  }
  v75 = self;
  v69 = +[NSMutableIndexSet indexSet];
  v72 = self->_intensityParamCurve;
  for (unint64_t i = 0; ; ++i)
  {
    if ([(NSMutableArray *)v72 count] <= i)
    {
      double v11 = 0.0;
      double v12 = 0.0;
      double v9 = 0.0;
      double v10 = 0.0;
      goto LABEL_10;
    }
    id v8 = [(NSMutableArray *)v72 objectAtIndexedSubscript:i];
    [v8 getValue:buf];
    double v9 = *(double *)&v87[12];
    if (*(double *)&v87[12] < a4)
    {
      [v69 addIndex:i];
      goto LABEL_7;
    }
    double v10 = *(double *)&v87[4];
    if (*(double *)&v87[4] <= a5) {
      break;
    }
LABEL_7:
  }
  v75->_activeEventThisSlice = 1;
  double v12 = v88;
  double v11 = v89[0];

LABEL_10:
  [(NSMutableArray *)v72 removeObjectsAtIndexes:v69];
  uint64_t v13 = +[NSMutableIndexSet indexSet];

  v14 = v75->_sharpnessParamCurve;
  unint64_t v15 = 0;
  v70 = (void *)v13;
  while (2)
  {
    v16 = v75;
    if ([(NSMutableArray *)v14 count] <= v15)
    {
      double v19 = 0.0;
      double v18 = 0.0;
      double v20 = 0.0;
      double v21 = 0.0;
      goto LABEL_18;
    }
    uint64_t v17 = [(NSMutableArray *)v14 objectAtIndexedSubscript:v15];
    [v17 getValue:buf];
    double v18 = *(double *)&v87[12];
    if (*(double *)&v87[12] < a4)
    {
      [v70 addIndex:v15];
LABEL_15:

      ++v15;
      continue;
    }
    break;
  }
  double v19 = *(double *)&v87[4];
  if (*(double *)&v87[4] > a5) {
    goto LABEL_15;
  }
  double v20 = v88;
  double v21 = v89[0];

  v16 = v75;
LABEL_18:
  [(NSMutableArray *)v14 removeObjectsAtIndexes:v70];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obj = v16->_activeHapticEvents;
  uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (!v22) {
    goto LABEL_68;
  }
  uint64_t v76 = *(void *)v83;
  *(float *)&long long v23 = (a4 - v10) / (v9 - v10);
  double v24 = v12 + *(float *)&v23 * (v11 - v12);
  *(float *)&long long v23 = (a4 - v19) / (v18 - v19);
  double v25 = v20 + *(float *)&v23 * (v21 - v20);
  *(void *)&long long v23 = 138413058;
  long long v66 = v23;
  while (2)
  {
    uint64_t v77 = v22;
    uint64_t v26 = 0;
    while (2)
    {
      if (*(void *)v83 != v76) {
        objc_enumerationMutation(obj);
      }
      v27 = *(void **)(*((void *)&v82 + 1) + 8 * v26);
      if (objc_msgSend(v27, "type", v66) != 1)
      {
LABEL_29:
        int v34 = 0;
        goto LABEL_30;
      }
      v28 = [v6[10] actuators];
      v29 = [v28 firstObject];
      BOOL v30 = [v29 type] == 0;

      if (v30)
      {
        [v27 startTime];
        v16 = v75;
        if (v35 + 0.1 <= a5) {
          [v27 setStopped:1];
        }
        goto LABEL_29;
      }
      v31 = [v6[10] actuators];
      v32 = [v31 firstObject];
      BOOL v33 = [v32 type] == 1;

      if (v33)
      {
        int v34 = 1;
        v16 = v75;
        v75->_BOOL transientsEnqueuedSinceLastQuery = 1;
      }
      else
      {
        int v34 = 0;
        v16 = v75;
      }
LABEL_30:
      if ([v27 stopped])
      {
        [(NSMutableArray *)v16->_eventsToRemove addObject:v27];
      }
      else
      {
        [v27 sharpness];
        double v37 = v36;
        [v27 intensity];
        float v38 = v37;
        float v40 = v39;
        if (([v27 transientBeganAsContinuousEvent] & 1) == 0)
        {
          [(_GCHapticDynamicParameter *)v16->_intensityParameter value];
          double v42 = v41;
          [(_GCHapticDynamicParameter *)v16->_sharpnessParameter value];
          float v45 = v44 + v38;
          if (v10 <= 0.0)
          {
            float v40 = v42 * v40;
          }
          else
          {
            float v43 = v42 * v40;
            float v46 = v24 * v43;
            float v40 = v46;
          }
          if (v19 <= 0.0)
          {
            float v38 = v45;
          }
          else
          {
            float v47 = v25 + v45;
            float v38 = v47;
          }
          if ([v27 type] == 1)
          {
            v48 = [v6[10] actuators];
            v49 = [v48 firstObject];
            BOOL v50 = [v49 type] == 0;

            if (v50)
            {
              [v27 setTransientBeganAsContinuousEvent:1];
              v16 = v75;
              [v27 setIntensity:v40];
              [v27 setSharpness:v38];
            }
            else
            {
              v16 = v75;
            }
          }
        }
        if (v34)
        {
          if ([(_GCHapticPlayer *)v16 isMuted])
          {
            double v51 = 0.0;
            [v27 setIntensity:0.0];
          }
          else
          {
            [(_GCHapticPlayer *)v16 hapticStrength];
            [v27 setIntensity:(float)(v40 * v54)];
            double v51 = v38;
          }
          [v27 setSharpness:v51];
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          v55 = v16->_actuators;
          uint64_t v56 = [(NSArray *)v55 countByEnumeratingWithState:&v78 objects:v90 count:16];
          if (v56)
          {
            uint64_t v57 = *(void *)v79;
            do
            {
              uint64_t v58 = 0;
              do
              {
                if (*(void *)v79 != v57) {
                  objc_enumerationMutation(v55);
                }
                v59 = *(void **)(*((void *)&v78 + 1) + 8 * v58);
                if (gc_isInternalBuild())
                {
                  v60 = getGCHapticsLogger();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    v68 = [(_GCHapticClientProxy *)v75->_client identifier];
                    uint64_t v67 = [v59 index];
                    [v27 intensity];
                    double v62 = v61;
                    [v27 sharpness];
                    *(_DWORD *)buf = v66;
                    *(void *)v87 = v68;
                    *(_WORD *)&v87[8] = 2048;
                    *(void *)&v87[10] = v67;
                    *(_WORD *)&v87[18] = 2048;
                    double v88 = v62;
                    LOWORD(v89[0]) = 2048;
                    *(void *)((char *)v89 + 2) = v63;
                    _os_log_debug_impl(&dword_220998000, v60, OS_LOG_TYPE_DEBUG, "%@ enqueue transient for motor %lu I=(%.3f) S=(%.3f)", buf, 0x2Au);
                  }
                }
                objc_msgSend(v6[9], "enqueueTransient:hapticMotor:", v27, 2 * objc_msgSend(v59, "index"));
                ++v58;
              }
              while (v56 != v58);
              uint64_t v64 = [(NSArray *)v55 countByEnumeratingWithState:&v78 objects:v90 count:16];
              uint64_t v56 = v64;
            }
            while (v64);
          }

          v16 = v75;
          [(NSMutableArray *)v75->_eventsToRemove addObject:v27];
        }
        else
        {
          v16->_continuousSharpness = v38 + v16->_continuousSharpness;
          if ([(_GCHapticClientProxy *)v16->_client shouldSquareContinuousIntensity])
          {
            [(_GCHapticPlayer *)v16 hapticStrength];
            float v53 = v16->_continuousIntensity + (float)((float)(v40 * v40) * v52);
          }
          else
          {
            [(_GCHapticPlayer *)v16 hapticStrength];
            float v53 = v16->_continuousIntensity + (float)(v40 * v65);
          }
          v16->_continuousIntensity = v53;
        }
        v16->_activeEventThisSlice |= v40 > 0.0;
      }
      if (++v26 != v77) {
        continue;
      }
      break;
    }
    uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_68:

  if (v75->_activeEventThisSlice)
  {
    v75->_activeLifetime = a5 - a4 + v75->_activeLifetime;
    v75->_lastActiveTime = a5;
  }
  [(NSMutableArray *)v75->_activeHapticEvents removeObjectsInArray:v75->_eventsToRemove];
  [(NSMutableArray *)v75->_eventsToRemove removeAllObjects];

LABEL_71:
}

- (void)setMute:(BOOL)a3 forReason:(unint64_t)a4
{
  v4 = (char *)self + 4 * a4;
  int v5 = *((_DWORD *)v4 + 15);
  if (a3) {
    int v6 = v5 + 1;
  }
  else {
    int v6 = v5 - 1;
  }
  *((_DWORD *)v4 + 15) = (int)fmin((double)v6, 0.0);
  self->_dirtyMuteState = 1;
}

- (BOOL)isMutedForReason:(unint64_t)a3
{
  if (a3 >= 5)
  {
    v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v7 handleFailureInMethod:a2 object:self file:@"GCHapticPlayer.mm" lineNumber:225 description:@"Attempting to check if player is muted for invalid reason"];
  }
  return self->_muteReasons[a3] != 0;
}

- (float)hapticStrength
{
  [(_GCHapticClientProxy *)self->_client hapticStrength];
  return result;
}

- (BOOL)isMuted
{
  if ([(_GCHapticClientProxy *)self->_client isMuted]) {
    return 1;
  }
  if (!self->_dirtyMuteState) {
    return self->_muted;
  }
  uint64_t v4 = 0;
  self->_muted = 0;
  while (!self->_muteReasons[v4])
  {
    if (++v4 == 5) {
      return 0;
    }
  }
  BOOL result = 1;
  self->_muted = 1;
  return result;
}

- (float)continuousIntensity
{
  BOOL v3 = [(_GCHapticPlayer *)self isMuted];
  float result = 0.0;
  if (!v3) {
    return self->_continuousIntensity;
  }
  return result;
}

- (float)continuousSharpness
{
  BOOL v3 = [(_GCHapticPlayer *)self isMuted];
  float result = 0.0;
  if (!v3) {
    return self->_continuousSharpness;
  }
  return result;
}

- (BOOL)hasScheduledCommands
{
  return [(NSMutableArray *)self->_scheduledCommands count] != 0;
}

- (BOOL)hasProcessedActiveEventsAfterTime:(double)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_activeHapticEvents count];
  if (v5) {
    LOBYTE(v5) = self->_lastActiveTime > a3;
  }
  return v5;
}

- (BOOL)hasProcessedActiveEventsThisSlice
{
  uint64_t v3 = [(NSMutableArray *)self->_activeHapticEvents count];
  if (v3) {
    LOBYTE(v3) = self->_activeEventThisSlice;
  }
  return v3;
}

- (BOOL)hasScheduledEventsByTime:(double)a3
{
  if (![(NSMutableArray *)self->_scheduledCommands count]) {
    return 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_scheduledCommands lastObject];
  [v5 time];
  BOOL v7 = v6 <= a3;

  return v7;
}

- (BOOL)isActiveAtTime:(double)a3
{
  return a3 - self->_initializationTime < 0.200000003
      || [(_GCHapticPlayer *)self hasProcessedActiveEventsThisSlice]
      || [(_GCHapticPlayer *)self hasScheduledCommands]
      || self->_retainedByClient;
}

- (void)setRetainedByClient:(BOOL)a3
{
  if (self->_retainedByClient && !a3)
  {
    uint64_t v5 = +[_GCHapticServerManager sharedInstance];
    [v5 notifyPlayerNoLongerRetained:self];
  }
  self->_retainedByClient = a3;
}

- (void)scheduleCommand:(const void *)a3
{
  uint64_t v5 = [[_GCHapticSyntheticCommand alloc] initWithHapticCommand:a3];
  if (*((_WORD *)a3 + 1) == 1) {
    [(_GCHapticClientProxy *)self->_client setComplete:0];
  }
  -[NSMutableArray insertObject:atIndex:](self->_scheduledCommands, "insertObject:atIndex:", v5, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_scheduledCommands, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, [(NSMutableArray *)self->_scheduledCommands count], 1024, &__block_literal_global_26));
}

- (void)clearParameters
{
  if (gc_isInternalBuild())
  {
    BOOL v7 = getGCHapticsLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      double v10 = self;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "Clear parameters for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v3 = [[_GCHapticDynamicParameter alloc] initWithType:5002 value:1.0];
  intensityParameter = self->_intensityParameter;
  self->_intensityParameter = v3;

  uint64_t v5 = [[_GCHapticDynamicParameter alloc] initWithType:5003 value:0.0];
  sharpnessParameter = self->_sharpnessParameter;
  self->_sharpnessParameter = v5;

  if ([(_GCHapticPlayer *)self isMutedForReason:2])
  {
    if (gc_isInternalBuild())
    {
      id v8 = getGCHapticsLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        double v10 = self;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "Unmuting %@ for reason GCHapticMuteReasonSetParameter", (uint8_t *)&v9, 0xCu);
      }
    }
    [(_GCHapticPlayer *)self setMute:0 forReason:2];
  }
}

- (void)handleCommand:(id)a3
{
  id v4 = a3;
  ++self->_totalEventsProcessed;
  switch([v4 type])
  {
    case 1u:
      if (gc_isInternalBuild())
      {
        BOOL v50 = getGCHapticsLogger();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          [v4 time];
          uint64_t v60 = v59;
          double v61 = [v4 tokenAndParams];
          *(_DWORD *)buf = 134218496;
          *(void *)long long v81 = v60;
          *(_WORD *)&v81[8] = 2048;
          *(void *)&v81[10] = [v61 token];
          *(_WORD *)&v81[18] = 2048;
          *(void *)&v81[20] = [v4 channelID];
          _os_log_debug_impl(&dword_220998000, v50, OS_LOG_TYPE_DEBUG, "StartEvent at %f token %lu (ch=%lu)", buf, 0x20u);
        }
      }
      double v11 = [[_GCHapticEvent alloc] initWithSyntheticCommand:v4];
      [(NSMutableArray *)self->_activeHapticEvents addObject:v11];
      if ([(_GCHapticEvent *)v11 type] == 2)
      {
        uint64_t v12 = 148;
      }
      else
      {
        if ([(_GCHapticEvent *)v11 type] != 1) {
          goto LABEL_89;
        }
        uint64_t v12 = 144;
      }
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      goto LABEL_89;
    case 2u:
      if (gc_isInternalBuild())
      {
        double v51 = getGCHapticsLogger();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          double v62 = [v4 tokenAndParams];
          *(_DWORD *)buf = 134218240;
          *(void *)long long v81 = [v62 token];
          *(_WORD *)&v81[8] = 2048;
          *(void *)&v81[10] = [v4 channelID];
          _os_log_debug_impl(&dword_220998000, v51, OS_LOG_TYPE_DEBUG, "Stop event token %lu (ch=%lu)", buf, 0x16u);
        }
      }
      unint64_t v13 = 0;
      while (2)
      {
        if ([(NSMutableArray *)self->_activeHapticEvents count] > v13)
        {
          v14 = [(NSMutableArray *)self->_activeHapticEvents objectAtIndexedSubscript:v13];
          uint64_t v15 = [v14 identifier];
          v16 = [v4 tokenAndParams];
          LODWORD(v15) = v15 == [v16 token];

          if (!v15)
          {

            ++v13;
            continue;
          }
          [v14 setStopped:1];
        }
        break;
      }
      goto LABEL_4;
    case 3u:
      int v5 = [v4 paramID];
      if (v5 == 2014)
      {
        if (gc_isInternalBuild())
        {
          uint64_t v57 = getGCHapticsLogger();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
            -[_GCHapticPlayer handleCommand:].cold.4((uint64_t)buf, [v4 channelID], v57);
          }
        }
        [v4 value];
        [(_GCHapticPlayer *)self setMute:v6 != 0.0 forReason:2];
        goto LABEL_4;
      }
      v79[0] = 0;
      float v70 = 0.0;
      [v4 value];
      clientParamToSynthParam(v5, v36, v79, &v70);
      if (v79[0] == 5002)
      {
        uint64_t v37 = 32;
      }
      else
      {
        if (v79[0] != 5003) {
          goto LABEL_92;
        }
        uint64_t v37 = 40;
      }
      [*(id *)((char *)&self->super.isa + v37) setValue:v70];
LABEL_92:
      if (gc_isInternalBuild())
      {
        float v45 = getGCHapticsLogger();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v63 = v79[0];
          float v64 = v70;
          [v4 time];
          uint64_t v66 = v65;
          uint64_t v67 = [v4 channelID];
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)long long v81 = v63;
          *(_WORD *)&v81[4] = 2048;
          *(double *)&v81[6] = v64;
          *(_WORD *)&v81[14] = 2048;
          *(void *)&v81[16] = v66;
          *(_WORD *)&v81[24] = 2048;
          *(void *)&v81[26] = v67;
          _os_log_debug_impl(&dword_220998000, v45, OS_LOG_TYPE_DEBUG, "CommandType::SetParam - type %d param with value %f at time %.3f on channel %lu", buf, 0x26u);
        }
      }
      goto LABEL_4;
    case 4u:
      if (gc_isInternalBuild())
      {
        float v52 = getGCHapticsLogger();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          [v4 time];
          -[_GCHapticPlayer handleCommand:]((uint64_t)buf, v53);
        }
      }
      int v24 = [(NSMutableArray *)self->_scheduledCommands count];
      if (v24 < 1)
      {
        double v25 = 0;
      }
      else
      {
        double v25 = 0;
        unint64_t v26 = v24 + 1;
        do
        {
          v27 = [(NSMutableArray *)self->_scheduledCommands objectAtIndexedSubscript:(v26 - 2)];

          double v25 = v27;
          uint64_t v28 = [v27 channelID];
          if (v28 == [v4 channelID])
          {
            [v25 time];
            double v30 = v29;
            [v4 time];
            if (v30 >= v31 && [v25 type] != 5) {
              [v25 cancel];
            }
          }
          --v26;
        }
        while (v26 > 1);
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      float v38 = self->_activeHapticEvents;
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v75 objects:v83 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v76 != v40) {
              objc_enumerationMutation(v38);
            }
            [*(id *)(*((void *)&v75 + 1) + 8 * i) setStopped:1];
          }
          uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v75 objects:v83 count:16];
        }
        while (v39);
      }

      goto LABEL_4;
    case 5u:
      if (!gc_isInternalBuild()) {
        goto LABEL_4;
      }
      getGCHapticsLogger();
      double v11 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
      {
        [v4 time];
        -[_GCHapticPlayer handleCommand:]((uint64_t)buf, v32);
      }
      goto LABEL_89;
    case 0xAu:
      ++self->_parameterCurvesProcessed;
      uint64_t v7 = [v4 paramID];
      if (v7 == 2001)
      {
        sharpnessParamCurve = self->_sharpnessParamCurve;
        int v9 = [v4 parameterCurve];
        double v10 = [v9 curve];
        [(NSMutableArray *)sharpnessParamCurve addObjectsFromArray:v10];
      }
      else
      {
        if (v7 != 2000) {
          goto LABEL_86;
        }
        intensityParamCurve = self->_intensityParamCurve;
        int v9 = [v4 parameterCurve];
        double v10 = [v9 curve];
        [(NSMutableArray *)intensityParamCurve addObjectsFromArray:v10];
      }

LABEL_86:
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        double v11 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v43 = [v4 paramID];
          [v4 time];
          [(_GCHapticPlayer *)(uint64_t)buf handleCommand:v44];
        }
LABEL_89:
      }
LABEL_4:

      return;
    case 0xCu:
      uint64_t v17 = [v4 channelID];
      int v18 = [(NSMutableArray *)self->_scheduledCommands count];
      if (v18 < 1)
      {
        id v19 = 0;
        double v20 = 0;
      }
      else
      {
        id v19 = 0;
        double v20 = 0;
        unint64_t v21 = v18 + 1;
        do
        {
          uint64_t v22 = [(NSMutableArray *)self->_scheduledCommands objectAtIndexedSubscript:(v21 - 2)];

          double v20 = v22;
          if ([v22 channelID] == v17)
          {
            unint64_t v23 = [v22 serverID];
            if (v23 <= [v4 serverID])
            {
              if ([v20 type] == 2)
              {
                if (gc_isInternalBuild())
                {
                  log = getGCHapticsLogger();
                  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)long long v81 = v20;
                    _os_log_debug_impl(&dword_220998000, log, OS_LOG_TYPE_DEBUG, "Executing stop event early: %@", buf, 0xCu);
                  }
                }
                if (!v19) {
                  id v19 = (id)objc_opt_new();
                }
                [v19 addObject:v20];
              }
              else
              {
                if (gc_isInternalBuild())
                {
                  loga = getGCHapticsLogger();
                  if (os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)long long v81 = v20;
                    _os_log_debug_impl(&dword_220998000, loga, OS_LOG_TYPE_DEBUG, "Canceling: %@", buf, 0xCu);
                  }
                }
                [v20 cancel];
              }
            }
          }
          --v21;
        }
        while (v21 > 1);
        if (v19)
        {
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v19 = v19;
          uint64_t v33 = [v19 countByEnumeratingWithState:&v71 objects:v82 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v72;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v72 != v34) {
                  objc_enumerationMutation(v19);
                }
                [(_GCHapticPlayer *)self handleCommand:*(void *)(*((void *)&v71 + 1) + 8 * j)];
              }
              uint64_t v33 = [v19 countByEnumeratingWithState:&v71 objects:v82 count:16];
            }
            while (v33);
          }
        }
      }
      [(_GCHapticPlayer *)self clearParameters];
      if (gc_isInternalBuild())
      {
        float v54 = getGCHapticsLogger();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v55 = [v4 channelID];
          [v4 time];
          [(_GCHapticPlayer *)(uint64_t)buf handleCommand:v56];
        }
      }
      goto LABEL_4;
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
      if (gc_isInternalBuild())
      {
        v48 = getGCHapticsLogger();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          [v4 time];
          -[_GCHapticPlayer handleCommand:].cold.7((uint64_t)buf, v49);
        }
      }
      goto LABEL_3;
    case 0x1Eu:
LABEL_3:
      if (gc_isInternalBuild())
      {
        float v46 = getGCHapticsLogger();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          [v4 time];
          -[_GCHapticPlayer handleCommand:].cold.6((uint64_t)v79, v47);
        }
      }
      goto LABEL_4;
    default:
      if (!gc_isInternalBuild()) {
        goto LABEL_4;
      }
      getGCHapticsLogger();
      double v11 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      {
        [v4 time];
        *(_DWORD *)buf = 134218496;
        *(void *)long long v81 = v58;
        *(_WORD *)&v81[8] = 1024;
        *(_DWORD *)&v81[10] = [v4 type];
        *(_WORD *)&v81[14] = 1024;
        *(_DWORD *)&v81[16] = [v4 channelID];
        _os_log_error_impl(&dword_220998000, &v11->super, OS_LOG_TYPE_ERROR, "ERROR: read unrecognized command from client: time: %.3f type: %u chanID: %d", buf, 0x18u);
      }
      goto LABEL_89;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: channel=%@, scheduled=%lu, active=%lu>", objc_opt_class(), self->_identifier, [(NSMutableArray *)self->_scheduledCommands count], [(NSMutableArray *)self->_activeHapticEvents count]];
}

- (void)teardown
{
  self->_retainedByClient = 0;
}

- (void)dealloc
{
  uint64_t v3 = +[GCAnalytics instance];
  id v4 = [(_GCHapticPlayer *)self bundleIdentifier];
  int v5 = (void *)[v4 copy];
  float v6 = [(_GCHapticPlayer *)self controllerProductCategory];
  uint64_t v7 = (void *)[v6 copy];
  uint64_t v8 = [(_GCHapticPlayer *)self totalEventsProcessed];
  uint64_t v9 = [(_GCHapticPlayer *)self transientEventsProcessed];
  uint64_t v10 = [(_GCHapticPlayer *)self continuousEventsProcessed];
  uint64_t v11 = [(_GCHapticPlayer *)self parameterCurvesProcessed];
  [(_GCHapticPlayer *)self totalLifetimeInSeconds];
  double v13 = v12;
  [(_GCHapticPlayer *)self activeLifetimeInSeconds];
  LODWORD(v15) = (int)v13;
  HIDWORD(v15) = (int)v14;
  objc_msgSend(v3, "sendHapticsPlayerDestroyedEventForBundleID:productCategory:totalEventsProcessed:transientEventsProcessed:continuousEventsProcessed:parameterCurvesProcessed:sessionTotalDuration:sessionActiveDuration:", v5, v7, v8, v9, v10, v11, v15);

  v16.receiver = self;
  v16.super_class = (Class)_GCHapticPlayer;
  [(_GCHapticPlayer *)&v16 dealloc];
}

- (int)totalEventsProcessed
{
  return self->_totalEventsProcessed;
}

- (int)transientEventsProcessed
{
  return self->_transientEventsProcessed;
}

- (int)continuousEventsProcessed
{
  return self->_continuousEventsProcessed;
}

- (int)parameterCurvesProcessed
{
  return self->_parameterCurvesProcessed;
}

- (double)totalLifetimeInSeconds
{
  double result = 0.0;
  if (self->_initializationTime >= 0.0) {
    return (double)mach_absolute_time() * 0.0000000416666667 - self->_initializationTime;
  }
  return result;
}

- (double)activeLifetimeInSeconds
{
  return self->_activeLifetime;
}

- (id)bundleIdentifier
{
  return [(_GCHapticClientProxy *)self->_client bundleIdentifier];
}

- (id)controllerProductCategory
{
  return [(_GCHapticClientProxy *)self->_client controllerProductCategory];
}

- (NSArray)actuators
{
  return self->_actuators;
}

- (_GCHapticLogicalDevice)hapticLogicalDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapticLogicalDevice);

  return (_GCHapticLogicalDevice *)WeakRetained;
}

- (void)setHapticLogicalDevice:(id)a3
{
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (BOOL)isRetainedByClient
{
  return self->_retainedByClient;
}

- (void)setTotalEventsProcessed:(int)a3
{
  self->_totalEventsProcessed = a3;
}

- (void)setTransientEventsProcessed:(int)a3
{
  self->_transientEventsProcessed = a3;
}

- (void)setContinuousEventsProcessed:(int)a3
{
  self->_continuousEventsProcessed = a3;
}

- (void)setParameterCurvesProcessed:(int)a3
{
  self->_parameterCurvesProcessed = a3;
}

- (void)setTotalLifetimeInSeconds:(double)a3
{
  self->_totalLifetimeInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_hapticLogicalDevice);
  objc_storeStrong((id *)&self->_actuators, 0);
  objc_storeStrong((id *)&self->_sharpnessParamCurve, 0);
  objc_storeStrong((id *)&self->_intensityParamCurve, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_sharpnessParameter, 0);
  objc_storeStrong((id *)&self->_intensityParameter, 0);
  objc_storeStrong((id *)&self->_eventsToRemove, 0);
  objc_storeStrong((id *)&self->_activeHapticEvents, 0);

  objc_storeStrong((id *)&self->_scheduledCommands, 0);
}

- (void)handleCommand:(uint64_t)a1 .cold.1(uint64_t a1, double a2)
{
  OUTLINED_FUNCTION_2_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_1_16(&dword_220998000, v2, v3, "Clear events at time %.3f", v4);
}

- (void)handleCommand:(uint64_t)a1 .cold.2(uint64_t a1, double a2)
{
  OUTLINED_FUNCTION_2_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_1_16(&dword_220998000, v2, v3, "Final event at time %.3f", v4);
}

- (void)handleCommand:(double)a3 .cold.3(uint64_t a1, uint64_t a2, double a3)
{
  OUTLINED_FUNCTION_0_19(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_220998000, v3, OS_LOG_TYPE_DEBUG, "Reset channel %lu at time %.3f", v4, 0x16u);
}

- (void)handleCommand:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1_16(&dword_220998000, a3, (uint64_t)a3, "CommandType::SetParam - mute channel %lu haptics", (uint8_t *)a1);
}

- (void)handleCommand:(double)a3 .cold.5(uint64_t a1, uint64_t a2, double a3)
{
  OUTLINED_FUNCTION_0_19(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_220998000, v3, OS_LOG_TYPE_DEBUG, "Add parameter curve of type %lu at time %.3f", v4, 0x16u);
}

- (void)handleCommand:(uint64_t)a1 .cold.6(uint64_t a1, double a2)
{
  OUTLINED_FUNCTION_2_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_1_16(&dword_220998000, v2, v3, "NoOp at time %.3f", v4);
}

- (void)handleCommand:(uint64_t)a1 .cold.7(uint64_t a1, double a2)
{
  OUTLINED_FUNCTION_2_5(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_1_16(&dword_220998000, v2, v3, "Unsupported command at time %.3f", v4);
}

@end