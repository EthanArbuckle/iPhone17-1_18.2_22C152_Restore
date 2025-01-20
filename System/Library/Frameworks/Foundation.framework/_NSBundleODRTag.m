@interface _NSBundleODRTag
+ (BOOL)supportsSecureCoding;
- (BOOL)alwaysPreserved;
- (_NSBundleODRTag)initWithCoder:(id)a3;
- (double)preservationPriority;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysPreserved:(BOOL)a3;
- (void)setPreservationPriority:(double)a3;
@end

@implementation _NSBundleODRTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSBundleODRTag)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_NSBundleODRTag;
  v4 = [(_NSBundleODRTag *)&v7 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"pp"];
    v4->_preservationPriority = v5;
    v4->_alwaysPreserved = [a3 decodeBoolForKey:@"always"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"pp" forKey:self->_preservationPriority];
  BOOL alwaysPreserved = self->_alwaysPreserved;

  [a3 encodeBool:alwaysPreserved forKey:@"always"];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRTag;
  return +[NSString stringWithFormat:@"%@ preservation: %f always: %d", [(_NSBundleODRTag *)&v3 description], *(void *)&self->_preservationPriority, self->_alwaysPreserved];
}

- (double)preservationPriority
{
  return self->_preservationPriority;
}

- (void)setPreservationPriority:(double)a3
{
  self->_preservationPriority = a3;
}

- (BOOL)alwaysPreserved
{
  return self->_alwaysPreserved;
}

- (void)setAlwaysPreserved:(BOOL)a3
{
  self->_BOOL alwaysPreserved = a3;
}

@end