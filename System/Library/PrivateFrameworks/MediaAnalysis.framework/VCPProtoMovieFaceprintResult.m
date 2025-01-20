@interface VCPProtoMovieFaceprintResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)faceprintBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (unsigned)faceID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFaceID:(unsigned int)a3;
- (void)setFaceprintBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieFaceprintResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieFaceprintResult;
  v4 = [(VCPProtoMovieFaceprintResult *)&v8 description];
  v5 = [(VCPProtoMovieFaceprintResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_faceID];
  [v3 setObject:v4 forKey:@"faceID"];

  faceprintBlob = self->_faceprintBlob;
  if (faceprintBlob) {
    [v3 setObject:faceprintBlob forKey:@"faceprintBlob"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieFaceprintResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_faceID;
  [a3 setFaceprintBlob:self->_faceprintBlob];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_faceID;
  uint64_t v6 = [(NSData *)self->_faceprintBlob copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_faceID == *((_DWORD *)v4 + 2))
  {
    faceprintBlob = self->_faceprintBlob;
    if ((unint64_t)faceprintBlob | v4[2]) {
      char v6 = -[NSData isEqual:](faceprintBlob, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_faceID;
  return [(NSData *)self->_faceprintBlob hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_faceID = *((_DWORD *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[VCPProtoMovieFaceprintResult setFaceprintBlob:](self, "setFaceprintBlob:");
  }
}

- (unsigned)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(unsigned int)a3
{
  self->_faceID = a3;
}

- (NSData)faceprintBlob
{
  return self->_faceprintBlob;
}

- (void)setFaceprintBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"faceId"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"facePrint"];
  char v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    objc_super v8 = 0;
  }
  else
  {
    objc_super v8 = objc_alloc_init(VCPProtoMovieFaceprintResult);
    -[VCPProtoMovieFaceprintResult setFaceID:](v8, "setFaceID:", [v4 unsignedIntValue]);
    [(VCPProtoMovieFaceprintResult *)v8 setFaceprintBlob:v6];
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = @"attributes";
  v8[0] = @"faceId";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoMovieFaceprintResult faceID](self, "faceID"));
  v9[0] = v3;
  v8[1] = @"facePrint";
  v4 = [(VCPProtoMovieFaceprintResult *)self faceprintBlob];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v11[0] = v5;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

@end