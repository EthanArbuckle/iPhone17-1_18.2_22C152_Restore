@interface MTROperationalCertificateChainIssuerShim
- (BOOL)shouldSkipAttestationCertificateValidation;
- (MTRNOCChainIssuer)nocChainIssuer;
- (MTROperationalCertificateChainIssuerShim)initWithIssuer:(id)a3;
- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6;
@end

@implementation MTROperationalCertificateChainIssuerShim

- (MTROperationalCertificateChainIssuerShim)initWithIssuer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTROperationalCertificateChainIssuerShim;
  v6 = [(MTROperationalCertificateChainIssuerShim *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nocChainIssuer, a3);
    v7->_shouldSkipAttestationCertificateValidation = 1;
  }

  return v7;
}

- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v61 = v8;
  id v62 = a6;
  v10 = [CSRInfo alloc];
  v13 = objc_msgSend_csrNonce(v8, v11, v12);
  v16 = objc_msgSend_csrElementsTLV(v8, v14, v15);
  v17 = v8;
  v20 = objc_msgSend_attestationSignature(v8, v18, v19);
  v23 = objc_msgSend_csr(v17, v21, v22);
  v60 = objc_msgSend_initWithNonce_elements_elementsSignature_csr_(v10, v24, (uint64_t)v13, v16, v20, v23);

  v29 = objc_msgSend_firmwareInfo(v9, v25, v26);
  if (!v29)
  {
    v29 = objc_msgSend_data(MEMORY[0x263EFF8F8], v27, v28);
  }
  v30 = [AttestationInfo alloc];
  v33 = objc_msgSend_challenge(v9, v31, v32);
  v36 = objc_msgSend_nonce(v9, v34, v35);
  v39 = objc_msgSend_elementsTLV(v9, v37, v38);
  v42 = objc_msgSend_elementsSignature(v9, v40, v41);
  v45 = objc_msgSend_deviceAttestationCertificate(v9, v43, v44);
  v48 = objc_msgSend_productAttestationIntermediateCertificate(v9, v46, v47);
  v51 = objc_msgSend_certificationDeclaration(v9, v49, v50);
  v53 = objc_msgSend_initWithChallenge_nonce_elements_elementsSignature_dac_pai_certificationDeclaration_firmwareInfo_(v30, v52, (uint64_t)v33, v36, v39, v42, v45, v48, v51, v29);

  v56 = objc_msgSend_nocChainIssuer(self, v54, v55);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = sub_2448547C0;
  v63[3] = &unk_265198BE0;
  id v57 = v62;
  id v64 = v57;
  objc_msgSend_onNOCChainGenerationNeeded_attestationInfo_onNOCChainGenerationComplete_(v56, v58, (uint64_t)v60, v53, v63);
}

- (MTRNOCChainIssuer)nocChainIssuer
{
  return self->_nocChainIssuer;
}

- (BOOL)shouldSkipAttestationCertificateValidation
{
  return self->_shouldSkipAttestationCertificateValidation;
}

- (void).cxx_destruct
{
}

@end