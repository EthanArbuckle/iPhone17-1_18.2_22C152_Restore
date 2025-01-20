@interface _DPDAP02PayloadEncoder
- (BOOL)encodeExtensionsWithError:(id *)a3;
- (BOOL)encodeHPKECipherTextWithError:(id *)a3;
- (BOOL)encodeReportMetadataWithError:(id *)a3;
- (NSData)extensions;
- (NSData)hpkeCipherText;
- (NSData)reportMetadata;
- (_DPDAP02PayloadEncoder)initWithDonation:(id)a3 keys:(id)a4 error:(id *)a5;
- (id)dapVersion;
- (id)encodedAdditionalDataWithError:(id *)a3;
- (id)encodedPlaintextInputShareForServerRole:(unsigned __int8)a3 error:(id *)a4;
- (id)encodedReportWithError:(id *)a3;
- (void)setExtensions:(id)a3;
- (void)setHpkeCipherText:(id)a3;
- (void)setReportMetadata:(id)a3;
@end

@implementation _DPDAP02PayloadEncoder

- (_DPDAP02PayloadEncoder)initWithDonation:(id)a3 keys:(id)a4 error:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_DPDAP02PayloadEncoder;
  v5 = [(_DPDAPPayloadEncoder *)&v11 initWithDonation:a3 keys:a4 error:a5];
  v6 = v5;
  if (v5)
  {
    extensions = v5->_extensions;
    v5->_extensions = 0;

    hpkeCipherText = v6->_hpkeCipherText;
    v6->_hpkeCipherText = 0;

    reportMetadata = v6->_reportMetadata;
    v6->_reportMetadata = 0;
  }
  return v6;
}

- (id)encodedReportWithError:(id *)a3
{
  v5 = [(_DPDAPPayloadEncoder *)self report];

  if (v5)
  {
    v6 = [(_DPDAPPayloadEncoder *)self report];
    goto LABEL_15;
  }
  v7 = [(_DPDAPPayloadEncoder *)self taskIDWithError:a3];
  if (v7)
  {
    [(_DPDAP02PayloadEncoder *)self encodeReportMetadataWithError:a3];
    v8 = [(_DPDAP02PayloadEncoder *)self reportMetadata];

    if (v8)
    {
      [(_DPDAPPayloadEncoder *)self encodePublicShare];
      v9 = [(_DPDAPPayloadEncoder *)self publicShare];
      unint64_t v10 = (unint64_t)[v9 length];

      if (HIDWORD(v10))
      {
        CFStringRef v11 = @"Public share length exceeds 4GB.";
        goto LABEL_10;
      }
      [(_DPDAP02PayloadEncoder *)self encodeHPKECipherTextWithError:a3];
      v12 = [(_DPDAP02PayloadEncoder *)self hpkeCipherText];

      if (v12)
      {
        v13 = [(_DPDAP02PayloadEncoder *)self hpkeCipherText];
        unint64_t v14 = (unint64_t)[v13 length];

        if (!HIDWORD(v14))
        {
          id v16 = [v7 length];
          v17 = [(_DPDAP02PayloadEncoder *)self reportMetadata];
          v18 = (char *)[v17 length];
          v19 = [(_DPDAPPayloadEncoder *)self publicShare];
          id v20 = [v19 length];
          v21 = [(_DPDAP02PayloadEncoder *)self hpkeCipherText];
          v22 = &v18[(void)v16 + 8 + (unint64_t)[v21 length] + (void)v20];

          id v15 = [objc_alloc((Class)_DPBigEndianDataEncoder) initWithCapacity:v22];
          [v15 appendData:v7];
          v23 = [(_DPDAP02PayloadEncoder *)self reportMetadata];
          [v15 appendData:v23];

          v24 = [(_DPDAPPayloadEncoder *)self publicShare];
          objc_msgSend(v15, "writeUInt32:", objc_msgSend(v24, "length"));

          v25 = [(_DPDAPPayloadEncoder *)self publicShare];
          [v15 appendData:v25];

          v26 = [(_DPDAP02PayloadEncoder *)self hpkeCipherText];
          objc_msgSend(v15, "writeUInt32:", objc_msgSend(v26, "length"));

          v27 = [(_DPDAP02PayloadEncoder *)self hpkeCipherText];
          [v15 appendData:v27];

          v28 = [v15 buffer];
          [(_DPDAPPayloadEncoder *)self setReport:v28];

          v6 = [(_DPDAPPayloadEncoder *)self report];
          goto LABEL_13;
        }
        CFStringRef v11 = @"Encrypted input share length exceeds 4GB.";
LABEL_10:
        id v15 = +[_DPDediscoError errorWithCode:800 description:v11];
        [v15 logAndStoreInError:a3];
        v6 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
  }
  v6 = 0;
LABEL_14:

LABEL_15:
  return v6;
}

- (id)dapVersion
{
  return @"02";
}

- (id)encodedAdditionalDataWithError:(id *)a3
{
  v5 = -[_DPDAPPayloadEncoder taskIDWithError:](self, "taskIDWithError:");
  if (v5
    && ([(_DPDAP02PayloadEncoder *)self encodeReportMetadataWithError:a3],
        [(_DPDAP02PayloadEncoder *)self reportMetadata],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [(_DPDAPPayloadEncoder *)self encodePublicShare];
    id v7 = [v5 length];
    v8 = [(_DPDAP02PayloadEncoder *)self reportMetadata];
    v9 = (char *)[v8 length];
    unint64_t v10 = [(_DPDAPPayloadEncoder *)self publicShare];
    CFStringRef v11 = &v9[(void)v7 + 4 + (unint64_t)[v10 length]];

    id v12 = [objc_alloc((Class)_DPBigEndianDataEncoder) initWithCapacity:v11];
    [v12 appendData:v5];
    v13 = [(_DPDAP02PayloadEncoder *)self reportMetadata];
    [v12 appendData:v13];

    unint64_t v14 = [(_DPDAPPayloadEncoder *)self publicShare];
    objc_msgSend(v12, "writeUInt32:", objc_msgSend(v14, "length"));

    id v15 = [(_DPDAPPayloadEncoder *)self publicShare];
    [v12 appendData:v15];

    id v16 = [v12 buffer];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)encodedPlaintextInputShareForServerRole:(unsigned __int8)a3 error:(id *)a4
{
  int v4 = a3;
  v5 = [(_DPDAPPayloadEncoder *)self donation];
  v6 = v5;
  if (v4 == 2) {
    [v5 share1];
  }
  else {
  id v7 = [v5 share2];
  }

  return v7;
}

- (BOOL)encodeExtensionsWithError:(id *)a3
{
  v5 = [(_DPDAP02PayloadEncoder *)self extensions];

  if (v5) {
    return 0;
  }
  id v7 = [(_DPDAPPayloadEncoder *)self encodedTaskProvExtensionDataWithError:a3];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 length];
    BOOL v6 = (unint64_t)v9 < 0x10000;
    if ((unint64_t)v9 >= 0x10000)
    {
      id v10 = +[_DPDediscoError errorWithCode:800 description:@"TaskProv extension data length exceeds 64KB."];
      [v10 logAndStoreInError:a3];
    }
    else
    {
      id v10 = objc_msgSend(objc_alloc((Class)_DPBigEndianDataEncoder), "initWithCapacity:", (char *)objc_msgSend(v8, "length") + 4);
      [v10 writeUInt16:65280];
      objc_msgSend(v10, "writeUInt16:", (unsigned __int16)objc_msgSend(v8, "length"));
      [v10 appendData:v8];
      CFStringRef v11 = [v10 buffer];
      [(_DPDAP02PayloadEncoder *)self setExtensions:v11];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)encodeReportMetadataWithError:(id *)a3
{
  v5 = [(_DPDAP02PayloadEncoder *)self reportMetadata];

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    [(_DPDAPPayloadEncoder *)self encodeReportID];
    [(_DPDAP02PayloadEncoder *)self encodeExtensionsWithError:a3];
    BOOL v6 = [(_DPDAP02PayloadEncoder *)self extensions];

    if (v6)
    {
      BOOL v6 = [(_DPDAP02PayloadEncoder *)self extensions];
      id v7 = [v6 length];

      LOBYTE(v6) = (unint64_t)v7 < 0x10000;
      if ((unint64_t)v7 >= 0x10000)
      {
        id v12 = +[_DPDediscoError errorWithCode:800 description:@"Extension length exceeds 64KB."];
        [v12 logAndStoreInError:a3];
      }
      else
      {
        v8 = [(_DPDAPPayloadEncoder *)self reportID];
        id v9 = [v8 length];
        id v10 = [(_DPDAP02PayloadEncoder *)self extensions];
        CFStringRef v11 = (char *)[v10 length] + (void)v9 + 10;

        id v12 = [objc_alloc((Class)_DPBigEndianDataEncoder) initWithCapacity:v11];
        v13 = [(_DPDAPPayloadEncoder *)self reportID];
        [v12 appendData:v13];

        objc_msgSend(v12, "writeUInt64:", -[_DPDAPPayloadEncoder time](self, "time"));
        unint64_t v14 = [(_DPDAP02PayloadEncoder *)self extensions];
        objc_msgSend(v12, "writeUInt16:", (unsigned __int16)objc_msgSend(v14, "length"));

        id v15 = [(_DPDAP02PayloadEncoder *)self extensions];
        [v12 appendData:v15];

        id v16 = [v12 buffer];
        [(_DPDAP02PayloadEncoder *)self setReportMetadata:v16];
      }
    }
  }
  return (char)v6;
}

- (BOOL)encodeHPKECipherTextWithError:(id *)a3
{
  v5 = [(_DPDAP02PayloadEncoder *)self hpkeCipherText];

  if (v5) {
    return 0;
  }
  [(_DPDAPPayloadEncoder *)self encryptLeaderSharesWithError:a3];
  BOOL v6 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
  id v7 = [v6 count];

  if (v7 != (id)2) {
    return 0;
  }
  [(_DPDAPPayloadEncoder *)self encryptHelperSharesWithError:a3];
  v8 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
  id v9 = [v8 count];

  if (v9 != (id)2) {
    return 0;
  }
  char v10 = 1;
  CFStringRef v11 = @"%@ encrypted key length exceeds 64KB.";
  while (1)
  {
    char v12 = v10;
    if (v10) {
      [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
    }
    else {
    id v13 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
    }
    unint64_t v14 = [v13 objectAtIndexedSubscript:0];
    unint64_t v15 = (unint64_t)[v14 length];

    if (v15 >> 16) {
      break;
    }
    id v16 = [v13 objectAtIndexedSubscript:1];
    unint64_t v17 = (unint64_t)[v16 length];

    if (HIDWORD(v17))
    {
      CFStringRef v11 = @"%@ encrypted payload length exceeds 4GB.";
      break;
    }

    char v10 = 0;
    if ((v12 & 1) == 0)
    {
      v54 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
      v53 = [v54 objectAtIndexedSubscript:0];
      id v52 = [v53 length];
      v18 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
      BOOL v19 = 1;
      id v20 = [v18 objectAtIndexedSubscript:1];
      v21 = (char *)[v20 length];
      v22 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
      v23 = [v22 objectAtIndexedSubscript:0];
      id v24 = [v23 length];
      v25 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
      v26 = [v25 objectAtIndexedSubscript:1];
      v27 = &v21[(void)v52 + 14 + (unint64_t)[v26 length] + (void)v24];

      id v13 = [objc_alloc((Class)_DPBigEndianDataEncoder) initWithCapacity:v27];
      v28 = [(_DPDAPPayloadEncoder *)self keys];
      id v29 = [v28 leaderHPKEConfigID];

      [v13 writeUChar:v29];
      v30 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
      v31 = [v30 objectAtIndexedSubscript:0];
      objc_msgSend(v13, "writeUInt16:", (unsigned __int16)objc_msgSend(v31, "length"));

      v32 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
      v33 = [v32 objectAtIndexedSubscript:0];
      [v13 appendData:v33];

      v34 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
      v35 = [v34 objectAtIndexedSubscript:1];
      objc_msgSend(v13, "writeUInt32:", objc_msgSend(v35, "length"));

      v36 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];
      v37 = [v36 objectAtIndexedSubscript:1];
      [v13 appendData:v37];

      v38 = [(_DPDAPPayloadEncoder *)self keys];
      id v39 = [v38 helperHPKEConfigID];

      [v13 writeUChar:v39];
      v40 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
      v41 = [v40 objectAtIndexedSubscript:0];
      objc_msgSend(v13, "writeUInt16:", (unsigned __int16)objc_msgSend(v41, "length"));

      v42 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
      v43 = [v42 objectAtIndexedSubscript:0];
      [v13 appendData:v43];

      v44 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
      v45 = [v44 objectAtIndexedSubscript:1];
      objc_msgSend(v13, "writeUInt32:", objc_msgSend(v45, "length"));

      v46 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];
      v47 = [v46 objectAtIndexedSubscript:1];
      [v13 appendData:v47];

      v48 = [v13 buffer];
      [(_DPDAP02PayloadEncoder *)self setHpkeCipherText:v48];
      goto LABEL_18;
    }
  }
  CFStringRef v50 = @"Helper";
  if (v12) {
    CFStringRef v50 = @"Leader";
  }
  v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v50);
  v51 = +[_DPDediscoError errorWithCode:800 description:v48];
  [v51 logAndStoreInError:a3];

  BOOL v19 = 0;
LABEL_18:

  return v19;
}

- (NSData)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSData)reportMetadata
{
  return self->_reportMetadata;
}

- (void)setReportMetadata:(id)a3
{
}

- (NSData)hpkeCipherText
{
  return self->_hpkeCipherText;
}

- (void)setHpkeCipherText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpkeCipherText, 0);
  objc_storeStrong((id *)&self->_reportMetadata, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end