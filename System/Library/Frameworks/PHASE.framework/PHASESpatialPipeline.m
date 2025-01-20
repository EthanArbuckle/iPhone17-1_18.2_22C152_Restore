@interface PHASESpatialPipeline
+ (BOOL)addToDictionary:(id)a3 add:(BOOL)a4 key:(id)a5;
+ (PHASESpatialPipeline)new;
- (NSDictionary)entries;
- (PHASESpatialPipeline)init;
- (PHASESpatialPipeline)initWithFlags:(PHASESpatialPipelineFlags)flags;
- (PHASESpatialPipelineFlags)flags;
@end

@implementation PHASESpatialPipeline

- (PHASESpatialPipeline)init
{
  return 0;
}

+ (PHASESpatialPipeline)new
{
  return 0;
}

+ (BOOL)addToDictionary:(id)a3 add:(BOOL)a4 key:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v11 = (PHASESpatialPipelineEntry *)**(id **)(Phase::Logger::GetInstance(v10) + 432);
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315650;
      v16 = "PHASESpatialPipeline.mm";
      __int16 v17 = 1024;
      int v18 = 94;
      __int16 v19 = 2080;
      uint64_t v20 = [v8 UTF8String];
      _os_log_impl(&dword_221E5E000, &v11->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d Dictionary already has entry for key %s.", (uint8_t *)&v15, 0x1Cu);
    }
  }
  else
  {
    if (!v6)
    {
      BOOL v12 = 1;
      goto LABEL_6;
    }
    v11 = objc_alloc_init(PHASESpatialPipelineEntry);
    if (v11)
    {
      [v7 setValue:v11 forKey:v8];
      BOOL v12 = 1;
      goto LABEL_5;
    }
    v14 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315394;
      v16 = "PHASESpatialPipeline.mm";
      __int16 v17 = 1024;
      int v18 = 106;
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASESpatialPipelineEntry:init failed.", (uint8_t *)&v15, 0x12u);
    }
    v11 = 0;
  }
  BOOL v12 = 0;
LABEL_5:

LABEL_6:
  return v12;
}

- (PHASESpatialPipeline)initWithFlags:(PHASESpatialPipelineFlags)flags
{
  v3 = self;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!flags)
  {
    v10 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "PHASESpatialPipeline.mm";
      __int16 v15 = 1024;
      int v16 = 124;
      _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Invalid PHASESpatialPipelineFlags == 0.", buf, 0x12u);
    }
    goto LABEL_11;
  }
  v12.receiver = self;
  v12.super_class = (Class)PHASESpatialPipeline;
  v5 = [(PHASESpatialPipeline *)&v12 init];
  v3 = v5;
  if (v5)
  {
    v5->_flags = flags;
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (+[PHASESpatialPipeline addToDictionary:add:key:](PHASESpatialPipeline, "addToDictionary:add:key:", v6, flags & 1, @"PHASEDirectPathTransmission")&& +[PHASESpatialPipeline addToDictionary:add:key:](PHASESpatialPipeline, "addToDictionary:add:key:", v6, (flags >> 1) & 1, @"PHASEEarlyReflections")&& +[PHASESpatialPipeline addToDictionary:v6 add:(flags >> 2) & 1 key:@"PHASELateReverb"])
    {
      uint64_t v7 = [objc_alloc(NSDictionary) initWithDictionary:v6];
      entries = v3->_entries;
      v3->_entries = (NSDictionary *)v7;

      goto LABEL_7;
    }

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v3 = v3;
  v9 = v3;
LABEL_12:

  return v9;
}

- (PHASESpatialPipelineFlags)flags
{
  return self->_flags;
}

- (NSDictionary)entries
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end