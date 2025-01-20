@interface PHImageDecoderAsyncDecodeRequestHandle
- (BOOL)cancelRequested;
- (CMPhotoDecompressionContainer)c;
- (CMPhotoDecompressionContainer)figDecompressionContainer;
- (PHImageDecoder)initialDecoder;
- (PHImageDecoderAsyncDecodeRequestHandle)initWithFigRequestID:(unint64_t)a3 container:(CMPhotoDecompressionContainer *)a4 figDecoder:(id)a5;
- (PHImageDecoderAsyncDecodeRequestHandle)initWithImageIODecoder:(id)a3;
- (unint64_t)figGainMapRequestID;
- (unint64_t)figRequestID;
- (void)cancel;
- (void)dealloc;
- (void)setC:(CMPhotoDecompressionContainer *)a3;
- (void)setFigDecompressionContainer:(CMPhotoDecompressionContainer *)a3;
- (void)setFigGainMapRequestID:(unint64_t)a3;
- (void)setFigRequestID:(unint64_t)a3;
@end

@implementation PHImageDecoderAsyncDecodeRequestHandle

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(PHImageDecoderAsyncDecodeRequestHandle *)self setFigDecompressionContainer:0];
  v3.receiver = self;
  v3.super_class = (Class)PHImageDecoderAsyncDecodeRequestHandle;
  [(PHImageDecoderAsyncDecodeRequestHandle *)&v3 dealloc];
}

- (PHImageDecoderAsyncDecodeRequestHandle)initWithFigRequestID:(unint64_t)a3 container:(CMPhotoDecompressionContainer *)a4 figDecoder:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PHImageDecoderAsyncDecodeRequestHandle;
  v10 = [(PHImageDecoderAsyncDecodeRequestHandle *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_initialDecoder, a5);
    v11->_figRequestID = a3;
    v11->_figGainMapRequestID = 0;
    if (a4) {
      [(PHImageDecoderAsyncDecodeRequestHandle *)v11 setFigDecompressionContainer:a4];
    }
  }

  return v11;
}

- (void)setFigDecompressionContainer:(CMPhotoDecompressionContainer *)a3
{
}

- (unint64_t)figRequestID
{
  return self->_figRequestID;
}

- (CMPhotoDecompressionContainer)figDecompressionContainer
{
  return self->_figDecompressionContainer;
}

- (void)setC:(CMPhotoDecompressionContainer *)a3
{
}

- (CMPhotoDecompressionContainer)c
{
  return self->_c;
}

- (void)setFigGainMapRequestID:(unint64_t)a3
{
  self->_figGainMapRequestID = a3;
}

- (unint64_t)figGainMapRequestID
{
  return self->_figGainMapRequestID;
}

- (void)setFigRequestID:(unint64_t)a3
{
  self->_figRequestID = a3;
}

- (PHImageDecoder)initialDecoder
{
  return self->_initialDecoder;
}

- (BOOL)cancelRequested
{
  return self->_cancelRequested;
}

- (void)cancel
{
  if ((atomic_exchange(&self->_cancelFlag._Value, 1u) & 1) == 0)
  {
    self->_cancelRequested = 1;
    id v3 = [(PHImageDecoderAsyncDecodeRequestHandle *)self initialDecoder];
    [v3 cancelInFlightAsyncDecodeForRequestHandle:self];
  }
}

- (PHImageDecoderAsyncDecodeRequestHandle)initWithImageIODecoder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHImageDecoderAsyncDecodeRequestHandle;
  v6 = [(PHImageDecoderAsyncDecodeRequestHandle *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initialDecoder, a3);
    v7->_figRequestID = 0;
  }

  return v7;
}

@end