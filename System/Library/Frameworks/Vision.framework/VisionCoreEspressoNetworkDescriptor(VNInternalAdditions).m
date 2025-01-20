@interface VisionCoreEspressoNetworkDescriptor(VNInternalAdditions)
- (id)URLForComputeDevice:()VNInternalAdditions error:;
- (id)modelPathForComputeDevice:()VNInternalAdditions error:;
@end

@implementation VisionCoreEspressoNetworkDescriptor(VNInternalAdditions)

- (id)modelPathForComputeDevice:()VNInternalAdditions error:
{
  v5 = objc_msgSend(a1, "URLForComputeDevice:error:");
  v6 = v5;
  if (v5)
  {
    v7 = [v5 VisionCoreFileSystemPathAndReturnError:a4];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)URLForComputeDevice:()VNInternalAdditions error:
{
  id v6 = a3;
  if (+[VNComputeDeviceUtilities isNeuralEngineComputeDevice:v6])
  {
    v7 = [a1 ANESpecificURL];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else if (a4)
    {
      *a4 = +[VNError errorForUnsupportedComputeDevice:v6];
    }
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)VisionCoreEspressoNetworkDescriptor_0;
    v8 = objc_msgSendSuper2(&v11, sel_URLForComputeDevice_error_, v6, a4);
  }

  return v8;
}

@end