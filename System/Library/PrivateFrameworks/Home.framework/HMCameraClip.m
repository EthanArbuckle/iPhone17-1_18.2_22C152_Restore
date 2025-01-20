@interface HMCameraClip
@end

@implementation HMCameraClip

uint64_t __60__HMCameraClip_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 reason];
  return MEMORY[0x270EF3D78](v2);
}

BOOL __55__HMCameraClip_HFAdditions__hf_hasInsufficientAnalysis__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason] == 6;
}

uint64_t __36__HMCameraClip_HFAdditions__hf_size__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 byteLength];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __63__HMCameraClip_HFAdditions__hf_allEventsContainingPeopleInClip__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 faceClassification];
  v4 = [v3 person];
  v5 = [v4 name];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __53__HMCameraClip_HFAdditions__hf_faceCropNameAtOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  double v7 = *(double *)(a1 + 40);
  id v12 = v6;
  [v6 timeOffsetWithinClip];
  if (vabdd_f64(v7, v8) < 4.0)
  {
    uint64_t v9 = objc_msgSend(v12, "hf_faceClassificationName");
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void __54__HMCameraClip_HFAdditions__hf_faceCropNamesAtOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  double v7 = *(double *)(a1 + 48);
  id v13 = v6;
  [v6 timeOffsetWithinClip];
  double v9 = vabdd_f64(v7, v8);
  if (v9 < 4.0)
  {
    uint64_t v10 = objc_msgSend(v13, "hf_faceClassificationName");
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      objc_msgSend(*(id *)(a1 + 32), "addObject:");
    }
  }
  if (v9 > 8.0) {
    *a4 = 1;
  }
}

void __58__HMCameraClip_HFAdditions__hf_familiarFaceEventAtOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = *(double *)(a1 + 40);
  id v11 = v7;
  [v7 timeOffsetWithinClip];
  if (vabdd_f64(v8, v9) < 4.0)
  {
    uint64_t v10 = objc_msgSend(v11, "hf_faceClassificationName");

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

@end