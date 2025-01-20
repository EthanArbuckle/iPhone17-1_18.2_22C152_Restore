@interface VCPProtoMovieSceneprintResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sceneprintBlob;
- (VCPProtoTime)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSceneprintBlob:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieSceneprintResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSceneprintResult;
  v4 = [(VCPProtoMovieSceneprintResult *)&v8 description];
  v5 = [(VCPProtoMovieSceneprintResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v5 = [(VCPProtoTime *)timestamp dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
  sceneprintBlob = self->_sceneprintBlob;
  if (sceneprintBlob) {
    [v3 setObject:sceneprintBlob forKey:@"sceneprintBlob"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSceneprintResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 setTimestamp:timestamp];
  [v5 setSceneprintBlob:self->_sceneprintBlob];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTime *)self->_timestamp copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_sceneprintBlob copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timestamp = self->_timestamp, !((unint64_t)timestamp | v4[2]))
     || -[VCPProtoTime isEqual:](timestamp, "isEqual:")))
  {
    sceneprintBlob = self->_sceneprintBlob;
    if ((unint64_t)sceneprintBlob | v4[1]) {
      char v7 = -[NSData isEqual:](sceneprintBlob, "isEqual:");
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
  unint64_t v3 = [(VCPProtoTime *)self->_timestamp hash];
  return [(NSData *)self->_sceneprintBlob hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  timestamp = self->_timestamp;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (timestamp)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoTime mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoMovieSceneprintResult setTimestamp:](self, "setTimestamp:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[VCPProtoMovieSceneprintResult setSceneprintBlob:](self, "setSceneprintBlob:");
    v4 = v7;
  }
}

- (VCPProtoTime)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSData)sceneprintBlob
{
  return self->_sceneprintBlob;
}

- (void)setSceneprintBlob:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sceneprintBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  memset(&v12, 0, sizeof(v12));
  CFDictionaryRef v4 = [v3 objectForKeyedSubscript:@"start"];
  CMTimeMakeFromDictionary(&v12, v4);

  id v5 = [v3 objectForKeyedSubscript:@"attributes"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"sceneprint"];
  char v7 = (void *)v6;
  uint64_t v8 = 0;
  if ((v12.flags & 1) != 0 && v6)
  {
    uint64_t v8 = objc_alloc_init(VCPProtoMovieSceneprintResult);
    CMTime v11 = v12;
    v9 = +[VCPProtoTime timeWithCMTime:&v11];
    [(VCPProtoMovieSceneprintResult *)v8 setTimestamp:v9];

    [(VCPProtoMovieSceneprintResult *)v8 setSceneprintBlob:v7];
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"start";
  id v3 = [(VCPProtoMovieSceneprintResult *)self timestamp];
  CFDictionaryRef v4 = v3;
  if (v3) {
    [v3 timeValue];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CMTime time = v10;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&time, 0);
  v15[0] = v5;
  v14[1] = @"attributes";
  CMTime v12 = @"sceneprint";
  uint64_t v6 = [(VCPProtoMovieSceneprintResult *)self sceneprintBlob];
  v13 = v6;
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

@end