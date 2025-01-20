@interface CRXFPrescriptionNameGenerator
- (CRXFPrescriptionNameGenerator)init;
- (id)generatePrescriptionNameForLensType:(unint64_t)a3 userName:(id)a4 inGuestMode:(BOOL)a5;
@end

@implementation CRXFPrescriptionNameGenerator

- (CRXFPrescriptionNameGenerator)init
{
  v16.receiver = self;
  v16.super_class = (Class)CRXFPrescriptionNameGenerator;
  v2 = [(CRXFPrescriptionNameGenerator *)&v16 init];
  if (v2)
  {
    uint64_t v3 = CRXFLocalizedString(@"PRESCRIPTION_NAME_DEFAULT");
    defaultLensName = v2->_defaultLensName;
    v2->_defaultLensName = (NSString *)v3;

    uint64_t v5 = CRXFLocalizedString(@"PRESCRIPTION_NAME_GUEST_LENSES");
    guestLensName = v2->_guestLensName;
    v2->_guestLensName = (NSString *)v5;

    uint64_t v7 = CRXFLocalizedString(@"PRESCRIPTION_NAME_DEMO_LENSES");
    demoLensName = v2->_demoLensName;
    v2->_demoLensName = (NSString *)v7;

    uint64_t v9 = CRXFLocalizedString(@"PRESCRIPTION_NAME_READER_LENSES");
    readerLensName = v2->_readerLensName;
    v2->_readerLensName = (NSString *)v9;

    uint64_t v11 = CRXFLocalizedString(@"PRESCRIPTION_NAME_DEVELOPER_LENSES");
    developerLensName = v2->_developerLensName;
    v2->_developerLensName = (NSString *)v11;

    uint64_t v13 = CRXFLocalizedString(@"PRESCRIPTION_NAME_PRESCRIPTION_LENSES");
    prescriptionLensName = v2->_prescriptionLensName;
    v2->_prescriptionLensName = (NSString *)v13;
  }
  return v2;
}

- (id)generatePrescriptionNameForLensType:(unint64_t)a3 userName:(id)a4 inGuestMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (v5)
  {
    uint64_t v9 = self->_guestLensName;
  }
  else
  {
    uint64_t v9 = self->_defaultLensName;
    switch(a3)
    {
      case 0uLL:
        demoLensName = self->_demoLensName;
        goto LABEL_15;
      case 1uLL:
        if (v8)
        {
          CRXFLocalizedStringWithArguments(@"PRESCRIPTION_NAME_READER_LENSES_PERSONALIZED_FORMAT", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
          goto LABEL_11;
        }
        demoLensName = self->_readerLensName;
        goto LABEL_15;
      case 2uLL:
        if (v8)
        {
          CRXFLocalizedStringWithArguments(@"PRESCRIPTION_NAME_DEVELOPER_LENSES_PERSONALIZED_FORMAT", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
          goto LABEL_11;
        }
        demoLensName = self->_developerLensName;
        goto LABEL_15;
      case 3uLL:
        if (v8)
        {
          CRXFLocalizedStringWithArguments(@"PRESCRIPTION_NAME_PRESCRIPTION_LENSES_PERSONALIZED_FORMAT", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          demoLensName = self->_prescriptionLensName;
LABEL_15:
          v18 = demoLensName;
        }
        v19 = v18;

        uint64_t v9 = v19;
        break;
      default:
        break;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prescriptionLensPersonalizedName, 0);
  objc_storeStrong((id *)&self->_prescriptionLensName, 0);
  objc_storeStrong((id *)&self->_developerLensPersonalizedName, 0);
  objc_storeStrong((id *)&self->_developerLensName, 0);
  objc_storeStrong((id *)&self->_readerLensPersonalizedName, 0);
  objc_storeStrong((id *)&self->_readerLensName, 0);
  objc_storeStrong((id *)&self->_demoLensName, 0);
  objc_storeStrong((id *)&self->_guestLensName, 0);
  objc_storeStrong((id *)&self->_defaultLensName, 0);
}

@end