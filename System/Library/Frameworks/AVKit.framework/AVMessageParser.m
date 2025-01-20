@interface AVMessageParser
+ (AVMessageParser)airMessageParser;
- (AVMessageParser)init;
- (AVMessageParser)initWithLineSeparator:(id)a3 headerBodySeparator:(id)a4 bodyLengthKey:(id)a5 compressionMethodKey:(id)a6;
- (NSData)headerBodySeparatorData;
- (NSData)lineSeparatorData;
- (NSString)bodyLengthKey;
- (NSString)compressionMethodKey;
- (NSString)headerBodySeparator;
- (NSString)lineSeparator;
- (id)partsWithData:(id)a3;
- (void)setBodyLengthKey:(id)a3;
- (void)setCompressionMethodKey:(id)a3;
- (void)setHeaderBodySeparator:(id)a3;
- (void)setHeaderBodySeparatorData:(id)a3;
- (void)setLineSeparator:(id)a3;
- (void)setLineSeparatorData:(id)a3;
@end

@implementation AVMessageParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerBodySeparatorData, 0);
  objc_storeStrong((id *)&self->_lineSeparatorData, 0);
  objc_storeStrong((id *)&self->_compressionMethodKey, 0);
  objc_storeStrong((id *)&self->_bodyLengthKey, 0);
  objc_storeStrong((id *)&self->_headerBodySeparator, 0);

  objc_storeStrong((id *)&self->_lineSeparator, 0);
}

- (void)setHeaderBodySeparatorData:(id)a3
{
}

- (NSData)headerBodySeparatorData
{
  return self->_headerBodySeparatorData;
}

- (void)setLineSeparatorData:(id)a3
{
}

- (NSData)lineSeparatorData
{
  return self->_lineSeparatorData;
}

- (void)setCompressionMethodKey:(id)a3
{
}

- (NSString)compressionMethodKey
{
  return self->_compressionMethodKey;
}

- (void)setBodyLengthKey:(id)a3
{
}

- (NSString)bodyLengthKey
{
  return self->_bodyLengthKey;
}

- (NSString)headerBodySeparator
{
  return self->_headerBodySeparator;
}

- (NSString)lineSeparator
{
  return self->_lineSeparator;
}

- (id)partsWithData:(id)a3
{
  id v4 = a3;
  v5 = [(AVMessageParser *)self lineSeparator];
  v6 = [(AVMessageParser *)self lineSeparatorData];
  v7 = [(AVMessageParser *)self headerBodySeparator];
  v8 = [(AVMessageParser *)self headerBodySeparatorData];
  v9 = [(AVMessageParser *)self bodyLengthKey];
  v10 = +[AVAirMessageParts messagePartsWithData:v4 lineSeparator:v5 data:v6 headerBodySeparator:v7 data:v8 bodyLengthKey:v9];

  v11 = [(AVMessageParser *)self compressionMethodKey];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [v10 uniqueHeaders];
    v14 = [(AVMessageParser *)self compressionMethodKey];
    v15 = [v13 objectForKeyedSubscript:v14];

    if ([v15 length])
    {
      v16 = [v10 decompressBodyUsingNamedAlgorithm:v15];
      [v10 setUncompressedBodyData:v16];
    }
  }

  return v10;
}

- (void)setHeaderBodySeparator:(id)a3
{
  if (self->_headerBodySeparator != a3)
  {
    id v4 = a3;
    v5 = (NSString *)[v4 copy];
    headerBodySeparator = self->_headerBodySeparator;
    self->_headerBodySeparator = v5;

    id v7 = [v4 dataUsingEncoding:1];

    [(AVMessageParser *)self setHeaderBodySeparatorData:v7];
  }
}

- (void)setLineSeparator:(id)a3
{
  if (self->_lineSeparator != a3)
  {
    id v4 = a3;
    v5 = (NSString *)[v4 copy];
    lineSeparator = self->_lineSeparator;
    self->_lineSeparator = v5;

    id v7 = [v4 dataUsingEncoding:1];

    [(AVMessageParser *)self setLineSeparatorData:v7];
  }
}

- (AVMessageParser)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVMessageParser;
  v2 = [(AVMessageParser *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AVMessageParser *)v2 setLineSeparator:@"\n"];
    [(AVMessageParser *)v3 setHeaderBodySeparator:@"\n\n"];
  }
  return v3;
}

- (AVMessageParser)initWithLineSeparator:(id)a3 headerBodySeparator:(id)a4 bodyLengthKey:(id)a5 compressionMethodKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AVMessageParser;
  v14 = [(AVMessageParser *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(AVMessageParser *)v14 setLineSeparator:v10];
    [(AVMessageParser *)v15 setHeaderBodySeparator:v11];
    [(AVMessageParser *)v15 setBodyLengthKey:v12];
    [(AVMessageParser *)v15 setCompressionMethodKey:v13];
  }

  return v15;
}

+ (AVMessageParser)airMessageParser
{
  if (airMessageParser_onceToken != -1) {
    dispatch_once(&airMessageParser_onceToken, &__block_literal_global_20176);
  }
  v2 = (void *)airMessageParser__shared;

  return (AVMessageParser *)v2;
}

uint64_t __50__AVMessageParser_AVAirMessages__airMessageParser__block_invoke()
{
  v0 = objc_alloc_init(AVMessageParser);
  v1 = (void *)airMessageParser__shared;
  airMessageParser__shared = (uint64_t)v0;

  [(id)airMessageParser__shared setLineSeparator:@"\n"];
  [(id)airMessageParser__shared setHeaderBodySeparator:@"\n\n"];
  [(id)airMessageParser__shared setBodyLengthKey:@"length"];
  v2 = (void *)airMessageParser__shared;

  return [v2 setCompressionMethodKey:@"compression"];
}

@end