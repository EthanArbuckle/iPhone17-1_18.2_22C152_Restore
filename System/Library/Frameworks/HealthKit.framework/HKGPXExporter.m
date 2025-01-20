@interface HKGPXExporter
+ (id)_displayNameForRoute:(id)a3;
+ (id)fileNameForRoute:(id)a3;
- (BOOL)_appendGPXHeaderWithError:(id *)a3;
- (BOOL)_appendString:(id)a3 error:(id *)a4;
- (BOOL)appendLocations:(id)a3 error:(id *)a4;
- (BOOL)finishWithError:(id *)a3;
- (BOOL)isFinished;
- (HKGPXExporter)initWithURL:(id)a3 route:(id)a4;
- (NSURL)URL;
- (id)_trackpointEntryForLocation:(id)a3;
@end

@implementation HKGPXExporter

- (HKGPXExporter)initWithURL:(id)a3 route:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKGPXExporter;
  v9 = [(HKGPXExporter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    v10->_isFinished = 0;
    objc_storeStrong((id *)&v10->_route, a4);
    v11 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E4F28D48]);
    isoFormatter = v10->_isoFormatter;
    v10->_isoFormatter = v11;
  }
  return v10;
}

- (BOOL)appendLocations:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_isFinished)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 100, @"Export has already finished.");
LABEL_3:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  if (!self->_fileHandle)
  {
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = [(NSURL *)self->_URL path];
    uint64_t v26 = *MEMORY[0x1E4F28370];
    v27[0] = *MEMORY[0x1E4F28348];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v15 createFileAtPath:v16 contents:0 attributes:v17];

    v18 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:self->_URL error:a4];
    fileHandle = self->_fileHandle;
    self->_fileHandle = v18;

    if (!self->_fileHandle || ![(HKGPXExporter *)self _appendGPXHeaderWithError:a4]) {
      goto LABEL_3;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __39__HKGPXExporter_appendLocations_error___block_invoke;
        v20[3] = &unk_1E58C7CF8;
        v20[4] = self;
        v20[5] = v13;
        if (!HKWithAutoreleasePool(a4, v20))
        {
          BOOL v7 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_15:

LABEL_16:
  return v7;
}

uint64_t __39__HKGPXExporter_appendLocations_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) _trackpointEntryForLocation:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 32) _appendString:v4 error:a2];

  return v5;
}

- (BOOL)finishWithError:(id *)a3
{
  if (!self->_fileHandle)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = @"Export has not begun (try calling -[appendLocations:error:] first).";
    goto LABEL_5;
  }
  if (self->_isFinished)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = @"Export has already finished.";
LABEL_5:
    objc_msgSend(v4, "hk_assignError:code:description:", a3, 100, v5);
    return 0;
  }
  BOOL v7 = [(HKGPXExporter *)self _appendString:@"    </trkseg>\n  </trk>\n</gpx>" error:a3];
  [(NSFileHandle *)self->_fileHandle closeFile];
  self->_isFinished = 1;
  return v7;
}

+ (id)fileNameForRoute:(id)a3
{
  v3 = +[HKGPXExporter _displayNameForRoute:a3];
  v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@":" withString:@"."];

  id v6 = [v5 lowercaseString];

  BOOL v7 = [NSString stringWithFormat:@"%@.gpx", v6];

  return v7;
}

+ (id)_displayNameForRoute:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C328]];
  BOOL v7 = [v4 endDate];

  id v8 = [v6 components:124 fromDate:v7];

  uint64_t v9 = [v8 hour];
  uint64_t v10 = @"am";
  if (v9 > 11) {
    uint64_t v10 = @"pm";
  }
  uint64_t v11 = v10;
  if ([v8 hour] && objc_msgSend(v8, "hour") != 12) {
    uint64_t v12 = [v8 hour] % 12;
  }
  else {
    uint64_t v12 = 12;
  }
  uint64_t v13 = [NSString stringWithFormat:@"%ld-%02ld-%02ld %ld:%02ld%@", objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), v12, objc_msgSend(v8, "minute"), v11];

  objc_super v14 = [NSString stringWithFormat:@"Route %@", v13];

  return v14;
}

- (id)_trackpointEntryForLocation:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  id v9 = [NSString alloc];
  [v4 altitude];
  uint64_t v11 = v10;
  isoFormatter = self->_isoFormatter;
  uint64_t v13 = [v4 timestamp];
  objc_super v14 = [(NSISO8601DateFormatter *)isoFormatter stringFromDate:v13];
  [v4 speed];
  uint64_t v16 = v15;
  [v4 course];
  uint64_t v18 = v17;
  [v4 horizontalAccuracy];
  uint64_t v20 = v19;
  [v4 verticalAccuracy];
  uint64_t v22 = v21;

  long long v23 = (void *)[v9 initWithFormat:@"      <trkpt lon=\"%f\" lat=\"%f\"><ele>%f</ele><time>%@</time><extensions><speed>%f</speed><course>%f</course><hAcc>%f</hAcc><vAcc>%f</vAcc></extensions></trkpt>\n", v8, v6, v11, v14, v16, v18, v20, v22];

  return v23;
}

- (BOOL)_appendGPXHeaderWithError:(id *)a3
{
  isoFormatter = self->_isoFormatter;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v7 = [(NSISO8601DateFormatter *)isoFormatter stringFromDate:v6];

  id v8 = [NSString alloc];
  id v9 = +[HKGPXExporter _displayNameForRoute:self->_route];
  uint64_t v10 = (void *)[v8 initWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<gpx version=\"1.1\" creator=\"%@\" xmlns=\"%@\" xmlns:xsi=\"%@\" xsi:schemaLocation=\"%@ %@\">\n  <metadata>\n    <time>%@</time>\n  </metadata>\n  <trk>\n    <name>%@</name>\n    <trkseg>\n", @"Apple Health Export", @"http://www.topografix.com/GPX/1/1", @"http://www.w3.org/2001/XMLSchema-instance", @"http://www.topografix.com/GPX/1/1", @"http://www.topografix.com/GPX/1/1/gpx.xsd", v7, v9];

  LOBYTE(a3) = [(HKGPXExporter *)self _appendString:v10 error:a3];
  return (char)a3;
}

- (BOOL)_appendString:(id)a3 error:(id *)a4
{
  id v6 = [a3 dataUsingEncoding:4];
  LOBYTE(a4) = [(NSFileHandle *)self->_fileHandle writeData:v6 error:a4];

  return (char)a4;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_isoFormatter, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end