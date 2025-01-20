@interface VCPProtoMoviePreEncodeResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)statisticsBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStatisticsBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMoviePreEncodeResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"Data"];
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoMoviePreEncodeResult);
    [(VCPProtoMoviePreEncodeResult *)v5 setStatisticsBlob:v4];
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
  v8 = @"attributes";
  v6 = @"Data";
  v2 = [(VCPProtoMoviePreEncodeResult *)self statisticsBlob];
  v7 = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMoviePreEncodeResult;
  v4 = [(VCPProtoMoviePreEncodeResult *)&v8 description];
  v5 = [(VCPProtoMoviePreEncodeResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  statisticsBlob = self->_statisticsBlob;
  if (statisticsBlob) {
    [v3 setObject:statisticsBlob forKey:@"statisticsBlob"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMoviePreEncodeResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  uint64_t v6 = [(NSData *)self->_statisticsBlob copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    statisticsBlob = self->_statisticsBlob;
    if ((unint64_t)statisticsBlob | v4[1]) {
      char v6 = -[NSData isEqual:](statisticsBlob, "isEqual:");
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
  return [(NSData *)self->_statisticsBlob hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[VCPProtoMoviePreEncodeResult setStatisticsBlob:](self, "setStatisticsBlob:");
  }
}

- (NSData)statisticsBlob
{
  return self->_statisticsBlob;
}

- (void)setStatisticsBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end