@interface HKConceptIdentifier
+ (BOOL)supportsSecureCoding;
+ (HKConceptIdentifier)diastolicBloodPressure;
+ (HKConceptIdentifier)identifierWithNumber:(id)a3;
+ (HKConceptIdentifier)identifierWithRawIdentifier:(int64_t)a3;
+ (HKConceptIdentifier)inMemoryConceptIdentifier;
+ (HKConceptIdentifier)medication;
+ (HKConceptIdentifier)root;
+ (HKConceptIdentifier)systolicBloodPressure;
- (BOOL)isAdHoc;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInMemory;
- (HKConceptIdentifier)init;
- (HKConceptIdentifier)initWithCoder:(id)a3;
- (HKConceptIdentifier)initWithRawIdentifier:(int64_t)a3;
- (NSNumber)numberRepresentation;
- (NSString)description;
- (int64_t)rawIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKConceptIdentifier

- (HKConceptIdentifier)initWithRawIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKConceptIdentifier;
  result = [(HKConceptIdentifier *)&v5 init];
  if (result) {
    result->_rawIdentifier = a3;
  }
  return result;
}

- (HKConceptIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  objc_super v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HKConceptIdentifier)identifierWithRawIdentifier:(int64_t)a3
{
  v3 = [[HKConceptIdentifier alloc] initWithRawIdentifier:a3];

  return v3;
}

+ (HKConceptIdentifier)identifierWithNumber:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [HKConceptIdentifier alloc];
  uint64_t v5 = [v3 longLongValue];

  v6 = [(HKConceptIdentifier *)v4 initWithRawIdentifier:v5];

  return v6;
}

+ (HKConceptIdentifier)inMemoryConceptIdentifier
{
  v2 = [[HKConceptIdentifier alloc] initWithRawIdentifier:0x7FFFFFFFFFFFFFFFLL];

  return v2;
}

+ (HKConceptIdentifier)root
{
  v2 = [[HKConceptIdentifier alloc] initWithRawIdentifier:105];

  return v2;
}

+ (HKConceptIdentifier)medication
{
  v2 = [[HKConceptIdentifier alloc] initWithRawIdentifier:1001];

  return v2;
}

+ (HKConceptIdentifier)diastolicBloodPressure
{
  v2 = [[HKConceptIdentifier alloc] initWithRawIdentifier:27146];

  return v2;
}

+ (HKConceptIdentifier)systolicBloodPressure
{
  v2 = [[HKConceptIdentifier alloc] initWithRawIdentifier:10793];

  return v2;
}

- (NSNumber)numberRepresentation
{
  return (NSNumber *)[NSNumber numberWithLongLong:self->_rawIdentifier];
}

- (BOOL)isInMemory
{
  return self->_rawIdentifier == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isAdHoc
{
  return (unint64_t)(self->_rawIdentifier - 0x1000000000000) < 0x7FFEFFFFFFFFFFFFLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKConceptIdentifier)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"identifier"];

  return [(HKConceptIdentifier *)self initWithRawIdentifier:v4];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKConceptIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKConceptIdentifier *)v4 rawIdentifier] == self->_rawIdentifier;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_rawIdentifier;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p %lld>", objc_opt_class(), self, self->_rawIdentifier];
}

- (int64_t)rawIdentifier
{
  return self->_rawIdentifier;
}

@end