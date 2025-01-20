@interface VNTorsoprintGeneratorRevision1
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5;
@end

@implementation VNTorsoprintGeneratorRevision1

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return &stru_1EF75C0C0;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"bodynet_v1.0.espresso";
}

- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  v7 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  [v7 network];
  if (espresso_network_bind_buffer())
  {
    if (a5)
    {
      v8 = @"Could not bind input buffer to network";
LABEL_4:
      v9 = +[VNError errorForInternalErrorWithLocalizedDescription:v8];
LABEL_8:
      v10 = 0;
      *a5 = v9;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  [v7 network];
  if (espresso_network_bind_input_cvpixelbuffer())
  {
    if (a5)
    {
      v9 = +[VNError errorWithCode:9 message:@"Could not bind input buffer to network"];
      goto LABEL_8;
    }
    goto LABEL_18;
  }
  [v7 plan];
  if (espresso_plan_execute_sync())
  {
    if (a5)
    {
      v8 = @"Could not run network";
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  [(id)objc_opt_class() torsoprintDescriptorSize];
  if (v12 != (double)0 || v11 != (double)0)
  {
    if (a5)
    {
      v9 = +[VNError errorForInternalErrorWithLocalizedDescription:@"inference output results dimensions are incorrect"];
      goto LABEL_8;
    }
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  v15 = [VNTorsoprint alloc];
  LODWORD(v16) = 1.0;
  v10 = [(VNTorsoprint *)v15 initWithData:0 elementCount:0 elementType:1 lengthInBytes:0 confidence:a4 requestRevision:v16];
LABEL_19:

  return v10;
}

@end