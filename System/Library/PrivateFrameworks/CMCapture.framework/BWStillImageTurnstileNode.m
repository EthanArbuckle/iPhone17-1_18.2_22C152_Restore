@interface BWStillImageTurnstileNode
+ (void)initialize;
- (BWStillImageTurnstileNode)initWithStillImageCoordinator:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageTurnstileNode

+ (void)initialize
{
}

- (BWStillImageTurnstileNode)initWithStillImageCoordinator:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageTurnstileNode;
  v4 = [(BWNode *)&v10 init];
  if (v4)
  {
    v4->_stillImageCoordinator = (BWStillImageCoordinatorNode *)a3;
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v5 setFormatRequirements:v6];

    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(BWNode *)v4 addInput:v5];

    v7 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v7 setFormatRequirements:v8];
    [(BWNodeOutput *)v7 setPassthroughMode:1];

    [(BWNode *)v4 addOutput:v7];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageTurnstileNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"StillImageTurnstile";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  [(BWStillImageCoordinatorNode *)self->_stillImageCoordinator clientReceivedPayloadForSettings:CMGetAttachment(a3, @"StillImageSettings", 0) status:0 clientIsMidStillImageGraph:1];
  output = self->super._output;
  [(BWNodeOutput *)output emitSampleBuffer:a3];
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageCoordinatorNode clientReceivedPayloadForSettings:status:clientIsMidStillImageGraph:](self->_stillImageCoordinator, "clientReceivedPayloadForSettings:status:clientIsMidStillImageGraph:", objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), objc_msgSend(a3, "errorCode"), 1);
  output = self->super._output;
  [(BWNodeOutput *)output emitNodeError:a3];
}

@end