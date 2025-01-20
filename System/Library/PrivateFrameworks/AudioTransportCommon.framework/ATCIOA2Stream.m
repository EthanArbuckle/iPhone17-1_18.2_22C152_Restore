@interface ATCIOA2Stream
- (ATCIOA2Stream)initWithService:(id)a3 connection:(id)a4 index:(unint64_t)a5 input:(BOOL)a6 description:(id)a7;
- (ATCIOA2StreamFormat)currentFormat;
- (BOOL)isInput;
- (NSArray)availableFormats;
- (unsigned)startingChannel;
@end

@implementation ATCIOA2Stream

- (ATCIOA2Stream)initWithService:(id)a3 connection:(id)a4 index:(unint64_t)a5 input:(BOOL)a6 description:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)ATCIOA2Stream;
  v16 = [(ATCIOA2Stream *)&v37 init];
  v17 = v16;
  if (v16)
  {
    id v32 = v13;
    objc_storeStrong((id *)&v16->_service, a3);
    objc_storeStrong((id *)&v17->_connection, a4);
    v17->_index = a5;
    v17->_input = a6;
    v18 = [v15 objectForKeyedSubscript:@"stream ID"];
    v17->_physicalID = [v18 unsignedIntValue];

    v19 = [v15 objectForKeyedSubscript:@"starting channel"];
    v17->_startingChannel = [v19 unsignedIntValue];

    v20 = [v15 objectForKeyedSubscript:@"current format"];
    uint64_t v21 = +[ATCIOA2StreamFormat aeaStreamFormatWithDictionary:v20];
    currentFormat = v17->_currentFormat;
    v17->_currentFormat = (ATCIOA2StreamFormat *)v21;

    v23 = [MEMORY[0x263EFF980] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v24 = [v15 objectForKeyedSubscript:@"available formats"];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = +[ATCIOA2StreamFormat aeaStreamFormatsWithRangedDictionary:*(void *)(*((void *)&v33 + 1) + 8 * v28)];
          if (v29) {
            [(NSArray *)v23 addObjectsFromArray:v29];
          }

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v26);
    }

    availableFormats = v17->_availableFormats;
    v17->_availableFormats = v23;

    id v13 = v32;
  }

  return v17;
}

- (BOOL)isInput
{
  return self->_input;
}

- (ATCIOA2StreamFormat)currentFormat
{
  return self->_currentFormat;
}

- (NSArray)availableFormats
{
  return self->_availableFormats;
}

- (unsigned)startingChannel
{
  return self->_startingChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableFormats, 0);
  objc_storeStrong((id *)&self->_currentFormat, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end