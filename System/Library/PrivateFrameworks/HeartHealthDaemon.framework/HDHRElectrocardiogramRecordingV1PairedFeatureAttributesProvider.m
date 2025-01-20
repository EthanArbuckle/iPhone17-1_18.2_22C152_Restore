@interface HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider
- (HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider)initWithPairedFeatureAttributesProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4;
- (HKPairedFeatureAttributes)currentPairedFeatureAttributes;
@end

@implementation HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider

- (HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider)initWithPairedFeatureAttributesProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider;
  v9 = [(HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributesProvider, a3);
    objc_storeStrong((id *)&v10->_pairedDeviceProvider, a4);
  }

  return v10;
}

- (HKPairedFeatureAttributes)currentPairedFeatureAttributes
{
  v3 = [(HDPairedFeatureAttributesProviding *)self->_attributesProvider currentPairedFeatureAttributes];
  v4 = [v3 pairedAttributes];

  if (!v4)
  {
    v5 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceProvider activePairedDevice];
    v6 = v5;
    if (v5)
    {
      id v7 = [v5 valueForProperty:*MEMORY[0x1E4F79D70]];
      if (v7)
      {
        id v8 = [v6 valueForProperty:*MEMORY[0x1E4F79D60]];
        v9 = [v6 valueForProperty:*MEMORY[0x1E4F79D58]];
        v4 = (void *)[objc_alloc(MEMORY[0x1E4F2AFE8]) initWithFeatureVersion:@"1" updateVersion:v7 UDIDeviceIdentifier:v8 yearOfRelease:v9];
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v4 = 0;
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F2B318]);
  v11 = [(HDPairedFeatureAttributesProviding *)self->_attributesProvider currentPairedFeatureAttributes];
  objc_super v12 = [v11 localAttributes];
  v13 = (void *)[v10 initWithLocalAttributes:v12 pairedAttributes:v4];

  return (HKPairedFeatureAttributes *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceProvider, 0);

  objc_storeStrong((id *)&self->_attributesProvider, 0);
}

@end