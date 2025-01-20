@interface PHASEExternalStreamCollection
+ (id)new;
- (NSUUID)uuid;
- (PHASEExternalStreamCollection)init;
- (PHASEExternalStreamCollection)initWithStreamType:(int64_t)a3 count:(unint64_t)a4;
- (int64_t)streamType;
- (unint64_t)streamCount;
@end

@implementation PHASEExternalStreamCollection

- (PHASEExternalStreamCollection)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEExternalStreamCollection)initWithStreamType:(int64_t)a3 count:(unint64_t)a4
{
  v4 = self;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PHASEExternalStreamCollection;
    v7 = [(PHASEExternalStreamCollection *)&v13 init];
    v8 = v7;
    if (v7)
    {
      v7->_streamType = a3;
      v7->_streamCount = a4;
      uuid = v7->_uuid;
      v7->_uuid = 0;
    }
    v4 = v8;
    v10 = v4;
  }
  else
  {
    v11 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "PHASEExternalStream.mm";
      __int16 v16 = 1024;
      int v17 = 64;
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream count in collection, %lu", buf, 0x1Cu);
    }
    v10 = 0;
  }

  return v10;
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = (NSUUID *)objc_opt_new();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }

  return uuid;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (unint64_t)streamCount
{
  return self->_streamCount;
}

- (void).cxx_destruct
{
}

@end