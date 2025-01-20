@interface CRCodeRedeemerController
+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4;
+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5;
+ (unint64_t)isCRCodeRedeemerAvailable;
- (CRCodeRedeemerController)init;
- (CRCodeRedeemerControllerDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidCancel:(id)a3;
- (void)cameraReaderDidDisplayMessage:(id)a3;
- (void)cameraReaderDidFindTarget:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)showMessage:(id)a3 color:(id)a4 style:(unint64_t)a5 duration:(double)a6;
@end

@implementation CRCodeRedeemerController

+ (unint64_t)isCRCodeRedeemerAvailable
{
  return +[CRCameraReader supportedCameraCount];
}

- (CRCodeRedeemerController)init
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CRCodeRedeemerController;
  v2 = [(CRCameraReader *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v7.receiver = v2;
    v7.super_class = (Class)CRCodeRedeemerController;
    [(CRCameraReader *)&v7 setDelegate:v2];
    v9[0] = @"CROutputTypeiTunesCode";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    v6.receiver = v3;
    v6.super_class = (Class)CRCodeRedeemerController;
    [(CRCameraReader *)&v6 setOutputObjectTypes:v4];

    [(CRCodeRedeemerController *)v3 setDelegateQueue:MEMORY[0x263EF83A0]];
  }
  return v3;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4
{
  double width = (double)a3->width;
  double height = (double)a3->height;
  long long v6 = *(_OWORD *)&a3->width;
  v9[0] = *(_OWORD *)&a3->data;
  v9[1] = v6;
  objc_super v7 = +[CRCodeRedeemerController findCodeInImage:maxStage:roi:](CRCodeRedeemerController, "findCodeInImage:maxStage:roi:", v9, a4, 0.0, 0.0, width, height);
  return v7;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5
{
  long long v5 = *(_OWORD *)&a3->width;
  v8[0] = *(_OWORD *)&a3->data;
  v8[1] = v5;
  long long v6 = +[CRCameraReader findCodeInImage:maxStage:roi:](CRCameraReader, "findCodeInImage:maxStage:roi:", v8, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return v6;
}

- (void)showMessage:(id)a3 color:(id)a4 style:(unint64_t)a5 duration:(double)a6
{
  v6.receiver = self;
  v6.super_class = (Class)CRCodeRedeemerController;
  [(CRCameraReader *)&v6 showMessage:a3 color:a4 style:a5 duration:a6];
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v6 = [NSDictionary dictionaryWithObject:a4 forKey:@"Error"];
  long long v5 = [(CRCodeRedeemerController *)self delegate];
  [v5 codeRedeemerController:self didEndWithInfo:v6];
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a4;
  long long v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v4);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 type];
        int v12 = [v11 isEqualToString:@"CROutputTypeiTunesCode"];

        if (v12)
        {
          v13 = [v10 stringValue];
          [v5 setObject:v13 forKey:@"Code"];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = [(CRCodeRedeemerController *)self delegate];
  [v14 codeRedeemerController:self didEndWithInfo:v5];
}

- (void)cameraReaderDidCancel:(id)a3
{
  id v4 = [(CRCodeRedeemerController *)self delegate];
  [v4 codeRedeemerControllerDidCancel:self];
}

- (void)cameraReaderDidDisplayMessage:(id)a3
{
  id v5 = [(CRCodeRedeemerController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(CRCodeRedeemerController *)self delegate];
    [v6 codeRedeemerControllerDidDisplayMessage:self];
  }
}

- (void)cameraReaderDidFindTarget:(id)a3
{
  id v5 = [(CRCodeRedeemerController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(CRCodeRedeemerController *)self delegate];
    [v6 codeRedeemerControllerDidFindBox:self];
  }
}

- (CRCodeRedeemerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRCodeRedeemerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1512, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end