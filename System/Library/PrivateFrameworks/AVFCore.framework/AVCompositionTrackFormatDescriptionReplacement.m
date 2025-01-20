@interface AVCompositionTrackFormatDescriptionReplacement
+ (BOOL)supportsSecureCoding;
- (AVCompositionTrackFormatDescriptionReplacement)initWithCoder:(id)a3;
- (AVCompositionTrackFormatDescriptionReplacement)initWithOriginalFormatDescription:(opaqueCMFormatDescription *)a3 andReplacementFormatDescription:(opaqueCMFormatDescription *)a4;
- (CMFormatDescriptionRef)originalFormatDescription;
- (CMFormatDescriptionRef)replacementFormatDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCompositionTrackFormatDescriptionReplacement

- (AVCompositionTrackFormatDescriptionReplacement)initWithOriginalFormatDescription:(opaqueCMFormatDescription *)a3 andReplacementFormatDescription:(opaqueCMFormatDescription *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCompositionTrackFormatDescriptionReplacement;
  v6 = [(AVCompositionTrackFormatDescriptionReplacement *)&v8 init];
  if (v6)
  {
    v6->_originalFormatDescription = (opaqueCMFormatDescription *)CFRetain(a3);
    v6->_replacementFormatDescription = (opaqueCMFormatDescription *)CFRetain(a4);
  }
  return v6;
}

- (void)dealloc
{
  originalFormatDescription = self->_originalFormatDescription;
  if (originalFormatDescription) {
    CFRelease(originalFormatDescription);
  }
  replacementFormatDescription = self->_replacementFormatDescription;
  if (replacementFormatDescription) {
    CFRelease(replacementFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCompositionTrackFormatDescriptionReplacement;
  [(AVCompositionTrackFormatDescriptionReplacement *)&v5 dealloc];
}

- (CMFormatDescriptionRef)originalFormatDescription
{
  return self->_originalFormatDescription;
}

- (CMFormatDescriptionRef)replacementFormatDescription
{
  return self->_replacementFormatDescription;
}

- (AVCompositionTrackFormatDescriptionReplacement)initWithCoder:(id)a3
{
  objc_super v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"originalFormatDescription"];
  if (v5) {
    v6 = AVFormatDescriptionFromSerializedAtomData(v5);
  }
  else {
    v6 = 0;
  }
  v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"replacementFormatDescription"];
  if (v7)
  {
    objc_super v8 = AVFormatDescriptionFromSerializedAtomData(v7);

    if (v6 && v8)
    {
      v9 = [[AVCompositionTrackFormatDescriptionReplacement alloc] initWithOriginalFormatDescription:v6 andReplacementFormatDescription:v8];
      CFRelease(v6);
      v6 = v8;
LABEL_9:
      CFRelease(v6);
      return v9;
    }
    if (v6) {
      CFRelease(v6);
    }
    v9 = 0;
    v6 = v8;
    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {

    v9 = 0;
    if (v6) {
      goto LABEL_9;
    }
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = AVSerializedAtomDataFromFormatDescription(self->_originalFormatDescription);
  if (v5)
  {
    v6 = (void *)v5;
    [a3 encodeObject:v5 forKey:@"originalFormatDescription"];
  }
  uint64_t v7 = AVSerializedAtomDataFromFormatDescription(self->_replacementFormatDescription);
  if (v7)
  {
    id v8 = (id)v7;
    [a3 encodeObject:v7 forKey:@"replacementFormatDescription"];
  }
}

@end