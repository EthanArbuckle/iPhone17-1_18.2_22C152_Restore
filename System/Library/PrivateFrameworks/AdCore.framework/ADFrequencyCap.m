@interface ADFrequencyCap
- (ADFrequencyCap)initWithDictionary:(id)a3;
- (ADFrequencyCap)initWithIdentifier:(id)a3;
- (NSString)adMetadata;
- (NSString)identifier;
- (double)setTime;
- (id)description;
- (id)dictionaryRepresentation;
- (id)splitCapData:(id)a3;
- (int64_t)downloadType;
- (void)setAdMetadata:(id)a3;
- (void)setDownloadType:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setSetTime:(double)a3;
@end

@implementation ADFrequencyCap

- (ADFrequencyCap)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADFrequencyCap;
  v5 = [(ADFrequencyCap *)&v15 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(ADFrequencyCap *)v5 splitCapData:v4];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"ADIdentifierKey"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = [v7 objectForKeyedSubscript:@"ADAdMetadataKey"];
    adMetadata = v6->_adMetadata;
    v6->_adMetadata = (NSString *)v10;

    v6->_downloadType = 0;
    v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSince1970];
    v6->_setTime = v13;
  }
  return v6;
}

- (ADFrequencyCap)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ADFrequencyCap;
  v5 = [(ADFrequencyCap *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ADIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ADAdMetadataKey"];
    adMetadata = v5->_adMetadata;
    v5->_adMetadata = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"ADDownloadTypeKey"];
    v5->_downloadType = (int)[v10 intValue];

    v11 = [v4 objectForKeyedSubscript:@"ADSetTimeKey"];
    [v11 doubleValue];
    v5->_setTime = v12;
  }
  return v5;
}

- (id)splitCapData:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [v3 componentsSeparatedByString:@"|"];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v5 objectAtIndex:0];
    [v4 setObject:v8 forKeyedSubscript:@"ADIdentifierKey"];

    if (v7 != 1)
    {
      v9 = [MEMORY[0x1E4F28E78] string];
      for (unint64_t i = 1; i != v7; ++i)
      {
        if (i >= 2)
        {
          v11 = [v9 stringByAppendingString:@"|"];
          uint64_t v12 = [v11 mutableCopy];

          v9 = (void *)v12;
        }
        double v13 = v9;
        objc_super v14 = [v5 objectAtIndex:i];
        objc_super v15 = [v9 stringByAppendingString:v14];
        v9 = (void *)[v15 mutableCopy];
      }
      [v4 setObject:v9 forKeyedSubscript:@"ADAdMetadataKey"];
    }
  }
  v16 = (void *)[v4 copy];

  return v16;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_identifier forKeyedSubscript:@"ADIdentifierKey"];
  id v4 = [NSNumber numberWithDouble:self->_setTime];
  [v3 setObject:v4 forKeyedSubscript:@"ADSetTimeKey"];

  adMetadata = self->_adMetadata;
  if (adMetadata) {
    [v3 setObject:adMetadata forKeyedSubscript:@"ADAdMetadataKey"];
  }
  uint64_t v6 = [NSNumber numberWithInt:LODWORD(self->_downloadType)];
  [v3 setObject:v6 forKeyedSubscript:@"ADDownloadTypeKey"];

  return v3;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(ADFrequencyCap *)self dictionaryRepresentation];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
}

- (int64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(int64_t)a3
{
  self->_downloadType = a3;
}

- (double)setTime
{
  return self->_setTime;
}

- (void)setSetTime:(double)a3
{
  self->_setTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end