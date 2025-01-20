@interface BWStillImageProcessingPlan
- (BWStillImageProcessingPlan)initWithSettings:(id)a3;
- (id)description;
- (id)lastAddedInputForSequenceNumber:(unsigned int)a3 portType:(id)a4 bufferType:(unint64_t)a5;
- (void)addInput:(id)a3 sequenceNumber:(unsigned int)a4 portType:(id)a5 bufferType:(unint64_t)a6;
- (void)addInput:(id)a3 sequenceNumber:(unsigned int)a4 portType:(id)a5 bufferTypes:(id)a6;
- (void)dealloc;
@end

@implementation BWStillImageProcessingPlan

- (BWStillImageProcessingPlan)initWithSettings:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWStillImageProcessingPlan;
  v4 = [(BWStillImageProcessingPlan *)&v6 init];
  if (v4)
  {
    v4->_settings = (BWStillImageSettings *)a3;
    v4->_inputsByBufferTypeByPortTypeBySequenceNumber = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessingPlan;
  [(BWStillImageProcessingPlan *)&v3 dealloc];
}

- (void)addInput:(id)a3 sequenceNumber:(unsigned int)a4 portType:(id)a5 bufferType:(unint64_t)a6
{
  if (a3 && a5)
  {
    uint64_t v8 = *(void *)&a4;
    v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a4]);
    if (!v11)
    {
      v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "setObject:forKeyedSubscript:", v11, [NSNumber numberWithUnsignedInt:v8]);
    }
    v12 = (void *)[v11 objectForKeyedSubscript:a5];
    if (!v12)
    {
      v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v11 setObject:v12 forKeyedSubscript:a5];
    }
    v13 = objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a6));
    if (!v13)
    {
      v13 = (void *)[MEMORY[0x1E4F1CA48] array];
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a6));
    }
    [v13 addObject:a3];
  }
}

- (void)addInput:(id)a3 sequenceNumber:(unsigned int)a4 portType:(id)a5 bufferTypes:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [a6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a6);
        }
        -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](self, "addInput:sequenceNumber:portType:bufferType:", a3, v8, a5, (int)[*(id *)(*((void *)&v15 + 1) + 8 * v14++) intValue]);
      }
      while (v12 != v14);
      uint64_t v12 = [a6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (id)lastAddedInputForSequenceNumber:(unsigned int)a3 portType:(id)a4 bufferType:(unint64_t)a5
{
  objc_super v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(void *)&a3)), "objectForKeyedSubscript:", a4);
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a5));
  return (id)[v7 lastObject];
}

- (id)description
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_settings captureSettings] settingsID];
  uint64_t v6 = BWPhotoEncoderStringFromEncodingScheme([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_settings captureSettings] captureType]);
  uint64_t v7 = [(NSMutableDictionary *)self->_inputsByBufferTypeByPortTypeBySequenceNumber count];
  uint64_t v8 = &stru_1EFA403E0;
  if (!v7) {
    uint64_t v8 = @" Empty plan (processing on-demand)";
  }
  v9 = (void *)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@%@", v4, self, v5, v6, v8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = self->_inputsByBufferTypeByPortTypeBySequenceNumber;
  uint64_t v30 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v50;
    v29 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v10;
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
        if ((unint64_t)-[NSMutableDictionary count](self->_inputsByBufferTypeByPortTypeBySequenceNumber, "count") >= 2)objc_msgSend(v9, "appendFormat:", @"\n[SeqNo %d]", objc_msgSend(v11, "intValue")); {
        uint64_t v12 = (void *)[(NSMutableDictionary *)self->_inputsByBufferTypeByPortTypeBySequenceNumber objectForKeyedSubscript:v11];
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v34 = v12;
        uint64_t v33 = [v12 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v33)
        {
          uint64_t v32 = *(void *)v46;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v46 != v32) {
                objc_enumerationMutation(v34);
              }
              uint64_t v35 = v13;
              uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * v13);
              [v9 appendFormat:@"\n\t[%@]", v14];
              long long v15 = (void *)[v34 objectForKeyedSubscript:v14];
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v54 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v36 = *(void *)v42;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v42 != v36) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v19 = (int)[*(id *)(*((void *)&v41 + 1) + 8 * i) intValue];
                    [v9 appendFormat:@"\n\t\t[%@]", BWStillImageBufferTypeToShortString(v19)];
                    uint64_t v20 = objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v19));
                    long long v37 = 0u;
                    long long v38 = 0u;
                    long long v39 = 0u;
                    long long v40 = 0u;
                    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v53 count:16];
                    if (v21)
                    {
                      uint64_t v22 = v21;
                      uint64_t v23 = *(void *)v38;
                      uint64_t v24 = 1;
                      do
                      {
                        for (uint64_t j = 0; j != v22; ++j)
                        {
                          if (*(void *)v38 != v23) {
                            objc_enumerationMutation(v20);
                          }
                          [v9 appendFormat:@"\n\t\t\t[%u] %@", v24 + j, *(void *)(*((void *)&v37 + 1) + 8 * j)];
                        }
                        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v53 count:16];
                        uint64_t v24 = (v24 + j);
                      }
                      while (v22);
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v54 count:16];
                }
                while (v17);
              }
              uint64_t v13 = v35 + 1;
            }
            while (v35 + 1 != v33);
            uint64_t v33 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
          }
          while (v33);
        }
        uint64_t v10 = v31 + 1;
        self = v29;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v30);
  }
  return (id)[v9 copy];
}

@end