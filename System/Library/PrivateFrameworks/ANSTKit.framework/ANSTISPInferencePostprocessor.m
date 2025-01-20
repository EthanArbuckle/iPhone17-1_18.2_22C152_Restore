@interface ANSTISPInferencePostprocessor
- (id)semanticSegmentationMaskDescriptorOfCategory:(id)a3;
- (id)trackedObjectsOfCategory:(id)a3;
@end

@implementation ANSTISPInferencePostprocessor

- (id)trackedObjectsOfCategory:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v4, *MEMORY[0x263EFF4A0], @"A concrete implementation of -trackedObjectsOfCategory: is required.", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (id)semanticSegmentationMaskDescriptorOfCategory:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v4, *MEMORY[0x263EFF4A0], @"A concrete implementation of -semanticSegmentationMaskDescriptorOfCategory: is required.", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

@end