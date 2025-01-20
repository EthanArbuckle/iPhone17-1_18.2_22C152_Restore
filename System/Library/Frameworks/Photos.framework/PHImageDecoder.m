@interface PHImageDecoder
+ (id)sharedDecoder;
+ (id)sharedFigDecoder;
- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6;
- (void)cancelInFlightAsyncDecodeForRequestHandle:(id)a3;
@end

@implementation PHImageDecoder

+ (id)sharedFigDecoder
{
  return +[PHFigDecoder sharedDecoder];
}

+ (id)sharedDecoder
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"PHImageDecoder.m" lineNumber:119 description:@"Subclass to implement"];

  return 0;
}

- (void)cancelInFlightAsyncDecodeForRequestHandle:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PHImageDecoder.m" lineNumber:132 description:@"Subclass to implement"];
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  [v8 handleFailureInMethod:a2 object:self file:@"PHImageDecoder.m" lineNumber:127 description:@"Subclass to implement"];

  return 0;
}

@end