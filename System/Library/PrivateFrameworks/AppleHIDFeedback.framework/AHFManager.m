@interface AHFManager
+ (id)sharedInstance;
- (AHFManager)init;
- (AHFPencilController)pencilController;
- (AHFTrackpadController)trackpadController;
- (BOOL)playFeedback:(id)a3 powerSourceID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (BOOL)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (void)setPencilController:(id)a3;
- (void)setTrackpadController:(id)a3;
@end

@implementation AHFManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__AHFManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __28__AHFManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (AHFManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)AHFManager;
  v2 = [(AHFManager *)&v9 init];
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = objc_opt_new();
  trackpadController = v2->_trackpadController;
  v2->_trackpadController = (AHFTrackpadController *)v3;

  if (!v2->_trackpadController) {
    goto LABEL_5;
  }
  uint64_t v5 = objc_opt_new();
  pencilController = v2->_pencilController;
  v2->_pencilController = (AHFPencilController *)v5;

  if (v2->_pencilController) {
    v7 = v2;
  }
  else {
LABEL_5:
  }
    v7 = 0;

  return v7;
}

- (BOOL)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  int v16 = [(AHFTrackpadController *)self->_trackpadController playFeedback:v10 senderID:a4 timestamp:a5 error:a6];
  if (v16 == -536870208) {
    int v16 = [(AHFPencilController *)self->_pencilController playFeedback:v10 senderID:a4 timestamp:a5 error:a6];
  }
  if (!a6 || v16)
  {
    if (v16 == -536870208) {
      failure(a6, -536870208, (uint64_t)"SenderID 0x%llX not found", v11, v12, v13, v14, v15, a4);
    }
  }
  else
  {
    *a6 = 0;
  }

  return v16 == 0;
}

- (BOOL)playFeedback:(id)a3 powerSourceID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (const void *)IOPSCopyPowerSourcesByType();
  if (!v12)
  {
    v31 = "Could not retrieve power sources for accessories";
LABEL_13:
    char v32 = failure(a6, -536870212, (uint64_t)v31, v13, v14, v15, v16, v17, v48);
    goto LABEL_26;
  }
  v18 = v12;
  CFArrayRef v19 = IOPSCopyPowerSourcesList(v12);
  if (!v19)
  {
    CFRelease(v18);
    v31 = "Could not retrieve power sources list for accessories";
    goto LABEL_13;
  }
  CFArrayRef v20 = v19;
  CFIndex Count = CFArrayGetCount(v19);
  if (Count < 1)
  {
    BOOL v24 = 0;
    int v30 = -536870212;
    goto LABEL_23;
  }
  CFIndex v22 = Count;
  unint64_t v49 = a5;
  id v50 = v10;
  v51 = a6;
  CFIndex v23 = 0;
  BOOL v24 = 1;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v20, v23);
    if (!ValueAtIndex) {
      goto LABEL_9;
    }
    CFDictionaryRef v26 = IOPSGetPowerSourceDescription(v18, ValueAtIndex);
    if (!v26) {
      goto LABEL_9;
    }
    v27 = [NSDictionary dictionaryWithDictionary:v26];
    v28 = [v27 objectForKeyedSubscript:@"Power Source ID"];
    int v29 = [v28 isEqualToNumber:v11];

    if (v29) {
      break;
    }

LABEL_9:
    BOOL v24 = ++v23 < v22;
    if (v22 == v23)
    {
      int v30 = -536870212;
      goto LABEL_22;
    }
  }
  v33 = [v27 objectForKeyedSubscript:@"Accessory Category"];
  v34 = [v27 objectForKeyedSubscript:@"Accessory Identifier"];
  if ([v33 isEqual:@"Trackpad"])
  {
    v35 = [(AHFManager *)self trackpadController];
    goto LABEL_19;
  }
  if ([v33 isEqual:@"Pencil"])
  {
    v35 = [(AHFManager *)self pencilController];
LABEL_19:
    v41 = v35;
    int v30 = [v35 playFeedback:v50 accessoryID:v34 timestamp:v49 error:v51];
  }
  else
  {
    int v30 = -536870206;
    failure(v51, -536870206, (uint64_t)"Power source category %@ not supported", v36, v37, v38, v39, v40, (uint64_t)v33);
  }

LABEL_22:
  id v10 = v50;
  a6 = v51;
LABEL_23:
  CFRelease(v20);
  CFRelease(v18);
  if (!v24)
  {
    int v30 = -536870208;
    failure(a6, -536870208, (uint64_t)"Power source with ID %@ not found", v42, v43, v44, v45, v46, (uint64_t)v11);
  }
  char v32 = v30 == 0;
LABEL_26:

  return v32;
}

- (AHFTrackpadController)trackpadController
{
  return self->_trackpadController;
}

- (void)setTrackpadController:(id)a3
{
}

- (AHFPencilController)pencilController
{
  return self->_pencilController;
}

- (void)setPencilController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilController, 0);
  objc_storeStrong((id *)&self->_trackpadController, 0);
}

@end