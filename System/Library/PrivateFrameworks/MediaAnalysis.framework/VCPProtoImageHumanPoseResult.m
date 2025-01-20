@interface VCPProtoImageHumanPoseResult
+ (Class)keypointsType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keypoints;
- (VCPProtoBounds)bounds;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (id)keypointsAtIndex:(unint64_t)a3;
- (int)flags;
- (unint64_t)hash;
- (unint64_t)keypointsCount;
- (void)addKeypoints:(id)a3;
- (void)clearKeypoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setFlags:(int)a3;
- (void)setKeypoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageHumanPoseResult

- (void)clearKeypoints
{
}

- (void)addKeypoints:(id)a3
{
  id v4 = a3;
  keypoints = self->_keypoints;
  id v8 = v4;
  if (!keypoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_keypoints;
    self->_keypoints = v6;

    id v4 = v8;
    keypoints = self->_keypoints;
  }
  [(NSMutableArray *)keypoints addObject:v4];
}

- (unint64_t)keypointsCount
{
  return [(NSMutableArray *)self->_keypoints count];
}

- (id)keypointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keypoints objectAtIndex:a3];
}

+ (Class)keypointsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageHumanPoseResult;
  id v4 = [(VCPProtoImageHumanPoseResult *)&v8 description];
  v5 = [(VCPProtoImageHumanPoseResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_confidence;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"confidence"];

  bounds = self->_bounds;
  if (bounds)
  {
    v7 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"bounds"];
  }
  objc_super v8 = [NSNumber numberWithInt:self->_flags];
  [v3 setObject:v8 forKey:@"flags"];

  if ([(NSMutableArray *)self->_keypoints count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_keypoints, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_keypoints;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"keypoints"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageHumanPoseResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_keypoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  v8[4] = LODWORD(self->_confidence);
  [v8 setBounds:self->_bounds];
  v8[5] = self->_flags;
  if ([(VCPProtoImageHumanPoseResult *)self keypointsCount])
  {
    [v8 clearKeypoints];
    unint64_t v4 = [(VCPProtoImageHumanPoseResult *)self keypointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VCPProtoImageHumanPoseResult *)self keypointsAtIndex:i];
        [v8 addKeypoints:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 16) = self->_confidence;
  id v6 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 20) = self->_flags;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_keypoints;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addKeypoints:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_confidence == *((float *)v4 + 4)
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[1])) || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_flags == *((_DWORD *)v4 + 5))
  {
    keypoints = self->_keypoints;
    if ((unint64_t)keypoints | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](keypoints, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float confidence = self->_confidence;
  float v4 = -confidence;
  if (confidence >= 0.0) {
    float v4 = self->_confidence;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  unint64_t v12 = [(VCPProtoBounds *)self->_bounds hash];
  uint64_t v13 = v11 ^ (2654435761 * self->_flags);
  return v12 ^ [(NSMutableArray *)self->_keypoints hash] ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_float confidence = *((float *)v4 + 4);
  bounds = self->_bounds;
  uint64_t v6 = *((void *)v4 + 1);
  if (bounds)
  {
    if (v6) {
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCPProtoImageHumanPoseResult setBounds:](self, "setBounds:");
  }
  self->_flags = *((_DWORD *)v4 + 5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[VCPProtoImageHumanPoseResult addKeypoints:](self, "addKeypoints:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (NSMutableArray)keypoints
{
  return self->_keypoints;
}

- (void)setKeypoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keypoints, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"flags"];
  float v5 = [v3 objectForKeyedSubscript:@"attributes"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"humanConfidence"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"humanBounds"];
  uint64_t v8 = (NSString *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v4 == 0)
  {
    long long v12 = 0;
  }
  else
  {
    uint64_t v11 = [v4 unsignedIntegerValue];
    long long v12 = objc_alloc_init(VCPProtoImageHumanPoseResult);
    [v6 floatValue];
    -[VCPProtoImageHumanPoseResult setConfidence:](v12, "setConfidence:");
    NSRect v16 = NSRectFromString(v8);
    long long v13 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    [(VCPProtoImageHumanPoseResult *)v12 setBounds:v13];

    [(VCPProtoImageHumanPoseResult *)v12 setFlags:v11];
  }

  return v12;
}

- (id)exportToLegacyDictionary
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"attributes";
  v11[0] = @"humanConfidence";
  id v3 = NSNumber;
  [(VCPProtoImageHumanPoseResult *)self confidence];
  id v4 = objc_msgSend(v3, "numberWithFloat:");
  v12[0] = v4;
  v11[1] = @"humanBounds";
  float v5 = [(VCPProtoImageHumanPoseResult *)self bounds];
  [v5 rectValue];
  uint64_t v6 = NSStringFromRect(v16);
  v12[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v7;
  v13[1] = @"flags";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoImageHumanPoseResult flags](self, "flags"));
  v14[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v9;
}

@end