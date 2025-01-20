@interface VCPProtoImageFeatureResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)featureBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatureBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageFeatureResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageFeatureResult;
  v4 = [(VCPProtoImageFeatureResult *)&v8 description];
  v5 = [(VCPProtoImageFeatureResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  featureBlob = self->_featureBlob;
  if (featureBlob) {
    [v3 setObject:featureBlob forKey:@"featureBlob"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageFeatureResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_featureBlob copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    featureBlob = self->_featureBlob;
    if ((unint64_t)featureBlob | v4[1]) {
      char v6 = -[NSData isEqual:](featureBlob, "isEqual:");
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
  return [(NSData *)self->_featureBlob hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[VCPProtoImageFeatureResult setFeatureBlob:](self, "setFeatureBlob:");
  }
}

- (NSData)featureBlob
{
  return self->_featureBlob;
}

- (void)setFeatureBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"featureVector"];
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageFeatureResult);
    [(VCPProtoImageFeatureResult *)v5 setFeatureBlob:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v8 = @"attributes";
  char v6 = @"featureVector";
  v2 = [(VCPProtoImageFeatureResult *)self featureBlob];
  v7 = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

@end