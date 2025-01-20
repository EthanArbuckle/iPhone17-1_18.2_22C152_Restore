@interface _LTSELFLoggingTranslationLIDData
+ (BOOL)supportsSecureCoding;
- (NSArray)lowConfidenceLocales;
- (NSLocale)topLocale;
- (NSUUID)invocationId;
- (_LTSELFLoggingTranslationLIDData)initWithCoder:(id)a3;
- (_LTSELFLoggingTranslationLIDData)initWithInvocationId:(id)a3 inputSource:(int64_t)a4 topLocale:(id)a5 lowConfidenceLocales:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)inputSource;
- (void)encodeWithCoder:(id)a3;
- (void)setInputSource:(int64_t)a3;
- (void)setLowConfidenceLocales:(id)a3;
- (void)setTopLocale:(id)a3;
@end

@implementation _LTSELFLoggingTranslationLIDData

- (_LTSELFLoggingTranslationLIDData)initWithInvocationId:(id)a3 inputSource:(int64_t)a4 topLocale:(id)a5 lowConfidenceLocales:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_LTSELFLoggingTranslationLIDData;
  v14 = [(_LTSELFLoggingTranslationLIDData *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_invocationId, a3);
    v15->_inputSource = a4;
    objc_storeStrong((id *)&v15->_topLocale, a5);
    objc_storeStrong((id *)&v15->_lowConfidenceLocales, a6);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_LTSELFLoggingTranslationLIDData alloc];
  v5 = [(_LTSELFLoggingTranslationLIDData *)self invocationId];
  int64_t v6 = [(_LTSELFLoggingTranslationLIDData *)self inputSource];
  v7 = [(_LTSELFLoggingTranslationLIDData *)self topLocale];
  v8 = [(_LTSELFLoggingTranslationLIDData *)self lowConfidenceLocales];
  v9 = [(_LTSELFLoggingTranslationLIDData *)v4 initWithInvocationId:v5 inputSource:v6 topLocale:v7 lowConfidenceLocales:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  invocationId = self->_invocationId;
  id v5 = a3;
  [v5 encodeObject:invocationId forKey:@"invocationId"];
  [v5 encodeInteger:self->_inputSource forKey:@"inputSource"];
  [v5 encodeObject:self->_topLocale forKey:@"topLocale"];
  [v5 encodeObject:self->_lowConfidenceLocales forKey:@"lowConfidenceLocales"];
}

- (_LTSELFLoggingTranslationLIDData)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSELFLoggingTranslationLIDData;
  id v5 = [(_LTSELFLoggingTranslationLIDData *)&v17 init];
  if (v5)
  {
    int64_t v6 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationId"];
    invocationId = v5->_invocationId;
    v5->_invocationId = (NSUUID *)v9;

    v5->_inputSource = [v4 decodeIntegerForKey:@"inputSource"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topLocale"];
    topLocale = v5->_topLocale;
    v5->_topLocale = (NSLocale *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"lowConfidenceLocales"];
    lowConfidenceLocales = v5->_lowConfidenceLocales;
    v5->_lowConfidenceLocales = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (NSUUID)invocationId
{
  return self->_invocationId;
}

- (int64_t)inputSource
{
  return self->_inputSource;
}

- (void)setInputSource:(int64_t)a3
{
  self->_inputSource = a3;
}

- (NSLocale)topLocale
{
  return self->_topLocale;
}

- (void)setTopLocale:(id)a3
{
}

- (NSArray)lowConfidenceLocales
{
  return self->_lowConfidenceLocales;
}

- (void)setLowConfidenceLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowConfidenceLocales, 0);
  objc_storeStrong((id *)&self->_topLocale, 0);

  objc_storeStrong((id *)&self->_invocationId, 0);
}

@end