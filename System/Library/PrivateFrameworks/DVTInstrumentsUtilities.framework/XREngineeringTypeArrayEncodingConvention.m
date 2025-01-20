@interface XREngineeringTypeArrayEncodingConvention
- (NSArray)fixedTypes;
- (NSString)remainderType;
- (void)setFixedTypes:(id)a3;
- (void)setRemainderType:(id)a3;
@end

@implementation XREngineeringTypeArrayEncodingConvention

- (NSArray)fixedTypes
{
  return self->_fixedTypes;
}

- (void)setFixedTypes:(id)a3
{
}

- (NSString)remainderType
{
  return self->_remainderType;
}

- (void)setRemainderType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainderType, 0);

  objc_storeStrong((id *)&self->_fixedTypes, 0);
}

@end