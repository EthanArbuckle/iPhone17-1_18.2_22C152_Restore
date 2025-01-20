@interface AXLTTranscribedData
+ (BOOL)supportsSecureCoding;
- (AXLTTranscribedData)initWithCoder:(id)a3;
- (AXLTTranscribedData)initWithTranscribedText:(id)a3 requestType:(int64_t)a4 timestamp:(id)a5 pid:(int)a6 appID:(id)a7 appName:(id)a8 downloadProgress:(int64_t)a9 silence:(BOOL)a10;
- (AXLTTranscribedData)initWithTranscription:(id)a3 requestType:(int64_t)a4 timestamp:(id)a5 pid:(int)a6 appID:(id)a7 appName:(id)a8 downloadProgress:(int64_t)a9 silence:(BOOL)a10;
- (AXLTTranscription)transcription;
- (BOOL)isSilence;
- (NSArray)nonUpdatingSegments;
- (NSDate)timestamp;
- (NSString)appID;
- (NSString)appName;
- (NSString)transcribedText;
- (int)pid;
- (int64_t)downloadProgress;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppName:(id)a3;
- (void)setDownloadProgress:(int64_t)a3;
- (void)setNonUpdatingSegments:(id)a3;
- (void)setPid:(int)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setSilence:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setTranscribedText:(id)a3;
- (void)setTranscription:(id)a3;
@end

@implementation AXLTTranscribedData

- (AXLTTranscribedData)initWithTranscription:(id)a3 requestType:(int64_t)a4 timestamp:(id)a5 pid:(int)a6 appID:(id)a7 appName:(id)a8 downloadProgress:(int64_t)a9 silence:(BOOL)a10
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v29 = a8;
  v30.receiver = self;
  v30.super_class = (Class)AXLTTranscribedData;
  v20 = [(AXLTTranscribedData *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_transcription, a3);
    uint64_t v22 = [v17 nonUpdatingSegments];
    nonUpdatingSegments = v21->_nonUpdatingSegments;
    v21->_nonUpdatingSegments = (NSArray *)v22;

    v21->_requestType = a4;
    v21->_pid = a6;
    objc_storeStrong((id *)&v21->_timestamp, a5);
    objc_storeStrong((id *)&v21->_appID, a7);
    objc_storeStrong((id *)&v21->_appName, a8);
    v21->_downloadProgress = a9;
    v21->_silence = a10;
    if (!v17)
    {
      transcribedText = v21->_transcribedText;
      v21->_transcribedText = (NSString *)&stru_26EFE42D0;
    }
    v25 = [(AXLTTranscribedData *)v21 transcription];
    uint64_t v26 = [v25 formattedString];
    v27 = v21->_transcribedText;
    v21->_transcribedText = (NSString *)v26;
  }
  return v21;
}

- (AXLTTranscribedData)initWithTranscribedText:(id)a3 requestType:(int64_t)a4 timestamp:(id)a5 pid:(int)a6 appID:(id)a7 appName:(id)a8 downloadProgress:(int64_t)a9 silence:(BOOL)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)AXLTTranscribedData;
  v20 = [(AXLTTranscribedData *)&v25 init];
  v21 = v20;
  if (v20)
  {
    transcription = v20->_transcription;
    v20->_transcription = 0;

    objc_storeStrong((id *)&v21->_transcribedText, a3);
    v21->_requestType = a4;
    v21->_pid = a6;
    objc_storeStrong((id *)&v21->_timestamp, a5);
    objc_storeStrong((id *)&v21->_appID, a7);
    objc_storeStrong((id *)&v21->_appName, a8);
    v21->_downloadProgress = a9;
    v21->_silence = a10;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(AXLTTranscribedData *)self transcription];
  [v9 encodeObject:v4 forKey:@"AXLTTranscribedDataTranscriptionKey"];

  v5 = [(AXLTTranscribedData *)self transcribedText];
  [v9 encodeObject:v5 forKey:@"AXLTTranscribedDataTranscribedTextKey"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[AXLTTranscribedData requestType](self, "requestType"), @"AXLTTranscribedDataRequestTypeKey");
  objc_msgSend(v9, "encodeInt:forKey:", -[AXLTTranscribedData pid](self, "pid"), @"AXLTTranscribedDataPIDKey");
  v6 = [(AXLTTranscribedData *)self timestamp];
  [v9 encodeObject:v6 forKey:@"AXLTTranscribedDataTimestampKey"];

  v7 = [(AXLTTranscribedData *)self appID];
  [v9 encodeObject:v7 forKey:@"AXLTTranscribedDataAppIDKey"];

  v8 = [(AXLTTranscribedData *)self appName];
  [v9 encodeObject:v8 forKey:@"AXLTTranscribedDataAppNameKey"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[AXLTTranscribedData downloadProgress](self, "downloadProgress"), @"AXLTTranscribedDataDownloadProgressKey");
  objc_msgSend(v9, "encodeBool:forKey:", -[AXLTTranscribedData isSilence](self, "isSilence"), @"AXLTTranscribedDataIsSilenceKey");
}

- (AXLTTranscribedData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXLTTranscribedData *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXLTTranscribedDataTranscriptionKey"];
    transcription = v5->_transcription;
    v5->_transcription = (AXLTTranscription *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXLTTranscribedDataTranscribedTextKey"];
    transcribedText = v5->_transcribedText;
    v5->_transcribedText = (NSString *)v8;

    v5->_requestType = [v4 decodeIntegerForKey:@"AXLTTranscribedDataRequestTypeKey"];
    v5->_pid = [v4 decodeIntForKey:@"AXLTTranscribedDataPIDKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXLTTranscribedDataTimestampKey"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXLTTranscribedDataAppIDKey"];
    appID = v5->_appID;
    v5->_appID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXLTTranscribedDataAppNameKey"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v14;

    v5->_downloadProgress = [v4 decodeIntegerForKey:@"AXLTTranscribedDataDownloadProgressKey"];
    v5->_silence = [v4 decodeBoolForKey:@"AXLTTranscribedDataIsSilenceKey"];
  }

  return v5;
}

- (AXLTTranscription)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (NSArray)nonUpdatingSegments
{
  return self->_nonUpdatingSegments;
}

- (void)setNonUpdatingSegments:(id)a3
{
}

- (NSString)transcribedText
{
  return self->_transcribedText;
}

- (void)setTranscribedText:(id)a3
{
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (int64_t)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(int64_t)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)isSilence
{
  return self->_silence;
}

- (void)setSilence:(BOOL)a3
{
  self->_silence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_transcribedText, 0);
  objc_storeStrong((id *)&self->_nonUpdatingSegments, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
}

@end