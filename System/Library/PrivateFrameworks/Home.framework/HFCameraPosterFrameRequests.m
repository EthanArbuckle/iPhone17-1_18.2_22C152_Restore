@interface HFCameraPosterFrameRequests
- (HFCameraPosterFrameRequests)init;
- (NSMutableDictionary)generationRequests;
- (NSMutableDictionary)timelapseRequests;
- (id)fulfillAllRequestsForPosterFrameGenerationForHighQualityClip:(id)a3;
- (id)fulfillRequestForPosterFrameGenerationForHighQualityClip:(id)a3 atOffset:(double)a4;
- (id)fulfillRequestsForTimelapseFileForTimelapseClip:(id)a3;
- (void)addRequestForTimelapseFileForDelegate:(id)a3 forHighQualityClip:(id)a4 andTimelapseClip:(id)a5 atOffset:(double)a6;
- (void)addRequestsForPosterFrameGeneration:(id)a3 forHighQualityClip:(id)a4;
- (void)setGenerationRequests:(id)a3;
- (void)setTimelapseRequests:(id)a3;
@end

@implementation HFCameraPosterFrameRequests

- (HFCameraPosterFrameRequests)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFCameraPosterFrameRequests;
  v2 = [(HFCameraPosterFrameRequests *)&v8 init];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  timelapseRequests = v2->_timelapseRequests;
  v2->_timelapseRequests = (NSMutableDictionary *)v3;

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  generationRequests = v2->_generationRequests;
  v2->_generationRequests = (NSMutableDictionary *)v5;

  return v2;
}

- (void)addRequestForTimelapseFileForDelegate:(id)a3 forHighQualityClip:(id)a4 andTimelapseClip:(id)a5 atOffset:(double)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(HFCameraPosterFrameDelegateRequest);
  [(HFCameraPosterFrameDelegateRequest *)v13 setHighQualityClip:v11];

  [(HFCameraPosterFrameDelegateRequest *)v13 setTimelapseClip:v10];
  [(HFCameraPosterFrameDelegateRequest *)v13 setDelegate:v12];

  v14 = [NSNumber numberWithDouble:a6];
  [(HFCameraPosterFrameDelegateRequest *)v13 setOffsetNumber:v14];

  v15 = [v10 uniqueIdentifier];
  v16 = [v15 UUIDString];

  v17 = [(HFCameraPosterFrameRequests *)self timelapseRequests];
  v18 = [v17 objectForKeyedSubscript:v16];

  if (!v18)
  {
    v18 = [MEMORY[0x263EFF980] array];
    v19 = [(HFCameraPosterFrameRequests *)self timelapseRequests];
    [v19 setObject:v18 forKeyedSubscript:v16];
  }
  v20 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v10 uniqueIdentifier];
    v22 = [v21 UUIDString];
    int v23 = 138412290;
    v24 = v22;
    _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "REQUEST: Adding request for timelapse clip %@", (uint8_t *)&v23, 0xCu);
  }
  [v18 addObject:v13];
}

- (id)fulfillRequestsForTimelapseFileForTimelapseClip:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 uniqueIdentifier];
    v7 = [v6 UUIDString];
    int v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "REQUEST: Fulfilling all requests for timelapse clip %@", (uint8_t *)&v14, 0xCu);
  }
  objc_super v8 = [v4 uniqueIdentifier];
  v9 = [v8 UUIDString];

  id v10 = [(HFCameraPosterFrameRequests *)self timelapseRequests];
  id v11 = [v10 objectForKeyedSubscript:v9];

  id v12 = [(HFCameraPosterFrameRequests *)self timelapseRequests];
  [v12 setObject:0 forKeyedSubscript:v9];

  return v11;
}

- (void)addRequestsForPosterFrameGeneration:(id)a3 forHighQualityClip:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 uniqueIdentifier];
  v9 = [v8 UUIDString];

  id v10 = [(HFCameraPosterFrameRequests *)self generationRequests];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "offsetNumber", (void)v23);
        [v11 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v14);
  }

  v19 = [(HFCameraPosterFrameRequests *)self generationRequests];
  [v19 setObject:v11 forKeyedSubscript:v9];

  v20 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v7 uniqueIdentifier];
    v22 = [v21 UUIDString];
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "REQUEST: Adding request for high quality clip %@", buf, 0xCu);
  }
}

- (id)fulfillRequestForPosterFrameGenerationForHighQualityClip:(id)a3 atOffset:(double)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 uniqueIdentifier];
  objc_super v8 = [v7 UUIDString];

  v9 = [(HFCameraPosterFrameRequests *)self generationRequests];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    id v11 = [NSNumber numberWithDouble:a4];
    id v12 = [v10 objectForKeyedSubscript:v11];
    if (v12)
    {
      [v10 removeObjectForKey:v11];
      if (![v10 count])
      {
        uint64_t v13 = [(HFCameraPosterFrameRequests *)self generationRequests];
        [v13 setObject:0 forKeyedSubscript:v8];
      }
    }
    uint64_t v14 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 uniqueIdentifier];
      uint64_t v16 = [v15 UUIDString];
      int v18 = 138412546;
      v19 = v16;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "REQUEST: Fulfill generation request for high quality clip %@ for offset %f", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)fulfillAllRequestsForPosterFrameGenerationForHighQualityClip:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 uniqueIdentifier];
  id v6 = [v5 UUIDString];

  id v7 = [(HFCameraPosterFrameRequests *)self generationRequests];
  objc_super v8 = [v7 objectForKeyedSubscript:v6];

  v9 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 uniqueIdentifier];
    id v11 = [v10 UUIDString];
    int v15 = 138412290;
    uint64_t v16 = v11;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "REQUEST: Fulfil all generation requesst for high quality clip %@", (uint8_t *)&v15, 0xCu);
  }
  if (v8)
  {
    id v12 = [(HFCameraPosterFrameRequests *)self generationRequests];
    [v12 setObject:0 forKeyedSubscript:v6];

    uint64_t v13 = [v8 allValues];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (NSMutableDictionary)timelapseRequests
{
  return self->_timelapseRequests;
}

- (void)setTimelapseRequests:(id)a3
{
}

- (NSMutableDictionary)generationRequests
{
  return self->_generationRequests;
}

- (void)setGenerationRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationRequests, 0);
  objc_storeStrong((id *)&self->_timelapseRequests, 0);
}

@end