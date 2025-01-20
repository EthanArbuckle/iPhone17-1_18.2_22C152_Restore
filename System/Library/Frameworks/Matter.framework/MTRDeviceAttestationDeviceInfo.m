@interface MTRDeviceAttestationDeviceInfo
- (MTRCertificateDERBytes)dacCertificate;
- (MTRCertificateDERBytes)dacPAICertificate;
- (MTRDeviceAttestationDeviceInfo)initWithDACCertificate:(id)a3 dacPAICertificate:(id)a4 certificateDeclaration:(id)a5 basicInformationVendorID:(id)a6 basicInformationProductID:(id)a7;
- (NSData)certificateDeclaration;
- (NSNumber)basicInformationProductID;
- (NSNumber)basicInformationVendorID;
- (NSNumber)productID;
- (NSNumber)vendorID;
@end

@implementation MTRDeviceAttestationDeviceInfo

- (MTRDeviceAttestationDeviceInfo)initWithDACCertificate:(id)a3 dacPAICertificate:(id)a4 certificateDeclaration:(id)a5 basicInformationVendorID:(id)a6 basicInformationProductID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v66.receiver = self;
  v66.super_class = (Class)MTRDeviceAttestationDeviceInfo;
  v19 = [(MTRDeviceAttestationDeviceInfo *)&v66 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v12, v17, v18);
    dacCertificate = v19->_dacCertificate;
    v19->_dacCertificate = (NSData *)v20;

    uint64_t v24 = objc_msgSend_copy(v13, v22, v23);
    dacPAICertificate = v19->_dacPAICertificate;
    v19->_dacPAICertificate = (NSData *)v24;

    uint64_t v28 = objc_msgSend_copy(v14, v26, v27);
    certificateDeclaration = v19->_certificateDeclaration;
    v19->_certificateDeclaration = (NSData *)v28;

    uint64_t v32 = objc_msgSend_copy(v15, v30, v31);
    basicInformationVendorID = v19->_basicInformationVendorID;
    v19->_basicInformationVendorID = (NSNumber *)v32;

    uint64_t v36 = objc_msgSend_copy(v16, v34, v35);
    basicInformationProductID = v19->_basicInformationProductID;
    v19->_basicInformationProductID = (NSNumber *)v36;

    v62[0] = 0;
    char v64 = 0;
    v38 = v19->_dacCertificate;
    uint64_t v41 = objc_msgSend_bytes(v38, v39, v40);
    uint64_t v44 = objc_msgSend_length(v38, v42, v43);
    sub_2446C1098(&v67, v41, v44);

    long long v60 = v67;
    sub_244CF0514((uint64_t)&v60, v62, (uint64_t)v61);
    if (!v61[0])
    {
      v58[0] = v62[0];
      if (v62[0])
      {
        __int16 v59 = v63;
        v45 = NSNumber;
        v46 = sub_2447A4DF0(v58);
        uint64_t v48 = objc_msgSend_numberWithUnsignedShort_(v45, v47, *(unsigned __int16 *)v46);
      }
      else
      {
        uint64_t v48 = 0;
      }
      vendorID = v19->_vendorID;
      v19->_vendorID = (NSNumber *)v48;

      v56[0] = v64;
      if (v64)
      {
        __int16 v57 = v65;
        v50 = NSNumber;
        v51 = sub_2447A4DF0(v56);
        uint64_t v53 = objc_msgSend_numberWithUnsignedShort_(v50, v52, *(unsigned __int16 *)v51);
      }
      else
      {
        uint64_t v53 = 0;
      }
      productID = v19->_productID;
      v19->_productID = (NSNumber *)v53;
    }
  }

  return v19;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSNumber)basicInformationVendorID
{
  return self->_basicInformationVendorID;
}

- (NSNumber)basicInformationProductID
{
  return self->_basicInformationProductID;
}

- (MTRCertificateDERBytes)dacCertificate
{
  return self->_dacCertificate;
}

- (MTRCertificateDERBytes)dacPAICertificate
{
  return self->_dacPAICertificate;
}

- (NSData)certificateDeclaration
{
  return self->_certificateDeclaration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateDeclaration, 0);
  objc_storeStrong((id *)&self->_dacPAICertificate, 0);
  objc_storeStrong((id *)&self->_dacCertificate, 0);
  objc_storeStrong((id *)&self->_basicInformationProductID, 0);
  objc_storeStrong((id *)&self->_basicInformationVendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end