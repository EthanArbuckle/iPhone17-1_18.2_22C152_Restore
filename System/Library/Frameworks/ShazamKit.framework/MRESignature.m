@interface MRESignature
- (MRESignature)initWithSignatureData:(id)a3 trackID:(unint64_t)a4;
- (NSData)signatureData;
- (unint64_t)trackID;
- (void)dealloc;
@end

@implementation MRESignature

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MRESignature;
  [(MRESignature *)&v3 dealloc];
}

- (MRESignature)initWithSignatureData:(id)a3 trackID:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MRESignature;
  v6 = [(MRESignature *)&v9 init];
  if (v6)
  {
    v7 = (NSData *)a3;
    v6->_trackID = a4;
    v6->_signatureData = v7;
  }
  return v6;
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

@end