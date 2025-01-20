@interface IPFeatureData
+ (IPFeatureData)featureDataWithType:(unint64_t)a3 value:(id)a4 matchRange:(_NSRange)a5;
- (NSMutableDictionary)contextDictionary;
- (id)description;
- (id)nGramMarker;
- (id)value;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation IPFeatureData

+ (IPFeatureData)featureDataWithType:(unint64_t)a3 value:(id)a4 matchRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a4;
  v9 = objc_alloc_init(IPFeatureData);
  [(IPFeatureData *)v9 setType:a3];
  [(IPFeatureData *)v9 setValue:v8];

  -[IPFeature setMatchRange:](v9, "setMatchRange:", location, length);
  return v9;
}

- (NSMutableDictionary)contextDictionary
{
  contextDictionary = self->_contextDictionary;
  if (!contextDictionary)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_contextDictionary;
    self->_contextDictionary = v4;

    contextDictionary = self->_contextDictionary;
  }
  return contextDictionary;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureData;
  v4 = [(IPFeature *)&v9 description];
  v5 = humanReadableFeatureType([(IPFeatureData *)self type]);
  v6 = [(IPFeatureData *)self value];
  v7 = [v3 stringWithFormat:@"%@ Type:%@ - Value: <%@>", v4, v5, v6];

  return v7;
}

- (id)nGramMarker
{
  unint64_t v3 = [(IPFeatureData *)self type];
  if (v3 < 0xE && ((0x30FFu >> v3) & 1) != 0) {
    return off_264722ED8[v3];
  }
  NSLog(&cfstr_FoundUnknownFe.isa, [(IPFeatureData *)self type]);
  return @"UNKNOWN_FEATURE";
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)value
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
}

@end