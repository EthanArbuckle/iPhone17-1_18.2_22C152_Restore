@interface BMDSLStreamPublisher
+ (BOOL)isStreamIdentifierValid:(id)a3;
+ (BOOL)isStreamInfoValidForIdentifier:(id)a3 basePath:(id)a4 streamType:(unint64_t)a5;
+ (BOOL)isStreamTypeInValidRange:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)name;
+ (unint64_t)streamTypeForDSLType:(unint64_t)a3;
- (BMBookmark)bookmark;
- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6 streamType:(unint64_t)a7 basePath:(id)a8;
- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6 streamType:(unint64_t)a7 basePath:(id)a8 eventDataClass:(Class)a9 useCase:(id)a10;
- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 privateStreamBasePath:(id)a5;
- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 privateStreamBasePath:(id)a5 eventDataClass:(Class)a6;
- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 streamType:(unint64_t)a5;
- (BMDSLStreamPublisher)initWithCoder:(id)a3;
- (BMDSLStreamPublisher)initWithDictionary:(id)a3 error:(id *)a4;
- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4;
- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 eventDataClass:(Class)a5;
- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 useCase:(id)a5;
- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 useCase:(id)a5 eventDataClass:(Class)a6;
- (BMDSLStreamPublisher)initWithPublisher:(id)a3 identifier:(id)a4 streamType:(unint64_t)a5;
- (Class)eventDataClass;
- (NSArray)backingEvents;
- (NSNumber)bookmarkingTime;
- (NSString)basePath;
- (NSString)identifier;
- (NSString)useCase;
- (double)startTime;
- (id)bpsPublisher;
- (id)initRestrictedStreamWithBookmark:(id)a3 identifier:(id)a4;
- (id)initRestrictedStreamWithPublisher:(id)a3 identifier:(id)a4;
- (id)storeStream;
- (id)upstreams;
- (unint64_t)streamType;
- (void)bpsPublisher;
- (void)encodeWithCoder:(id)a3;
- (void)setBackingEvents:(id)a3;
- (void)setBookmarkingTime:(id)a3;
- (void)storeStream;
@end

@implementation BMDSLStreamPublisher

- (id)bpsPublisher
{
  uint64_t v3 = +[BMDSLStreamPublisher streamTypeForDSLType:[(BMDSLStreamPublisher *)self streamType]];
  v4 = [MEMORY[0x1E4F4FA38] currentProcessValidator];
  if ([v4 passthrough])
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(BMDSLStreamPublisher *)self bpsPublisher];
    }

LABEL_6:
    v8 = [(BMDSLStreamPublisher *)self storeStream];
    v9 = [(BMDSLStreamPublisher *)self backingEvents];

    if (v9)
    {
      v10 = [(BMDSLStreamPublisher *)self backingEvents];
      v11 = [v10 bpsPublisher];
    }
    else
    {
      v12 = [(BMDSLStreamPublisher *)self bookmarkingTime];

      if (!v12)
      {
        v11 = [v8 publisherFromStartTime:0.0];
        goto LABEL_11;
      }
      v10 = [(BMDSLStreamPublisher *)self bookmarkingTime];
      v13 = [(BMDSLStreamPublisher *)self bookmarkingTime];
      v11 = [v8 publisherWithStartTime:v10 endTime:v13 maxEvents:0 lastN:0 reversed:0];
    }
LABEL_11:
    int v14 = BPSPipelineSupportsPullBasedPublishers();
    v15 = [(BMDSLStreamPublisher *)self bookmark];
    if (v14)
    {
      [v11 applyBookmarkNode:v15];

      id v16 = v11;
    }
    else
    {
      id v16 = [v11 withBookmark:v15];
    }
    goto LABEL_18;
  }
  v6 = [MEMORY[0x1E4F4FA38] currentProcessValidator];
  char v7 = [v6 isStreamTypeAllowed:v3];

  if (v7) {
    goto LABEL_6;
  }
  v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(BMDSLStreamPublisher *)self bpsPublisher];
  }
  id v16 = 0;
LABEL_18:

  return v16;
}

- (NSNumber)bookmarkingTime
{
  return self->_bookmarkingTime;
}

- (BMBookmark)bookmark
{
  return self->_bookmark;
}

- (NSArray)backingEvents
{
  return self->_backingEvents;
}

- (id)storeStream
{
  uint64_t v3 = objc_opt_class();
  v4 = [(BMDSLStreamPublisher *)self identifier];
  v5 = [(BMDSLStreamPublisher *)self basePath];
  LODWORD(v3) = objc_msgSend(v3, "isStreamInfoValidForIdentifier:basePath:streamType:", v4, v5, -[BMDSLStreamPublisher streamType](self, "streamType"));

  if (v3)
  {
    if ([(BMDSLStreamPublisher *)self streamType] == 2)
    {
      v6 = [(BMDSLStreamPublisher *)self identifier];
      char v7 = [v6 componentsSeparatedByString:@":"];
      v8 = [v7 firstObject];

      v9 = BiomeLibraryAndInternalLibraryNode();
      v10 = [v9 streamWithIdentifier:v8 error:0];

      if (v10)
      {
        v11 = [(BMDSLStreamPublisher *)self identifier];
        int v12 = [v11 hasSuffix:@":subscriptions"];

        if (v12)
        {
          v13 = __biome_log_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18E67D000, v13, OS_LOG_TYPE_DEFAULT, "Returning subscriptionStoreStreamForUseCase", buf, 2u);
          }

          if (self->_useCase) {
            useCase = self->_useCase;
          }
          else {
            useCase = (NSString *)*MEMORY[0x1E4F4FAF8];
          }
          uint64_t v15 = [v10 subscriptionStoreStreamForUseCase:useCase];
        }
        else
        {
          v29 = [(BMDSLStreamPublisher *)self identifier];
          int v30 = [v29 hasSuffix:@":tombstones"];

          if (v30)
          {
            v31 = __biome_log_for_category();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v47 = 0;
              _os_log_impl(&dword_18E67D000, v31, OS_LOG_TYPE_DEFAULT, "Returning tombstoneStoreStreamForUseCase", v47, 2u);
            }

            if (self->_useCase) {
              v32 = self->_useCase;
            }
            else {
              v32 = (NSString *)*MEMORY[0x1E4F4FAF8];
            }
            uint64_t v15 = [v10 tombstoneStoreStreamForUseCase:v32];
          }
          else
          {
            v33 = [v10 configuration];
            int v34 = objc_msgSend((id)objc_msgSend(v33, "eventClass"), "isEqual:", -[BMDSLStreamPublisher eventDataClass](self, "eventDataClass"));

            if ((v34 & 1) == 0)
            {
              v37 = (void *)MEMORY[0x1E4F4FBA8];
              v38 = [(BMDSLStreamPublisher *)self identifier];
              v39 = [v37 legacyClassNameForLibraryStream:v38];

              if (!v39 || (Class v40 = NSClassFromString(v39)) == 0)
              {
                v41 = [v10 configuration];
                Class v40 = (Class)[v41 eventClass];

                if (!v40)
                {
                  v42 = __biome_log_for_category();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
                    [(BMDSLStreamPublisher *)self storeStream];
                  }

                  Class v40 = 0;
                }
              }
              v43 = [BMStoreStream alloc];
              v44 = [(BMDSLStreamPublisher *)self identifier];
              v45 = [v10 configuration];
              v46 = [v45 storeConfig];
              v20 = [(BMStoreStream *)v43 initWithRestrictedStreamIdentifier:v44 storeConfig:v46 eventDataClass:v40];

              goto LABEL_34;
            }
            if (self->_useCase) {
              v35 = self->_useCase;
            }
            else {
              v35 = (NSString *)*MEMORY[0x1E4F4FAF8];
            }
            uint64_t v15 = [v10 _storeStreamForUseCase:v35];
          }
        }
        v20 = (BMStoreStream *)v15;
LABEL_34:

        goto LABEL_35;
      }
    }
    unint64_t v16 = [(BMDSLStreamPublisher *)self streamType];
    switch(v16)
    {
      case 3uLL:
        v21 = (void *)MEMORY[0x1E4F50278];
        v22 = [(BMDSLStreamPublisher *)self basePath];
        v8 = (void *)[v21 newPrivateStreamDefaultConfigurationWithStoreBasePath:v22];

        v23 = [BMStoreStream alloc];
        v24 = [(BMDSLStreamPublisher *)self identifier];
        v20 = [(BMStoreStream *)v23 initWithPrivateStreamIdentifier:v24 storeConfig:v8 eventDataClass:[(BMDSLStreamPublisher *)self eventDataClass]];

LABEL_35:
        goto LABEL_40;
      case 2uLL:
        v25 = [BMStoreStream alloc];
        v26 = [(BMDSLStreamPublisher *)self identifier];
        v27 = (void *)[MEMORY[0x1E4F50278] newRestrictedStreamDefaultConfigurationWithProtectionClass:3];
        v20 = [(BMStoreStream *)v25 initWithRestrictedStreamIdentifier:v26 storeConfig:v27 eventDataClass:[(BMDSLStreamPublisher *)self eventDataClass]];

        goto LABEL_40;
      case 1uLL:
        v17 = (void *)MEMORY[0x1E4F4FB88];
        v18 = [(BMDSLStreamPublisher *)self identifier];
        uint64_t v19 = [v17 streamForStreamIdentifier:v18];

        if (v19)
        {
          v20 = [[BMStoreStream alloc] initWithPublicStream:v19];
          goto LABEL_40;
        }
        v28 = __biome_log_for_category();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          [(BMDSLStreamPublisher *)self storeStream];
        }
        break;
      default:
        v28 = __biome_log_for_category();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          [(BMDSLStreamPublisher *)self storeStream];
        }
        break;
    }
  }
  v20 = 0;
LABEL_40:

  return v20;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)streamType
{
  return self->_streamType;
}

- (NSString)basePath
{
  return self->_basePath;
}

+ (unint64_t)streamTypeForDSLType:(unint64_t)a3
{
  if (a3 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (BOOL)isStreamInfoValidForIdentifier:(id)a3 basePath:(id)a4 streamType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(id)objc_opt_class() isStreamTypeInValidRange:a5])
  {
    if ([(id)objc_opt_class() isStreamIdentifierValid:v7])
    {
      if (!v8 || a5 == 3)
      {
        if (!v8
          || (uint64_t v12 = [MEMORY[0x1E4F50278] streamTypeFromStorePath:v8],
              v12 == [(id)objc_opt_class() streamTypeForDSLType:a5]))
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
        v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:]();
        }
      }
      else
      {
        v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:]();
        }
      }
    }
    else
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:]();
      }
    }
  }
  else
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[BMDSLStreamPublisher isStreamInfoValidForIdentifier:basePath:streamType:].cold.4();
    }
  }

  BOOL v10 = 0;
LABEL_12:

  return v10;
}

+ (BOOL)isStreamTypeInValidRange:(unint64_t)a3
{
  return (a3 < 4) & (0xEu >> (a3 & 0xF));
}

+ (BOOL)isStreamIdentifierValid:(id)a3
{
  return BMIdentifierIsPathSafe();
}

- (Class)eventDataClass
{
  return self->_eventDataClass;
}

+ (id)name
{
  return @"streamPublisher";
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4
{
  return [(BMDSLStreamPublisher *)self initWithIdentifier:a3 streamType:a4 eventDataClass:0];
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 eventDataClass:(Class)a5
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:0 identifier:a3 name:@"streamPublisher" version:1 streamType:a4 basePath:0 eventDataClass:a5 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 useCase:(id)a5
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:0 identifier:a3 name:@"streamPublisher" version:1 streamType:a4 basePath:0 eventDataClass:0 useCase:a5];
}

- (BMDSLStreamPublisher)initWithIdentifier:(id)a3 streamType:(unint64_t)a4 useCase:(id)a5 eventDataClass:(Class)a6
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:0 identifier:a3 name:@"streamPublisher" version:1 streamType:a4 basePath:0 eventDataClass:a6 useCase:a5];
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 streamType:(unint64_t)a5
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:a3 identifier:a4 name:@"streamPublisher" version:1 streamType:a5 basePath:0 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 privateStreamBasePath:(id)a5
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:a3 identifier:a4 privateStreamBasePath:a5 eventDataClass:0];
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 privateStreamBasePath:(id)a5 eventDataClass:(Class)a6
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:a3 identifier:a4 name:@"streamPublisher" version:1 streamType:3 basePath:a5 eventDataClass:a6 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6 streamType:(unint64_t)a7 basePath:(id)a8
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:a3 identifier:a4 name:a5 version:*(void *)&a6 streamType:a7 basePath:a8 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMDSLStreamPublisher)initWithBookmark:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6 streamType:(unint64_t)a7 basePath:(id)a8 eventDataClass:(Class)a9 useCase:(id)a10
{
  id v25 = a3;
  id v17 = a4;
  id v18 = a8;
  id v24 = a10;
  if (a6 != 1)
  {
    v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[BMDSLStreamPublisher initWithBookmark:identifier:name:version:streamType:basePath:eventDataClass:useCase:](a6, v22);
    }

    goto LABEL_10;
  }
  v26.receiver = self;
  v26.super_class = (Class)BMDSLStreamPublisher;
  uint64_t v19 = -[BMDSLBaseCodable initWithName:version:](&v26, sel_initWithName_version_, a5, 1, v24);
  self = v19;
  if (v19)
  {
    v20 = a9;
    objc_storeStrong((id *)&v19->_bookmark, a3);
    objc_storeStrong((id *)&self->_identifier, a4);
    self->_streamType = a7;
    objc_storeStrong((id *)&self->_basePath, a8);
    if (!a9) {
      v20 = BMEventClassForStreamIdentifier(v17);
    }
    objc_storeStrong((id *)&self->_eventDataClass, v20);
    objc_storeStrong((id *)&self->_useCase, a10);
    if (![(id)objc_opt_class() isStreamInfoValidForIdentifier:v17 basePath:v18 streamType:a7])
    {
LABEL_10:
      v21 = 0;
      goto LABEL_11;
    }
  }
  self = self;
  v21 = self;
LABEL_11:

  return v21;
}

- (BMDSLStreamPublisher)initWithPublisher:(id)a3 identifier:(id)a4 streamType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  id v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__BMDSLStreamPublisher_initWithPublisher_identifier_streamType___block_invoke;
  v13[3] = &unk_1E55D7048;
  v13[4] = &v14;
  id v10 = (id)[v8 sinkWithBookmark:0 completion:v13 receiveInput:&__block_literal_global_36];
  v11 = [(BMDSLStreamPublisher *)self initWithBookmark:v15[5] identifier:v9 streamType:a5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __64__BMDSLStreamPublisher_initWithPublisher_identifier_streamType___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (BMDSLStreamPublisher)initWithDictionary:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = @"streamIdentifier";
  v25[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v8 = BMDSLValidateDictionary();

  if (!v8)
  {
    id v10 = [v6 objectForKeyedSubscript:@"streamIdentifier"];
    v11 = [MEMORY[0x1E4F4FB88] libraryPublicStreamMigrationPaths];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];

    uint64_t v13 = [v6 objectForKeyedSubscript:@"streamType"];
    if (v13
      && (uint64_t v14 = (void *)v13,
          [v6 objectForKeyedSubscript:@"streamType"],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          v14,
          (isKindOfClass & 1) != 0))
    {
      id v17 = [v6 objectForKeyedSubscript:@"streamType"];
      uint64_t v18 = [v17 unsignedIntegerValue];
    }
    else
    {
      if (v12)
      {
        id v19 = [MEMORY[0x1E4F4FBA8] legacyClassNameForLibraryStream:v12];
        id v17 = v19;
        if (v19) {
          Class v20 = NSClassFromString(v19);
        }
        else {
          Class v20 = 0;
        }
        uint64_t v18 = 1;
        goto LABEL_17;
      }
      v21 = BiomeLibraryAndInternalLibraryNode();
      id v17 = [v21 streamWithIdentifier:v10 error:0];

      if (v17)
      {
        v22 = [v17 configuration];
        Class v20 = (Class)[v22 eventClass];

        uint64_t v18 = 2;
LABEL_17:

        self = [(BMDSLStreamPublisher *)self initWithIdentifier:v10 streamType:v18 eventDataClass:v20];
        id v9 = self;
        goto LABEL_18;
      }
      uint64_t v18 = 0;
    }
    Class v20 = 0;
    goto LABEL_17;
  }
  id v9 = 0;
  if (a4) {
    *a4 = v8;
  }
LABEL_18:

  return v9;
}

- (id)initRestrictedStreamWithBookmark:(id)a3 identifier:(id)a4
{
  return [(BMDSLStreamPublisher *)self initWithBookmark:a3 identifier:a4 streamType:2];
}

- (id)initRestrictedStreamWithPublisher:(id)a3 identifier:(id)a4
{
  return [(BMDSLStreamPublisher *)self initWithPublisher:a3 identifier:a4 streamType:2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)upstreams
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMDSLStreamPublisher;
  [(BMDSLBaseCodable *)&v14 encodeWithCoder:v4];
  v5 = [(BMDSLStreamPublisher *)self bookmark];

  if (v5)
  {
    id v6 = [(BMDSLStreamPublisher *)self bookmark];
    [v4 encodeObject:v6 forKey:@"bookmark"];
  }
  id v7 = [(BMDSLStreamPublisher *)self identifier];
  [v4 encodeObject:v7 forKey:@"streamIdentifier"];

  id v8 = [(BMDSLStreamPublisher *)self basePath];

  if (v8)
  {
    id v9 = [(BMDSLStreamPublisher *)self basePath];
    [v4 encodeObject:v9 forKey:@"basePath"];
  }
  if ([(BMDSLStreamPublisher *)self eventDataClass])
  {
    id v10 = NSStringFromClass([(BMDSLStreamPublisher *)self eventDataClass]);
    [v4 encodeObject:v10 forKey:@"eventDataClass"];
  }
  v11 = [(BMDSLStreamPublisher *)self useCase];

  if (v11)
  {
    uint64_t v12 = [(BMDSLStreamPublisher *)self useCase];
    [v4 encodeObject:v12 forKey:@"useCase"];
  }
  uint64_t v13 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", -[BMDSLStreamPublisher streamType](self, "streamType"));
  [v4 encodeObject:v13 forKey:@"streamType"];
}

- (BMDSLStreamPublisher)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BMDSLStreamPublisher;
  v5 = [(BMDSLBaseCodable *)&v20 initWithCoder:v4];
  if (!v5)
  {
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  id v6 = v5;
  uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmark"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamIdentifier"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamType"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"basePath"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDataClass"];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F4FA38] currentProcessValidator];
    id v12 = (id)[v11 eventClassForString:v10];
  }
  else
  {
    id v12 = BMEventClassForStreamIdentifier(v7);
    if (v12) {
      goto LABEL_7;
    }
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMDSLStreamPublisher initWithCoder:]();
    }
    id v12 = 0;
  }

LABEL_7:
  objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCase"];
  uint64_t v15 = [v8 integerValue];
  if ([(id)objc_opt_class() isStreamInfoValidForIdentifier:v7 basePath:v9 streamType:v15])
  {
    uint64_t v16 = [(BMDSLBaseCodable *)v6 name];
    id v6 = [(BMDSLStreamPublisher *)v6 initWithBookmark:v19 identifier:v7 name:v16 version:[(BMDSLBaseCodable *)v6 version] streamType:v15 basePath:v9 eventDataClass:v12 useCase:v14];

    id v17 = (void *)v19;
    uint64_t v13 = v6;
  }
  else
  {
    uint64_t v13 = 0;
    id v17 = (void *)v19;
  }

LABEL_11:
  return v13;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setBackingEvents:(id)a3
{
}

- (void)setBookmarkingTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkingTime, 0);
  objc_storeStrong((id *)&self->_backingEvents, 0);
  objc_storeStrong((id *)&self->_eventDataClass, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_bookmark, 0);
}

- (void)initWithBookmark:(int)a1 identifier:(NSObject *)a2 name:version:streamType:basePath:eventDataClass:useCase:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLStreamPublisher", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMDSLStreamPublisher: Unable to determine data class for stream identifier: %@", v1, 0xCu);
}

- (void)storeStream
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 identifier];
  id v7 = [a2 configuration];
  id v8 = NSStringFromClass((Class)[v7 eventClass]);
  id v9 = NSStringFromClass((Class)[a1 eventDataClass]);
  int v10 = 138412802;
  v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_fault_impl(&dword_18E67D000, a3, OS_LOG_TYPE_FAULT, "Failed to determine class in BMDSLStreamPublisher for restricted stream %@, stream.configuration.eventClass: %@, self.eventClass: %@", (uint8_t *)&v10, 0x20u);
}

- (void)bpsPublisher
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = [a1 identifier];
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_18E67D000, a3, OS_LOG_TYPE_ERROR, "BMDSLStreamPublisher could not create a BPSPublisher for stream %@ because the stream type %@ is not allowed", v7, 0x16u);
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_6(&dword_18E67D000, v0, v1, "Base path not supported for non-private stream: %@", v2, v3, v4, v5, v6);
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_18E67D000, v1, OS_LOG_TYPE_FAULT, "Path: %@ does not match stream type: %ld", v2, 0x16u);
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_6(&dword_18E67D000, v0, v1, "Invalid stream identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)isStreamInfoValidForIdentifier:basePath:streamType:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_6(&dword_18E67D000, v0, v1, "Invalid stream type: %ld", v2, v3, v4, v5, v6);
}

@end