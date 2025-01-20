@interface TIProgressTracker
- (BOOL)limitsReached;
- (BOOL)shouldStopAfterAddingStateString:(id)a3;
- (NSCountedSet)priorStates;
- (NSDate)startTime;
- (NSMutableArray)stateTranscript;
- (NSString)badSentenceFilePath;
- (NSString)badSentenceTranscriptFilePath;
- (NSString)intended;
- (TIProgressTracker)initWithIntendedString:(id)a3 repeatLimit:(int64_t)a4 timeout:(double)a5 badSentencePath:(id)a6;
- (double)timeout;
- (int64_t)repeatLimit;
- (unint64_t)stoppageReason;
- (void)appendStringToFile:(id)a3 atFilePath:(id)a4;
- (void)saveBadSentenceAndTranscript:(unint64_t)a3;
- (void)setBadSentenceFilePath:(id)a3;
- (void)setBadSentenceTranscriptFilePath:(id)a3;
- (void)setIntended:(id)a3;
- (void)setPriorStates:(id)a3;
- (void)setRepeatLimit:(int64_t)a3;
- (void)setStartTime:(id)a3;
- (void)setStateTranscript:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation TIProgressTracker

- (TIProgressTracker)initWithIntendedString:(id)a3 repeatLimit:(int64_t)a4 timeout:(double)a5 badSentencePath:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIProgressTracker;
  v13 = [(TIProgressTracker *)&v24 init];
  v14 = v13;
  if (v13)
  {
    v13->_repeatLimit = a4;
    v13->_timeout = a5;
    objc_storeStrong((id *)&v13->_intended, a3);
    uint64_t v15 = +[NSDate now];
    startTime = v14->_startTime;
    v14->_startTime = (NSDate *)v15;

    v17 = (NSCountedSet *)[objc_alloc((Class)NSCountedSet) initWithCapacity:100];
    priorStates = v14->_priorStates;
    v14->_priorStates = v17;

    uint64_t v19 = +[NSMutableArray arrayWithCapacity:200];
    stateTranscript = v14->_stateTranscript;
    v14->_stateTranscript = (NSMutableArray *)v19;

    v21 = (NSString *)[v12 copy];
    badSentenceFilePath = v14->_badSentenceFilePath;
    v14->_badSentenceFilePath = v21;
  }
  return v14;
}

- (BOOL)shouldStopAfterAddingStateString:(id)a3
{
  v4 = +[NSString stringWithString:a3];
  v5 = [(TIProgressTracker *)self priorStates];
  [v5 addObject:v4];

  v6 = [(TIProgressTracker *)self stateTranscript];
  [v6 addObject:v4];

  v7 = +[NSDate now];
  v8 = [(TIProgressTracker *)self startTime];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  id v11 = [(TIProgressTracker *)self priorStates];
  id v12 = [v11 countForObject:v4];

  if ((uint64_t)v12 <= [(TIProgressTracker *)self repeatLimit]
    && ([(TIProgressTracker *)self timeout], v10 <= v13))
  {
    BOOL v14 = 0;
  }
  else
  {
    [(TIProgressTracker *)self saveBadSentenceAndTranscript:[(TIProgressTracker *)self stoppageReason]];
    BOOL v14 = 1;
  }

  return v14;
}

- (unint64_t)stoppageReason
{
  v3 = [(TIProgressTracker *)self stateTranscript];
  v4 = [v3 lastObject];

  v5 = +[NSDate now];
  v6 = [(TIProgressTracker *)self startTime];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  double v9 = [(TIProgressTracker *)self priorStates];
  id v10 = [v9 countForObject:v4];

  id v11 = [(TIProgressTracker *)self intended];
  unsigned __int8 v12 = [v11 isEqualToString:v4];

  if (v12)
  {
    unint64_t v13 = 0;
  }
  else if ((uint64_t)v10 <= [(TIProgressTracker *)self repeatLimit])
  {
    [(TIProgressTracker *)self timeout];
    if (v8 <= v14) {
      unint64_t v13 = 3;
    }
    else {
      unint64_t v13 = 2;
    }
  }
  else
  {
    unint64_t v13 = 1;
  }

  return v13;
}

- (void)saveBadSentenceAndTranscript:(unint64_t)a3
{
  v5 = [(TIProgressTracker *)self badSentenceFilePath];

  if (v5)
  {
    v6 = [(TIProgressTracker *)self intended];
    double v7 = [(TIProgressTracker *)self badSentenceFilePath];
    [(TIProgressTracker *)self appendStringToFile:v6 atFilePath:v7];
  }
  double v8 = [(TIProgressTracker *)self intended];
  double v9 = +[NSString stringWithFormat:@"> %-10@ >> %@", @"Intended", v8];

  if (a3 > 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = (uint64_t)*(&off_8CC70 + a3);
  }
  id v11 = [(TIProgressTracker *)self stateTranscript];
  unsigned __int8 v12 = [v11 lastObject];
  unint64_t v13 = +[NSString stringWithFormat:@"> %-10@ << %@", v10, v12];

  v20[0] = v9;
  v20[1] = v13;
  double v14 = +[NSArray arrayWithObjects:v20 count:2];
  uint64_t v15 = [(TIProgressTracker *)self stateTranscript];
  v16 = [v14 arrayByAddingObjectsFromArray:v15];

  v17 = [v16 componentsJoinedByString:@"\n"];
  v18 = [v17 stringByAppendingString:@"\n\n"];

  uint64_t v19 = [(TIProgressTracker *)self badSentenceTranscriptFilePath];
  [(TIProgressTracker *)self appendStringToFile:v18 atFilePath:v19];
}

- (void)appendStringToFile:(id)a3 atFilePath:(id)a4
{
  id v10 = a4;
  if (v10)
  {
    id v5 = a3;
    v6 = +[NSFileManager defaultManager];
    if (([v6 fileExistsAtPath:v10] & 1) == 0
      && ([v6 createFileAtPath:v10 contents:0 attributes:0] & 1) == 0)
    {
      fprintf(__stderrp, "Error: unable to write log file '%s'.\n", (const char *)[v10 UTF8String]);
    }
    double v7 = +[NSFileHandle fileHandleForWritingAtPath:v10];
    [v7 seekToEndOfFile];
    double v8 = [v5 dataUsingEncoding:4];

    [v7 writeData:v8];
    [v7 closeFile];
  }
  else
  {
    id v9 = a3;
    double v7 = +[NSFileHandle fileHandleWithStandardOutput];
    v6 = [v9 dataUsingEncoding:4];

    [v7 writeData:v6];
  }
}

- (BOOL)limitsReached
{
  return self->_limitsReached;
}

- (int64_t)repeatLimit
{
  return self->_repeatLimit;
}

- (void)setRepeatLimit:(int64_t)a3
{
  self->_repeatLimit = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSCountedSet)priorStates
{
  return self->_priorStates;
}

- (void)setPriorStates:(id)a3
{
}

- (NSMutableArray)stateTranscript
{
  return self->_stateTranscript;
}

- (void)setStateTranscript:(id)a3
{
}

- (NSString)badSentenceFilePath
{
  return self->_badSentenceFilePath;
}

- (void)setBadSentenceFilePath:(id)a3
{
}

- (NSString)badSentenceTranscriptFilePath
{
  return self->_badSentenceTranscriptFilePath;
}

- (void)setBadSentenceTranscriptFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badSentenceTranscriptFilePath, 0);
  objc_storeStrong((id *)&self->_badSentenceFilePath, 0);
  objc_storeStrong((id *)&self->_stateTranscript, 0);
  objc_storeStrong((id *)&self->_priorStates, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_intended, 0);
}

@end