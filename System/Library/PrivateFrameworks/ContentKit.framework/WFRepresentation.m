@interface WFRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEncodable;
- (NSString)wfName;
- (WFType)wfType;
- (id)copyWithName:(id)a3;
- (id)copyWithName:(id)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation WFRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEncodable
{
  return 0;
}

- (id)copyWithName:(id)a3
{
  return [(WFRepresentation *)self copyWithName:a3 zone:0];
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(WFRepresentation *)self copyWithName:0 zone:a3];
}

- (WFType)wfType
{
  return 0;
}

- (NSString)wfName
{
  return 0;
}

@end