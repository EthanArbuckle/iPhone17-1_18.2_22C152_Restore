@interface _VNImageAnalyzerMultiDetectorTilingObservationsRecipient
- (VNRequestSpecifier)originatingRequestSpecifier;
- (_VNImageAnalyzerMultiDetectorTilingObservationsRecipient)initWithObservationsRecipient:(id)a3;
@end

@implementation _VNImageAnalyzerMultiDetectorTilingObservationsRecipient

- (void).cxx_destruct
{
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)[(VNObservationsRecipient *)self->_observationsRecipient originatingRequestSpecifier];
}

- (_VNImageAnalyzerMultiDetectorTilingObservationsRecipient)initWithObservationsRecipient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNImageAnalyzerMultiDetectorTilingObservationsRecipient;
  v6 = [(_VNImageAnalyzerMultiDetectorTilingObservationsRecipient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observationsRecipient, a3);
  }

  return v7;
}

@end