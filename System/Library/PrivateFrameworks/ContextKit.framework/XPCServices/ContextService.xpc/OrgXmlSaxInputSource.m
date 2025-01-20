@interface OrgXmlSaxInputSource
+ (const)__metadata;
- (OrgXmlSaxInputSource)initWithJavaIoInputStream:(id)a3;
- (OrgXmlSaxInputSource)initWithJavaIoReader:(id)a3;
- (OrgXmlSaxInputSource)initWithNSString:(id)a3;
- (id)getByteStream;
- (id)getCharacterStream;
- (id)getEncoding;
- (id)getPublicId;
- (id)getSystemId;
- (void)dealloc;
- (void)setByteStreamWithJavaIoInputStream:(id)a3;
- (void)setCharacterStreamWithJavaIoReader:(id)a3;
- (void)setEncodingWithNSString:(id)a3;
- (void)setPublicIdWithNSString:(id)a3;
- (void)setSystemIdWithNSString:(id)a3;
@end

@implementation OrgXmlSaxInputSource

- (OrgXmlSaxInputSource)initWithNSString:(id)a3
{
  return self;
}

- (OrgXmlSaxInputSource)initWithJavaIoInputStream:(id)a3
{
  return self;
}

- (OrgXmlSaxInputSource)initWithJavaIoReader:(id)a3
{
  return self;
}

- (void)setPublicIdWithNSString:(id)a3
{
}

- (id)getPublicId
{
  return self->publicId_;
}

- (void)setSystemIdWithNSString:(id)a3
{
}

- (id)getSystemId
{
  return self->systemId_;
}

- (void)setByteStreamWithJavaIoInputStream:(id)a3
{
}

- (id)getByteStream
{
  return self->byteStream_;
}

- (void)setEncodingWithNSString:(id)a3
{
}

- (id)getEncoding
{
  return self->encoding_;
}

- (void)setCharacterStreamWithJavaIoReader:(id)a3
{
}

- (id)getCharacterStream
{
  return self->characterStream_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxInputSource;
  [(OrgXmlSaxInputSource *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045A470;
}

@end