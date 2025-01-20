@interface _PADVNFaceprintDetector
- (NSMutableArray)faceprints;
- (_PADVNFaceprintDetector)init;
- (id)requestsForFrame:(id)a3 handler:(id)a4;
- (unint64_t)observationCompositeSetSize;
- (void)analyzeObservationComposite:(id)a3;
- (void)analyzeObservationCompositeSet:(id)a3;
- (void)handleObservationCompositeError:(id)a3;
- (void)invalidate;
- (void)processFrames:(id)a3 completion:(id)a4;
- (void)setFaceprints:(id)a3;
@end

@implementation _PADVNFaceprintDetector

- (_PADVNFaceprintDetector)init
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], v3);

  v11.receiver = self;
  v11.super_class = (Class)_PADVNFaceprintDetector;
  v7 = [(PADVNSerialRequestsScheduler *)&v11 initWithQueue:v6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFFA68] mutableCopy];
    faceprints = v7->_faceprints;
    v7->_faceprints = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_queue, v6);
  }

  return v7;
}

- (void)processFrames:(id)a3 completion:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (self->_completion)
  {
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F07F80];
    v24[0] = @"Could not complete faceprint detection on frames because another request is being processed.";
    id v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    objc_super v11 = [v9 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v10];
    ((void (**)(void, void *))v8)[2](v8, v11);
  }
  else
  {
    v12 = _Block_copy(v7);
    id completion = self->_completion;
    self->_id completion = v12;

    self->_setSize = [v6 count];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    uint64_t v14 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v10);
          }
          -[PADVNSerialRequestsScheduler processFrame:](self, "processFrame:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (unint64_t)observationCompositeSetSize
{
  return self->_setSize;
}

- (id)requestsForFrame:(id)a3 handler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21F07C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Vision.ID", "", buf, 2u);
  }

  v9 = VNCreateFaceprintRequestInit(v7);
  v37[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];

  objc_super v11 = [v6 faces];
  uint64_t v12 = [v11 count];

  if (v12 == 1)
  {
    v13 = [v6 faces];
    uint64_t v14 = [v13 firstObject];
    [v14 bounds];
    long long v19 = VNFaceObservationWithAVFoundationFaceBounds(v15, v16, v17, v18);

    if (v19)
    {
      id v29 = v7;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v28 = v10;
      id v20 = v10;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v31 == v23)
            {
              v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                goto LABEL_15;
              }
            }
            else
            {
              objc_enumerationMutation(v20);
              v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
LABEL_15:
                [v25 setUsesCPUOnly:__52___PADVNFaceprintDetector_requestsForFrame_handler___block_invoke()];
                if (![v25 conformsToProtocol:&unk_26D0AF8F0]) {
                  continue;
                }
                goto LABEL_16;
              }
            }
            if (![v25 conformsToProtocol:&unk_26D0AF8F0]) {
              continue;
            }
LABEL_16:
            v35 = v19;
            v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
            [v25 setInputFaceObservations:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v22);
      }

      id v7 = v29;
      id v10 = v28;
    }
  }
  return v10;
}

- (void)handleObservationCompositeError:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_21F07C000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Vision.ID", "", v9, 2u);
  }

  id completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    if (!v4)
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F07F80];
      v11[0] = @"An error occurred when detecting faceprints in the frame.";
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v4 = [v7 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v8];

      id completion = (void (**)(id, id))self->_completion;
    }
    completion[2](completion, v4);
  }
}

- (void)analyzeObservationComposite:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_PADVNFaceprintDetector;
  id v4 = a3;
  [(PADVNSerialRequestsScheduler *)&v15 analyzeObservationComposite:v4];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = PADVNFaceprintInit(v8);
    uint64_t v10 = (void *)v9;
    objc_super v11 = (void *)MEMORY[0x263EFFA68];
    if (v9) {
      objc_super v11 = (void *)v9;
    }
    id v12 = v11;

    [(NSMutableArray *)self->_faceprints addObject:v12];
    v13 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_21F07C000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Vision.ID", "", v14, 2u);
    }
  }
  else
  {
    v13 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_PADVNFaceprintDetector analyzeObservationComposite:](v13);
    }
  }
}

- (void)analyzeObservationCompositeSet:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PADVNFaceprintDetector;
  [(PADVNSerialRequestsScheduler *)&v5 analyzeObservationCompositeSet:a3];
  id completion = (void (**)(id, void))self->_completion;
  if (completion) {
    completion[2](completion, 0);
  }
}

- (void)invalidate
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F07C000, log, OS_LOG_TYPE_DEBUG, "Invalidating faceprints.", v1, 2u);
}

- (NSMutableArray)faceprints
{
  return self->_faceprints;
}

- (void)setFaceprints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprints, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)analyzeObservationComposite:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F07C000, log, OS_LOG_TYPE_ERROR, "Could not obtain faceprint from frame.", v1, 2u);
}

@end