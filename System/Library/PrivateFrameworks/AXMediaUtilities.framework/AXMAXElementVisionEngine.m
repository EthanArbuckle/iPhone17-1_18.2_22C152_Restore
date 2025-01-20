@interface AXMAXElementVisionEngine
- (AXMAXElementDetectorNode)axElementDetector;
- (AXMAXElementVisionEngine)initWithIdentifier:(id)a3;
- (AXMBrailleEdgesDetectorNode)brailleEdgeDetector;
- (AXMIconClassDetectorNode)iconClassDetector;
- (AXMImageNode)imageNode;
- (AXMScreenCaptureNode)captureNode;
- (AXMTextDetectorNode)textDetector;
- (void)setAxElementDetector:(id)a3;
- (void)setBrailleEdgeDetector:(id)a3;
- (void)setCaptureNode:(id)a3;
- (void)setIconClassDetector:(id)a3;
- (void)setImageNode:(id)a3;
- (void)setTextDetector:(id)a3;
@end

@implementation AXMAXElementVisionEngine

- (AXMAXElementVisionEngine)initWithIdentifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AXMAXElementVisionEngine;
  v3 = [(AXMVisionEngine *)&v11 initWithIdentifier:a3];
  [(AXMVisionEngine *)v3 setMaximumQueueSize:10];
  if (v3)
  {
    if ([(AXMVisionEngine *)v3 canAddSourceNodeClass:objc_opt_class()])
    {
      v4 = [(AXMVisionEngineNode *)[AXMScreenCaptureNode alloc] initWithIdentifier:@"screenCapture"];
      [(AXMVisionEngine *)v3 addSourceNode:v4];
      [(AXMAXElementVisionEngine *)v3 setCaptureNode:v4];
    }
    if ([(AXMVisionEngine *)v3 canAddSourceNodeClass:objc_opt_class()])
    {
      v5 = [(AXMVisionEngineNode *)[AXMImageNode alloc] initWithIdentifier:@"image"];
      [(AXMVisionEngine *)v3 addSourceNode:v5];
      [(AXMAXElementVisionEngine *)v3 setImageNode:v5];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v6 = [(AXMVisionEngineNode *)[AXMTextDetectorNode alloc] initWithIdentifier:@"text"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v6];
      [(AXMAXElementVisionEngine *)v3 setTextDetector:v6];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v7 = [(AXMMobileAssetEvaluationNode *)[AXMIconClassDetectorNode alloc] initWithIdentifier:@"iconClass"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v7];
      [(AXMAXElementVisionEngine *)v3 setIconClassDetector:v7];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v8 = [(AXMVisionEngineNode *)[AXMBrailleEdgesDetectorNode alloc] initWithIdentifier:@"brailleEdges"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v8];
      [(AXMAXElementVisionEngine *)v3 setBrailleEdgeDetector:v8];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v9 = [(AXMMobileAssetEvaluationNode *)[AXMAXElementDetectorNode alloc] initWithIdentifier:@"axElement"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v9];
      [(AXMAXElementVisionEngine *)v3 setAxElementDetector:v9];
    }
  }
  return v3;
}

- (AXMScreenCaptureNode)captureNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureNode);

  return (AXMScreenCaptureNode *)WeakRetained;
}

- (void)setCaptureNode:(id)a3
{
}

- (AXMImageNode)imageNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageNode);

  return (AXMImageNode *)WeakRetained;
}

- (void)setImageNode:(id)a3
{
}

- (AXMTextDetectorNode)textDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textDetector);

  return (AXMTextDetectorNode *)WeakRetained;
}

- (void)setTextDetector:(id)a3
{
}

- (AXMIconClassDetectorNode)iconClassDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconClassDetector);

  return (AXMIconClassDetectorNode *)WeakRetained;
}

- (void)setIconClassDetector:(id)a3
{
}

- (AXMAXElementDetectorNode)axElementDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axElementDetector);

  return (AXMAXElementDetectorNode *)WeakRetained;
}

- (void)setAxElementDetector:(id)a3
{
}

- (AXMBrailleEdgesDetectorNode)brailleEdgeDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brailleEdgeDetector);

  return (AXMBrailleEdgesDetectorNode *)WeakRetained;
}

- (void)setBrailleEdgeDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_brailleEdgeDetector);
  objc_destroyWeak((id *)&self->_axElementDetector);
  objc_destroyWeak((id *)&self->_iconClassDetector);
  objc_destroyWeak((id *)&self->_textDetector);
  objc_destroyWeak((id *)&self->_imageNode);

  objc_destroyWeak((id *)&self->_captureNode);
}

@end