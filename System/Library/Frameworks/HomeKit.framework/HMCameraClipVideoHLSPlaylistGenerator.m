@interface HMCameraClipVideoHLSPlaylistGenerator
+ (id)_hlsPlaylistEncryptionMethodNameForScheme:(unint64_t)a3;
- (HMCameraClipVideoHLSPlaylistGenerator)initWithClip:(id)a3 url:(id)a4;
- (NSData)hlsPlaylist;
- (NSMutableString)hlsPlaylistString;
- (NSURL)url;
- (void)addSegment:(id)a3;
- (void)addSegments:(id)a3;
- (void)finish;
@end

@implementation HMCameraClipVideoHLSPlaylistGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_hlsPlaylistString, 0);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableString)hlsPlaylistString
{
  return (NSMutableString *)objc_getProperty(self, a2, 8, 1);
}

- (void)finish
{
  id v2 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
  [v2 appendString:@"#EXT-X-ENDLIST\n"];
}

- (void)addSegments:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HMCameraClipVideoHLSPlaylistGenerator *)self addSegment:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addSegment:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
    uint64_t v8 = [(HMCameraClipVideoHLSPlaylistGenerator *)self url];
    long long v9 = [v8 absoluteString];
    [v7 appendFormat:@"#EXT-X-MAP:URI=\"%@\",", v9];

    id v10 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
    objc_msgSend(v10, "appendFormat:", @"BYTERANGE=\"%llu@%llu\"\n", objc_msgSend(v6, "byteLength"), objc_msgSend(v6, "byteOffset"));
  }
  else
  {
    id v11 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v12 = v11;
    }
    else {
      long long v12 = 0;
    }
    id v10 = v12;

    if (v10)
    {
      v13 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
      [v10 duration];
      objc_msgSend(v13, "appendFormat:", @"#EXTINF:%.6f,\n", v14);

      v15 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
      objc_msgSend(v15, "appendFormat:", @"#EXT-X-BYTERANGE:%llu@%llu\n", objc_msgSend(v10, "byteLength"), objc_msgSend(v10, "byteOffset"));

      v16 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
      v17 = [(HMCameraClipVideoHLSPlaylistGenerator *)self url];
      v18 = [v17 absoluteString];
      [v16 appendFormat:@"%@\n", v18];
    }
    else
    {
      v19 = (void *)MEMORY[0x19F3A64A0]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v24 = v22;
        __int16 v25 = 2112;
        id v26 = v11;
        __int16 v27 = 2112;
        uint64_t v28 = objc_opt_class();
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unknown segment type: %@ (%@)", buf, 0x20u);
      }
    }
  }
}

- (NSData)hlsPlaylist
{
  id v2 = [(HMCameraClipVideoHLSPlaylistGenerator *)self hlsPlaylistString];
  v3 = [v2 dataUsingEncoding:4];

  return (NSData *)v3;
}

- (HMCameraClipVideoHLSPlaylistGenerator)initWithClip:(id)a3 url:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HMCameraClipVideoHLSPlaylistGenerator;
  uint64_t v8 = [(HMCameraClipVideoHLSPlaylistGenerator *)&v27 init];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [MEMORY[0x1E4F28E78] string];
  hlsPlaylistString = v8->_hlsPlaylistString;
  v8->_hlsPlaylistString = (NSMutableString *)v9;

  objc_storeStrong((id *)&v8->_url, a4);
  [(NSMutableString *)v8->_hlsPlaylistString appendString:@"#EXTM3U\n"];
  [(NSMutableString *)v8->_hlsPlaylistString appendFormat:@"#EXT-X-VERSION:%u\n", 7];
  id v11 = v8->_hlsPlaylistString;
  [v6 targetFragmentDuration];
  [(NSMutableString *)v11 appendFormat:@"#EXT-X-TARGETDURATION:%u\n", v12];
  v13 = v8->_hlsPlaylistString;
  int v14 = [v6 isComplete];
  v15 = @"EVENT";
  if (v14) {
    v15 = @"VOD";
  }
  [(NSMutableString *)v13 appendFormat:@"#EXT-X-PLAYLIST-TYPE:%@\n", v15];
  [(NSMutableString *)v8->_hlsPlaylistString appendString:@"#EXT-X-INDEPENDENT-SEGMENTS\n"];
  v16 = objc_opt_class();
  v17 = [v6 encryptionContext];
  v18 = objc_msgSend(v16, "_hlsPlaylistEncryptionMethodNameForScheme:", objc_msgSend(v17, "scheme"));

  if (v18)
  {
    [(NSMutableString *)v8->_hlsPlaylistString appendFormat:@"#EXT-X-KEY:METHOD=%@", v18];
    [(NSMutableString *)v8->_hlsPlaylistString appendFormat:@",URI=\"%@\"\n", @"HMCC://encryptionKey"];

LABEL_6:
    v19 = v8;
    goto LABEL_10;
  }
  v20 = (void *)MEMORY[0x19F3A64A0]();
  v21 = v8;
  v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    v24 = [v6 encryptionContext];
    uint64_t v25 = [v24 scheme];
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = v25;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not determine HLS playlist encryption method name for scheme: %lu", buf, 0x16u);
  }
  v19 = 0;
LABEL_10:

  return v19;
}

+ (id)_hlsPlaylistEncryptionMethodNameForScheme:(unint64_t)a3
{
  if (a3 == 1) {
    return @"AES-256-GCM";
  }
  else {
    return 0;
  }
}

@end