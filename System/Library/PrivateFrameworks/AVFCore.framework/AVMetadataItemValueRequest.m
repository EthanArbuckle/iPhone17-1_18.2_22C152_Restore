@interface AVMetadataItemValueRequest
+ (AVMetadataItemValueRequest)metadataItemValueRequestWithMetadataItem:(id)a3;
- (AVMetadataItem)metadataItem;
- (AVMetadataItemValueRequest)initWithMetadataItem:(id)a3;
- (id)dataType;
- (id)error;
- (id)value;
- (void)dealloc;
- (void)respondWithError:(NSError *)error;
- (void)respondWithValue:(id)a3 dataType:(id)a4;
- (void)respondWithValue:(id)value;
@end

@implementation AVMetadataItemValueRequest

+ (AVMetadataItemValueRequest)metadataItemValueRequestWithMetadataItem:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMetadataItem:a3];
  return (AVMetadataItemValueRequest *)v3;
}

- (AVMetadataItemValueRequest)initWithMetadataItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMetadataItemValueRequest;
  v4 = [(AVMetadataItemValueRequest *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVMetadataItemValueRequestInternal);
    v4->_valueRequest = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_valueRequest->weakReferenceToMetadataItem = [[AVWeakReference alloc] initWithReferencedObject:a3];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  valueRequest = self->_valueRequest;
  if (valueRequest)
  {

    CFRelease(self->_valueRequest);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMetadataItemValueRequest;
  [(AVMetadataItemValueRequest *)&v4 dealloc];
}

- (AVMetadataItem)metadataItem
{
  return (AVMetadataItem *)[(AVWeakReference *)self->_valueRequest->weakReferenceToMetadataItem referencedObject];
}

- (id)value
{
  return self->_valueRequest->value;
}

- (id)dataType
{
  return self->_valueRequest->dataType;
}

- (id)error
{
  return self->_valueRequest->error;
}

- (void)respondWithValue:(id)a3 dataType:(id)a4
{
  self->_valueRequest->value = objc_msgSend(a3, "copyWithZone:", -[AVMetadataItemValueRequest zone](self, "zone"));
  self->_valueRequest->dataType = (NSString *)[a4 copy];
  v6 = [(AVMetadataItemValueRequest *)self metadataItem];
  [(AVMetadataItem *)v6 _valueRequestDidFinish];
}

- (void)respondWithValue:(id)value
{
}

- (void)respondWithError:(NSError *)error
{
  self->_valueRequest->error = error;
  objc_super v4 = [(AVMetadataItemValueRequest *)self metadataItem];
  [(AVMetadataItem *)v4 _valueRequestDidFinish];
}

@end