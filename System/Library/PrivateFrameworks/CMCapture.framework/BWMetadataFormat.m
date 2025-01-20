@interface BWMetadataFormat
+ (id)formatWithMetadataFormatDescription:(opaqueCMFormatDescription *)a3;
+ (void)initialize;
- (id)debugDescription;
- (id)description;
- (opaqueCMFormatDescription)formatDescription;
- (unsigned)mediaType;
- (void)_initWithMetadataFormat:(void *)a1;
- (void)dealloc;
@end

@implementation BWMetadataFormat

+ (id)formatWithMetadataFormatDescription:(opaqueCMFormatDescription *)a3
{
  if (!a3 || CMFormatDescriptionGetMediaType(a3) != 1835365473) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"must be passed a metadata format description" userInfo:0]);
  }
  v4 = -[BWMetadataFormat _initWithMetadataFormat:]([BWMetadataFormat alloc], a3);
  return v4;
}

- (void)_initWithMetadataFormat:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)BWMetadataFormat;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    if (a2) {
      CFTypeRef v4 = CFRetain(a2);
    }
    else {
      CFTypeRef v4 = 0;
    }
    v3[1] = v4;
  }
  return v3;
}

+ (void)initialize
{
}

- (void)dealloc
{
  desc = self->_desc;
  if (desc) {
    CFRelease(desc);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWMetadataFormat;
  [(BWMetadataFormat *)&v4 dealloc];
}

- (unsigned)mediaType
{
  return 1835365473;
}

- (id)description
{
  v3 = (void *)[MEMORY[0x1E4F28E78] string];
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(self->_desc);
  unsigned int v5 = bswap32(MediaSubType);
  if (!MediaSubType) {
    unsigned int v5 = 1061109567;
  }
  unsigned int v9 = v5;
  [v3 appendFormat:@"meta, %.4s", &v9];
  CFArrayRef Identifiers = CMMetadataFormatDescriptionGetIdentifiers(self->_desc);
  if ([(__CFArray *)Identifiers count])
  {
    unint64_t v7 = 0;
    do
      [v3 appendFormat:@", %@", -[__CFArray objectAtIndexedSubscript:](Identifiers, "objectAtIndexedSubscript:", v7++)];
    while (v7 < [(__CFArray *)Identifiers count]);
  }
  return v3;
}

- (id)debugDescription
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWMetadataFormat description](self, "description")];
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_desc;
}

@end