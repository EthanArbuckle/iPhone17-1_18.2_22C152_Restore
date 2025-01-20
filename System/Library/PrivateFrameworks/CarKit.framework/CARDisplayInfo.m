@interface CARDisplayInfo
- (BOOL)hasPunchThroughWithIdentifier:(id)a3;
- (BOOL)supportsAdditionalContent;
- (BOOL)supportsCarPlayContent;
- (BOOL)supportsDDPContent;
- (BOOL)supportsInstrumentClusterContent;
- (BOOL)supportsMapContent;
- (CARDisplayInfo)initWithLogicalScreenDictionary:(id)a3;
- (CARDisplayInfo)initWithPhysicalScreenDictionary:(id)a3;
- (CGPoint)originForScreenInfoIdentifier:(id)a3;
- (CGSize)physicalSize;
- (CGSize)pixelSize;
- (NSArray)oemPunchThroughs;
- (NSArray)streams;
- (NSSet)punchThroughIdentifiers;
- (NSString)identifier;
- (id)description;
- (id)punchThroughWithIdentifier:(id)a3;
- (void)_updateOEMViews:(id)a3;
- (void)updateStreams:(id)a3;
@end

@implementation CARDisplayInfo

- (CARDisplayInfo)initWithPhysicalScreenDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CARDisplayInfo;
  v5 = [(CARDisplayInfo *)&v24 init];
  v6 = v5;
  if (!v5)
  {
LABEL_36:
    v19 = v6;
    goto LABEL_37;
  }
  if ((CRSizeFromAirPlayDictionary(v4, &v5->_pixelSize.width) & 1) == 0)
  {
    v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.4();
    }
    goto LABEL_27;
  }
  if ((CRPhysicalSizeFromAirPlayDictionary(v4, &v6->_physicalSize.width) & 1) == 0)
  {
    v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CARDisplayInfo initWithPhysicalScreenDictionary:]();
    }
    goto LABEL_27;
  }
  objc_opt_class();
  id v7 = [v4 objectForKey:@"uid"];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (!v8)
  {
    v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CARDisplayInfo initWithPhysicalScreenDictionary:]();
    }
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v10 = [v8 copy];
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v10;

  objc_opt_class();
  id v12 = [v4 objectForKey:@"properties"];
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__CARDisplayInfo_initWithPhysicalScreenDictionary___block_invoke;
  v22[3] = &unk_1E5E3B548;
  v14 = v6;
  v23 = v14;
  [v13 enumerateObjectsUsingBlock:v22];
  objc_opt_class();
  id v15 = [v4 objectForKey:@"initialVideoStreams"];
  if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (v16)
  {
    [(CARDisplayInfo *)v14 updateStreams:v16];
    objc_opt_class();
    id v17 = [v4 objectForKey:@"automakerInputStreams"];
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    if (v18)
    {
      [(CARDisplayInfo *)v14 _updateOEMViews:v18];
    }
    else
    {
      oemPunchThroughs = v14->_oemPunchThroughs;
      v14->_oemPunchThroughs = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v18 = CarGeneralLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CARDisplayInfo initWithPhysicalScreenDictionary:]();
    }
  }

  if (v16) {
    goto LABEL_36;
  }
LABEL_28:
  v19 = 0;
LABEL_37:

  return v19;
}

void __51__CARDisplayInfo_initWithPhysicalScreenDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  id v7 = v4;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
    id v4 = v7;
  }
  else
  {
    id v5 = 0;
  }

  if ([v5 isEqualToString:@"CarPlay"])
  {
    uint64_t v6 = 8;
LABEL_16:
    *(unsigned char *)(*(void *)(a1 + 32) + v6) = 1;
    goto LABEL_17;
  }
  if ([v5 isEqualToString:@"Instrument Cluster"])
  {
    uint64_t v6 = 9;
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"Map"])
  {
    uint64_t v6 = 10;
    goto LABEL_16;
  }
  if (([v5 isEqualToString:@"DPManaged"] & 1) != 0
    || ([v5 isEqualToString:@"DDPManaged"] & 1) != 0)
  {
    uint64_t v6 = 11;
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"additionalContent"])
  {
    uint64_t v6 = 12;
    goto LABEL_16;
  }
LABEL_17:
}

- (CARDisplayInfo)initWithLogicalScreenDictionary:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CARDisplayInfo;
  id v5 = [(CARDisplayInfo *)&v19 init];
  if (!v5)
  {
LABEL_20:
    id v16 = v5;
    goto LABEL_21;
  }
  if (CRSizeFromDictionary((const __CFDictionary *)[v4 objectForKey:*MEMORY[0x1E4F211A8]], &v5->_pixelSize))
  {
    if (CRSizeFromDictionary((const __CFDictionary *)[v4 objectForKey:*MEMORY[0x1E4F211A0]], &v5->_physicalSize))
    {
      objc_opt_class();
      id v6 = [v4 objectForKey:@"ScreenID"];
      if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }

      if (v7)
      {
        uint64_t v9 = [v7 copy];
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v9;

        *(_WORD *)&v5->_supportsCarPlayContent = 257;
        v5->_supportsMapContent = 1;
        v11 = [[CARStreamInfo alloc] initWithStreamInfoDictionary:v4];
        id v12 = v11;
        id v13 = (NSArray *)MEMORY[0x1E4F1CBF0];
        if (v11)
        {
          v20[0] = v11;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
          streams = v5->_streams;
          v5->_streams = (NSArray *)v14;
        }
        else
        {
          streams = v5->_streams;
          v5->_streams = (NSArray *)MEMORY[0x1E4F1CBF0];
        }

        oemPunchThroughs = v5->_oemPunchThroughs;
        v5->_oemPunchThroughs = v13;

        goto LABEL_20;
      }
      id v8 = CarGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CARDisplayInfo initWithPhysicalScreenDictionary:]();
      }
    }
    else
    {
      id v8 = CarGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CARDisplayInfo initWithPhysicalScreenDictionary:]();
      }
    }
  }
  else
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CARDisplayInfo initWithPhysicalScreenDictionary:].cold.4();
    }
  }

  id v16 = 0;
LABEL_21:

  return v16;
}

- (id)punchThroughWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CARDisplayInfo *)self oemPunchThroughs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__CARDisplayInfo_punchThroughWithIdentifier___block_invoke;
  v9[3] = &unk_1E5E3B570;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __45__CARDisplayInfo_punchThroughWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)hasPunchThroughWithIdentifier:(id)a3
{
  id v3 = [(CARDisplayInfo *)self punchThroughWithIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSSet)punchThroughIdentifiers
{
  v2 = [(CARDisplayInfo *)self oemPunchThroughs];
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_16);

  BOOL v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return (NSSet *)v4;
}

uint64_t __41__CARDisplayInfo_punchThroughIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)description
{
  id v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)CARDisplayInfo;
  BOOL v4 = [(CARDisplayInfo *)&v12 description];
  identifier = self->_identifier;
  id v6 = BSStringFromCGSize();
  id v7 = BSStringFromCGSize();
  BOOL v8 = [(CARDisplayInfo *)self supportsAdditionalContent];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  id v10 = [v3 stringWithFormat:@"%@ {identifier: %@, physicalSize: %@, pixelSize: %@, additionalContent: %@}", v4, identifier, v6, v7, v9];

  return v10;
}

- (void)updateStreams:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__CARDisplayInfo_updateStreams___block_invoke;
  v10[3] = &unk_1E5E3B3E8;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  BOOL v8 = (NSArray *)[v7 copy];
  streams = self->_streams;
  self->_streams = v8;
}

void __32__CARDisplayInfo_updateStreams___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  BOOL v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = [[CARStreamInfo alloc] initWithDictionary:v4];
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    id v6 = v4;
  }
  else
  {

    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__CARDisplayInfo_updateStreams___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (CGPoint)originForScreenInfoIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CARDisplayInfo *)self streams];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CARDisplayInfo_originForScreenInfoIdentifier___block_invoke;
  v14[3] = &unk_1E5E3B438;
  id v15 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v14);

  if (v7)
  {
    [v7 origin];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

uint64_t __48__CARDisplayInfo_originForScreenInfoIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_updateOEMViews:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__CARDisplayInfo__updateOEMViews___block_invoke;
  v10[3] = &unk_1E5E3B3E8;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  double v8 = (NSArray *)[v7 copy];
  oemPunchThroughs = self->_oemPunchThroughs;
  self->_oemPunchThroughs = v8;
}

void __34__CARDisplayInfo__updateOEMViews___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = [[CAROEMPunchThrough alloc] initWithDictionary:v4];
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    id v6 = v4;
  }
  else
  {

    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __34__CARDisplayInfo__updateOEMViews___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGSize)physicalSize
{
  double width = self->_physicalSize.width;
  double height = self->_physicalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)supportsCarPlayContent
{
  return self->_supportsCarPlayContent;
}

- (BOOL)supportsInstrumentClusterContent
{
  return self->_supportsInstrumentClusterContent;
}

- (BOOL)supportsMapContent
{
  return self->_supportsMapContent;
}

- (BOOL)supportsDDPContent
{
  return self->_supportsDDPContent;
}

- (BOOL)supportsAdditionalContent
{
  return self->_supportsAdditionalContent;
}

- (NSArray)oemPunchThroughs
{
  return self->_oemPunchThroughs;
}

- (NSArray)streams
{
  return self->_streams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_oemPunchThroughs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPhysicalScreenDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to parse display identifier: %@", v2, v3, v4, v5, v6);
}

- (void)initWithPhysicalScreenDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to parse logical displays: %@", v2, v3, v4, v5, v6);
}

- (void)initWithPhysicalScreenDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to parse display physical size: %@", v2, v3, v4, v5, v6);
}

- (void)initWithPhysicalScreenDictionary:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to parse display pixel size: %@", v2, v3, v4, v5, v6);
}

void __32__CARDisplayInfo_updateStreams___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __34__CARDisplayInfo__updateOEMViews___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end