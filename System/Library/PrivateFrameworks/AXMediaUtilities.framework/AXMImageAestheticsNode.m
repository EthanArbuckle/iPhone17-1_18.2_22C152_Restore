@interface AXMImageAestheticsNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMImageAestheticsNode)initWithCoder:(id)a3;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (VNClassifyImageAestheticsRequest)_imageAestheticsRequest;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)set_imageAestheticsRequest:(id)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMImageAestheticsNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMImageAestheticsNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMImageAestheticsNode;
  return [(AXMEvaluationNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMImageAestheticsNode;
  [(AXMEvaluationNode *)&v3 encodeWithCoder:a3];
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Aesthetics";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNClassifyImageAestheticsRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMImageAestheticsNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    objc_super v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMImageAestheticsNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AXMImageAestheticsNode;
  id v8 = [(AXMEvaluationNode *)&v18 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  v10 = [(AXMImageAestheticsNode *)self _imageAestheticsRequest];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)getVNClassifyImageAestheticsRequestClass());
    [(AXMImageAestheticsNode *)self set_imageAestheticsRequest:v11];

    v12 = [(AXMImageAestheticsNode *)self _imageAestheticsRequest];
    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:v12];
  }
  v13 = [(AXMImageAestheticsNode *)self _imageAestheticsRequest];
  v19[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v14 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  v15 = [v13 results];
  v16 = [v15 firstObject];

  if (v16)
  {
    v17 = +[AXMVisionFeature featureWithImageAestheticsObservation:v16];
    [v6 appendFeature:v17];
  }
}

- (VNClassifyImageAestheticsRequest)_imageAestheticsRequest
{
  return self->__imageAestheticsRequest;
}

- (void)set_imageAestheticsRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNClassifyImageAestheticsRequestSoft was nil", v1, 2u);
}

@end