@interface HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider
- (HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider)initWithPairedFeatureAttributesProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4;
- (HKPairedFeatureAttributes)currentPairedFeatureAttributes;
@end

@implementation HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider

- (HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider)initWithPairedFeatureAttributesProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider;
  v9 = [(HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *)&v12 init];
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
    v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v5 isAppleWatch];

    id v7 = &HKHRElectrocardiogramRecordingV2PhoneUDIDeviceIdentifier;
    if (v6) {
      id v7 = HKHRElectrocardiogramRecordingV2WatchUDIDeviceIdentifier;
    }
    id v8 = *v7;
    v9 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceProvider activePairedDevice];
    v10 = v9;
    if (v9)
    {
      v4 = [v9 valueForProperty:*MEMORY[0x1E4F79D68]];

      if (v4)
      {
        v11 = [v10 valueForProperty:*MEMORY[0x1E4F79E40]];
        objc_super v12 = HKFeatureUpdateVersionFromMajorVersionAndBuildVersion();
        v13 = HKUDIDeviceIdentifierFromDeviceIdentifierAndBatchNumber();
        v14 = [v10 valueForProperty:*MEMORY[0x1E4F79D58]];
        v4 = (void *)[objc_alloc(MEMORY[0x1E4F2AFE8]) initWithFeatureVersion:@"2" updateVersion:v12 UDIDeviceIdentifier:v13 yearOfRelease:v14];
      }
    }
    else
    {
      v4 = 0;
    }
  }
  id v15 = objc_alloc(MEMORY[0x1E4F2B318]);
  v16 = [(HDPairedFeatureAttributesProviding *)self->_attributesProvider currentPairedFeatureAttributes];
  v17 = [v16 localAttributes];
  v18 = (void *)[v15 initWithLocalAttributes:v17 pairedAttributes:v4];

  return (HKPairedFeatureAttributes *)v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceProvider, 0);

  objc_storeStrong((id *)&self->_attributesProvider, 0);
}

@end