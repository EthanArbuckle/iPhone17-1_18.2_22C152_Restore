@interface VCPProtoImageShotTypeResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)shotType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setShotType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageShotTypeResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageShotTypeResult;
  v4 = [(VCPProtoImageShotTypeResult *)&v8 description];
  v5 = [(VCPProtoImageShotTypeResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithInt:self->_shotType];
  [v3 setObject:v4 forKey:@"shotType"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageShotTypeResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_shotType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_shotType;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_shotType == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_shotType;
}

- (void)mergeFrom:(id)a3
{
  self->_shotType = *((_DWORD *)a3 + 2);
}

- (int)shotType
{
  return self->_shotType;
}

- (void)setShotType:(int)a3
{
  self->_shotType = a3;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"shotType"];
  if (v4)
  {
    BOOL v5 = objc_alloc_init(VCPProtoImageShotTypeResult);
    -[VCPProtoImageShotTypeResult setShotType:](v5, "setShotType:", [v4 unsignedIntValue]);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v8 = @"attributes";
  v6 = @"shotType";
  v2 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoImageShotTypeResult shotType](self, "shotType"));
  v7 = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

@end