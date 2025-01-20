@interface ASDLogFileOptions
- (ASDLogFileOptions)init;
- (NSString)logDirectoryPath;
- (NSString)logFileBaseName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxNumberOfLogFiles;
- (unint64_t)maxLogFileSize;
- (void)dealloc;
- (void)setLogDirectoryPath:(id)a3;
- (void)setLogFileBaseName:(id)a3;
- (void)setMaxLogFileSize:(unint64_t)a3;
- (void)setMaxNumberOfLogFiles:(int64_t)a3;
@end

@implementation ASDLogFileOptions

- (ASDLogFileOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASDLogFileOptions;
  result = [(ASDLogFileOptions *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_maxSizeInBytes = xmmword_19BFFAE60;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ASDLogFileOptions;
  [(ASDLogFileOptions *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_directoryPath copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_fileName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[4] = self->_maxNumberOfLogFiles;
  v5[3] = self->_maxSizeInBytes;
  return v5;
}

- (NSString)logDirectoryPath
{
  return self->_directoryPath;
}

- (void)setLogDirectoryPath:(id)a3
{
}

- (NSString)logFileBaseName
{
  return self->_fileName;
}

- (void)setLogFileBaseName:(id)a3
{
}

- (unint64_t)maxLogFileSize
{
  return self->_maxSizeInBytes;
}

- (void)setMaxLogFileSize:(unint64_t)a3
{
  self->_maxSizeInBytes = a3;
}

- (int64_t)maxNumberOfLogFiles
{
  return self->_maxNumberOfLogFiles;
}

- (void)setMaxNumberOfLogFiles:(int64_t)a3
{
  self->_maxNumberOfLogFiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end