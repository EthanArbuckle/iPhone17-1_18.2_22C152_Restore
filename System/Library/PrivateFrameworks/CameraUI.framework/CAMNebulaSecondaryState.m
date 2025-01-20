@interface CAMNebulaSecondaryState
+ (BOOL)supportsSecureCoding;
+ (id)secondaryStateWithContentsOfFile:(id)a3;
- (BOOL)addStopReasons:(int64_t)a3 stopTime:(id)a4;
- (BOOL)writeToFile:(id)a3;
- (CAMNebulaSecondaryState)initWithCoder:(id)a3;
- (NSDate)lastMovieWriteAttemptTime;
- (NSDate)stopTime;
- (id)description;
- (int64_t)failedStateReadAttemptsCount;
- (int64_t)movieWriteAttemptsCount;
- (int64_t)stopReasons;
- (void)encodeWithCoder:(id)a3;
- (void)notifyWillAttemptToWriteMovie;
- (void)setFailedStateReadAttemptsCount:(int64_t)a3;
- (void)setStopReasons:(int64_t)a3;
- (void)setStopTime:(id)a3;
@end

@implementation CAMNebulaSecondaryState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMNebulaSecondaryState)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMNebulaSecondaryState;
  v5 = [(CAMNebulaSecondaryState *)&v12 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"stopReasons"]) {
      uint64_t v6 = [v4 decodeIntegerForKey:@"stopReasons"];
    }
    else {
      uint64_t v6 = 0;
    }
    v5->_stopReasons = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stopTime"];
    stopTime = v5->_stopTime;
    v5->_stopTime = (NSDate *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastMovieWriteAttemptTime"];
    lastMovieWriteAttemptTime = v5->_lastMovieWriteAttemptTime;
    v5->_lastMovieWriteAttemptTime = (NSDate *)v9;

    v5->_movieWriteAttemptsCount = [v4 decodeIntegerForKey:@"movieWriteAttemptsCount"];
    v5->_failedStateReadAttemptsCount = [v4 decodeIntegerForKey:@"failedStateReadAttemptsCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t stopReasons = self->_stopReasons;
  id v5 = a3;
  [v5 encodeInteger:stopReasons forKey:@"stopReasons"];
  [v5 encodeObject:self->_stopTime forKey:@"stopTime"];
  [v5 encodeObject:self->_lastMovieWriteAttemptTime forKey:@"lastMovieWriteAttemptTime"];
  [v5 encodeInteger:self->_movieWriteAttemptsCount forKey:@"movieWriteAttemptsCount"];
  [v5 encodeInteger:self->_failedStateReadAttemptsCount forKey:@"failedStateReadAttemptsCount"];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CAMNebulaSecondaryState;
  id v4 = [(CAMNebulaSecondaryState *)&v9 description];
  int64_t v5 = [(CAMNebulaSecondaryState *)self stopReasons];
  uint64_t v6 = [(CAMNebulaSecondaryState *)self stopTime];
  uint64_t v7 = [v3 stringWithFormat:@"%@: stopReasons=%ld stopTime=%@", v4, v5, v6];

  return v7;
}

- (BOOL)addStopReasons:(int64_t)a3 stopTime:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CAMNebulaSecondaryState *)self stopReasons];
  BOOL v8 = (v7 | a3) == v7;
  BOOL v9 = (v7 | a3) != v7;
  if (!v8) {
    -[CAMNebulaSecondaryState setStopReasons:](self, "setStopReasons:");
  }
  uint64_t v10 = [(CAMNebulaSecondaryState *)self stopTime];
  v11 = (void *)v10;
  if (v6 && !v10)
  {
    [(CAMNebulaSecondaryState *)self setStopTime:v6];
    BOOL v9 = 1;
  }

  return v9;
}

- (void)notifyWillAttemptToWriteMovie
{
  ++self->_movieWriteAttemptsCount;
  v3 = [MEMORY[0x263EFF910] date];
  lastMovieWriteAttemptTime = self->_lastMovieWriteAttemptTime;
  self->_lastMovieWriteAttemptTime = v3;
  MEMORY[0x270F9A758](v3, lastMovieWriteAttemptTime);
}

- (BOOL)writeToFile:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v23 = 0;
    int64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v23];
    id v6 = v23;
    if (v6)
    {
      int64_t v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CAMNebulaSecondaryState writeToFile:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    char v14 = [v5 writeToFile:v4 atomically:1];
    if ((v14 & 1) == 0)
    {
      v15 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CAMNebulaSecondaryState writeToFile:]((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)secondaryStateWithContentsOfFile:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
    if (v4)
    {
      id v15 = 0;
      int64_t v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v15];
      id v6 = v15;
      if (v6)
      {
        int64_t v7 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          +[CAMNebulaSecondaryState secondaryStateWithContentsOfFile:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
        }
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSDate)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(id)a3
{
}

- (int64_t)stopReasons
{
  return self->_stopReasons;
}

- (void)setStopReasons:(int64_t)a3
{
  self->_int64_t stopReasons = a3;
}

- (NSDate)lastMovieWriteAttemptTime
{
  return self->_lastMovieWriteAttemptTime;
}

- (int64_t)movieWriteAttemptsCount
{
  return self->_movieWriteAttemptsCount;
}

- (int64_t)failedStateReadAttemptsCount
{
  return self->_failedStateReadAttemptsCount;
}

- (void)setFailedStateReadAttemptsCount:(int64_t)a3
{
  self->_failedStateReadAttemptsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMovieWriteAttemptTime, 0);
  objc_storeStrong((id *)&self->_stopTime, 0);
}

- (void)writeToFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeToFile:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)secondaryStateWithContentsOfFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end