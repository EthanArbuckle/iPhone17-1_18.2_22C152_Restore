@interface ARWorldAlignmentData
+ (BOOL)supportsSecureCoding;
- (ARWorldAlignmentData)init;
- (ARWorldAlignmentData)initWithCoder:(id)a3;
- (BOOL)referenceOriginChanged;
- (BOOL)sessionShouldResumeCameraPosition;
- (BOOL)sessionShouldResumeCameraPositionAndHeading;
- (BOOL)worldAlignmentReset;
- (__n128)setWorldAlignmentTransform:(__n128)a3;
- (__n128)worldAlignmentTransform;
- (unint64_t)worldAlignmentModifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceOriginChanged:(BOOL)a3;
- (void)setSessionShouldResumeCameraPosition:(BOOL)a3;
- (void)setSessionShouldResumeCameraPositionAndHeading:(BOOL)a3;
- (void)setWorldAlignmentReset:(BOOL)a3;
@end

@implementation ARWorldAlignmentData

- (ARWorldAlignmentData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARWorldAlignmentData;
  result = [(ARWorldAlignmentData *)&v6 init];
  if (result)
  {
    v3 = (ARWorldAlignmentData *)MEMORY[0x1E4F149A0];
    ARWorldAlignmentData v4 = *(ARWorldAlignmentData *)(MEMORY[0x1E4F149A0] + 16);
    result[1] = *(ARWorldAlignmentData *)MEMORY[0x1E4F149A0];
    result[2] = v4;
    ARWorldAlignmentData v5 = v3[3];
    result[3] = v3[2];
    result[4] = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)worldAlignmentModifiers
{
  return self->_modifiers;
}

- (BOOL)worldAlignmentReset
{
  return self->_modifiers & 1;
}

- (void)setWorldAlignmentReset:(BOOL)a3
{
  self->_modifiers = self->_modifiers & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)referenceOriginChanged
{
  return (LOBYTE(self->_modifiers) >> 1) & 1;
}

- (void)setReferenceOriginChanged:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_modifiers = self->_modifiers & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)sessionShouldResumeCameraPosition
{
  return (LOBYTE(self->_modifiers) >> 2) & 1;
}

- (void)setSessionShouldResumeCameraPosition:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_modifiers = self->_modifiers & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)sessionShouldResumeCameraPositionAndHeading
{
  return (LOBYTE(self->_modifiers) >> 3) & 1;
}

- (void)setSessionShouldResumeCameraPositionAndHeading:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_modifiers = self->_modifiers & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (ARWorldAlignmentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARWorldAlignmentData;
  ARWorldAlignmentData v5 = [(ARWorldAlignmentData *)&v11 init];
  if (v5)
  {
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"worldAlignmentTransform");
    v5[1] = v6;
    v5[2] = v7;
    v5[3] = v8;
    v5[4] = v9;
    v5->_modifiers = [v4 decodeIntegerForKey:@"worldAlignmentModifiers"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ARWorldAlignmentData v6 = self[3];
  ARWorldAlignmentData v7 = self[4];
  ARWorldAlignmentData v4 = self[1];
  ARWorldAlignmentData v5 = self[2];
  id v8 = a3;
  objc_msgSend(v8, "ar_encodeMatrix4x4:forKey:", @"worldAlignmentTransform", *(double *)&v4.super.isa, *(double *)&v5.super.isa, *(double *)&v6.super.isa, *(double *)&v7.super.isa);
  [v8 encodeInteger:self->_modifiers forKey:@"worldAlignmentModifiers"];
}

- (__n128)worldAlignmentTransform
{
  return a1[1];
}

- (__n128)setWorldAlignmentTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

@end