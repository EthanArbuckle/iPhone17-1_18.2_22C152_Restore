@interface VCPProtoLivePhotoEffectsRecipe
+ (Class)frameInstructionsType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasEpoch;
- (BOOL)hasFlags;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)frameInstructions;
- (VCPProtoLivePhotoVariationParams)autoloop;
- (VCPProtoLivePhotoVariationParams)bounce;
- (VCPProtoLivePhotoVariationParams)longexposure;
- (VCPProtoLivePhotoVariationParams)stabilize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (id)exportToLegacyDictionaryFromFrameInstruction:(id)a3;
- (id)exportToLegacyDictionaryFromParam:(id)a3 withLoopFlavor:(id)a4;
- (id)frameInstructionsAtIndex:(unint64_t)a3;
- (int)cropRectHeight;
- (int)cropRectWidth;
- (int)cropRectX;
- (int)cropRectY;
- (int)flags;
- (int)minVersion;
- (int)stabilizeResult;
- (int)timeScale;
- (int)version;
- (int64_t)epoch;
- (int64_t)outputFrameDurValue;
- (unint64_t)frameInstructionsCount;
- (unint64_t)hash;
- (void)addFrameInstructions:(id)a3;
- (void)clearFrameInstructions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutoloop:(id)a3;
- (void)setBounce:(id)a3;
- (void)setCropRectHeight:(int)a3;
- (void)setCropRectWidth:(int)a3;
- (void)setCropRectX:(int)a3;
- (void)setCropRectY:(int)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setFlags:(int)a3;
- (void)setFrameInstructions:(id)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setLongexposure:(id)a3;
- (void)setMinVersion:(int)a3;
- (void)setOutputFrameDurValue:(int64_t)a3;
- (void)setStabilize:(id)a3;
- (void)setStabilizeResult:(int)a3;
- (void)setTimeScale:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoEffectsRecipe

+ (id)resultFromLegacyDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v27 = [v3 objectForKeyedSubscript:@"AutoLoop"];
    v26 = [v4 objectForKeyedSubscript:@"Bounce"];
    v25 = [v4 objectForKeyedSubscript:@"LongExposure"];
    v24 = [v4 objectForKeyedSubscript:@"Stabilize"];
    v5 = [v4 objectForKeyedSubscript:@"NormStabilizeInstructions"];
    v31 = +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:v27];
    v30 = +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:v26];
    v29 = +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:v25];
    uint64_t v6 = +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:v24];
    v7 = (void *)v6;
    v8 = 0;
    if (v31 && v30 && v29 && v6)
    {
      v28 = [v5 objectForKeyedSubscript:@"stabCropRect"];
      memset(&v36, 0, sizeof(v36));
      CFDictionaryRef v9 = [v5 objectForKeyedSubscript:@"outputFrameDur"];
      CMTimeMakeFromDictionary(&v36, v9);

      v23 = [v5 objectForKeyedSubscript:@"frameInstructions"];
      v8 = objc_alloc_init(VCPProtoLivePhotoEffectsRecipe);
      v10 = [v4 objectForKeyedSubscript:@"Version"];
      -[VCPProtoLivePhotoEffectsRecipe setVersion:](v8, "setVersion:", [v10 intValue]);

      v11 = [v4 objectForKeyedSubscript:@"MinVersion"];
      -[VCPProtoLivePhotoEffectsRecipe setMinVersion:](v8, "setMinVersion:", [v11 intValue]);

      [(VCPProtoLivePhotoEffectsRecipe *)v8 setAutoloop:v31];
      [(VCPProtoLivePhotoEffectsRecipe *)v8 setBounce:v30];
      [(VCPProtoLivePhotoEffectsRecipe *)v8 setLongexposure:v29];
      [(VCPProtoLivePhotoEffectsRecipe *)v8 setStabilize:v7];
      v12 = [v28 objectForKeyedSubscript:@"X"];
      -[VCPProtoLivePhotoEffectsRecipe setCropRectX:](v8, "setCropRectX:", [v12 intValue]);

      v13 = [v28 objectForKeyedSubscript:@"Y"];
      -[VCPProtoLivePhotoEffectsRecipe setCropRectY:](v8, "setCropRectY:", [v13 intValue]);

      v14 = [v28 objectForKeyedSubscript:@"Width"];
      -[VCPProtoLivePhotoEffectsRecipe setCropRectWidth:](v8, "setCropRectWidth:", [v14 intValue]);

      v15 = [v28 objectForKeyedSubscript:@"Height"];
      -[VCPProtoLivePhotoEffectsRecipe setCropRectHeight:](v8, "setCropRectHeight:", [v15 intValue]);

      v16 = [v5 objectForKeyedSubscript:@"stabilizeResult"];
      -[VCPProtoLivePhotoEffectsRecipe setStabilizeResult:](v8, "setStabilizeResult:", [v16 intValue]);

      [(VCPProtoLivePhotoEffectsRecipe *)v8 setOutputFrameDurValue:v36.value];
      [(VCPProtoLivePhotoEffectsRecipe *)v8 setTimeScale:v36.timescale];
      [(VCPProtoLivePhotoEffectsRecipe *)v8 setEpoch:v36.epoch];
      [(VCPProtoLivePhotoEffectsRecipe *)v8 setFlags:v36.flags];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = v23;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = +[VCPProtoLivePhotoFrameInstruction resultFromLegacyDictionary:*(void *)(*((void *)&v32 + 1) + 8 * i)];
            [(VCPProtoLivePhotoEffectsRecipe *)v8 addFrameInstructions:v21];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v18);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v31[4] = *MEMORY[0x1E4F143B8];
  memset(&v28, 0, sizeof(v28));
  CMTimeMakeWithEpoch(&v28, [(VCPProtoLivePhotoEffectsRecipe *)self outputFrameDurValue], [(VCPProtoLivePhotoEffectsRecipe *)self timeScale], [(VCPProtoLivePhotoEffectsRecipe *)self epoch]);
  v28.flags = [(VCPProtoLivePhotoEffectsRecipe *)self flags];
  v30[0] = @"X";
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectX](self, "cropRectX"));
  v31[0] = v3;
  v30[1] = @"Y";
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectY](self, "cropRectY"));
  v31[1] = v4;
  v30[2] = @"Width";
  v5 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectWidth](self, "cropRectWidth"));
  v31[2] = v5;
  v30[3] = @"Height";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectHeight](self, "cropRectHeight"));
  v31[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];

  v8 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; [(VCPProtoLivePhotoEffectsRecipe *)self frameInstructionsCount] > i; ++i)
  {
    v10 = [(VCPProtoLivePhotoEffectsRecipe *)self frameInstructions];
    v11 = [v10 objectAtIndex:i];

    v12 = [(VCPProtoLivePhotoEffectsRecipe *)self exportToLegacyDictionaryFromFrameInstruction:v11];
    [v8 addObject:v12];
  }
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  CMTime time = v28;
  CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time, 0);
  [v13 setObject:v14 forKeyedSubscript:@"outputFrameDur"];

  [v13 setObject:v7 forKeyedSubscript:@"stabCropRect"];
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe stabilizeResult](self, "stabilizeResult"));
  [v13 setObject:v15 forKeyedSubscript:@"stabilizeResult"];

  [v13 setObject:v8 forKeyedSubscript:@"frameInstructions"];
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  id v17 = [(VCPProtoLivePhotoEffectsRecipe *)self autoloop];
  uint64_t v18 = [(VCPProtoLivePhotoEffectsRecipe *)self exportToLegacyDictionaryFromParam:v17 withLoopFlavor:@"AutoLoop"];
  [v16 setObject:v18 forKeyedSubscript:@"AutoLoop"];

  uint64_t v19 = [(VCPProtoLivePhotoEffectsRecipe *)self bounce];
  v20 = [(VCPProtoLivePhotoEffectsRecipe *)self exportToLegacyDictionaryFromParam:v19 withLoopFlavor:@"Bounce"];
  [v16 setObject:v20 forKeyedSubscript:@"Bounce"];

  v21 = [(VCPProtoLivePhotoEffectsRecipe *)self longexposure];
  v22 = [(VCPProtoLivePhotoEffectsRecipe *)self exportToLegacyDictionaryFromParam:v21 withLoopFlavor:@"LongExposure"];
  [v16 setObject:v22 forKeyedSubscript:@"LongExposure"];

  v23 = [(VCPProtoLivePhotoEffectsRecipe *)self stabilize];
  v24 = [(VCPProtoLivePhotoEffectsRecipe *)self exportToLegacyDictionaryFromParam:v23 withLoopFlavor:@"Stabilize"];
  [v16 setObject:v24 forKeyedSubscript:@"Stabilize"];

  v25 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe version](self, "version"));
  [v16 setObject:v25 forKeyedSubscript:@"Version"];

  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe minVersion](self, "minVersion"));
  [v16 setObject:v26 forKeyedSubscript:@"MinVersion"];

  [v16 setObject:v13 forKeyedSubscript:@"NormStabilizeInstructions"];
  return v16;
}

- (id)exportToLegacyDictionaryFromFrameInstruction:(id)a3
{
  id v3 = a3;
  v4 = [v3 exportToLegacyDictionary];
  v5 = (void *)[v4 mutableCopy];

  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, [v3 timeValue], objc_msgSend(v3, "timeScale"));
  v8.epoch = [v3 epoch];
  v8.flags = [v3 flags];
  CMTime time = v8;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&time, 0);
  [v5 setObject:v6 forKeyedSubscript:@"rawTime"];

  return v5;
}

- (id)exportToLegacyDictionaryFromParam:(id)a3 withLoopFlavor:(id)a4
{
  id v5 = a4;
  CFDictionaryRef v6 = [a3 exportToLegacyDictionary];
  v7 = (void *)[v6 mutableCopy];

  CMTime v8 = [v7 objectForKeyedSubscript:@"Params"];
  CFDictionaryRef v9 = (void *)[v8 mutableCopy];

  [v9 setObject:v5 forKeyedSubscript:@"loopFlavor"];
  [v9 setObject:&unk_1F15EAC78 forKeyedSubscript:@"loopEnergy"];
  [v7 setObject:v9 forKeyedSubscript:@"Params"];

  return v7;
}

- (void)setEpoch:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpoch
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFlags:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlags
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearFrameInstructions
{
}

- (void)addFrameInstructions:(id)a3
{
  id v4 = a3;
  frameInstructions = self->_frameInstructions;
  id v8 = v4;
  if (!frameInstructions)
  {
    CFDictionaryRef v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_frameInstructions;
    self->_frameInstructions = v6;

    id v4 = v8;
    frameInstructions = self->_frameInstructions;
  }
  [(NSMutableArray *)frameInstructions addObject:v4];
}

- (unint64_t)frameInstructionsCount
{
  return [(NSMutableArray *)self->_frameInstructions count];
}

- (id)frameInstructionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_frameInstructions objectAtIndex:a3];
}

+ (Class)frameInstructionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoEffectsRecipe;
  id v4 = [(VCPProtoLivePhotoEffectsRecipe *)&v8 description];
  id v5 = [(VCPProtoLivePhotoEffectsRecipe *)self dictionaryRepresentation];
  CFDictionaryRef v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithInt:self->_stabilizeResult];
  [v3 setObject:v4 forKey:@"stabilizeResult"];

  id v5 = [NSNumber numberWithLongLong:self->_outputFrameDurValue];
  [v3 setObject:v5 forKey:@"outputFrameDurValue"];

  CFDictionaryRef v6 = [NSNumber numberWithInt:self->_cropRectX];
  [v3 setObject:v6 forKey:@"cropRectX"];

  v7 = [NSNumber numberWithInt:self->_cropRectY];
  [v3 setObject:v7 forKey:@"cropRectY"];

  objc_super v8 = [NSNumber numberWithInt:self->_cropRectHeight];
  [v3 setObject:v8 forKey:@"cropRectHeight"];

  CFDictionaryRef v9 = [NSNumber numberWithInt:self->_cropRectWidth];
  [v3 setObject:v9 forKey:@"cropRectWidth"];

  v10 = [NSNumber numberWithInt:self->_timeScale];
  [v3 setObject:v10 forKey:@"timeScale"];

  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithLongLong:self->_epoch];
    [v3 setObject:v12 forKey:@"epoch"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_flags];
    [v3 setObject:v13 forKey:@"flags"];
  }
  if ([(NSMutableArray *)self->_frameInstructions count])
  {
    CFDictionaryRef v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_frameInstructions, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v15 = self->_frameInstructions;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "dictionaryRepresentation", (void)v32);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"frameInstructions"];
  }
  autoloop = self->_autoloop;
  if (autoloop)
  {
    v22 = [(VCPProtoLivePhotoVariationParams *)autoloop dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"autoloop"];
  }
  bounce = self->_bounce;
  if (bounce)
  {
    v24 = [(VCPProtoLivePhotoVariationParams *)bounce dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"bounce"];
  }
  longexposure = self->_longexposure;
  if (longexposure)
  {
    v26 = [(VCPProtoLivePhotoVariationParams *)longexposure dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"longexposure"];
  }
  stabilize = self->_stabilize;
  if (stabilize)
  {
    CMTime v28 = [(VCPProtoLivePhotoVariationParams *)stabilize dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"stabilize"];
  }
  v29 = objc_msgSend(NSNumber, "numberWithInt:", self->_minVersion, (void)v32);
  [v3 setObject:v29 forKey:@"minVersion"];

  v30 = [NSNumber numberWithInt:self->_version];
  [v3 setObject:v30 forKey:@"version"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoEffectsRecipeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFDictionaryRef v6 = self->_frameInstructions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[24] = self->_stabilizeResult;
  *((void *)v4 + 2) = self->_outputFrameDurValue;
  v4[12] = self->_cropRectX;
  v4[13] = self->_cropRectY;
  v4[10] = self->_cropRectHeight;
  v4[11] = self->_cropRectWidth;
  v4[25] = self->_timeScale;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_epoch;
    *((unsigned char *)v4 + 108) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[14] = self->_flags;
    *((unsigned char *)v4 + 108) |= 2u;
  }
  v10 = v4;
  if ([(VCPProtoLivePhotoEffectsRecipe *)self frameInstructionsCount])
  {
    [v10 clearFrameInstructions];
    unint64_t v6 = [(VCPProtoLivePhotoEffectsRecipe *)self frameInstructionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(VCPProtoLivePhotoEffectsRecipe *)self frameInstructionsAtIndex:i];
        [v10 addFrameInstructions:v9];
      }
    }
  }
  [v10 setAutoloop:self->_autoloop];
  [v10 setBounce:self->_bounce];
  [v10 setLongexposure:self->_longexposure];
  [v10 setStabilize:self->_stabilize];
  v10[20] = self->_minVersion;
  v10[26] = self->_version;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 96) = self->_stabilizeResult;
  *(void *)(v5 + 16) = self->_outputFrameDurValue;
  *(_DWORD *)(v5 + 48) = self->_cropRectX;
  *(_DWORD *)(v5 + 52) = self->_cropRectY;
  *(_DWORD *)(v5 + 40) = self->_cropRectHeight;
  *(_DWORD *)(v5 + 44) = self->_cropRectWidth;
  *(_DWORD *)(v5 + 100) = self->_timeScale;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_epoch;
    *(unsigned char *)(v5 + 108) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_flags;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_frameInstructions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v6 addFrameInstructions:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v14 = [(VCPProtoLivePhotoVariationParams *)self->_autoloop copyWithZone:a3];
  v15 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v14;

  id v16 = [(VCPProtoLivePhotoVariationParams *)self->_bounce copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v16;

  id v18 = [(VCPProtoLivePhotoVariationParams *)self->_longexposure copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v18;

  id v20 = [(VCPProtoLivePhotoVariationParams *)self->_stabilize copyWithZone:a3];
  v21 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v20;

  *(_DWORD *)(v6 + 80) = self->_minVersion;
  *(_DWORD *)(v6 + 104) = self->_version;
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_stabilizeResult != *((_DWORD *)v4 + 24)
    || self->_outputFrameDurValue != *((void *)v4 + 2)
    || self->_cropRectX != *((_DWORD *)v4 + 12)
    || self->_cropRectY != *((_DWORD *)v4 + 13)
    || self->_cropRectHeight != *((_DWORD *)v4 + 10)
    || self->_cropRectWidth != *((_DWORD *)v4 + 11)
    || self->_timeScale != *((_DWORD *)v4 + 25))
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_epoch != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
LABEL_31:
    BOOL v10 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_flags != *((_DWORD *)v4 + 14)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_31;
  }
  frameInstructions = self->_frameInstructions;
  if ((unint64_t)frameInstructions | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](frameInstructions, "isEqual:"))
  {
    goto LABEL_31;
  }
  autoloop = self->_autoloop;
  if ((unint64_t)autoloop | *((void *)v4 + 3))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](autoloop, "isEqual:")) {
      goto LABEL_31;
    }
  }
  bounce = self->_bounce;
  if ((unint64_t)bounce | *((void *)v4 + 4))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](bounce, "isEqual:")) {
      goto LABEL_31;
    }
  }
  longexposure = self->_longexposure;
  if ((unint64_t)longexposure | *((void *)v4 + 9))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](longexposure, "isEqual:")) {
      goto LABEL_31;
    }
  }
  stabilize = self->_stabilize;
  if ((unint64_t)stabilize | *((void *)v4 + 11))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](stabilize, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (self->_minVersion != *((_DWORD *)v4 + 20)) {
    goto LABEL_31;
  }
  BOOL v10 = self->_version == *((_DWORD *)v4 + 26);
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_epoch;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_flags;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (2654435761 * self->_outputFrameDurValue) ^ (2654435761 * self->_stabilizeResult) ^ (2654435761
                                                                                              * self->_cropRectX) ^ (2654435761 * self->_cropRectY) ^ (2654435761 * self->_cropRectHeight) ^ (2654435761 * self->_cropRectWidth) ^ (2654435761 * self->_timeScale);
  uint64_t v6 = v3 ^ v4 ^ [(NSMutableArray *)self->_frameInstructions hash];
  unint64_t v7 = v6 ^ [(VCPProtoLivePhotoVariationParams *)self->_autoloop hash];
  unint64_t v8 = v7 ^ [(VCPProtoLivePhotoVariationParams *)self->_bounce hash];
  unint64_t v9 = v8 ^ [(VCPProtoLivePhotoVariationParams *)self->_longexposure hash];
  return v5 ^ v9 ^ [(VCPProtoLivePhotoVariationParams *)self->_stabilize hash] ^ (2654435761 * self->_minVersion) ^ (2654435761 * self->_version);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  self->_stabilizeResult = *((_DWORD *)v4 + 24);
  self->_outputFrameDurValue = *((void *)v4 + 2);
  self->_cropRectX = *((_DWORD *)v4 + 12);
  self->_cropRectY = *((_DWORD *)v4 + 13);
  self->_cropRectHeight = *((_DWORD *)v4 + 10);
  self->_cropRectWidth = *((_DWORD *)v4 + 11);
  self->_timeScale = *((_DWORD *)v4 + 25);
  char v6 = *((unsigned char *)v4 + 108);
  if (v6)
  {
    self->_epoch = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 108);
  }
  if ((v6 & 2) != 0)
  {
    self->_flags = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = *((id *)v4 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        -[VCPProtoLivePhotoEffectsRecipe addFrameInstructions:](self, "addFrameInstructions:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  autoloop = self->_autoloop;
  uint64_t v13 = *((void *)v5 + 3);
  if (autoloop)
  {
    if (v13) {
      -[VCPProtoLivePhotoVariationParams mergeFrom:](autoloop, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[VCPProtoLivePhotoEffectsRecipe setAutoloop:](self, "setAutoloop:");
  }
  bounce = self->_bounce;
  uint64_t v15 = *((void *)v5 + 4);
  if (bounce)
  {
    if (v15) {
      -[VCPProtoLivePhotoVariationParams mergeFrom:](bounce, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[VCPProtoLivePhotoEffectsRecipe setBounce:](self, "setBounce:");
  }
  longexposure = self->_longexposure;
  uint64_t v17 = *((void *)v5 + 9);
  if (longexposure)
  {
    if (v17) {
      -[VCPProtoLivePhotoVariationParams mergeFrom:](longexposure, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[VCPProtoLivePhotoEffectsRecipe setLongexposure:](self, "setLongexposure:");
  }
  stabilize = self->_stabilize;
  uint64_t v19 = *((void *)v5 + 11);
  if (stabilize)
  {
    if (v19) {
      -[VCPProtoLivePhotoVariationParams mergeFrom:](stabilize, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[VCPProtoLivePhotoEffectsRecipe setStabilize:](self, "setStabilize:");
  }
  self->_minVersion = *((_DWORD *)v5 + 20);
  self->_version = *((_DWORD *)v5 + 26);
}

- (int)stabilizeResult
{
  return self->_stabilizeResult;
}

- (void)setStabilizeResult:(int)a3
{
  self->_stabilizeResult = a3;
}

- (int64_t)outputFrameDurValue
{
  return self->_outputFrameDurValue;
}

- (void)setOutputFrameDurValue:(int64_t)a3
{
  self->_outputFrameDurValue = a3;
}

- (int)cropRectX
{
  return self->_cropRectX;
}

- (void)setCropRectX:(int)a3
{
  self->_cropRectX = a3;
}

- (int)cropRectY
{
  return self->_cropRectY;
}

- (void)setCropRectY:(int)a3
{
  self->_cropRectY = a3;
}

- (int)cropRectHeight
{
  return self->_cropRectHeight;
}

- (void)setCropRectHeight:(int)a3
{
  self->_cropRectHeight = a3;
}

- (int)cropRectWidth
{
  return self->_cropRectWidth;
}

- (void)setCropRectWidth:(int)a3
{
  self->_cropRectWidth = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (int)flags
{
  return self->_flags;
}

- (NSMutableArray)frameInstructions
{
  return self->_frameInstructions;
}

- (void)setFrameInstructions:(id)a3
{
}

- (VCPProtoLivePhotoVariationParams)autoloop
{
  return self->_autoloop;
}

- (void)setAutoloop:(id)a3
{
}

- (VCPProtoLivePhotoVariationParams)bounce
{
  return self->_bounce;
}

- (void)setBounce:(id)a3
{
}

- (VCPProtoLivePhotoVariationParams)longexposure
{
  return self->_longexposure;
}

- (void)setLongexposure:(id)a3
{
}

- (VCPProtoLivePhotoVariationParams)stabilize
{
  return self->_stabilize;
}

- (void)setStabilize:(id)a3
{
}

- (int)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(int)a3
{
  self->_minVersion = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilize, 0);
  objc_storeStrong((id *)&self->_longexposure, 0);
  objc_storeStrong((id *)&self->_frameInstructions, 0);
  objc_storeStrong((id *)&self->_bounce, 0);
  objc_storeStrong((id *)&self->_autoloop, 0);
}

@end