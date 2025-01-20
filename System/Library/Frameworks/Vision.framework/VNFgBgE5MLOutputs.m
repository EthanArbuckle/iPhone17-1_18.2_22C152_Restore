@interface VNFgBgE5MLOutputs
- (MLMultiArray)decodeMatch;
- (MLMultiArray)predictionCocoConfidence;
- (MLMultiArray)predictionIoU;
- (MLMultiArray)predictionMiyoshiConfidence;
- (MLMultiArray)segments;
- (MLMultiArray)stabilityScore;
- (VNFgBgE5MLOutputs)initWithOutputs:(id)a3 descriptor:(id)a4;
@end

@implementation VNFgBgE5MLOutputs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilityScore, 0);
  objc_storeStrong((id *)&self->_predictionIoU, 0);
  objc_storeStrong((id *)&self->_predictionMiyoshiConfidence, 0);
  objc_storeStrong((id *)&self->_predictionCocoConfidence, 0);
  objc_storeStrong((id *)&self->_decodeMatch, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

- (MLMultiArray)stabilityScore
{
  return (MLMultiArray *)objc_getProperty(self, a2, 48, 1);
}

- (MLMultiArray)predictionIoU
{
  return (MLMultiArray *)objc_getProperty(self, a2, 40, 1);
}

- (MLMultiArray)predictionMiyoshiConfidence
{
  return (MLMultiArray *)objc_getProperty(self, a2, 32, 1);
}

- (MLMultiArray)predictionCocoConfidence
{
  return (MLMultiArray *)objc_getProperty(self, a2, 24, 1);
}

- (MLMultiArray)decodeMatch
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (MLMultiArray)segments
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (VNFgBgE5MLOutputs)initWithOutputs:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)VNFgBgE5MLOutputs;
  v8 = [(VNFgBgE5MLOutputs *)&v34 init];
  if (v8)
  {
    id v33 = 0;
    uint64_t v9 = +[VNFgBgE5MLProcess multiArrayForOutput:@"pred_masks" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v33];
    id v10 = v33;
    segments = v8->_segments;
    v8->_segments = (MLMultiArray *)v9;

    id v32 = v10;
    uint64_t v12 = +[VNFgBgE5MLProcess multiArrayForOutput:@"decode_match" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v32];
    id v13 = v32;

    decodeMatch = v8->_decodeMatch;
    v8->_decodeMatch = (MLMultiArray *)v12;

    id v31 = v13;
    uint64_t v15 = +[VNFgBgE5MLProcess multiArrayForOutput:@"pred_coco_confidences" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v31];
    id v16 = v31;

    predictionCocoConfidence = v8->_predictionCocoConfidence;
    v8->_predictionCocoConfidence = (MLMultiArray *)v15;

    id v30 = v16;
    uint64_t v18 = +[VNFgBgE5MLProcess multiArrayForOutput:@"pred_miyoshi_confidences" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v30];
    id v19 = v30;

    predictionMiyoshiConfidence = v8->_predictionMiyoshiConfidence;
    v8->_predictionMiyoshiConfidence = (MLMultiArray *)v18;

    id v29 = v19;
    uint64_t v21 = +[VNFgBgE5MLProcess multiArrayForOutput:@"pred_iou" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v29];
    id v22 = v29;

    predictionIoU = v8->_predictionIoU;
    v8->_predictionIoU = (MLMultiArray *)v21;

    id v28 = v22;
    uint64_t v24 = +[VNFgBgE5MLProcess multiArrayForOutput:@"stability_score" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v28];
    id v25 = v28;

    stabilityScore = v8->_stabilityScore;
    v8->_stabilityScore = (MLMultiArray *)v24;
  }
  return v8;
}

@end