@interface ETSketchMessage
+ (unsigned)messageType;
- (BOOL)_decodeWithDoodle:(id)a3;
- (BOOL)didDrawPoints;
- (BOOL)didEndWisping;
- (BOOL)hasMultipleColors;
- (BOOL)hideComet;
- (ETSketchMessage)init;
- (ETSketchMessage)initWithArchiveData:(id)a3;
- (NSArray)colorsInMessage;
- (NSArray)strokes;
- (double)messageDuration;
- (id)archiveData;
- (id)messageTypeAsString;
- (unint64_t)numberOfColors;
- (void)addSketchPoint:(CGPoint)a3;
- (void)addStrokeWithColor:(id)a3;
- (void)convertToSimulatedPlaybackSpeed;
- (void)didEndWisp;
- (void)didReachRendererLimit;
- (void)setDidDrawPoints:(BOOL)a3;
- (void)setDidEndWisping:(BOOL)a3;
- (void)setHasMultipleColors:(BOOL)a3;
- (void)setHideComet:(BOOL)a3;
- (void)setParentMessage:(id)a3;
- (void)willBeginWisp;
@end

@implementation ETSketchMessage

+ (unsigned)messageType
{
  return 1;
}

- (ETSketchMessage)init
{
  v9.receiver = self;
  v9.super_class = (Class)ETSketchMessage;
  v2 = [(ETMessage *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    strokes = v2->_strokes;
    v2->_strokes = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    colorsInMessage = v2->_colorsInMessage;
    v2->_colorsInMessage = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSArray)strokes
{
  return (NSArray *)self->_strokes;
}

- (NSArray)colorsInMessage
{
  return (NSArray *)self->_colorsInMessage;
}

- (unint64_t)numberOfColors
{
  return [(NSMutableArray *)self->_colorsInMessage count];
}

- (void)didReachRendererLimit
{
  id v3 = [(ETMessage *)self delegate];
  [v3 messageWillReachSizeLimit:self];
}

- (void)addStrokeWithColor:(id)a3
{
  id v4 = a3;
  [(ETMessage *)self setColor:v4];
  [(NSMutableArray *)self->_colorsInMessage addObject:v4];

  strokes = self->_strokes;
  id v6 = [MEMORY[0x263EFF980] array];
  [(NSMutableArray *)strokes addObject:v6];
}

- (void)addSketchPoint:(CGPoint)a3
{
  float v4 = (a3.x + 1.0) * 32767.0;
  unsigned int v5 = llroundf(v4);
  float v6 = (a3.y + 1.0) * 32767.0;
  unsigned int v11 = v5 | (llroundf(v6) << 16);
  v7 = [(ETMessage *)self timeSource];
  [v7 elapsedTimeSinceStartOfMessage:self];
  __int16 v12 = llround(v8 * 1000.0);

  objc_super v9 = [(NSMutableArray *)self->_strokes lastObject];
  v10 = [MEMORY[0x263F08D40] valueWithBytes:&v11 objCType:"{?={?=SS}{?=S}}"];
  [v9 addObject:v10];
}

- (BOOL)_decodeWithDoodle:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 doodleCount];
  id v6 = [v4 doodleData];
  uint64_t v7 = [v6 bytes];
  unint64_t v8 = [v6 length];
  id v9 = [v4 colorData];
  uint64_t v40 = [v9 bytes];
  unint64_t v10 = [v9 length];
  v44 = self;
  self->_hasMultipleColors = v10 > 7;
  id v11 = [v4 pointTimeDeltaData];
  uint64_t v45 = [v11 bytes];
  unint64_t v12 = [v11 length];
  if (v5)
  {
    id v34 = v11;
    id v35 = v9;
    id v36 = v6;
    id v37 = v4;
    BOOL v13 = 0;
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = v8 >> 1;
    unint64_t v41 = v10 >> 2;
    uint64_t v42 = v7;
    unint64_t v18 = v12 >> 1;
    uint64_t v38 = v7 + 6;
    unint64_t v39 = v5;
    unint64_t v19 = 0x263EFF000uLL;
    unint64_t v20 = 0x268A6D000uLL;
    v21 = v44;
    while (1)
    {
      char v43 = v13;
      v22 = objc_msgSend(*(id *)(v19 + 2432), "array", v34, v35, v36, v37);
      [*(id *)((char *)&v21->super.super.isa + *(int *)(v20 + 3160)) addObject:v22];
      if (v14 + 2 > v17) {
        break;
      }
      if (!v21->_hasMultipleColors || v15 >= v41) {
        unsigned int v24 = -1;
      }
      else {
        unsigned int v24 = *(_DWORD *)(v40 + 4 * v15);
      }
      colorsInMessage = v21->_colorsInMessage;
      int v26 = *(unsigned __int16 *)(v42 + 2 * v14 + 2);
      v27 = [MEMORY[0x263F1C550] colorWithRed:(double)v24 / 255.0 green:(double)BYTE1(v24) / 255.0 blue:(double)BYTE2(v24) / 255.0 alpha:(double)HIBYTE(v24) / 255.0];
      [(NSMutableArray *)colorsInMessage addObject:v27];

      if (v26)
      {
        unsigned __int16 v28 = v26 + v16;
        unint64_t v29 = v14 + 4;
        uint64_t v30 = v38 + 2 * v14;
        v21 = v44;
        while (v29 <= v17)
        {
          int v46 = *(_DWORD *)(v30 - 2);
          __int16 v47 = 0;
          if (v16 < v18) {
            __int16 v47 = *(_WORD *)(v45 + 2 * v16);
          }
          v31 = [MEMORY[0x263F08D40] valueWithBytes:&v46 objCType:"{?={?=SS}{?=S}}"];
          [v22 addObject:v31];

          ++v16;
          v29 += 2;
          v30 += 4;
          if (v28 == (unsigned __int16)v16)
          {
            unint64_t v14 = v29 - 2;
            goto LABEL_18;
          }
        }
        break;
      }
      v14 += 2;
      v21 = v44;
LABEL_18:
      ++v15;

      BOOL v13 = v15 >= v39;
      unint64_t v19 = 0x263EFF000;
      unint64_t v20 = 0x268A6D000;
      if (v15 == v39)
      {
        char v32 = 1;
        id v6 = v36;
        id v4 = v37;
        id v11 = v34;
        id v9 = v35;
        goto LABEL_22;
      }
    }

    id v6 = v36;
    id v4 = v37;
    id v11 = v34;
    id v9 = v35;
    char v32 = v43;
  }
  else
  {
    char v32 = 1;
  }
LABEL_22:

  return v32 & 1;
}

- (ETSketchMessage)initWithArchiveData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ETSketchMessage;
  unsigned int v5 = [(ETMessage *)&v9 initWithArchiveData:v4];
  if (!v5)
  {
LABEL_4:
    id v6 = v5;
    goto LABEL_6;
  }
  id v6 = [[ETPDoodle alloc] initWithData:v4];
  if (v6)
  {
    BOOL v7 = [(ETSketchMessage *)v5 _decodeWithDoodle:v6];

    if (!v7)
    {
      id v6 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return (ETSketchMessage *)v6;
}

- (id)archiveData
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(ETPDoodle);
  uint64_t v4 = [(NSMutableArray *)self->_strokes count];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v44 = self;
  unsigned int v5 = self->_strokes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v45 + 1) + 8 * i) count];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  [(ETPDoodle *)v3 setDoodleCount:v4];
  id v11 = [MEMORY[0x263EFF990] data];
  [v11 setLength:4 * (v8 + v4)];
  id v40 = v11;
  uint64_t v12 = [v40 mutableBytes];
  BOOL v13 = [MEMORY[0x263EFF990] data];
  [v13 setLength:4 * v4];
  id v39 = v13;
  uint64_t v43 = [v39 mutableBytes];
  unint64_t v41 = v3;
  if ([(ETMessage *)v44 supportsPlaybackTimeOffset])
  {
    unint64_t v14 = [MEMORY[0x263EFF990] data];
    id v15 = v14;
    if (v14)
    {
      [v14 setLength:2 * v8];
      id v15 = v15;
      uint64_t v16 = [v15 mutableBytes];
      goto LABEL_15;
    }
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = 0;
LABEL_15:
  unint64_t v17 = objc_msgSend(v15, "length", v15);
  uint64_t v42 = [(NSMutableArray *)v44->_strokes count];
  if (v42)
  {
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = 0;
    unint64_t v21 = v17 >> 1;
    do
    {
      v22 = [(NSMutableArray *)v44->_strokes objectAtIndexedSubscript:v18];
      v23 = [(NSMutableArray *)v44->_colorsInMessage objectAtIndexedSubscript:v18];
      double v51 = 0.0;
      double v52 = 0.0;
      double v49 = 0.0;
      double v50 = 0.0;
      [v23 getRed:&v52 green:&v51 blue:&v50 alpha:&v49];
      float v24 = v52 * 255.0;
      unsigned int v25 = llroundf(v24);
      float v26 = v51 * 255.0;
      unsigned int v27 = llroundf(v26);
      float v28 = v50 * 255.0;
      unsigned int v29 = llroundf(v28);
      float v30 = v49 * 255.0;
      *(_DWORD *)(v43 + 4 * v18) = (v29 << 16) | (llroundf(v30) << 24) | (v27 << 8) | v25;

      v31 = (_WORD *)(v12 + 2 * v20);
      _WORD *v31 = 0;
      v31[1] = [v22 count];
      uint64_t v32 = [v22 count];
      if (v32)
      {
        uint64_t v33 = v32;
        for (uint64_t j = 0; j != v33; ++j)
        {
          WORD2(v52) = 0;
          LODWORD(v52) = 0;
          id v35 = [v22 objectAtIndexedSubscript:j];
          [v35 getValue:&v52];

          if (v16 && v19 < v21) {
            *(_WORD *)(v16 + 2 * v19++) = WORD2(v52);
          }
          *(_DWORD *)(v12 + 2 * v20 + 4) = LODWORD(v52);
          v20 += 2;
        }
      }
      v20 += 2;

      ++v18;
    }
    while (v18 != v42);
  }
  [(ETPDoodle *)v41 setDoodleData:v40];
  [(ETPDoodle *)v41 setColorData:v39];
  [(ETPDoodle *)v41 setPointTimeDeltaData:v38];
  id v36 = [(ETPDoodle *)v41 data];

  return v36;
}

- (id)messageTypeAsString
{
  return @"Drawing";
}

- (void)willBeginWisp
{
  self->_didDrawPoints = 1;
  if ([(ETMessage *)self delayWisp])
  {
    id v3 = [(ETMessage *)self parentMessage];
    [v3 childMessageDidDelayWisp:self];
  }
  id v4 = [(ETMessage *)self delegate];
  [v4 messageWillStopPlaying:self];
}

- (void)didEndWisp
{
  self->_didEndWisping = 1;
  id v3 = [(ETMessage *)self delegate];
  [v3 messageDidStopPlaying:self];
}

- (void)setParentMessage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ETSketchMessage;
  -[ETMessage setParentMessage:](&v5, sel_setParentMessage_);
  [(ETMessage *)self setDelayWisp:a3 != 0];
}

- (void)convertToSimulatedPlaybackSpeed
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_strokes, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v17 = 96;
  uint64_t v18 = self;
  obuint64_t j = self->_strokes;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v20 = *(void *)v29;
    double v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count", v17, v18));
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              unint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              __int16 v23 = 0;
              int v22 = 0;
              [v14 getValue:&v22];
              __int16 v23 = llround(v5 * 1000.0);
              id v15 = [MEMORY[0x263F08D40] valueWithBytes:&v22 objCType:"{?={?=SS}{?=S}}"];
              [v8 addObject:v15];

              double v5 = v5 + 0.01666;
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v11);
        }

        [v21 addObject:v8];
        double v5 = v5 + 0.3;
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v4);
  }

  uint64_t v16 = *(Class *)((char *)&v18->super.super.isa + v17);
  *(Class *)((char *)&v18->super.super.isa + v17) = (Class)v21;

  [(ETMessage *)v18 setSupportsPlaybackTimeOffset:1];
}

- (double)messageDuration
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(ETMessage *)self supportsPlaybackTimeOffset])
  {
    uint64_t v3 = [(NSMutableArray *)self->_strokes lastObject];
    uint64_t v4 = [v3 lastObject];

    if (v4)
    {
      __int16 v18 = 0;
      int v17 = 0;
      [(NSMutableArray *)v4 getValue:&v17];
      LOWORD(v5) = v18;
      double v6 = (double)v5 / 1000.0 + 3.0;
    }
    else
    {
      double v6 = 0.0;
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = self->_strokes;
    uint64_t v7 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v4);
          }
          double v10 = v10
              + (double)(unint64_t)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "count", (void)v13)
              * 0.01666
              + 0.3;
        }
        uint64_t v8 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v8);
      double v6 = v10 + 3.0;
    }
    else
    {
      double v6 = 3.0;
    }
  }

  return v6;
}

- (BOOL)hasMultipleColors
{
  return self->_hasMultipleColors;
}

- (void)setHasMultipleColors:(BOOL)a3
{
  self->_hasMultipleColors = a3;
}

- (BOOL)didEndWisping
{
  return self->_didEndWisping;
}

- (void)setDidEndWisping:(BOOL)a3
{
  self->_didEndWisping = a3;
}

- (BOOL)didDrawPoints
{
  return self->_didDrawPoints;
}

- (void)setDidDrawPoints:(BOOL)a3
{
  self->_didDrawPoints = a3;
}

- (BOOL)hideComet
{
  return self->_hideComet;
}

- (void)setHideComet:(BOOL)a3
{
  self->_hideComet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsInMessage, 0);

  objc_storeStrong((id *)&self->_strokes, 0);
}

@end