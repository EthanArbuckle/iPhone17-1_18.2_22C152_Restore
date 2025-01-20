@interface VNComputeDeviceUtilities
+ (BOOL)computeDevice:(id)a3 isOneTypeOfTypes:(unint64_t)a4;
+ (BOOL)isCPUComputeDevice:(id)a3;
+ (BOOL)isGPUComputeDevice:(id)a3;
+ (BOOL)isNeuralEngineComputeDevice:(id)a3;
+ (id)_decreasingPerformanceSortedComputeDevices:(uint64_t)a1;
+ (id)allCPUAndGPUComputeDevices;
+ (id)allCPUAndNeuralEngineComputeDevices;
+ (id)allCPUComputeDevices;
+ (id)allComputeDevices;
+ (id)allGPUAndNeuralEngineComputeDevices;
+ (id)allGPUComputeDevices;
+ (id)allNeuralEngineComputeDevices;
+ (id)computeDeviceForMetalDevice:(id)a3;
+ (id)computeDeviceOfComputeDevices:(id)a3 mostCompatibleWithComputeDevice:(id)a4 options:(unint64_t)a5;
+ (id)computeDevices:(id)a3 ofTypes:(unint64_t)a4;
+ (id)computeDevices:(id)a3 passingTest:(id)a4;
+ (id)computeDevicesOfTypes:(unint64_t)a3;
+ (id)computeDevicesPassingTest:(id)a3;
+ (id)espressoV1ModelComputeDevices;
+ (id)metalDeviceForComputeDevice:(id)a3;
+ (id)mostPerformantCPUComputeDevice;
+ (id)mostPerformantComputeDevice;
+ (id)mostPerformantComputeDeviceOfComputeDevices:(id)a3;
+ (id)mostPerformantGPUComputeDevice;
+ (id)mostPerformantNeuralEngineComputeDevice;
+ (int64_t)performanceScoreForComputeDevice:(id)a3;
+ (unint64_t)computeDeviceTypesForMLComputeUnits:(int64_t)a3;
+ (unint64_t)typeOfComputeDevice:(id)a3;
@end

@implementation VNComputeDeviceUtilities

uint64_t __60__VNComputeDeviceUtilities__decreasingPerformanceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 VNComputeDevicePerformanceScore];
  uint64_t v6 = [v4 VNComputeDevicePerformanceScore];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

+ (int64_t)performanceScoreForComputeDevice:(id)a3
{
  return [a3 VNComputeDevicePerformanceScore];
}

uint64_t __55__VNComputeDeviceUtilities_computeDevices_passingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__VNComputeDeviceUtilities_computeDevices_ofTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) computeDevice:a2 isOneTypeOfTypes:*(void *)(a1 + 40)];
}

+ (BOOL)isNeuralEngineComputeDevice:(id)a3
{
  return [a1 typeOfComputeDevice:a3] == 4;
}

+ (unint64_t)typeOfComputeDevice:(id)a3
{
  return [a3 VNComputeDeviceType];
}

+ (id)mostPerformantComputeDeviceOfComputeDevices:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v4);

    id v4 = (id)v5;
  }
  uint64_t v6 = [v4 firstObject];

  return v6;
}

+ (id)allComputeDevices
{
  v3 = MLAllComputeDevices();
  id v4 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);

  return v4;
}

+ (id)_decreasingPerformanceSortedComputeDevices:(uint64_t)a1
{
  id v2 = a2;
  self;
  self;
  v3 = [v2 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_6351];

  return v3;
}

+ (id)mostPerformantComputeDevice
{
  v3 = MLAllComputeDevices();
  id v4 = [a1 mostPerformantComputeDeviceOfComputeDevices:v3];

  return v4;
}

+ (BOOL)computeDevice:(id)a3 isOneTypeOfTypes:(unint64_t)a4
{
  uint64_t v5 = [a3 VNComputeDeviceType];
  BOOL v6 = (v5 & ~a4) == 0;
  if (!a4) {
    BOOL v6 = 0;
  }
  return v5 == a4 || v6;
}

+ (id)allCPUComputeDevices
{
  return (id)[a1 computeDevicesOfTypes:1];
}

+ (id)mostPerformantNeuralEngineComputeDevice
{
  v3 = [a1 allNeuralEngineComputeDevices];
  id v4 = [a1 mostPerformantComputeDeviceOfComputeDevices:v3];

  return v4;
}

+ (id)computeDevicesOfTypes:(unint64_t)a3
{
  uint64_t v5 = [a1 allComputeDevices];
  BOOL v6 = [a1 computeDevices:v5 ofTypes:a3];

  return v6;
}

+ (id)computeDevices:(id)a3 ofTypes:(unint64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VNComputeDeviceUtilities_computeDevices_ofTypes___block_invoke;
  v6[3] = &__block_descriptor_48_e35_B16__0___MLComputeDeviceProtocol__8l;
  v6[4] = a1;
  v6[5] = a4;
  id v4 = [a1 computeDevices:a3 passingTest:v6];

  return v4;
}

+ (id)computeDevices:(id)a3 passingTest:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__VNComputeDeviceUtilities_computeDevices_passingTest___block_invoke;
  v11[3] = &unk_1E5B1C8F0;
  id v12 = v5;
  id v6 = v5;
  id v7 = a3;
  v8 = [v7 indexesOfObjectsPassingTest:v11];
  v9 = [v7 objectsAtIndexes:v8];

  return v9;
}

+ (id)allNeuralEngineComputeDevices
{
  return (id)[a1 computeDevicesOfTypes:4];
}

+ (id)computeDeviceOfComputeDevices:(id)a3 mostCompatibleWithComputeDevice:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 containsObject:v9])
  {
    id v10 = v9;
    goto LABEL_12;
  }
  if ((v5 & 1) == 0)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  v11 = objc_msgSend(a1, "computeDevices:ofTypes:", v8, objc_msgSend(a1, "typeOfComputeDevice:", v9));
  id v12 = v11;
  if ((v5 & 6) != 0)
  {
    v13 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v11);

    if ((v5 & 4) != 0)
    {
      uint64_t v14 = [v13 lastObject];
      goto LABEL_11;
    }
    id v12 = v13;
  }
  else
  {
    v13 = v11;
  }
  uint64_t v14 = [v12 firstObject];
LABEL_11:
  id v10 = (id)v14;

LABEL_12:

  return v10;
}

+ (id)metalDeviceForComputeDevice:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 metalDevice];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)isGPUComputeDevice:(id)a3
{
  return [a1 typeOfComputeDevice:a3] == 2;
}

+ (id)computeDeviceForMetalDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = objc_msgSend(a1, "allGPUComputeDevices", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 metalDevice];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)computeDevicesPassingTest:(id)a3
{
  id v4 = a3;
  char v5 = [a1 allComputeDevices];
  id v6 = [a1 computeDevices:v5 passingTest:v4];

  return v6;
}

+ (unint64_t)computeDeviceTypesForMLComputeUnits:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return qword_1A410D1E8[a3];
  }
}

+ (id)allGPUAndNeuralEngineComputeDevices
{
  id v3 = [a1 computeDevicesOfTypes:6];
  id v4 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);

  return v4;
}

+ (id)allCPUAndNeuralEngineComputeDevices
{
  id v3 = [a1 computeDevicesOfTypes:5];
  id v4 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);

  return v4;
}

+ (id)allCPUAndGPUComputeDevices
{
  id v3 = [a1 computeDevicesOfTypes:3];
  id v4 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);

  return v4;
}

+ (id)espressoV1ModelComputeDevices
{
  id v3 = [a1 computeDevicesOfTypes:7];
  id v4 = +[VNComputeDeviceUtilities _decreasingPerformanceSortedComputeDevices:]((uint64_t)a1, v3);

  return v4;
}

+ (id)mostPerformantGPUComputeDevice
{
  id v3 = [a1 allGPUComputeDevices];
  id v4 = [a1 mostPerformantComputeDeviceOfComputeDevices:v3];

  return v4;
}

+ (id)mostPerformantCPUComputeDevice
{
  id v3 = [a1 allCPUComputeDevices];
  id v4 = [a1 mostPerformantComputeDeviceOfComputeDevices:v3];

  return v4;
}

+ (id)allGPUComputeDevices
{
  return (id)[a1 computeDevicesOfTypes:2];
}

+ (BOOL)isCPUComputeDevice:(id)a3
{
  return [a1 typeOfComputeDevice:a3] == 1;
}

@end