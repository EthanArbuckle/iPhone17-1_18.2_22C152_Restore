@interface HMCameraClip(HFAdditions)
- (BOOL)hf_isPlayable;
- (id)dealloc;
- (id)hf_allEventsContainingPeopleInClip;
- (id)hf_dateInterval;
- (id)hf_endDate;
- (id)hf_faceCropNameAtOffset:()HFAdditions;
- (id)hf_faceCropNamesAtOffset:()HFAdditions;
- (id)hf_familiarFaceEventAtOffset:()HFAdditions;
- (id)hf_sortedSignificantEvents;
- (uint64_t)containerType;
- (uint64_t)hf_duration;
- (uint64_t)hf_hasInsufficientAnalysis;
- (uint64_t)hf_size;
- (void)hf_sortSignificantEvents;
@end

@implementation HMCameraClip(HFAdditions)

- (id)hf_endDate
{
  v2 = [a1 dateOfOccurrence];
  [a1 duration];
  v3 = objc_msgSend(v2, "dateByAddingTimeInterval:");

  return v3;
}

- (id)hf_dateInterval
{
  id v2 = objc_alloc(MEMORY[0x263F08798]);
  v3 = [a1 dateOfOccurrence];
  [a1 duration];
  v4 = objc_msgSend(v2, "initWithStartDate:duration:", v3);

  return v4;
}

- (uint64_t)hf_duration
{
  uint64_t result = [a1 duration];
  if (v3 >= 0.00000011920929)
  {
    return [a1 duration];
  }
  return result;
}

- (BOOL)hf_isPlayable
{
  BOOL result = 1;
  if ([a1 isComplete])
  {
    [a1 duration];
    if (v2 < 0.00000011920929) {
      return 0;
    }
  }
  return result;
}

- (uint64_t)hf_hasInsufficientAnalysis
{
  if (+[HFCameraUtilities treatAllClipsAsUnanalyzed]) {
    return 1;
  }
  double v3 = [a1 significantEvents];
  uint64_t v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_50);

  return v4;
}

- (id)hf_sortedSignificantEvents
{
  v1 = objc_getAssociatedObject(a1, "SortedSignificantEvents");
  double v2 = v1;
  if (v1) {
    double v3 = (void *)[v1 copy];
  }
  else {
    double v3 = (void *)MEMORY[0x263EFFA68];
  }

  return v3;
}

- (void)hf_sortSignificantEvents
{
  v10[1] = *MEMORY[0x263EF8340];
  if (+[HFCameraUtilities treatAllClipsAsUnanalyzed])
  {
    id v2 = objc_alloc(MEMORY[0x263F0E1C0]);
    double v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [a1 dateOfOccurrence];
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [a1 uniqueIdentifier];
    v7 = (void *)[v2 initWithUniqueIdentifier:v3 reason:6 dateOfOccurrence:v4 confidenceLevel:100 cameraProfileUUID:v5 faceClassification:0 timeOffsetWithinClip:0.0 clipUUID:v6];
    v10[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    double v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"dateOfOccurrence" ascending:1];
    uint64_t v4 = [a1 significantEvents];
    v9 = v3;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    v8 = [v4 sortedArrayUsingDescriptors:v5];
  }

  objc_setAssociatedObject(a1, "SortedSignificantEvents", v8, (void *)0x301);
}

- (uint64_t)hf_size
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v1 = [a1 videoDataSegments];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__HMCameraClip_HFAdditions__hf_size__block_invoke;
  v4[3] = &unk_2640912A8;
  v4[4] = &v5;
  objc_msgSend(v1, "na_each:", v4);

  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)hf_allEventsContainingPeopleInClip
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  double v3 = objc_msgSend(a1, "hf_sortedSignificantEvents");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HMCameraClip_HFAdditions__hf_allEventsContainingPeopleInClip__block_invoke;
  v6[3] = &unk_2640912D0;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

- (id)hf_faceCropNameAtOffset:()HFAdditions
{
  double v3 = objc_msgSend(a1, "hf_sortedSignificantEvents");
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HMCameraClip_HFAdditions__hf_faceCropNameAtOffset___block_invoke;
  v6[3] = &unk_2640912F8;
  *(double *)&v6[5] = a2;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)hf_faceCropNamesAtOffset:()HFAdditions
{
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = objc_msgSend(a1, "hf_sortedSignificantEvents");
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__8;
  v14[4] = __Block_byref_object_dispose__8;
  id v15 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __54__HMCameraClip_HFAdditions__hf_faceCropNamesAtOffset___block_invoke;
  v10[3] = &unk_264091320;
  double v13 = a2;
  id v12 = v14;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  uint64_t v7 = v11;
  id v8 = v6;

  _Block_object_dispose(v14, 8);
  return v8;
}

- (id)hf_familiarFaceEventAtOffset:()HFAdditions
{
  double v3 = objc_msgSend(a1, "hf_sortedSignificantEvents");
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  id v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HMCameraClip_HFAdditions__hf_familiarFaceEventAtOffset___block_invoke;
  v6[3] = &unk_2640912F8;
  *(double *)&v6[5] = a2;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)dealloc
{
  objc_setAssociatedObject(a1, "SortedSignificantEvents", 0, (void *)0x301);
  v3.receiver = a1;
  v3.super_class = (Class)&off_26C165220;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (uint64_t)containerType
{
  return 1;
}

@end