@interface MTROTAHeader
- (MTROTAHeader)initWithData:(NSData *)data;
- (MTROTAImageDigestType)imageDigestType;
- (NSData)imageDigest;
- (NSNumber)maxApplicableVersion;
- (NSNumber)minApplicableVersion;
- (NSNumber)payloadSize;
- (NSNumber)productID;
- (NSNumber)softwareVersion;
- (NSNumber)vendorID;
- (NSString)releaseNotesURL;
- (NSString)softwareVersionString;
- (void)setImageDigest:(NSData *)imageDigest;
- (void)setImageDigestType:(MTROTAImageDigestType)imageDigestType;
- (void)setMaxApplicableVersion:(NSNumber *)maxApplicableVersion;
- (void)setMinApplicableVersion:(NSNumber *)minApplicableVersion;
- (void)setPayloadSize:(NSNumber *)payloadSize;
- (void)setProductID:(NSNumber *)productID;
- (void)setReleaseNotesURL:(NSString *)releaseNotesURL;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
- (void)setSoftwareVersionString:(NSString *)softwareVersionString;
- (void)setVendorID:(NSNumber *)vendorID;
@end

@implementation MTROTAHeader

- (MTROTAHeader)initWithData:(NSData *)data
{
  v4 = data;
  v66.receiver = self;
  v66.super_class = (Class)MTROTAHeader;
  v5 = [(MTROTAHeader *)&v66 init];
  if (v5)
  {
    v65 = 0;
    sub_244CB2D38((uint64_t)v64);
    if (v64[0])
    {
      v6 = v4;
      uint64_t v9 = objc_msgSend_bytes(v6, v7, v8);
      uint64_t v12 = objc_msgSend_length(v6, v10, v11);
      sub_2446C1098(&v53, v9, v12);

      long long v63 = v53;
      *((void *)&v53 + 1) = 0;
      uint64_t v54 = 0;
      v56[0] = 0;
      v57[0] = 0;
      uint64_t v58 = 0;
      uint64_t v59 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      memset(v52, 0, sizeof(v52));
      sub_244CB2D88((uint64_t)v64, (uint64_t)&v63, (uint64_t)&v53, (uint64_t)v52);
      if (!LODWORD(v52[0]))
      {
        uint64_t v15 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v13, (unsigned __int16)v53);
        vendorID = v5->_vendorID;
        v5->_vendorID = (NSNumber *)v15;

        uint64_t v18 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v17, WORD1(v53));
        productID = v5->_productID;
        v5->_productID = (NSNumber *)v18;

        uint64_t v21 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v20, v55);
        payloadSize = v5->_payloadSize;
        v5->_payloadSize = (NSNumber *)v21;

        uint64_t v24 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v23, DWORD1(v53));
        softwareVersion = v5->_softwareVersion;
        v5->_softwareVersion = (NSNumber *)v24;

        uint64_t v26 = *((void *)&v53 + 1);
        uint64_t v27 = v54;
        id v28 = [NSString alloc];
        uint64_t v30 = objc_msgSend_initWithBytes_length_encoding_(v28, v29, v26, v27, 4);
        softwareVersionString = v5->_softwareVersionString;
        v5->_softwareVersionString = (NSString *)v30;

        uint64_t v32 = v58;
        uint64_t v33 = v59;
        id v34 = [NSString alloc];
        uint64_t v36 = objc_msgSend_initWithBytes_length_encoding_(v34, v35, v32, v33, 4);
        releaseNotesURL = v5->_releaseNotesURL;
        v5->_releaseNotesURL = (NSString *)v36;

        uint64_t v39 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v38, v61, v62);
        imageDigest = v5->_imageDigest;
        v5->_imageDigest = (NSData *)v39;

        v5->_imageDigestType = v60;
        if (v56[0])
        {
          v41 = NSNumber;
          v42 = sub_2447A4A8C(v56);
          uint64_t v44 = objc_msgSend_numberWithUnsignedInt_(v41, v43, *(unsigned int *)v42);
          minApplicableVersion = v5->_minApplicableVersion;
          v5->_minApplicableVersion = (NSNumber *)v44;
        }
        else
        {
          minApplicableVersion = v5->_minApplicableVersion;
          v5->_minApplicableVersion = 0;
        }

        if (v57[0])
        {
          v46 = NSNumber;
          v47 = sub_2447A4A8C(v57);
          uint64_t v49 = objc_msgSend_numberWithUnsignedInt_(v46, v48, *(unsigned int *)v47);
          maxApplicableVersion = v5->_maxApplicableVersion;
          v5->_maxApplicableVersion = (NSNumber *)v49;
        }
        else
        {
          maxApplicableVersion = v5->_maxApplicableVersion;
          v5->_maxApplicableVersion = 0;
        }

        sub_244CB2D50((uint64_t)v64);
        v14 = v5;
        goto LABEL_14;
      }
      sub_244CB2D50((uint64_t)v64);
    }
    v14 = 0;
LABEL_14:
    sub_2446D7EC0(&v65);
    goto LABEL_15;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(NSNumber *)productID
{
}

- (NSNumber)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(NSNumber *)payloadSize
{
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (NSString)softwareVersionString
{
  return self->_softwareVersionString;
}

- (void)setSoftwareVersionString:(NSString *)softwareVersionString
{
}

- (NSString)releaseNotesURL
{
  return self->_releaseNotesURL;
}

- (void)setReleaseNotesURL:(NSString *)releaseNotesURL
{
}

- (NSData)imageDigest
{
  return self->_imageDigest;
}

- (void)setImageDigest:(NSData *)imageDigest
{
}

- (MTROTAImageDigestType)imageDigestType
{
  return self->_imageDigestType;
}

- (void)setImageDigestType:(MTROTAImageDigestType)imageDigestType
{
  self->_imageDigestType = imageDigestType;
}

- (NSNumber)minApplicableVersion
{
  return self->_minApplicableVersion;
}

- (void)setMinApplicableVersion:(NSNumber *)minApplicableVersion
{
}

- (NSNumber)maxApplicableVersion
{
  return self->_maxApplicableVersion;
}

- (void)setMaxApplicableVersion:(NSNumber *)maxApplicableVersion
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxApplicableVersion, 0);
  objc_storeStrong((id *)&self->_minApplicableVersion, 0);
  objc_storeStrong((id *)&self->_imageDigest, 0);
  objc_storeStrong((id *)&self->_releaseNotesURL, 0);
  objc_storeStrong((id *)&self->_softwareVersionString, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_payloadSize, 0);
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end