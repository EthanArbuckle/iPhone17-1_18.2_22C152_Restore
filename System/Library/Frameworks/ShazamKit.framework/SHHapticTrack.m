@interface SHHapticTrack
+ (BOOL)supportsSecureCoding;
- (NSData)hapticData;
- (NSFileManager)fileManager;
- (NSString)algorithm;
- (NSString)fileIdentifier;
- (NSURL)fileURL;
- (SHHapticTrack)initWithCoder:(id)a3;
- (SHHapticTrack)initWithFileIdentifier:(id)a3 hapticData:(id)a4 algorithm:(id)a5;
- (id)destinationURLForHapticFile;
- (id)hapticFileURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHHapticTrack

- (SHHapticTrack)initWithFileIdentifier:(id)a3 hapticData:(id)a4 algorithm:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHHapticTrack;
  v12 = [(SHHapticTrack *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileIdentifier, a3);
    objc_storeStrong((id *)&v13->_hapticData, a4);
    objc_storeStrong((id *)&v13->_algorithm, a5);
  }

  return v13;
}

- (NSURL)fileURL
{
  fileURL = self->_fileURL;
  if (!fileURL)
  {
    v4 = [(SHHapticTrack *)self hapticFileURL];
    v5 = self->_fileURL;
    self->_fileURL = v4;

    fileURL = self->_fileURL;
  }

  return fileURL;
}

- (NSFileManager)fileManager
{
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    v4 = [MEMORY[0x263F08850] defaultManager];
    v5 = self->_fileManager;
    self->_fileManager = v4;

    fileManager = self->_fileManager;
  }

  return fileManager;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHHapticTrack)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHHapticItemFileIdentifierKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHHapticItemHapticDataKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHHapticItemAlgorithmKey"];

  v8 = [(SHHapticTrack *)self initWithFileIdentifier:v5 hapticData:v6 algorithm:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SHHapticTrack *)self fileIdentifier];
  [v4 encodeObject:v5 forKey:@"SHHapticItemFileIdentifierKey"];

  v6 = [(SHHapticTrack *)self hapticData];
  [v4 encodeObject:v6 forKey:@"SHHapticItemHapticDataKey"];

  id v7 = [(SHHapticTrack *)self algorithm];
  [v4 encodeObject:v7 forKey:@"SHHapticItemAlgorithmKey"];
}

- (id)hapticFileURL
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(SHHapticTrack *)self destinationURLForHapticFile];
  if (v3)
  {
    id v4 = [(SHHapticTrack *)self fileManager];
    v5 = [v3 path];
    if ([v4 fileExistsAtPath:v5])
    {
      v6 = [(SHHapticTrack *)self fileManager];
      char v7 = [v6 removeItemAtURL:v3 error:0];

      if ((v7 & 1) == 0)
      {
        v8 = sh_log_object();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          v19 = v3;
          _os_log_impl(&dword_224B4B000, v8, OS_LOG_TYPE_INFO, "Returning existing ahap url %@", (uint8_t *)&v18, 0xCu);
        }

        goto LABEL_12;
      }
    }
    else
    {
    }
    id v11 = [(SHHapticTrack *)self fileManager];
    v12 = [v3 path];
    v13 = [(SHHapticTrack *)self hapticData];
    char v14 = [v11 createFileAtPath:v12 contents:v13 attributes:0];

    if (v14)
    {
LABEL_12:
      id v15 = v3;
      goto LABEL_17;
    }
    v16 = sh_log_object();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_224B4B000, v16, OS_LOG_TYPE_ERROR, "Failed to copy haptic file from source bundle to destination.", (uint8_t *)&v18, 2u);
    }
  }
  else
  {
    id v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [(SHHapticTrack *)self fileIdentifier];
      int v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_224B4B000, v9, OS_LOG_TYPE_DEBUG, "Could not create file path to save haptic file with identifier %@", (uint8_t *)&v18, 0xCu);
    }
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (id)destinationURLForHapticFile
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(SHHapticTrack *)self fileManager];
  id v4 = [v3 temporaryDirectory];
  v5 = [v4 URLByAppendingPathComponent:@"MusicHaptics"];

  v6 = [(SHHapticTrack *)self fileManager];
  char v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [(SHHapticTrack *)self fileManager];
    id v21 = 0;
    char v10 = [v9 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v11 = v21;

    if ((v10 & 1) == 0)
    {
      v12 = sh_log_object();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v11;
        _os_log_impl(&dword_224B4B000, v12, OS_LOG_TYPE_ERROR, "Could not create folder for haptic files, using temporary directory %@", buf, 0xCu);
      }

      v13 = [(SHHapticTrack *)self fileManager];
      uint64_t v14 = [v13 temporaryDirectory];

      v5 = (void *)v14;
    }
  }
  id v15 = NSString;
  v16 = [(SHHapticTrack *)self fileIdentifier];
  v17 = [(SHHapticTrack *)self algorithm];
  int v18 = [v15 stringWithFormat:@"%@_%@", v16, v17];

  v19 = [v5 URLByAppendingPathComponent:v18 conformingToType:*MEMORY[0x263F1D948]];

  return v19;
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (NSString)fileIdentifier
{
  return self->_fileIdentifier;
}

- (NSData)hapticData
{
  return self->_hapticData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticData, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end