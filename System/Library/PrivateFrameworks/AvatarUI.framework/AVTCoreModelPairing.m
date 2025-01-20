@interface AVTCoreModelPairing
- (AVTCoreModelPairing)initWithPairedCategory:(int64_t)a3 pairedTitle:(id)a4 pairTitle:(id)a5 unpairTitle:(id)a6 pairedDescription:(id)a7 unpairedDescription:(id)a8;
- (NSString)localizedPairTitle;
- (NSString)localizedPairedDescription;
- (NSString)localizedPairedTitle;
- (NSString)localizedUnpairTitle;
- (NSString)localizedUnpairedDescription;
- (id)description;
- (int64_t)pairedCategory;
@end

@implementation AVTCoreModelPairing

- (AVTCoreModelPairing)initWithPairedCategory:(int64_t)a3 pairedTitle:(id)a4 pairTitle:(id)a5 unpairTitle:(id)a6 pairedDescription:(id)a7 unpairedDescription:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)AVTCoreModelPairing;
  v18 = [(AVTCoreModelPairing *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_pairedCategory = a3;
    objc_storeStrong((id *)&v18->_localizedPairedTitle, a4);
    objc_storeStrong((id *)&v19->_localizedPairTitle, a5);
    objc_storeStrong((id *)&v19->_localizedUnpairTitle, a6);
    objc_storeStrong((id *)&v19->_localizedPairedDescription, a7);
    objc_storeStrong((id *)&v19->_localizedUnpairedDescription, a8);
  }

  return v19;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelPairing;
  v3 = [(AVTCoreModelPairing *)&v13 description];
  v4 = (void *)[v3 mutableCopy];

  [(AVTCoreModelPairing *)self pairedCategory];
  v5 = AVTPresetCategoryToString();
  v6 = [(AVTCoreModelPairing *)self localizedPairedTitle];
  v7 = [(AVTCoreModelPairing *)self localizedPairTitle];
  v8 = [(AVTCoreModelPairing *)self localizedUnpairTitle];
  v9 = [(AVTCoreModelPairing *)self localizedPairedDescription];
  v10 = [(AVTCoreModelPairing *)self localizedUnpairedDescription];
  [v4 appendFormat:@" AVTCoreModelPairing: category:%@\n pairedTitle: %@\n, pairTitle: %@\n, unpairTitle: %@\n pairedDescription: %@\n unpairedDescription: %@", v5, v6, v7, v8, v9, v10];

  v11 = (void *)[v4 copy];
  return v11;
}

- (int64_t)pairedCategory
{
  return self->_pairedCategory;
}

- (NSString)localizedPairedTitle
{
  return self->_localizedPairedTitle;
}

- (NSString)localizedPairTitle
{
  return self->_localizedPairTitle;
}

- (NSString)localizedUnpairTitle
{
  return self->_localizedUnpairTitle;
}

- (NSString)localizedPairedDescription
{
  return self->_localizedPairedDescription;
}

- (NSString)localizedUnpairedDescription
{
  return self->_localizedUnpairedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedUnpairedDescription, 0);
  objc_storeStrong((id *)&self->_localizedPairedDescription, 0);
  objc_storeStrong((id *)&self->_localizedUnpairTitle, 0);
  objc_storeStrong((id *)&self->_localizedPairTitle, 0);
  objc_storeStrong((id *)&self->_localizedPairedTitle, 0);
}

@end