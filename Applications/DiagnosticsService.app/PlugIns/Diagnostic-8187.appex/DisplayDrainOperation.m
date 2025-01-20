@interface DisplayDrainOperation
- (DKResponder)responder;
- (DisplayDrainOperation)initWithBrightness:(float)a3 responder:(id)a4;
- (float)originalScreenBrightness;
- (float)requestedBrightness;
- (void)cancel;
- (void)main;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setRequestedBrightness:(float)a3;
- (void)setResponder:(id)a3;
@end

@implementation DisplayDrainOperation

- (DisplayDrainOperation)initWithBrightness:(float)a3 responder:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DisplayDrainOperation;
  v7 = [(DisplayDrainOperation *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_responder, v6);
    v8->_requestedBrightness = a3;
    BKSDisplayBrightnessGetCurrent();
    v8->_originalScreenBrightness = v9;
  }

  return v8;
}

- (void)main
{
  id v3 = [(DisplayDrainOperation *)self responder];
  [(DisplayDrainOperation *)self requestedBrightness];
  [v3 setScreenToBrightness:0 animate:];
}

- (void)cancel
{
  id v3 = [(DisplayDrainOperation *)self responder];
  [(DisplayDrainOperation *)self originalScreenBrightness];
  [v3 setScreenToBrightness:0];

  v4.receiver = self;
  v4.super_class = (Class)DisplayDrainOperation;
  [(DrainOperation *)&v4 cancel];
}

- (DKResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);

  return (DKResponder *)WeakRetained;
}

- (void)setResponder:(id)a3
{
}

- (float)requestedBrightness
{
  return self->_requestedBrightness;
}

- (void)setRequestedBrightness:(float)a3
{
  self->_requestedBrightness = a3;
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (void).cxx_destruct
{
}

@end