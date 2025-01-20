@interface ASDTSelectorControl
- (ASDTSelectorControl)initWithConfig:(id)a3 withDevice:(id)a4;
@end

@implementation ASDTSelectorControl

- (ASDTSelectorControl)initWithConfig:(id)a3 withDevice:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unsigned int v34 = 0;
  if (![v6 asdtControlClassID:&v34])
  {
LABEL_24:
    v23 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = [v6 asdtIsSettable];
  uint64_t v9 = [v6 asdtElement];
  uint64_t v10 = [v6 asdtScope];
  v11 = [v7 plugin];
  v33.receiver = self;
  v33.super_class = (Class)ASDTSelectorControl;
  self = [(ASDSelectorControl *)&v33 initWithIsSettable:v8 forElement:v9 inScope:v10 withPlugin:v11 andObjectClassID:v34];

  if (!self) {
    goto LABEL_14;
  }
  id v12 = [v6 asdtSelectorControlItems];
  if (![v12 count])
  {
    v24 = ASDTBaseLogType();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ASDTSelectorControl initWithConfig:withDevice:](v7);
    }

LABEL_23:
    goto LABEL_24;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v12;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v30;
  v27 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      v18 = objc_msgSend(v17, "asdtName", v27);
      uint64_t v19 = [v17 asdtSelectorControlItemKind];
      uint64_t v20 = [v17 asdtSelectorControlItemSelected];
      unsigned int v28 = 0;
      if (([v17 asdtSelectorControlItemValue:&v28] & 1) == 0)
      {
        v25 = ASDTBaseLogType();
        id v7 = v27;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[ASDTSelectorControl initWithConfig:withDevice:](v27);
        }
        goto LABEL_22;
      }
      uint64_t v21 = [MEMORY[0x263F28C68] withValue:v28 name:v18 andKind:v19 selected:v20];
      if (!v21)
      {
        v25 = ASDTBaseLogType();
        id v7 = v27;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[ASDTSelectorControl initWithConfig:withDevice:](v27);
        }
LABEL_22:

        goto LABEL_23;
      }
      v22 = (void *)v21;
      [(ASDSelectorControl *)self addValue:v21];
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    id v7 = v27;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_13:

LABEL_14:
  self = self;
  v23 = self;
LABEL_25:

  return v23;
}

- (void)initWithConfig:(void *)a1 withDevice:.cold.1(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Selector control must contain items.", v4, v5, v6, v7, 2u);
}

- (void)initWithConfig:(void *)a1 withDevice:.cold.2(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Memory allocation error for selector value.", v4, v5, v6, v7, 2u);
}

- (void)initWithConfig:(void *)a1 withDevice:.cold.3(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Selector control items must include a value.", v4, v5, v6, v7, 2u);
}

@end