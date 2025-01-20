@interface _LABKFaceDetectOperation
- (BKFaceDetectOperationDelegate)delegate;
- (void)operation:(id)a3 faceDetectStateChanged:(id)a4;
@end

@implementation _LABKFaceDetectOperation

- (BKFaceDetectOperationDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)_LABKFaceDetectOperation;
  v2 = [(_LABKOperation *)&v4 delegate];

  return (BKFaceDetectOperationDelegate *)v2;
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  id v10 = a4;
  id v7 = a3;
  +[_LABKLog logClass:objc_opt_class(), a2, @"%@,%@", v7, v10 selector message];

  v8 = [(_LABKFaceDetectOperation *)self delegate];
  LOBYTE(a2) = objc_opt_respondsToSelector();

  if (a2)
  {
    v9 = [(_LABKFaceDetectOperation *)self delegate];
    [v9 operation:self faceDetectStateChanged:v10];
  }
}

@end