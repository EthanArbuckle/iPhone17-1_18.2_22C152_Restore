@interface GEOEventRecorderInstrumentation
+ (id)defaultInstrumentation;
+ (id)initializeDefaultInstrumentation;
+ (void)endInstrumentation;
- (GEOEventRecorderInstrumentation)init;
- (id)getRecordedFilePaths;
- (void)_captureScreenVideo:(id)a3;
- (void)captureEventRecorderScreenVideo;
- (void)captureUIEvent:(id)a3;
- (void)captureUserActionLogMessageEvent:(id)a3;
- (void)initializeFilepaths;
- (void)writeString:(id)a3 ToFilepath:(id)a4;
@end

@implementation GEOEventRecorderInstrumentation

- (GEOEventRecorderInstrumentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOEventRecorderInstrumentation;
  v2 = [(GEOEventRecorderInstrumentation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_workloop_qos();
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v3;

    [(GEOEventRecorderInstrumentation *)v2 _setupLogging];
  }
  return v2;
}

+ (id)initializeDefaultInstrumentation
{
  v2 = (void *)sDefaultInstrumentation;
  if (!sDefaultInstrumentation)
  {
    uint64_t v3 = objc_alloc_init(GEOEventRecorderInstrumentation);
    v4 = (void *)sDefaultInstrumentation;
    sDefaultInstrumentation = (uint64_t)v3;

    v2 = (void *)sDefaultInstrumentation;
  }

  return v2;
}

+ (id)defaultInstrumentation
{
  return (id)sDefaultInstrumentation;
}

+ (void)endInstrumentation
{
  v2 = (void *)sDefaultInstrumentation;
  sDefaultInstrumentation = 0;
}

- (id)getRecordedFilePaths
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *(void *)(sDefaultInstrumentation + 16), *(void *)(sDefaultInstrumentation + 24), *(void *)(sDefaultInstrumentation + 32), 0);

  return v3;
}

- (void)captureUIEvent:(id)a3
{
}

- (void)captureUserActionLogMessageEvent:(id)a3
{
}

- (void)writeString:(id)a3 ToFilepath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  loggingQueue = self->_loggingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__GEOEventRecorderInstrumentation_writeString_ToFilepath___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(loggingQueue, block);
}

void __58__GEOEventRecorderInstrumentation_writeString_ToFilepath___block_invoke(void *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  [*(id *)(a1[4] + 40) timeIntervalSinceNow];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"(%0.1fs)", -v3);
  v5 = [NSString stringWithFormat:@"%@ %@\n", v4, a1[5]];

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v6 fileExistsAtPath:a1[6]]
    || ([v6 isWritableFileAtPath:a1[6]] & 1) == 0)
  {
    uint64_t v7 = a1[6];
    v8 = [MEMORY[0x1E4F1C9B8] data];
    uint64_t v13 = *MEMORY[0x1E4F28300];
    id v9 = [NSNumber numberWithBool:0];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v6 createFileAtPath:v7 contents:v8 attributes:v10];
  }
  v11 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:a1[6]];
  [v11 seekToEndReturningOffset:0 error:0];
  id v12 = [v5 dataUsingEncoding:4];
  [v11 writeData:v12 error:0];

  [v11 closeAndReturnError:0];
}

- (void)captureEventRecorderScreenVideo
{
}

- (void)_captureScreenVideo:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v10 = 0;
  char v6 = [v5 copyItemAtPath:@"/private/var/mobile/Library/ReplayKit/RPMovie_com.apple.Maps.mp4" toPath:v4 error:&v10];

  id v7 = v10;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    id v9 = [v7 description];
    NSLog(&cfstr_CopyingTheMovi.isa, v9);
  }
}

- (void)initializeFilepaths
{
  double v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  startDate = self->_startDate;
  self->_startDate = v3;

  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy_MM_dd_hh_mm_ss"];
  char v6 = [v5 stringFromDate:self->_startDate];
  id v7 = [NSString stringWithFormat:@"rai_%@", v6];
  id v21 = 0;
  v8 = GEOLogDirectory(&v21);
  id v9 = v21;
  if (!v9)
  {
    v20 = [v8 stringByAppendingPathComponent:@"RecordedIssues"];
    id v10 = [v20 stringByAppendingPathComponent:v7];
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
    id v12 = [NSString stringWithFormat:@"%@.txt", v7];
    uint64_t v13 = [v10 stringByAppendingPathComponent:v12];
    filepath = self->_filepath;
    self->_filepath = v13;

    v15 = [NSString stringWithFormat:@"raiGEO_%@.txt", v6];
    v16 = [v10 stringByAppendingPathComponent:v15];
    geoFilepath = self->_geoFilepath;
    self->_geoFilepath = v16;

    v18 = [v10 stringByAppendingPathComponent:@"movie.mp4"];
    movieFilepath = self->_movieFilepath;
    self->_movieFilepath = v18;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_movieFilepath, 0);
  objc_storeStrong((id *)&self->_geoFilepath, 0);
  objc_storeStrong((id *)&self->_filepath, 0);

  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

@end